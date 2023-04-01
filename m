Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3226D3040
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 13:47:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piZg3-0005Qu-KI; Sat, 01 Apr 2023 07:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1piZg1-0005QW-0q
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:45:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1piZfy-0008M7-Ou
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:45:44 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3313BqVp023468; Sat, 1 Apr 2023 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tcKIa8bJFaNj2aDwoxhFjwX2TUVJY2UwcYHu2N+xK5Q=;
 b=PBtgLYj7y6m8c0vTGwA4erUkTpEY9sIlcD6sIAC8D8iYbxOTRu6F7TQKuRvwA2qDVENN
 7IESi0KCdGTuK6kCeHSlymfpZR/jPa0ArbRsu4dr61OWmIF8NX4HTYLN1PQ7Umkd9fj6
 TmfR0eSKPdUBYMLs3HjKrcy0vfUqa/3jPvtqLeLX+vcOS/HVcF8JebWF8GsqvaEwvr1Q
 /IoLVdUgpGIdRq5zfKaIccB6CnilBikA27tGWtq+7VsEb7qOR5T8a3/QIOLC+FvJnYMP
 gScrrIpo1yZ1r5JKM5HwhUjUZ7eE0UbSmS16UKLmBhN9QdDjCIdtbrEGRGJkAIi482Oh sA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppcgageh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Apr 2023 11:45:31 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 331ARp20015139; Sat, 1 Apr 2023 11:45:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ppb2be7mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Apr 2023 11:45:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf46qRGUY7w8PRus769sG8F/Qu1MeoVCwYeVRN+A//69+CR/awTsr4WFw1OcFGXDVyYEu7Ey6gfTZjq68EdKR/2oM6OVgRFRH8i9yvHobcB5/sDg1b/SFS+xEIgIFIMI/CWsK2pgVNm6ozQg0zmfr7kzmvPv34048rFr3YrYQ6H7riM0JCJVz9t2I6TZEfeWLzXpWoIBnEhPVJ1+MPdex5HkY/v/JDeT/XF24M1SWN5RTEezpG0PHZ4lklZbTCuzEgH3tfMf1sGPfx3utfZAv0x5V59MCTQRRa0vnbKnHfz4lQTlh8IDwJpLaIQisxSwo8LoeutMqj2uV1aT/fpQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcKIa8bJFaNj2aDwoxhFjwX2TUVJY2UwcYHu2N+xK5Q=;
 b=dWypDWFqhKJYT8zYyBRBgBPFkLtkfXMyPdNbb+exxX/9d8iFmkOWfFyp1HIuNVxyl1+SSqvgyEAhpkN5rDySbTUDFD/uQ9xKff/JaV8RmhIzl2JPgNH0LEeD3DXubOncIgVrI13RqsZOCNS2gs8P6sp4RBby0LHeIYggIWOMeE07Vra7QaYpwwpKTHz8gxbVa1TtLx9M3M+nPPYvfW2r/Hwz5zAqmX9jubC5XHDgxILSrDpjbm8f1jyxo/hLcSoekU0vmRDkH1YwVhIGl28H7L5xg7k1SHBQhjvqOzXBW9BjmCCqtWVjU/6kt/mO8m1RCHBLFYsZ2eKr0nWmjX117A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcKIa8bJFaNj2aDwoxhFjwX2TUVJY2UwcYHu2N+xK5Q=;
 b=YeQLqTStmQ1jGoYrNKvIR0RVi9uqXl2JzZueXYu/2H+Ios9dspM5TQgV7dbr0TAro9UwJZtd4rDgfrC4MCuFwGJjJmRYO3De9pFpxzp489WfJcn8MYA4kHZftS56GuFhR+a6/7o0sJGCl1cqgbWlgAJz21Mt+pev0F4mM6vPjSc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB4590.namprd10.prod.outlook.com (2603:10b6:a03:2d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Sat, 1 Apr
 2023 11:45:28 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::cd4:d27c:94b5:e2da]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::cd4:d27c:94b5:e2da%4]) with mapi id 15.20.6254.026; Sat, 1 Apr 2023
 11:45:28 +0000
