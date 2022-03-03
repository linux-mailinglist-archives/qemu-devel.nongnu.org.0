Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8C4CC2FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:39:53 +0100 (CET)
Received: from localhost ([::1]:52334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoUZ-0003S3-Vi
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPoT9-00020a-Cn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:38:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPoT4-0006ZY-M7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:38:21 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223Exc5n028857; 
 Thu, 3 Mar 2022 16:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=G2v9I2TgGUUjWwrtAe/1jRXP8nQAQeAjCaYFXXq1c/w=;
 b=lkBG0+qupOjMqkJ4rIzO29CwNxlTBVQuMqSe+6OxJTfq6V7bECc2CKdpP1c8z5vqJxsv
 TMLNjrqKeSvLvXAnz5G3xsbIZza9Qxit6beJ8uTZRqT309sAiPAsCATK5WPAgTgpFIU5
 EdOXuCNW659V/wYnQSvFJL4e34TuNo1BNa5ret72YX2AEy4lAQviZQUeZGyrPufcfuIz
 7vKWjQlrcBbysEybYdFmoidy9Tqdzk6uF9Ig1mBomZ7+kPndqOVzrbQgiJxfiT+30xu3
 A4oJ0n96Pgfe4NDEzOCnn9nhBB7A6pDZtlLb43XarJlhSOGBIXzgpJ5SIq+ZpN5WjWvm 9Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh14c1e3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 16:38:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223GavQC143329;
 Thu, 3 Mar 2022 16:38:07 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by aserp3020.oracle.com with ESMTP id 3efc190mma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 16:38:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRE5Hb5sTQsqACQYXvk3VPlGl5fh3p5UE0n9RyLhTQHLCt6RzcWCc1Jirf0W+xsrDp1zXl+VoXUuNmhpAGuljOQ1jwL16prsexHpZv3wcJrdZ1trWzGJjmJh7FyznWW88WVSuaBCrzsQSpJ72KoBpMNfMyQ254HPvVnH4WtGadUciZAgb8zrSfayXFk3p+Zpg2zOqo0cWbY1VShALZnFBENpvEe6M4PcAOJRMWffam5HedGSOBbahFXNk/hx/OSoVjZOUjxf1STRDiIKuA0ODbF6HPw6mSptAcQ39fdVcsN25MOVImVQ+IXonjnxOLh4O3jCKM5YBcFhE+m+o5t9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2v9I2TgGUUjWwrtAe/1jRXP8nQAQeAjCaYFXXq1c/w=;
 b=ZRx81qsFRokWkDyMM11ouPLZXVHXOFp2aMK4kO57rt7OcZaAYTJjtnocCUFXh7a0JF3MS+IMj62Q/fG1cckWpGS22PTSUeIIQRDe80/97YatBNpNSAtxBza/fnneVfUlugvBTLnXvJ3dUBoyjLFxKaWTPia0KfSfA+h/KVAeJIk6bYH64fVaCsyT2sAqLHIXDj9sYVJnj49Cq1p6iX4R7+4hvVKCGx3dsSTjp+L5gt7xVESx33jfzre4ThRvgVLQpJGQfKJUuy9+QuohevXhM8lppihM4PMVW+TLhw2NHpC1agWJFYj50dQfmfej1iDfkrLEr7APv1D7FgBuCj/7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2v9I2TgGUUjWwrtAe/1jRXP8nQAQeAjCaYFXXq1c/w=;
 b=T9oeUZKsD4+3XGmvSYuHOnjiajxvuigszuV2dKacMvMjMamgGmXErR/zsXvT2aCgH8cDolmfyCW880Whg4vyYiWKaTLu8kyV0XARD4lPQBcvqGgK3HUf9QUGnWZzTYcWkwwkoIKMBfe1g2YeAdaHvsTs+tkArtIslTJUwvRKFck=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:38:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 16:38:05 +0000
Message-ID: <104e0a47-7a2f-5fe3-96fc-a49cad289ee3@oracle.com>
Date: Thu, 3 Mar 2022 11:38:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 02/29] migration: fix populate_vfio_info
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
 <CAFEAcA9OvfUdKrVtisL3hd-WqimimNPfgKpQDm-sFNOSnPOZZw@mail.gmail.com>
 <4d55c906-48cd-e399-f5dd-5baa3d9debc0@oracle.com>
 <CAFEAcA8409H5PuJS=xq=NZQrAyWaov3OvygfbZmu_X80+GqWnA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFEAcA8409H5PuJS=xq=NZQrAyWaov3OvygfbZmu_X80+GqWnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:805:de::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d266d949-85fb-4bd3-62aa-08d9fd3430fd
