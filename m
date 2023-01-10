Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B55E66482A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGrO-0005P5-E4; Tue, 10 Jan 2023 10:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFGrM-0005Ou-Jn
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:48:20 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFGrL-0002WH-60
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:48:20 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AFd9Th011216; Tue, 10 Jan 2023 15:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gq4TefcN4WY0zsgOppGwNzG+WShTZ3j5wYZ6xIJwxwo=;
 b=GpY0VluZEYwvVBc1SrZ7SGQsSUSgHcCZJ+yq4U1UobEdhlQAf5vLtbBNgqZMyDygZ4GX
 cPL1u5d1UPyO7eAhCF3hizMJZW+iGl6hdxwR3TDkazmOm9xWrjvRapr6rpTqrE0gwWOd
 hGCgIdyCfM9SlZ4ND/lRJxDHC+mhGkzEJtWP2x1z3gynQYiJvPX8PUqpdr2vMxBdm4fG
 Ye8Xn74r9cC9Rkmaroe8tFttO5/uOeaay7TbUKE11yndhHjkiKvJhdYlWVLaegP+3kfe
 w2rJ/IZdtoFsn0aCmnFlYi1K9nAZLKbrk/vIg3U0l6ZMxLO82oG7vLMxj9RnYB1AJNcp Ww== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3my0scdk6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 15:48:12 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30AFWTjR025378; Tue, 10 Jan 2023 15:48:11 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n19mcmq39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 15:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF8zzQtj5g1nzC5FySJXGmutARTXbO18hZS6HDCBBEO9RPCkh5QUFwwfz0wquOFJ+nhzwMjK+1Nxi3WA3GrufzwSye8tJyhM0SJaNHNPE9y5f0/BT/6FI4FBq+FVEMpnqr7mMrzH0+g1ZCq9gm5YzRsPxtHrZo8G3/VUAKHKJlnfNnML5Eb/eHlP2IiTFOKrKvnC+uQnuZN8wioSZnqBklVZtcwY5sx7uzwsPTu3YuZ2CgTD4Ch4NPa2UFsyoiE3PsbjAcfko3yxC7xS2XWWyKg9yHhBwFdr2RfklGz+KVccaoEJtgovav+0uc3lItQaHs4OvKdx8QFEMTS8qw/YjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq4TefcN4WY0zsgOppGwNzG+WShTZ3j5wYZ6xIJwxwo=;
 b=bXlc1vtHRGnZF6X5sZb7Ah7OyZu235W6SCbWmqvOcxd4HqUGl6gK4zEWpq2BBFzijQ+TAGCaD3FPsR4O918KaWxqyl92XmyGTwi2jvhi5s9oeWv3pu/pX3wD4Dcrc4hEHAYxsQFwaDqNOssKu5sJLvFQIe2rdUh6eMmNxOPPWAI1X025LMKuUO0E4SZTkCLtcechtgK9VbzSq98KjkZl20bcG/XXTs1s0tyBVsKxplxiOx+NllIvsBkUKnorUqH5vjXz4D73GnSn6OypH0l/Mv7n/eecTcAhpYZiwDCEHDR8D9/nMyT542sX72Up+WMNEYDo2YqsdKZpHHdkU6m0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq4TefcN4WY0zsgOppGwNzG+WShTZ3j5wYZ6xIJwxwo=;
 b=IKUFACA/6oNj2qXB9oJFD5SH4xpbfwFGmKaV9jtexDS0bJ7xgkBwf0UetY7sjtQqRffagcA2319PYCEHBzheG+QQGj+tC/NmU5kecxXkI6ndQ2lnp0KtiR6x9AEFKFUqxzlIgQEHNNeBr0gi9x113wL9XVXI3dgEubEZP2b6Mgg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB4213.namprd10.prod.outlook.com (2603:10b6:610:7f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Tue, 10 Jan
 2023 15:47:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5%7]) with mapi id 15.20.6002.011; Tue, 10 Jan 2023
 15:47:35 +0000
