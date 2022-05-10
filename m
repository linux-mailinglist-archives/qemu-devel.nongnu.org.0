Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940CE5211E0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:10:40 +0200 (CEST)
Received: from localhost ([::1]:54920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMpD-0007A4-LB
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1noMPF-00065a-Bt
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:43:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1noMPA-0003bu-JV
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:43:47 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A6wuqc023623;
 Tue, 10 May 2022 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7sxhLMgbFJSxFs5Px9CjPgp/o3M9o/Ppu5Xk3HQRkec=;
 b=PVs56TfXyv5LyM7htLvM8plY0tz081dFBjN2xqrzNr+KDqDQQRB9AYFvEZcvITX02cLL
 eZOPswJW6/iRvGgtObqwuHwwrv7EY6J7YCy9UV83PJuoxOZik94rUnqjIZZ0rVTMf30V
 G7tAoCD1kbv0FainHcon/TIK0Q8nDhqEGNV+UZ4lNADzJoi4KZ7uGFdBRrENc/G+OG49
 5OMOcanLTX6vTp0BZ918/WVGkaaRd0BYTNdJ7mWkXyRzmbAMJKRxNHGtPqFVYQ994V6e
 0yqZdCogYcayLeYjHiZzMwGKGJNJgbvcpwhmWAYmzChmYlPXjaBaHRNhcwBfhxML/dZT Fg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgcsp6u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 09:43:37 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24A9f0sU028205; Tue, 10 May 2022 09:43:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fyg6d9uex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 09:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbPvJOCR2p9xY5idZvteAy+REdZg8QJ2W3sXPadBvtdm05kaAtyzPGTbgxMmD9jHu2uOvkKG8hWZO3MnXMz607bIbhohtOuwtsSOJehcB5doFeAGhyvvzL3OcRrlDEwLcAogQb9C1cqx/rYA92H/ferCcwnA6J8rOlEJmWYPq62nkHs7MmNkGf/14nMlV7zWqp4usVaQrrX7JH7EflYKboI2EYB899+wgAcdP0Hd9xsYyQf5V5nMb4dElY6TwD+ZONGr5lNB7tQBqMBR4c2Jqz/LFaxjcgovJ06QfAFu4FjbzEWYY8SEzoOLTosruZfcckl3jcn9ke+m4LsmoKSGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sxhLMgbFJSxFs5Px9CjPgp/o3M9o/Ppu5Xk3HQRkec=;
 b=V0Pl3kIx6qLch8zriORmyi4TLj8yA0mIwn03fjKdX2rgj8Bvxr1TXfEaXgr3BuAf4KxRrHIIPi4790ylFJ8k+Nnna+++2al5N3y1zId2OIigkGGEz77AjZzzN4AWxmIENMjRVmp5VE2ZTVbjEZ0P22kJh/g5wQh5siMasnIbK4qqgL03iM0DNEsjzFoQEGC2QN6AdIkOlpbEZ6DceiSQ78Sp3TVHJcVXIcxKESOL1upHjox7NhjTXGIkHV9XVHl+1Rq90LeNimi5qx47X99yOxzECni7snAI16QbSV511fx3uHbvlI/beLDDTyaBmJoq0pAwNqiR3OnfXnlPuhq3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sxhLMgbFJSxFs5Px9CjPgp/o3M9o/Ppu5Xk3HQRkec=;
 b=oA/IC6pSzJ2O+pGxCCGJKxDpRRjCnm8kK/Mh8uRdi/PY65wGRO3lbK1FJu4zqS1xEctEsOHdH8JVOD3tOS79Rct0u4BJcz7UNdyt2BydemAAJPH+g3YShU23hX2/03msn3Xb7heckn4CFTMMUyR+UBZOUwXDP1WfccKDPiR6UgY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR1001MB2207.namprd10.prod.outlook.com (2603:10b6:301:36::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 09:43:33 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:43:33 +0000
Message-ID: <d4f9ce8f-42df-e06c-e9dc-8b6ff12f2e5d@oracle.com>
Date: Tue, 10 May 2022 10:43:27 +0100
Subject: Re: [PATCH v4 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e923c6-e418-4425-cd06-08da32698c58
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2207:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2207B5A93365ACC9790A84AFBBC99@MWHPR1001MB2207.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxCo2XqG09VpCuxYVPs8/QIjs9LPs30E2otkzwK/2on2othtPtoI9ut2i2LXtbKgX9+aTRs8elBxzL/jua2T8ZugP/hjPviT+c998EW2YdWjSuvgm7LsUp3QWkT1y1MyjjN7KPd1abGDFxSkWz26QX1vCT4NSrPQfiRm7Nqx/tsFGh9BdDMFA16GkOWv6xTuadhIpCmTGlncgYpkhDVXuc+7E1LJj32RjHVKiIth/jduYpfUL/hqVMwArkpkaSi4DVA+U0xBj93J351ALCBOecDEn22stXd3zOIhWw56TIxngx8DFgx6KBU7I4yJRBD9kz93BA/eO1bObmAMbqg2g9zEJyVhQH5H075YheTpmb6djYXqi3QvqjS9wc+PSpZ4h5NiCa7sdG82w4jkaVpcnaUt5abHUPWGplz/4BR9dE7Z6+f8G/q3ImhaGAFYpP997KUo4xX5gCFAow19LMI/4+VRLnVCE9f6wcTvjf5I2YVXtbMXLlCpvTlWI7Lea3YuIm9Ce1dTmRoZyW116/1GWks7+BGOet4WbHno5a8bk2yzsJZFdC7lwlaUjpLsazXXwYveOoQFYTxqrtagoBGiGjCzngXsfx+HluYw2Jc0wtCW6UWv4uE5e+d8Ms6dCf+Pawag8OncGp3sd1NMwB+v+HyES6/L/WMWMMs5AchUxL3ds+lImoVyf/Iqs65GzQMX2ToBGx8bUJarOqLT9oZXieJtsY6NoiLBiRRHPZ/ZWlVyVdTcQ0nFBwTNeHcunLuuMzNp2QGKZaiGl/hTKMsPhbeCAybFXPZU2bFCglzUgKyj7Vg0DnVOZ68J+7m3wNxgKL3hVQuu5UxlvIsvdR3Q9edYMSNzt0AN5RXpThLhgOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(966005)(508600001)(2906002)(38100700002)(31686004)(6486002)(7416002)(83380400001)(5660300002)(2616005)(186003)(66476007)(8936002)(316002)(66946007)(4326008)(66556008)(54906003)(6916009)(86362001)(26005)(6512007)(6666004)(53546011)(6506007)(8676002)(31696002)(45980500001)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRkZ0txWVEvTEp6a1FGclhmOW56bkFieUkyTDB2enRjZGFCSlQvUHYvb1Bt?=
 =?utf-8?B?blVpbGc5bWdJbDBsWUZVNzdVSXdMd2s0V3F0M1NoZzJLajlpRGhrWldiZ1Q5?=
 =?utf-8?B?alNJb1JPTjlWQzVYenl6RjZLM0tubnRFdXQzbTY5RkYvdlVFZ0FVRmZodXln?=
 =?utf-8?B?MmdncHl5WGx3Si9nTTFlS0dTRG9PN2luSGpPVkhDTFhnajRWRVloa2EySy8r?=
 =?utf-8?B?K21RdVZuUHRQdThnc0RCL3Z4REpSV3VWMmpnNXNtbXh4U2lTU1pXK1BMZnUw?=
 =?utf-8?B?ek96enR1TWpsQnlKcWhtNi9RV0V1WTEvZkFLR1hWTnAwQ3pJUGE2eHp0UkJN?=
 =?utf-8?B?L1gwNFQvT3FnWGd1UTRvaGl5bHdRakF0WVpOTWtjSjFwQ1k3aitUd0VqSkVv?=
 =?utf-8?B?V1JKNTRyTmd6NEJINW9HSkx5V3l1UW1sM0RUaE1yV3NiWmw0NCtDL0tmdW5S?=
 =?utf-8?B?eTlsOE0yYWsrdkNSUXJwOVVoVGs5RGhPemVMVnZudnhteU9yN1R5Y0V2MXZC?=
 =?utf-8?B?b3VvUnFKRVgxQUt3ZjVrQ3BveXBvS0s1SG0xS2NFc1FFUVY0akI2MjV0VkZF?=
 =?utf-8?B?SkFzVTVuV2pPc2NBVW5JbFpTNU1MQytOcEQ1clB2RTYwWTlyR1hIang4dGtP?=
 =?utf-8?B?ZGExaEZjSjZEOU10MldKenpGbmZVR3ZBc1Y4RkhFeFk3Wk55T2FtYkZTMER6?=
 =?utf-8?B?bDN1aTlHZ0NBcnNqSE9BZzhjTHd6RjBzbCt6akVMV01iRjhqLzQrSnpJWnpp?=
 =?utf-8?B?YVBVUDdwTVFZemZNQTNGYTVpd0FpeDZtR053N05UWFVKOHhCdW5lOU5BZ1pk?=
 =?utf-8?B?bkp0MjhOZGhXNlNqQnB5YklmRFdPd2lCVWRMVSt0RVBRbUtzOVgrOEtGTWFQ?=
 =?utf-8?B?V21FVVhDYWp2SWtuSWZydXlMS0FvNlNFa1R5Z2ExNkY1SU9RQ3hvdHJkTm5v?=
 =?utf-8?B?emcrL0FjNnBIMXlRWVJpNWpQek1ObVVnWGZrVm1vUVpjNWZpd3BqK0VaWTln?=
 =?utf-8?B?N0s0alVLRHB4aXg4TzVselFvRENiSk1iMHZHWW15QkZxd3dKVkk5K2kxMVJD?=
 =?utf-8?B?TjVya2h3UUora2lMTEpDbE1VNVNCWjU2Z1RKNWlnczV3cWdER0UvWGhXa0ZZ?=
 =?utf-8?B?VFZPK2NMQUc1OWsxWmJzWERSbnQ5cHFhOHJCUmpsZGFGczA2N21GR3k2WVdS?=
 =?utf-8?B?OXBFWGxsUDV5d1R0QXBJSkVjeEJZRUtPQVVFdXkvblU4aWFTVytsSG5GcEVH?=
 =?utf-8?B?RG5pdVNPZ2VNOGxGbVdRdVc5bm9Rci9yWHVNcC92K2NOTmQ3ZEhRYk1ySmp0?=
 =?utf-8?B?Vkp1Z2RIbUIzd2MxWi9Vb1plNFlGeVBxVE1USm1GQStBOXZaVlFVS2lnVmhL?=
 =?utf-8?B?SHViTTRJY2dXVys2THBKSnp0NXU0N01naUFBRmlFQ2RZK1ZPaStvWjlxREV1?=
 =?utf-8?B?T2UxQnlhUklzcitGVk1tRUJncnB3NGNwUTJ4REd4bGNSa05xM1pjWVJQOCtm?=
 =?utf-8?B?aFUyeHF1cDJ2M3ZnNjlCNThsdmFHZ0RDNTd0SEVOajB3T0EyNjN2S3IyTHpQ?=
 =?utf-8?B?WWNJRVRlY1d0MkdyWXhMMU1SMTUvcjcxYmhLZmw4NXZvUVcra2poS1VaRTdJ?=
 =?utf-8?B?RUw5MEJLQVIrVFQxZjgyY0Myd2tTU2ZvMHNpeHdkbXlialNIS3V4ZXZqc29n?=
 =?utf-8?B?bmN5TlJCcHFYMzl0Mjdta1FhTE82RTROc0cxem1GYXpvYzFEYXpaWmQ3V1I5?=
 =?utf-8?B?cTU4NWNmaWc0WGp6LzhEMGU3dWpvVndKMHRmTFhTcUN5Y1FVRWRlWjhJZjJX?=
 =?utf-8?B?MTNwNlpqTWlpMms1UVFnYkVSMmVNNnk2SitPeWppR3FlbGxLRkJ2aG44cnI4?=
 =?utf-8?B?WEJhRStBL25Xa0c5a081Ymk5TWlmZWR5QlpqaCsvczZnZ0V3VGg4SW9nWTVl?=
 =?utf-8?B?TVc2enlCdDZidkJ6K2hoOWpjdXdpWkQvcFUyR2RJZjZFcU11NkFSQ2lHUC9t?=
 =?utf-8?B?UENCZGNlWlNVOGZlMG5ZMzFLd0h5OGlWMTFtMEtrdWZDRDdyb1JnKyttRHg2?=
 =?utf-8?B?WFdUUzIrK0dPYkhLOGkzUk5manQyN09IaDlJOHN5R002MWYrYXdxZFB4bUVH?=
 =?utf-8?B?dFVWWURjMWxnNXpxWXFwbHRIYkhYYUtzOHBBK2pBZ1dEaXg3MzdzY3JuRmJa?=
 =?utf-8?B?YlpkVFhycFIzVk9HdFJZRXVLVlE3VDRlbU94T1hvZENENk5Sb3c1eDRnbU40?=
 =?utf-8?B?MzNnc294Z1FUcllSRzZ5M1VIaGx1UlFTcHRDQ3NDK1hJTUJ1Q0w0TGhIMnI0?=
 =?utf-8?B?U3lkTURnSHFnRk1CdzhyUjdUWmxoWmhqK1dybkZXZ1YyUllIK093djZUbFF3?=
 =?utf-8?Q?XyLnN2akQWioclsc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e923c6-e418-4425-cd06-08da32698c58
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:43:33.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3pj44tvpbCX0P4mIbfQoUboOwuyyt0hVf7BmxmbqGYDYUWyVxSU4P6YJLDQSMxWrVAtjVg/Rc38yRPMg1B3wgX07PELA2RrEyacufmnbVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2207
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-10_01:2022-05-09,
 2022-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100042
X-Proofpoint-GUID: mn-VI68fYGtmYcKfk-NXd1UNUBsMfKDR
X-Proofpoint-ORIG-GUID: mn-VI68fYGtmYcKfk-NXd1UNUBsMfKDR
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

On 4/20/22 21:11, Joao Martins wrote:
> v3[4] -> v4:
> (changes in patch 4 and 5 only)
> * Rebased to 7.1.0, hence move compat machine attribute to <= 7.0.0 versions
> * Check guest vCPU vendor rather than host CPU vendor (Michael Tsirkin)
> * Squash previous patch 5 into patch 4 to tie in the phys-bits check
>   into the relocate-4g-start logic: We now error out if the phys-bits
>   aren't enough on configurations that require above-4g ram relocation. (Michael Tsirkin)
> * Make the error message more explicit when phys-bits isn't enough to also
>   mention: "cannot avoid AMD HT range"
> * Add comments inside x86_update_above_4g_mem_start() explaining the
>   logic behind it. (Michael Tsirkin)
> * Tested on old guests old guests with Linux 2.6.32/3.10/4.14.35/4.1 based kernels
>   alongside Win2008/2K12/2K16/2K19 on configs spanning 1T and 2T (Michael Tsirkin)
>   Validated -numa topologies too as well as making sure qtests observe no regressions;
> 
> Notes:
> 
> * the machine attribute that enables this new logic (see last patch)
> is called ::enforce_valid_iova since the RFC. Let me know if folks think it
> is poorly named, and whether something a bit more obvious is preferred
> (e.g. ::amd_relocate_1t).
> 
> * @mst one of the comments you said was to add "host checks" in vdpa/vfio devices.
> In discussion with Alex and you over the last version of the patches it seems
> that we weren't keen on making this device-specific or behind any machine
> property flags (besides machine-compat). Just to reiterate there, making sure we do
> the above-4g relocation requiring properly sized phys-bits and AMD as vCPU
> vendor (as this series) already ensures thtat this is going to be right for
> offending configuration with VDPA/VFIO device that might be
> configured/hotplugged. Unless you were thinking that somehow vfio/vdpa devices
> start poking into machine-specific details when we fail to relocate due to the
> lack of phys-bits? Otherwise Qemu, just doesn't have enough information to tell
> what's a valid IOVA or not, in which case kernel vhost-iotlb/vhost-vdpa is the one
> that needs fixing (as VFIO did in v5.4).
> 

Ping -- any further comments on this series?

> ---
> 
> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
> particularly when running on AMD systems with an IOMMU.
> 
> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> affected by this extra validation. But AMD systems with IOMMU have a hole in
> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> 
> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> of the failure:
> 
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> 	failed to setup container for group 258: memory listener initialization failed:
> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> 
> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> as documented on the links down below.
> 
> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
> to be above the 1T if the maximum RAM range crosses the HT reserved range.
> It is organized as following:
> 
> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
>          address of the 4G boundary
> 
> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
> 	     to get accessing to pci_hole64_size. The actual pci-host
> 	     initialization is kept as is, only the qdev_new.
> 
> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
> possible address acrosses the HT region. Errors out if the phys-bits is too
> low, which is only the case for >=1010G configurations or something that
> crosses the HT region.
> 
> patch 5: Ensure valid IOVAs only on new machine types, but not older
> ones (<= v7.0.0)
> 
> The 'consequence' of this approach is that we may need more than the default
> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
> address, consequently needing 41 phys-bits as opposed to the default of 40
> (TCG_PHYS_BITS). Today there's already a precedent to depend on the user to
> pick the right value of phys-bits (regardless of this series), so we warn in
> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
> old seabios. 
> 
> Additionally, the reserved region is added to E820 if the relocation is done.
> 
> Alternative options considered (in RFC[0]):
> 
> a) Dealing with the 1T hole like the 4G hole -- which also represents what
> hardware closely does.
> 
> Thanks,
> 	Joao
> 
> Older Changelog,
> 
> RFCv2[3] -> v3[4]:
> 
> * Add missing brackets in single line statement, in patch 5 (David)
> * Change ranges printf to use PRIx64, in patch 5 (David)
> * Move the check to after changing above_4g_mem_start, in patch 5 (David)
> * Make the check generic and move it to pc_memory_init rather being specific
> to AMD, as the check is useful to capture invalid phys-bits
> configs (patch 5, Igor).
> * Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
> * Consider pci_hole64_size in patch 4 (Igor)
> * To consider pci_hole64_size in max used addr we need to get it from pci-host,
> so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
> qdev_new("q35") to be before pc_memory_init().
> * Consider sgx_epc.size in max used address, in patch 4 (Igor)
> * Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
> * Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
> due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.
> 
> RFC[0] -> RFCv2[3]:
> 
> * At Igor's suggestion in one of the patches I reworked the series enterily,
> and more or less as he was thinking it is far simpler to relocate the
> ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
> and less intrusive. (patch 1 & 2)
> * Check phys-bits is big enough prior to relocating (new patch 3)
> * Remove the machine property, and it's only internal and set by new machine
> version (Igor, patch 4).
> * Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
> * Add IOMMU SDM in the commit message (Igor, patch 2)
> 
> [0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
> [1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
> [2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
> [3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u
> [4] https://lore.kernel.org/all/20220223184455.9057-1-joao.m.martins@oracle.com/
> 
> Joao Martins (5):
>   hw/i386: add 4g boundary start to X86MachineState
>   i386/pc: create pci-host qdev prior to pc_memory_init()
>   i386/pc: pass pci_hole64_size to pc_memory_init()
>   i386/pc: relocate 4g start to 1T where applicable
>   i386/pc: restrict AMD only enforcing of valid IOVAs to new machine
>     type
> 
>  hw/i386/acpi-build.c         |   2 +-
>  hw/i386/pc.c                 | 126 +++++++++++++++++++++++++++++++++--
>  hw/i386/pc_piix.c            |  12 +++-
>  hw/i386/pc_q35.c             |  14 +++-
>  hw/i386/sgx.c                |   2 +-
>  hw/i386/x86.c                |   1 +
>  hw/pci-host/i440fx.c         |  10 ++-
>  include/hw/i386/pc.h         |   4 +-
>  include/hw/i386/x86.h        |   3 +
>  include/hw/pci-host/i440fx.h |   3 +-
>  10 files changed, 161 insertions(+), 16 deletions(-)
> 

