Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55807457824
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 22:32:09 +0100 (CET)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moBUO-0003Ba-00
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 16:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1moBSS-0002OY-49
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 16:30:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1moBSP-0004d2-Kk
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 16:30:07 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLL0hj027663; 
 Fri, 19 Nov 2021 21:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wOukgO24F0prciA+oHbeD9m8p7twVrVtpX9LhaOlqwU=;
 b=IpouqTLBMrEpYIhcfbitQv/8QHE9gvkktfXtG88f3vSEe+slBd8WtR6/LjHinXDaaYvB
 GySlRhmQXwLv3d3bAz91nr0A2e5DjOwh4fP2bZTEg41FTf33pLF9D0H4RSaSl61fSUXA
 nZsBATb23smUvI1Oo9ZWlRpKtSDU2MkI4Ju5agB+tS/ZUo2zPzF+vP67ST+Hs5OZjI8E
 LXShUaLY1B846Ioieq7n5U0VLZ5Is529Qfwb6ae4PrRQfBcejMYexzigfWbIp24VZXFu
 U4NtVUZkE+qjL8/e2J2NecfTxSn2ysolHoEumSsjoLXBq+zTu/Cbw/DWHa3WNfSkGsKL iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cefpbhkuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 21:30:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLKOg5020527;
 Fri, 19 Nov 2021 21:30:00 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by userp3030.oracle.com with ESMTP id 3ca2g2wcr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 21:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFcHmzKGM8oUztN62ykMKiEZ/Vhep+Ejibcb3Y9HFs8uRXZj0o48wyAJN9i18dng77+X3zfV/R7bbflqG0seCRdrBCL2OHOZvqBNbqjWBMAiUf+vDyyBRDpEm8DmN0lhDXwEOIf4TCL29D22dXmEMllBEE7SMknbcDFWODagcaz/J0hXNApu4gjzfaUc5s2KAZKE9jPKpnsYEfDLv/dSKHTA1hqXsFxkwL/5LTMHHH4uFeLwy8S6QKEiBpJtLDc98tLAim7DMlgbT0YqhMD5phtUAjhxTvbKg8iSZDBR5RidcGPnHhvrURnzHFRvwRBR8Sw3EVbEf3tI1NfBiqWRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOukgO24F0prciA+oHbeD9m8p7twVrVtpX9LhaOlqwU=;
 b=EZO41K/HM0AdxOWSb75FLJB8AmUwzTGPrfpZ+6s7dh/YtdQU95BRCxpJzWXQQB551ORZr2a70t1tAksCfCxuTO7zoTmz5LVigGyyZgNdSnEBu1Fes24LHRFYWalnR+WHy9Kx3QDO/4IDX1T3SokIeM1MiMEjAUcdqOj04yxoTafCef70Tu8erzD6yx7Zcfoq91hvTtHaThGHcilVxq6jkSzUcZhfDbkxiFgZq3Kg1buoCp3LGSqGnKvGZ2AromUAaACjvIhlPbsYqT+RRkH4AKFi0vFE0WMHS5e+EaGOP3cp4Ji0RrG7y4pcUM1ha0T2kd7EFVLp7mTqeGn2JQxZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOukgO24F0prciA+oHbeD9m8p7twVrVtpX9LhaOlqwU=;
 b=RgR9fWcKcRqPDJDFSwmIHFgT8xmFU6vJb9v00bdP8iY/ApRl56YOYlvs/LuZzqW/HtpOPzZnRU2aBzGZqu7v8Tyk0rIvP4lYJMRylepgV3Qpi5cp7VH+AXZONn/uXEnGI1B3UDX6d8p1GRKKOPTYDTw18Oj/RPzLP5UwG0Wd9K0=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM5PR10MB1643.namprd10.prod.outlook.com (2603:10b6:4:6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Fri, 19 Nov 2021 21:29:58 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad1e:561a:5e55:5f9]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad1e:561a:5e55:5f9%6]) with mapi id 15.20.4690.027; Fri, 19 Nov 2021
 21:29:58 +0000
