Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEA4C2EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:47:13 +0100 (CET)
Received: from localhost ([::1]:56924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNFOi-0003tY-4o
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNFKi-0008PL-L4
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:43:04 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNFKe-0005xg-Vm
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:43:03 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OCYE8A007293; 
 Thu, 24 Feb 2022 14:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hmTP6ZQ97AcJahvoS9QsuBZMC0H8YaWCss1LVcMBJ3g=;
 b=DBO67Kg9qTs/Nfs/SXdIZJsvszGbX7hO0kRn5U4NDtWh/wRzQ8wEEB2/K606Q88d8436
 +9O6XYIE4eQPDp3q4/0RT0zCFuhz45hSiwn7Nfpl4OWsdVLvUnICoDiUcYXCxNl15niB
 3bqs25F6ON+R4SK8JT0V1nlkDNoW201n0VZ2ScaAjOxzHJvDWynAVMlismkJSbWSygDf
 H4k9x4WblrTNGs3e6U4vkTam7nRqTjlPX+Fk6jECIXTzfMfpB0PcgXlq8FTqMZRdvo/d
 fpwtLIgwduKXDgeEuzVNcAIsF7q9+5rAhGEsJwyoSGywQUsVHv6WFitWmXlWpi+stZQr MQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ectsx7k1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 14:42:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OEZgbM108001;
 Thu, 24 Feb 2022 14:42:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3030.oracle.com with ESMTP id 3eannxj34q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 14:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUjBhbt5YcP7hyo/aRVysl3bIwfvEmwlIvSN5eN9OXBHlJtsEUR5FwgGA8xOngdpGDh8FNJY8Khl05vgDH4/A4gHHFVKMXCX7AwnXhVnc8Cm72A2QpTmYBE388SV8BedNvgaF/hkaQO4wtIoluujcGZSIOS8r0JRAZUxw+X7q/Jo7YfTazbzKMc3QvKqc9K/pGKRr3gKg/o5g5cDAswYq7+JXBXK6ZKN5F7WhPi+JjzLTUmVMh7yCH8VvmftmhZIvEMA9udUWsNimZ6Wbpf9QAlWkc5jzv7a9dEyp/y0DRvDcpZ3i5WD5QZKND25S9FuwDmkGuk3JOiWU8EKMxHXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmTP6ZQ97AcJahvoS9QsuBZMC0H8YaWCss1LVcMBJ3g=;
 b=YhrGV1anIvTgf0tYEhc+VhbPQ0u3UWKf4UYAnGzXblI8beL8pMejGCCiPt4u1HiEiX3TYZu+NoNRhBQ05b7ikI7hfb3xFOLv568uSwH4uIqRkjcV5bBydueF4/VkdPqnTRxW8pAsQ7cVvt8n3v1IBaFJ9RjvT6wyxgkIgT9m7FRAIyx/gpwJ6V2uo3wUOOiHugOlQjY5BuKbP3UodemlMdZi23846tKblbatDd46tivnUg4JK+7MiaoJHKxZL2Vs4ZS4JH704MzZlnSbMbgyVJ0gkdrHqzQAR5utgp1lhQydXXbk18xCEW4Og7BtitWNkQ+rGe+T/degD9tmisTFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmTP6ZQ97AcJahvoS9QsuBZMC0H8YaWCss1LVcMBJ3g=;
 b=G3TJga/ykQpfxWFwGdyDWvQyBcytW1riV4xoP8J9KdUC3unGv8GFCXyfScq0W9MSG4XL2KMvd6Vf+f6cSN2lbCixGhULGVPPF7lcr9kAgi0sE3Rg3iRfzWTfQoTyUKiVDG0j9wjEcmQhmjZGR0b3OessOJ07g2sUBrahloPdUzg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 14:42:46 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:42:46 +0000
Message-ID: <191acc21-c6de-1da8-feeb-b1f85ef92ef1@oracle.com>
Date: Thu, 24 Feb 2022 14:42:37 +0000
Subject: Re: [PATCH v3 5/6] i386/pc: warn if phys-bits is too low
Content-Language: en-US
To: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-6-joao.m.martins@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220223184455.9057-6-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f80c78a-44ac-44b7-5463-08d9f7a3ebc7
X-MS-TrafficTypeDiagnostic: SA2PR10MB4507:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB45074BA2956AE5799DEE24A1BB3D9@SA2PR10MB4507.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/U7EjkplPHaL18BYrFsq4PrwrKA6bXHpz0gw9HhHdYuqO3MrhUanLfx7duZYJAuCp8XiTzlh2ZsDewQGx+nF6SSi1Fjbbe/xbX+RIwj1v95PUFujlbOei4mZXg0KylRmF7NKCWF19RTPxb+B1VHP8Ccsz70g8IXbuS6lL1KxjUz9dihrSGBBo18q8uKtswEar+XD1T3ikuPsGoGa0RqkXHGxEl42daZYqLNGC1kZhaeDV7WXqTSXjjX3Klr1vwgsUgeW07q+xp/ezyvODSM3OBhJuy7rQtOvP2ssbgcB+X+sEqmWyIctMtLzh4seMdo9sLijVTRWVQTlIgySddkBHV3NJAuADi+umm1MhzP4+rVeyazElcPMwISYVtLt4nnNLS4BG+qmEyaMpowNqcnq9j9fyGbBaaiLHHIJf8J/yEvJ3/RPDy12N2U468PPjvBbVyabfMuk4cx1C2uneEsFzKRxM9HDPP2t7YsS234BVRjmZPGTy6lAkAYZIsKoYhVSklVjuudqqN4//hVC6Os0fyNvgpTMdbcAtORgnjh8KoOc7Q4hMnO8GwmSd1C8zTmUauXjmjdKVW+Ui8KG1pp9gbPMgntBtF6lQuN+pTO8hoAcJM8IJbd6+rcmdaUqtkXZb+NnK3Thun787bbX5uhSjjfcqG545wFiEKq7g4JHEDGsP6+0bV7WJKpYimPyUGX/yFX32UJdy/+a1/Yyhwb0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6666004)(31696002)(36756003)(26005)(5660300002)(38100700002)(6506007)(53546011)(6512007)(186003)(2616005)(86362001)(4326008)(6486002)(66946007)(2906002)(316002)(8936002)(7416002)(31686004)(66476007)(66556008)(508600001)(6916009)(54906003)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtYa1d3OE5hK3RnYkw0cEtWLzZvVGFpOWxTR3JYUWR1b3RBajdEaVdXNm5n?=
 =?utf-8?B?ZU1xQkw5WWg0cUlmSG41N1ZzZllhYXl1NFEzWkI2dFc1Vkc0SUJlcDlubUlT?=
 =?utf-8?B?WWl1TmVUNE1wNVBiVUl0R2o3VXJYUkdhUERneGJwdWJNTnYvUWtCY3RHWm1n?=
 =?utf-8?B?NEpDbG8xeFJEeTh2aWFUS01uTFBpTmNXVE9pRWxqWjlML3pXd292b3RmUmRF?=
 =?utf-8?B?eVliOTRjUitKV1k5K3BwWnh1YWsyUWlINjFvc3FNRHI5dFZLa2hYem1BNHZM?=
 =?utf-8?B?Q0NCczl6RDM0cW5oem05cE5uZXdsQnNsL1JWUE5jRy90UUNMT0Y5eHlETEJP?=
 =?utf-8?B?VmxnTXdtODE2UHZLU3VOUFIveXZpbHZwNVIxQzBNcm1xY0FJTVZhSE4zNzM3?=
 =?utf-8?B?SWlDcVdRcnJYSzVnV2ppRWpENFJuOTFWOGI3eGRveTloanhvQXhscU9zVnVC?=
 =?utf-8?B?VXN3L2tJSmZpNWdQbVlBWkMzcjhudEtJbVVRWmNUb21PYy91cEJLd2o5SmJr?=
 =?utf-8?B?SVR4cjE0dXFHOXl2ODgvSFhQQWFDYkIxZmFNZEI4c2U0NXVBZEVGYTAvTEJQ?=
 =?utf-8?B?T3kwbXp4YXp5MHNRVDRibWVuWkpweHIvR0g0cGJZVVhzQ0xtY00vUDVMYVBE?=
 =?utf-8?B?WkJuc3BKRm5vVm9oZEVGOFZYZXh0Z3hwWWc1b1pSMDRvaDBvNmY4SHQ5YWM3?=
 =?utf-8?B?VFo2ckhYWThycnl5K2tZZXlFdXhQeGlEVDliNisyMFd6bmtiN2l1UUM5eWR6?=
 =?utf-8?B?cGR5cnZkelZLclB2N0dqZWp1VTB0NTcyMDhNSm1rQllRbHlpNmx4dmtYMnVN?=
 =?utf-8?B?SENKNlNxMTI3dGNJZFBNd2RtcFpDVlQwekZhMEtneE05eDBnZ0FMUWY0NmlN?=
 =?utf-8?B?VUphSTVteEUzMkF3NkhTajgwMHBXWUUvbTVPK2RXc2Y0UHpGRm9nQWFFVnlT?=
 =?utf-8?B?MER3cllHUTdLaStsakQ1OFZBRDFUNytsdGFNQnNZZDBTOU0zWlhBVzg2enJG?=
 =?utf-8?B?Mkd2d3dBejJnNWdmWXBURzRsaXQrVkFvM2VqeU93alVUV2JEV0MzbUpmVWw1?=
 =?utf-8?B?VkIzTjI2dEkzQXpJSG9kcWl3Q2dkRDFsTElMRldRT1c2enRCdUNiTnoxeW5m?=
 =?utf-8?B?eklzbHNraThhY2puTkFsaWZWaGR6MjJTeUV4a3d2dHlhQUZWU3k4WnV6MVBt?=
 =?utf-8?B?dkVpNUpYTFRDUDRjSHd6WW9GMnp1Snd0V0UzV3lLT3o4eDZXUCs4RDk4MmMy?=
 =?utf-8?B?ZDFMejFNNDljZlNNaVVoUjM5WW9qVjE2b2RTem1NU3o0aURPKzRYM1huZEdE?=
 =?utf-8?B?YkVsdENaekRHV0VyT0lFZ3RpLzZ3ODBtZ3BnRjVHblY1UnZONUlYZnVPUkl6?=
 =?utf-8?B?ZUpuM2laMithVkZ4Um5SU1BQUlRSa3F4NlIyemtYWVVucVNyVGF5QnZCRDhN?=
 =?utf-8?B?TG56SDQxUG8wU1lZOUdqemNrNXF1T1lDZDlvOVByeTBsUUxqQk1lK2phMEx3?=
 =?utf-8?B?QituRGdxWThBbnpqY3IwUENWL1VmS3J6Zkx5cXpCRDd2cHRjWU54ZHFIUGdz?=
 =?utf-8?B?MVVOYnpDcUpDQnlaeDd5aEFVWGthSUJKRUlycFBlL3QyYm1XemhhUVhrL3g2?=
 =?utf-8?B?ZmRjckxscG1nQnpKSXBqaUFRMU1tMjg4TjBlVkVncUYyOFVNb0I1VnpBYWZM?=
 =?utf-8?B?YjdZYmt5dnIrOG1YSGh4Zi9LOGxINkZwUW8yeG9jdmkyTGIvMDBFTGVuNjBt?=
 =?utf-8?B?NDJYRGcwYnRLejdWbXlNcEo4RC9iTCtQamUzOTJJTituSWVRM29BelNxUzdX?=
 =?utf-8?B?RTZjSldrdFFtS1J2VHQ3eC9DRDZ5aWxJWXhpOGpmSlUycllzTUI4TTcvVGo0?=
 =?utf-8?B?RW5zK2QvV2ZkOTRsODlNbk5OcmJBcTFrSTdMNVc2cHltUEZ5UU02OEFzTWNI?=
 =?utf-8?B?Y2s2VWxESTNPa2c2Rk13Q1JNSEtXS25Eb3l5MUtraUdBQTBULzkreFZZdTdp?=
 =?utf-8?B?bjRBVmxnenBhcytoQ2MxSkJJSUF2NzFoNXZyWmNiMUJFcCtZK0RHWUVXMU1N?=
 =?utf-8?B?NW9TOXhTZ2IybjZGVVVPZ2ZHbVRHNjJkOVY0UjB4UStMWE1TTlhFaENBcTUr?=
 =?utf-8?B?UGNRRDdiWWtJZ3pmVm9PMFR3OGxaVktxUHd4Z3RSV0E4SFVwZlpoSlgvZzBG?=
 =?utf-8?B?RmN5R1pWTnRnU3lxMEFobG5WajQwSHFtUmJiRjhGWDltTkwxTmFqcU5nYzQr?=
 =?utf-8?Q?YgSkPBcQrhQ/cYgT0lAo2X3R7orRxSdq00yZW2Ft/s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f80c78a-44ac-44b7-5463-08d9f7a3ebc7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:42:45.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbTGP2xzeoA3eWgaXiw/ZpciEhoZr2z29gtBMMqe8leb9Wi9LId8bdzJjoZ833Fee38l5WpTwu2zDX0/qmXDfm013XYsjd4GBtJFx9m2IGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240087
X-Proofpoint-ORIG-GUID: acRTTNy5PEGZIKZ3Jhg_qSgEVvwcv9yA
X-Proofpoint-GUID: acRTTNy5PEGZIKZ3Jhg_qSgEVvwcv9yA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 18:44, Joao Martins wrote:
> @@ -896,6 +897,15 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      x86_update_above_4g_mem_start(pcms, pci_hole64_size);
>  
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    maxusedaddr = x86_max_phys_addr(pcms, pci_hole64_size);
> +    if (maxphysaddr < maxusedaddr) {
> +        warn_report("Address space above 4G at %"PRIx64"-%"PRIx64
> +                    " phys-bits too low (%u)",
> +                    x86ms->above_4g_mem_start, maxusedaddr,
> +                    X86_CPU(first_cpu)->phys_bits);
> +    }
> +
And in addition to the change in patch 4, for 32-bit I will change this
to an error_report(...) and exit right after, and updating commit message
accordingly. The error message changes slightly too given that it was
too specific to the above 4G region. All qtests pass.

diffstat below:

@@ -904,6 +905,16 @@ void pc_memory_init(PCMachineState *pcms,

     x86_update_above_4g_mem_start(pcms, pci_hole64_size);

+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    maxusedaddr = x86_max_phys_addr(pcms, pci_hole64_size);
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u)",
+                     maxphysaddr, maxusedaddr,
+                     X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }

