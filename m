Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDAF526958
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:33:10 +0200 (CEST)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa69-0005fa-8H
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1npa2H-0002Os-J5
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:29:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1npa2D-0001zx-Pn
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:29:08 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DFdGV7032598;
 Fri, 13 May 2022 18:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Fzdv2mbm6nx8BuwxB5fHrBXFOQvGJSRyWNyZjBZ+HIc=;
 b=fCclN1DUmws7Od5cy0ogN77lOSXYSlxUDmzPhLzp04f5zgwDPIyLfVrQUDTpFzrspHQ7
 ZSTRvBO9JrSwzB7S53LpKqML+wNhdEIpG3BPVvXxscxwnJkyGYibYimCCZOa9t0c7yxw
 X4g1wWxHZH7LgBCVCLvQZsdhJkgpXMt6BAbajaVcixLe6kQ/EJb2E2LqpaxfhH8afHWo
 4QCc0wmARPrOwXSp/mKizM5NBMHlUKQtlZkNdCOPh8R/duEZbTJaxesHLtR1qMs1UOaf
 OcNlOxHdHaxEqGowsq+Uhwys/NC3J4TBkgPZQp3FT5/6++L/SM2WXcLljKxWYBsuJnjE fA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgct0aet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 18:29:00 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24DIG20B012227; Fri, 13 May 2022 18:28:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf76au21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 18:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/2Mw2N+bm/nJ+V7rxIiJjO8VcA4ne8bA+quH4MiisqwbIPB3jGkXx38qIGu5TvtrzNst8PAZuUCtfduMTRYMuJdfm+JpOAcYd+DMSr7OlDGioHMJi7WjGYrT1jCz58DoJP5w9ARYV95qeiT8TwDkOJ8l+YAJlq5YokmLmreDVSR6o0pTQnx8kuC2iczgBkG9tYwirY9SJGkM+FeIGf9xWwQ/fRbylzH3itBIDhJLkDVYaG4EPpOAYu4fW1xwQ3T4zvKLUGfIdFsk9K9yBIbe9YoBFPUdi1VhbXM2qkn5mSZjsOhBp2n3H8stxEXGlkvWuXjoM9Dy4eHswrp0hpLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzdv2mbm6nx8BuwxB5fHrBXFOQvGJSRyWNyZjBZ+HIc=;
 b=gUv7/qVisZMn0i4QTKaiDaw7HM33VlicBIjUfQko5TJomueQk5Ce4rR6iSo8zatq00L9W/l9Zf7o1GbnG27DPwUo2c4zrOPRjCxCDIqvVCsm5z6earGEZXHQ5M2NeCRRZyzPb33kgTd0thJYPRK9w9GwhwaBsNddD0HvsCqk3TlEsmjWlIvCL2lRN8ZGrkp3K3FFWPYM9Fo0BEdjG7bofWACJMptbl/r6Leej4YZnv+kABfvz6RF/JYWFdInsAWT7GbsCJDex1T5yE7eRTbGFjE2uWSiw6RflHBByW8Xr9cgbscImBdDiwcOIn3TSsLLtlN1n7A1vY4eBI13Z9gjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fzdv2mbm6nx8BuwxB5fHrBXFOQvGJSRyWNyZjBZ+HIc=;
 b=or8CBbTk0oPZPToxw8pDykYK9fjM1LvOGG38fCAzJZBG565thG9hCwv/hl+4tPpLYF9gOlA6rufguMzCvJfFtKjg20cHoL1Z3A+cNWxkaRlPEnAJU+n0IS31ioMxtwmSifh88Wsx6d93rJgZy5mqakRRLZg+kGm73rDGS99pp78=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SN6PR10MB3040.namprd10.prod.outlook.com (2603:10b6:805:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 18:28:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%6]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 18:28:56 +0000
Message-ID: <f107b7b5-cb8f-eca9-3a1f-96b1ba5575c5@oracle.com>
Date: Fri, 13 May 2022 19:28:57 +0100
From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v4 4/5] i386/pc: relocate 4g start to 1T where applicable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
 <20220420201138.23854-5-joao.m.martins@oracle.com>
 <20220513083052-mutt-send-email-mst@kernel.org>
 <23514250-d0c8-a94a-0b21-e7f0f34cf965@oracle.com>
