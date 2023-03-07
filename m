Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869096ADBA1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUOv-0003Qm-2O; Tue, 07 Mar 2023 05:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUOt-0003Kz-6p
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:18:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUOr-0002cm-FX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:18:30 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783nKq010526; Tue, 7 Mar 2023 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+XfpDXALuGGsE3yC+moQLGxjQVl9ptFauv/Yk/hYYRE=;
 b=iaQPAl2dZeTD/O9Ap1DrWNVTn+3MatsBhiUWUQwkS9HYk4v5acuJ+b6BP/uz2Sfw4ykq
 M0DdWri0oMWggq7nBeYqpU5apNqCG7Bm0HvQXB3v3MiYg0vXVDhPKqOJnmTJ+scz8Dp5
 Q1NjlLKMYx4nDtjt7+cD3UYIvGyN6rZJnv8AtIwBuIrC2vm41t2jE6xIp2WlUWrEw1M8
 0RAfTgVEc+Kky3pO2KWN81PODTbD5KaCcMS4jsV8Ygc0KiwRoIGaO67v9QvlaOsLe3Oe
 0w9hy69pHxsLeSUdXXcus1Qu1PrNJS8+D7dzSrLVBz/U90giYfmCCBIzykWqqnmqXZ0K fg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180w487-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:18:28 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327AHPQI011181; Tue, 7 Mar 2023 10:18:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u2hjdug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq2YCykth2SJlxibVZ6cFKNbsMCYFESX5KpiaMNlW+qv9I4QcaW2wOslJpFqxSplKPX4kCF6svRtUw2AWGkEEkQhmrcDp/aFnoo3cYsxLkhv4pIE5uqnPtR2kk5n7BVziDwfp81mZQ/FBlSn8oLta8jMoRBcOq3wqzFEWdkx/Y498qwkyFTb0D2V9aKH6+4v2o9A+0GmzfYZtBuzTQK+4ot0NLvcv1uVSdReS6CNcp9e7Cab0rdhYu9fCD+LhhMSHwyGxFUO3jH6CbKCrht8joMXwnYEttiBJwHJ/hQNwMwZZbxv5h24sd+3z1ZDVU4bCnjhgHKXJIf94PbXSfZPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XfpDXALuGGsE3yC+moQLGxjQVl9ptFauv/Yk/hYYRE=;
 b=Y52JGptn0GZSuy157/fMb+ICwiOt6juQyIvw8vXu7mJitpIKba/5zwDsIXDLPduCuK1tUW1XWeKZd2Nv3hv80Bg2L0Bbq9mxl1H7bqIv5jANk5AMn8Eyw3gSRowG+DDMrnCJlmXblvvoNe5R8IPoqOJWxxiyzpxu7my5m4m6CgcHb7bHTE5ipizC8U1qTxaNRIlG+KpaSZu8boHf4Ek9h9V1qpnfAZGtdsykLhY9MzAmTGk0IV6OVDOAqQ6E9RSAPgqrrpf5VCrX/UFW1AvcaUIPR01vAxELtS28lJYJskkqElSJ10jkNAhddmh/MUHeFAQoFBmZtFHkr3xkpyH9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XfpDXALuGGsE3yC+moQLGxjQVl9ptFauv/Yk/hYYRE=;
 b=eD61Yx/TGELyr+l7OEdpPta9qnOONGRnbc0Zzd6cZhCKWfY5IynvU3kgwb+W+U7iCZ5B9gjvrB39eI2IA+fwh3uOIPugII7RZVF8+2wunaLxcSp+3SJrWQaomvC8M5blfkcBp+UggCUxXmNLmNtpoT5I6bl0cn8X1wR3TnJe4cQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 10:18:25 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:18:25 +0000
