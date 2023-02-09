Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B78690C18
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ888-0007iI-Gl; Thu, 09 Feb 2023 09:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ87v-0007dg-4W
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:42:19 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ87s-0008DE-J5
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:42:18 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319BO19N014280; Thu, 9 Feb 2023 14:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+eu+ANcw5URwN2UFeO+EtrkVc7rKTHWiw4/UCzU/s/g=;
 b=aiVteojesceFUNHOPegG8gppiQkAyB9bb4Q3NKN/jWVngXfXFuspyN8LNpOqLZP1hByX
 KpgecSS6+Y3pVDb5W/gRDev+8qwdFQl19pQXZcbKeVv0xK04Wu3UhV91kRzNK2SM6Yov
 Q0sb8srCxbP9k2NE3nFiDiXpLFaaakKgdhrQIq1XH4Z6130QQoa8Ho45wpUPJJpDeITl
 DfG7qdcbaafhrKLS0q7OUKt8qA+vb6InHquOv+fVtnsrynIhS2u0Kkgx9IX5tbRZcr+G
 AT279dHL9F1iQqzUM4Pvht0RoxPZOVjbBI1i3tQFEAwkHl4G8JPTetoSKff1TyP+fTeX mQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcjwvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:42:14 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 319DbXD5013624; Thu, 9 Feb 2023 14:42:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt8vfwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpCiFEGQK3o/rxMZIzMCnXgAYm3FzGh+2a/5y/EB9Q5UwDS+AM4ZnXr39V/Li6Tc8fZcrp4Z3ZuBVmJcR/ifX7amXLqQfy0jsb5GawHjPwtWEDrV76TKy3BqB5Bg9dvkamDZmk9yjz0ly/bj8dWK7MaUd+ehyZ9fSkDdXJZ4OzxvGXMK1R/u75rxu3UiQ4csTAZ25iVEoZcrGDaJSuFyq9zm3RAxCmajqQAx9zPu8Hyl6Z30OCfAY7+mxnnPO6ol1uPKMkqoX5XAOyhamQc1eyHw4+DS9iVzqvZUEQOPJU692gILn8iSV/u3m/4DK2IioTb1jOB3Eb2LIrHEMi2EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eu+ANcw5URwN2UFeO+EtrkVc7rKTHWiw4/UCzU/s/g=;
 b=cvMZiAEA0zEhF+5G322JbXJsBjAsdcC+CRIQsVcCy3lfuuUUyG3Xa+t0tiEJR5tU/kCuVuxkQWR23eJIJ8xZH0/aDCbwcmfika8Bp4dbJHbzf3FJtsGOml26WkhlXcyUl8yjkUZhPkUbeL+hNRGqlhvx/E6SSXlZO9HHEu0LQBdqiKqKJNckfHyWdUMlmrU2dwmyzRugna93lj3L8p0j53OvA4OCxHIYUEyOTeovFgGiu4HuXihVtEehAXHOmcQ2bB1Y3x3TQhvmwYr5KR7lnzryZVIsPyL0iiMd7dQEdihXvTZRMl0daxDwsOe7WO8i3Z8TDnuYaWUsJoSsfIiJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eu+ANcw5URwN2UFeO+EtrkVc7rKTHWiw4/UCzU/s/g=;
 b=eqCbTkNZLLxpZL9SslVRiz5+7K7d9VFmTja77EqnQjhoxZsKtqfoMoZG3NL5ybeYcZic/QyWU520QpQ1NqE2nQSvOcvWX0ONMyyPT2SHnmpRNqhjAmajhd/Orf+fptb4yIh9AtPAJQ3wmp3EVs00t2y2e0knEa0UDVRyixDuxwc=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SN7PR10MB6523.namprd10.prod.outlook.com (2603:10b6:806:2a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.11; Thu, 9 Feb
 2023 14:42:11 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%8]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 14:42:11 +0000
