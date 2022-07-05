Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79BE5676BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:43:12 +0200 (CEST)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nVw-0001cP-0Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nF2-0000Dv-LS
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:25:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nF0-0002Hi-MN
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:25:44 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEFjq012834;
 Tue, 5 Jul 2022 18:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=E2o1/4BVpCLm4BN6vau9DD8wqbviV4WuTmMYGmfp/kY=;
 b=ICPm5Q6Q5n08Qpl0J9xa0T8P1mRQBBMW52/rilAw1xcm9UjgT8NgrPJLKhEn3GzSU/uo
 OsCsUs21GVJOmhfbdzdCHVmgD5CxRBst7+a7uVOTqzi/qCzQG5p8vHbTtadVxlyWKS5w
 5L/avEpCw+8msvoJ9KX/vBvPpfriKgbmKFobt9ZnG8ZdBz0RH3jDgHD7EWiNYOecxx1l
 kcx/VjGuKq9oPeQNyp6Q/6si/sjMjC99moWv8xgdnnaicLRLHjcfh2cChZjT8ZoDaeht
 5pwsQqUSvH99FAVi53HQRz0+Pe3bVda41tZfbIuTYn9sYUX8IEpPo2oeEMAwka3WxJoa IA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cecew3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:25:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBE8X022652; Tue, 5 Jul 2022 18:25:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h2cf8n659-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:25:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCq1mafQSUQMYIrerOpeieSIxeFYQCeOZNx0mbrKOe8cp6dW1XvUvQObu7T846+4V0K3MCqaDHpZwrcbm475YlPXQ1emT2TnfD6T07cGVYRC3ytWUohJmN1KPwsYDgHulR2jABjJxnUVtNbqyENjsw7mGv7Q+QicN4Tk+4NXMjV0EinIkpYql2DInc69HOZcpLJVp10O/8FJvBxsSvpYBNz0Rb4Xygnq1O2C79Z/YCTuSoQ6KcoJXWz/k0gpybOjp+mIkwz9h9Tcy9yjF+V/vwCVY1AM1Idv+G2/pijRA1G70soQ/q3maw0AlwyAq3B6qWrErYHEFGTawEw6a6sH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2o1/4BVpCLm4BN6vau9DD8wqbviV4WuTmMYGmfp/kY=;
 b=TIRVQeLu1PNtspM6nTkqXjNYfP1fTe9x2fZ3SiOCc6KCubGk+hGEUxMRVUmqAQzJdmQBKJ4hEduunL8p3XnHNLtDuCkGctbBu8EB3B7/hwVwl2Qgwbxx3EL0BctAVsuBIfXUbEJWxf4lsJ/ge5CoQrorQACDWDtCQFZSyZQKLoq/4XwJXi7girdc4ngAbBKF+etd429/fuD8Tp+Sc8OdQ/XDd2rCKHLjpF4JbGx9HbkESgezeJZOJYHlRu6XK5o5UOs7APmFY3ZuOB4tnc2P5OSujuLKZkvBeeyyShSVO30OwSK9Q5S4RZKjtXQeVeS34hxer2KncPGVVZgFb4S0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2o1/4BVpCLm4BN6vau9DD8wqbviV4WuTmMYGmfp/kY=;
 b=WjMJgpkwwxQOShdiVzbU3la37BUvlXX/cbZGtuVYt9fCf2OAMgnJHN+2d+mzfmjT74oDvgiEMLr8lh4YHJgy3MeRi9qj00tzA7nYUgldyh7qLpG3k4hvUibI0PbBMYuwtJttlX6LEcuhCN2gMkvZyAZzW18QdG5JCtYUA2eG3WM=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3558.namprd10.prod.outlook.com (2603:10b6:a03:122::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Tue, 5 Jul
 2022 18:25:22 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:25:22 +0000
Message-ID: <eecacf09-ad8b-aa3d-48fc-8a96817f7cc2@oracle.com>
Date: Tue, 5 Jul 2022 14:25:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+jXCrtggu1myigkmOVaw0DBAcSHNS5KCdP7b=7b7NC8Q@mail.gmail.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1C+jXCrtggu1myigkmOVaw0DBAcSHNS5KCdP7b=7b7NC8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::20) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11e985f2-f79b-46ba-61dd-08da5eb3b88f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3558:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnrOk7Z5i5SK1tg7uB4mLklhW2WIDof4Fid0N+bITvB+CQ/dVz2vheNZkhkG3fznplxCpbtrXN1ZP/tD7E/mZtIikqE8DfyjbW9Mz5g51qZil9oWGKm00dQi1N2u0WPwoaktvTzQcHvlDyCfQAevo9qfMFxFMssoHt245H/3mULOoGdxXfLkK3umkMO7wDGmPcJYYWUTJZ6w0szxnEKOfmHs1oUlOLQwNVy+v8eOFdLmKopKclAKVbTu6Qa9PbFj8adPIzDfh+C+mMd/dpCuFTTn6JkcjVEMUhTZTGehzn12EG29JpNbim/TjDGUDLu8y/T7GmL3lligP7KSgOiDBLTHz151JMs4kNf2euVpFHVijwIJAm4Ib2D9spRQmX6izR6GL7y6YpZgMEWoFdTzXkSQmIaQvs9fuun/9U+YpRtyLBEw7x3zYbkQwiVEro87n2FDPsqdNO3WVwb1GhycK73dbPgX1N5eRyYtVs1qBND7UGqgCedrnHce4QwUerEC8IF9S3kNd1RqV8iJoNDMJ4dgKqnVHXClHwhBA+wZ4uO9xjyPHGVh1XaiXqqA69gwe1Y96K7TdCFBA3a3t16R0auvC6dL+UdXzu068jVvO/FuLZlo1FW47ZOGL9vmdSq9ErvbkMBnl7fKrzvsUZQdx5MvTi2bFEZlatp8qBpZLl72KM9K5PPHbX+q0n4LieHQqNGEXqbs4xjGc3Omq/uuy8f8/ZVSaGeerzodbFTe22fXd8DbcH4ejgtYuL0wUMqzXs52Dk/SPSEj0JogYimBgK78wZB9nPqG78+gEh0IVxkifKIRGaJOx8IP5qkHhNpOGebzBxZjadBlGu0EmzHVWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(7416002)(44832011)(478600001)(5660300002)(8936002)(6486002)(53546011)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(6666004)(36916002)(38100700002)(2616005)(186003)(66946007)(66556008)(66476007)(54906003)(6916009)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZhLzJ5MDFKNERXSnFKdGkvS2lzTlMxWHVHclVhTHBqVWFyZmlBb1paWk45?=
 =?utf-8?B?M0pNVHRQdnNWZDBSNVplNlRMc0V6ZzdCdzlWaTVGMlVDL01YcXNFOGtmZ3J4?=
 =?utf-8?B?Z0JOV3dIOEF5RGV0U21Fd3ZFbzNianpjcyt6NHl3Mi9iZnFaQ0grOStOOWhF?=
 =?utf-8?B?NmpCMDVVakgvU25FL09CL2xCU0VhZzluL2xuWnZaNlNxT1hVczBOajRGeVY2?=
 =?utf-8?B?RDQ4K3VkZGcxR1BhTEp6TnhNczlJakJkSkpvK21VYm1QcnJkSUFpL29BSlZ4?=
 =?utf-8?B?SGxmTzJ6clE5MW1xN2VKSEthd1FIUWdEdGl4bHpNQjg2dmVPWEFnZ0EvYjdo?=
 =?utf-8?B?eXo2ZmZ3eVJqSlYwTVNvRFpNandpQUdaTUlwQzZ2QXFReGpLZm9tYXY1dk1q?=
 =?utf-8?B?L2JPQ2wxTG41cDRTQ2tzYmYyMUpXR1N0QkxhcUFSdXYxK1hENDR1MG1ySjRx?=
 =?utf-8?B?Z0JvdFk5cCsvN1RvTjVRMVhSUDBFeDFVWVJlckhNcXhoUGpIODdzdGVIdEVR?=
 =?utf-8?B?TmNJdDlkS2x3bzlwb2trbUtLSllZRUdjYmNxZU51YUxBWXl0WG4rOUdZWlh0?=
 =?utf-8?B?SEVMTWVad3M3eGlZUnBWVXI1d1lRRENDVHM3VE4vZGxnMW9jU1RrbXZzY2tG?=
 =?utf-8?B?RlhwMUQyWkQ5MWJodEpsUHJIT1BvbjZ3QVZHZUYxZEtQMFR6bDFLanNlK2Vh?=
 =?utf-8?B?aDErcExXZEs4RSszVERYeTdRRGs4eXlHWitBRDNSL21LY1VGNGRYakZ5OEV5?=
 =?utf-8?B?T1FDMm1KSkhRMVZ0TjVLOHordWpuUkhKVzJpY2liWks4OGtJZko0OXJLYlNF?=
 =?utf-8?B?MGI1Rlk0Y3o0cmRjQlk5ZEJMM3o2eGVqU2Rxd0dMQ2lQYzUzQlZhOEpkb3Mx?=
 =?utf-8?B?cThvYW9SNXp5dnlzbnpFQWhrdkRiSnhWdlZBTzBlVVZBVGZWa1BzUkNGZ2RU?=
 =?utf-8?B?MnVQbmJUcVJwSFJYd1VLcVdhOFVFTDl0UTBPcjJQWHVUWGlLQlUxbmF6amZs?=
 =?utf-8?B?TVNZZnI1cXdmNkIzYWhsaVMzR0pCbU9EeVJvQjR2dmFoVTJWVVVVUjUveG5H?=
 =?utf-8?B?MWhlOUZUYW5RdFZ0OERVUVpIN210Y2pCM0F6QjBWVTVkVm1XQ3NIVnQ3Mm1V?=
 =?utf-8?B?c1l0TzZ2K2V3aVdSVDlzRjg5TmJUb2E2dUJrY2E1ckd3Z0IyQ3RUdUhxamY3?=
 =?utf-8?B?SHJiQXFGbmdrQTFEbFVmcjcycnZsaERtWHVWT0tQbUNLQTl4dkFXLy83dkRl?=
 =?utf-8?B?WWIwMmIwT0pFZ3IyNXNRS2VLbWpFOUU0RW12TE00aHJUQS81Z0NLQXVNZmVK?=
 =?utf-8?B?aVZBQTRQYlplQVc1eE84WXhFTmNKSlVvQjVVcTN1amV1ZTNjMjBsd0k5c1lJ?=
 =?utf-8?B?QlNlSy9ZTTBtZXprZDdVMFgzektJTm45K1BDNGI3b0UrMG1xMGNPclAzcWlD?=
 =?utf-8?B?OXJkeVc0WjBIMTJoSEpGMlJBeTNLNm9Oei96bnlvUVZYbUN2TXdobm1uRHpD?=
 =?utf-8?B?RlNrdTZUcTN6Z2l3VHdtN2dnRU5FV0djeTRWc2NpbHhBNCtiMDBUeFpUa3k5?=
 =?utf-8?B?cE1xSnUxRTBwY1JSMWhCT1IxSXNKV3NGVHVFbmFITnFtNEhNTDQ5bmd4K0lV?=
 =?utf-8?B?MTd0eEVLdkwrbmlkZk9uSU1hNFZyM1QvdVB1UURHNXNVRVpWU1k4Mkp2M1FC?=
 =?utf-8?B?Nkgzc24rKzIwNHVhVGZmMW5CWmZnbjY4RWJRRkJqWGFrMzJRdkZIcG0yQjJE?=
 =?utf-8?B?UkFKWkZISmYxcVNWUlV4Z2xOSWczUFIrM3Z0TDBHcHU0czkvM2Z5U0NaMmEw?=
 =?utf-8?B?SkVIaWNaYnJPK2J1Z0xsUzRPK1NjRVpZMzdYY0dLRkVaNVVwMnZoaSs2UFYz?=
 =?utf-8?B?UHRmSytoaWpZTXRvSnoxeEtSV3VHMW44Q3NzOEZmZFlVSkVsWUN2V3M3Sjc4?=
 =?utf-8?B?cG82R05qNU11NVRZSVZSdkM0bkRlemFIdnFDU2NzM2hWTXNFbldDcUNneDBy?=
 =?utf-8?B?QzFmLzZzSzRWVkRHL0FYN0x3dU4xV2I3ZWFZSW50dExwL0ozWkJPTXhIMmdZ?=
 =?utf-8?B?blN2L0NQTXp0UWIxWk1WOEt1VEpFK1ZNV3J2Y0hVbXBGRnFEYjU4Mi9ib21q?=
 =?utf-8?B?eDZHM2gzaFg0dUs1SFV0OWpxa01XYlNmdms5blRnak1FcGtGaktSSDBHQ1lI?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e985f2-f79b-46ba-61dd-08da5eb3b88f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:25:21.9751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOrYS5I/2tejT5vOGICG3nrFYEGzsALM+U9rU1jTGxDGQUab3veJCIm8HlqocOnl6xrkVBDc9pXJRFVEb9zQWV5C2HiC6M7y1Lxq7NV4YO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3558
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050079
X-Proofpoint-GUID: A5U-4WaFvPxNhCkvPohdDoKjGasWSnPf
X-Proofpoint-ORIG-GUID: A5U-4WaFvPxNhCkvPohdDoKjGasWSnPf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/16/2022 10:55 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 15, 2022 at 6:54 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
>     files and file descriptors.
> 
> File descriptors are not really unix specific, but that's a detail.