Message-ID: <cba44543-9b07-c097-fa42-de17746a6d9a@oracle.com>
Date: Tue, 10 Jan 2023 15:47:28 +0000
Subject: Re: [RFC PATCH v1 00/15] Xen PV backend support for KVM/Xen guests
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 qemu-devel@nongnu.org
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
 <d67bb9ad-852f-e38e-d6dd-28de54d7774f@oracle.com>
In-Reply-To: <d67bb9ad-852f-e38e-d6dd-28de54d7774f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CH2PR10MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b88625-e61c-4f0a-e507-08daf321fe7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68l+BVq4Y6OTiWESaJB5EBqm3Uyc8jU77WzVsLcunF8o+lHbjuxDPDjT8kZzUNraRdLpln6EPpkHLzFh7n2PbFYhHG25oXbsBejx+iYTDUZdZtPrNDNxywQP/Neu9RrH8Z8qw0lrBRjROrTFyWSNv+xtIBHRdJPwdjI5DG1QLkH0HM7NGkDoPTRM2NVsj+5LhcaWo+EraYsg48Eg8RnUD4XqaCdZaHX7aNGWikccR50x2QjA53ITSEpGrX6+1KAVu7W2XBfB1usMBrupCdnnnOiCmBl4lJcxCzct5lFIWN1p9Oozf16rps83qz87AYSKLMVbuYxBdWB0nksULWiuCl4U3ywlhLP/bTnwg1BzDOkNA6uNZ1hqnPHpVM2Zn6MlrvVa8IxqRo8fLNuO6osdBns80KWqHS1i09tpVaUYZyoyZ9ECB5DBcxrGuOBG5mfje+DRKQqX6dv8Fty8ul3RZ9q0XSwPJ6DkduVmy9iJIzDGwN5uO0Z1z9rT7G+i2Nq6pbdJvESruPET/CvSBc1Kf4U992mWphEWdvbyBaRRV0juYtfXZi4pLk/1ZbfFStGZ7CRptZiaQJdO3dUZskDvWABgOPn1YKvtfgVTOD4PVfhZQcfNVf5AEbfDXiNRIAEePwQ5/B5kjn9UP/l4n8lyK7fa4UumJaCVsvXaiag52YgB6TkmltDcsoVm1cRbPs2OxfH5z0n9Yv0AgbOQ0UKQ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(38100700002)(31696002)(2906002)(83380400001)(86362001)(6916009)(5660300002)(4744005)(7416002)(8936002)(66946007)(4326008)(8676002)(66556008)(66476007)(41300700001)(6506007)(186003)(6666004)(6512007)(53546011)(2616005)(26005)(54906003)(6486002)(478600001)(316002)(31686004)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpPS1ZXT0ExVkdIaWdsalBGOVg5M3lqTGh2M1NmT1N4bmpncWIzSkgralRG?=
 =?utf-8?B?ekdyWDhTNWthbjZzdVhWWGd4RlpGS1phOXFJQUpyOVUvUTZudzdYZjVwL3J0?=
 =?utf-8?B?N3RNd051VWpjVllneldrSzg2OUhrOEdTTVZSeEVzM0RXQ3BJS2VwSDdJdHpy?=
 =?utf-8?B?NUZqOUlIalJ5dWFJRW1NcXZwelpjMVM2amk2RUw0SXowbHo2dEpsYjB4bXJO?=
 =?utf-8?B?TFJWMGgzcDdnbWdPVis0WVFXVWhpWGpCLzdMRHdEZnJHcTFlVzI3ZWdYTnVn?=
 =?utf-8?B?R2U4bnQyVWR3VW9xWi8rVHF3UmFibnBHd2tXYmNtUXoycDRRV2ZXeHA5Y1Zw?=
 =?utf-8?B?bTFwN1lRT05Nc0MyOUh2VmJDRWE4L0pqTmxFTmV3S2hNa2t0VlpIRE1KR0NX?=
 =?utf-8?B?dkRHYytuZ0N0RytHNEFQdVBoNXpxSWZCb1J2RG1XS0pmQXE4dGIyaVhXUUtY?=
 =?utf-8?B?cnBnb1F4cHhMdC9yS0hUbHh6blQxTHJWbHpCVDdBR1grUzVaMVkvRnFlNmlw?=
 =?utf-8?B?alc5UDUxaVBIdjZTUlh3ZTFHWkNyMlRoRVBlWjdYOG1WTzBSK00yMmpMOElL?=
 =?utf-8?B?Z0YxaXhXdUwyZTczSGlwdlMvZjhEbXU1NWhPSEN0aVJxb1dzOHlnek9SU3du?=
 =?utf-8?B?dndxeW1CamVSZzlVSjZFWDhZV1c0eVZ6OFAwTmNyajBaZWJBVDRNazBuaWlH?=
 =?utf-8?B?UUVJd015c3FOTkVZWHVaUCtyMWJCOWRuSURKUFppa0cvYnllQWJ4UkhLSER5?=
 =?utf-8?B?eHVhcGk0Wkwxbm56WDRCZXAydGMwZldLbUdWci8vcjVjYzNYeFRPT3RPL0ps?=
 =?utf-8?B?UGRwWE90MFhOTTJqWE1DTi93eVgvU3IwMTNvUU5wQkZYWk82WEg0SmQya2tr?=
 =?utf-8?B?aXJTVE9qZUx5RmhIMUFaa0dJemt5eFR4K1V6L1N6QytxSGJ0UHk4QUQ2TCts?=
 =?utf-8?B?bW03UGV2cDhlTVMyZjNKWTkzNmVXSEwxMWh4S0ZFcGxqZVAxV25jTmtEM09J?=
 =?utf-8?B?d1Yrb2VQRVF3OC83anhWWjhnaDdCUWdFMG5SQXFEN2RPNU9YUlg2bVNnVjdM?=
 =?utf-8?B?YmF5SW95YWNpdEpxMWNrMXZic1dKcmg4eWlieStLU0cxRG9tZUZ4WTVQaEhT?=
 =?utf-8?B?MmdNR3hXUFk0UUY1RlVaN084SEkrRm5Sdkl3aWU5ek0rU2k4ckhRdEtHaWVD?=
 =?utf-8?B?SG9nZVUvdUhJbXNXekpSWmpocStNeW9oWTJCaUZLRGtUOERJM1JkZUpTdHdw?=
 =?utf-8?B?ODZ1RExFOEdmTm1OSHJ5bjU5OHZiS3JJdHdIekR2QXIvV3F3ZlQ4ZUFLYnNu?=
 =?utf-8?B?dmRTTjltcnVHemQrVlVHOFVYeTRHNHZrMkl3NkJPUHlwMDUvWGZ6SjZscTM4?=
 =?utf-8?B?eTdtWlc2UENXMWJLSFFYc3hGTzI2YTNMc05wNk5MN3FBU090QW9NclEwRHN0?=
 =?utf-8?B?YWlCbS9JdlFuM1A4clJZMG1uU243Rnpza0haZHBVRTFmZzl1ejVOZjVpdUJ2?=
 =?utf-8?B?ZjRwcThvUmFhM1V2NXgrRldsRlFNVHpkTEs2ZmN4K2RYTTE5Q0pMSTRSZFN2?=
 =?utf-8?B?VDdJNDdIZDFxTHZyTFdnVnFIK2tPREJZc294R2V2cVRMZTdHZ3YreHJVZ283?=
 =?utf-8?B?dC81Z053MUJKVng2bDJraXk1NXd6RkxHQVpCOUxVOGVRTG92R3MyeHl6dEhk?=
 =?utf-8?B?ZnBRZzlwMEx2NjVBYXU3Q21OMlNYalgwZlhUelA0UERmMVpPZlhaQ3JQRmxz?=
 =?utf-8?B?V3REYjhBUWdacmNGZFdwOXRGUmY1QWNieFlLZnFQN290ME5FMTF0VVExZWNz?=
 =?utf-8?B?MVRUMjlKMi9MbXVja2k0RHFrY2poOXFtOWFjRElOU2hwUjU3czFqU0VYWkRt?=
 =?utf-8?B?SEFjVDVwNk5lUHVaSzlFclRaOUovSDl6YVRiTS93UTczR2dLYlFFN1dWb3Bh?=
 =?utf-8?B?VWp6a3FId09idVJwNmlFcisrNUVNZkI3VUhjK2Z1a3VHdGY5bzNiSXNLQXZI?=
 =?utf-8?B?a0dDZjUweXljVFBiN3hyN250cjFXVGRtQUVQQWhmZDR6SUttVHFmR2NxN05o?=
 =?utf-8?B?TEdHWks5SloyRUtIaWVDQ2pkbUFwUUZaU2FVbzB6WWRyK2RxZGg4dFRPRXhR?=
 =?utf-8?B?VXhlOGNUWjhvWm85UytXenRWUE1yT0hQZ1FOODNyN0d0eDZCTDdqOGtmYlBW?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: abV+T09uxhp618DoT4KqVqu4c9aCzPC/NNFNHJ60l5InyCjKEZAiD0IyPKm4ukwzwatuAKkLuYoM9hdpKK8Y1u1aNg8aFveyBRuwMebW9O9hnS5a56nw695SIENPK0JWgGmpiQdfgqpzXzqghg6xFpVIMsfQW5LxQNUL6io+Tc1n6wxyuYv14Fr0FN+VpQXT0RIb+dNZhWe1ZQY5oUDasu7gCDRi06QcjNdOLlZPFBzYbwcMtYz6Rq2K9tBjTtUGYtwPJpP99aqJ3bJ9shLW1W0W81Unp8b6vSUccqw4CKtwr2o+GRaQiTp6Venpy8tAe4lxApa8DjwH4X0WHHiYCuFpXVuAKZwftQU0RmVQmOBKe5TeonP0qAvKWXPHkwxwDcC5YqyyZvtQlUNB284og4q1oWbaf1VnKxq4U/zRTWhZo4KAYlPuw+AvrxYLstf7W8zDYQXA610cEKYTzPAL5rYrITyR2KtXSyoyGf8PK3vAv20Hujqd3fbTYcrY5dA4k6KW3Tfopcj9sPdQ16/oJYg9CJbav7GfugBQ/YYLoWljw5WWW5eubow6OvmE6AMsDTIPRnwjNXCeI9De2gytJ64se/a0PN1ZtjVN4bugaBB/Vy914GZiTH3pyXWHK/b/sfmIV1XNxstRj7vPljewIAUY9qtlwBKC9yePAefgVMIRgYX/fDX2pps0Fihyj+/eI3JYse8VtwhtJS10yQitJFRXB12OzipbFUzE3HocyoR9T/KOXoMx37zPsodclUKcel7vVsEE5GwZgVArH0EzRRbfPRoAln5cBpjJkkpqVAvQ72m9rRxSCKAwt5PGSh1qYtO6YFxsKME6321bGNvhCJswQirze5D70pay2Sp3z7m/Oh6tjeWvcilX6QMwaEJpDrLkgRFBs8YqHkw1PVPNvw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b88625-e61c-4f0a-e507-08daf321fe7e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:47:35.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEbdPDAMh2eMbf9QYR9Fa7zRF9P1S+EooPd2PnbaZcBxT3FsAloWo1+osydQkWDaPFXgCmzSsr67c21pXjq4JNtKo5MkRSBG4JIvmYQ1kMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_06,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=954 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100098
X-Proofpoint-GUID: c6neLZktkjnEBRirBEmgquKFjA3poGUL
X-Proofpoint-ORIG-GUID: c6neLZktkjnEBRirBEmgquKFjA3poGUL
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

On 10/01/2023 15:43, Joao Martins wrote:
> On 10/01/2023 12:37, David Woodhouse wrote:
>> So for now we'll limit the
>> back ends to mapping a single grant ref at a time.
>>
> Which is not a practical limitation right now. 

Gah, no. xen-usb and 9p do use possibly-discontiguous grant maps :(

> One grant ref is actually fine
> for the everything else that is not the block shared-ring.  Xen devices in Qemu
> seem to be using the legacy backend interface, and thus (un)mapping one grant at
> a time, or otherwise copying grefs.
> 