Message-ID: <9f3f217e-e0c7-aa35-4f4c-da1a713a6ee5@oracle.com>
Date: Tue, 7 Mar 2023 10:18:19 +0000
Subject: Re: [PATCH v4 05/14] vfio/common: Add helper to validate iova/end
 against hostwin
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-6-joao.m.martins@oracle.com>
 <3a791ed4-957a-66e5-e2e6-34099613cbf4@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <3a791ed4-957a-66e5-e2e6-34099613cbf4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::6) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: f3912c7f-34fa-47aa-e2f0-08db1ef54971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EMUxRKUsyzTCJnkqyNqwfXvPnJxaOITEaEGWHfE3WVr6F+Rdt+goBQsRn0UH9ckxuCOhkl9qwbxC+CXw69dT4EsJbugA78oB6Y9wiCkqp194FL4xG2rGcJCeIfrlEnMBkLLJqAJfR5wXSkNk8yimmOzX4h8U2s3QeEsAyE5h6sjIS3G3Zs5QKoy4ZjiN1p44NX50JeKCS60/eTOJJTswh43wi+6Qbs1h2uIUkPFrZNchS1xfiIurW1GVb+1YhksWKZdOYCqxa69Gm6bxMDurSnHP+SZjPnI62NihI1kipEYQHoHmIHJVWXRpG5puHQC5XqE1Hs5fMWN1tbnqYlhJ7JBsKQ1GZ8SETlb+5Yfs6pBukiHlDM6tfNu1+oq81Y3IWx702Ls+ri7Dv6hfjUCmS/XDYCCM/afhfTPrj1l1YHB19SQ/FrEyH0qoSRtxCDjOXBFU1qs5gJLD1P7bW563TkyxmiSrFDxBA1sTsF0AcxqdbbE3+JZ/S4HVjgtZxITzq0oH48qM0v0h2lRGExT/tRkLWfbftbx/s1z/d9WqrPFe8ydaSjtVFiKBwS57lffCwwO19f4XcLaHNVUw527zTusp4zDzY6xMt+WWFGRL3gjuJty/KXtSYYWTtRJKPLR/3B8HYtuX5OF4YQSszrL/RPwbwOg4omkw49C0x5XQ1WGbsp8IUACjTdEfgBseJ7ps8d4sO16X3R3pFjKqTMufw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(38100700002)(36756003)(86362001)(31696002)(4326008)(66476007)(2906002)(8936002)(41300700001)(8676002)(5660300002)(66946007)(66556008)(26005)(478600001)(66574015)(2616005)(83380400001)(54906003)(6486002)(316002)(186003)(6666004)(6512007)(6506007)(53546011)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRSOWJYODFNYkVWODU3by9LZGx5cEcxZlBMS093TGhUQXNqUkYvMVdTSVJw?=
 =?utf-8?B?NU5iTVd2THMwNjJ0NVZLNmJYaWpzblM1Y0dtaXlaQ1JwK2dXR3hCZnZQNE8x?=
 =?utf-8?B?SUltWWYyN3NaTkZCS3ZTRVJKUml4K0JWSURXWVpLeFhHNmIwZmhjOEFTL2Nm?=
 =?utf-8?B?dVk5aUJrK2I3RVZMNEFtMGd0TFQwTkYxb2Zsc1pqNUpiNHBpT2RQa1VaZzFn?=
 =?utf-8?B?bk1aSVE2Yitpdm90bEZMd3g0VDJDVVJJZG41eFFDKzdQSHFkWnVpSkYyL0Vl?=
 =?utf-8?B?dUF0T09kS0ZTY2taMFlRS285ZGlud0ZCeGV6dkRsQ280YlUwdnlKa2E3bFpl?=
 =?utf-8?B?SkM3dUxQVllWNWlSSXFSTVBUc2gzTWlsNFhyZzNGdGptNWtPYlVNOXk3V3Vw?=
 =?utf-8?B?V3NqdzlqV1VOaXZZeVo5MkltTk9JNEJhZmR2ZDBoWVNXWit3a29Sa21sTmk5?=
 =?utf-8?B?TFRxNS9ydldsNVpRRVRTY1dPckt0Q0R0ZzZNbTNNZkVSODRzOTNHRTQzVXlM?=
 =?utf-8?B?YWRRYUM4dkx0eElueWh2VUl2bi9ySW9uTlY2MDRjckVwVldXZGVUVUF6ejdM?=
 =?utf-8?B?bktqVzlyaDNXTVF2VVNoWnlyOVlPTXcyMFRiWm8rVDdiWFNQbDRPQU9rR05H?=
 =?utf-8?B?NlFneXZ2OTZ6Qld5VzhVVFdUekMzVWJ4NUtKRklwS2NoWUtBRzFHbE8xandw?=
 =?utf-8?B?YXlUeXdGWC9RbE9hbHhGVGtJem1qQlJZdVNiTDVVWk5wRk9YSWNhTUJuSlA4?=
 =?utf-8?B?RVFFNDdHVUpBN0dvajhJcEFKMVFhaGxvVitUQm1vdDBYNzNnVjlzazRnYWor?=
 =?utf-8?B?MGJ6YzhrcjBWKzlDRjBOTWNFV0FwN1BEL1VlSUlyTEk2NndHYXVZaGNLNTFq?=
 =?utf-8?B?VmFwZlYzUTNmWlUxeW4xL1ZDaXBmU01rVGFVVlFYVFlvdE5BNGNaNCtxMDBo?=
 =?utf-8?B?U0NiclRleE1lb042a2R0SW1Ibmd3bDBqZGNaSWVtc0NDYUNjMHJHdlNTbjVk?=
 =?utf-8?B?TmJSV0Y4V1lKWjJEMGFHVVRSZVYwMEdRTFd4UzhTblFta0hiTEFZZ0M5ZFUv?=
 =?utf-8?B?M0xMckloWm1xT1RxYnJSRnFZMFAvZVBRSHVUTHhNSVJMaTdVUE5tSkVsVjQ5?=
 =?utf-8?B?WFpXZGNzdUh0SWx6ZkNUZVpJaXlGMzVSVG9kSEcwODhpcmc0NnBFNndobWla?=
 =?utf-8?B?cjI2aExGR0ROeWp5OVBZcjh3MEJSNGNBaVd4SHF5TkdYVWRCWmU3WHVQQVda?=
 =?utf-8?B?a1lzc3pMUXZhcHF0WDBTQnMyQ3Zkc0dlZnZDRVg0Vis4V1hCR0hQaVRPbEk0?=
 =?utf-8?B?L0NpUmVOKzJvak1Ka3JMSXdxSVVPMnJoSlN3Q0lxSXlVckFZaHVoRHhEb2gr?=
 =?utf-8?B?c3pZdWVwSWZHQUUrbEJVTkdmbmRMbDRTVWdUS3Ryc2tOSDRaSXJrOUNoVlJO?=
 =?utf-8?B?NWMxblZaZTVrZG96Ynp6U0VWeG9kbTIxZmwwSktFUURFSEU4a2pJdng4YnlT?=
 =?utf-8?B?dmxSVm9jYjc0Skw2OFNYT3h5OGxuYTNjQVpyWVRRQnkwTmRrVFAyVnNVRnpy?=
 =?utf-8?B?R0ZRdlFrTFlHNzM4ZWo4a2lheVVHaGZZSU5IT0l1MGdZdUszUkpRdFByUzdB?=
 =?utf-8?B?SG91ditmQ25yU0hVOW1ybWRaa0ljMkZIV3ZESXA0dEMrZzRYSFZXRXVUeGc4?=
 =?utf-8?B?bVVLV0pxWkZCSk9OdkczNFEyNHZSTzZnKzJnUFpNcXczOXkwVVdYUEpWTnJV?=
 =?utf-8?B?ZnlHeEprV0NiUFROV1hvdFhRYXpiYjlIMktGS3p0OTgvWkhKSDlpdG12SEE3?=
 =?utf-8?B?NFJkZ3JOL3Rnc0hIZ2NpbGt3Wnk5MTIzZ2huQUQxMm0wdm1LREU5UzZWSlAz?=
 =?utf-8?B?Z0xlVGt5eHVxSktIZVB2YU1YbXAwdCs2SGtFMEQ4YlJKSno1M2tWbmx1czBB?=
 =?utf-8?B?WmtHcG5YNWZSVW9FOU5xWllxeE5JNFk0dThCaFVCZTJqdHlQWUdtODhjV2dB?=
 =?utf-8?B?d2gyeGcvaFZFR3hHY3B5NGV6UEx5L0JFWTF5ejZaR2R2TXpFVjBjcnU2SnJ5?=
 =?utf-8?B?anpwazNGVHUySFFUYkN4djlrdWxUZkZzMStlK0dzdGZPM2JYZmFSdmRONENk?=
 =?utf-8?B?R01XUzYrckFreVA2N3N3NHJFNmhCY1JEdDdDdk12NnBrZ3ZVTGIyWmlmblhj?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NRh4sEvdNF14sCeAfzXg96MPjyO9nD/r+IpRKYxiry0Ap4oXLNqv4PR0pOaq/VwmaQP5WxBoxvMhyPUaCFAzcjcAP9sacbN2SuKjGcVOYouO2LDl+1zbkiPu/QEKuaMTTH1UAiV5UqTiCFwyCyEeNn+mQaHwIhI+3ctpCZSV1NEq5pDe26nQb6yD6wuBRwSqSlhS8EMH0sdIsX2EdhZkwyHsfqxvtCnQRImMFDd54lXrFk1oIZDSeMh9CxpOt30h4RkwBLLIVZ9xnEN3aVU9C/zIxvWt0MoUPYIFoQtTJJiOfgNEHSKqbzKbBMRTLr4Pz6lHqZTR/nbVptiWYeFs2eBINCV24Re/DylWC9EC+rjZyeBHPlmbOanQ/xpJkfx4aGyCdHHOwneEArpxvFQxfXzSWfqNzGotQAimAPBf/4Z59NvT393Oc+16tbEE5PyzDQUvPbuqFKAEcF3oYR/1LdAzQXYVK0S5j/HdB/cgD1mSaIe4BlMWpPt4MUJyPFZ/oPuAO2a1dn7slekg/bCGTjxoJezhezXoSIAE91fGpVsP8JmXJbP7UxoZ9ktpEaWEiqr6ufve7/viNouBUOACgl1C7fRz0DZI0ZsdKEFZWXbiYSkeJy9yN+TjAnSBWCnRaxC+QaZijTkupPwqQ3t1JadhuTtbQPFy24F2JdVGruuGfuZLWUNLybCluoQMyJKk/Orzwo6sbW9DKMyhooY7YXzavOKIJ7SwKUl/NKtQ/uouUFvgXkr0h94OcjoC2plNU0tCuBzkF3PIJ0B6N4UEek0UyCifgLEQR5AjtF/I24G1WsKem/00v94GJbWqxaFD
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3912c7f-34fa-47aa-e2f0-08db1ef54971
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:18:25.2640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH2RL7hZZy4U/xLvKpbKDmWppezB99M0Wk7eRjSiKY9XqOjoIZC5EbV0JYusdAVw5qoYRHbeQXniGTbk93ECv32klGybKfdFC3abrGLsQbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070093
X-Proofpoint-ORIG-GUID: yAF3Mo9DO9UCPey59FAmw2A2p99DKuMa
X-Proofpoint-GUID: yAF3Mo9DO9UCPey59FAmw2A2p99DKuMa
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 07/03/2023 08:57, Avihai Horon wrote:
> 
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> In preparation to be used in device dirty tracking, move the code that
>> finds the container host DMA window against a iova range.  This avoids
>> duplication on the common checks across listener callbacks.
> 
> Eventually this isn't used by device dirty tracking, so "In preparation to be
> used in device dirty tracking" can be dropped.
> 
good catch, as this is here since the first range-version checks that still had
a over complicated version of vfio_get_section_range(). I'll remove it.

> Other than that, FWIW:
> 
> Reviewed-by: Avihai Horon <avihaih@nvidia.com>
> 
> Thanks.
> 
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/vfio/common.c | 38 ++++++++++++++++++++------------------
>>   1 file changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index cec3de08d2b4..99acb998eb14 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -901,6 +901,22 @@ static void
>> vfio_unregister_ram_discard_listener(VFIOContainer *container,
>>       g_free(vrdl);
>>   }
>>
>> +static VFIOHostDMAWindow *vfio_find_hostwin(VFIOContainer *container,
>> +                                            hwaddr iova, hwaddr end)
>> +{
>> +    VFIOHostDMAWindow *hostwin;
>> +    bool hostwin_found = false;
>> +
>> +    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
>> +        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
>> +            hostwin_found = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    return hostwin_found ? hostwin : NULL;
>> +}
>> +
>>   static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>   {
>>       MemoryRegion *mr = section->mr;
>> @@ -926,7 +942,6 @@ static void vfio_listener_region_add(MemoryListener
>> *listener,
>>       void *vaddr;
>>       int ret;
>>       VFIOHostDMAWindow *hostwin;
>> -    bool hostwin_found;
>>       Error *err = NULL;
>>
>>       if (vfio_listener_skipped_section(section)) {
>> @@ -1027,15 +1042,8 @@ static void vfio_listener_region_add(MemoryListener
>> *listener,
>>   #endif
>>       }
>>
>> -    hostwin_found = false;
>> -    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
>> -        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
>> -            hostwin_found = true;
>> -            break;
>> -        }
>> -    }
>> -
>> -    if (!hostwin_found) {
>> +    hostwin = vfio_find_hostwin(container, iova, end);
>> +    if (!hostwin) {
>>           error_setg(&err, "Container %p can't map guest IOVA region"
>>                      " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>>           goto fail;
>> @@ -1237,15 +1245,9 @@ static void vfio_listener_region_del(MemoryListener
>> *listener,
>>       if (memory_region_is_ram_device(section->mr)) {
>>           hwaddr pgmask;
>>           VFIOHostDMAWindow *hostwin;
>> -        bool hostwin_found = false;
>>
>> -        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
>> -            if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
>> -                hostwin_found = true;
>> -                break;
>> -            }
>> -        }
>> -        assert(hostwin_found); /* or region_add() would have failed */
>> +        hostwin = vfio_find_hostwin(container, iova, end);
>> +        assert(hostwin); /* or region_add() would have failed */
>>
>>           pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>>           try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
>> -- 
>> 2.17.2
>>

