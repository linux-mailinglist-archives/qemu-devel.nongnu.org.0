Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AB5A8C57
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 06:19:42 +0200 (CEST)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTbg1-0000Fu-PM
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 00:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTbe2-0007FA-Td
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 00:17:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTbdz-0006ga-Fh
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 00:17:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VNmwkn026986;
 Thu, 1 Sep 2022 04:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=6YN8MlENMtXcGsoPeqPL6LUFEXwsmSs4UvYCO9b3rfE=;
 b=pRj6o60j6FgdIOzj3W1TiDKI6cFbDJg0BphCqe0roIzwb0V/FkywbQhIVM+Te2u53ZXU
 GmiCYb+KGOFCll6R/L3MR4HCe4tTaT5qoyBXImVEoeUxiBUETZ578kYqRpfnfsy9/L61
 3Qk2SRIeTub8UcJzAS1K3aIyhwGKsy2QaXGz9vOE+sLovfKDtb5TU3M40UjJ2/v3ExZi
 /jxO5E5L1WmgZle1FQCg/2vtn1QNVFGjtGHotaiDRcVmVhSuiML8LmBQ3ej5hG1gMBmG
 dYYi3M3Jz+DIvByulhLQatX6IIn33ZaBJzgDs/6HKUoQeuGmSulksAJ6xBcEk8Aqjna7 8g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7avsjwfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Sep 2022 04:17:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2813aSom031363; Thu, 1 Sep 2022 04:17:16 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q62p39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Sep 2022 04:17:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0pbHRS+O3SKY1oGfktmAMq7mYZRCLRYPmtKSJK1C99hWFtOMhPDZrG/21MOsLvU8c3KPrg73UwX6lydqt63KIWGqG3GIge3JgiOqNLydx2hQ9mzeGXQDoOcyb0TiKon/kEDYvmxIXkkCbfQNgu46ChsnRue0/ETpmmM4efRZTuIFPfklQXjg+Z23K5SdAQZQ4UlWPKCsXRKGxS/LlLTWNb6OE/KFRE/aUU32v9pd7AAmxAGuKhnlSz/9yuL4xVZBmsrxDHMT9tpVe2+CLoCRTUjWDlax8ANf6stSFb44mXbzEXFfZCymuV9nzvYgp0RPups64CmyYrSep5jJbB7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YN8MlENMtXcGsoPeqPL6LUFEXwsmSs4UvYCO9b3rfE=;
 b=bXsTXm4ie3+XuTFFLGWExxpSQawbOI6jl81r+s6of39dQ8oy5w02e3k95HNTaBWrIdqqe4ejSIkDjV2uVBFC1t3anc1vRtqWpcPQS+FFmJ51MTF8jId7L/VBmOtuVy4pbqEr3aTJPXKT5NKKxO84ihk5SqKz4XjCXP1D+OnypwFKNkaC6YMM+Vg76PXLGLESSrFyXdretP9VrToqddgjFa6qIfBIHVDs+y065dBDtvMTqIkt5F5CW3oOaS462fP0oweedTYsMBC2HHzjYY1a1EF2y+PKzgWTxvh+95Wc8kEIdckUJJqn2YRrs4WHlFKqdvaZYcsaRtwRGLImtdUaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YN8MlENMtXcGsoPeqPL6LUFEXwsmSs4UvYCO9b3rfE=;
 b=hKsy3pXyYrMsWCSdmbGMs3aSRdNfLe/sZhMg4CYwKLQIVqnayYPNH9AHLS1cB0ZFCFgP5/D4OAIFjU6VPoMytCjYlSTQB2ewgAtddqypLtbV9OUf8QVc3LSOYZU/19f/PH8CieaDtlut+4CZ3bFVRNml28/6ZmrcbviYdMGhOa0=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by CO6PR10MB5588.namprd10.prod.outlook.com (2603:10b6:303:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 04:17:14 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 04:17:14 +0000
Subject: Re: [PATCH 2/2] util/log: add timestamp to logs via qemu_log()
To: Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, joe.jin@oracle.com, alex.bennee@linaro.org,
 f4bug@amsat.org
References: <20220829100622.1554-1-dongli.zhang@oracle.com>
 <20220829100622.1554-2-dongli.zhang@oracle.com> <87czcihts0.fsf@pond.sub.org>
 <56952aa9-823b-252b-33c3-7a7c5b31d2fc@linaro.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <32860776-41b1-2c1e-67b6-95e62d1a8fc1@oracle.com>
Date: Wed, 31 Aug 2022 21:17:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <56952aa9-823b-252b-33c3-7a7c5b31d2fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::12) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d2d743-64a4-44ce-e729-08da8bd0d97b
X-MS-TrafficTypeDiagnostic: CO6PR10MB5588:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0exKbb0z9oumfS2zvg1AIkMfRfGrsm+7m7pnq3yOI/PQliI9xW25c3rgljpQU7SzLkILEnevP5GSJ+1VdvSegiqARgtNMDfJA/Bdah3LlAw2NxK8g+iIWfuHFC8Mnh9UHvq+DZYIhEC0xcRu5Alt9eJgiETHetqY0503cFT2g1DreTrdh5rg4Wm8lrjgopjO+rWkGX1T4Hvqo2MTfsFxPKrfnFx1nsj9fyayWd5UFWcmWdviwKmfAV+BkZQe4iKyaqYSYCxIW3Wj6ItgpqtqD67OfGYWKXRqLDTVKX2RPwF6JCfsgdknmazeXmcg63dcnW5KNXTLkSosbwO5/ntn/zXnXvik2blpUjIk/mm0j7ooqzFRDzNwVU+8wkaHCYUKY6rRa8GdCffhlG+gmucpbeQS9+ogyF+xSBWpeESDIOZJxYgI2VYV2FyhRBPegYu+2ZLxqveEldNy6TgySu4A7wN96DAWCMT2NjD65bzdPHEnd8ez3ongqrAqid/B4uiOWfNMMEurQ8zHkq2BiD47Be8KLIBsqvc2yY8cuXtuT8A7mWRkagjgoQIjjnY02HJ6YsYGnOFaD5tzeqZGIjaJFS4rHXvY6h90XFBLM3AqEUwS+VprWWdWLllmvwzsICn8N8v2olJxDNANRBZen/68C5mtZx/0KjAAr1+nAhbb4A5UMBZdgBrWozM6LVhSnfBBs9Bg3KHHA7saKSGVineDzY5kGW7GbGOnYiP0V4OkcKl3qTEGbcxwc/GmpQJ6dz+2kBulJkudD4dfHDzUhnLm7F6tIIZOC3bEC/yAf2dVJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(346002)(376002)(39860400002)(396003)(31686004)(316002)(186003)(66946007)(8676002)(66556008)(4326008)(66476007)(110136005)(31696002)(6486002)(478600001)(5660300002)(41300700001)(8936002)(86362001)(36756003)(44832011)(2616005)(6666004)(38100700002)(53546011)(2906002)(6506007)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE4rR2FWVDU4bk1ONmtLdmR3Q0xuU2dycFJXajlkN2Z5b0dZMUtlVktJQ1ZR?=
 =?utf-8?B?dit6b0Zzb1Q2dlhBS2V2RHBxUmNIUGhCNm1FMDZmMXM5bW5qb1NmZTZUNkw5?=
 =?utf-8?B?cDM5VEVvdHN5My9EamIvZTNUUXByNUd2eUpiZmFrejFnWkdDblpydzlpVWNR?=
 =?utf-8?B?TEdsZjI5MUJJNElLWDlVcHJ1WDgzZ0VOMkdJWGhuS0tYYTRyZnlESG4xRVZJ?=
 =?utf-8?B?V24wekJ4ZFJZaGpoZWJZRzIyYkNraUtvTXF1WFdDWjBTVkVqOFNYRnlWQ3Qr?=
 =?utf-8?B?UCtKWWg0UjhPSm5RRlFCVnV3eTlMalVRVGp5MmtxamVzamcxVTJkZHdHQmpw?=
 =?utf-8?B?c2MybDhkRTY4c0s1K3ZXVG9Jb0VzTEc1dlBFcHUvTEVTbUlUeUlpWk9KK25D?=
 =?utf-8?B?LzYrdkE1NzlZaTNqWGt4QTRvYzZjRC9KVi9FMTM4OHdlbnlMaEpCek5ESXhM?=
 =?utf-8?B?NXl0YS9pODBvSkhqSmxFcjZMcEY0ZEF1OXFYVjlaTGVtSTFPUWdISyt5amlE?=
 =?utf-8?B?bm9kbGtzam81bkM5bTBnbHdib1dFYS9NRGZUQ2grM1BJNFkwd2ZuS2RPbEk5?=
 =?utf-8?B?M01lYnAvK3FzZWJkMkpVWnJ4a05yTWdwd0tKSnRDa1Q5OFNrd2RENTRKWXJo?=
 =?utf-8?B?VHpldGErcjZJZ0hpa3Y3K0hJUWNSZkZPWEpEQi91QVJxWlhBeFluOUhIcmx3?=
 =?utf-8?B?VEd2a0FJQUtTaGxnS2dOdHZKSnhZbG9yTlU5dlBycndoQjBvTHplSGFqdHJv?=
 =?utf-8?B?UTU4MTVLZHk0RVF3YlQ4bCtSMTU4elZiY2lkMWZCQ3JzVWFsUGZNdVZNUVgv?=
 =?utf-8?B?ZTZCTVdNSUVacFpRSldHTHdWNGtGamYwTDhYanZncEd0Ly9ZNUo1SE9EWHNr?=
 =?utf-8?B?QXZtRFRDejNxbmcxaldPdDJnbzlRYnZ2SHg4SjNROWFZemdVeTZoS1AyT0Vz?=
 =?utf-8?B?dkFzcnR0QlM0T1padW9zY0hINWtkWDIxaWYraHBQSkI5VEh3dUNLQmRxUm85?=
 =?utf-8?B?ZXJaaU1ORENNKzU5YUZLNkVnVmE5MVoySE1ya0I2bTluRmZzR3dMU1VVR2Fv?=
 =?utf-8?B?UDJ6a0hhaEgxNkYwRkhaSnJNc2RSZ2svM0JaVWxKMEFCcTJLRmxuLzhhWGo2?=
 =?utf-8?B?V0UrUzVtZ2t4Mk1sbElrUUtzMWNlbDRrcm1VU3pzbStQeUNibVZPKzBFekhU?=
 =?utf-8?B?WlFtYjU0OVlXcVRwbm1Oa1lHWU5XejRaQkFDaS9SNUYxV2dMTkxmeElNKy9Y?=
 =?utf-8?B?eUt1aVNPemY0YlkwNWpGcXlqRDRjdGYvVktDQVN1VXp3Q0gwOVM4V0pjcWlI?=
 =?utf-8?B?NjhBdmlHMm4waEVFV1ZUZFo3cUhMaUw4MURhc01RRDV1eVZzT3FGMEVTUDA5?=
 =?utf-8?B?TkJRdmY0djFVMkl5SEJqV1FLcTlpTHptS3RnWGVPWUo3b1JLUWp1SFZxaXQz?=
 =?utf-8?B?cXpwdDVMWUh1b3kyZFMvcjVUakZnbVkzei8vYy9XQzhSYTNmcHFIZGNRVmpa?=
 =?utf-8?B?alVSS1V0Y2FVc3NBd1gvL3k5WUtrRGFpeFZaUFRxQ2UyeExmRGgwTFJQUmFa?=
 =?utf-8?B?MllBY09VMm12T2VzOUNWZDE3YTg2WCtHRS9QbVlCZzhSMHZHVFRQeThnMGg0?=
 =?utf-8?B?ampJSHhqOCtSTU40VFA0c3FENzNWRGdIWjNsYW9aUFJhdkFmTzF6WFVOUmF1?=
 =?utf-8?B?enZaTFFWM3p4U0Q3SEZHMnMwY2RwTG1NR0J2UGlkNlJNS2FHcEpUeHM0Q2J1?=
 =?utf-8?B?VklxeXYvVE0wZW1vYTZ6UTJTUVdjL1haL3lsaThxK0V2NjVvblNjdG1WdXhN?=
 =?utf-8?B?ZmpWVzJxZzU0ei9yZy91UlBtWDQ0S1kycmgrSlIrbXNueXY0N0hlOGdoemky?=
 =?utf-8?B?VE82U1JzN2ZBcUlKWVhqU29RL2dWUnc5R0svckQzVFpNNFEzY2h4VWgyTXR4?=
 =?utf-8?B?dHU4eFlTTWhFejYvajRRMG1BVmZYZmFRM0ZHc3NqTWdNZTd5UnZWcFBTYUZG?=
 =?utf-8?B?OXFka2hSTUhibFNoS1JnM0FuelQ5bmR4NVM4N2xjMzNyMi9BWU5qZHJpNGdw?=
 =?utf-8?B?UHoxNzF1dDVQa1BNczZJdW82OHZXUGxKNnNzVmxNUXVuejFjdmJLbVNDNXlG?=
 =?utf-8?B?dVBoa1pEM3FQSlcxYUxDa2tqa2VBWms5cnN2WmdGZjJUanJ3ZmhpZGZ5eW05?=
 =?utf-8?Q?AFpn7Ffava/ypJT60lF9HUw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d2d743-64a4-44ce-e729-08da8bd0d97b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 04:17:14.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ks2vq9Uxsffx3HAr9A4AtREkNcFDPIC8WMNONDU1IKzIZAYUX7I3Wlrj/oNu2UvCJvo09k9JzmXA8tb/Wox5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5588
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010019
X-Proofpoint-GUID: bH8weRoml3KTVkFOWgzUDwGMjRVflx1-
X-Proofpoint-ORIG-GUID: bH8weRoml3KTVkFOWgzUDwGMjRVflx1-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Markus and Richard,