Content-Language: en-US
In-Reply-To: <23514250-d0c8-a94a-0b21-e7f0f34cf965@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5140217c-fd76-4835-d033-08da350e705f
X-MS-TrafficTypeDiagnostic: SN6PR10MB3040:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB30404D77139F23F3A228660DBBCA9@SN6PR10MB3040.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOfB1jWKOqcdAWM22fTIgApmllkabJPV/8oeaFZ6aZWheUxtLgLwI+dD8fFaD7gSSgk7V4QcVjov7O93alpF3ShJmyckG78qtZViAyvAMk+72f3WF+R3u75z43ayij45bRMORX79rzjSb7D9Z79R2rpnCVDkHNnM7S+nkuqmRMkLOooq52bq59Xz2G0Ac+jlGyek+xJ1XPWrivxzrj2nBzzHB/8BX12jBhqmvwP2I2uDsovAqAe9BRryNviPa1cRxwtPOaoyF/2edWVPk1DPE2Po9eMpGtEOC6WrYHKVyFKFpA7P7BF209MLXsBUyiUaAoJXA79AD3CGdEpHz2EPBhFVqc8MhMv9l70olh1m/3R5gSOdZ/WzpE06/uXRJ/UGFSppXkbmsbFCKsYD4cfTSoexPCSNOh8FlQ0gzdrUCgoh+wEOkLgqYdppUxCLB22qNGX56csWlNOW6G1lszU9tEIxvPGqUCMcPfGBmHr0i/krU7Et4+p2aWUMe4aOZyz+9UIeibXB39hvlNc78Am/Ufbd4b/G/lgfSgrRnOg+m6MxfPaGmI/O4zzYnvBB7ZG1zP7yiX0rDW4V2fvi/grhkgBGteWpxSoOfuJjYOqRTp7qelN2k6WFkwdokfDdT4N0o3XP7DLXVxX9xJQOY6neHm+CUOOZjwoBLAMRyTKdjV1oADCIWOMJT7pNUBIfRYXdRSoMTRUzob62SGVBHjGebg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(26005)(36756003)(31696002)(8936002)(2906002)(6512007)(508600001)(7416002)(53546011)(5660300002)(6486002)(86362001)(54906003)(6916009)(6506007)(83380400001)(316002)(4326008)(66556008)(66946007)(66476007)(8676002)(2616005)(31686004)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTFRcHQ1dG1CeHoxMUNVUjN4NVVaZmhCMWlIYmJaRER5a0UvWm1KNG5SOFZG?=
 =?utf-8?B?dnp5aTZBdUZKZjlXTXNheEpOczUwNk9YTUJoNXRrRTljU2Jva3FBWkFHZnFX?=
 =?utf-8?B?YjFjQ0U2RWJZUFhnU2dSeVdyOUo2QkRORTJJRncyUFZ4c01Md0krZnF1WGp4?=
 =?utf-8?B?c1QrL00rejJzSCtIdGwwR3JNb1gxVE1NbmFkelZ1cElldmZuU3ZTVzhBNHhQ?=
 =?utf-8?B?TllOSjA3V1dWZUJzVzZhSDlXZWRwanY5QTlhd1hUMEVTK2IwUFo1aDVCUnZm?=
 =?utf-8?B?WE1MOEZ2YnNxRWlrVnBpK2xMdWlQVXlsMkxTbzZWc2c2L0NHM1BVRkt0Z2RE?=
 =?utf-8?B?b0kzSXUxczNSQ0w3V1ZWeHVKdFExNjFUR0pHcFBxaU5qQ3d6dWd4U3dHelFq?=
 =?utf-8?B?c0UyODRRSCtTKzU5ZEV3bFRab2xObUxGSVd3WjM5ZGJZREhMTmxLL0NmSHli?=
 =?utf-8?B?dkJsMFVBclZ4UE96Um54dmd0VTgwUlBPcFNzRHExU0pVUUp3c0FrR3JvdGd3?=
 =?utf-8?B?V3NrTVU5TTBoalYvbWtYM2xQcWduVXhaQXNwNERMWFhGQW9JY3BTaS9JaEZi?=
 =?utf-8?B?bkRYc0h6V2piMmYzZTVyS2hpQjQzVHBySk9PdWFBb1FTT3kzWW1vNHZBZHQz?=
 =?utf-8?B?aG41QU4zQWhIeEV2U0Z3RExONmd2c29QVy9aektrY3FhcmlEdzRIcWtOUEdC?=
 =?utf-8?B?aGFzN21KeXk3THp0a0FpNjBIRnlxcXRKSVp2dDNVUzBUUWtSUUVXOWpSWWFJ?=
 =?utf-8?B?NXVCNjRYcGgvUGJvTjJQdmpyVXdta291a2ljV0RrTENEUzNaL2VFOWRwWGhR?=
 =?utf-8?B?c0xWVHE3QlRIbzhXbDkzM2w5REt3TzgxajBCWXlENVhiRWR3amw0cC9iUWZ2?=
 =?utf-8?B?T2EreEh1eUM2SnA4VVQ2NUJiVFZKMzJSbmJFLzIrRUU1MFFRNHNjditqNE40?=
 =?utf-8?B?VjUzWWZuR3JWMXRqeDJrTUNneGNCRTdianZiU1NjVmtLU2FSbjA0dnROWEVQ?=
 =?utf-8?B?ZklVUFVBeW0rT1F1N3FtQnZaRm9TaDB0UEJQeCtaOHVCT2liNjM4Q2RGcjJG?=
 =?utf-8?B?c1JoeHZnSVAzeWliSGIveW5rNVcvRkZJRWNGNkVaSWhHamlVZWRFMTdWb1Vm?=
 =?utf-8?B?eHJMdUdnQUZGbmFLV1B6TnAzc2tCRllKY0VoMEJYQ3Z6MkxhWDg1TjlCUXMx?=
 =?utf-8?B?SFRJSFNqMHFBNSsrL3lVaHhKamhnMVpoamEvL0w4d21ndUVrRDVtdURkeGF5?=
 =?utf-8?B?alVna3BjSnJBazd6TXF1ZFlwbkFubnkvYlNFTXJBd1kzYVBXaEFaNlJwb3ZG?=
 =?utf-8?B?b0xocWZwc2o3cndycUY4SXY0bzJQTmpwTmNwbFNtK0E2YUU3dHZselpTL3Uw?=
 =?utf-8?B?OGsrTVRhZ0pab2Q0UDZudEliUzJlUGpzYnNxMm44d243STJKUVV2VlZibUJr?=
 =?utf-8?B?RndrM1VxcjlFRG5QelE5bTYyRzV0dHM3V2hXMlZXR2ViZGN0aEJHZzNvZEJ0?=
 =?utf-8?B?a0Y1Y0lrTDd0ZDBFaWZjL1dvc2c2VU4zTk1SK0JhMnBucWZ5U1NORnoyd1NR?=
 =?utf-8?B?MllmeGdYNXpockRWQjVvanJPZXgvOW9BMFBVcXhDWGJReUdpTU9Xay9kTXZS?=
 =?utf-8?B?b0p6ZmlWTVVzSlZsZVgranB0OVZyR3pMOVJwWE80RWJXcE9wTUg4RDdBNkhk?=
 =?utf-8?B?TUtrTGtKWFZTWmxVVzZXQnorcUp4Tk8yc0lyUUVMMWtzNEl6bFZ1M3I3YzNx?=
 =?utf-8?B?cy9MRmovS2lmNTAwUmY5SEhHRzE0TmtEV1lJazBHSnJteTR3bStnK0svMDN0?=
 =?utf-8?B?WXhlQ3dJR1Y1b1hzN29SdFExZmNVdDE0YW92L3ZHSUc4N0pvSHJhLzZZNHpW?=
 =?utf-8?B?aTRHaUNFV0NOK1JhREloY21hQ2F4MU5iN0hhMkRuWEg0TDFFdmFYMUNYQW9B?=
 =?utf-8?B?NnNuZFlDaUVFTzJkZDN0RVU5eGFuSCtmdGZlVXI3Uzk2NXpYd3E1QTNuamdX?=
 =?utf-8?B?TFVJRHlQcjdxeTh0VVRGZ3VCait6ZGJCTDJuVUZkUWhxRlNpUkhtcTQzTWdE?=
 =?utf-8?B?ekZ1TXNQMzY1UVF3bUpvb3RBUjVxVHROK2tnSTNHMTc5RlJYbk5tZERBdTFy?=
 =?utf-8?B?UzR4S2xHbjJKNEw3aWpvU1IrU2Vwa3FScnZOUjlpQUYyRUR3aU40MDZpZUwz?=
 =?utf-8?B?cFZBU2NSNG0rSzVybE15ZUJEaXpNQjVqd3U5L0tlVDE3V0k0MkJYN25YNnNL?=
 =?utf-8?B?clZGaVlBMWRYTk9PQVZJcXlwaTM0Y3JhTXhkMDJtdk1xTFhweitzMWFVME1l?=
 =?utf-8?B?YWorNndkUDl1WWlNZEVSNTBpV1JQSHY4eVFoRUI0ZHNpUWw5OUtFMEtVejJZ?=
 =?utf-8?Q?j58TxeGhQ6VPg6u0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5140217c-fd76-4835-d033-08da350e705f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 18:28:56.3893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Mib9xWnWBgGS96mqJPTME2s6U4FqwA+2+uUcKonAV12AqT9cdB89kCrIvzfixOpUsd1RkkuGiKsWhseilsG6Uq9KfpjKHxo7+ZoAyIEC+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3040
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-13_07:2022-05-13,
 2022-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130076
