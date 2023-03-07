Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E96ADBD3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUWV-0001SX-6W; Tue, 07 Mar 2023 05:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUWS-0001S1-Pr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:26:20 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUWQ-00044e-S9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:26:20 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783rtj007640; Tue, 7 Mar 2023 10:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=r/o3dVBzEMN00nkszSzbYjMm+u/bN+K6lvMMzsjUsrQ=;
 b=IcSzYMrDeFwTOB6wwYcuBV/KiPhRoSbR/XNLos1TIU6pmhbK5O5fVOlBBCEZ1/HFKhdA
 TZwuWhoajpL58bSComOabUNYOdf2kOHmruQltlV+SCFSWtvvQaXhOI3mL028J6rlZMny
 2rPL3TmTBz5vsXEXFWAvY6PPDORv/GNjgbx1cBDS+HnhwpNHdjxK4CzIczppbDmJ/4g5
 MyuM+kXGlN/kHUxNc2WLKkGOCcgwOdPRFz6FpNhn0Wjd42eXqVHlMxjAdWfEfPAeZHU/
 JS4aCEFekC2VFqIf+agVpNuUeAPGBJZWfGvnqG2JBTXqvH9Ti6m8NyZ/C/s4el7N0XOK Fw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn91fj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:26:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3278ohtI016338; Tue, 7 Mar 2023 10:26:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4tur2wnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZoXOYqnMOQ4S40GMbMqM/kGAm/xeJwOsV1Xe6GAdi+nLHuRNbF02/KqWWvZPUVcKodCPDaJ/jaR/R9ATFkzMC4E+MpScHX3OjZQBkCT3y9qgyBt6etYu+NEcPPm05kaU61vjtXeOXzlc431Aepgh52F4Ya0Dz90j6T4tg7sJSWc9D/wBtKZYhclv3hAgYBCHXwqYc6ZW9IvBPz1ZVzqy0w1M5nkHHbmQ5zi/bgBZKdVq6bBsKEOIS4E7b9+K6pOYL34V3OG/t23X1ofbV5UmPJG/qW9lEa5Cs/XwP9eQ8bSSnib+BnQZXK/dxLMS1VQveTcqiwP0iQZfYb1gIkE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/o3dVBzEMN00nkszSzbYjMm+u/bN+K6lvMMzsjUsrQ=;
 b=lwzt+Vwv7ihdlo9rijiQ96dzuF5w5PRKfdkSoEHvAI7HNvlaswTJqZH5/R+XAwzXwUOvc34v1gM7IEk4HrceYlm/Q/dXVMwGTNz9u7+ZMTgbPQS2464QQ71fL92ToXlbYbQELbaFLqUokKpesnftlMsbtIzr9+DVYzTA7VW3YulKOh4yy9MPFi8A6lilzmRYL+BdZzNQj8iYp8bjn6D4LgTx5s8/r5mX7yQv8dTCCnrZIOdUoaIsm52gH6n/EchOwqTc58Dry4aiisODZwMpTPjpbY9pDUUfU4qUuVKT/b4tRWlFQOVmvaFxwrw+kuDb+a0Vu3g++2n4ln7x5nr++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/o3dVBzEMN00nkszSzbYjMm+u/bN+K6lvMMzsjUsrQ=;
 b=c1uRW7mz6bsTczvJfpPirODWIANAj4e+A5q+NzGjB6YSu8n9sYDdpdzOgechq8M5Jj0DtcvoxA2CAojmTAyHvpWUoFHIY4tNyXQWQrtf6Dp/ZjTdf6cB1TEcQ8AoL8qXHSIxbcNLKQqmnud+sHkWR+smLZ594UiioWOFZ/CokFE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA1PR10MB6518.namprd10.prod.outlook.com (2603:10b6:806:2b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 7 Mar
 2023 10:26:13 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:26:13 +0000
Message-ID: <95156fde-37f2-2a48-d5b8-9a0f48db0e1a@oracle.com>
Date: Tue, 7 Mar 2023 10:26:07 +0000
Subject: Re: [PATCH v4 07/14] vfio/common: Add helper to consolidate iova/end
 calculation
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-8-joao.m.martins@oracle.com>
 <4db1f662-ff56-e6e2-adec-bb59e202d59a@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <4db1f662-ff56-e6e2-adec-bb59e202d59a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA1PR10MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 47581129-dd0f-460b-4160-08db1ef66082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIDlAZT1JuZajk2pvznsZ9mlpwIkiv4ZL910DkuQ+isQkI/2KJAnhhLLyw3HGQdRVvsuz0mZhr6uN47ic2tAq6s3Ysa/mH4sP2JpL0tyoS1I2DFt93hTOT6BlzZwCja6fS1Pzl8+1z0nDIqiIPPxypkN6JDcQ3rLcZsY/7kXfnyXSJCSpmVgH8rBXdG78aw8FoWf4ve+OmPhsAIWuV6bwHFhOW1Me4VmKdKKmJoBkEzYi6cMb+vcycz3jNBaNooayUzZn9SoXbp8+f5CamUTbqlsW4oLeb8t+4plQkb29RZWqQPEm0iMCf5+CoYYakbfWBi2dDuwHZhKNXLtsJGIj7u2hafC1cvVJmWtDINZlL98puDeum2QAMs05iAuEbo+oMtlJyzM8bEfzjQRFsfuIBJn9Bxl998siezOj4mUGogmbzB9ijgHT9sUVutbiagzzbwONdEIbG7Ow49tqaRMMlFVjf5+JmkMrWX0DA/3mjkMHK9jLfmwrAEzMXgyLUeUI5Nc/uIEKz3vJ09dV6PiSA2xZUg2hyxG3BFg4tvginvJibSFt5ldc9nYkmOZ2kXy2/bWOWf5Dsot1V5Q19vkg1rH3aJOLofD3fKXp1QKKP7LdQ9L5oATG4Fk5/wcD1p0lkAJO2kB+widQfe5qolFso4PIEkzCOv71lHlcPLjmjvGp4j3eZvUNGdLtSX2X+MrLeO7ekpnGLG3IjDSLRHNUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(86362001)(4326008)(5660300002)(36756003)(31696002)(54906003)(8676002)(66556008)(8936002)(41300700001)(66476007)(66946007)(316002)(38100700002)(2906002)(83380400001)(6506007)(186003)(26005)(6666004)(6512007)(478600001)(6486002)(2616005)(31686004)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXk2bEtrZ1hJT1ByZG5qOUEvWUV4M25OYi9Pbkw3MlJBU05VczFDQjcvdEhZ?=
 =?utf-8?B?VWYycUlCUm5sTFlORkJPSC9tL3o0Zk4xR1BYbjBKUUxSb2Evcy9zSTUzeEdD?=
 =?utf-8?B?OUxvcjFCb3JmY3RUdk9lZFRwNjdDUEpEVnZsNE5mK3F6MnNqT0Z4cGhLUy9u?=
 =?utf-8?B?Uk1wNzZLMnBiRlRkRGtLcTF4RG9QUnFzWkhzQUd5R05kb3c4VDI4dlp4cmhJ?=
 =?utf-8?B?WHd4K291dzdrK2UwMGlSWndaTnRxM2crc0poSkJ4Z3VsZjM4Y0tlcys4bnN3?=
 =?utf-8?B?S0ZZMkMzd3J3OWZMUWJ1NWwyM3BxVjlJUllsRmZETXYvTXRmR0E5L0xwZkEx?=
 =?utf-8?B?ZjR0MWlFakdrVmFub05HWW5tOVp5eW9tTWNpZC9idklMTStubkpqbzg4SHZj?=
 =?utf-8?B?VGNrU2xNV1RremYwaFBBaU5LdHdHTlNWbjNKTno1VUlRb3FneVNrWm9rZ1gy?=
 =?utf-8?B?S0JuMXhtbW01c1JieVYveTF6b1NOUnNvN1hKMDR2T3lDVk0zTElFbUExQjRx?=
 =?utf-8?B?R09OUGNTbEg4bFpRdXVCaGJnb3JkQmlveFFrVDNvNzBNQWhFQWJhSzRpcTRi?=
 =?utf-8?B?UERUUTAxOWVHb3lHTkNKdXEwNCtpcDFNRFdISWdrRjBPR2hrMTNQQ1lQSHht?=
 =?utf-8?B?a0gxelJMajlEbVgrVkttbjFWaE53NnZXemhGZ0RidkVpcGhnSmNsdEhTWVdG?=
 =?utf-8?B?eVpTTTd0UlVncTdvQWVVaWg4Wmdxdk9UMHBiZXJaMUpZb1JKSkpCYzFyN1Ro?=
 =?utf-8?B?R1pWMEF0OGF5ZFFCZWd5dVQ5Y2ZwblhPRFYvSzdzcEJycURFMDRRcFI4Zlp1?=
 =?utf-8?B?dE95R2ZLamVsSVYvWitPS2NqenRUSTlCZldtSTk2UjNMaFlDSXdYSFQydW9w?=
 =?utf-8?B?bUl5cXNCOG9FNGIwTGdsMGlXbkJ1T2pkc0VkeUV4VWI1UmJldGpYNStwY2VQ?=
 =?utf-8?B?eEp2cWVKUzdWcU9IQkhHTHVkUVJEVExxU0dJSG9jWW41bUtqR0RTT1FxNjU5?=
 =?utf-8?B?NE9lSGRUOFdjL2dkaDMzamJxMWg1b25NZFJ1YktkVGlNNyt5YnVCbFkwMTRt?=
 =?utf-8?B?elRsc3h4QUx4c3BWOFJWZUJoME96Q2phVkNIUnUwS21pL1lYQXhGdU11c29F?=
 =?utf-8?B?ME0vMHViZ1VERVpjUWRWYUJJdmlDRmR6ekIreHpLQkFYU2hxZXJpWXoySGJu?=
 =?utf-8?B?VmNUeERlb0lBL3FWcWZtakRieG42aTdZUmJOMVhvaWZZMFpWVzlCZVJlL3Jt?=
 =?utf-8?B?cWRua1haOGJ1VThpcXM2S0hhd0d4MVJ1ZFZqSENoYjJ6cXlLUmdmUkZtVTRB?=
 =?utf-8?B?NVBBVHlFdnUybm9xMUk5OGpqWkNNdElaTXN0Y1BINzRnWkpEZTlaS0lxVDRu?=
 =?utf-8?B?MGtGd1BKMHU3bndyZ1M1SlBkdHY4dThDWVhaUmhYbjZqeWRZWDNBbUkzcXBK?=
 =?utf-8?B?YjhKVmVhbVdvUUliWlhsNVU4ZVB5Umt1QWxJNjVISmFDQnk3ZWVhUjhrck94?=
 =?utf-8?B?MEVWOW9jb3FtSm1oVlVrVENTeGFKSnB2Y3d5WHJvK29Bd0E4d3dWemVQR3NS?=
 =?utf-8?B?T05jSTZDbkg5TXM5ZllqbDNJcVVscENVMS95Zjc0RDZhamR1aWh2NHNnQ3I0?=
 =?utf-8?B?RjZxT3FSNWtMcnhUcjd1OUxSYlFieDRhRXkreU5pOGdJclhhSzgrM0Q5WmhN?=
 =?utf-8?B?VzhKTm5EWTNFQUhSMEpub3k1TkhwQXRtNVd1NVUxTGhqREVNZ0JWQThXaDBW?=
 =?utf-8?B?WEpqRUhwUW1SQjZ1dktRdVRHdlRhVnNjdFlCbFFTNEQ0U21vclg5cXdOangv?=
 =?utf-8?B?aGcybSs3S2lVaVBxNi85aUcvL0R1bTlTazFtODhHYXFXN1o4dE93Q3Z4d25F?=
 =?utf-8?B?ZnpENE5Yb2lwNCtwQWttV1NOZEhubFhjbEZDb2p1alpiWi9vZ09IaFFSbVZt?=
 =?utf-8?B?OU93MllnNk51blczV0MrY0MveTV1WVFwVHhCRTVERGk3RmNPcGtpOUhuMGpw?=
 =?utf-8?B?NHBESlFBbjRjdEkrRzRnSmRzRDgzeDFpV1lCRm0zdDM2eXNaenlGcXdMcVU1?=
 =?utf-8?B?R25hVkZJb0ovZ0VxN2h5clRJOUcrZUlCUEtwZnRIayt6OWw1TmJVU2xsdzFH?=
 =?utf-8?B?MUg3ZklCWmxCNTJZdlVTWkc3SlEwcFlGV1RudDFsUnVTeTF2VGMrbUVBQkVy?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 83J/4U/jsY7bOSB80lt64j/plxLRqPB8JsBJuvng6lwFjapJs3RhnovTw+eeUjw0dxh0E/hzLIbE9slX43sQpEpKKBQTSc95FwF7c1RE96e1Hr7BXrIfzk9QrxjCFecDi/z7YuG0l2yNt8Ot5/p9Zv1cJkXR+Yo1FsUEko7myoIB9GkD2VByrTjOx4dGsWMxZ77cqDnVEguHxoAZr0ZtsOIffYvOgX67DEnecuE7+vSXZAO7ZSdcWHtT0K8ONA/tSiRQC2/JUpcvFJivM3W1WGp2vPSOVUqAW+Ge4jJxa00QZf/hsHdtbtuTSwKAHTq94qvDlBWhoPXRFpwnJHo3aRecbb5nxhFWUWnOj/AQ42od5/AfVBZjD/PFMH5ZrpwipeuYrMexG8ntu7ShYob1dbeC2tngwJpavyV4rAYdqf0LS1iag2Px4Qt+wXamR4tgWG85mZwUi/HiW/JN7JPVoU+LJA9HXF/wvHKB1KtwUNz+0C7tVN4q+Mf9CiobFoZBGejCQgz5RnwiQd5xNx065yukp3cLoyjanMFX10kqK/z1YfcHQ6qM7CIDBmuwrcPg6T9FfO4Wj9XNk09ySgV9aNcrHNKOnXs/kEhzrt1I1OB8/pXGFf5XR2U7e+LcPvbDQ+mde5joCxjzJOYqmwTyYJj8UwBRkdZMDGBJ1TiJZXcCdYQ60b7oRySoYl0nK0SzJb6MYI0QEjFzpn3kMB//oMjjzn9FxE/H06qL9Unl9whIwOkJyylRk9SC77i1t2GcWIFycy4o1CLP8f1Heep8EOvRIQz8pAmCJvHwKJgmlX5IPzx2hciBmA7+4Q2NlXLX
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47581129-dd0f-460b-4160-08db1ef66082
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:26:13.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqYuGHXF4bKrAtcgEmDDm3DxgGka7RM5REuQUc+ar3Ovmb1z8TmeR6bvaJvUDGkHIoap9e57zSAKJZyEWKkQkpJpSoMlVTV0Q/+T0qfwuuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=934
 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070094
X-Proofpoint-GUID: 8f8mjddnqLTAiojrz7Ibjw4-sHDQG96X
X-Proofpoint-ORIG-GUID: 8f8mjddnqLTAiojrz7Ibjw4-sHDQG96X
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 07/03/2023 09:52, Avihai Horon wrote:
> 
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> In preparation to be used in device dirty tracking, move the code that
>> calculates a iova/end range from the container/section.  This avoids
>> duplication on the common checks across listener callbacks.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c | 37 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 54b4a4fc7daf..3a6491dbc523 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -961,6 +961,35 @@ static bool
>> vfio_listener_valid_section(MemoryRegionSection *section)
>>       return true;
>>   }
>>
>> +/*
>> + * Called for the dirty tracking memory listener to calculate the iova/end
>> + * for a given memory region section.
>> + */
> 
> Should we just delete this comment? The function name is pretty clear.
> Besides that, the comment is not completely accurate -- in this patch we are not
> using it yet for dirty tracking and it's also used for region_{add,del}.
> 
Yes, let me delete it.