Thank you very much for the feedback. I agree this is not a good solution. I
will look for alternatives to add timestamp.

Thank you very much!

Dongli Zhang

On 8/30/22 8:31 AM, Richard Henderson wrote:
> On 8/30/22 04:09, Markus Armbruster wrote:
>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>>
>>> The qemu_log is very helpful for diagnostic. Add the timestamp to the log
>>> when it is enabled (e.g., "-msg timestamp=on").
>>>
>>> While there are many other places that may print to log file, this patch is
>>> only for qemu_log(), e.g., the developer may add qemu_log/qemu_log_mask to
>>> selected locations to diagnose QEMU issue.
>>
>> Opinions on the new feature, anyone?
>>
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>> ---
>>> Please let me know if we should use 'error_with_guestname' as well.
>>>
>>>   util/log.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/util/log.c b/util/log.c
>>> index d6eb037..f0a081a 100644
>>> --- a/util/log.c
>>> +++ b/util/log.c
>>> @@ -129,8 +129,15 @@ void qemu_log(const char *fmt, ...)
>>>   {
>>>       FILE *f = qemu_log_trylock();
>>>       if (f) {
>>> +        gchar *timestr;
>>>           va_list ap;
>>>   +        if (message_with_timestamp) {
>>> +            timestr = real_time_iso8601();
>>> +            fprintf(f, "%s ", timestr);
>>> +            g_free(timestr);
>>> +        }
>>> +
>>>           va_start(ap, fmt);
>>>           vfprintf(f, fmt, ap);
>>>           va_end(ap);
>>
>> This extends -msg timestamp=on to apply to log messages without
>> documenting it in -help or anywhere else.  Needs fixing.
> 
> I think this is a poor place to add the timestamp.
> 
> You'll find that qemu_log is used many times to assemble pieces, e.g.
> 
> linux-user/thunk.c:360:            qemu_log("%" PRIu64, tswap64(val));
> 
> linux-user/thunk.c:376:                qemu_log("\"");
> 
> linux-user/thunk.c:379:                qemu_log("[");
> 
> linux-user/thunk.c:384:                    qemu_log(",");
> 
> linux-user/thunk.c:391:                qemu_log("\"");
> 
> linux-user/thunk.c:393:                qemu_log("]");
> 
> linux-user/thunk.c:417:                qemu_log("{");
> 
> linux-user/thunk.c:420:                        qemu_log(",");
> 
> linux-user/thunk.c:424:                qemu_log("}");
> 
> 
> Not the best idea, really, but the replacement for this is to avoid qemu_log
> entirely, and use
> 
>     f = qemu_log_trylock();
>     if (f) {
>         fprintf
>         some
>         stuff
>         qemu_log_unlock(f);
>     }
> 
> at which point you don't get your timestamp either.  You'd need to explicitly
> add timestamps to individual locations.
> 
> It would probably be easier to add timestamps to tracepoints, which are always
> emitted as a unit.
> 
> 
> r~
> 