Message-ID: <a2b670ee-3511-598a-05d3-d75ab8c127ae@oracle.com>
Date: Fri, 19 Nov 2021 16:29:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
From: "Annie.li" <annie.li@oracle.com>
To: kraxel@redhat.com
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
 <YYpE8zhRR2WWFl+j@redhat.com>
 <CAARzgww63RpHB+40q5=qzy+V2ZoJs-FF1C2WAz8TL58r2dwJ7g@mail.gmail.com>
 <YYpZOeZkzOa5dB5+@redhat.com>
 <59be6397-57f8-cd0e-2762-0a3f8b9b4a05@oracle.com>
 <YYq+tc4dxqSAjRCR@redhat.com>
 <26a03074-1086-6fcf-5810-4f9c130d0342@oracle.com>
In-Reply-To: <26a03074-1086-6fcf-5810-4f9c130d0342@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [10.39.230.4] (138.3.201.4) by
 SJ0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:a03:2c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Fri, 19 Nov 2021 21:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aa69e85-f735-4512-1d05-08d9aba3bc53
X-MS-TrafficTypeDiagnostic: DM5PR10MB1643:
X-Microsoft-Antispam-PRVS: <DM5PR10MB16434CDBC723750F9830FFEDE59C9@DM5PR10MB1643.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEgOYwYD7/a/Sp0Pyc9EQRYCOI4Lnt43llYHyY74AS16Q7v+qSnRNSAPimw4qNY/6w9Jo52xpWU33aYwsRtbZFym9Q5Tf2LXF91ivrSGJzxIvMj/yQ09soEHzhFM2ItNsThBtm+RyXC1CU8zfSj9zEZZJTzyxP+XWNF9AgmlUYtGMTow4QJPbjoXtSZAx2RSCRqgPFsEpPdAY3Pb9oL7K81rh7T6xivR9pXWJ13fa120b/n6wVIRmkH1QzwxDpx0bmortrtieaBKrv5SZhu69V2Uu/gyeYe2T/6OzdIgCGjSyAYxOMN1d2TGvnJPYO/SOEPt5AXXcy+F8B6QUnTHFThbBJm1LcHGVsdvh+GcxPkVlGbZFwKgFXwRpfR5RFlQrlQHdb7eQ/VZ2xthDSKOdoxG1WUj+3r3xiNb7cUiHFQHEeDTTM1OpT8ghPPm92a9s0k0YB1Kygr5AUOxAwWqOYfzoznvsoqkMnWXJ7jINgco0XaUCvsqpNUO0Ahkx8ynXLXBF3wGbd2SV5giaMHZk40qXq1IOFD5N0PnW/v4Ga7S7US2QaxxiQ1qNCtQCOIxKQ6tATeW4k0H9e/dqcQpeAl1sp4SYp5MhEzZTMsPqrwYRiw8j5Eo2i+6veYyvIiFqv5igTK5cOujYLsXX2/rPUGgrm760+QCIB3PuTKeNhdsVUoqP39Qu9gEIxPb4xdrGIXW1clZACUGZleBsM9cyobgZKGlmm4aZCJX599HJ3GE3uixHnLaABEfqQSeWKhucloYyJ61iCFgGYbQsDHQ0GXZieRSPuD6LPfAAvJNjEL76RcnkYBaC6xVPYAhK8R/rj38+Mf7kyUR69fFMXbFp8O9nhUixrGrGTET6xAvd88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(66556008)(16576012)(316002)(26005)(2906002)(31686004)(86362001)(8936002)(8676002)(54906003)(5660300002)(36756003)(186003)(53546011)(2616005)(4326008)(6666004)(956004)(38100700002)(31696002)(6916009)(508600001)(966005)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRZN1AwRFNoWHY3WUlPMWZIUTlPaGFvRWEzWlpxWHl3U1VrTTdmZjdDT0VN?=
 =?utf-8?B?enNTdUY1ZDMxclF3djFrN3g4MmlnR0RTYWZ1MzgzL3N3UjFVNlJMc1EzY216?=
 =?utf-8?B?U3N2MEpmOVVRMGo3dzBXTjVVT0ZBR2FzQm5aVUtwRWJudjN2T1hBb1VmaytZ?=
 =?utf-8?B?M014b0hPMjJKWFBYSUR1NU8xTkdnRWV2QzZCV2JvVlpUN2FKbmMrUEZROVRm?=
 =?utf-8?B?SUNZT1M0YnRZWHBtejNwQkkxSmhMUTQrM2FnWkQrY292RU84OXpHN0tWNmdB?=
 =?utf-8?B?UXJmejVFMk5mSFJkVlo0cmpuY1BKRXYyZFRIeVFqNGN6SFA2VUJuYXhHYlIv?=
 =?utf-8?B?TWxaeXhUd1BkczdlWWR3eDZDMllPblVTaGMxQ043a1Mrb3lDL2JYa0dWNkZD?=
 =?utf-8?B?VitzTktLaysyaU1kcnFGUEF5ODRtQlBCcDI5NHJyMWErUFh2MGtzZVdRTS91?=
 =?utf-8?B?Y1hhbHluY3RJREtRY0g1ejZqUkxJb3dFODRjQmQrcTVxRlVSb1U2a05DMTMz?=
 =?utf-8?B?VHZncjJUVEtZaVZpV3lYL0FnUmYyVTduUGFib1BkVjFwSlZubXV6WmhOaWJq?=
 =?utf-8?B?RXExcXVWd2RRUXJvZllEYmlpcFFPdG0ybGVlclNmMVFqK2g3V1pzN1RibkNZ?=
 =?utf-8?B?NVltSEdWci8rZG00ZnRTcEM0dTFEWGlZdTRZRUpjQS8ySHRtNUc3NENIelVL?=
 =?utf-8?B?N2VzdGJ2TXg0WmxkSm9pNzVjOEJFM3l3V3NUUlIxQTNieEN3RzRuZzZzRFlQ?=
 =?utf-8?B?eW1RK1RyUzR3UzJBS1B0MGQ2aDVmUkNzczk0cE81Z1dsdkVyQnViejlBRDdO?=
 =?utf-8?B?VlJYQWdZQWJGbnBwb0hlQnhHd3NyQmhYRTZPZ2JWYTl4Y1RaekNGbVRSSWJO?=
 =?utf-8?B?MW55ak1CL2syb1dIWmNoZnNtVW5Sd0VnbHhWT2Y4Mk45dmRWRy9MNndobm1j?=
 =?utf-8?B?d1Rza2sycnQ3dDVlSXprOHY4M0xnZ0l1MVkwcms1ZEloSEFhZkg2dWsxaThY?=
 =?utf-8?B?K3VoY3VrNWowc2k1cW03cVhBNkgremxkRVp3bFpRdEh4c3BTa0U2dFpnMXJX?=
 =?utf-8?B?dU1pVEMwbGl2SHIxZHZnNmtrbktXUlhmUldOVkRPZ20yZjNiMitHUTNrdlVJ?=
 =?utf-8?B?aDZhVWpMcVNlTnRYRk1URFVvYmVZbDZ3eUZ6NTA2MlN0VDZrOFBSaW9yS3dU?=
 =?utf-8?B?akFEclo0QVVnRC9mM2JnK2ZkcnpTOC8vTTdXYmJUWStHZDdnQVhjdVhmNkRP?=
 =?utf-8?B?MWZrTlNwU3o3alBzZ3oyakNUbXVtSEY4ekhoNkdXNjVtSGdFY0hVdHZscVE5?=
 =?utf-8?B?ZmcrZm0ydmQ3UStSR0xYUWRUWjRBbHRnUWlvWlRXZDJDZUNRSGtPdG9vRW51?=
 =?utf-8?B?SFZnRSszTFdheVFqTGsxeThTZldFMWV2Z0Vrb2lMeGlqTXNjUUx3VG1raGVj?=
 =?utf-8?B?MFQxa3k5SlgvQ2JIU1hEUzh3QmtPU3RldER6NEpJaWZqRkhUZG9kTmxMQ08v?=
 =?utf-8?B?Q3Q3c2tmN3diVGQ3d3Y1N0prcm1USnB5ZEdnSzhFSmppMjRsWGc5ZktkcVU0?=
 =?utf-8?B?T041MDBXUTZxYkdZZ3d3eHRaTnpMNW1BVVVxaHZQT1VCRWEwWlA2aVNRZjVF?=
 =?utf-8?B?eUx0NDBJUEV2U2ZvdjhGSyt4TXhZaldBNE9memkxYUtWQnI1VGc0UXMvWHBp?=
 =?utf-8?B?Vk5IRUtCK2pCMnhBT2xDR01EeHpzaW9YbmY1Wmxma2RWRFl6Q1o2UWNBemxx?=
 =?utf-8?B?UlJiNGJZOTVvQUJwY1dDMVVNSXRYQnRodUs2RDdtZEtiY282RnBNb0pBV201?=
 =?utf-8?B?ZkdBbld6NUg3V0Z3NTI3aDlSTis5WGRGeHBtSkFqOTFRUWNPTWhjQjh4QmNx?=
 =?utf-8?B?Q1lHU0h0emVuNnhtNWh4Nk5sanUwbFliTWxjUkVQSXp4UzkwQXdiYjJvY1Vk?=
 =?utf-8?B?dWhNcTdXaWtrNVBrdjlaaExYeWUwaWhtNk0yb0k0U3JMb2hqUm1kbWFIQ05h?=
 =?utf-8?B?bW1KaFFBUjAyM2NKeDhWZ3A5UllleVpnZVJNMVp6UCsxQk13NVExMlk4RDEr?=
 =?utf-8?B?SjlySHZYRnp4RXVObUFWMTBleU9ZMk5rcmlGUlBSbVNubXJmZTdqZVZnTk94?=
 =?utf-8?B?OHlnTXJiVDE5NHhIYnFnOHVZakU3KzhnVTVsK0hpZ21EVGc4cm1zOEVtRW9L?=
 =?utf-8?Q?6EcqNW7nCumfe3jGB8dXTAw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa69e85-f735-4512-1d05-08d9aba3bc53
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 21:29:57.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suY8dVrFIJT+OlZ3skiGY/OS2sphLkwVhePIC1CgxubwDcZoDSz4ChBUFdwDL8YZb16KHJxrLC809kvTo1AhHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1643
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190114
X-Proofpoint-ORIG-GUID: TdCUiqnuKY7KrdU6gQ-5OXirPmMJk94Z
X-Proofpoint-GUID: TdCUiqnuKY7KrdU6gQ-5OXirPmMJk94Z
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, "imammedo@redhat.com" <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/10/2021 1:12 PM, Annie.li wrote:
>
> On 11/9/2021 1:32 PM, Daniel P. Berrangé wrote:
>> On Tue, Nov 09, 2021 at 12:01:30PM -0500, Annie.li wrote:
>>> On 11/9/2021 6:19 AM, Daniel P. Berrangé wrote:
>>>> On Tue, Nov 09, 2021 at 04:40:10PM +0530, Ani Sinha wrote:
>>>>> On Tue, Nov 9, 2021 at 3:23 PM Daniel P. Berrangé 
>>>>> <berrange@redhat.com> wrote:
>>>>>> On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
>>>>>>> +gerd
>>>>>>>
>>>>>>> On Mon, 8 Nov 2021, Annie.li wrote:
>>>>>>>
>>>>>>>> Update:
>>>>>>>>
>>>>>>>> I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works 
>>>>>>>> well in q35
>>>>>>>> guest. Seems this issue only happens in q35 guest w/ OVMF.
>>>>>>>>
>>>>>>>> Looks that there is already a bug filed against this hotplug 
>>>>>>>> issue in q35
>>>>>>>> guest w/ OVMF,
>>>>>>>>
>>>>>>>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2004829__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ8E_c_jRg$ 
>>>>>>>>
>>>>>>>>
>>>>>>>> In this bug, it is recommended to add "-global
>>>>>>>> ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu 
>>>>>>>> command for 6.1.
>>>>>>>> However, with this option for 6.1(PCIe native hotplug), there 
>>>>>>>> still are kinds
>>>>>>>> of issues. For example, one of them is the deleted virtio_blk 
>>>>>>>> device still
>>>>>>>> shows in the Device Manager in Windows q35 guest, the operation 
>>>>>>>> of re-scanning
>>>>>>>> new hardware takes forever there. This means both PCIe native 
>>>>>>>> hotplug and ACPI
>>>>>>>> hotplug all have issues in q35 guests.
>>>>>>> This is sad.
>>>>>>>
>>>>>>>> Per comments in this bug, changes in both OVMF and QEMU are 
>>>>>>>> necessary to
>>>>>>>> support ACPI hot plug in q35 guest. The fixes may likely be 
>>>>>>>> available in QEMU
>>>>>>>> 6.2.0.
>>>>>>> So we are in soft code freeze for 6.2:
>>>>>>> https://urldefense.com/v3/__https://wiki.qemu.org/Planning/6.2__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ_pKO8AzA$ 
>>>>>>>
>>>>>>>
>>>>>>> I am curious about Gerd's comment #10:
>>>>>>> "The 6.2 rebase should make hotplug work
>>>>>>> again with the default configuration."
>>>>>>>
>>>>>>> Sadly I have not seen any public discussion on what we want to do
>>>>>>> for the issues with acpi hotplug for bridges in q35.
>>>>>> I've raised one of the problems a week ago and there's a promised
>>>>>> fix
>>>>>>
>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ-np8GcUA$
>>>>> So 
>>>>> https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/641__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ86xk2gtg$ 
>>>>> is the same as
>>>>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2006409__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ9crT9JKw$ 
>>>>>
>>>>>
>>>>> isn't it?
>>>> Yes, one upstream, one downstream.
>>> Thanks for the info.
>>>
>>> So q35 guests with either OVMF or SeaBIOS have different ACPI 
>>> hotplug issues
>>> in QEMU 6.1.
>>>
>>> As Ani mentioned earlier, QEMU 6.2 is in soft code freeze.
>>> Today(Nov 9) is the date of hard feature freeze.
>>>
>>> I suppose this means the fix for the issue with SeaBIOS or the 
>>> feature to
>>> cooperate
>>> with the coming change in OVMF won't happen in 6.2?
>> Patches are allowed if they're bug fixes. If a change requires 
>> coordination
>> with an OVMF change too though, I think that's going to be difficult to
>> justify.
>>
>> Our fallback option is to revert to native hotplug out of the box for
>> QEMU machine types in 6.2
>
> Nod.
>
> Just make sure we are all on the same page...
>
> It seems that reverting back to PCIe native hotplug for 6.2 is being 
> discussed
> in bug2004829(https://bugzilla.redhat.com/show_bug.cgi?id=2004829).
>
> If these PCIe native patches posted by Gerd Hoffmann in bug 2007129 can
> fix the various PCIe hotplug/unplug issues, that will be great!
>
> At least, we have been seeing PCIe virtio-blk/virtio-nic unplugging 
> issues,
> PCIe VFIO hotplugging issue with PCIe native hotplug. Anyway, I'll run 
> tests
> a bit with these patches from my side.

With these patches of improving native hotplug for pcie root ports, the
pcie unplugging issues are gone from my side.

Seems these patches have been upstreamed already. Thank you, Gerd.

Thanks

Annie


