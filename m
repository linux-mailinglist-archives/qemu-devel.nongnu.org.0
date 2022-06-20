Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97E4552436
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:50:05 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MTM-0006zh-Ke
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o3Lub-0003t0-Fv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:14:09 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o3LuT-000520-Ec
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:14:08 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KH2S0M012569;
 Mon, 20 Jun 2022 18:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=egUiFgbYpYvTm5MH1FzYPsNiXJnOOpNY/ML/ZXMTHH8=;
 b=kMTviUZ/eKA6PRfS/ZP9a8llRCwot6vW40wctjTZoG42Uxb+Mg/TihUWzQgABOITqpPV
 wIN13256bG3vt8uTq+tud261VOkwWyl8kh0A74hd9exp33UpDXzdtj3rSkS3WG2NgVTA
 4/jhtLjU9PdqFotkmcZoCVWY0DYX2kUTfV2jHUnPKfkrftpVtHiyX0N7iMdOv9m88fwF
 CIBt3VYVJbG7r4FUiLG7SMcsMIXxaFDoABU0T8AViuoupxa04DhrBphCSP/EXkdaiWtT
 fFGkFA8ncAr/Wi8h4tEp02xKA4aNvrDOz4Su6syYu9J2sMudTFxeGjVYqgVBVzCB86iP lw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6asuuss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 18:13:56 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25KIAZSp037437; Mon, 20 Jun 2022 18:13:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gtf5bp0ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 18:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI4Lh+lREVRkdfWzZBH5EcGhvafy03dIf9PjfjLvTFfF+q8J/OMNvk0scG9cDzsDQhFKGsl0vJcZJ5tSrJASmvIpxCPEQvusQQS3OJuyqMQ+fPizsQMwyv5w3VuO6QlbefrmLVy/aXHBnil7Asupq/Yrh7tLJ+OZt7UMxAz1Iionwtx6PZv9gPwQz3dvMQFLS9ni8rBZRIdFixJ5Q4jdMRe3V5nJ6QAyDYHs1xl57s2MT+gM5cRkR35LTAURXgnmH8GWKatClPSqK6iCFpujTevA6jgsbarm7u7tmLVcjpAlT4y0h2rJ1F6ELYPKVvuDV5ngkP+waSBVb8r1TvyhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egUiFgbYpYvTm5MH1FzYPsNiXJnOOpNY/ML/ZXMTHH8=;
 b=OiKOwmrC8BkKbNpfsc2HvlN/gtSMtUdZx6itl/NyGehVgdBHlPnMOkcJrM9mqtH58cnZQ9VsIizD8MsE1qf/Nn9CvLGhu+m8sei6RP+YAQXSUJ5+MlhM9tIOvDa1depwIxn9FqbPvZQ2Vw9z5g49UGDkoU4UYTGwGeQm9O6KVhrjv/wii7A5J8Jiq+OK2ibRNwGdptlBzoMMjZUXZNmDKAnPKd+3Iq7NE2cdc46n0daeHKIU54v75M19go0wyDe93giPcaa5oKndyB++tQU7MoNFRLpfL/qMEd9ErGspnFBt5aqwwMC7095oF7j5pZFSQvZYlQJ3n0hPvPFmnLGSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egUiFgbYpYvTm5MH1FzYPsNiXJnOOpNY/ML/ZXMTHH8=;
 b=UrwlGzy38zARvknBWuwnWRN0Bucj76lAquhSgWUJTGChnbj4ezmTwlJeZsZAtZTbVtRhronwp68P/86SojkqNsxBTSBZSQBi2Q8a5MqS7YFFIyL77DgIX/HuDzxZTG65TcgyRbhstt3aXRR3+CoZKH16SXDn8Xm5yVsiiCM//gI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN8PR10MB4100.namprd10.prod.outlook.com (2603:10b6:408:af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Mon, 20 Jun
 2022 18:13:53 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 18:13:53 +0000
Message-ID: <5a094bd6-ebc1-c512-e97e-c1edba94f41a@oracle.com>
Date: Mon, 20 Jun 2022 19:13:46 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
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
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
 <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
 <20220620162720.2ea44444@redhat.com>
 <07368ec5-98bf-20e2-71e6-c258370970fc@oracle.com>