> Thanks.
> 
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end,
>> +                                        Int128 *out_llend)
>> +{
>> +    Int128 llend;
>> +    hwaddr iova;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(int128_sub(llend, int128_one()));
>> +    if (out_llend) {
>> +        *out_llend = llend;
>> +    }
>> +    return true;
>> +}
>> +
>>   static void vfio_listener_region_add(MemoryListener *listener,
>>                                        MemoryRegionSection *section)
>>   {
>> @@ -976,12 +1005,7 @@ static void vfio_listener_region_add(MemoryListener
>> *listener,
>>           return;
>>       }
>>
>> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> -    llend = int128_make64(section->offset_within_address_space);
>> -    llend = int128_add(llend, section->size);
>> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> -
>> -    if (int128_ge(int128_make64(iova), llend)) {
>> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>>           if (memory_region_is_ram_device(section->mr)) {
>>               trace_vfio_listener_region_add_no_dma_map(
>>                   memory_region_name(section->mr),
>> @@ -991,7 +1015,6 @@ static void vfio_listener_region_add(MemoryListener
>> *listener,
>>           }
>>           return;
>>       }
>> -    end = int128_get64(int128_sub(llend, int128_one()));
>>
>>       if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>>           hwaddr pgsize = 0;
>> -- 
>> 2.17.2
>>

