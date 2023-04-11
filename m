Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9C6DD87D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:00:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBim-0007Bc-9f; Tue, 11 Apr 2023 06:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pmBik-0007BL-9N; Tue, 11 Apr 2023 06:59:30 -0400
Received: from mail-tyzapc01acsn20808.outbound.protection.outlook.com
 ([2a01:111:f403:704b::808]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pmBii-0004kI-E3; Tue, 11 Apr 2023 06:59:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWNSX+yEWZ6t0H/Q/hQ0pVt5DRUX1620IueiGskI1aIcU2/7l5BZ27vROUxMFDZd8D+madsLMjnEVq7sMveCl7UcMfrsAbWuJzHW8V3cfI+8dwP152qXT9Ut4X4DU/IRVOTfsBcwUELedv6ziYsBSuftBSSVYCde2AZokIisjWydI3XoCPS94jOdcdyYKHN+Gb2uMmyiZDFwORW6VhNEpAx4/+2nwupVMf36LJOVOsqFvcetQAVXTFeT2lSFP5+szOTVaWiW4xOWNg1E0GxCOu/FTY+dtbqQPvmEtoHFfuhqD7be9RdfkR2oIp+e/FCLENfhe88lJAcpJF9FjmHVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq3XpsSz1U8MZlAD5LP0Ygrnx6kF28xbdwjXvaZ7iTs=;
 b=bBu4WOSnG6qxLsZQQCm/NTUONePc5/q404ySQ6hTYBOX5pIahJkC070uaxncSavTyZ3ElOc47Cp7wm2rg62/As5+Fk0jZyTdOUMbwEjpur74zXNPt9EmdhukgpfQsjm+beTCEITLVqiYdkCRXryhuGdhRpz/0Q7qxe/m0tFs882CHE9TD3g11rOXTk++w3tVpk9Jqm/4ZLVxaTtnp6q2EfLc5/0SgRe75UsC+9cBSCLoo13R2zn/fmsldNZLMHjKvbAWcniK33c+OF4BQVZcpwEMDEB8Dw0jT8geK4IUooqHM7BZOPYHVSO7zKouQAmPededc7pdC3IrynpWzm60LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TY0PR06MB5186.apcprd06.prod.outlook.com (2603:1096:400:21e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 10:59:21 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 10:59:21 +0000
Message-ID: <TYZPR06MB541850B7C4930E893CD5E5299D9A9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Tue, 11 Apr 2023 19:59:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, libvir-list@redhat.com
References: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [D/ZLc2MRv62zk2IOhiLaC1pr10tlzDBPIvLQwrzUfucA3PnEumVq0B/S0EjE3uhHpOhkceSZcaE=]
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <a5a67ebc-403b-c378-5495-e7d3161298cc@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TY0PR06MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9d73ac-631a-477e-852b-08db3a7bce0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3r9xjozbU4DbsoqOKO3RofNPU8FK3pzFen8nTMjeNxVSQvkjoUC4eDkTMfJvX0hUfOSVsnCm3E5yZA9O7f2mV2PXhbO++tGJZJ63Rh9oS+6fBMXpTLwoUQT5cGqFn11w8OEo8t7CQos5+Zs9OriKQ0A8BhWKpAbIQobpjxf3EV0gogM7Y6QIpqZKvg5ZMrdev84S75pMZ4NR9PoOSbZ3Alf6GYdQm9hl5TsUcokCKDeZ7zRmNSWJfMC+aVb6JbXKOOsWIYAq1Z3x3hTr2LhC0cMLy5QWQKIp13EAGgb+DRT1oHfPPGlQYxN5zZmCWmHoqgH4liz7W9TdtVHQPWMAJNvamkHESboNpflZYC2r+1VHUHicydwS8fGf+tLBqw8Qq2TrhJnqMbnyaLJqLa/u71pgcTiqjnCzRErQ4cQipBzjyJYy0Q/dI46U/kyY2cw8aiLoKk4bajuMgKhLDwej/CYtyHN0MeJbzaXvHfil1mcp1oVzqNFTsdSZZGUUfKUKaWEszKjcThBwSqXf0HnNf9tTxb1gF/GO3yU0WnfIkY0Mirnqqku/QRlMrunsJwHd07kbi3YX5qE6TXjP3VxARiY3gowx4U4sUrhEc2qYUucGlMth5vGjfbvcUHKVdG7DKbUS8GCfO4OJRNaM1uVh53fUFEPmwIUas4qsnB7FgKQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHA2TEV2RVpWamx2WUdBNk94SmJGc0hrQ0NTSS9Lb0tqeXltZHZ6T2xtejJz?=
 =?utf-8?B?c1owRHNZSzJ3R1k2RGJvYzFqM3dmejJ1Y1N4Wmh0OHlmRjUwM0xoR2tyR0tn?=
 =?utf-8?B?MlNKVUFWRDd0UTJNR1JrQjBKY3QraUhjeFc0TXFST0FpMjd1aW1KYVpUcWQv?=
 =?utf-8?B?YlpGODhUNUtCK3huY1VJcHRhT3FhdkhsSWF4ck1oMUdwZTZmNGE3Lzhyc2F5?=
 =?utf-8?B?cmtmL0tYaC9nM0F0VU11QVhwTm5Lc1BVWGtEWFdyVlE4L1NMUElvL3Qvd29W?=
 =?utf-8?B?dkR3UjRvbThmYnRnYkl4NWtHVW5VZ3NJQzBoRzR0SUxQbUlyTHlpWHhSa2Zm?=
 =?utf-8?B?bVE4Y1d4U3NIVzVpdXFwZGlQVGpxSmo4MkwvdC9jNTlabDIzUlNzajJ0UXUx?=
 =?utf-8?B?Y2FWbU9hcUQ4VnFtUE1Wc1IrSEVWREl6aENsMGt1aVNuMEdHaGNNTmMySEw3?=
 =?utf-8?B?V3ZXb0k5VVhmaS90d2ZMSU8zZUpYYTBUSXdPV01YWFN5U2NWUjhucUdvREdv?=
 =?utf-8?B?UXZCUXNDWTUyMkZlVUo4RXh3T1owNEpVa2NneXZJU3ZmcjJSRFR2NHFiWVlz?=
 =?utf-8?B?ZDZwUzlucU12UXpndTRHeEQrbU1XWWUzdnF0d0dzd0x4YzlnS3hyRXllbVdS?=
 =?utf-8?B?RkJaU0Q2R1FNbVZUM0NpS3h0dEIvamcxNmRFVThFbUFTL2pWUFg4aHlaMmI3?=
 =?utf-8?B?OXRDSkgxZ09TWURTbkdXN1ZPcFZ2UHF1dy9VVHRYNGdrc0dHeGJ0ejlaZ3JW?=
 =?utf-8?B?Q0Z2NEdPZ1hOTkM3ZkJXMW4xRlV6bHhEZzFXeUtsTlAzdHVkL1hQN1pKM05u?=
 =?utf-8?B?VXVPalRkQitKbkZsWEQ0dnEvMTZYanNYbjQxaTRsemp6K2dkYk9XMVMrU0tN?=
 =?utf-8?B?RjZMdDIyTXN2VjVOcFNxZzJ6QVhVTDdVYks5eE9jNzVXaVJrY25sTDErL2RN?=
 =?utf-8?B?WkFoV2ZXT0JCTk1NaEE5a3pVbzJTdnBud0Vodk56blFmd1FxRjJsTnZFdW9n?=
 =?utf-8?B?b2ZOdkJwdEFYeC84S3N6cDZzd0pRbUkvSU1zc3RkbzNpenA0MlB4Vk9JNzBu?=
 =?utf-8?B?ckJWZkUxd1BOZW5sc05QdG9VQmM1Q2JuZmdvbm9JdStPNXg3SE8zaXRsSW1k?=
 =?utf-8?B?a3htQm01Q3dmcU1HNTRoSDNUR1ZMUHpzRFdoMWVnaDhTUkovcmFNNGtQU0Mx?=
 =?utf-8?B?MXZjdFlibGpnbTFrSGdMR1pETld5U1A1YjFJYkEwRURVSVRwS1E1d3oyL0pr?=
 =?utf-8?B?NjRBMHA5eGdZc1ZUUHhNcVdrWkk4VGhXSHB2RHI0NnVnZGpidTVKcDdxMzdL?=
 =?utf-8?B?T1pZRzFyV1UwSUgrUkUrRFhxYWhMTVkwdWNyUW1OWk0zdXBLS0FPYXF2MmJq?=
 =?utf-8?B?UTFKOGRPV1VVajI1VjVIMCtPcTdXdWNFUWxKbVl1bzRTQTVFaHFJdkdMU0tL?=
 =?utf-8?B?TWt4MCtjd2JvQVFBZ1R3c0U5SXhRZW5Ga1RHS0R2cUVkVkxpbEExYlI1YWI1?=
 =?utf-8?B?eTdzRjh6N0tOR2FYTEFzY2VuWVRkSDU2ZHo2dGZucTdidDBtK1RQSHRSTk1i?=
 =?utf-8?B?dnRsSjFiY0tPVU5GSTV5Z3RjV0V5bXIyVjFJMXhGTjJ2eSttakNoZ1YrR01H?=
 =?utf-8?B?Mjl0ZC8vUDhCOGZxM1NpamdvYXFZZ1NhcndSbXNBRDlZWnl2Ri83MXVvV1Nj?=
 =?utf-8?B?NkhtQmFRM0VFR2ZOREVBdktKcVg4N3E5UUJaR04zZHUrNG9jM3ZNVm5RPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9d73ac-631a-477e-852b-08db3a7bce0d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 10:59:21.7791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5186
Received-SPF: pass client-ip=2a01:111:f403:704b::808;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.17, SPF_HELO_PASS=-0.001,
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

ping


This patch updates an outdated description in qemu-options.hx .
The patch reflects the changes in qemu behavior already described in
another documentation, and it also changes paragraph structure for
further readability.

The original patch is:
https://patchew.org/QEMU/TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com/


On 2023/03/30 19:09, Yohei Kojima wrote:
> This commit adds the following description:
> 1. `memdev` option is recommended over `mem` option (see [1,2])
> 2. users must specify memory for all NUMA nodes (see [2])
> 
> This commit also separates descriptions for `mem` and `memdev` into two
> paragraphs. The old doc describes legacy `mem` option first, and it was
> a bit confusing.
> 
> Related documantations:
> [1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
> [2] https://www.qemu.org/docs/master/about/removed-features.html
> 
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> ---
>  qemu-options.hx | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..174f0d0c2d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -405,15 +405,22 @@ SRST
>          -numa node,nodeid=0 -numa node,nodeid=1 \
>          -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
>  
> -    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
> -    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
> -    a given memory backend device to a node. If '\ ``mem``\ ' and
> -    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
> -
> -
> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
> -    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
> -    use it.
> +    '\ ``memdev``\ ' option assigns RAM from a given memory backend
> +    device to a node. It is recommended to use '\ ``memdev``\ ' option
> +    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
> +    option provides better performance and more control over the
> +    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
> +    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
> +
> +    For compatibility reasons, legacy '\ ``mem``\ ' option is
> +    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
> +    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
> +    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
> +    option, and vice versa.
> +
> +    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
> +    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
> +    for '\ ``-numa node``\ ' without memory specified was removed.
>  
>      '\ ``initiator``\ ' is an additional option that points to an
>      initiator NUMA node that has best performance (the lowest latency or