In-Reply-To: <07368ec5-98bf-20e2-71e6-c258370970fc@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e84535b6-7c09-4bc7-fbea-08da52e8a20a
X-MS-TrafficTypeDiagnostic: BN8PR10MB4100:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB4100A169404A5D0A8982DB59BBB09@BN8PR10MB4100.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P5o1IgCWp5/MpuXHCH/pPD6uOANcRHMN/mBbo/fS69y3cFiemTjDQ3g+Zc3S02bYwGyDaJ+sHIoL/CG4Ens/o0Hd/IfYchx/r8t/3Ai0o0a6bJNivAquQv0eCQuma+JvmDkrdQ/jwQRJTg9re4twSgez0Zy8lsxORRRZ/U3VFeZnB8rZ24BZJzXdLYpX4bYuRpru96ww4HNg9atXGFKPWcYhZzbGNSTipoOzle/If82hOkrdaMEywisTHMX6zhaY/TTeNPgxq8m3kUv+TBaD8k37EVONe9CqlSVkToVJaazrzFqa2VWrEvHjrCrWCvf27cZ40+mK3Kku73AFTto1tYGhgteaMq6JLf5mBvVbgcjYvKQDPu5knQjCawxmgw1kD+BEr/1VzI31816rlejdstxTvI3x5KzlfXN/fb0TWWLnpmq7Hqxf7LnR9x3FkiSbGeobiyv6TXtioxYsESYfTD3YL9zV58QKYAoRYnZHlQBE2XgVN6WxxwKa5Dige/xa0XsP37QOyAfwJlLmGZ5egh7j0Xd2vpnwrB9OL9LCTcqFahEro1ovkU0d60rCe4rxnsMexRY7jwszD3yREKgeLgWm2y9Y/U2hz/iClSgKOJAIT6iFOxbz3FD8lsWgHQ6MVy2UzDrJfEkOmzyNOUotFwsG5lxDHF8nNxd0CdEyJAWV+/K7wFA77J1V0JcSIuZHlzoSSCCUabJTRvYBwwIEYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(39860400002)(346002)(376002)(136003)(186003)(2616005)(41300700001)(26005)(6512007)(83380400001)(6666004)(6506007)(53546011)(36756003)(31686004)(2906002)(38100700002)(478600001)(6486002)(7416002)(6916009)(54906003)(8936002)(5660300002)(66556008)(66476007)(4326008)(66946007)(316002)(31696002)(86362001)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWQ0ODhWeTk3N1dhQzJ1UE10UlFrTWVFQU9aT3NndHlQd2dXVEN6UFNYTzR6?=
 =?utf-8?B?V3UvNDV0dFRkWWtPR01NcjluQThLczhCSnp0NkJ1NzQ4TWpBenU1NTlEaSth?=
 =?utf-8?B?SVlCYkxZYVRDS2doRENCSFRXU1B2ZWdoUUdza0NlemU5bGRiZTBEZ1FJL0NR?=
 =?utf-8?B?Z2RLSDlhRWhSUktrNEpFOEtsL09QZ1lheEx3TFhKT2ozeFRXeDVBWWVTTlNX?=
 =?utf-8?B?ajM4QVlZK2o5S1hOU0ZxOVVWUmJ5UVVtS09MVXRhNjZrd3BXM0hOS09nWnRF?=
 =?utf-8?B?R1ZzQlJGeTQ3alV2aDYyeU1YTlp1MmdQR1VnMzd0U2FGVkJJNklTZUNrVEdM?=
 =?utf-8?B?ZGFOczNrREx1ZmU5R1ZIaFdqRXRDTW5lVkFNMk5WanlaSTZxVkJOZWRFaDRh?=
 =?utf-8?B?QVhOMno0elQ2MFJudENtK3Y3RjVDMXF0dU5TUlhKTzFWOEV5V0t3SGlCWGs1?=
 =?utf-8?B?NmNMK2hVV0srZm5UVFA3c3R0V3VlWSsrbjk4aUdkNWdHSDZDQW53Ti9ZUW9v?=
 =?utf-8?B?QWpyWDJZVGx3WE1HZTVON01JRTJHSWRqQVNUSDhDSzZDVjVrL2xzM09ZNjNK?=
 =?utf-8?B?UEdnQVpDVWxzR3F6d0xHNzBFK01ieWRHVFB4VlR5NFgvaGQrbTJId2xseU1M?=
 =?utf-8?B?aXVvSHVnMnFFVmwyWmhOSXNCWnVWdnZWN3ZmanlEZ1ovaTBQS0xtY1RlSnJX?=
 =?utf-8?B?SkpXM3pPTnF3K2NyaWkwRGYzMVU1VUxycHdNM2dTNkhQZ3VEUUtKbEtRQ2Fk?=
 =?utf-8?B?U3RnUDZHWStVZllpU0lDeFdFSGQzOWNCRlZZVzFKVWZpR25SZHFXZUdSTi9S?=
 =?utf-8?B?cXNsZnMwYXlsbVlsUXo2WDVzRDJwYmlaQ2hBSWsrdEFzMC9DWnN3V3B5NjRj?=
 =?utf-8?B?c2RRWGxjcVBXcExGZEphK1ZRRG1KRGd4NHZPRjFxU3AxVnkwa0J5RzBoem5U?=
 =?utf-8?B?L3NJb29DNk9TRTN3ZFFXeUNHSE8xQTlNNTFFVm1EZ29NY2RnWjk4TmJJb3JH?=
 =?utf-8?B?T0FMdzZ6eURlOHN4TUlwM1ZsOFBMRysvZVBVWW5pd09ENDNtOVM2bHljY2tS?=
 =?utf-8?B?eitGY2FzY2Zta1hBNEFScHdOU1lRS2FOUUZReTk0Zk5FK3U2QWQrd2haTXV2?=
 =?utf-8?B?SUozMytuRk5yK21sS2pEYmJKb0hkV0srOGFZTElWcVBPaTIxVGU1UmMvZTRz?=
 =?utf-8?B?UFZRQ2N3VmFDd1VwdlZiTCs1TjNYMXRxTFIyUndXYUJwWThBN1RGMUZldWFp?=
 =?utf-8?B?QmRVWGtlVmY3NDB4WlVEUTRudVpSb2dQL0x1cDl4eGNkT2d0aUdyUVVoUkxF?=
 =?utf-8?B?U253MTQ0WXEwNjF6Q21HUkNUQ0dNQ3ZlTnpaWHF1dXpCRE9VVTg4Yy9LV2g1?=
 =?utf-8?B?Y2Rrd205d0RwS0xLOUNnWlYrRlhPd21SMFgwTDZMemdub09lUkNaL1hZZWlh?=
 =?utf-8?B?TGxHQjltMXNGTENwMEZ6eFgrWXg5TGMzMjdST0c2Z0RKcjdzTDJYQWUycWZL?=
 =?utf-8?B?YWZuSUloSU5WcEtaUzRqT29lTGhTZ05HVzU2NHJTVWJyUzNram9MT3JoS0kx?=
 =?utf-8?B?d0NITjJBRmtxSTYzb2dhcmxWeEhtYlZkaXlrdklKc1dFM0FOUkdrWUNTMVBD?=
 =?utf-8?B?MGtLQ29JVjZZRmFobGxTRUFrQytOQ3VJS2xnZmtPcUlXbXg1NWVxajNrcFlF?=
 =?utf-8?B?N1ZVWnIwT0NpOTVLN0x6UU5DRnJMZ3JCK2RMZkdIZy8wdVR6TythckFva0pY?=
 =?utf-8?B?a1pIVDBFWjlscFQ2V2VraUdqSG40S2Z5eEh3ZDB3dHF4L3dRNE1MZktoaGdl?=
 =?utf-8?B?NFVjV0xKN0NQNGM5cFMxMjk5K25WQWd5YW1uUGc1THY5eEt1b2NuZjNEZmdn?=
 =?utf-8?B?a3p5ZTVROFFDaWY1enlldTYxTlVpOUdLMHd1OWNQMVhQWG9BTUx4REx5T015?=
 =?utf-8?B?SlRTTHZRZ3BXRmxMbWxNVE9UVmVDNU82MW1ac0FtWURoTVRTRXB1YTF6ZGQy?=
 =?utf-8?B?T2pZVmdqN1pJdndSNzhaREdHVFpDNVozcXI1VzdsczJQVkxmTGRYWTA2Tzhz?=
 =?utf-8?B?Q1JHZ052S0N2MzlhcW0rV3h2emRJSmtidWoyTkNDWFpjWlhRMk5zVmRJRUJM?=
 =?utf-8?B?SmIxWFNLRGM4a1FVUkMyRFRSZTJVbmJLYUgyUTJrNzRjQ09yalU3MXZTdVY5?=
 =?utf-8?B?WURGQVM5K0hwVmovRVpudGFoZ1BxR1NrQ2FoN05sNUtUVVE1RzBwVkNVN2ph?=
 =?utf-8?B?TnF4UzBPKzIrbEZudUJ1R2UvdTBEWjVTb2w3aW9BTHEvVFdML2xtR25FeDhN?=
 =?utf-8?B?b0ltT3pzaUhIN3lGWlRtdzY0MWNWR3Fvd1k2Q0lrSDhKRG9LU0NVMHNRYkgv?=
 =?utf-8?Q?vOtI1sjl5jXi4TME=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84535b6-7c09-4bc7-fbea-08da52e8a20a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 18:13:53.3378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHI0dpSn4gtwuvxcqA9P9mAvcGi6JiKRMUiVVU4LLz9ip62wnkCHE6LZYJNn6USopJD/WoSkdc04GUugaQJrNtvBaCKvgQN/T4fL7EnhmJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB4100
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-20_04:2022-06-17,
 2022-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206200081
