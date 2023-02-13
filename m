Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F426947D5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:19:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZg0-0003N0-1H; Mon, 13 Feb 2023 09:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZfq-0003G3-AJ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:19:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZfo-0000iB-A1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:19:17 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAUnJH014740; Mon, 13 Feb 2023 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=2JEkFQFjuCBtfCgTsKO17tryUVqLTrGzRq1rj9sCHnY=;
 b=xikU0REyuK2Sn2y5hH2fdBpihbjAMOxFQeKk9yrufXg6AokrlO4E2//IltJV4PzRC+XP
 qh5LdnPH9Zo2zF3iqCuXrGdA24+BE60ve7UDGebzozLRfO95zeUg3CNTWa7zb3pqqv/R
 P0pkYK97DHrjD0hpBRp9bFuI69VZdtoA3FPKJojjTrmvJ7E08BeYffn7mhQMEe0paQ42
 P+liDnf5KeBldoUEE5Oc4mUhyWhUGs1kh6dyNLRpxAeCClI7EhGjItvATYsk9Vzv8XCI
 gMa675fdNnmWkga6ED22257cBMn3U2guzWVWtkTGK4PjO3m+8hE6LYeMbbl2zfOt2bXT vw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2w9tuj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:19:11 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDbNxs018248; Mon, 13 Feb 2023 14:19:10 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f4mnmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB/2CMyN2EGtarLflPnIDLvOSaGjdiE2QtAcSlIaxqfj7F24zf+/oKumD8c+h8M9tkx4c/TOYzpA+vzBLmPGmrscDnw7QTf6QYtDTiNwJEUHgu4u+iGm+yD18qcxk4/RoWAb8vTPBDEBskfwFtE2oEJVhBo0KC8JBf1h6IxE4zxze8oiWjPcDQeZ8sq3gAZvKuTx11x+4bgRVUDHS1YabCJcQkvajuU1tmCDWMV/di+XyEccsfLKchA1phAY8MiQiWmR9bxamzcHvE3z+eHza/NcEfJPE2sZMdjblLGQ697r8o9mGUuCpC+/wM/dh+dEmqUJuBGsIlfLdXrpUZLMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JEkFQFjuCBtfCgTsKO17tryUVqLTrGzRq1rj9sCHnY=;
 b=K87PLN6Seg5hN/wX9Hvgp0XNXzJQZoWWtaC2/5FaN1rrSFZoCAX48Pm6YnnJvWDQY5ra1PN8zxoxxq8yEBEfbvw3FZLCQV2VK8Kv6m4SzAPpLJCrHqblRJJ5Xzp01xmG8Ae/xIJWc+iha4tisIDH8mEmICvnLMD3r05t1XQNMSahyp6zUl+1rOM+Z/2Xm/pSz5ObqTGeT8jasmX3QVQLjTzwufgezQT/dquX2iWeifyEJLNSZeUWrgK2J5wFi75EPwrfQkwPfI4TJrjyU1WMz7GqsAIZflPclLDz6rblqnhAO+b35VOo+8GgMsVcRDkqcEXlEjh6UBp2O2n6r8lFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JEkFQFjuCBtfCgTsKO17tryUVqLTrGzRq1rj9sCHnY=;
 b=ZomzUlgAaAYwtywwQ6x1iETa1FxBANW0R8GsNNv1p6kNHFP5J9No70E4wm4Edhx4lzAqD+QwsacVzX06fb0p+zZBO25RyETROhActrwm9wWQsY6F/wb61LxACu3MR9/dE4rQXJqwf86fanHx/uWzkpNTvSDopm2ES64iHQhHFCg=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by PH7PR10MB7012.namprd10.prod.outlook.com (2603:10b6:510:272::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 14:19:08 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:19:08 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alexander
 Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/10] fuzz: add fuzz_reboot API
In-Reply-To: <110a0c37-872f-fc1e-51bd-4d30e0bac380@linaro.org>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-3-alxndr@bu.edu>
 <110a0c37-872f-fc1e-51bd-4d30e0bac380@linaro.org>
