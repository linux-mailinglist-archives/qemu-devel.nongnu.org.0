Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71596E0D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmw23-0007Y7-Vm; Thu, 13 Apr 2023 08:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmw1x-0007Xb-CB
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:26:25 -0400
Received: from mail-sgaapc01olkn2081e.outbound.protection.outlook.com
 ([2a01:111:f400:feab::81e]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmw1c-0006bB-FN
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixtn9urvNIDkPK/Of9Nsfli3mN6Hg+LCjuO758UgrGgfXdbyHxfDdEEikbduXCz8XJJziuPFX/5E4yOk8Vi6JhIVmQDCC7FVgFCX4qiYz4YsHhMG8C/Xwuygd36GULrTVzgLxXy1WWjXA1ldQNy6112BPsrAoGbhBtM+tS5wWtxCRqk8ZWPMSDPexRzVJ/JHyf1QM+N2hgJcafLGLZw7CBrvL/Ee3UACfU85HFnguoMH2dSsnSEfudlaPLMpNRTaGe06rGEbbpBKjniA0dxb9DZbrAQ0TtKjbpObOvrlg7SQsZm5lC6AK+onCxTYvnPL0fv/n8ghkAQE+mSQU9OWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGTUdVWWLaYQYxHRCrRmE4hePZVLoq1mZXItS6FgbUs=;
 b=NyOLhtl0R3vsqqj3aI9Acq4UFXK+jrWcSdWoeUdfio2YtrCi6JxKwLMakL4ZPG75pNZKobpBEqdGouHoDDZRtmkLLkCTV6EBLfMpCOuwjnKXNivkmNtCuW19oLDHXjPZitwMvC19hC0m0mhj65ZyADBxZN4oYsAJV1vWfIrk5/WGkFZ4CnGUpZjzHqjAcCVXgAfZhHxO1VMm1UFvs0W8vLSFU9DcRKam8vcClS3yy8JIPhmTyi4INQXpYhgsZ94Jg4uOW1cep/qgbYABuEZz+EZdfUszxGhhQ/UiDlus/iret6LYToep5UaflFsv7yuYcQ3mtBkbSL+WlTK+BKZ6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEZPR06MB5544.apcprd06.prod.outlook.com (2603:1096:101:ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:25:57 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:25:57 +0000
Message-ID: <TYZPR06MB541802D45E4DDB3A683563069D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Thu, 13 Apr 2023 21:25:55 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/1] qemu-options.hx: Update descriptions of memory options
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <TYZPR06MB5418DC69BD2E73B51C9584119D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <TYZPR06MB5418DC69BD2E73B51C9584119D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [E0NCPYvFlMaaxQXFwOADcIGbgqqnNYDiumextyqJ6DII0rrZBuJ5sEKU2JzI2rTSLjFvyw+6Gxk=]
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <eb574b3a-24b2-ea2a-949f-5ff2065e6637@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEZPR06MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: 77de060a-e07a-4358-df05-08db3c1a3bc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OdFkbZkaSw3lj7hfVA6bTDnzOhn85J/UkrPiWzpUCpZKGWlYPKOutjM88zyOPxL65qNiURM4Rp2OYJCfWU7kYtxXXOtrMsdyf/DPqXW0ZQ69RAUqRYZv9NByl5WsRsOKXH2nGooYU6PKLIBFk657gDSsDqXHeb23b8e9VolsidU0exoe9Ue4iGpnwZKxWlGVepxuZzU2bial034Jry3EqMeJ286wwfpznuOkzIRX9uEhNJgTYiT/DFTSnqDfmI9Rync2DQg8uT1uANUCVIr5YGFOmCCtjSdoSb0EyOCkPxefrWgh2QfWrCUSb2VSPIzTXutHjbBOP/BmFxj4RX+1TC8znU8QehDBiKYwZUcU1y2CRdB5M90Z8TwyAf026wuCPxmlMgNtM8DX8gjrgP9O3gackWaeDeyZ/YW2y/ueWYyLGhLVQCJYiVz/4L2zMti5qD2LAIO7r29aiQiDqFYI9vm+jqvQ5q6P2fMwHVfAuNqIYOu7e/Ptr9210D3LwsBgQH7tXq23MHUBN6wRR1Yv62e2rqddc3rFXt4/DByDyqzhUU3a3VIsp+FvLrjVHGkGHyvyMg/wZJMSW+FtW5qAMaYODw/uZaKacJgiQSfr2PO+7OG6TfDTZbW8MhOjAjnR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW9wN2d2STdrTHRkOXpNOTRUVFNsTE44M0hHSlpMcVZTa2I5K1VEaEt4VGJB?=
 =?utf-8?B?OUs0dTJGT0x2TzBZZkp5SVV3MUQvR3c4Y2RpbTZlbytPdlJITjZibndFSVdv?=
 =?utf-8?B?TnBtbkV6ajFCY215OFE0YU9QdDl3T0VtUTJaWFVucWE1YTFPbkp6VlZGS0dT?=
 =?utf-8?B?NDd6Snp2K2kySHM5clFvTUMvNzcxekJSaGQ5UkpzYTE1dTVjT1hOZXlFbEMy?=
 =?utf-8?B?aU9mbEpWSVVqRHNwRUY0ZUNQNkJJR2I5ZFVwOXJ4eFI1UWdiNDB5eGs1TEFx?=
 =?utf-8?B?aWYyVjl6NDZRT3JGaDdPajVOckZscDVoWVMzZll6Z1hVMEdpcS9vYUFNRkNP?=
 =?utf-8?B?TGcrT1gyZjZVdStpKzRUaXpYMUhoREZwUkRxQ1Q5Wlkva2YzRDZlMUYvdG1h?=
 =?utf-8?B?aEhMeGRTbVJXdzN2L1RvTHhxNWFhaUExaWNsMUlDby94VmdSRDlCZlRiZHFj?=
 =?utf-8?B?Z2pvOGZ6ZmRxVFFlcGt3MEt5ZWVBem1pWitRNmtGaXRDSUNKelhwVnpkWTIv?=
 =?utf-8?B?aTZkVFNHdE9PSUZkVEEydXRnMjg3cmFGMnFqM0pwV3ZETXhuVkxJR0o1OTRs?=
 =?utf-8?B?OFN5eHNvalZMbDg5TkJ1ZTNRU1lxTUJJeEo5SVkveWRFQTJ1QkFRZG4wNkcx?=
 =?utf-8?B?dDVVWWpWVjJ5Zjl1bk1WMldmTEpna0NSQS9zYnlXZ0FDa3Y2L3c4RnNDRzZ5?=
 =?utf-8?B?NXRmYzh5TkVLeEFLblBMck1PU2o3cEhPejJYNmdPVVZ4TUI1MmFjblNhMFIz?=
 =?utf-8?B?cmhvajdDUWQrNnFLbk9oYlFXRUIvaXVkM3ZiVUpBQi9lK3V6YU5KTkJJMW1J?=
 =?utf-8?B?VDh3MUxTdUxtNUdQZ3RCcDZiNjNMaGVRZ0tTbFNUN3B0b1lVNGdwL3AydU81?=
 =?utf-8?B?aG55eUJvR1M1V1hhUzhlbVEzc2ZJT01aNUhFTGhobVJjNUtRRk1IMUFZd1hN?=
 =?utf-8?B?YXZ6cEx3YVZaN3lzRm5oQmxVb3R4aTdOVWhVSmFQYnBFSW5tWXJ6YnBXYmZh?=
 =?utf-8?B?ZHV3WWFnSlpZNjVFbmRzMVRwam9zbzBFVzljejd3WWM4cGxOK29lTndMSE1v?=
 =?utf-8?B?MjB3c1gyRS9peG40YjVpdFVVMnFkbVE3b2JaRlFqWXlPcEEwUjVnNEJNczNL?=
 =?utf-8?B?bUxHUDdZWnZ2RVJycmNYTVVPN1pDWXNsbUtxbmxsOGNYZG9MZ0k5N2FhaWk4?=
 =?utf-8?B?bVBoQ1hFZ0tVNENXdUo0aDVQbzhEbFZhRDArZFN1UmY1ZWpnZ0ZlVHpJZVdV?=
 =?utf-8?B?a3ViRTFxSStMSGRiQ2FuSkZvb0pKUDVWbHl1cS80aWxyWmhVNVY0a2ZOTUFY?=
 =?utf-8?B?NWQwaStjTzVlcGkzWXFmVGZYamdHWUZuRFVTYjc0ajZPSE1LVEFYR1VNbW1J?=
 =?utf-8?B?ZmhXRGFmL3cwb2hFdFY4M2p0L0dnWCtKbENJV0YwZjJBeTFyNVB5VHJSTVJx?=
 =?utf-8?B?WWxoTWgxZVhXeGt5V2pCZ1h5R0hYR1pMV1BkT1NqS2VRNWQ5Ym5tUVN5Q2NP?=
 =?utf-8?B?NloyVTZ4T1AraXg3WDZqZC9YR1EvZWNabWRackxBd0hjYkl3M1VldGJvN01F?=
 =?utf-8?B?NFdHMmpPakFnMGpmNnFSSHRHYXB1OUtvc2RCQyt6MzRwSjVMZG82azA1cDJk?=
 =?utf-8?B?Y0Zub2ZObU5wS2lkNkZJZC92L0dBajQrWkNKSDRHOENoTjlENmZ1SnpCMU9I?=
 =?utf-8?B?K1d6YWJ4NkYxeDFZL3lEd1o4WmhSMVpPZlc4TFVBOHBLaHFnMjlacVh3PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 77de060a-e07a-4358-df05-08db3c1a3bc1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:25:57.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5544
Received-SPF: pass client-ip=2a01:111:f400:feab::81e;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

I forgot to add v2 prefix to the subject. This is a revised patch from:
https://patchew.org/QEMU/TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com/

On 2023/04/13 21:15, Yohei Kojima wrote:
> This patch updates an outdated description in qemu-options.hx.
> The patch reflects the changes in qemu behavior already described in
> another documentation, and it also changes paragraph structure for
> further readability.
> 
> ChangeLog:
> v2:
>     * Moved the description for the legacy `mem` option below example
> 
> Yohei Kojima (1):
>   qemu-options.hx: Update descriptions of memory options for NUMA node
> 
>  qemu-options.hx | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 

