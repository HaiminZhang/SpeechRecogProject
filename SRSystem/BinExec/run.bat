



echo off
cls

goto explain

featurtra module ģ��Ϊ������ȡģ�� 
�ֱ���ȡubm����(��trainworldģ��ʹ��)
��ȡtarget����(��traintargetģ��ʹ��)
��ȡtest����(��computetestģ��ʹ��)

trainworld module ģ��Ϊѵ��worldģ��ģ��
ͨ��һ��trainworld.xml �����ļ���һ��wld_mfccFile.lst�ļ�(mfcc�����б��ļ�)
ѵ��worldģ������һ��wld_256.xmlģ���ļ�

traintarget module ģ��Ϊѵ��targetģ��ģ��
ͨ��һ��traintarget.xml�����ļ��;���trainworldģ��õ���wld_256.xmlģ���ļ��Լ�
target��mfcc�����ļ�ȥ����Ӧ���ɸ���target��worldģ���ϵ�����Ӧģ���ļ�

computetest moduleģ��Ϊ���Դ��ģ��
ͨ��target�б�(����target.xml)ģ���Լ�Ҫ���Ե������ļ��Ը������ļ������ڸ���targetģ����
��֣��õ�һ������ļ�compare.res ���ļ������ݷ�ӳ�˴�������
���Ǹ�ģ���Ϸ�����ͼ��ж�Ϊ�������������Ǹ�ģ�͵� Ҳ���Ǹ��˵ġ�

:explain



 echo --------featuextra module begin--------
goto note
 SRSystem_Tools.exe --scps_ubm_gen .\data\ubm 
 SRSystem_Tools.exe --hcopy_ubm_bat_gen .\scps\ubm
 call .\temp\HCopy_ubm.bat
 SRSystem_Tools.exe --wld_list_gen .\features\ubm	
  
 SRSystem_Tools.exe --scps_targets_gen .\data\targets		
 SRSystem_Tools.exe --hcopy_targets_bat_gen .\scps\targets
 call .\temp\HCopy_targets.bat
 SRSystem_Tools.exe --scps_train_gen .\features\targets .\data\targets
 SRSystem_Tools.exe --label_gen .\scps\targets
 SRSystem_Tools.exe --targets_list_gen .\scps\targets	 
 SRSystem_Tools.exe --scps_test_gen .\data\test


 SRSystem_Tools.exe --hcopy_test_bat_gen .\scps\test 	
 call .\temp\HCopy_test.bat	
 SRSystem_Tools.exe --target_ndx_gen .\scps\targets .\features\test 	
 						
 SRSystem_Tools.exe --trainworld_bat_gen trainworld.xml									
 SRSystem_Tools.exe --traintarget_bat_gen traintarget.xml	  
 SRSystem_Tools.exe --computetest_bat_gen computetest.xml
:note	

 echo --------featuextra module finish--------




 echo --------trainworld module begin--------
rem rem call trainworld.bat																					
rem trainworld.exe --config trainworld.xml												
 echo --------trainworld module finish--------
 
 
 
 
 
 echo --------traintarge module begin--------
rem call .\temp\traintarget.bat
rem rem modelAdaption.exe --config traintarget.xml --defaultLabel target1 --targetIdList scps\train\target1.txt
 echo --------traintarge module finish--------





 echo --------computetest module begin--------
call .\temp\computetest.bat
 echo --------computetest module finish--------


pause