Message-ID: <8e00cd8d-1914-e9e5-e4c1-23be705399c1@oracle.com>
Date: Sat, 1 Apr 2023 12:45:23 +0100
Subject: Re: xen bits broke x32 build
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ0PR10MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5d3f4d-885c-49aa-6a5a-08db32a696a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3ySFSAgtFPF7RcpzRrB0SdcgJ5MaCvvx/eRxfHcpGIt0bFubU4k8lt0t3GjGz5wvDj5OadKOzEZmTRcFeLiAKcuiugNIGWRWO+vFO2XHTxvsezrOBHptIxSHnu6YtgRbt8EKcq1CoBMciPg2LgMfE2tqh1Z861kDBfLAv2s36VfFKYqPljvCb8diiKsDqerfTH9QmmcjHjLivgg7UljoMItXDr9wfM9iqmx3H0ySNsIYa23jZLS6jeJHmRRXgQRm1DW6nMS67A3nz2n0fdEEcL1BswVkql5+pn3jqbW4mMTPyYWDbMXV4LJ8JxbgHvS94T93uzt0T5BLoaYUlHi6K1v/964GXh34l9o7AMVGmjtnF8EgNUVThyGWCTo0A1c0d0HCcczptgUAnd4+vYzCkU7enp4DfmO4E/V8+PjKKBliaMPCWTfka8+u8VGqcAxn89G8V94FxCjZk9DoboqDx9Knoz9mRGS9rFdfYG7k4/hI5kfmt+r3Ipz4eHFzvph/uhq36D7RTKv3wcn8Ep1T6wk3GeU0hriHOGlFktsuoUBvz2vHXI6TCegmtTxr2JC8OJtyG00dyhsdiXDCpmZyYPO6iFy3Y4slYTjbVRRBuTxjhdmU2oBwZlzFvRrjFj5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199021)(53546011)(186003)(6512007)(6666004)(6506007)(26005)(41300700001)(2616005)(316002)(66946007)(110136005)(2906002)(478600001)(8676002)(6486002)(4326008)(38100700002)(36756003)(54906003)(66476007)(4744005)(5660300002)(31696002)(66556008)(86362001)(8936002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk52MTVSaCtjM1QxWFczWXAwS3Y2WElLOWliUTF4UWk4YWJyZHBrSVhSNUEz?=
 =?utf-8?B?NDRXZ3pLU01QY21OTExFUTVWMzJkRXVrMDN3SmRwQ2x2V0RiTUU3NVoxZWpU?=
 =?utf-8?B?S0FkMC8xNi90L1lBbDBvU2RUbGVFRWpNYlBYSm1yVy9WZWRPVjF3WDZGLzJj?=
 =?utf-8?B?UEM0YkpuNUdTZzFPWG5EV3NEa0hjYXp3azFEdzlQSmd5VGlhNnRpS0xYeUZU?=
 =?utf-8?B?TVl3R05iNmt6NmE0Y3R6TW1xTFEzVnhqREFWc0o4dkVOMU9UMjUweTNNYmhH?=
 =?utf-8?B?UzVQZUhUcTQyTGgzaytyaTJud1ozS2tOcFR6SkVrdDlMWjNGbFB2eUVaejR1?=
 =?utf-8?B?c2w0ZFdTa3JqaFZ3U3YzQThia0NhMDBqY2FOcjgzT2lmWWNlRDBmWmFDdlpF?=
 =?utf-8?B?NXhoYlppM2pQMmY3ZFVWb0p1UThDZmRKK0xQNVlFeXZhekxIQjl2ckh1aElX?=
 =?utf-8?B?V2dISU5MQ1Z2dU1LUmRNbmRrcnBjZ3NBUEFWZEQ5WGR5ZFM3QjJSVnRRVVdp?=
 =?utf-8?B?NmxHMDdsMmx6T0c2U0ZQM1VEUEM2UE96dzhOUUVDc3IzbmNaWmJCdVArb1pC?=
 =?utf-8?B?QlVCOG9GUkQyTXlnQ282N2NMaC9rMm96bjF1NkpidjEvaTVXNzFXZW5Zd3g0?=
 =?utf-8?B?Y3gvS3NXWTYwMThsUEdxYVdGZGxoR3FGd09sV0YvTlpLa2RJVWlsYU1hQjJz?=
 =?utf-8?B?N1dNcW9uSmNOM3VIdHRtd3dONEVjS01sdzljZjdXemxWWEpncG43bDhVUXMr?=
 =?utf-8?B?UGRjNnZBY3VCVVB2U3lrOGxkWkdjWEtMVE1sT0xPazVPOHl0T3oyLzZzV0pq?=
 =?utf-8?B?U0VOSlA2WmpES3J2MWhqbk9ZajBqK2ZmT1NKYmIwNzgwMWZmaWJGbG94SnNP?=
 =?utf-8?B?cGthRmYwcGx3eEkyaGp6c25OQ0ZZaHhoY2hYdzY1ZnQyV0RvMThmU1ZYN0Nr?=
 =?utf-8?B?NmI5OFlpdEpLeGszamU3N0J2a2ZIMWx0cjVVWXg0aDhscWFzRndMaWZrUHBE?=
 =?utf-8?B?a05lczY5UDVKWGZRUXd5ZzUxR2xvTHRFUllLRXNmVENBcXlZek0rSzBDaS81?=
 =?utf-8?B?Ly9DcDJmdEVXZnBpZVdsaFVVWlF0dDNnMEYyY1NPZC9BcGtGcm5jcis2NlBY?=
 =?utf-8?B?L2hrSUZMbFpmOFR1KzZkQ3ZFQnFtODU0eEdkVFJ2WnkzMnFXVndFeTY4YUxj?=
 =?utf-8?B?bUttM3RBc212andldU5zWXlNbnNTTUt1YUFSZTJQclBDZHUxc3dLcUo4TXlM?=
 =?utf-8?B?ZThEcVlSUllXQUlJQkxncUNGU25lZTFCVGJjblMrcCtFa1BkaVVxaTNTUEI0?=
 =?utf-8?B?bWMzY01TTjZCMzE1R2pBMGUvWVNtTTJvdFJ2TmlxdEZpRGRRYXFsc2ZOYXNT?=
 =?utf-8?B?VnYzRUlZZURIL3lzZ2pZRkJaTWlYM2Z0TW9FdjNzM0FUT2VodmZHL21pd1Iz?=
 =?utf-8?B?RXRHa0h3dHlhaHdNUURVNVVUR3hqNFN5WTIvSTJyemQ1VTNJWStmVUMraXlW?=
 =?utf-8?B?SkkyN3h0SjVIaE1rSUN4Mk9kS3U4OS9MZ3ZNMzM2MW50VXJuRGlqaWhoRHda?=
 =?utf-8?B?RHl4aW5sczFJZ3VXbnRTejlIQ3hMZWNCMWJ0L2ZLM3JRMFBUaTRJZmUyNmtr?=
 =?utf-8?B?aVcxMU1ZSWk5RjZxU2M2d2dwT2dycGJHSHNjUnZKeVprbXhhQUJNamRDdmdD?=
 =?utf-8?B?YTVsclRRN2FqclJjT0gvSnduWmoybzVxZ3J1MHA3UXRSdU9pN1ZyU01xVDNC?=
 =?utf-8?B?M2VQaTBjRmVrSWl3SkZMUkRyL3IxWFY3YVRXUHVYNVFmTFpBbTdQR0t0Q3JK?=
 =?utf-8?B?cXNHVGVqSW1GRHdMc3N6SUUzbFd1QTB2QWgyanRST0JteDNhYmZsVG9MVFZX?=
 =?utf-8?B?MlI2TWJXZTZlWDJMQmVGNHNVZ04zMlVYa3VRcVliQkZxWlVOd29XSkd2eGpQ?=
 =?utf-8?B?OFEwVkdhTSsyTUc1dEZGdWF2bEhGWVJlanlYV1BMTzlod1VXNlQrSlBzZ1R3?=
 =?utf-8?B?clhiMHcrU1UwVDZvM05rMURSMEdXSjErazkyUCtBRCtJT0hkSVZpY2R4YXNI?=
 =?utf-8?B?d0pxYnUvUkhpYnNhUS81ZWY1cVZrSU5yZHJuQVFqNS9BcVJaRzg5VXZUaU9Z?=
 =?utf-8?B?WmxSeTRjSWFxeG9laGx3SVF1dk1iZExZb2pZR1RwT1pZNXVPZFRkUktMOWNM?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: po1zQixtb1AXxj/5NaTZOTkJ0L5K3rjDNPHZPVA+gzbhj1VIjnyvqVfNco4d/V9SautP/FFeexz1hX1ltoTIqMpU5Nu1iMCi56gDyZVa32+HtJwqvqY1H/aCXUkJ4zpliTB+wzTO5b89g5fH1P8lRHCTi3g/xPFPR9tjvTgzU6n8A3KkAYYurmnevYSmjnsA00epvH/DqMpQGG+CYBZdCLznHo7ZxnY1T7gK+iysgUrRaw3zb9fEpKlJ8OkY9gvqZOR7ocRAiofmYHlblA8hQdo7ytHgdD9IQKYsPuhtXoRPWqjfWyuq8zagB9owAxPLKXTFkm6gKqnrydn0j9kYJGDeioeG/QK4ryR1s3pnQdOjszemLkunZDjBRWnPOEsRGT3f5Z8k09Rm5bbMJHLshH8p11e70Iw2qWI1CvQ7d7ZOlxGi0CG4dzh60fIxDrc+3qfBd1qXWXuqzrHQWFgpwj5BASrThyOjxCJgIYnehp6Kbcg5Pyc1919caO/o6nyFHU96uakauZvNDSDLBZ1WEY/JeUMuI4hjWevOwk4XuSYcC8AvxUbuyzFGMokSvUGDaJ696jVD/nzGMWb/f3F0TthXExUuxuXSDSte2B6IiLHYssrMM5FxvCt435/GH3lXNqveMcc6Z8r9BQa9otv4gVEDJBJY7bj/lQlhJegHMTLq6+qoi9GVqrQixXVGAt3nPdnTfXfM/U4ecIORZuWHDa+9Z4wLT6d7ZH8eTvMeY9/gYBW7Q3VtGCw1KovJ06DOObXCdLFaWqZRrzVWaFjSqT2QOrdr26Mnf8RREZVPcBS1/UsO3zBZkmMc8k91TS5Ltm/ZLEtvO2PHTtqpNQLkiQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d3f4d-885c-49aa-6a5a-08db32a696a4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2023 11:45:28.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A52+isXtcnlvfldDgiWIP6RAPIOut11wJ3uLNr/Kk6h5ELgrf+gUvHvsg28/7V7ksCvxCCawdW0pd9SdrNKqPpOsKZ7zU0kEqNUpAJAs+Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=936 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304010106
X-Proofpoint-GUID: ZyR_bxKsW-vuMmyk2TgyZkcG5Xc3Qmg1
X-Proofpoint-ORIG-GUID: ZyR_bxKsW-vuMmyk2TgyZkcG5Xc3Qmg1
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

On 01/04/2023 09:40, Michael Tokarev wrote:
> After bringing in xen guest support, qemu fails to build on x32:
> Adding the folks who added the feature too

> target/i386/kvm/xen-emu.c:876:5: note: in expansion of macro ‘qemu_build_assert’
>   876 |     qemu_build_assert(sizeof(struct vcpu_info) == 64);
>       |     ^~~~~~~~~~~~~~~~~
> 
> This one should be easy to fix, but I wonder if there are other issues
> with x32 exists..
> 
Not sure.

struct vcpu_info is supposed to be 64bytes on both 32-bit and 64-bit builds.

If anything maybe arch_vcpu_info struct is different on 32-bit and 64-bit...
David, Paul, any ideas?

