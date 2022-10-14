Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F85FEE0F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 14:39:07 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJxx-0006Ts-Ss
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 08:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ojJpc-0001RD-MS; Fri, 14 Oct 2022 08:30:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ojJpY-0003oW-C9; Fri, 14 Oct 2022 08:30:27 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EC7Mle016785;
 Fri, 14 Oct 2022 12:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=x+Uml355e7CiEzTaGhJcpy85iKGCO2w6aSNsxqmRnJc=;
 b=aNv74SVc7bGWIbY+aYi/NA63TjNRDEj9PKYxP52As2x/YdTcljForb+4GEWQDomIpNTd
 7GLORphHBKo1BRESt7MONikZIJgInL1Q3zvEHJUmOMZYhEBKP88sR/x+ctmWOWrtbhUV
 Rlisvsor4bLadeDq13OBROgvBKXiKy6tngmybBupp5MeWjXpHxX6DhENN5Za4mCeuiNC
 hZVVv2B2jWg+Wn0xUs3YrOI8EBdJGWRgis7lUYLKZ5AC0xScUiUpFIl30awETWWzAgsB
 ORrzRRvHOqqhQXKmRoa13H8pVtwUNggvnUuN1ev9YbWd6PbpPUG92XGJx62n0cCavX6m xQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6qw7hyyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 12:30:02 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29E9mPAc012136; Fri, 14 Oct 2022 12:30:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn77mmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 12:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTZoSuKISEJiBPFRCNNxUtfix2CATdtRHZc3HWdvzfJWFDZdw7QMsEklmkWDwzkFXhRn9RGaOZkPxbVjaJXFHWzk6Xf+1IyETkoh7V3QhCmN/UuBDobuLyD8KQ6rc6M5yizw3JlOeqkzdVNx8Z6KZilf6btijvWYzLjBNzFf4hO0maMtrte3EJ7/ORqROpkdGRxFeoeGiM5pLs4zixUeb+uhj6hR9PFHUY+skXiMCM11yQib8GhQ6Qlq+2jZvE6NNHdGdkSICYR+b60Yn4KKpWghaAXd17xmenvVjTfRP0z2v4fkFlfRLgKaHlIjeawwNDEQod2G7WDAL+oR03q3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+Uml355e7CiEzTaGhJcpy85iKGCO2w6aSNsxqmRnJc=;
 b=OmIkA4AOhvCQw2P8c89Jn8sroc4An0ba/QBQ30IzqWOk0dlAd3Cr8RmfnujTI+mwg6lw9A/b6Je/PwDmnu65X+pnoDTDs1cttU/bAwi0k5X4oLvmpR7F2j+y56/MJdsLvbRaAboEWUgLNM6Ev0M7x+sqcI1SiSoKk4mXt++QkCiksHXaJgiCLQ7e9Ic3bRsruLpBcAbvaENBMZHs16KD2y/3AiFHM7H1vCJ+8tRY+jih72XW8lTkkqRMTqe6NfMAMeIdVejD7EsSE4q5YqdFvVvGFBqbGuGPqDLU2OwOv+0xKNuRrSBySSogmYoCyhWqhyrV9HLLdlvGPKkvtjlEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+Uml355e7CiEzTaGhJcpy85iKGCO2w6aSNsxqmRnJc=;
 b=f2/kS6hYBYwJAdBcf+Wsxf8JRnytYBF6DPSfDpriONJj5ZcAZhhQHnupcOCoZjrgvyxsZMgov4sVzazhq64DLIcle+P2tAJcgf3/Ov7ZvNLSE4q3qF4NNMCA2p7nLcRXq0sor1WeegLFmC/EAPqqDObZoS5AqMVzutz2ABbc+pg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB4608.namprd10.prod.outlook.com (2603:10b6:a03:2d4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 12:29:58 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec%2]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 12:29:58 +0000
