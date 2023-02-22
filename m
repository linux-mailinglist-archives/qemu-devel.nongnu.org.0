Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FA69FBB7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuTD-0007dn-V7; Wed, 22 Feb 2023 14:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pUuTB-0007Xz-P6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:08:01 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pUuT9-0001gA-Ol
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:08:01 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MGTmMs001068; Wed, 22 Feb 2023 19:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=N1mNL9920HmidB8kpRf59Xq6LRUM5f/57l0+b/s3IuE=;
 b=MFJDGA5YDNVdjVKIeXHiSzuV1jJmqTkyzs1X4LESikjMA0fwrFYnHLnuSsDxNTXJTo4V
 LLH2mXIx+HmiS0Tq1bmKVeGhxsiso8MpWEkPP/8kZ/Z0v/ukwsNvf4j206Zo9jREiQrc
 QtPXToQOUAoPDeVEUe7zZTIX7/owhzLRRFiaTuGVF7jbV81glODYIMXAIchl/7Fj4okW
 aM9ZkCyu6CH/Kyno0gBOegpfiv6X5NHL3pUQtdOU2RXyicHtDMHbAYeb2J7Omphwrmyx
 IkRA4v/cyMDRGQhGZMv78nIxnnAlsCIll5qXMmFnmWIgjOAuibqzsf7VGUDiRUm8Bm0Q Ww== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpja8pyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 19:07:57 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MIi134012903; Wed, 22 Feb 2023 19:07:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4eagm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 19:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7k/tYG9KVD4FuhaXWJLerLRb3J1JtsbgDmh41xh5IkCI0Ax96UdDtPg4/e5DnLjEylNyONg9ATc9m34tJ1V94YSO97N7YDK2eWvEAC+AGu0MjknfzDd2stfciIOdE4WHvuiOxViHU+fTBMsUe2j/zkbCandiR+cq//YQQftYbykpBWrLo/BNpKJpSOf9HU4JdW4Qo0cDVPU1MO1tr8j17vzKYKn44vQ5ecP/tV6isPLB01ovLWtE3nOSavi9DrloyeDdKssDfHE4FoyxQbOk7HEYraVmQHw2b5SIVhfnu9kVBLIQr2bnDbeyg/idkp8Xu6S0Y67c2MyNyOWOadUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1mNL9920HmidB8kpRf59Xq6LRUM5f/57l0+b/s3IuE=;
 b=GHLAWLx5xSiRhOLS6mvk4pUa1JL8RX8JRZbImyi7sbjpoQB8WLoY51yYFG3CRSxAA6W2yjkhoOmeQL4Fd1MtTxzh9HmioEDwt/x6INjyowNFFyptsses/+aPg3NvSaD+TcNJcbUYoxEVZoSlZVvsP/pw5P8RHpMCQzcvvzQi1NjjIwfJmLUXSKxvO/+ZLSqwMrvYZgCBJK5NvlrKMAzNNzkL96pBPci24YT/WWlCH56U2O2bfBmd5cb9y2LcFyEXlWsiPz1PPLQEuj67rhMW9GVCqUY3OWnmm0vXAgzjCACUUdM5CYh9jS2YHkzFMmIek4iwG4+LTYVsNGo4GA0fjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1mNL9920HmidB8kpRf59Xq6LRUM5f/57l0+b/s3IuE=;
 b=Hc80Q4h6qnzwNs59NwEBagrWYFnu+53DbhgmwamtWZeNvKVlDv379OqwZ+GbfmX2TZzrd5sOold0v9LfR8ToxwqlPlUFpdpXEpgpBPShe9yay/aUqU1z5yCQpIlwKdGkZFmfZ7R2wn8kcorlMFMJGyXc4U7mJTM/u3dsh19Ksts=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM4PR10MB7427.namprd10.prod.outlook.com (2603:10b6:8:181::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19; Wed, 22 Feb 2023 19:07:54 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad99:51ac:ebaf:e7a1]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad99:51ac:ebaf:e7a1%4]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:07:54 +0000