OK, I will change the description.

> The names of the functions in the summary do not match the code, also details :)

Yup, will fix.

> Eventually, I would suggest to follow the libc fopen/fdopen naming, if that makes sense. (or the QIOChannel naming)

OK. I'll use the names that Daniel suggests.

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>      migration/qemu-file-channel.h |  6 ++++++
>      2 files changed, 42 insertions(+)
> 
>     diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
>     index bb5a575..cc5aebc 100644
>     --- a/migration/qemu-file-channel.c
>     +++ b/migration/qemu-file-channel.c
>     @@ -27,8 +27,10 @@
>      #include "qemu-file.h"
>      #include "io/channel-socket.h"
>      #include "io/channel-tls.h"
>     +#include "io/channel-file.h"
>      #include "qemu/iov.h"
>      #include "qemu/yank.h"
>     +#include "qapi/error.h"
>      #include "yank_functions.h"
> 
> 
>     @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>          object_ref(OBJECT(ioc));
>          return qemu_fopen_ops(ioc, &channel_output_ops, true);
>      }
>     +
>     +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>     +                          const char *name, Error **errp)
>     +{
> 
> 
> I would add ERR_GUARD();

error.h advises us not to clutter the code with ERRP_GUARD when it is not needed.

>     +    g_autoptr(QIOChannelFile) fioc = NULL;
>     +    QIOChannel *ioc;
>     +    QEMUFile *f;
>     +
>     +    if (flags & O_RDWR) {
>     +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
>     +        return NULL;
>     +    }
> 
> 
> Why not take a "bool writable" instead, like the fdopen below?

I will ditch the bools and expand the function names as Daniel suggests.

>     +
>     +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
>     +    if (!fioc) {
>     +        return NULL;
>     +    }
>     +
>     +    ioc = QIO_CHANNEL(fioc);
>     +    qio_channel_set_name(ioc, name);
>     +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
>     +                             qemu_fopen_channel_input(ioc);
>     +    return f;
> 
> 
> "f" and parentheses are kinda superfluous

OK, will fix.

>     +}
>     +
>     +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
>     +{
>     +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
>     +    QIOChannel *ioc = QIO_CHANNEL(fioc);
>     +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
>     +                             qemu_fopen_channel_input(ioc);
>     +    qio_channel_set_name(ioc, name);
>     +    return f;
> 
> 
> or:
> 
> g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
> qio_channel_set_name(QIO_CHANNEL(fioc), name);
> return writable ? qemu_fopen_channel_output(ioc) : qemu_fopen_channel_input(ioc);

OK:
    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
    qio_channel_set_name(QIO_CHANNEL(fioc), name);
    return writable ? qemu_fopen_channel_output(QIO_CHANNEL(fioc)) :
                      qemu_fopen_channel_input(QIO_CHANNEL(fioc));

- Steve

>     +}
>     diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
>     index 0028a09..75fd0ad 100644
>     --- a/migration/qemu-file-channel.h
>     +++ b/migration/qemu-file-channel.h
>     @@ -29,4 +29,10 @@
> 
>      QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>      QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
>     +
>     +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>     +                         const char *name, Error **errp);
>     +
>     +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
>     +
>      #endif
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