X-MS-TrafficTypeDiagnostic: SA2PR10MB4811:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB48114F353E636504346BA8E9F9049@SA2PR10MB4811.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHqNN0lSm78yFHgT91ndnc7ODs8JQCjeOQFgyNQQXqhP7a/3/f7/4mGAgmj1SA3Sx79g7C0p68E9Kbv9FZTVbr5Y5UCaJC1tEpx3zt+QOKALJEy8NxrvbHxxaqpwTbdJsf/WRFsskkmiXL82QsQD7Z6Xg1bQBtv/kz4lHdNSzFvIE33OnE9Nq8Aoh2I5r0Tyh7i2jEdAWzGCWpxo8mIKFCodSNVmvF9EPUGCV4rcDTt5TOhzO7KyLMsl4n8VyWUwUzRWVbjZvye7baIpuzDWRnPuJ8TAIhH1O3pPLQfGzqboQtwzF/36j/CTXoY93JleioNWMkrbVnLRXKepyVA3LsOMBfokfxovXqiXuuVNWjc0deVR81YraqVpc54er/xbckIrNPJVqHVZdy4n2u4VX6FwWShrzETOfLtM3ZX7LiqZ01chPZNZmtRh5DblTzijKPx3V+7QGwoOrvHeWye69dL6ICP9OuS6FopnzzYYjxgYIQClfFM4cizsDvelNZu8pzmlYisYCs7XQZmoJXui4oTwCSFjwH6/gDeIB/7ZYNcs0RRfuRWBtXVAI6iicdDZlXlOOyeXeL3bCqJjTv6oQic1+/quzr9naxIx8BNYt6g7k4FNljH0ubUEVVokyAhy9Ab/rPjI9ECV1UD9WhFJ66QVROC5evLXHjlv+0xFyy8SfFnHBXKKFbhYnJYXyhqZJ0Jn3NfNFXGXueJ4XPBAqasCvGfd4SjfA1p10Usof3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(4744005)(8676002)(26005)(2906002)(5660300002)(31686004)(6486002)(7416002)(66556008)(8936002)(44832011)(2616005)(186003)(83380400001)(86362001)(6506007)(36756003)(54906003)(6916009)(508600001)(6512007)(53546011)(38100700002)(6666004)(4326008)(316002)(31696002)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHBwdktYTVprd1R1Y3BYVzNvRE9xNXJoY3JwNGN6Uy9YZTFnK2VYa1BGSE5J?=
 =?utf-8?B?bGNidUtIVExBS0c2MW5NOHBiVXlFTkxWNmpLYjI0enV5QytmcU81LzZlWHNZ?=
 =?utf-8?B?VUxQdEtodnRsYU1oZjZkbG52bytVOU14empnUk9RNDM2YmVYZ290cHVKanVZ?=
 =?utf-8?B?WkF4OS9ZUTZBTHVwU2t1WDRtY2NxQmlJZ0grRkplWTZLeXI4ZnY4elZTYVc5?=
 =?utf-8?B?a1g5ODNtYWU2T0YvSmg3Y09neHNHWFY1T0IwRDJJZVZzSUgzOHQ3Rjk4cUpx?=
 =?utf-8?B?UGhWcGp2b3cvbFVXRlMwYW05ckhzQVBMOWdpV09rOUxkTTNtVmM0MjJJd1NO?=
 =?utf-8?B?bVY1WXdXai9HdEZIdWhKelZYbXg1MisvUjA4K2t3b0NrRVVzWXhQY3NadlRt?=
 =?utf-8?B?WlowSmJ1cEdmdi80QzhtSDhvTHhKbU5VN0VZOUxPSEg4VFMrMWptbSttVGVp?=
 =?utf-8?B?Q0VKVWlYTWNlYzVqVU43S2xFcDJjRVRlVmRLTTVOd0R5M0pMQXhiTzdQeVZQ?=
 =?utf-8?B?OUgvT2VySmtSVHlKTEFnWUlpWGNtd2YwSEZNQ0UzZEdPZU1yQ1lUUWlXeUhX?=
 =?utf-8?B?bWZnZFNvd0VWazdabklnZVNSVlA3SUlzL1c2N2hYdjFLVFkrMGw1Y1B5WXp3?=
 =?utf-8?B?MHVPaUQ5MFozN2FzRXpobHE0a1lUa2dmOEdwbVMvWG1kK0VHc0txSmY2YUtJ?=
 =?utf-8?B?TGpDbUljT0lCVFFyOUw5S3VGaXY5ak41QXRFM2xhc0lhQStwdmhpcEV2cHRs?=
 =?utf-8?B?enFnZVZyYTVaUHExdE05cnI2S0dwM2dQNlRGL09HWFcwVkhnMXdxTjk4S2lN?=
 =?utf-8?B?c202SHRzbEVhWFgwN3hQK3lDUk9uMjcvclBvZnVpZDZXaUtta09NOWEvM3Nl?=
 =?utf-8?B?OFQwUmpYeDNvUTRKNUR5OHpURUdYVGFIMkk1STF3aGNQaFdLd25CTzBOdHBN?=
 =?utf-8?B?NEFwczlkNFBBbXRnM21xOVBBUnBqM2JhMGlSdDdGbXlzOTlmQ3hoTTZWK3Zv?=
 =?utf-8?B?bllpK1dnWVQzZDJlNWdyN3UzcUNLUmZ1eWs0N3ZPZTUyMmFFcjA5QU1EbVRE?=
 =?utf-8?B?Smo2bTRRWDR5THgxSExZdng4Q1haa0g1Um9HU3hMRTMwM2tsVXNqZ24rb0VC?=
 =?utf-8?B?NXFnTThOL25JNkptQitGbkpUcDlxYml0WGxNUEVFck1naGtjME12MTF5N3dS?=
 =?utf-8?B?TE40cUkzNW93UjZxUG1qcDFtR0RBQ21EcnBMbzZEbUFhekJGNXk1U1U3T0VT?=
 =?utf-8?B?NHZaOEF5TUxDMm1RN3ZQUkhUUlRKSElVYVVhTGRPajNVMURxKzdKbG4vMHNT?=
 =?utf-8?B?MUl1UTZuK09QZFU1eVdjN3crZ2JLN1ovek5STWdEWHRGTVF1NjNMeXhkekdO?=
 =?utf-8?B?MytjS1hYWHRxZS9hUHp0SGwzS0FndzVCQ3dva1hrK2VVRzlRTks1SEwwWGpB?=
 =?utf-8?B?anIxQlc0dmdKMmJWSklCK1BDOHFiODFYYzFRaTZPd044UHJickZjaVpSUWdk?=
 =?utf-8?B?eXB0NkFJVTVxS2JsUjVqeW1Wdis5aGhBWkRGNlFIVkJmekpYWTBiYUMzQzRx?=
 =?utf-8?B?ZS85VjNtSkxIT2tyeld0TER3V01ySGYvOWtDMDdSWG9zdk1QS3pPZEdKTmcv?=
 =?utf-8?B?YXFnM0xTTjlYWUxLYTg1N0ZJM3VITyt6Y0hKcEFEZGxVWjBqcU95ZTd0OXpF?=
 =?utf-8?B?NC9EUUlsL0ZNaWErOHJybnBzYURtYm5sTWFKeExXd1VnRnIwelQ5Wm5OOHNa?=
 =?utf-8?B?MUc0V0x3M3htOE9XRm9tbGZFbHFEaW1MN1lhcytZeEFsODVWNGJxWW5iemNo?=
 =?utf-8?B?SFZCSW1xT1N5TFZ3MnA3MlBpUFhReVdtNVE3K01oSjkyQnBSZ1NtcFkzYVU0?=
 =?utf-8?B?Z3R5bFROTDBYQTB3SUJMcnNFamZvVTJYL3NlUEZNczd6bThuVXpKY1NBdE9K?=
 =?utf-8?B?QzJ6MzFaUEtjNjNDdjRBRDYyOHl6bHBOVEdlS3FKV2s2RGZ2Nit4VUQvYWE4?=
 =?utf-8?B?QnBrbFlCU2w0a0ZlU2ljZmdGdUxKclpCdEhDN25tc2VWYnU1QmMwYTNiTHRy?=
 =?utf-8?B?ZDJHL0ZzK09rK2sxUEVtRFBYWFJqejFDRFdIa2dOQ2tNU3plRTNIOWdkeE5v?=
 =?utf-8?B?SjA2VWlpK2RDWU9ES1BDbk1lRE9pbEVEVGg2TElmZHJkNG9pV1d6N3dhMWQx?=
 =?utf-8?B?RmpsU2dmRitLLytDYlRnTWNjbGlXdGxlVFFNK1lWTlpCcVovSEhLSExvZTQ0?=
 =?utf-8?B?R3AwSUl0cjNUaC8xTGJsdWF5Yk5BPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d266d949-85fb-4bd3-62aa-08d9fd3430fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:38:05.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aMhqd6faN//N0UNkARTEoiZPIeEy3x3k96USGDObHPcq1PP7wJB0TfShFpKtShy+Fxlqbb/yR8Lh72v+V5I2rBKdhCK11C+QI8hbNnVL0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030080
X-Proofpoint-GUID: 72R2LFBgDR1m1b93CcDXYxF0qN6bj0yq
X-Proofpoint-ORIG-GUID: 72R2LFBgDR1m1b93CcDXYxF0qN6bj0yq
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/2022 11:21 AM, Peter Maydell wrote:
> On Thu, 3 Mar 2022 at 15:55, Steven Sistare <steven.sistare@oracle.com> wrote:
>>
>> On 2/24/2022 1:42 PM, Peter Maydell wrote:
>>> ...it also seems to be making a no-change-of-behaviour rewrite
>>> of the rest of the file. Is there a reason I'm missing for doing
>>> that ?
> 
>> I'll change the commit message to explain:
>>
>>     Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
>>     CONFIG_VFIO, and refactor so only one ifdef is needed when new functions
>>     are added in a later patch.
>>
>> The later patch is "vfio-pci: cpr part 1 (fd and dma)"
> 
> I'd prefer it if you split this patch into two patches; these two changes
> aren't related.
> 
> thanks
> -- PMM


Will do - Steve

