Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9756E6A39
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:54:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooZc-0004dC-9x; Tue, 18 Apr 2023 12:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZZ-0004bm-BQ; Tue, 18 Apr 2023 12:52:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZX-0007J7-Lf; Tue, 18 Apr 2023 12:52:53 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IExYgC013947; Tue, 18 Apr 2023 16:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Vt92HVPJ9CHvC+YXcpYjQyJifqZKMnzvEVpAzydi7+Y=;
 b=nGOcEGRJPdPz3Yq6lQ6juEFRz/JyL7xjsSIW+p+NycLvFhQ2f04kkSm15BAlOFGMGk40
 TKBhqeN7O1fSqcHFcnybrdW2S8IA4ZJzsJxj44T3Fkvxl0xxyTWxwZHcU/yRjqS3qN/L
 xcwfJ1W+AvO4AKkcfzJjDaVoQjYqIdvUSfEzCKvCw8Fj5PvC0IihE4Tn2GAdN5Vq/Fvp
 9JfBOirKutSey+X1PLehjT8pknk5XExHM6Nh5sXC6gaoJYoVTL+TMNDuNa7OMQ5BamAH
 H1Wm5OvO2gZLNHzZUM2LAMvijCqRyUcgY35/R4T3vEtIcGwONnYELJu9DK05DkK9a9pv 4w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pymfue6sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFUUfl026396; Tue, 18 Apr 2023 16:52:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcc2ub6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqSI13hrC+HcLOs3JqCaxLrZejsfNFybsxTwF9glW4NGao39CzaTBBivfdNASOG+qOVNL7Zdto2UlqXocCdt7pe15dYtrC31kMpiZXex95WWyd3T7i6CCzfbfYNIwbA7hXu39W92QhRQkddWv2x8g0inrIzprsHjgc1FadzWgcs7ugVftwHqPsNBJOa76jPZWtKXoG1BokulbVAKmPUoJedrjYZNMr74KGRma48SmqskYERQlkmV43JgJgI8dEkO9RtidYFSjbtqNKHYrSO8z2uym3aM8CsEUZ0Jf0T5QiEQDmUc2zq+X9tXTUlYJOAdjRtK8z4p2pBsPr/CeAloAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt92HVPJ9CHvC+YXcpYjQyJifqZKMnzvEVpAzydi7+Y=;
 b=O4Jfu5ecIHqLr9JZM5GEdKPUf26nZKxmQh/u3r1PUtgX13lyfQUrM9jI3BZ9Hqni8CFtCrZIWn/E1FGc+IxAC+awdPwY8eZIw5mre/aBPrsZv4seNJfT4O2nSaEWwLFkJEahO/PNegkYZu2yT0gdhZP3sWVvaenoKFpfqpXJUz3vFqJzMg2fPExqs4UqIfhwz3KejOSadWroW0rB7+KkcE7zE3NRd6o+ap8hbWesWSyYRbnybZC39EiIjW2NkgPISKvef5A6Qxpuf99RnnCOhlxQeUxMjr899uGlGjPgiOu27+ZqCztWPXabR7GKhr7iZCRn6egjsAFNu+Id65/wpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt92HVPJ9CHvC+YXcpYjQyJifqZKMnzvEVpAzydi7+Y=;
 b=U4AnCFJp3GF9e5FRZzrSkdlX7DmoMXM2cZ3ZhPW4YvTCTImXGRUAozpg0cwiB+Sj6t2U4zrXFlXMpNhxur1sqCOcRQF4DHXpSlqa1O6KOEEgBIhAP9ZU1lt0yxHDaovjIqX0YC5S8V+gietsBDStoEpEP5YNQiI4PXgmfsUi9JQ=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 16:52:42 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:52:42 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Date: Tue, 18 Apr 2023 12:52:18 -0400
