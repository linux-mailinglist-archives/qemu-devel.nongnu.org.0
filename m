Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A26AE360
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYiE-0006Gr-0L; Tue, 07 Mar 2023 09:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZYi7-0006Ft-Ho
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:54:39 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZYi2-0003m6-2T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:54:37 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783unJ007683; Tue, 7 Mar 2023 14:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vs1djTLCSs89E02F4rtLVWsyquA2vUIzdewcYeHJW/U=;
 b=dPMkDjJJ6+gYAvONVYkQ74RphRk4mDVJTHR28seG1/VejM7UniaNgBeGnjobcc4AFd/2
 tFk6MH9W68j7tt2tILMa48SR5NrN8okac/eSI0CmOgLaFO51twDSdmkbkatWc9qapVfk
 B6z13PSbO0aGNfwy8e4lJxH1U/XQeUFDuLCvMT3Vvs+SBnFdXTcPjtMzuwyZjZr5iKL3
 4JsDriYmbWxSkToj2RtQCvTpcrABW/NrXIvDZqgWZ/EfPpoTsMXOlxblcVoRhwNfyL0n
 uZbUU5/b1yyGC0a5fy9kluFwY3BOCe/4/uclVCZznmHyARAo5C6Zz97iIClvCiqx+aKl 5Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn91yrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 14:54:31 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327EHqkB011174; Tue, 7 Mar 2023 14:54:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u2hvppm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 14:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIz/mv6+ti1ibm7O+aPv/uqhKLdWyoRCwNu0Lz4uHeEQkaorB7b2S92v+Ybdz5Rd95jnPVAk20kYV9zdeeBLltq9MYyQ0QvpNWXlzm2+vJ/4DTKc3bkrqTZgUNJWFNqNKiR7tc1pyK1sV5xshAQ24FLQNB+MNK7xgYDHHLiMQYM85v0rG8o4pjta5FVVGnYuq29Iu0ZlxoowW3dkPFn/Up2rG4is+yXg2/TWkwTdfZg2BhsfsA2RJHCOXibWbNq2ZZyJX+2SOvurVbihtPExzR+cIwiaX5cTZFakPfndLoy/MXqM9ZJcdxGVruGDR9tqIsXHEF43ghh6+PVDV0VDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs1djTLCSs89E02F4rtLVWsyquA2vUIzdewcYeHJW/U=;
 b=gTYhD2g7m5jzvIrHFeCJqNSH4HYQd8+TrF3PC7wWzcOp+X/37j35RoeTxnmP7yqkFJFotEghB94vYpDTLSOBBxIxcINUVR08YeVrfMF8cIENh7MpkehYcNcHCTwJcd0xrVDElKg0BsGQXNEGGDZetvvb3aEFQibP+ubm+2qd3xVSf7FUFWbRav+0kiOyyO7JQ9SWqPGfOBQQr2ejLdRPfNCF+rPMWqgH4q2a22VzRE9VqPoAJxgWWVfsIQ7VvN/KcMUVRHQXx8jtR73gqPgPSjrT0/kvhpRwHnpr5BVC+G/PMQCdWtst7F1BpDIrq/cLMqiYWaOHs/zrA+zK4/VKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs1djTLCSs89E02F4rtLVWsyquA2vUIzdewcYeHJW/U=;
 b=QJo+K7sEtVUPI5pmRLBDlrhlM/wsSLoDnRTwQ4gkpOV1f34KPXh+qaEGTfZVFnQRtM9wKWt0p2Iwul9PrCYxf0uvLRPTeVoS710rzmG1pU8scxT8ZRjXUbLdkK53FbFlMbsi7v4mu+wXxICcg/fSySVSEv5HFlgzALW7nIKg2qE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH7PR10MB6967.namprd10.prod.outlook.com (2603:10b6:510:271::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:54:26 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 14:54:26 +0000
Message-ID: <5cc59fab-90c4-7e42-51d2-ce619636c792@oracle.com>
Date: Tue, 7 Mar 2023 14:54:20 +0000
Subject: Re: [PATCH v5 10/15] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-11-joao.m.martins@oracle.com>
 <f58e2f7f-e763-9e03-91f8-6a7ba9bbcf79@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <f58e2f7f-e763-9e03-91f8-6a7ba9bbcf79@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH7PR10MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 365717fa-4e57-4e4b-fbec-08db1f1bd8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZnSbfnBbCbrk/OfTpeKRbanHEQ5Bg6pfH/yyLfTvOzkCjPuvptNi44ZK9nR4RDmuoLuxBCs1DRbgzw0/MMihs/Tkjfr8BgnmrleyocRVJSigu6c4XWuN+X9is2yQgRrWxKTfEx7/HWuLD2o/eUJ26zNEsRUWIl+X624Neplode8vsw6FuzlTSrpicqEOCEZWiBcUjRVYyJofGfF1AIgY/1nbFJ4SnwwxX9xR6V8Km8iLtJAgwjaqYnpgHcXxPBA+UvHkVaC8HjcfiSxg2Xqcb1a67wzC756tYiwPkjc62dPb/JIuDK5qz5yJXle4ZK/FwhHZq18iZ1RzG1/3DWvLJkeW97Wnxk3I6BXcJB4WyrH1ohK/ayg1RJReiGo5h9tH/IBeMg66G7HVNFiZUiNGdn0INU7oIRPs8zeO0Q+/Eofn88SpeLz1LKEKVy4I/D2T2S+fUm66Eon3syAmnei4d6C4E2wEaLkk4FBm+ShMwQ1eqkjQB5cHeeg8VfQubNb+MrqWHr76Osq7C/IThDiMZlgxgbauIFmdOKqyiY1bQ/nN3PeAfZicdMUSNn+lZqTVpi1anr93NozJzSpDYIAAe9JJthvyrlcjtR8e/q99TtG250DD/ZdM0RhgLepHVJ+VaZAV3KjnIp8xxSVo/cxl9MlksZNS1C06P2KCA7RbctZTsJxkN+j7GIr5Cj4iACjmJHkz9t9r4nm1PgB8yYVwsEeIFAZVfyMHRayAQsO/1AYWYG2iWYHnNAjGv5jKuXM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(8936002)(2906002)(31686004)(5660300002)(41300700001)(4326008)(66476007)(66946007)(8676002)(66556008)(83380400001)(6666004)(6486002)(54906003)(316002)(6506007)(478600001)(6512007)(53546011)(66574015)(2616005)(31696002)(86362001)(36756003)(26005)(38100700002)(186003)(14143004)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2FJL0YvWlBRTTBvekErMEE0bUJ4dzBKeGl4Vyswa2hIenVpUys2VFZpMjBJ?=
 =?utf-8?B?YzRaZHRDNkUwRHlDenRmbmN1SDVPd0xSUnhLcFRibVUyT1M0NlkzTGZxWjRq?=
 =?utf-8?B?eEhYS0Jsc3BWS0NSZDEycTF6VkNoWk1rNE1zOW5UWWdrOFRwVkFnQTNpbngz?=
 =?utf-8?B?aHhmN2xoOFR2UU1PeDljN3hyRzI4WHZRSEZ2QkdnM2lET1ZqeU5RNEpjRTRh?=
 =?utf-8?B?RStBQjRjbFhZdmJLdzR4U0NCaWZZZDRXbFpYTUFiQ2Y5MGZDckhubHBPc3NV?=
 =?utf-8?B?Y2xTQlZoOWt4OVM2QWx4VEtmNGpTTXoveU4wYnRJaitvcnZpMFg2Q05zY2RY?=
 =?utf-8?B?NUVyVGc2b0VVNVpYWm14Mll5bDBYRUorVGo2REpvckxnNkVidG9kZjJWVHR0?=
 =?utf-8?B?QXhyWXFHVjEySFp2dlc2eElIaHZDaFRlT3RWZnhqVGNyZjdFWko5dGRROHpr?=
 =?utf-8?B?bmswdnZLOHFiaVgvYjE0UW44MVlHeFVkK1FwSlNjWFdBVjMrcWg0MkxaLzAr?=
 =?utf-8?B?RjgzNjNwbjlNWCtjWktuMG5laTkyT0JEdmFoVSs1elNNVEsxMndXR2ZOanJJ?=
 =?utf-8?B?ZFAxMU9QTVF3VGlacThRayt3VUF1OVQ2MTByYzdTT09hV05PUXFzclp0UW1V?=
 =?utf-8?B?b2E3eThoM3l2eVAyaW5xUDZwcG9jclZ4QlhPRThxUWdKRVk0Q0lVWUc0WkdJ?=
 =?utf-8?B?SVhGbkFKRUdMNHNCZ3lRN294b2k3QjdZVWtXNGVzOWVsdFk1TDQ2NW1ZREcv?=
 =?utf-8?B?Z2RVQnFrWnlGWjFtQWw3UnRlMFk3RGVPY3FuQmx4b2tBbk50ZzBRZjVhQm1S?=
 =?utf-8?B?SnMyb2FtWmoyWTQ5aDd6RmtCc29KMkpMZDBORUlqb0RqWmdOV0h2a3BCYXJh?=
 =?utf-8?B?dkFrTUY0L0k5K0dsaVdJeVVGZVA2ZVBjcDkrVk05dlk2d0tnc3RxNzFGengy?=
 =?utf-8?B?N0MwVmowWWl1dVVIOU4zUkJWdXB3NDJNQkhSWnpWa0VEUzJQNXRmMmNKUm4v?=
 =?utf-8?B?MUZkazNGdVBJTC9zVFhIT05IbkNlNnV4a0lwS3B5T1RRdU5Qa29zR1dhMGtk?=
 =?utf-8?B?bEsvdjZ4SmRTcXAvc1VleTBVbklQRjJQN3FqU3dOb2JhZXVHSU5XSm9nWUdS?=
 =?utf-8?B?OGVVc0RNNzREQXIzNDRJbDlqSGcvQ0I0d1dnZGJ6ZUZjMUdxdWVFWVBCeGZP?=
 =?utf-8?B?ZmdGc2hCNHdUazVUQ29BR3J6Z3VNYmZQcUYzN0xxV0orRU45Rzk5RFNDcE5j?=
 =?utf-8?B?b3pHTWowdzFwOElZdnRKcElJa3NwKzI2Z3kvb3RwcUc5TGJRQ0lZM2JySWJt?=
 =?utf-8?B?NGx2OEo0cGo3S1Y5NXBwQlhvbDR3MUhOVXZXbnhjUTJsbUtJRmVjc3dmaWZE?=
 =?utf-8?B?KzhQN29TaDBJQ0FOaTRYZHF0Y3NhNERwREpvYWs4TTdzcFlKbkY5a1BBd2xT?=
 =?utf-8?B?ek9ZSzF2Vmp5ZW9kVW5OVHpmaDBBcnBsNFFZUi9lb0s5eGpMYXd0QnVkREVr?=
 =?utf-8?B?VklFMGZTVDFEWVVqSTVUK0NxYnd4RGNvRGY5Z21qeGFDQVpYSzlXbFZiU3pm?=
 =?utf-8?B?VmJiN1M4Y2R4Rmk2OGUwbFk3Smw5MzRDWmt0R25TMW5zZWkxUmcvWUJFMTha?=
 =?utf-8?B?WEpnRm5lRnp5ZjdNdW1ySUNtSXlvR0tMbTk4R0FZYzUxeCt0dW9jeU1oUXg1?=
 =?utf-8?B?QzBoV1I5Vll6THhzeVpONjF1emNKcU1hYzFBem9JdG1qb2Z2WjFIeXhPM3dn?=
 =?utf-8?B?TmVJRWsreThEY0dQRFU2ZWRtRldoZ3kzc3JOMzRzdlA5aU9qOWdSVkhQM3ph?=
 =?utf-8?B?WjU4ZmhTS1ZuZFFIV2srYnR2WWx5QjJXL0NHZXhvWkNrcVorR2FqK3VxcERj?=
 =?utf-8?B?ZHlaOFdTb2N3c1JCUHJibjREa09jZ2ZxampyTHprcmloYTViWGtkelJDUnlz?=
 =?utf-8?B?OHFvTlNCQmpZZTZkd1FVTVpkbGtWd2VGTCszYnlFVTNTOWFUREtQdXdFaXhK?=
 =?utf-8?B?ZERvSWVteWxsZHFsVWFPbTB2MFVRWTFFSXdFYVF2bE5iZDRucWk2Nm9QNVpp?=
 =?utf-8?B?Tks2UkE0eTVaRWF3ZWtRbHhRY0ROWWdTbVp1MDE5L2UvU2RYRnJuZk16czlI?=
 =?utf-8?B?Q09tRVFlOE96VDU1Z3oyQ09QUmJ4Tm1SZ01GNS9mdVJ5U0VmRk9tTFFRWWd5?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dRUJP9MJrCzzmu8Nc38mvuqqlQZnpInycZttMnbWMAGAMARzvYLItG46dv66xJ9OzzQqehOC2/Qwjh9c6f7ix+mFlSlc6wHyLULNYSOhPqepmtQ+xTe2IVB2btgLfg4kX9LYPxKrAPHGXQMUIJ/0Qxy6jMCF3XUnxMkFPNBiEHBxOb6KKLZ5K/Wc0bLJfU0144no8VuTB5pNYIMcEXKswZKJs0JDSYLnKMukC+HxvJPqlfwnzW51qXR3homoK9jtFeU9lGER492ycCtabu6sDGhD17lEGBBG42cTqgx2uN/5JcXpqqSZFEynwYY4oQwd3WVTkm0wQITuZsbElSNd4Pser+8FgOb7ycz7J7N1Xzrufd3+FEkljTyDOLJOYLQX7FGNVqxZTMO2sYdMR/+Wm/uxTkh9ks92yBP2wWJYgEAErEeacdRqhcMZEfr5uLVkq2IKxWWiI4Yez9JRsC8gO4Ra/led+jnkjCI+a4JrhOqPV10gOh2gr3W7amg+8kC6fu3IZQ2Z5YP5bl3XHIonYEDVH/WZfQ3bG+ykIwOtSEIYOxSoJfLOckKkMcxy2CS9Bbs92RNoSHNoDUm41CY08HPcMBq5fuICcNUtCIZEqu8eGWriM0Ve+wfPeRCTm3gRknc2jA/kGB7lBS3yYUCnOf5RU87kIEvmj2wNEKap/uRbI1zc6+nPtogYplLtpRCTNLXFsXH1mK56viWsAcYWkmQ3j2tQzFUKyN5NstysDQnFEUHCV7UMgQocjhGCfw5hquHekJW7xeaqnUlBl1lR7onCcvdd/8Agivd3Mr20W0evXk0uN24gwzVQs/rIhp5t
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365717fa-4e57-4e4b-fbec-08db1f1bd8e1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 14:54:26.8211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0mSEj24PmXeTM/9rzMaN9XT6ZHm9agPZQCEzD9b3YSfBEy7tluiJMr1b/QYr15HkyM7kmiyJprYtEjTKgD8x2TRy8BSJDfxYBkxesqbwtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_09,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070133
X-Proofpoint-GUID: D8ov5MmM-O17LSS03ZESmRbfXHDNAYnd
X-Proofpoint-ORIG-GUID: D8ov5MmM-O17LSS03ZESmRbfXHDNAYnd
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

On 07/03/2023 14:49, Cédric Le Goater wrote:
> On 3/7/23 13:54, Joao Martins wrote:
>> Add device dirty page tracking start/stop functionality. This uses the
>> device DMA logging uAPI to start and stop dirty page tracking by device.
>>
>> Device dirty page tracking is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c              | 173 +++++++++++++++++++++++++++++++++-
>>   hw/vfio/trace-events          |   1 +
>>   include/hw/vfio/vfio-common.h |   2 +
>>   3 files changed, 171 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 811502dbc97c..80f2d287bab5 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -450,6 +450,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer
>> *container)
>>       return true;
>>   }
>>   +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_pages_supported) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /*
>>    * Check if all VFIO devices are running and migration is active, which is
>>    * essentially equivalent to the migration being in pre-copy phase.
>> @@ -1407,16 +1423,156 @@ static void vfio_dirty_tracking_init(VFIOContainer
>> *container,
>>       memory_listener_unregister(&dirty.listener);
>>   }
>>   +static void vfio_devices_dma_logging_stop(VFIOContainer *container)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
>> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_tracking) {
>> +                continue;
>> +            }
>> +
>> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +                warn_report("%s: Failed to stop DMA logging, err %d (%s)",
>> +                             vbasedev->name, -errno, strerror(errno));
>> +            }
>> +            vbasedev->dirty_tracking = false;
>> +        }
>> +    }
>> +}
>> +
>> +static struct vfio_device_feature *
>> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
>> +                                             VFIODirtyRanges *tracking)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    size_t feature_size;
>> +    struct vfio_device_feature_dma_logging_control *control;
>> +    struct vfio_device_feature_dma_logging_range *ranges;
>> +
>> +    feature_size = sizeof(struct vfio_device_feature) +
>> +                   sizeof(struct vfio_device_feature_dma_logging_control);
>> +    feature = g_try_malloc0(feature_size);
>> +    if (!feature) {
>> +        errno = ENOMEM;
>> +        return NULL;
>> +    }
>> +    feature->argsz = feature_size;
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
>> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +
>> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    control->page_size = qemu_real_host_page_size();
>> +
>> +    /*
>> +     * DMA logging uAPI guarantees to support at least a number of ranges that
>> +     * fits into a single host kernel base page.
>> +     */
>> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
>> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
>> +                        control->num_ranges);
>> +    if (!ranges) {
>> +        g_free(feature);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    control->ranges = (__u64)(uintptr_t)ranges;
>> +    if (tracking->max32) {
>> +        ranges->iova = tracking->min32;
>> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
> 
> May be using REAL_HOST_PAGE_ALIGN would be cleaner. Same below. That
> can be fixed inline if so.
> 

Well, the min/max are already REAL_HOST_PAGE_ALIGN from when we capture and
calculated the ranges via vfio_get_section_iova_range(). So I don't think that
is needed. It would be more like extra-insurance.

> Thanks,
> 
> C.
> 
>> +        ranges++;
>> +    }
>> +    if (tracking->max64) {
>> +        ranges->iova = tracking->min64;
>> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
>> +    }
>> +
>> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
>> +                                           tracking->min32, tracking->max32,
>> +                                           tracking->min64, tracking->max64);
>> +
>> +    return feature;
>> +}
>> +
>> +static void vfio_device_feature_dma_logging_start_destroy(
>> +    struct vfio_device_feature *feature)
>> +{
>> +    struct vfio_device_feature_dma_logging_control *control =
>> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    struct vfio_device_feature_dma_logging_range *ranges =
>> +        (struct vfio_device_feature_dma_logging_range *)(uintptr_t)
>> control->ranges;
>> +
>> +    g_free(ranges);
>> +    g_free(feature);
>> +}
>> +
>> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    VFIODirtyRanges ranges;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret = 0;
>> +
>> +    vfio_dirty_tracking_init(container, &ranges);
>> +    feature = vfio_device_feature_dma_logging_start_create(container,
>> +                                                           &ranges);
>> +    if (!feature) {
>> +        return -errno;
>> +    }
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->dirty_tracking) {
>> +                continue;
>> +            }
>> +
>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>> +            if (ret) {
>> +                ret = -errno;
>> +                error_report("%s: Failed to start DMA logging, err %d (%s)",
>> +                             vbasedev->name, ret, strerror(errno));
>> +                goto out;
>> +            }
>> +            vbasedev->dirty_tracking = true;
>> +        }
>> +    }
>> +
>> +out:
>> +    if (ret) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    }
>> +
>> +    vfio_device_feature_dma_logging_start_destroy(feature);
>> +
>> +    return ret;
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    VFIODirtyRanges ranges;
>>       int ret;
>>   -    vfio_dirty_tracking_init(container, &ranges);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        ret = vfio_devices_dma_logging_start(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, true);
>> +    }
>>   -    ret = vfio_set_dirty_page_tracking(container, true);
>>       if (ret) {
>> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }
>> @@ -1424,10 +1580,17 @@ static void
>> vfio_listener_log_global_start(MemoryListener *listener)
>>   static void vfio_listener_log_global_stop(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    int ret;
>> +    int ret = 0;
>> +
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, false);
>> +    }
>>   -    ret = vfio_set_dirty_page_tracking(container, false);
>>       if (ret) {
>> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index dd9fd7b9bddb..bee95dbd977a 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t
>> iova, uint64_t offset_wi
>>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova,
>> uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64"
>> is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
>> 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t
>> min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" -
>> 0x%"PRIx64"]"
>> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t
>> max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" -
>> 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>>   vfio_disconnect_container(int fd) "close container->fd=%d"
>>   vfio_put_group(int fd) "close group->fd=%d"
>>   vfio_get_device(const char * name, unsigned int flags, unsigned int
>> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..9551d2d43025 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -143,6 +143,8 @@ typedef struct VFIODevice {
>>       VFIOMigration *migration;
>>       Error *migration_blocker;
>>       OnOffAuto pre_copy_dirty_page_tracking;
>> +    bool dirty_pages_supported;
>> +    bool dirty_tracking;
>>   } VFIODevice;
>>     struct VFIODeviceOps {
> 