Date: Mon, 13 Feb 2023 14:19:03 +0000
Message-ID: <m2r0utr6lk.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::27)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|PH7PR10MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 375a71c0-9e60-4a7c-5d94-08db0dcd44a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ui4YqdalrkgI2xKC5trrF/5f0dlfo+bjzJVd05h3R4FUsQyGLxSpVHPAWNC981n28ShVdSKK5IkIS+/KD5EDT2Bt34bJFTyqcSw/yxbQ5BN+oqJkPzijNwWPqxSpu+iwC9SGUmYYxDoHDsVxzoDZAwT8ZRTJ87fG4X2Oaf5LeSgA2OthrcW21UA8Vw8AoTFZSzjP0CeiPjxrD/deu4RkZQlWpZEgsypHdRQtjoZVja2RTABJ5/0Z5MQCsdsBQpq8NDPcnYaOouGLJDpWmzRsLQrYW+NYodbNWvIKAMdXX3lX2uyjg++X3qZbOVruXf7Vr+8bxVGa50lM2mGzM9jQh0Pggnjh6rDsnH5EulfdLmLhBxawAeB9HolghaI0GctgIezP9X/DCgMprcgnRHYx+5Uzm5HT48sbVq/JPKezZxohCSIoskjlMTVdnI+jIsBY/VoSLv5i7l53oednZLAPIU1hkNED++C/wbqsz/ViSNABtJynIV1UZGmz/noKlC3sMc68Rmyz8I5ZFD6HoLfwrZ+MPOPsWYaThEos8aatHR1OUIBjz2oVvStMmGfdUeoVb5ybKH7n6m+ynwaSrs7gUqsYQ748bMf6/mDvWo5iOHLJHyb1kV+KEB8dzoWOxMh+XZ3KsybyMxcAqCJlFvQ4kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199018)(36756003)(86362001)(8936002)(38100700002)(7416002)(110136005)(2906002)(66476007)(4326008)(5660300002)(41300700001)(44832011)(8676002)(66556008)(66946007)(83380400001)(2616005)(54906003)(316002)(53546011)(6666004)(26005)(186003)(6506007)(6512007)(6486002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b210NHJZRDZyY0VFM04zelV2Q0kvakt2OEFyajZIWG1mRythbG1mZzNVdkp0?=
 =?utf-8?B?VHpKTjBiR0VlL0o1c1puRHk2SHgxbExBak5aU0l5YzFXYjVYQW5mNjZKTUZj?=
 =?utf-8?B?dWdoSlJSeWRzeUFnN0lmRWNGMWVnemcvdmJZTkNaM1FleVRmMmtXV00wKzR4?=
 =?utf-8?B?bENQWWpsd043Zk9mRTNLemhMSEVlT2FoVElDZGlsN0dPZ2xFZUhMOFJUZU1Y?=
 =?utf-8?B?bkFIdHEwV3lmSWZXeTd1RlZFaVh4ajBkTUxhMU12clRoR1NZT2ppOWFuL1o1?=
 =?utf-8?B?SVU2T3hhN2ZSRXJYaWp2THBxQUovamViWjdveU91MVRRWWl4TFNnNTFuUHA4?=
 =?utf-8?B?ZVFMU2RaK1ZpcEgvTi9GWVVxV2w0dzJwV1JwclZmRk9KQnU5OE9uZllUbzJL?=
 =?utf-8?B?ajlzckd0cUlpb0N3VVN3UXoxMm5VWVVZbWRqK2xTWENKVlJCRy9mWTh6UUxE?=
 =?utf-8?B?SkRibjFycmI0NFlVaGovM0h1aFBmejg5VkF5SS9jUUhFd2xodm00SjBuOSsr?=
 =?utf-8?B?Z1FCRHlwNTlVU3VjcXRKOVFFV0Y4YjhJQ2N1bTdBZmNJcEJmNGp1cnkxTVVl?=
 =?utf-8?B?QWlUN1ZzQlp3TjRBNnFWQzFENWFDNVVrcmJsUDR6RlpPVlVCSGVObmlvcTdQ?=
 =?utf-8?B?RHg4RXl2QngrdkE3NnFyWFNBV2wxS1hJRitUYVFSYUVmQWtlTy93NDRVWERS?=
 =?utf-8?B?Nyt2WFE5bTBVOGRIMnBvQlcyYXdPR3NTRnZmQk1GOVZEUUNaUndqLzRWblhI?=
 =?utf-8?B?ajN3NWZzQzB5RDJTQUlVclY0YUtQMzJhZnU1cHZFVHh2UTEzNFpPSk9uRjcw?=
 =?utf-8?B?SjJWSVpNVmZ1dWVQTzdpTTBtdHEwMVRTQ3BLUjJaWTAxY3pNclBkcWpSM0ZR?=
 =?utf-8?B?bFRoQ09IN1dXd2RLUHFDK1NpVTc2SitRNFRQQlpJcWVuTVdjZEVkS01Yb1VF?=
 =?utf-8?B?ZHp6NW9PbVF1b0d0dXNIQlFQRWtUZHdiZW12YUk5MHczRWZucnpjR1FObDJT?=
 =?utf-8?B?QjhOamNxcEZRT216cDhDa2VqTmFhaDlmbFBnOEpSK1o1T21FRkFvUVFVRHA1?=
 =?utf-8?B?MHU2UGQyRDl6QlloVTRaMmQxZnBDcVd3U3RYbUpCME5LbGJPalVrRkhvR01O?=
 =?utf-8?B?NFJjQjVEZkw4OUllUUZ1YkdYZWZkRzZESmJxTjBNSmtCRlJIYjlvV0I5Q0l6?=
 =?utf-8?B?WG9XOGFZWUUydVVUL3RMUUV2ZVNPT3lQbFE1ZFFtVGloZmNFRVlWQmJYcTla?=
 =?utf-8?B?VUVHZ2VFMmRYdnhFRE1DenpKRmZtSU44cW5DOVYwY2hhT2FJbEJSeVZ4bTR4?=
 =?utf-8?B?dGI1ZVRsL09uUUFOZXpMRFFPMVpHR2o2TTBaU2ZkT2ZMR0dIL2NlcENrVFlJ?=
 =?utf-8?B?ZE5RdmZQd1dzSmdYQytmaDVDTVFIS0xYY3AyaWl6cStlS2VkekdRVWNkNVI0?=
 =?utf-8?B?Vng4a2pySU8zY243ejIxTVZpWXVzdjNpUzFGOFRjbDZyV28ybzB0Zms4TVRP?=
 =?utf-8?B?S2M3QTVpaHpySWJGV1cyTGtkQzk3UGhldDByTmVrQVpLQkNYRVVSQkZjOGJu?=
 =?utf-8?B?TVBMZUJ5Q1kvT0xYeFZrTGpMRUpCVWRuZkZyTmVUU1YrMU9iTC9sZmVyOFQ2?=
 =?utf-8?B?bG9CTEhicDlTYU5FU2x1Y01wYlpqTjl0NFNaVUdxOHlGU0U2dld3YzZJK3Vr?=
 =?utf-8?B?MHAzV2d2TDVFQVVxMFdPMU44S3Q2KytjOFVTWXdkdFZjMUZjaHF1STBTWllH?=
 =?utf-8?B?dUhFd0d1bFpjdmtLZjl5L2xHNkxoeWRsbVJwWHFaSkFIVzNZdDcyNk9NK2Er?=
 =?utf-8?B?ZHJTRzN5Z2NqcXlpU3dJTW04d25BRHFBVTJHVGUyWk5pYnoydUFHTTNFM2NM?=
 =?utf-8?B?elQxTDNqMFBwSUlzeWhXSjJPN1F0ekxJNmpPYmw5RU92UUhaUThzMHFYRlRV?=
 =?utf-8?B?UUx1WitBL0lJanhsRDZ2UHRrY2habVJYSkI4NllDUFdGTlhlVWZhMlR1K1d4?=
 =?utf-8?B?R1VmQnp0d0tmRXJuWE5EMU0rTURCQXJ0TVlKS3lvUXJiUjM2NnNmZ1JYS3VT?=
 =?utf-8?B?QU1JQnV4NVh6MkZDZDRoN3Yxbnplb2s5WlQrS0hObXdwcXdOSU9QWEY4Wmk2?=
 =?utf-8?B?cDhZdGRsWGJYbmVMRWNWbnU3YVhld3ZvSlp4Mk9lUS9MdHhLU1o3TWlYdDBp?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: //0UZUuLbCsG3X1eUlrQUIeNmi6ErYdoOz/4zMYctwBt/Uio9hu7dvR8Ap4BbNSt2MPearMyq+wvKRGNmBZA1CfZuDquJveTKftFZSEdKmv1+GH3FLHHVbuujc5lKymEcGVgMXTD+0TfsC4/ziOxrLHl9oTYsMPST7KWuphsqdnOPie4CP49KFd+nlo3QYA0XqeZO1H8+gPu4dc4aQyt3yJ38vHADTPUxfmfXZdD9SpglALykixPy/v5eoyrB50+hdZkQuZ7f/m5dY9i5uJ4rhTUxjeTVMkm5Wm+5ti4eJMf0VVPASso818t23iyCKQbA7UQ3wxB3qJpx4jnuN6sZ7qnhe32mQ//1vIyssbUV1W9vaA/WlFyrs3MMV6VIbgexJpk0EoPhHCkgmzMaw1vbWeWZI6yHdkn5AVUIMv+gGwU/6HaOpOPncmdMEHn/7M2CLOi4oRQs2sf/YY9RihxNq1oTPMkjrpIMnaldJ1dO6JZcjqEm/qFJJniY9jsZlzQGmDbmiZg78GkiU8BhnoC+qiVY6jjz18cNFN73dsorRwArfEG9EoLyCH6TzDSJ63trII6YUyabscvULVia7f6wVLKFsQ8gZPpUVOcA88u6yBTEjvwuis/9KAPMIVf1I2Mwf+Ep4kBAfxZNxYP7oh/h1hluLXAdM1GGKQYzzV8DB6T4KFsuPJVrKF4OYi2eVuTdwCBRptWO9QWQs1K9XxhTNI6Xi++8GKwh3RLDjpYzdF76UnRqt0GR3pzU/EmhxfonwAT5f6/UbsLDBlMMNvADK7oXCEqoifJIpifd6QIHF1AzBrj6M1IB8NE2JHajUWdjrd6NBqiRe7aJrM4FdiY7NjFnez9DvJyJI2UIblxAXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375a71c0-9e60-4a7c-5d94-08db0dcd44a4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:19:08.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWEvvR/T18UuXLD1fvQ+BbKiowYHMhX/iId2jKlIlJjKEShbWMS8AJJLzm/lR07klWPRYQoGuasc8MotmaN/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130129
X-Proofpoint-GUID: PUqBL5Bb724uGU-i3S4OfxqCl_7QtSWi
X-Proofpoint-ORIG-GUID: PUqBL5Bb724uGU-i3S4OfxqCl_7QtSWi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On Sunday, 2023-02-05 at 11:50:52 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> On 5/2/23 05:29, Alexander Bulekov wrote:
>> As we are converting most fuzzers to rely on reboots to reset state,
>> introduce an API to make sure reboots are invoked in a consistent
>> manner.
>>=20
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>   tests/qtest/fuzz/fuzz.c | 6 ++++++
>>   tests/qtest/fuzz/fuzz.h | 2 +-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
>> index eb7520544b..c2d07a4c7e 100644
>> --- a/tests/qtest/fuzz/fuzz.c
>> +++ b/tests/qtest/fuzz/fuzz.c
>> @@ -51,6 +51,12 @@ void flush_events(QTestState *s)
>>       }
>>   }
>>  =20
>> +void fuzz_reboot(QTestState *s)
>
> "reboot" sounds like guest software triggered.
> IIUC from the fuzzer PoV this is more a "power-cycle" right?

I think that 'fuzz_reset()' or 'fuzz_reset_state()' would make sense,
the primary purpose is to reset the fuzzing back to a known state, as
said in the commit message.

While right now it is a reboot, it may not always be, or could require
something more.

Thanks,

Darren.