X-Proofpoint-GUID: qdBi7y7OV4rssl9xTvzxzFYgyc_I5LGm
X-Proofpoint-ORIG-GUID: qdBi7y7OV4rssl9xTvzxzFYgyc_I5LGm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 16:06, Joao Martins wrote:
> On 5/13/22 13:33, Michael S. Tsirkin wrote:
>> On Wed, Apr 20, 2022 at 09:11:37PM +0100, Joao Martins wrote:
>>> It is assumed that the whole GPA space is available to be DMA
>>> addressable, within a given address space limit, expect for a
>>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>>> whether the selected GPA is indeed valid i.e. not reserved by
>>> IOMMU on behalf of some specific devices or platform-defined
>>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>>  -EINVAL.
>>>
>>> AMD systems with an IOMMU are examples of such platforms and
>>> particularly may only have these ranges as allowed:
>>>
>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>>
>>> We already account for the 4G hole, albeit if the guest is big
>>> enough we will fail to allocate a guest with  >1010G due to the
>>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
>>>
>>> [*] there is another reserved region unrelated to HT that exists
>>> in the 256T boundaru in Fam 17h according to Errata #1286,
>>> documeted also in "Open-Source Register Reference for AMD Family
>>> 17h Processors (PUB)"
>>>
>>> When creating the region above 4G, take into account that on AMD
>>> platforms the HyperTransport range is reserved and hence it
>>> cannot be used either as GPAs. On those cases rather than
>>> establishing the start of ram-above-4g to be 4G, relocate instead
>>> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
>>> Topology", for more information on the underlying restriction of
>>> IOVAs.
>>>
>>> After accounting for the 1Tb hole on AMD hosts, mtree should
>>> look like:
>>>
>>> 0000000000000000-000000007fffffff (prio 0, i/o):
>>> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
>>> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
>>>
>>> If the relocation is done, we also add the the reserved HT
>>> e820 range as reserved.
>>>
>>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>>> ram-above-4g relocation may be desired and the CPU wasn't configured
>>> with a big enough phys-bits, print an error message to the user
>>> and do not make the relocation of the above-4g-region if phys-bits
>>> is too low.
>>>
>>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 111 insertions(+)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 8eaa32ee2106..aac32ba0bd02 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -803,6 +803,110 @@ void xen_load_linux(PCMachineState *pcms)
>>>  #define PC_ROM_ALIGN       0x800
>>>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>>>  
>>> +/*
>>> + * AMD systems with an IOMMU have an additional hole close to the
>>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>>> + * The ranges reserved for Hyper-Transport are:
>>> + *
>>> + * FD_0000_0000h - FF_FFFF_FFFFh
>>> + *
>>> + * The ranges represent the following:
>>> + *
>>> + * Base Address   Top Address  Use
>>> + *
>>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>>> + *
>>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>>> + * Table 3: Special Address Controls (GPA) for more information.
>>> + */
>>> +#define AMD_HT_START         0xfd00000000UL
>>> +#define AMD_HT_END           0xffffffffffUL
>>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>>> +
>>> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
>>> +                                hwaddr above_4g_mem_start,
>>> +                                uint64_t pci_hole64_size)
>>> +{
>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>> +    MachineState *machine = MACHINE(pcms);
>>> +    ram_addr_t device_mem_size = 0;
>>> +    hwaddr base;
>>> +
>>> +    if (!x86ms->above_4g_mem_size) {
>>> +       /*
>>> +        * 32-bit pci hole goes from
>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>> +        */
>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>>> +    }
>>> +
>>> +    if (pcmc->has_reserved_memory &&
>>> +       (machine->ram_size < machine->maxram_size)) {
>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>>> +    }
>>> +
>>> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
>>> +                    pcms->sgx_epc.size, 1 * GiB);
>>> +
>>> +    return base + device_mem_size + pci_hole64_size;
>>> +}
>>> +
>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>> +                                          uint64_t pci_hole64_size)
>>> +{
>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
>>> +    hwaddr start = x86ms->above_4g_mem_start;
>>> +    hwaddr maxphysaddr, maxusedaddr;
>>> +
>>> +    /*
>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>> +     * to above 1T to AMD vCPUs only.
>>> +     */
>>> +    if (!IS_AMD_CPU(env)) {
>>> +        return;
>>> +    }
>>> +
>>> +    /* Bail out if max possible address does not cross HT range */
>>> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Relocating ram-above-4G requires more than TCG_PHYS_BITS (40).

I've eat a word here and it should be TCG_PHYS_ADDR_BITS and not TCG_PHYS_BITS.

>>> +     * So make sure phys-bits is required to be appropriately sized in order
>>> +     * to proceed with the above-4g-region relocation and thus boot.
>>> +     */
>>> +    start = AMD_ABOVE_1TB_START;
>>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>>> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
>>> +    if (maxphysaddr < maxusedaddr) {
>>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>> +
>>> +
>>> +    x86ms->above_4g_mem_start = start;
>>> +}
>>> +
>>>  void pc_memory_init(PCMachineState *pcms,
>>>                      MemoryRegion *system_memory,
>>>                      MemoryRegion *rom_memory,
>>> @@ -823,6 +927,8 @@ void pc_memory_init(PCMachineState *pcms,
>>>  
>>>      linux_boot = (machine->kernel_filename != NULL);
>>>  
>>> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
>>> +
>>>      /*
>>>       * Split single memory region and use aliases to address portions of it,
>>>       * done for backwards compatibility with older qemus.
>>> @@ -833,6 +939,11 @@ void pc_memory_init(PCMachineState *pcms,
>>>                               0, x86ms->below_4g_mem_size);
>>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>>> +
>>> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>>> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>>> +    }
>>
>>
>> Causes a warning (and so a build failure) on 32 bit mingw:
>>
>> ../qemu/hw/i386/pc.c: In function 'pc_memory_init':
>> ../qemu/hw/i386/pc.c:939:35: error: comparison is always false due to limited range of data type [-Werror=type-limits]
>>   939 |     if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>>       |                                   ^~
>> cc1: all warnings being treated as errors
>>
>>
>> Looking at the code, how is it supposed to work on 32 bit?
>> It's ok if it does not work but I'd like a graceful failure
>> not a silent corruption.
>>
> It didn't work on 32-bit qemu binaries -- My apologies for my oversight.
> 
> This diff below fixes the 2 warnings you got.
> The rest of the added code uses hwaddr which is defined
> as a uint64_t already (...)
> 

Towards your second question, I had fixed a couple issues in v2->v3 wrt
on 32-bit boundary calculations, but 32-bit binaries I am not sure
it is supposed to work with more than 4G (or even less). First, we are
limited by TARGET_PHYS_ADDR_SPACE_BITS being 36 and the address space
check in the code above blocks if phys bits aren't enough before it attempts
changing at anything related to AMD above-4g-start, but that's target-defined
and comes a lot after. Even before that we get the 'ram size too large' after
casting the memory size to a ram_addr. At least from trying out x86_64 target
compiled in 32-bit. The functions above are basically not changing
above_mem_4g_start at all and hence the test -- after fixing warnings -- will
always be false.