Message-ID: <1e8000c0-a8b0-ec5d-9bb0-f1f00a03d597@oracle.com>
Date: Thu, 9 Feb 2023 09:42:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 0/4] string list functions
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <878rh76to0.fsf@pond.sub.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <878rh76to0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SN7PR10MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 14998664-e56e-415a-26d9-08db0aabd3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /B4TjdGJ/v6GVUQVFmXItL73xVtkSNMyZIUi8j2tHo1G5wetwIpVquzxu4gr/VpZ++aY1iao/YeNleUloIFYLqNbYkAMFmNghMoCZia1z9CIJydg3O6uZDs672dl3O4kyAevyIm+2v+3ctOssbH/Co1APcFsmPPRv4h6bwNVt9rgQ/5GwRE6E1Q6IxHJdaF5BjvOr4gphUhhrwEegv2v676ctUTT4kGY+UtLlBDv5QkXHvzxEoZyV3QN2a7urnUjX7Y9FbLJqDh2tCke2VDb09l1bxhncCe6Y3vP/tTVIXvSiH4HJ0fh1aGwbxB1sSI3BAC0mbSFUCWtCPjV1qHigKX3SKU8ROW4QX80a6lVyJbZlnjAqDShW4FHzpLDy08j6IOFBOXKZ2FJvpwCT0r0PgB6D1nhYaf8RUJaMen51oKvm3oTLyUSJyTG8tVuSYgfpMTddRYqrvc/ldemYvtmnXxiQk8yZTiGqL4tLBQjOagUaJrxEJULiONDqAZfApmLY5G7OHLVjgDC7q8FMTcrgEfycJ8sfnvGjvjdB8zwD75V6ToqHMBA/+g4Y2mxnm/EwNXFYFBoI+LncVxz+DDGO3whVg5HHVm2Rc7Kh++iBa38xKXOBR0rx/OxR3HAsXuz8Qqfi59f9IMk/BiaM4vfaDTbjyAXfxKYKlSmVlJxAEk4j5vFfE58GNI2dLNdxRXGsugvkdA/thpz3b88w9XWWHmD8FS6SKnGCgGdcnXRtEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199018)(83380400001)(4744005)(44832011)(36756003)(2906002)(6666004)(36916002)(54906003)(6486002)(8936002)(86362001)(5660300002)(31686004)(31696002)(316002)(6512007)(2616005)(478600001)(41300700001)(38100700002)(66946007)(66556008)(186003)(66476007)(6916009)(6506007)(53546011)(26005)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1E5UmtEbEdyZ1RGYXB2bjJ2YmxqVHNPYTNUendLc1JqSmJuVUlCdUVDYW5N?=
 =?utf-8?B?cm9JR0x3dlNxRHE3WDFYczRtdm8rU1IwK3V2d1Z3R09EcU0zTlg1Ukx3eWVk?=
 =?utf-8?B?SUFKVjJaWVBlNm91UDA0b1JIOWRDU1RTVktSU3hKU2FYMjdKM2p5TmlWa2R1?=
 =?utf-8?B?dUtpSmkrU0JQUExSK3BpVkI5QVVVMkpyV1YvYzdXYnVTaWxXL1U1WGJBQTRP?=
 =?utf-8?B?MnpDUFhieWlxOGtXeXFrSzU0aVM0V3BYakNhNXE3d3djbVgvY21lK29vSFBt?=
 =?utf-8?B?YmRXWEt3NkxJRFNXejZKUkhFdTZzTThVNnBJSEZySXFHL084L1psZllwckNY?=
 =?utf-8?B?eGZ4TW9ibklLaTdDYXFHWitKLysrQjFzMHZQZktQbEF6VHYycmtRWnhqSDFq?=
 =?utf-8?B?UmUzNEhvYnAydk5USFZLeUV2MVdEbnVYZVBCZWgwZ3c1OXF1YXMvOFNPK0oz?=
 =?utf-8?B?YUlJNGk3bWZYZGRuUWdwRHg4aExkSytEbXlYcWJ0YmlMa0hzS3NmWFhLNFg2?=
 =?utf-8?B?ckxVYzIzeUIxbGxJeVh2UFNTWForQTBxQ1RsNlhVeFliUjVuQXpkbktqeVN0?=
 =?utf-8?B?RU5VaW1PUHBaQTViOXNIRXpVbWJVbmVMT2piMGVuamNzMnhVM0RFaWFXVU9o?=
 =?utf-8?B?RlBjY1k4RmlvUG1aNWE5ZFo0SUJWUjJlbTFFUHBXSVdHZnYxN00zTGQ1em1I?=
 =?utf-8?B?eERjMlhiQjd2WmlNTGZTRHRFaW0rTVUybXB6NnQ1Q3Q3R0J0a1AxZ2RpOCtr?=
 =?utf-8?B?NlhSQVFQY2tHSW8vaUY4eTExUjU1aE5NTTFRcDRPaDJ5WG45My9DVm1sT3pz?=
 =?utf-8?B?UmJpUSs5ajR6MEEzRDQxWXRiR0E1UTB6YmFpM3VOZFlVSFRsVmlTUDlCM2w4?=
 =?utf-8?B?c1hrcGVCYmt1Ui83UDAwVzdjNHJnbkszMTVzMU5qRUhvdkxNSWQvTlFZRndH?=
 =?utf-8?B?Zmtac3drTzQ0Ynh2dTNRZU96VTlKQVBER0RidXRaQjl0ZjhyUUVBdi9Ja20x?=
 =?utf-8?B?ZE05VmNRM29oTEZaTXIxektQdnIvUC84cE9jWmo1Z0o2a3ljMTQxVmNHRkdS?=
 =?utf-8?B?M2FXSW5WNEk5amFIeU5KeGhaTVdmdGF6OFh5QVY0c1VsRUxhVDVoRDdudE1J?=
 =?utf-8?B?MGgxTER6bHFoUVYxNU56UXVjV2tBZ3VuT1BJNEtYTEFacUxnazNPcTlyMnZC?=
 =?utf-8?B?ZUdrSVNnRFR5eDhRZkFrMGJ0ckxGbWhtVFMrVVhIU2Z1ekh3K0NRZ2E3V1M5?=
 =?utf-8?B?cmxQSXAxYlFQMGFTNVgwdHhwSklMRW0vM0ZvcEpMZ0ZCUXJtYnVWRU5OdDJO?=
 =?utf-8?B?eDMzTHRBNGdacmxNaHVrZzJYa29FU0hYWWVOcEgxNnR1MEVtYVVwNG5SWGhs?=
 =?utf-8?B?cjdoc0hiRldjWVduaEpJTHhlVGQ2VnpkTUhyTVVIdmN5UzcxMGw0R1huZVlv?=
 =?utf-8?B?aFFkWGtnQTQyaHFYSHNpdTVscXdKNHdCSXkwRkF1am9VVm01MGxKMWJ4eG9N?=
 =?utf-8?B?QUNOK0d1SXp4NkFNWXdSQndETTdnZWpCTzZIeXVuUUtiTW1ZVnl3aUZqQ25m?=
 =?utf-8?B?WmkrM25tejF6aHgwSFZjOXRHdGk5dmMyOGJPWVlhYTFnODgwd3o2ZTUzNGVj?=
 =?utf-8?B?TEJvRXJGak1FMkZlak5obXMzeEFVKzhFMVNKLzVRbWVxOWp0R2Q0YmY4alUz?=
 =?utf-8?B?RENqN2JuTWYvUUJkNkZDZFZPNm5JNUc1MWt4ZVVXN09JN2gzUVRuZmR5L0pu?=
 =?utf-8?B?dFUxM2wydDNwUlpmOVNkK3FxOTFsdXdmelViZFdIdU1NWk9tcnN6Z01yTlBG?=
 =?utf-8?B?bFdPNXZaeVdsakE0VExHOXhVS2VRQk00YXRiTE1xVXBoOUY3UkQ5cnRCNmk3?=
 =?utf-8?B?LzcvLyswSmh3engrVS9PWTMwT2dSM29Jb3VUSGVUdXN6YUVXL0RGY2l0dXM3?=
 =?utf-8?B?OVRHOTN3eGdqd3hkeERFdHQzVWFEMk5vcnB5eUMxbnd2MnVaUFlrcFEvVDZB?=
 =?utf-8?B?ZEZpUlRmSmIydEFLaDVvTFdta2RxZzhCbUpwNzkyU24vQUxmRGt6b3FJOGo4?=
 =?utf-8?B?ZFdiMjQ4ZnJFbVg3L3J1bGpNMUVzMG93bldqN242dUJsYnRxcUJXeUIvRy9t?=
 =?utf-8?B?VHNYMWlQYjlMSUp4YmpHSHlrYkp3UEc3WUdWVVhVZGxTNExOK0xRaTFHNUsv?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LkFqRoUmLhmxwvITJtGlTKCq2uZomc5SvbzRbYeXYTvXf1HhHbmk5O0lud6/EgWWL5BlXFb28XqWERfLT3w6k5ebPkkzoM9u+Nl/tIXkowFPmz8ZlGzNALXoMMa9BikUSRAEkAvK1sA3aslLnchb818uexWR42OumNGj7TxwEVs9z7/+GTGtRExgNGB4mXEsvAygE0pem/h6CffD48SSsT0d3s/9abbpLXCPYXp8VBnThMN0OX49gSGg1u6X1+Pn/89eMBbIsr3jgwMa8njYhE9pJuy6ZZOX855LcY7RRPXwx1LadL8ye4aqD4XXHM/LkzarJzjT4ZSGtWbAYa0P6ig5GEJsp7pky0uoBu5OJhdwkGE4XnMA1bQ53bCkMYhJCiMss3M/0aMc+fMa/aIQpECL8CiNRiOrnUZD47rRd+W/8gbJXrL+XO0O09BqHf0PCIZFppsC9wzaEXT7+z7LJ+FVI/r8lwfgzMuwQGky5khYUPUkqKpPEiD3wj6m8fDrDsnOCLfpDhAR671PP5oUEgV+kOF5XxEpJP5ioovNhqE7UbABmjHQVgMUwvKroY1Kd6Xu56AeCmMGlqKROuwVv+Sns7w8RlhGeAM6g1gZS3WmuqSWC07rder0febzuspubpa85yxHA9MK67iw5HlvxfRJiIFPEo8H1oSvqrA7p3RZwJmrtvALlIJlIj0zaPReydX1CtVGe2K09opHTEp7HBSSqhH2+A5ZDv0l65Nuqe5ZmGwxQbUyvXhpIU/JFcnN9pLdHz/EFtcJui9Pqa5bs0kYiUN/sLW1uwapKcbEP8g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14998664-e56e-415a-26d9-08db0aabd3e7
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:42:11.5133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqgER3hsMc6n7/er5oxlQFqB1ALwlhZfrgSVWEO8wMx/JwQ30630BkvKFkTJ7ilJ6j1dwidzSzdxCxUM9RJFL7nbfxcIco+8HxPCiv6QSUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6523
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090139
X-Proofpoint-GUID: Wr8IBfH9aI4ZFAfSdP7bEwrDOpXLRu0P
X-Proofpoint-ORIG-GUID: Wr8IBfH9aI4ZFAfSdP7bEwrDOpXLRu0P
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/9/2023 5:05 AM, Markus Armbruster wrote:
> Steve Sistare <steven.sistare@oracle.com> writes:
> 
>> Add some handy string list functions, for general use now, and for
>> eventual use in the cpr/live update patches.
> 
> Submit them together with uses, please.

Are you OK with me describing my intended uses in the commit message?  Or are you 
suggesting I go back to submitting these in the larger live update series?

- Steve