Message-Id: <20230418165219.2036-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230418165219.2036-1-eric.devolder@oracle.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0103.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::44) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: edbe5f5f-125e-4e11-0853-08db402d5295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AGvdTaSVZ4v3idvvGb4uGIHj3Xna1Tqal87lMxnamPSwJHdTIuFmOVhFPGs1UzjJT4PvN9CBUVKbouRA31h8FQt2erniZcMYXau7JWIcr+5b6T/w8mDoJ0u7HXgi68DwrImQpa0CGVJRE6o9TfwqLy7A34b/npt4C6TFm+OpLnP39YrKpOY4HtpUKLqcuHYXY+B44v45BuBx8/IVfZpjy7bcpbF+0jeyz69glTs/OWYl/U/QuVfJ6F1axp1dERAs7oRYQ2nL9F6iYIOkw3N2k/ucbakYSbzVwRPMxvTh7Jv+cymD5+e7MtAaOeUFhfZeudga7ne2B90xTKBl27JXmasphXttIQIABt4RVAlgEJGSs3JCCzl5ipkv5EASRiuIKZgB/WWJPT0UPhjiTfpw4TMi+qLp5H+g+EnFeEII144GTtlc1hgua4bV9Vl75V37rAA4P6DZHbytKTtSaNYT8IVf6/vHywZFcMUFNDrIyR3j+BdPAYhAnwjvo5U23ml/tUF3/4kZmnJ38Swr983/TLpHMH6nTbW0HMWygsdsZHlCMKaB9Y68JRQoLHZ7mdoeAwn3uxUnkTYXl31JFS7bS0muP849+Ziulo9Ao54LCw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(966005)(66946007)(66556008)(66476007)(36756003)(186003)(6506007)(1076003)(26005)(107886003)(6512007)(38100700002)(2616005)(83380400001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6486002)(6666004)(2906002)(86362001)(921005)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdQdmV3MHdkZE9WOUhUSUF6cXgrYnhnSzZ0RWVXVnJ1Q2ZIWmtNT1hQd2Jt?=
 =?utf-8?B?MFJYcjZzNm0zQ2FUQnNvMWlUK2VnNUc4T1dqc0lnd3ZQSTBEWlJKSFZFaExn?=
 =?utf-8?B?UG9DVmdJaExyMVlwSncyU1Bib1VneWZsRzJGL1VRdVRBb3BlL2VCanBuRWw0?=
 =?utf-8?B?VGpYNHFacU4vYmd0dGdPS05tQU9xSHVncmlrbnNGVCszdXA4MC9zdHJ2cnhF?=
 =?utf-8?B?L3BnTElZRG1vM1R4bkhselkzMDQwbDVwZ29jY0hnS1h2SHRISjBKMm5TZUZQ?=
 =?utf-8?B?YXFYUlFudy84VVZsMnh1d3BLZGhiOVRydkZTdExFVUdYTVk3V3loSUpKVHND?=
 =?utf-8?B?OUZtZE5hbSsrcjRYVDFOR1JPTENKaUtYQ0Y1dDdpbjdHRnhLeXkvOHFydFJG?=
 =?utf-8?B?MFcwYy94Sm9KbzYrdU51ZFJBTW5acHJHbUhQQTlIazJ1SzlIQWwwZzRldjZu?=
 =?utf-8?B?YUNaSndKUFhPU3BhUXlVZG44Z3hlV3dVcUt0S3hON2xlSWxlMWxMcHpLd1pn?=
 =?utf-8?B?RGtZNU5RRUtuby8xZ0pacGlBMVo3U1RxR0RpdHhNaXFNS056WTVHVFNEVE9q?=
 =?utf-8?B?bzVtNWJ5ak9LSjJYZDROMThIWlNpamo3S3pCVWNqU0xHQzZzUzZRYW4rYVhs?=
 =?utf-8?B?VkE4bENjdDd0c2FOc2Zwcy9qNjE2MVU1QmUvN1N6VUZ1UkU5Qk54bXUzTWtr?=
 =?utf-8?B?TEd4REJYRWNsUlErS1hvZ3pYM1ZzZFIra3ZtZC95WnBOTXNuK1k0V0FOV3hZ?=
 =?utf-8?B?eVhlWVZHZTExT244Z3BhY1pUakRMempPSGw5VU1UVDJGZmt6cXVOOTF6TU9D?=
 =?utf-8?B?OUl5MkZKUHlxOEFyczhMU29NSjJIenpkbE1pSnM1QWpJOFQ3L1Mwcmx6Y3BT?=
 =?utf-8?B?N0l2TFhabzhyaDhiYkRQUFdmUVpGUUxzWWJzYXdOZWtYakIyUEZHcmY3bW1j?=
 =?utf-8?B?TElERUtFV1k2YmtuQkgzN0JLWFZ1ZHhBYUkza3NUbjZIVGhTak5JWlNJS2Yw?=
 =?utf-8?B?dWRjNWUzeWFVRFk5M0xadnJybFFSOXFBT2hZdW9GTjh3dllLV1grZzhqUktx?=
 =?utf-8?B?MlNQVFRkbWM3YlJXRjhpaG9PVHZTWDhib0ZxL1A3S0w4SVBhd3cyRHpBVUd6?=
 =?utf-8?B?RTZ4c0pqcUZXL2dCSVYrN2NISWxpM0p6MXBQWExtVzQyR2FFNS9KNmtEM0V2?=
 =?utf-8?B?REpja01lTjZrSXBUZmdzYXJJajh0bDlMWnZOSGI0TG52RHlrNEhlK3pNb0VR?=
 =?utf-8?B?Q3lacmp3Sk4wNm4vcWs4dEV2NTNDODlLdkJDUmF6U2tnemhzNk9jbm5OZEFM?=
 =?utf-8?B?WDJmTDVlZDJnRWh1aExEZ2pra1cxSEhJMGNRQW41a2QwcjF5WGVMNktrS0hC?=
 =?utf-8?B?ZUFjaHp3QmVSTjRuamc4YUhUemlmaGJwZFE1eGNnQ3VjOTFCMVJ5N3F3NExU?=
 =?utf-8?B?SnovOUE2V2RvSUs4cWJ6M2tDVGFYQ05wNkFXWlAwYmFVVStDbGZLNm9sNlFJ?=
 =?utf-8?B?cXJBTTBwN3BEUE9RNjZOTXhOTkJHSll6N1UyY1Izc1BTU1A5bVFGQ0lGWGtx?=
 =?utf-8?B?eWp3Q2pLSXFkZHkvSUpOeXVULzZlSnc1RWNOWUFoelkvV2E5Qjc2TVBHS0ZO?=
 =?utf-8?B?ZDlxMUo4S3grbHRUMjg2VXhkOWJPaXlUWjZWbkg2empZNFp2ODZSbnUrdXV4?=
 =?utf-8?B?L3JPaXFZbHFhc3hpcS9zU0tPZnc2RU1BQUtobFVSNXBZV2w3eHp5RHVJQlRt?=
 =?utf-8?B?TmZEM3lsWTNkbE8wWFJPckRESTJ3TGZZUDc3U0hyZ3NHeWNGcngzSlpyYm5O?=
 =?utf-8?B?OVlhN1F5blhMWTZtRGY2V0VxSmMzay84UHBuRjVGRmdnZk1tbHRLbzJaSUJJ?=
 =?utf-8?B?eDZSN1dGbkNtMXJxdklJek9TOVhXZ3hORG03M2R0UG0rVTJRZTR3MUJrVWlD?=
 =?utf-8?B?ZXk3VjdKTjB1Sy9iVjE1R29UWVpuKzh2czNnTU4rT2J2eXl0M3hEd1UwSXhi?=
 =?utf-8?B?NEFWUHloQVVmc21kWVV6dFp1YklNcXVTbldia0hTKzcvTGRhNXpsb09McDJQ?=
 =?utf-8?B?ZDh1ck9wODE2YU5IWE9UL0hYSUYwQUZiazlBcXlhQkl4SzZobEtzajhoQ2kw?=
 =?utf-8?B?TmptNkZneWdDNktOMlM3bDhINnhFRGNiZG9nVlRQWmlmcFJJSUQzRTRqQU9r?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CNX1EWb/b/B16Jg4OwturJbQ3WY0Jf++WnqxzvJrn8O88HvxLwkThjSFU2s/2h+RFsoyBZg5XMs2LF4JopYDaIVbiCJR6fN1EfFK4JExkBIB0EVLjHihqjnPaaTzlNMNBagbCVXNmKemDb1c4u+YP1uCKkEpJabTlrP6gPqIasSPMxHr+dK/uu6HMkrwWBinbo8O6QVaAGhf5uJ2wB7qOJzsp03Bv18uoybUD4snb9L0blk1MFt7ORZn1fKwrI+Kk8n+tmqMe6rC8n57gms8zyXkqD/FULz0MuP3O5jFMlKK+bXXQVkTXGDF84UjWWEKls+5ERkQ5jOEaC0yLS0hMAPdpQE+77x/dBEgM4kd3qMSi0mUQ7NoE1sWEoTYAh0Qyvn3VZP3ya0hpZ03XKGWTt9UAgVPdi7t1Ydk8ko1DW7TkZVJlkkrtPuUchNTvLuZ1XwfimGDrSh3iid9fp5m5WKOlJyTPqDO/+WjJt7NSLZ9gg/TeMsKtHerXofEi2aN4bI7mt4aq51IJ0bywvf7zl8codircDc8h41lAxH3VDvBJwlOxxLQS2I/3efPfWxTt266fRDNuwyFSBmFDI7vYUFW4g3RibpI0/5BA7qe+rM1Wm4mFlSTcNqbgvSiCgNM8NY8Q+xTWE0fSv+GVrR/S7d8uMiHO5WkDyWAnZasK3IJb0zrbaIxbs1p6kryI3KZSbbvH4bDcLx3gn7mVgUvwMOF+7LjzzUfM4WZEmq7t1Q8SjKuzMoEAWNGDBLV306qg9j8tUOxYDVRllYjSUr5WNVqTmKXdenmUo1Sg5V/Grsr9cNBh58JYzrP4F29eCHrd1c2d+Vc0QzONitz2IIRBDQVN8bxvrOx3hMhpvtiRdj4wFRgiNrAYa4i4IA5zNo4nKXSPg8ji+YkRkx9uGkbTA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbe5f5f-125e-4e11-0853-08db402d5295
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:52:41.9052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFLpuydr6a22gLn6+8bzMXeeIsL/0J7+5kIeRdHlZmxsb65F6q2TMH1i8OaWSRExSP5ZpMABOJqczVIi3jlge/6U1D3/V6HnAlg5huvIrF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180141
X-Proofpoint-GUID: HBeAb8jmJHA8zyXaUpxbmiXP_D0GVhoY
X-Proofpoint-ORIG-GUID: HBeAb8jmJHA8zyXaUpxbmiXP_D0GVhoY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently i386 QEMU generates MADT revision 3, and reports
MADT revision 1. ACPI 6.3 introduces MADT revision 5.

For MADT revision 4, that introduces ARM GIC structures, which do
not apply to i386.

For MADT revision 5, the Local APIC flags introduces the Online
Capable bitfield.

Making MADT generate and report revision 5 will solve problems with
CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).

Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 52e5c1439a..286c1c5c32 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
     /* Flags – Local APIC Flags */
-    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
-                     1 /* Enabled */ : 0;
+    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
+                     true : false;
+    /*
+     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
+     * if Enabled is set.
+     */
+    bool onlinecapable = enabled ? false : true;
+    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
+                     enabled ? 0x1 : 0x0; /* Enabled */
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
-    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
                         .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
-- 
2.31.1


