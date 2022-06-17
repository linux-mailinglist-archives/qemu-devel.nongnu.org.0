Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C054F6BF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:33:32 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2AEF-00060P-CJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2AAM-0004ze-U7
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:29:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2AAJ-0006dv-Tg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:29:30 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H7qMvl009843;
 Fri, 17 Jun 2022 11:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YYeX7fd72nKYpDCR701XCNDWMjXMipv8dkQdQQRleXQ=;
 b=Jr60oMtgcomf4aCk0qm8P2lo4YD/1sThXHNpgl3//21nhwr1WaiF4n2j0Qg589hGC6MQ
 DTYWs7NzjyE790mRvgdlETvQeawQ9USkiMUAnAna5EIxeHmfsIWOU+rdGTEDXVsxCkzR
 vBmRFPt+fz2Aqi52kuYJ+JhgPoKALwdJp89XGx63+ubwncbHnKoEZE2KCgT+yWfLFAKl
 zD+23t+KETNhsNkJe+Ws4LO2ASEtqV31/IwVsFNqYUBVdis7qnysxTOl6SITJ8OZ6jcF
 FX+NLuEtpFM3H9ZdG7Y2CX0jk6E2J0P/KpIei7Vvy7GfBY1lRCtjMgoMPmuG1QwI3ENS pg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktnmkw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 11:29:18 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HAv1io021125; Fri, 17 Jun 2022 11:03:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101] (may be
 forged))
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gprbttq2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 11:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0zmjMHxhnlYPy6Y4Me/dsRALhse8I4yrX0ftaezTSSm5Lb5uoOGPC9BTFCql5oL5nCY3LtnyOjieTs6Dd6o/i2FVFNKNCzY93keE3cP6nqE+tXqIKzmeJv6Pu42JuFSESv3nKpKTiJad85FxzL+1RZoBpIF8A1CunWDPxddBHEl9rYo4qkPUtR0I/MjVdxBhl/87j4KKuMGUrlTJzhP3PRWkd1QaalOxe76xPdSuuxm9QgWgvav4wdtkJaqBSiGHVsOWT3SGoKyqSIgDmD2hwCcAh5DsU0D7DaWQVW5BkcJNyD8P9Lz25O0wIeSguTid76Il3OZGW9WpgWBUNUJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYeX7fd72nKYpDCR701XCNDWMjXMipv8dkQdQQRleXQ=;
 b=MbrVPWVM9sjuYKej5fTQMIzZsHJZZiuXi0Zqfep96PCvp5VYW2CtlMa4AIcro1kH9zAgUc7dBj8jMR+hW1ytlhlF5zS90E3W3rn8lOLOw9SvV1uApNkVcPo8ccEh3nJ0HlotcNAjFRJJlQ5NFAUd9vjguYM9+wstAXXy8IShfVVKpSLjeZ4/sfbwkM1LFXWvjbun+YeBtU4MDRwmTcI1GX8qg71loxyQAfyL4dbaVjr1C9ewffLYws9qeGD3UooeY0Y9SRsw5HlgRjnyz/zyaCB0I2hKvhtt9/cFtetyQewIEABxGzyVoFAA9iUWmhcc1gomWxwgI8vv1zJ8uljvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYeX7fd72nKYpDCR701XCNDWMjXMipv8dkQdQQRleXQ=;
 b=BEH9BH7XYXRoeDG+jGbHHOeyl1JLD4IFCWZJh3UzklFqTK8t7LexYELqfV78gUn4Phcje6KRSfOjKGeDH46mABOh6X+AURZUxFldLFg2Kg/zqfrhzLHUx6Qzjiyd1UB70W+fF5ZE3ipNhIvEHtTDBPFNfylLQSKG7LX1fJAB4Ds=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB4983.namprd10.prod.outlook.com (2603:10b6:408:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 17 Jun
 2022 11:03:45 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 11:03:45 +0000
Message-ID: <32dbc72a-bcca-b661-6c6b-e6786bf7d07c@oracle.com>
Date: Fri, 17 Jun 2022 12:03:38 +0100
Subject: Re: [PATCH v5 2/5] i386/pc: create pci-host qdev prior to
 pc_memory_init()
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-3-joao.m.martins@oracle.com>
 <20220616152151.42d6140a@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220616152151.42d6140a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b352467-6ef1-4d7f-446d-08da50510c22
X-MS-TrafficTypeDiagnostic: BN0PR10MB4983:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB49836D1E6E2F15D63B38E2C9BBAF9@BN0PR10MB4983.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KqUNke7a40bT8p1h4B2ACK3XzeqBzrJwf7jl1V2jCUDFcJiPlWGJNZS+1CLRd2+V3P1riTFBhLCtYYtC/J2TsyrQnW0mTmMrLRfTIntjKLZaa8zr8DIdCbnp+3809cUK5F56hQ0LW7KGVaZbf/yTBtvSXAvtNq1EsGXltFwIYhWK4c232LLloIjVBKk7KfDeQurTSJPRBiPWYW9Gmg1ZEiMOZ0Wa5JsX7tQgRtBbQTxTc2lF8nTajdnbxImZPYx8kSaHWMPhN/Rz44wqMLJ11152Bcx5hbyVRbgJWGgcX9ZaSiJmIXzbT63dJIc+bDuwNFkaB2GKEpgxf3H5MhZCbEXFKDadJ5j+MHNW5k6XZFH2zSygJUWeS0aQuOCcifTKA7um4h7JWuC2hifCcY9d6P06Q27wUyWd+IL+2oOp+eK0sgjIvBJdZN5ScBnZQDzP9RkdTCbQYZE6TlsxJGjn2QRvafQY9hrRFYtjQipUiR+JeSCPzlcYQbkcqhenTfOnFCahIZtF3edTLsNMLH8YCECiVxlA6wCG6OK0gSnuUj2N04dQwN6GcGfVQEyo9TwmnRasWfRk/IhoXW33kTk8DZfrAACGyUlYYcBiJu/7oQMi04FvwiuoNshEmZwJYDgF2HzPUbEgag7tBNlBLffRtBqENsy8v+zV9GeLxqVrn+QC6gOW/RhTSDIyMkSU1VNRw3Fm6ao6mQnWK2+H77vUiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(31696002)(26005)(8676002)(186003)(66556008)(2616005)(6486002)(6512007)(38100700002)(66476007)(6666004)(66946007)(498600001)(5660300002)(6506007)(36756003)(4326008)(54906003)(8936002)(2906002)(86362001)(31686004)(316002)(83380400001)(7416002)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enRzQ2NkczRZSDVMbEYxbG8xcGVHS3g5L3dYZnlkMFZmdEVPY21ic2lFZldy?=
 =?utf-8?B?cEVhU2xzZ3NyOEsxZThXcCtNSGFHVEkzMWxnOFRwSWdYbEFZR3UwbzlvQXRO?=
 =?utf-8?B?aENIWEtyMzhWcGZnZ3M5M0lRY2twbjk2VC85M0ZLT2tvR2lLdWpvVDBmSE1w?=
 =?utf-8?B?N0w0bG1CRTVndmFISUc2WDdvM2FHVXFKYjBrUkhaVWNTSmxrMGR1bGU1bkJH?=
 =?utf-8?B?ZXJaQXg1RWJ2Slh4OEw4SkRhLzdHeDJEL2s5c29hd1MvNHpmNlhtcTlFaHRV?=
 =?utf-8?B?QXJsKzFlc08wRVBzYTJKaE0xTTY5TGp5ZEY3dmhuTVNVUUZIbHMzUWNjM3Yw?=
 =?utf-8?B?dUpZZWxVeHAwcitMRnRKOUl3Yjh5aE02a1pOZHlmR2NvZnNJUG9UQm5YMGxX?=
 =?utf-8?B?WjZodGxaenFIMWl1eUJyaU40eFVLZEVUUFBBZVRVOXg4amo5a2gzZnpIdVVN?=
 =?utf-8?B?WkRpbWQ0WFYrREVlR2IyWjdkWUQ3NUlUMU9Sc0pPWnd3MXUwWm1keDRGWjB0?=
 =?utf-8?B?emw2Sm1Fa3VFcnJ4NmJJMHlWb0FhZ0gxbGdmL3lkNXg3YnpIdWJ1TjRtN1pz?=
 =?utf-8?B?K3p6WURYZk5RZ0xrdS9JY2wxVmMxbVRJUHU3aW4va3ZFZ09QNWpzY2tTZEJq?=
 =?utf-8?B?emlBOEJ3ZFlEL0hUWktZQnlFQjB1enVha1NDYmRCaHV3MU5wZmIyK0x3eEtC?=
 =?utf-8?B?YnhoQzdnU3Z3Q0xGbXBVTEVCTmtFMVpuUWlVUW0rUzJsOG50ZFVhNUxVM0ZV?=
 =?utf-8?B?YkFxWWpiVWk5MXcwckNKWENMZzJLS2VSQTZHOHdoVVBadlh1S0FHaktrVmQw?=
 =?utf-8?B?bGNkaFVVSlZ6OVgzT0FTQTYxeU1BRlVwWDExL1p6U2h5WndLbDg4OVpOQVlF?=
 =?utf-8?B?bDRtSStaL2Jva1VJU1p2ZmxMdnZJWHZSWkZxUHRDaE15WTNibXVvSWNSeEhN?=
 =?utf-8?B?QTl6Z0JXcTM0OWdkK2NsMUk0aUFKSTJkQmYxNWVBZ3hYaWJMQytyWnJBM2xM?=
 =?utf-8?B?a2IyUGl4YllGNUtMOEo2dTh5OU5DUHZNdHZDUHNxand1V3RTVGQ2VlNmWmFH?=
 =?utf-8?B?YkRDMXE1ei9pSXdMSG5yb0JVeWh5L2dDRFNRbHlBbHJ4Nm9zbnZkUkhDK1dW?=
 =?utf-8?B?R01tYWNmQ2NoS1F5cTNaa2RpalUxZFQ5ZzRiQUJHQjMwUkM2M05GNjFnT0tK?=
 =?utf-8?B?UDJWSGM2ZDVDcThZWURmczBhWmxmRVBiWEFSWEFqeWtKeWxZTmdjRlZQQytM?=
 =?utf-8?B?R0NRcVBPR0EyaU15M1FGcm9iQktlclBWOWNGUE85TjdCVDlNZCt4VnJmUkda?=
 =?utf-8?B?QzRQN0lUS0g4SVlHaitTaWZVS3lobDE5YUZBUU53bFc1UlVlYTN5dnNwM2RR?=
 =?utf-8?B?TlJZQjZ3alk2bitkQ0JYb3JGVDQvZ1ArVWwwd3pqL2RPb3pDSS84YmR1Y3B4?=
 =?utf-8?B?UlNlV3ZGUEVSUyt5MG9jcWNQK0RyeDRacjFzWEhHQkxQY1MwUDEwaThJQ1Ny?=
 =?utf-8?B?dGcxekpGVnAvb3ZGM2l4MVd6cjNIQml3TE82MDl3MDBwK3o3MjFPYXE0Y0k1?=
 =?utf-8?B?eU9TZ0lua3N3ZWlhM3ZNTDJiMDM1eG0ybzlJdCtPOVg0eDljZnFBZk04RE5E?=
 =?utf-8?B?OWhVZlZtYnBTN0RrWjVPb1JaZURaRmI4VGRURnZ6dUxvWjFuMWxwSUdYV2R3?=
 =?utf-8?B?L0daZmFrOFhTM3lxQlAwWElFc3ZYNHRyVWlXOHI1N0svNmJjNHdZMnNIRFV5?=
 =?utf-8?B?U3pEQzNyZ1NPeGRtRlJvUUd2MUdUZk85eE13MU1VR0VDdXNaOXYxTmhHeWl0?=
 =?utf-8?B?ZmlTRVlnKzdDTEZoWlV4WmY0UXh4K21VVlR0UnBIbU9WWlQ2OG9hQ2hUN2g0?=
 =?utf-8?B?UE5lamdOU0YvVStSMkFCZHg5Yk1wNXg5S3RqdXd0T3p4elc3akEzUWdDbVk4?=
 =?utf-8?B?bW11ZytlbkE1ak1hQms1Z0srS1RvYmg4TU5oY1NBV2VJUXgzNHJrdE5mNGU0?=
 =?utf-8?B?VDU1UHB0aXRQbVRsd2NNcmtncmRYRTJLeDkvdGdaV0NQMjgxcVR5S1I3aFhn?=
 =?utf-8?B?RHI0a25HOVdJMlk0dmMvSnA0ZEF1dXJscmdtclZNb1hvMDZoNlZSajBrem9H?=
 =?utf-8?B?QWJXUzJiWWcxcEZvTllPQ0tsM3NGZ0ljaWRDRFRWcm5BaDU1Qi8xS2EwY3Fy?=
 =?utf-8?B?SXV1VVI5Rzk0OEtMRnpKdDlnZFVhSGhYb1ZndzVpbGU2cHA1Q093a0IxZmVy?=
 =?utf-8?B?RGlRRjZWOStrMFdmUlNIOG1tdDZZZWhBT3Y2Vnh5RTQ1Njd6SkFvOHZaamtS?=
 =?utf-8?B?QTQ3UVpzMENXVDg5UmFzd0FtK0tqWDhwa1QzeklmZVpEMHYyQ2x6UkJxM0s3?=
 =?utf-8?Q?b4ebt78viSg2eNqU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b352467-6ef1-4d7f-446d-08da50510c22
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 11:03:45.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 891A7qqx6B13Y0HdH0qLmuHC/XdXTtI2aXdfWGkFqMUZldrClYktzpO/9zHnSZQy+7xU1v1xh0i0jE99QI1TUNEFQtRAFAKsECbkcmNuzBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4983
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170049
X-Proofpoint-GUID: 2Z38MdJ_JlC9v_NAjwg8T9sQl_tBYvuO
X-Proofpoint-ORIG-GUID: 2Z38MdJ_JlC9v_NAjwg8T9sQl_tBYvuO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 6/16/22 14:21, Reviewed-by: Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> At the start of pc_memory_init() we usually pass a range of
>> 0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
>> 32G (q35). To get the real user value, we need to get pci-host
>> passed property for default pci_hole64_size. Thus to get that,
>> create the qdev prior to memory init to better make estimations
>> on max used/phys addr.
>>
>> This is in preparation to determine that host-phys-bits are
>> enough and also for pci-hole64-size to be considered to relocate
>> ram-above-4g to be at 1T (on AMD platforms).
> 
> with comments below fixed
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>  
Having fixed your comments, I added this thanks!

>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc_piix.c            | 5 ++++-
>>  hw/i386/pc_q35.c             | 6 +++---
>>  hw/pci-host/i440fx.c         | 3 +--
>>  include/hw/pci-host/i440fx.h | 2 +-
>>  4 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 578e537b3525..12d4a279c793 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>>      MemoryRegion *pci_memory;
>>      MemoryRegion *rom_memory;
>>      ram_addr_t lowmem;
>> +    DeviceState *i440fx_dev;
>>  
>>      /*
>>       * Calculate ram split, for memory below and above 4G.  It's a bit
>> @@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
>>          pci_memory = g_new(MemoryRegion, 1);
>>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>>          rom_memory = pci_memory;
>> +        i440fx_dev = qdev_new(host_type);
>>      } else {
>>          pci_memory = NULL;
>>          rom_memory = system_memory;
>> +        i440fx_dev = NULL;
>>      }
>>  
>>      pc_guest_info_init(pcms);
>> @@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
>>  
>>          pci_bus = i440fx_init(host_type,
>>                                pci_type,
>> -                              &i440fx_state,
>> +                              i440fx_dev, &i440fx_state,
> confusing names, suggest to rename i440fx_state -> pci_i440fx and i440fx_dev -> i440fx_host
> or something like this
> 
I've changed i440fx_dev as that's what I add in this patch.

>>                                system_memory, system_io, machine->ram_size,
>>                                x86ms->below_4g_mem_size,
>>                                x86ms->above_4g_mem_size,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 42eb8b97079a..8d867bdb274a 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
>>                              pcms->smbios_entry_point_type);
>>      }
>>  
>> -    /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> -
>>      /* create pci host bus */
>>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>  
>> +    /* allocate ram and load rom/bios */
>> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> +
>>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>>                               OBJECT(ram_memory), NULL);
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index e08716142b6e..5c1bab5c58ed 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>>  }
>>  
>>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> 
> does it still need 'host_type'?
> 
I've removed it.

>> +                    DeviceState *dev,
>>                      PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>> @@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                      MemoryRegion *pci_address_space,
>>                      MemoryRegion *ram_memory)
>>  {
>> -    DeviceState *dev;
>>      PCIBus *b;
>>      PCIDevice *d;
>>      PCIHostState *s;
>> @@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>      unsigned i;
>>      I440FXState *i440fx;
>>  
>> -    dev = qdev_new(host_type);
>>      s = PCI_HOST_BRIDGE(dev);
>>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>>                           address_space_io, 0, TYPE_PCI_BUS);
>> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
>> index f068aaba8fda..c4710445e30a 100644
>> --- a/include/hw/pci-host/i440fx.h
>> +++ b/include/hw/pci-host/i440fx.h
>> @@ -36,7 +36,7 @@ struct PCII440FXState {
>>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>>  
>>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> -                    PCII440FXState **pi440fx_state,
>> +                    DeviceState *dev, PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>>                      ram_addr_t ram_size,
> 