Message-ID: <e0498f45-3b4f-1bd1-ad53-628fbb807abc@oracle.com>
Date: Wed, 22 Feb 2023 14:07:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 3/3] contrib/elf2dmp: add PE name check and Windows
 Server 2022 support
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org
References: <20221130000320.287976-1-viktor@daynix.com>
 <20221130000320.287976-4-viktor@daynix.com>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <20221130000320.287976-4-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_|DM4PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: f65ba628-1a80-4cb1-86d1-08db150819c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImanUVDEbnRwp7/snRWbJ6VC3psL1WS2VKimU1WMlmybuseHmujUklWxs4HZylTP7Ct2PqNVf7jlcQaxyAVbjGdy3ggvRLky0YbfajkQaWLEVs7UaUKpjjIEXOwTBhG962SFQ/LOyI5eRB9QOMhJO+RcHH6BRS/Ao8Tf0t9cMmTEJ2VhwxT6oF/YmTNW0c7e2nKAqMBa6t/pC8TNWXkoq7+/iutien+VHXZEnZxvv2Uz0+7A5Zek2sfjcO3HdJdBsljVKFVgLVeGma9OBPksgn1cRv192U+/BVpqG5uRv1SNrpCE675bQ0RsGkdg0zOPmGY1iyeX4KZHBYR7hLQrhLzou1KCgqK4ZGGZhdpajEYh4M81Nq+qBJ/UMt8zLkrhjaRSWFcKcXNHBNic6fSxpYh1iHQjf9h6e/BJ1AeTDnTpRQ8SjAPwQTR52x2oTgQsLek2BFAUX1usVjP9oWDpcqpckeAO8wQZ8gko7FJv0gLrfrrgOdRH0uWIB27wUE3AZRszUjt17iSSXt5qLXVAjJAnUUpa5TjtQV9eSYuvQBwE+nviY9RqFBNnmL+ak+pfQ+2nstmpm1vmEJlVw92kJfqVc5yYSLXHHK8GFF7KHKXmoRNkH8+0clUVM1nFSIwwkse9w0XNQpkU9MCU0f2eK6LMpe4JDI13os5MiqTBRIt7EWU0hkkcws3g6MeFNjitERHuiS40Va3ablRCON9oqRDdZc1g6guZqkeb9/UQyCqSjc2LBBVC8aFKH+l7ZdQJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199018)(36756003)(83380400001)(6506007)(6512007)(6486002)(53546011)(26005)(186003)(478600001)(41300700001)(4326008)(2616005)(66556008)(8676002)(86362001)(66946007)(66476007)(31696002)(8936002)(2906002)(5660300002)(38100700002)(6666004)(316002)(31686004)(43740500002)(45980500001)(460985005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0JkUXlpNExEaWFZQVNmcnpTRXNESDBRY09CZ1BiYy80R0ZldmRZRllETkV1?=
 =?utf-8?B?aDB2TnI2U2taU0svMklLd01ORE5KSjdyU0pQOWQ0V0RTOERNemkrbXRwRHVE?=
 =?utf-8?B?R2pBVThHaHN2a2h5WXVYOXRtL2YvUmw2RGk0TEhtdmtOQ2dsQ0dtSW5UOGdK?=
 =?utf-8?B?K29sbnRvWmUyb1hNYlh6UmdBT2ZXUzUzaU5aWUVkS3Znd0VGV1NLRU1iSkhD?=
 =?utf-8?B?NHl6bUU3K0hJd3hocVVOeTdjdUZNWUo1eElybjVFdzFRTnA5cU1DU1FBSDFB?=
 =?utf-8?B?RXBDMWhZNklBTkNLZHVtWWJJbEFuZnA2NUJ5N0FqaTJYMzRzTHQ5akdsRjRU?=
 =?utf-8?B?VjVrZENxYUNJTXByYXMvRHFLNHB4M2tqa0xSZ0d2L1VxRCttZStjNXlhcjR6?=
 =?utf-8?B?U1BHMmZ4SHlKK1pma3BLOUV1Y0swMUFYeWt1bmNZM0xOS1dtS2I4OElzblk3?=
 =?utf-8?B?QWcrNkVSMHU3c2pxVU9aaDNqc2tqKys0YmRLOXozYkNsSEQ3dTZYVFpZa2xF?=
 =?utf-8?B?MHUwdjF3WkQxUlpxVnJKbjhua0ZYemMrSjBnR05CZkpjKzJMT1N4dDJYNUJD?=
 =?utf-8?B?MUNBOU80TTY3OFJZbFkxVlg5OFU2OThQd0JCcC9aelBVQit1ajZDRWN6KzF1?=
 =?utf-8?B?RDBUTFlQanJkeml5RTVFTXNKQzVGUUx4VjUxQnRHVElhL3V6V3RRaWRwbHpZ?=
 =?utf-8?B?dE9EV0hYcmxiTWMwUnJ6NGJVZW5yK0NidktWbENHcFgrNGpKMDVXdnBhNTZu?=
 =?utf-8?B?MGFoa3dtSVVCd1pnbERrUWdCanQxTEZRNjcxRmg0YVpwc1ZmZlU4dnBpSHBT?=
 =?utf-8?B?Ujk5NWpVNzNLL1I2clNJdzZ4NmFPTjRTWEVaME02eG94Ny82R0ZKZ2w0VWF4?=
 =?utf-8?B?cVJyZ2wzc2J4YllRS0c0bXNHcWNpa3UxYVRQYVhTdTZ2bldCemhmT0dhcU9x?=
 =?utf-8?B?cktHbnB0UjdOSis5ZXBFb1ZQQlBYajhJT1U2SC8xSHNrQW5zcGhMSXViaWFG?=
 =?utf-8?B?YVRVaDdsSmVUTFhOSENiTGRGdEUySWxXaXRJMUxKZDFCOWJvTU5MeTNYSjFm?=
 =?utf-8?B?bUxVL2NTUEQ2YTJpcTVXSjZXdFNvaFFlZFJvdWNwdlI4cE1wWXg2d2l6d3Mv?=
 =?utf-8?B?M2J6aDlzZUEzenRqTDFXckd1SlVPU3F6L0ZhM2FZUGFMR3l6a1BtZmViL0tE?=
 =?utf-8?B?TzhJZEY5QnNHU01ubzFUY3RQZjNYdVdjeEZhMWhCbVBDL001UHprOEh4dlNR?=
 =?utf-8?B?ekE2REM4K3BNOTg3dWY2U0dYZ0xGbC8wZDhFbk8yMUxCNXdUcmdnM0luRk8w?=
 =?utf-8?B?eXhCTFFqSytJZk1pbzZtdVBjUU5CVFZVbWl2MjhhbUljK052d2poemRJa1N2?=
 =?utf-8?B?d0FwaG1XbEE4RFdCWC9mZ3EvN0FEb0VTdmgvNU9zbjc5UGhpMzVOSjhGdzVZ?=
 =?utf-8?B?L2FzZmFKczVOT2dheTg4K1VZQzcyWmtwK1RBaUNLT0ZIMlhoVjVNOGxWQjM4?=
 =?utf-8?B?Z1VMWEs5NUx6YkxJOThlR3NpYy9ZZU1xT2Y2ai9pOUdISTRWOU1uU0Mrb0xW?=
 =?utf-8?B?UVVTUzQzelovUm9wQjl2d1pSczAvbjJHUzFaVzhQdHVIb3VGL0xVVmlZbzEw?=
 =?utf-8?B?MEw3czJiT1hqWUpDSGJCR2dTRU4zQkRyT2tzR0ZSR1ZWVU90MFlpd04vbUlE?=
 =?utf-8?B?dndxb1Zma2ZZRGlhOXR3Tm5UQk9uOEFTUXpDWjNNOGQrcVJXL2h4R0NjK25y?=
 =?utf-8?B?b3RsVURLd29TYXc1YmF2UmluQThCWFNNeXJVWmV3UWt5d2ZQWjQrSDgvMzVp?=
 =?utf-8?B?N0NLYU92dFVuQzRNZTF4NkpuQ3U5TnBzQWVUU1VsWmZrSDB0RE9hanorekpr?=
 =?utf-8?B?czRkeHB0YXhDZ3o2YTVuWXVEQTlPMW1GSk9XVURoTnN3RkdZYkROeEphYzZJ?=
 =?utf-8?B?dTdma0orZUZRWFl3bTYwaVUyTEFsSEY5cTNNbTdEOURiaHNESXJ2MnFvRlBP?=
 =?utf-8?B?bGpZS2Ztc0FpczVNSjI1aldXUVRnR2FleXNCZDFFUGR5OFcyeHNXV3dzN1gz?=
 =?utf-8?B?MHo3Y3NPbW1tOFNIV1lQYlhIVGo5Tk9qQUZoZi9UYytMRlBYNFlQOWdWY29y?=
 =?utf-8?Q?Nn+83qPT02YKYBVh0a1+WZxYI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IyfpzVHFN9zmi6s5fKxof5PrRING2vZwJlAfqHmJ02VGv3IW4TGI4y7w/kgYLXXJkXESvSxvUKQ/GSS2IB9L8ZRG4c/OLx50qNweFklKfBi0MpNt0qbpsXS4iB908W6yTAN7CpxnwPxtFBVWHc1Ru67vkkQFSDpanNNuOZVEbXv+aYkM6N46Rvtop6oC+G+OQu8ujMGPmS/H/DF9c8EsdpcGM+RdtlW5uEUyY4VB6TZj/U6vdI5wjBfx8T7ttxTLKAO8hnH6BR93mEYi8cWickX0ayzSHzwfOV7m+xh7z7Nwlli8kFvlT6hNGOBzQbJHPTN4TSZqZiENMA613zVd+M363hCdy/uvEI1NyAqlVSZEED4ldwrdBeIgJsvEEBJxUVlEl2afYxAEvpIXFT6SdYkxgRD0zHQ7J4+ki/JyAhRO5pGUQD2oVwHco6BVU8YJm+QyuFfOn46PZ/yjTtpmGruL2yJgEfhQl9i1bjWwnYQuDnuErTRtSvjW1n+vgmFTFyKcXNvX25vf10ApRjNvQcr5F/GS5tLcJVg2prHAUKHgGbfUIozCi76pdBu0aTf9dz/V2xJuKGCUN03YoIAVWTAbwnluvhdtenyUaCx4+VQS0+Ta/6a/Bz9fYl97U4RFVGTIi8iej8EmmYMYTBSXzjIK+VjPy1S0QLyEFjLv5nS+WoNUo08/zRxf4kocbqnKBbpH1Uc3qh5GGGPOyqMdAwdJSfxDtX3CtqNNGcNclGKps63/pd/dl05TgfsBM5o/2ilH+CIm70JbmWc7dJLezvjHsOjVIK/lG+5D4iMnXqqcM3TRZKp3JMxINNkMTVvHsfFZvN0rSBADJ2wGcApOjA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65ba628-1a80-4cb1-86d1-08db150819c5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:07:54.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31zh/+uGM4mPw0IXo9J0FxAuRpVN7sIoL3KN3cJ1s5pfAWMCL3uvJKqHRm27J229pT5wXi+xHqB1n8sKOEIIDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220164
X-Proofpoint-ORIG-GUID: mSsvMSJ3u2eOvPvU-QDjIApIXSrksG64
X-Proofpoint-GUID: mSsvMSJ3u2eOvPvU-QDjIApIXSrksG64
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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


On 11/29/2022 7:03 PM, Viktor Prutyanov wrote:
> Since its inception elf2dmp has checked MZ signatures within an
> address space above IDT[0] interrupt vector and took first PE image
> found as Windows Kernel.
> But in Windows Server 2022 memory dump this address space range is
> full of invalid PE fragments and the tool must check that PE image
> is 'ntoskrnl.exe' actually.
> So, introduce additional validation by checking image name from
> Export Directory against 'ntoskrnl.exe'.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> Tested-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>   contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
>   contrib/elf2dmp/pe.h   | 15 +++++++++++++++
>   2 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index f3052b3c64..f7de82a03e 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -17,6 +17,7 @@
>   
>   #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
>   #define PDB_NAME    "ntkrnlmp.pdb"
> +#define PE_NAME     "ntoskrnl.exe"

As what has been clarified earlier in the meeting, this elf2dmp is only for
64bits systems, so the name "ntoskrnl.exe" suffices here. Otherwise, it 
won't work
for 32bits PAE systems.

A question about elf2dmp on ARM platform, has it been validated there?

Thanks

Annie

>   
>   #define INITIAL_MXCSR   0x1f80
>   
> @@ -400,6 +401,25 @@ static int write_dump(struct pa_space *ps,
>       return fclose(dmp_file);
>   }
>   
> +static bool pe_check_export_name(uint64_t base, void *start_addr,
> +        struct va_space *vs)
> +{
> +    IMAGE_EXPORT_DIRECTORY export_dir;
> +    const char *pe_name;
> +
> +    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_EXPORT_DIRECTORY,
> +                &export_dir, sizeof(export_dir), vs)) {
> +        return false;
> +    }
> +
> +    pe_name = va_space_resolve(vs, base + export_dir.Name);
> +    if (!pe_name) {
> +        return false;
> +    }
> +
> +    return !strcmp(pe_name, PE_NAME);
> +}
> +
>   static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
>           char *hash, struct va_space *vs)
>   {
> @@ -484,6 +504,7 @@ int main(int argc, char *argv[])
>       uint64_t KdDebuggerDataBlock;
>       KDDEBUGGER_DATA64 *kdbg;
>       uint64_t KdVersionBlock;
> +    bool kernel_found = false;
>   
>       if (argc != 3) {
>           eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
> @@ -531,11 +552,14 @@ int main(int argc, char *argv[])
>           }
>   
>           if (*(uint16_t *)nt_start_addr == 0x5a4d) { /* MZ */
> -            break;
> +            if (pe_check_export_name(KernBase, nt_start_addr, &vs)) {
> +                kernel_found = true;
> +                break;
> +            }
>           }
>       }
>   
> -    if (!nt_start_addr) {
> +    if (!kernel_found) {
>           eprintf("Failed to find NT kernel image\n");
>           err = 1;
>           goto out_ps;
> diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
> index 807d006364..71126af1ac 100644
> --- a/contrib/elf2dmp/pe.h
> +++ b/contrib/elf2dmp/pe.h
> @@ -88,6 +88,20 @@ typedef struct IMAGE_NT_HEADERS64 {
>       IMAGE_OPTIONAL_HEADER64 OptionalHeader;
>   } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
>   
> +typedef struct IMAGE_EXPORT_DIRECTORY {
> +    uint32_t    Characteristics;
> +    uint32_t    TimeDateStamp;
> +    uint16_t    MajorVersion;
> +    uint16_t    MinorVersion;
> +    uint32_t    Name;
> +    uint32_t    Base;
> +    uint32_t    NumberOfFunctions;
> +    uint32_t    NumberOfNames;
> +    uint32_t    AddressOfFunctions;
> +    uint32_t    AddressOfNames;
> +    uint32_t    AddressOfNameOrdinals;
> +} __attribute__ ((packed)) IMAGE_EXPORT_DIRECTORY;
> +
>   typedef struct IMAGE_DEBUG_DIRECTORY {
>       uint32_t Characteristics;
>       uint32_t TimeDateStamp;
> @@ -102,6 +116,7 @@ typedef struct IMAGE_DEBUG_DIRECTORY {
>   #define IMAGE_DEBUG_TYPE_CODEVIEW   2
>   #endif
>   
> +#define IMAGE_FILE_EXPORT_DIRECTORY 0
>   #define IMAGE_FILE_DEBUG_DIRECTORY  6
>   
>   typedef struct guid_t {

