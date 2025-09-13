setfpscap(5)

local SERVER_LIST = {"17f1d508-db5f-4580-b7ac-df7f84375306","bc183107-e9d2-4cb2-876c-936ffa4f54f4","0f794161-06eb-48e7-aeec-8b9b20ed7a44","eee03621-bc97-4b6c-ae99-4c90caf9a8d0","84ed8dcb-cdcb-44b8-921a-b284163b8574","bfb6c641-b5cd-480d-8e7e-49c948a838bb","4819e4c7-b948-4bdf-93cd-738406e39c64","0a208be2-7096-47ec-9bd2-dedcdb8920fd","68998319-5dd9-4057-9bdc-2841fbe52f68","adbd64a8-9e9f-4321-b5a8-787685a78613","a4957687-f1a8-46e1-a795-a8819338558e","91aac232-734a-4168-bfb5-04562f4add90","6ca51f13-86f4-4d15-abb2-304abd15bad6","98669914-fa13-4f52-a71b-41dea54f122a","cf324e21-e517-45ed-8477-2c8e2e61a5f4","4137172b-cb99-4955-9154-792d37848188","5c2cb48f-9429-4ed4-bae9-b9fda8519062","75b30915-4b31-40f1-a0dc-5151bbde7c18","b9e35e8c-6318-4855-b16f-28c94aaf8aa0","11ec8f8b-f5b9-48fe-873f-9570ad477603","0a7c5bf4-b7dc-4519-8dd8-453b011f03c1","de7fca25-0fbb-4e2d-ab86-dd60e0562175","db561683-0620-48b4-93b5-b321d69228d5","4a90779e-b1ea-4493-a325-d0ae7423b363","013f1697-c9e9-41d1-8aea-8cf31207854e","28a60f37-1346-46a9-b431-30627e4a5002","4978a5b4-37e2-45f8-85fb-62f13846769f","6cacbbf2-81ec-4fcf-b08e-a201ed3ab55e","f9686f98-ea5c-452f-b5b3-fda71b182041","dad1b7f2-ce83-4f6a-8a96-f5716fc6907a","7b454829-d5be-4e32-9fee-ae366c2f36f1","981df3d7-366a-4352-9557-ce18738ad6b4","ac51c053-1fb0-4b4e-a97c-c469270090b7","938570fe-4f50-49fa-93cb-3cfe73c54729","ffc6dd8b-16be-4fc4-8745-d5341739cda7","137a2ce2-08e4-472a-9a25-50220941423e","ac73cb64-95ca-4593-b2ef-5bc12cf23cb0","9909bdc8-905f-4f62-9911-2d321600f764","2db43954-51f4-493d-b26c-37b0f3365f65","e1741396-54a9-4f52-9bea-aa616b462859","6a3ea64d-3b74-4e88-8caa-b7bc574e4f5f","1b597fa4-b4bf-4080-828a-722ee469443b","ea0b4172-c311-4146-a955-5ee2faaf1c80","c1d141a6-0361-4b38-952f-243d2ed841a5","43db83ad-644f-4ce1-9389-f8b449a6e546","9e800a1e-583f-4ffe-9bf3-9ae09174db4a","c470fa2d-6e76-467c-a305-290a9dcacaa3","b43daaf6-63d3-462c-814d-bf9554d98564","70c6337c-236f-43b1-b5e2-0c92bc047450","e4c53ce8-9e15-4ecf-8ae3-af10f5895f85","8d9004f3-e7f3-4915-a393-357a24f961b2","d29a07ef-000a-4ff1-93d3-85a5a29e37be","290ecc32-c387-4e67-b38c-a48762115103","7a7a880d-110a-4d06-a35f-d4a082453480","d0970723-7ee8-4c15-9189-38eb77644e17","bea8d1cb-852d-4163-bdf3-bea3017404f7","aa3dfa4e-1e21-4c00-9a9c-8df862ee82b3","4b3f9328-9c23-4845-828a-1f136e2e7d19","4e0a5585-cd04-46f4-8efb-e1b0609c02a4","3c7484b0-90da-4250-be3f-7537153a7e52","bcf13f0e-7360-4400-b68b-58991d773723","5664d401-a96e-4940-853a-4cb09b962660","77c7e419-fe79-46cf-b965-e39cdb37e530","7e83f6f5-249a-4389-9722-dea4fb228bcf","c314f6a4-f5e0-47db-b849-37c2f2f0c17e","9c1db402-b883-4cf7-b26e-c8d84d8a508a","32dbb0ce-e44a-4fa6-9107-53f41b46b89b","f9625816-cb0c-497b-bb22-57a717ef20c6","fb870f62-3200-4e05-a4a8-eb313f628e9a","743f7815-af5c-49a4-a7ff-b1356600489a","0fbb1f65-e490-4b91-9d7f-a4a62c2cf4b5","cf056fce-3fbe-42a7-a913-200b1e51b556","c57fd588-bb3f-4bb1-a6cf-489c62000792","44efd8f4-a059-4a0c-9342-1b186ec7d549","b8ad9824-6601-4aba-b557-698197ecb316","55c6892b-6b21-4759-b398-e27550cac2e0","92526357-26a3-4501-934f-be7fbcf0b3d8","acbd4db7-704b-4d02-b64d-88bea13c0373","9f31f290-bd48-48c2-b25f-88061c691790","d217437a-7fbc-44cf-8a03-0ad936de543a","eddd6175-6a0c-443d-ba90-94a86d73f505","64fe8ae7-ae46-471c-bbf9-bf3a479c0be4","7d9d1208-7536-47b1-9520-86fd4876e7c7","9599723a-491a-4211-aaf2-f399ca2207a7","76602b3a-0314-49f0-992f-8f3a9679579c","5b4f7f16-2c66-4b4a-8ae2-91f3ef4c7153","d960492a-58ba-4faf-a8b2-066cce0e0ed2","d9533f9c-9433-4dad-a81a-6b594fd91758","707868dd-ca35-4ff6-be1a-acdbb85d37e2","73d8c969-7973-4860-b857-da0cea1d2105","74634166-e75c-4b19-9cc5-64dc05d5c64c","2f033cf4-fb6e-4d79-846d-e80780dcf60e","f1453111-c592-437a-89ee-cfc103a529b1","9a602227-b705-4f4e-a537-27aeccb806db","3966f5d6-1d4f-4f88-a025-98024cf0b7af","e0b57925-a5c9-4add-8826-87226f0fd4c0","1394ec0e-96f3-4065-9406-a5e090e6e595","0aa1f342-8f1b-4e8b-8701-f3e5b584df3d","d32f11de-8936-46f1-997e-482c300d9d3c","f4a9aee1-6cd3-48dd-907d-91225b2455d5","8baff5e7-33a9-4025-9210-19311b6fb9f4","e2584f41-d2ea-4831-97ea-9f407760560c","b7efb7ec-988a-4fcc-ad42-0aec4235c48d","b45a5334-f365-4533-a9d7-af0048573b0f","c7045c9d-81ac-42d3-8457-a838aefe1b81","182e5f07-ead6-4031-ab7a-e3ce1fa2cca4","1bb42ae0-5193-4507-b298-ce024746d89e","b46f7b06-ef29-4cb4-9060-a82a9254679a","4ac7fac6-9286-4d48-b312-11e340892280","d5795652-10b0-4b64-b67a-5e3b4b2a8f71","c0f12ddb-ef83-44ef-ab4e-c10be7d73af5","1b63b4c3-0aeb-45c1-a3c7-9bab6d7b728b","889df4c1-4b14-4080-8170-796fc4406071","f7cd7333-cbf7-4b9c-afaa-278c476e7805","4321ec3e-1fc0-42fb-b349-f69966663323","0a01177f-220b-42a2-8187-bcee706afdd2","997bfeff-fc1f-4bfd-9762-c5226d998bda","cd117e2f-0768-479f-b0d7-04631e721e19","02611f0a-41ee-4b40-83ed-12c5308d934c","cef764ae-780d-41ab-bc76-38b2b4baac4b","75ee1e91-0605-411a-a11c-c2a7186864f9","0aaa5b96-e403-49bc-884f-5acad953c82b","0861c04e-fb9d-4191-9466-d915bac4b6ba","d2506cab-7189-4017-b7ba-a1dccb85ac47","1c4d3f3d-f9b1-45ed-8e65-8152046bd8d1","f2aa0755-2a5f-4839-9689-b8e7f23c5731","087da9d8-9f50-4f7c-9d0a-df37950da51b","a1e9a720-388d-4ada-8c68-6f948991fc68","4e1f4b51-eaf4-4e59-8144-e9c4f51610ea","dad103c3-3820-4984-b67f-377fcb93a3f2","352aa996-25a4-4561-b036-9d45eb1a2cdb","5fc8a04a-a1c2-4551-88fd-60f633fb4637","cc4bead3-26dd-4ad7-bbe2-830e71ed2835","0d6a798f-7a98-4a77-9b46-2855b58e6986","fb5912e2-c904-45b5-b0c5-5a0e430f641a","d9d983fd-cc28-4df4-8bff-5d7515dfd870","9edc3d73-b168-4b35-b74d-fd1778bdf1a8","7b991d3c-4dc1-4c76-b226-50331145b3fc","73a3f4aa-5aa0-4285-bb35-4dc7452e038f","3905dd22-e5fc-4ebf-861a-16d8f05057e2","5aa42227-ed03-42f5-bc6f-15f84ec9c3c5","8a1e2f6c-b3de-4a01-87d5-d44a6e18913c","240f7119-9ba2-448a-a681-e246cd142d82","c57ba08c-6a0d-4e9d-b149-2a0008d193ab","148a5337-f320-4de1-9ec7-0c75e259545e","1b29c9d8-820c-4976-9ca6-0e0b75067de6","0ac80188-023d-4fa0-a908-ca90516294ad","291a2300-50f4-417f-bc63-947acb1c47e9","7ce42802-01a2-4fa7-a651-709d146a10b5","701f344f-d047-44c9-a490-78581b2d87f8","d6f98599-2065-4ece-a5c8-0c58a3457171","a14c009b-d389-4ded-9f67-32a1eeef1023","cf9a0140-ea07-47d8-8615-22ae33d25a0e","74b7a7d2-868c-4a24-b84b-fe0e8bb1d1b1","6f1c1a77-f527-4f93-944a-5a55e2c1c284","75249834-6c37-447d-ad0b-288d641f3885","444867d8-ddb7-4360-a158-e4d04a64bee6","b6ef80f3-b5cc-4b62-95eb-228f9b863899","0833f2c1-7788-4f79-a852-6d520e29c214","7ec57491-9bd6-427b-8da6-12bba8b9d6ac","b58e6960-ad68-41ee-a11f-23f0ac2b0901","ce27a9a9-731e-4feb-8885-9804afcead94","efe6fa19-d9ac-4d98-a0b3-2ce8b9ab1633","eed39db3-3074-4c8b-b950-cb3f059b5719","48220dc6-5652-479d-b0e6-72deb53da9f9","bebec79e-7e1b-4237-a3f7-0f9809ddd81b","6bb5b5f1-cf7c-4348-adb5-f072de3d0265","51d78676-264a-4e72-9835-e078ade69ee6","a5c13472-8f80-4cca-94cf-edf0305555c3","e4e072de-da11-4500-987d-280e5f18f74c","2b924c05-25e5-4c8d-8490-b0ea88c43626","638c048a-8c7f-4628-857a-2df35fe8855f","29f47638-5208-42eb-ab6d-2292b2bd749b","c7c9ac1c-aefa-4c53-b107-91b666a25ada","ab703d48-5d48-4582-9e5b-485ff3d2db32","bb2349da-88a2-49c5-990c-1153aab5a3f4","63d31462-eac7-474b-b243-b3468a2e5ef5","2dab1072-1574-482b-8ed1-eb96b9ddf835","2172fd28-fa71-4ede-82c6-765d7eb3907a","9194c57f-4ce4-4a22-9208-988353bc4211","03575389-73d6-4252-8482-750fe5ac3aec","30be92c3-fd58-4569-9cc9-3f291c8ef600","0386a232-61fd-4dbf-9f93-98628e56a033","7b0f0410-167f-4bc7-85df-dfdbffa227b3","6e534ccd-9029-4ea2-82fe-65e5f3d2836c","bf607e4c-f5a1-4e6f-ae6f-29dcc21a89a8","d5431b7a-e680-4261-9c79-2e51c13bbbd8","eba70307-1fb8-421d-8c96-bcae2d936a2e","1c5017bb-e4c1-49cd-8a6e-f0123e3a66ca","5ad36ff6-2ba7-43fc-86df-e9bb02840f88","a6679fee-58df-4d9e-8448-b70b0db38033","1c12314b-244e-44d1-a8b4-5be0d5ca64c6","21de702f-e183-44fe-8c6a-f1126ebc583f","7fce9592-1a0a-4858-9132-0f589423911e","3a0a855c-aa6f-4638-8b1a-b46335e46d2a","70b5ec1e-2a11-4648-a901-89d90853893e","6e1a3489-c9a2-464d-8dc1-136c3018de17","341fac97-3704-4e8e-b244-a4c0447e9cac","3b09c0b8-f5a0-4fbb-8322-2c2231da6a7c","82476bae-0c7f-4d52-b7eb-4be40d13a1c1","27eedde2-a439-4758-9c54-f4887bd2867b","b5162bd5-ca09-4754-81ad-a34297f1fbc1","626ccf3d-cbe8-472b-92b6-577d7a71b298","97e63f89-126c-463f-9f33-c34c875a6a4b","44d603b1-3294-4039-ba08-490dd99ec2bd","151f63a9-088c-4430-868d-84fe3f7f58d3","ae5f1b04-c05f-41f5-abf1-f996b0c0627f","1656be9f-f5ee-4fa9-a466-38f70a8b6d72","acd14e1d-9944-460e-827c-8c18f8e219e8","f16e7b17-2047-4adc-874a-91996fa3fa2c","50f7ffcc-baa4-4fe1-a06f-0e2f899b0b30","9423399f-af48-48e1-b4f0-b2caa2ece1bb","668414e7-cc8e-4b3d-aae7-5b967afd3451","2b603f28-ac54-48b1-a8d6-a8fe2697cae9","ea492a89-577b-44b8-9cbd-7f314188274a","cdc10330-c73c-4371-94bf-54fe92a6cb04","433f157c-165d-403a-90e9-fb41da6a1935","698402fe-e860-428f-a618-23538e778e56","b3aa58ba-9908-41e5-94b9-b373a6c9d894","0a513d7f-62fe-4d07-a659-9a940a356487","eac55c81-ed38-4515-8a22-2960ada06ec0","98dc403e-6df8-4c5e-8f27-31a99bb4c79d","b0c8f841-58d8-4766-ab0f-09585aa3392a","16b8e0cb-97ee-46bb-a2e0-d1323e1fea81","1fd7f2c7-0467-4759-81ef-98d0d35233df","68970cd9-f9fb-478e-a015-c64674f61c72","ba83733f-3ec3-4a92-ae76-0b81a939d36d","40725a4f-4d45-4c3e-9272-28658e27d375","946bd763-43f2-46d2-aa79-542f71ffe658","8dbb169f-1203-4494-8e3b-cd182604c163","540cb714-9972-4570-98a0-b2f4951c7f8a","3c2c3675-fd04-4d5d-8f8b-3c5175737a6e","ca64841d-104c-4b21-84c9-189af0527016","8ca4a180-9520-4eb6-9f97-efbb89cf3b71","d0d49e59-2180-4e60-b69e-a9aabf15cb2f","34d8a75a-a699-45e0-918e-20479973e937","ada0ae27-5076-46f4-8d89-8fb947f67c58","76cad587-f507-48f9-b1f2-a10a19ffd6f8","afffeb99-e9c4-4393-b26a-1ecd9d93c4cb","42ee30b9-780b-48b8-b016-4903f0400ccb","aab8e63a-dd4c-442b-938d-f2878fec0127","90af65a4-8192-4539-856f-1c1d240f765c","67a55789-74ce-4644-af10-34baea5b2ad5","61efdd8f-6dab-4bc6-865e-dd6d96e8108f","40f5d932-c411-4ead-9e01-2773db62b9b8","a97b3414-458b-4438-9309-498763b78881","fbcc3439-0d2b-4aa4-845d-406236b3f3d5","da35d118-dbfd-4cf1-bd4c-239b513cbf68","b962a53e-dbd4-4194-82cf-fe0285dea89a","df62c0fe-1962-4df0-9850-55625475e2f3","2ab06ed6-46ce-42ff-b7bf-d20e7ed9809b","233bbf1e-9388-4c81-9cbe-47ffdb886242","1e82b28a-94d3-4ed6-9dab-86c10e6772be","d6250a25-8e27-457f-8829-a23ed79cc93a","63c6c920-fd69-4f81-86eb-7a7075f09899","2fca1c36-f40c-4ce2-9ee2-efbfbd9fe39d","9d42e662-66e3-405b-9d06-20a1d1f99794","d01b7ebe-9168-4f7e-8bb8-bb6a62862596","bf60f00d-7d6b-47a3-87a4-1c6a6212f0d9","994abb4b-735b-4b85-96e2-2032e626342d","b52270d9-47e2-4656-b559-bf6cc8561113","246e81d3-cbcc-4bfc-820e-d4447538ae98","d2949593-1e2a-43ca-9eef-f8a7e5dda3af","913acf2f-f6d5-480f-851f-ff1a18ef06c2","35411915-bf1b-4ed9-9ba8-625c41fd9006","238853ea-a1c9-4246-8ab6-59cc4ee90676","bcfcf4f6-0830-421c-b88e-eb1db0093c3f","b007b1c1-e7ae-4797-81e3-963cf5ff76fe","f7bfa0f0-1628-417b-acbd-5f9cae7a063a","02c2133f-c16b-4488-b137-c3902b925b6a","359f0ee5-2d5e-4d3b-8b24-be59ebcaa8d2","cded3392-ee73-43ce-8b9b-23761e6b137d","e0cdda1a-d9fb-4d0c-90ee-63e010d0faf2","c406ba18-91b3-4e4d-be09-f70a0ec802a8","4b655988-1be1-4131-91d1-909e1eaba1b1","4ea84ea9-a784-42e5-8c74-8a764e7ea85a","3f5b8cdb-f453-46b6-b1d3-7e24e0f7d306","a480ac0c-7261-4378-b26d-64a5ff430505","d735376b-eac1-459e-9625-328b87dda0a1","e1eafc89-27cb-465a-87e4-db51f329f969","baabe4ce-e7fb-47e7-930b-20b630442df1","8fc698c8-7541-492a-8c5a-5a2c71e3ed17","c40fd376-2ed5-4472-a459-a254e930788c","75a79542-5591-4d3c-ab35-dba7f52597b0","53be4772-c1bb-4966-b82a-e1ed6e5ca13e","99600cc7-0364-452c-a24b-7c4419248371","41fceb40-6650-4ce2-bb53-ec2b607b24fb","1a1b807a-936a-4d7c-86c5-c1c4e151471a","f14e2f27-4950-4a74-90d2-2fd9ceda78c0","29f18b12-740e-4543-b57d-4dce33c6d630","3b75dadf-1c8a-4a2b-813a-f6c72688e941","d3619c93-a118-4b71-a651-e33511181c48","89194e86-3c9c-47c9-b9a8-87b856869a7d","b3e44d16-3ec0-4142-a2f3-f2441c7a7852","9f11a65e-29d6-4a98-b7fb-27b23a256b93","efc898e3-cbd7-4e53-b46b-375fd4e2ac01","492219e1-2cb3-43f8-acc7-1170f6bbf9e9","81889d41-a8f1-465f-acc3-c5e02a8c2c54","d1578e70-8145-4c29-9694-a669e871fac4","ebe6c84e-cf7b-4fcf-a63a-433538c50442","b6f8c6cc-fae5-4f0c-9d3e-0fafec170294","feccaaf0-a1c4-49f5-9cbc-4c753ce31474","2e3c94d1-06a9-4837-8555-92e2d99cb84d","d11f469f-2223-4fbb-9d4d-0dc01188df68","8b94aaa1-31a2-4652-b1b1-bbff824e9d18","c0aff2e0-f4c2-463e-851c-ed5e7a20aef0","90e56025-61af-45ac-a4f1-603a1ecf7fbc","ae867849-162f-417e-baad-1b339f995a7c","fd72e079-0c00-490c-95e6-0c4ce47336ce","6311bb94-deac-497b-933e-6d817268a67e","08b62bb6-9387-42b2-adba-e4189eb90007","1c77240d-40d3-44bc-b161-ade3b01e3535","4ac787e9-fc89-4856-9934-71b9731ae3fc","bc338028-fec1-45f8-95e8-cd2e6f607382","bcffa656-53e2-4a37-9427-7cd8a385ded7","38a97037-7c48-48fc-94b9-cf032338ff5a","a2e95e31-6559-42f7-8070-16fcbc30c402","eb767795-55e9-4192-92ff-a0d542bd9422","cc889844-a5f3-4e72-82a6-1ec324d97617","db50a3de-5c68-4bed-9478-8e92c023c5c2","98f42552-583f-4427-ab36-2352c7e748c9","2233add9-8e1f-42ba-b210-3efce60fbf1d","df6874d1-b57b-4c93-89c9-4c766218cd2b","763d1e56-2968-492a-b767-b64c294c4a48","adb0a091-fb76-4a16-84a5-611ca3db3eae","628fa197-08d7-4645-bfbd-75c3ea9bd5f1","16f71439-0ec5-46c7-87a7-b0c19eb42f51","acf92f2e-51cf-4612-b475-7a28e7e7064a","2fc39a4e-9d4b-47a7-b10d-2ddc150f15c5","dddd10d0-f65d-4969-a9a1-3d48c7a53641","1c19f140-c4a6-45a2-94f9-c7c4cc878a63","5be25496-36de-4732-912b-d5d287a78f61","79ec3dc7-1c9a-4ae7-9849-6d818daeb3d4","488c8051-ee3c-412e-be7e-cf40ab4dc67b","26229f90-c41d-4299-8222-dca1f00043f4","9a5ccca5-1263-4d78-89cb-c037cd969c6f","d6cbf09b-c53e-4d7f-a396-c22f7c70b180","6fc45f8f-3be9-45e0-8100-3f846d607a46","bd39c77f-d556-42a8-a3d8-d8b9898e568d","0751778b-1406-4d39-9efe-07072cc630ec","dbde9366-ed92-488e-a488-fe0e062ca67e","74193692-c6a9-4d6a-be0d-36d6e4283942","1236e5c2-58eb-42d2-b505-64166d79bca9","260cad72-46a3-47dd-a11c-580ecbd042f3","2caaabff-3917-48f4-9e27-ff05ce52edd1","35a54aee-2c2d-4d80-9782-f8268f0822ec","621967a0-6f71-41e2-a8d8-3f57b428c134","15814a69-ae78-414d-9a1f-2c2c3e61e6ce","82af34e0-0778-45bd-a2ef-a4138785cd43","5fc2ce9d-c06f-41e6-af2a-40b653656e29","db64618a-6a99-45eb-ae98-19d3bf368d09","4314fef8-63cf-459d-8a0c-723daa681012","9f890cf7-06af-45c1-be44-172154ac1ae4","79d57644-8b63-4e87-b5a1-4d5d0dea1d44","b7fa3220-876d-4bce-a02a-d271fdef1401","004105cc-387e-4982-8ede-61ea221acda1","fb2d5c15-3495-441d-8c1b-8d7b897e178a","1aea9b47-70a3-41dd-9d88-ef7987c321fc","2ef2bb39-5e78-4c2e-8dc0-982e39c2a5ed","b0a9ff55-dd14-4bd6-b3f1-250a2372a6c5","c64fe55f-f1c2-4d56-8848-3270bd86c890","7924b134-201e-4d8d-9732-5888cbc7f207","6f321086-5748-45fb-974c-ffe571ef9ace","dfc651f1-649d-471f-a3f7-476d29298c10","06516df6-7d52-4482-b77e-e5b63ed94f0f","13d0af18-e05e-4611-be9e-3d17c3a0cb40","aa37f06f-7262-432f-8c25-cb87520351b8","35747fbd-1631-4398-b4bb-38d49319a5f6","bb8d81c6-c8be-475e-aac3-7d720ac2174e","e09eb7a1-849c-462e-be9c-943f52bd90b0","3258e31b-05af-4d18-99e6-d1c89b772a92","2c04a554-f3fd-44cf-b1a5-8ceb26a2e1af","4f02b280-54eb-4109-922a-1093c81b3753","7466fd10-ec93-48d1-8fe3-f4fce46ef148","d7da2f90-e14b-490e-9f7c-ee8e27b94a41","19d8edce-9c48-4403-a70d-a41229ea3a66","538dcb3e-8f0d-4efe-90af-d7d29e4a8ad0","164ecaed-6719-4645-952b-330ab39a41e4","aeaf45db-7b56-447c-bb62-727ae9f0a0c2","14a289ba-a0c4-4d07-940a-41e5f605bfc4","09cb7ff5-fdd5-4b73-a705-941372b27ba7","d62441d8-a65e-4d5c-b7d4-24d3450b1088","5b864dae-00e0-4c6b-8520-794324059ae8","5f2bc9c0-09cc-4d68-bef9-b8ef3e6d5159","88b65525-ec87-4b89-897f-94382dbc6a67","60b19723-6298-439b-9744-deaaab35b058","0dd75e61-597e-4643-8825-0ea273b7d142","3c6df801-fb76-40d5-8aa5-0610e8c25e0d","a3d50a4f-c01c-4655-8f9f-1b9936186b18","4253f5ae-4e77-4ee7-b9c2-5540218e6ccc","711ecf9d-89d1-4f6e-9abc-f34f9a8c6573","4d24c8db-8d24-4436-9237-4f487e16e744","bf663bd7-ebf4-41ae-8322-9cc9066e6dae","95cff047-8421-43c1-bb6d-4aef54290206","1fad73b7-e5b0-48f6-8449-08379f778dc8","0f408103-99a8-45b5-96ac-e5dd4d512ba6","af4c4c6d-db18-443b-a54a-9585ab762733","d1b3aef7-0c9d-4e5f-8ee4-8db625d65cbc","7c20a9ca-0307-4efd-8fe0-8a4e0024d1c1","14565481-000c-45fd-91c0-d073ae0aa828","8ac563db-e64c-4321-ab75-211c6bc95060","c466fa6c-c09d-466f-b039-9013dd686538","9b6cf09c-9c58-4081-8749-11aa7ca7ffe3","3555967a-cbef-426c-a673-01b63668cabf","9e96e5d6-5f29-4b6d-8b06-90bda5cbc951","db100974-00bd-4322-8f6a-6f1dbe6071a6","7d994322-d556-44f5-8112-6e96decbdcff","39227f44-4d95-48f3-810f-08d3233b876d","1da26781-a382-41cc-ae86-cb149c5ac2d3","e2ee5612-e440-4ecd-af27-d0e60da87dad","343761ac-dce2-4f21-9ddb-1677905405a0","56bb3427-6cc7-4b96-8098-0d107e5a20ab","8c5027fe-3cea-4bbc-bcf7-5fd5c84459c9","ddb2ac55-b63e-4a5f-8a42-190f40b0ac2a","f745c0a6-f85e-4690-bf4b-39a9b0ad57ab","6a55acfb-1405-4622-b714-b3c9eff092ae","8453f06e-6bed-44a4-9827-194230d9a264","08c44dd9-5c8e-455f-86c8-edaf1a359565","e524c417-9d05-4110-aa75-8f22b8af09d8","d20c9fc8-ef07-422d-9324-de2986eb984f","26315477-f2b8-491f-9a50-7dab1357fd82","0e4e4747-8864-47a6-b6b2-39dfd78990b2","768a8389-ef0c-4d75-bfe7-b3ad7d6be5fd","b14f6f1a-043c-4747-9ca8-2347737d4b84","7f6d6681-e600-4456-8bcc-ca2e28858534","4d00e741-b89b-47a2-b9ef-0cc5e2ab29c9","2e8fc939-e445-4e47-a987-f756bc04512f","82c6026b-d5a7-46e8-9cb2-9dd1903bab76","f2a17c40-c692-4724-8271-2a661df3b8ea","8f214d3f-2a1a-4324-b59e-ce460df37630","a97cdff3-e453-4a04-a01e-b7fa6c06927f","86662ec0-095b-4536-a0fc-ec40b6e5b604","536c5a02-3832-4b75-b949-3e5728599589","68cd4008-d12a-4c04-872b-5e2e263541f6","846e192f-ff4f-437a-b51b-d76160617da3","70d64508-deff-4f02-920c-88f265c4b9d4","47d777a8-88a2-40ef-8062-214ad2564a74","a5545d99-d3da-4bb9-bcab-5ee00f514893","a54db200-7f7a-4060-ae46-a9ebca9599ab","1b3df355-2749-4f4e-83af-bde5cd7629a3","dfc29f29-1a0b-4a10-a607-3f9d1ede6b85","a103b092-f4ec-4dee-905d-363fe1a5c32c","9d834eec-2700-493e-9587-fc8c3a215afb","3b1e2ec6-2ea6-4019-a950-70fc2b6b42bd","4a13ef50-08f7-4b1f-8201-c163e9212ce2","ac568b27-3c71-4fcc-ac38-6867c8ab1d14","1e3aa7a8-f102-4ffd-a8f7-e5022c02dca5","6b36f792-8db6-4045-a5ee-ee646468e1f7","576d315e-8988-4491-8b31-72665f75adc5","2d762cda-9362-4056-af05-aa977a21d730","e9712c62-5d0d-4182-b5f9-4064d1e83151","4af9c0ab-6045-4541-bfe8-18d0883aaff0","c7eb1079-bc09-44d1-bbf6-d743e2fd039c","649882df-26ce-42e1-93e7-48346b289333","8ebc524f-119f-4454-90fe-7622cf6bcd1d","b208b77c-decf-4f54-9b7e-da551520f649","259ebc8d-aceb-4eef-910b-e60b1d6ac174","9289f343-0de7-46d1-bcf0-70d070377e47","eccc034e-cb3e-4332-a9e6-88d84832705f","c8f1c5b3-3497-4386-acba-59dc2ac7b561","43fd8b86-c31e-440b-b70e-0f65a68e78f4","f3eb51d7-7389-4b06-8d7b-34a1017543f1","fc5c0b87-6c77-4d11-8b1f-09868f182b03","0c685009-f035-4a30-a438-3c3dc8cae031","786dddc5-edae-4692-9f8b-449461a3e8c0","0769b3fc-85e9-463a-a3d9-2dd27283b052","b89e50f7-a6a3-44fa-abea-f8e0df8b8055","9f9d6775-eb62-422d-8ce9-01976e2e3c57","eb275abf-5f41-4705-9576-420903da044b","31afe086-06e9-4259-81e6-c2b116683ce9","2ae2af5b-79b9-41f9-b184-9450181c1cc2","9ac055f1-1be5-4851-aff2-6c668ccbc8ed","5bc38524-603f-410d-9b41-64d2aa652bcb","a0c63aad-99a2-46fe-991c-624805973538","4b7c0573-4187-467f-a880-4a9871b8a995","6a0f9c8a-e5b9-4bf1-bdf9-720f864a6ee3","d998a594-7b33-4b84-9b7a-df845c829a81","cebe46e0-fc37-4a26-b77b-099de8fcf2f2","2c41b7c8-0622-4ee4-8bc1-a731612b650b","859b70c5-0467-4973-b3b1-5908fe738cca","7fc5e4f0-3932-4ccc-8d66-193697e48f7a","ca3d4f56-f21a-4406-8a82-69f995e5f372","e985d1dc-c0ea-4215-a426-813de39a870d","e7a2c092-6f89-46e8-b4b7-7ffcc89bf1f0","ced4b047-1e32-46ef-9716-4374b8f75cd0","ff0835a4-270c-4b83-8c74-4e5cf30d8853","6685ba03-8c7b-4891-bd69-e7d8ee7135d1","a60faea7-7484-4b7b-8d29-9adaa1808d94","01419fc1-458c-4bce-90ec-38af8832c054","a19dae4b-d292-41dc-820c-da1da00e554e","6578c64b-d9b8-423d-b8ef-dc9d51752694","41c490f9-a318-47e5-87e0-7c35c69f230b","da09ed34-0444-4354-acba-524127522344","05599707-d172-4a59-a863-8e3611492c4b","de886fc6-d19b-40fc-9d78-77c8fa88b2ae","c29f222e-98c2-491d-a550-dc958b08e4f3","3db728cd-a0c3-49f6-8222-11672e267b9d","1264f3df-9f91-49db-9914-cc6f79f4c892","7bd909cf-36f5-4220-9b05-6fd8179ec3f3","db83cece-df91-4754-9656-777f451b54b1","c96df578-7cdc-46ca-b5c5-58a05e122207","d97bb1cb-76a6-424a-8964-f9074b65c7d9","cdc19436-aa33-4d0e-b460-0826b7ab748b","9c6717a4-9ad0-4326-8701-7af87e7a9702","528fb202-7c0d-44be-b3a2-b34be6efb762","39d21a38-a343-4007-bf3d-350953a87dbc","cbebcf5a-6070-4de9-9d44-e190eb0d83db","bbb66f21-7c3b-4779-91c1-54f308849a50","5891c447-77fe-4494-b2bd-e64e291b15a7","80b917e4-6d3e-40fb-84d4-cb6fff4ae0c6","71ccd011-efb3-4053-8c50-95a35f9df332","4db41a3a-6ea2-45ba-9750-e7e84fb5489e","fd084089-ee9e-4391-b4de-4d4cef176c4b","8e10a635-2da2-4f25-b0af-17a5f687403c","192ffed7-b3f9-4f27-b3cf-948511e1ec97","ef0c0a20-bf6f-473c-8971-01716d732c32","21c904c5-6a99-4c4f-8d87-00b4e2d5197a","7584dd74-48a9-4ee9-9f99-7bed29f5fe5a","62d9dd11-0a37-4830-987a-48a333676cf9","3ecc0ac4-1f2b-47e3-96d7-56cc8086397e","7e265eff-19bf-4fa2-9263-4bc8406fd1c9","5aa96e6a-b8c4-4b6e-b98a-3defc240029a","ef123a67-d8c8-4afb-b650-2fa2795cbf15","9942f6e3-abec-4299-8dcc-df88b50a6c2f","4a745794-3944-48a0-acd2-4405423a7f31","e3847610-885c-4d18-ae9d-6c051c9d9b4f","188a4f4a-54d6-4af7-9b35-92ce41d74926","c9064c62-9a4a-4528-8579-3c4579bb491d","7afbf544-7966-4ce1-af68-a4f02de100f9","e33ccd0d-1586-4bcf-91e3-49b52feb8196","0113fc23-81e2-43fd-9631-c7d1092030d1","7b99bfc3-266d-49df-899c-8dca82c98811","bfac9e81-c51e-4a29-b65c-49b6af632fe6","f858d869-4a6c-4650-af66-612eade48d19","d956de15-b882-437d-b919-ad3e6d2b7ca0","849712ba-995f-4d56-af0f-ff0b6637f796","39f0b1bc-7f4b-42c3-be98-0722197d587f","48b27e5b-185c-4281-bded-d43f243728da","6553c259-a3be-4782-830b-8c06716d32dc","0a44071c-391c-41a6-a2bc-1b29931ecd64","ea5ffd10-b569-47cf-8f7b-80b0d2247955","ecd5c1d0-cf71-45ec-8952-1463789ccf38","91bf09a6-fe42-4227-aab3-d79979e0a630","f8d9d935-6733-469b-bbd1-486762362c71","4656f61c-f5f1-4265-b5f1-82f2c3ef52b2","85e320e2-7f6a-42b9-b7ae-066a6c244ef3","102600d3-bbd9-42fd-9ad1-8357f27c5c40","44023a4f-99b4-48ac-acce-8d6bf35788ed","09fca598-866f-44c0-8c65-0c51a9f5d5bc","46105fa2-ffb8-4dd2-a8f7-3d08f6e5b6e8","7920a7fb-ad61-4f5b-918b-cbfbfde441c8","dc4a4c03-8cd0-41a2-8fa3-51092ef424d6","7ece0afd-fa61-46b3-9d61-4478957ce5e8","738c4e95-0b0d-49fa-88e2-a90c340b6a04","2f07db7a-16dc-4872-b427-f7b7b2fe12fb","bbb0316e-159f-4bfa-8375-763b0f3e2402","e4dc1a08-c18a-466f-94a9-5c406986f41a","62ac8180-8e68-4a5f-8b11-979f067cec00","d988c55e-c33f-4c02-8a03-210dd6e7071b","3dfe0f80-5938-4547-bd7f-f3b2bc150953","59a6f028-57a6-49f0-9e89-183215e098ae","3b7d05fa-b7f8-4747-a6c5-815d49016ed4","d55a5b64-6efe-4768-ab15-9e102a24e9c3","daa92d0a-8e7c-4922-81db-7a89cf4bfacc","1d5434bc-1f3b-4889-9beb-dad4d7285762","89266199-a0e0-42b7-b4cc-b862f28d009a","e08c4c72-5ed1-416d-b0b1-09fe46fb2cb9","cf792f77-862b-4a64-a376-32bf752d16bb","276ebfd7-ebe7-44f2-b5d9-7895ecaa15ab","825b28c5-3a47-4e5b-9e91-56caf1b787bd","4a13026a-8c9b-4712-8d21-48bd9b30a95b","221fa47c-32cf-4940-82b4-04b9212e9649","d553b23b-c38c-4300-860c-3f14b0b662e4","2955417d-4c88-476c-b78d-1b086c98aebe","7a14a46c-6086-4947-a5a0-d7fdcb5f9653","04fa9872-7f98-4bd9-a1f2-8d5d738f00a3","b8026d8b-4160-43b7-830d-392f97be297f","257d4655-f88c-41ad-9ffc-0375750fdce0","920eefe7-a957-4490-bac6-743f5c2d9d2d","c749b6c4-1104-46c0-b430-39800c981dc3","4e144578-b6ec-4b3a-9a2c-af37b164c0c4","818c0bbb-b863-49e1-88d4-b91564ec6dcc","956860d6-f5dc-446c-aade-753629bfa9e1","e0c6ec82-abc9-4060-815e-b84fd8856212","4bc9a5dd-3f41-48cc-b348-d55c8a121303","1c3c906a-2891-401c-958f-eeaefc2235f8","a9542a6e-bd8c-4da7-95ed-4782d47b4ae4","31c8fc66-c584-47c8-9c24-9b0c95d36bc7","c08f7ad4-1996-4ffc-8f5c-fe657d2e687a","e9091d7e-506d-42f1-92b0-7e2408d91829","e81f6403-1a4a-45b6-89f9-83091aaa9232","3e474a51-a496-4d5f-b04f-f8d9e15a4710","0b0e7438-530b-4d52-ad8a-11dfd6fe80d6","f28549ef-23d5-43ed-b828-076d92adacb1","3b22f640-2f1f-48dc-a03f-1780b84ef556","5123da71-c641-4860-a91f-be8cab093880","4c56912b-a3c8-4e8f-ae19-fc48c488b134","546d353c-6756-4c7c-9c7d-167a6aac9d77","5f4ab70c-790b-4cd5-b93c-5ef042e1d468","307131c1-74b7-433b-bedc-b57cc27aa0a9","e1b6e4c5-1ef2-42bb-9422-d5eef2482285","836f50e8-8cf4-4a35-885a-857bc0fbc33e","513e5974-6b55-4e58-8c8b-f5c98658f36e","7ca4ef90-d975-4b9e-a413-10ce32ed6ca2","bb89098d-88bd-46d1-8fdf-77d540581fc0","0de5e18e-5cf6-4d10-9703-3a7091d76564","39712afe-7cd1-44ef-b063-d151fefeae50","a5d5f225-afa6-4503-a49f-f30b41f381cb","9c2a65a4-d0ee-4648-b669-223acca86707","e0f596c7-a497-4c39-82fa-d2a03425a086","8f2f2c61-0bed-4a18-9b59-e2e5fbca58db","2702672f-38c9-4092-b9a1-2e432a0c74c2","5a8f97b0-aa4a-492a-8b40-607687c303ed","270032c0-f27d-416d-8d78-c8800ebc8314","1865bd08-cdc0-45e5-993e-d8e4be3e1c5f","8dd01cd8-3ae5-40be-8a57-8bbd6b63cb3a","b4e8c5a6-1b9a-4271-8853-907b25dfcfea","6f05a5e8-812b-47fe-bc36-a83cb226c22a","dcd5df81-77ab-4803-b23c-bb2274cb5d41","0ace4db4-3841-46ea-89c8-742bb24099d4","fc923329-6fa0-4276-943d-8b6846b0c5f1","68607530-02a7-4b0b-bea1-0fc4374aaa15","a310c6ec-e1ef-4c7f-8a5b-74aa839484b3","83803daa-4dad-498c-b090-c965ea3b442b","cbe6045c-a99a-4a29-b36a-dd8928be84d4","fa80e877-1a89-49e0-a5e9-063dec49fd80","6f3ea18b-6521-4797-9b8b-7be79b273460","735d7b2b-d57f-410e-98eb-0479250442bf","482cfca3-bd05-40dd-a586-aff0ed47b523","da5abe9a-c460-43f1-9487-e696607f6a7d","70008011-95ad-4c44-abe6-65923fc6b7b0","a41bde2e-610e-4f32-926d-f46442466833","e121a701-219e-4085-8648-c91c457a0c64","fc8b7bb4-ef40-4314-aee3-cd7005b1e313","0cd3244f-b7da-43cd-88c2-bb545d2c24f5","f3807b7f-ee66-4e84-ba8e-0ce381f2b005","39fdd2a3-9d47-4e69-b658-ce3ddd822686","c575ef45-7778-4c62-9d6a-b177c1ed88a0","a1e95186-3514-4de9-92c5-b5c502eb9c09","fdbe6bc2-2d62-4b90-b99d-cf7186efe524","a809cea3-a4a9-4007-b677-7f9bd08c0459","f8cc486e-d5df-4f39-9d21-8ff6a31208c7","a99413a0-11a0-423b-a653-58bf545f392e","61440a21-19a0-49f1-b42d-8db3de44e0b6","97ac2b92-421f-48a1-b6fb-d330a4e51842","d2dbea1f-67b9-4e5b-bb3a-46f085870f7a","91dc7b52-9f25-4f90-838c-168f4aec9a7e","6c4fa76a-bc49-4b89-bb93-4a12a5fb261f","d93e6836-f43d-467c-bbfb-1f7c7fdf9d40","c18e9565-e434-4d72-a7ef-5a5e8bf2b3e9","38537a53-5346-42b5-aaec-b9b0e52c5af3","8ce32849-b8a6-496d-8d6d-e4e36b6ea8d7","a55d6b86-023a-4a53-a6d1-856e77bfdb5c","f404c6c1-603b-4d53-bc64-7010e0fde235","5e7017e8-006d-45a1-b12b-82ac5ac615d7","9b6d0c1a-bd6e-4273-bc90-290a01259ab1","ad70e258-9c2f-46f7-99ca-197df7c97dd2","8590bc17-beb7-436d-82fc-1da11e670c78","abc8ae6d-1ea3-459b-9dc5-d091bde1b301","4946686a-fa32-42f9-a67f-40df5cb3aeb9","6633819a-45cb-4963-82e5-b43928936d54","ee076cfb-c7e7-42f7-9f18-85076db228ab","28f9905f-9f1b-4124-b49f-ec11ce0f1a1b","e1ae5cd9-e292-4d5d-827d-c5a1ad605a22","7604b352-2216-4d17-b8a7-2861de06b346","b20697a9-140c-4e42-8778-784513990cc7","616f3279-62a9-4627-a5e8-950e45b2ef68","5e2032d5-21f7-4044-993e-af085e345d7e","475921d7-1ba8-4f55-b84e-612f00653fb7","18a0d1a4-c5d2-4486-ae69-8d270e119b3b","a55a23d9-0a5e-471d-8be9-df77d36b852e","fd9f23e5-8dab-480d-9d8d-6b95c34c276e","08bdf516-3457-43fc-b206-5fbfab1776df","9b39d53c-bebe-4100-b31b-c7e73d70684c","a01d04d5-2e93-4a15-b64c-44e2f42537b7","72c1ebec-fd5e-444d-97bf-db377b301e94","cf20a28e-89b8-46a4-847e-c81a63af2641","7380ff3f-5e94-4352-aca7-dce34e72dd03","c9a9acb8-bbfc-4c42-993c-145dcd68d58b","1e6dea71-fdac-4184-8640-6cc872c7ead1"}
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer

-- Rift configuration
local RIFTS = {
    {Name = "lunar-egg", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz", MinLuck = 25},  
    {Name = "brainrot-egg", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V", MinLuck = nil}  
}

local HOP_COOLDOWN = 5
local IDLE_HOP_TIME = 5
local isHopping = false
local lastCheck = tick()

local currentServerRifts = {}

local function formatEggName(name)
    if not name then return "" end
    name = name:gsub("-", " ")
    return name:gsub("(%a)([%w]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

local function normalize(name)
    return (name or ""):lower():gsub("%W", "")
end

local function parseLuck(luckText)
    if not luckText then return 0 end
    return tonumber(luckText:match("%d+")) or 0
end

local function shouldSendRift(riftData, luckText)
    local luck = parseLuck(luckText)
    if riftData.MinLuck then
        return luck >= riftData.MinLuck
    else
        return true
    end
end

local function parseTimer(timerText)
    if not timerText or timerText == "" then return 0 end

    timerText = timerText:lower():gsub("%s+", "") -- remove spaces

    local m, s = timerText:match("^(%d+):(%d+)$")
    if m and s then
        m = tonumber(m)
        s = tonumber(s)
        if m <= 6 then
            return (m * 60) + s
        else
            return (m * 3600) + (s * 60)
        end
    end

    -- Format: XhYm or Xh or Ym
    local h = tonumber(timerText:match("(%d+)h")) or 0
    local min = tonumber(timerText:match("(%d+)m")) or 0
    local sec = tonumber(timerText:match("(%d+)s")) or 0
    if h > 0 or min > 0 or sec > 0 then
        return (h * 3600) + (min * 60) + sec
    end

    local fallback = tonumber(timerText)
    if fallback then return fallback end

    return 0
end

local function sendWebhook(url, payload)
    local body = HttpService:JSONEncode(payload)
    local success, err = pcall(function()
        if syn and syn.request then
            syn.request({Url = url, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body})
        elseif request then
            request({Url = url, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body})
        else
            error("Cannot send webhook: no supported HTTP request function found")
        end
    end)
    if not success then
        warn("Webhook failed:", err)
    end
end

local function getServerArray()
    if type(SERVER_LIST) ~= "table" then return {} end
    return SERVER_LIST
end

TeleportService.TeleportInitFailed:Connect(function(player, result, errMsg)
    warn("Teleport failed:", result, errMsg)
    isHopping = false
end)

local function hopServers()
    if isHopping then return end
    local servers = getServerArray()
    if not servers or #servers == 0 then
        warn("hopServers: no servers available")
        return
    end

    local currentJob = tostring(game.JobId or "")
    local chosenJob = nil

    for _ = 1, #servers do
        local candidate = tostring(servers[math.random(1, #servers)] or "")
        if candidate ~= "" and candidate ~= currentJob then
            chosenJob = candidate
            break
        end
    end

    if not chosenJob then
        warn("No new server found (only current one).")
        return
    end

    isHopping = true
    warn("Teleporting to server:", chosenJob)
    -- Reset rift data when hopping
    currentServerRifts = {}
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, chosenJob, player)
    end)
    task.wait(HOP_COOLDOWN)
    isHopping = false
end

task.spawn(function()
    task.wait(2)
    lastCheck = tick()

    while true do
        local foundRift = false
        local rendered = workspace:FindFirstChild("Rendered")
        if rendered then
            local riftsFolder = rendered:FindFirstChild("Rifts")
            if riftsFolder then
                for _, rift in ipairs(riftsFolder:GetChildren()) do
                    if not currentServerRifts[rift] then
                        for _, riftData in ipairs(RIFTS) do
                            if riftData.Name and normalize(rift.Name):find(normalize(riftData.Name)) then
                                local luckText, timerText, heightText = "N/A", "N/A", "N/A"

                                pcall(function()
                                    if rift:FindFirstChild("Display") then
                                        local displayPart = rift.Display
                                        if displayPart:FindFirstChild("SurfaceGui") then
                                            local gui = displayPart.SurfaceGui
                                            if gui:FindFirstChild("Icon") and gui.Icon:FindFirstChild("Luck") then
                                                luckText = gui.Icon.Luck.Text or "N/A"
                                            end
                                            if gui:FindFirstChild("Timer") then
                                                timerText = gui.Timer.Text or ""
                                            end
                                        end
                                        if displayPart:IsA("BasePart") then
                                            heightText = math.floor(displayPart.Position.Y) .. "m"
                                        end
                                    end
                                end)

                                -- FIX: Always use current/future timestamp for embeds
                                local secondsLeft = parseTimer(timerText)
                                if not secondsLeft or secondsLeft < 0 then
                                    secondsLeft = 0
                                end
                                local expireTimestamp = os.time() + secondsLeft

                                currentServerRifts[rift] = expireTimestamp

                                if not shouldSendRift(riftData, luckText) then
                                    continue
                                end

                                local formattedEggName = formatEggName(rift.Name)
                                local jobId = tostring(game.JobId or "0")
                                local placeId = tostring(game.PlaceId or "0")
                                local playerCount = #Players:GetPlayers()
                                local maxPlayers = Players.MaxPlayers or 0

                                local redirectURL = "https://serverhop-jins-projects-240eae56.vercel.app/?placeId=" .. placeId .. "&gameInstanceId=" .. jobId

                                local message = {
                                    embeds = {{
                                        title = formattedEggName .. " Has Been Found 🥚",
                                        color = 0x00FF00,
                                        fields = {
                                            {name = "🌍 Server Info", value = "Players Online: " .. playerCount .. "/" .. maxPlayers, inline = true},
                                            {name = "🎲 Rift Info", value = "Luck: " .. luckText .. "\nExpires: <t:" .. expireTimestamp .. ":R>\nHeight: " .. heightText, inline = true},
                                            {name = "🔗 Quick Join", value = "[Click to Join Server](" .. redirectURL .. ")", inline = false}
                                        },
                                        timestamp = DateTime.now():ToIsoDate()
                                    }}
                                }

                                sendWebhook(riftData.Webhook, message)
                                print("Webhook sent for:", rift.Name, "| Expires:", expireTimestamp)

                                hopServers()
                                foundRift = true
                                break
                            end
                        end
                    end
                end
            end
        end

        if not foundRift and (tick() - lastCheck) >= IDLE_HOP_TIME then
            hopServers()
            lastCheck = tick()
        end

        task.wait(1)
    end
end)