Message-ID: <a273f54e-d9d2-fae7-942b-641aa1a3ed3b@oracle.com>
Date: Fri, 14 Oct 2022 13:29:51 +0100
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
Content-Language: en-US
To: quintela@redhat.com
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 qemu-devel@nongnu.org
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
 <87ilknemef.fsf@secure.mitica>
 <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com>
 <87h706wsns.fsf@secure.mitica>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <87h706wsns.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0461.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ0PR10MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd3bc4-54c5-4cfd-c86a-08daaddfceb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR05QSloF2tX4e+VThyZURGc/qE9uJNcHMi+Ev+Kb6kHrCInU3O16SsD7qPEqdl49GKHQoWJrzO8yTC88Xhb5eYr8YNSz6aZ4PX7yRAjIiBs3uESztb0Es8B+/ocDhUI8K+yChpQwY7jXx4l9JWdw4yvEcY3SQPmatG7xcmeC0pfw9mtTs3HXkiVNc+ZqWtLAv9646ybtWVOa88QFIq4Bd6tXHtpcLBrat7a4dXzqTYlzDv9CgpEPUwgOvHCoRTAGJ0KSkCKOUUps46no9KqwYWJzD+23Y2fd1Ie1IyQPmfSN5JMMJFlmLkkTm2iwYhpfdPIQaQ2atdFVRdsX5+8MYiLrnYhI6qPGPstLzrqeUy69Su/hEIGnmdEwv76Nr3Cd4a5x8DJ3olKOhKa15VaLwah3hg7+kqkueGGosEWUjG9lLEyV6hTfxPC3fhpavC5uABKgpVXPTftpfqM29q7WwZFK69JlcGCFRbe1cxsOdffQy+RC+NBYfbzD1pZGLlQ3wi9NZjhgihGSZ0abo5Ymr/wMtlU1jlm0vMS48Pe+NE54rxOZW5Oa42wRD5SzlsxG39jCO5nLiW6jECfLdelnQTQoG6pfp8tnR79768djFgdUaIJaA+ugO0M68OJXtonyARgs4U03WbezcUCqtBJct3XxEU36kTH6ABQh8Rct2dMOfeMxABEYQ4tx2Y9Zk3WNeupseO9okQOpzjgu/pRCQxxubNtknX0YGex5tVvQpg38DUeueox83NmPnWc265dQZX3mI8oLAzFEvo6uS+Rq5n7yUVepXN19PmvH1KeX7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(7416002)(5660300002)(2616005)(30864003)(2906002)(186003)(53546011)(41300700001)(6506007)(26005)(6512007)(8936002)(31696002)(38100700002)(86362001)(36756003)(83380400001)(316002)(478600001)(31686004)(66899015)(54906003)(6916009)(66476007)(8676002)(6666004)(66946007)(66556008)(966005)(6486002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFVMVNxa2NiQUNPTUY5V2p2OEZzYzhyNFdXQ0dEaktjUTFEUzAzakU0YytY?=
 =?utf-8?B?S3BjNlZlcFRySVV6SGVZMEJhV1FMb3dOV3hNTU1FelYyRlZIaUNRNEx3N1V6?=
 =?utf-8?B?dUhpbGM0REs0cGFEVENQZkV5Zks1VE03YkwxemZCQ2tCQWZxMnFxVytuK1FX?=
 =?utf-8?B?S01kMjZXSVczNG96amJtdVhPckEzZ3BlYzRLMWlkWTFlczFJWnU1MkNOUzU1?=
 =?utf-8?B?YStmZ1ZKSmVibXdwZjVCSHI1NlltSE5XUEoxZ0FtL2txMkYvZEhsaWV2bWNN?=
 =?utf-8?B?QmJpbEVKd1ozSDhNQmYrbEdpaFg0aUx0UlBnWm9vS3FnR2taZ3F0UXlISDlM?=
 =?utf-8?B?eTdlL2ppVzVEalQ0SHp3eHgvUGdqQTN4SGppQWNva1JpemRRRjF2MFRQT1NC?=
 =?utf-8?B?WGJTdkVBVHhTc2M5dzlQRzZFem1CUmlEcWM3dUUvZldGczk2THNFQXd6ZjA0?=
 =?utf-8?B?b1FXcmwvSlNrc2FVRzg5b0RsdFREWjRiMFVsc2VJenAwc2dyQWxmT2ZmREta?=
 =?utf-8?B?VkpWSjNNNUgvS0p3Slh5SWk4M21GYlFVTG14cFJsa29odWZVZzhWQndKc0R4?=
 =?utf-8?B?M0ZBM09WRzg3Rnltb1htamVoZ1FCYXZGQnRORE5HWHRGVWhwZG1mOHZCM0hI?=
 =?utf-8?B?bElWREljeWRscVdIREErUHMzOG5BUVZCNUE2NnNVMXZSa21ueXY3M0V0emtU?=
 =?utf-8?B?YlpxY2lnUWZCZS9oTmZmNnhiQ2tKOXo0THNuMXlZRTJ1eUpMNnVvY2M5NU1h?=
 =?utf-8?B?cFZHK20wand4aGVNSXdETFZwQzAreFVteXNLbDI3WTV3UWx4dDdYNTArWWtj?=
 =?utf-8?B?Z0tYS3dORlN1NlgzSGI2cWVHam96K1A2WlFEd1ZjYk8vK0xLNXlpZWxkaFFC?=
 =?utf-8?B?a0FEWVJiT3BBR2tHNW1jNUlJczQxd2paSW5JUXVWMFdEaGRFTWRvby9nYldH?=
 =?utf-8?B?eFRUbW51UC91bGcrRDNwR0xuaFpTb05oMXFwbFJIdjRPMXUzeVFWd3BRam1I?=
 =?utf-8?B?bTdmNS84S2U1V3g5ckdzSlJwUzZQZFluQjA1NG9ZSlJvcXNmTDBoWXQ2QUVT?=
 =?utf-8?B?bStuRTN2SnVtV3FCUzdFVEpuRExrenhDRU1BdGQrVm9rSU56cE9CVFBYYUda?=
 =?utf-8?B?VzNBR0pXbDU0VnhBajdtR3M4QXlSdC9iQW85Y0lGZXVKUENjSXlxN01URXov?=
 =?utf-8?B?dmlkMlV1Ym92aE1vVGNqdW51eG1OQlVmOG5sakI2NEZFR1k0Wi9iZnQ0d1F6?=
 =?utf-8?B?NUxiTkcyY2NLek5EU0x1TDdQYUNXUHdvSEtxRGI5YTA3a2xQYWsvY1B6WGVM?=
 =?utf-8?B?WGNlUWNndC9OVXVFc1VONVZZekNBQ1JMYkZpZm9tUHZNRkhtSXJjV2ErMHY0?=
 =?utf-8?B?RWtjRDlLK044YVdqSkVFNmRZc3p4ZWRGNDFndEdGVnBKSG80ODZlSjRzRGRr?=
 =?utf-8?B?alBnTWtPNXZkUVhzTXJZZmVUUW45N2M2bzNHRVA2ZS83RUhuSTlTb2xLUEcw?=
 =?utf-8?B?RG1JbXU3eVNiQjJkZ1dPVCtNZ3RxaXVDRDc4d29XQWRpdUVOUldaNUhiY0pE?=
 =?utf-8?B?UmlJbFI1RzlPUExQYm1naWxXejF6b2Y3SllzUTlJVDM5SEZpVVFHZDBjK3I2?=
 =?utf-8?B?S0xOeWswMWdaVnpGZE81cDkvV0JNRWJXcGFjQThkSVRiK1NJZCsvNmVuSzNR?=
 =?utf-8?B?dTFOWU9mTlJ3UEFNOUFqMFVkaG9XcGx4bXZ2cDAzay9ZcHBGbndJMmVZd0NM?=
 =?utf-8?B?OHJNZVRKV2RYMVZsZ2h4RTllTXdGb29wZUd1RU1KUEs2VE5UakUvQW0rVzhD?=
 =?utf-8?B?R1JWVkRKS1l5UHZBVzgzR3NPS1ltNnk3VHd5S3c4L2d3MitWS01ReTV2VXR0?=
 =?utf-8?B?dXNuZTg0cnR1cEhDTFBOVlhGVEgyWUJicm1rbjdlcUtRSXBRUEtCY2w4NzJp?=
 =?utf-8?B?b2FLMnpNNlQvMWJzbXlVa1hwbHNSNWZSOEVTcnQ0dU5wVUlOR0E2bHZIU01w?=
 =?utf-8?B?QncvcDFhdnF5ZnRBN0R4czZSRzhmTjZUVHF5OU8wb01mc09JaEQrSmZwSlJX?=
 =?utf-8?B?ZjB1emJrd3RXU0l4RUpGV2hHUTBoTFA3bFZxRStsekJUOGxGZjA2OEVFNytj?=
 =?utf-8?B?UCs2Z2tDbkRxWFkzUENYakdjR1h2RXZQK1lwYmJIY2REVnBMS0kwTEZBYU1Y?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd3bc4-54c5-4cfd-c86a-08daaddfceb5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 12:29:58.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHBmQZHEgyDliph2zrLc8DzkzuAeglXiy3vlgxKakL9sZVb0VQHydi5d4Wl9nqgiKvH6zp3/IEc5IiE7W7UtvB3+0BWadpFor5+GodrkV0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4608
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210140072
X-Proofpoint-ORIG-GUID: Hb4_44KQBnG-1kgsGmb6eskfI_TEKf8K
X-Proofpoint-GUID: Hb4_44KQBnG-1kgsGmb6eskfI_TEKf8K
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2022 12:28, Juan Quintela wrote:
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 13/10/2022 17:08, Juan Quintela wrote:
>>> Oops.  My understanding was that once the guest is stopped you can say
>>> how big is it. 
> 
> Hi
> 
>> It's worth keeping in mind that conceptually a VF won't stop (e.g. DMA) until
>> really told through VFIO. So, stopping CPUs (guest) just means that guest code
>> does not arm the VF for more I/O but still is a weak guarantee as VF still has
>> outstanding I/O to deal with until VFIO tells it to quiesce DMA (for devices
>> that support it).
> 
> How can we make sure about that?
> 
> i.e. I know I have a vfio device.  I need two things:
> - in the iterative stage, I eed to check the size, but a estimate is ok.
>   for example with RAM, we use whatever is the size of the dirty bitmap
>   at that moment.
>   If the estimated size is smaller than the theshold, we
>    * stop the guest
>    * sync dirty bitmap
>    * now we test the (real) dirty bitmap size
> 
> How can we do something like that with a vfio device.
> 
You would have an extra intermediate step that stops the VF prior to asking
the device state length. What I am not sure is whether stopping
vCPUs can be skipped as an optimization. In theory you could, but perhaps
is best to be conservative and handling with same assumptions as any other guest
related state.

> 
>>> That is a deal breaker.  We can't continue if we don't
>>> know the size.  Copying the whole state to know the size looks too much.
>>>
>>
>> It's fair to say that the kernel could know the size of the state once the VF is
>> stopped but right now it is only on the STOP -> STOP_COPY arc (which is when it
>> is saved to kernel pages, regardless of userspace reading it). And it will block
>> read() until device has finished transferring it (unless you do a nonblocking
>> read ofc). Knowing the device state would need to be reflected in the vfio UAPI
>> and needs that adjustment. Providing total length ahead of device transfer might
>> depend on the hardware, but current vfio vendor drivers look capable of that
>> (from looking at the code).
> 
> I have no clue about vfio, so I need help here.  I can only provide
> hooks.  But I expect that we should be able to convince firmware to give
> us that information.
> 
The above was me talking about kernel interface.

>>>> It would need a @data_size in addition to @data_fd in
>>>> vfio_device_feature_mig_state, or getting fseek supported over the fd
>>>
>>> Ok, we can decided how to do it, but I think that putting fseek into it
>>> will only make things more complicated.
>>>
>>
>> fseek() was just a suggestion as a way to calculate file length (device state
>> length) with current file APIs:
>>
>> 	fseek(data_fd, 0L, SEEK_END);
>> 	size = ftell(data_fd);
>>
>> @data_size way is likely better (or simpler), but it would need to get an extra
>> u64 added into  VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl
>>
>> I am sure there are other alternatives
> 
> My understanding from NVidia folks was that newer firmware have an ioctl
> to return than information.
> 

Maybe there's something new. I was thinking from this here:

https://github.com/torvalds/linux/blob/master/drivers/vfio/pci/mlx5/cmd.c#L47

mlx5vf_cmd_query_vhca_migration_state()

The hisilicon one looks to be always the same size

What both probably assume is that the device has been suspended prior to making
this call. We would use those interface to return this @data_size as said above
or whatever reasonable alternative folks had discussed.

>>>>> So we need to stop the vm "before" we
>>>>> cal the functions.
>>>>>
>>>>> It is a hack because:
>>>>> - we are "starting" the guest again to stop it in migration_complete()
>>>>>   I know, I know, but it is not trivial to get all the information
>>>>>   easily to migration_complete(), so this hack.
>>>>>
>>>>
>>>> Could you expand on that? Naively, I was assuming that by 'all information' the
>>>> locally stored counters in migration_iteration_run() that aren't present in
>>>> MigrateState?
>>>
>>> This is not related to vfio at all.
>>>> The problem is that current code assumes that the guest is still
>>> running, and then do qemu_mutex_lock_iothread() and unlock() inside the
>>> pending handlers.  To stop the guest, we need to lock the iothread
>>> first.  So this was going to hang.  I fixed it doing the lock/unlock
>>> twice.  That is the hack.  I will change the callers once that we decide
>>> what is the right path ahead.  This is not a problem related to vfio. it
>>> is a problem related about how we can stop/resume guests programatically
>>> in the middle of qemu code.
>>>
>> /me nods
>>>> Couldn't we just have an extra patch that just stores pend_pre and pending_size
>>>> in MigrateState, which would allow all this check to be moved into
>>>> migration_completion(). Or maybe that wasn't an option for some other reason?
>>>
>>> This is not an option, because we don't have a way to get back from
>>> migration_completion() to migrate_iteration_run() if there is not enough
>>> space to send all the state.
>>>
>>>> Additionally what about having a migration helper function that
>>>> vfio_save_complete_precopy() callback needs to use into to check if the
>>>> expected-device state size meets the threshold/downtime as it is saving the
>>>> device state and otherwise fail earlier accordingly when saving beyond the
>>>> threshold?
>>>
>>> That is what I tried to do with the code.
>>> See patch 4. ram.c
>>>
>> So what I was saying earlier was to have something like a:
>>
>> 	migration_check_pending(ms, device_state_size)
>>
>> Which would call into migration core to check the SLA is still met. But callable
>> from the client (hw/vfio/migration) as opposed to the core calling into the
>> client. This allows that the client controls when to stop the VF
>>
>> The copy to userspace one could probably be amortized via pread() at
>> at an arbritary offset to read 1 byte, and get an estimate size. Say you could
>> check that the size is readable with a @threshold_size + 1 offset without
>> necessarily copying the whole thing to userspace. If it reads succesfully it
>> would bailing off earlier (failing the migration) -- and it would avoid doing
>> the full copy to userspace.
>>
>> But the one gotcha is the STOP -> STOP_COPY needs to
>> happen and that is what triggers the transfer the device state into
>> kernel-managed pages before userspace decides to do anything to access/copy said
>> state.
>>
>>> How I have two functions:
>>> - ram_state_pending_estimate()
>>> - ram_state_pending_exact()
>>>
>>> 1st should work without any locking, i.e. just best estimation without
>>> too much work, second should give the real value.
>>>
>> Right -- I did notice that
>>
>>> What we had discussed before for vfio is that the device will "cache"
>>> the value returned from previous ram_state_pending_exact().
>>>
>>
>> A concern I see is that if we stop and resume the VF on a regular basis to
>> accommodate a calculation just to be made available throughout all migration
>> flow -- it is going to be a little invasive from guest performance/behaviour PoV?
> 
> It is *kind* of invasive (make things slower), but we already have the
> problem that current code, we are not counting the size of the devices
> state on calculation, and we should.  This adds a hook for all devices
> to include this information.
> 
I think one difference here is that the vmstate is all self-contained in
Qemu/VMM (except for accel-related state obtained from KVM). Here we are making
calls into hardware, stopping the VF, get the state to resume it again.

> I see two options:
> - we stop the guest for the calculations (it makes the last iteration
>   downtime faster), but it makes the rest of the end of iterations
>   slower.  Notice that we should not have so many iterations to start with.
> 
>> Perhaps this check ought to be amortized at different major stage transitions of
>> migration (as opposed to any iteration) as this can end up happening very often
>> as soon as non-VFIO state + dirty pages get to a small enough threshold?
> 
> This is the reason why we add the estimate size for the vfio.  if the
> estimate is good enough, we shouldn't stop so many times.
> 
I suppose, yes

>>>> It would allow supporting both the (current UAPI) case where you need to
>>>> transfer the state to get device state size (so checking against threshold_size
>>>> pending_pre constantly would allow to not violate the SLA) as well as any other
>>>> UAPI improvement to fseek()/data_size that lets you fail even earlier.
>>>>
>>>> Seems like at least it keeps some of the rules (both under iothread lock) as
>>>> this patch
>>>
>>> Coming to worse thing, you need to read the state into a local buffer
>>> and then calculate the size in exact?  Looks overkill, but in your case,
>>> I can't see other way to do it.
>>>
>>> My understanding was that for new hardware you have an easy way to
>>> calculate this value "if the guest was stopped".
>>>
>> s/guest/VF
> 
> The use case that I was discussing the whole card was assigned to the
> guest, not a VF.  I have no clue if that makes the problem easier of
> more difficult.
> 
>>> My next series are a way to do in parallel the read/send of the state
>>> with respect to the migration_thread(), but that is a different
>>> problem. 
>>
>> There's also non-blocking reads not sure it helps towards the asynchronous transfer?
> 
> My current "cunning" plan is to create a new channel for each vfio
> device, hat allow the device to do whatever they want, and using a
> blocking interface.
> 
Looks sensible

>>> I need a way to calculate sizes to start with, 
>>> otherwise  I
>>> have no way to decide if I can enter the completion stage (or for old
>>> devices one can lie and assume than size is zero, 
>>
>> to be fair that's what happens right now with migration v1 protocol -- it's not
>> unprecedented IIUC
> 
> Ok, thanks for the comments.
> 
Likewise

It would be nice if we could still move forward with v2 support, while newfound
gaps are addressed towards the road of turning it into a non experimental
feature. It would allow exercising a lot of the new interface, as the ecosystem
is a bit limiting :(