X-Proofpoint-ORIG-GUID: kwAe7ub1_T_SAuOh-kB0MrjzzmMWalLk
X-Proofpoint-GUID: kwAe7ub1_T_SAuOh-kB0MrjzzmMWalLk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/20/22 17:36, Joao Martins wrote:
> On 6/20/22 15:27, Igor Mammedov wrote:
>> On Fri, 17 Jun 2022 14:33:02 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> On 6/17/22 13:32, Igor Mammedov wrote:
>>>> On Fri, 17 Jun 2022 13:18:38 +0100
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> On 6/16/22 15:23, Igor Mammedov wrote:  
>>>>>> On Fri, 20 May 2022 11:45:31 +0100
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>>> +                                hwaddr above_4g_mem_start,
>>>>>>> +                                uint64_t pci_hole64_size)
>>>>>>> +{
>>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>> +    MachineState *machine = MACHINE(pcms);
>>>>>>> +    ram_addr_t device_mem_size = 0;
>>>>>>> +    hwaddr base;
>>>>>>> +
>>>>>>> +    if (!x86ms->above_4g_mem_size) {
>>>>>>> +       /*
>>>>>>> +        * 32-bit pci hole goes from
>>>>>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>>>>> +        */
>>>>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;    
>>>>>>
>>>>>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
>>>>>> that's located above it.
>>>>>>     
>>>>>
>>>>> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
>>>>> otherwise. We won't hit the 1T hole, hence a nop.  
>>>>
>>>> I don't get the reasoning, can you clarify it pls?
>>>>   
>>>
>>> I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).
>>>
>>> I was doing this before based on pci_hole64. phys-bits=32 was for example one
>>> of the test failures, and pci-hole64 sits above what 32-bit can reference.
>>
>> if user sets phys-bits=32, then nothing above 4Gb should work (be usable)
>> (including above-4g-ram, hotplug region or pci64 hole or sgx or cxl)
>>
>> and this doesn't look to me as AMD specific issue
>>
>> perhaps do a phys-bits check as a separate patch
>> that will error out if max_used_gpa is above phys-bits limit
>> (maybe at machine_done time)
>> (i.e. defining max_gpa and checking if compatible with configured cpu
>> are 2 different things)
>>
>> (it might be possible that tests need to be fixed too to account for it)
>>
> 
> My old notes (from v3) tell me with such a check these tests were exiting early thanks to
> that error:
> 
>  1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
>   killed by signal 6 SIGABRT
>  4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
>   killed by signal 6 SIGABRT
>  7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
>   killed by signal 6 SIGABRT
> 44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
>   killed by signal 6 SIGABRT
> 45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
>   killed by signal 6 SIGABRT
> 
> But the real reason these fail is not at all related to CPU phys bits,
> but because we just don't handle the case where no pci_hole64 is supposed to exist (which
> is what that other check is trying to do) e.g. A VM with -m 1G would
> observe the same thing i.e. the computations after that conditional are all for the pci
> hole64, which acounts for SGX/CXL/hotplug or etc which consequently means it's *errousnly*
> bigger than phys-bits=32 (by definition). So the error_report is just telling me that
> pc_max_used_gpa() is just incorrect without the !x86ms->above_4g_mem_size check.
> 
> If you're not fond of:
> 
> +    if (!x86ms->above_4g_mem_size) {
> +       /*
> +        * 32-bit pci hole goes from
> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> +         */
> +        return IO_APIC_DEFAULT_ADDRESS - 1;
> +    }
> 
> Then what should I use instead of the above?
> 
> 'IO_APIC_DEFAULT_ADDRESS - 1' is the size of the 32-bit PCI hole, which is
> also what is used for i440fx/q35 code. I could move it to a macro (e.g.
> PCI_HOST_HOLE32_SIZE) to make it a bit readable and less hardcoded. Or
> perhaps your problem is on !x86ms->above_4g_mem_size and maybe I should check
> in addition for hotplug/CXL/etc existence?
> 
>>>>>  Unless we plan on using
>>>>> pc_max_used_gpa() for something else other than this.  
>>>>
>>>> Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
>>>> present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
>>>> large enough on CLI.
>>>>   
>>> So hotpluggable memory seems to assume it sits above 4g mem.
>>>
>>> pci_hole64 likewise as it uses similar computations as hotplug.
>>>
>>> Unless I am misunderstanding something here.
>>>
>>>> Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
>>>>   
>>> I think this was what I had before (v3[0]) and did not work.
>>
>> that had been tied to host's phys-bits directly, all in one patch
>> and duplicating existing pc_pci_hole64_start().
>>  
> 
> Duplicating was sort of my bad attempt in this patch for pc_max_used_gpa()
> 
> I was sort of thinking to something like extracting calls to start + size "tuple" into
> functions -- e.g. for hotplug it is pc_get_device_memory_range() and for CXL it would be
> maybe pc_get_cxl_range()) -- rather than assuming those values are already initialized on
> the memory-region @base and its size.
> 
> See snippet below. Note I am missing CXL handling, but gives you the idea.
> 
> But it is slightly more complex than what I had in this version :( and would require
> anyone doing changes in pc_memory_init() and pc_pci_hole64_start() to make sure it follows
> the similar logic.
> 

Ignore previous snippet, here's a slightly cleaner version:

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8eaa32ee2106..1d97c77a5eac 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -803,6 +803,43 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)

+static void pc_get_device_memory_range(PCMachineState *pcms,
+                                       hwaddr *base,
+                                       hwaddr *device_mem_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    hwaddr addr, size;
+
+    if (pcmc->has_reserved_memory &&
+        machine->device_memory && machine->device_memory->base) {
+        addr = machine->device_memory->base;
+        size = memory_region_size(&machine->device_memory->mr);
+        goto out;
+    }
+
+    /* uninitialized memory region */
+    size = machine->maxram_size - machine->ram_size;
+
+    if (pcms->sgx_epc.size != 0) {
+        addr = sgx_epc_above_4g_end(&pcms->sgx_epc);
+    } else {
+        addr = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+    }
+
+    if (pcmc->enforce_aligned_dimm) {
+        /* size device region assuming 1G page max alignment per slot */
+        size += (1 * GiB) * machine->ram_slots;
+    }
+
+out:
+    if (base)
+        *base = addr;
+    if (device_mem_size)
+        *device_mem_size = size;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -864,7 +901,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;

         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -879,20 +916,7 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }

-        if (pcms->sgx_epc.size != 0) {
-            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
-        } else {
-            machine->device_memory->base =
-                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
-        }
-
-        machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
-
-        if (pcmc->enforce_aligned_dimm) {
-            /* size device region assuming 1G page max alignment per slot */
-            device_mem_size += (1 * GiB) * machine->ram_slots;
-        }
+        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);

         if ((machine->device_memory->base + device_mem_size) <
             device_mem_size) {
@@ -965,12 +989,13 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    uint64_t hole64_start = 0;
+    uint64_t hole64_start = 0, size = 0;

-    if (pcmc->has_reserved_memory && ms->device_memory->base) {
-        hole64_start = ms->device_memory->base;
+    if (pcmc->has_reserved_memory &&
+        (ms->ram_size < ms->maxram_size)) {
+        pc_get_device_memory_range(pcms, &hole64_start, &size);
         if (!pcmc->broken_reserved_end) {
-            hole64_start += memory_region_size(&ms->device_memory->mr);
+            hole64_start += size;
         }
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);


