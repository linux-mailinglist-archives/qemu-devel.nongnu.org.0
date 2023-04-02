Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032D6D367D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 11:28:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pitzN-00014I-QO; Sun, 02 Apr 2023 05:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pitzJ-00013v-Sd; Sun, 02 Apr 2023 05:27:01 -0400
Received: from mail-psaapc01olkn2067.outbound.protection.outlook.com
 ([40.92.52.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1pitzH-000654-PE; Sun, 02 Apr 2023 05:27:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi4muQE+Laqk0zS0CWIYeNYk6RP02krLOGWDrb4FnuhJdv/moUHr5MxB4MCkfb4ILrOqYMlk4FDZCBYC1TqtFhJljGOhznJoREMSH16dsfw0Pg0GUTmswgVEfzTPOJbB6K4WpYlTc1hX0vJF91ZKWCi4m+CkpABDhO2SI9J44wiTNPn2sFBZ2NsM07ysvct8hg4VUY5FbzXSOpGih2Pf/T5MG1M426l04UHDPlIfcnx1xPwA4+MulbK1Z3cliBY1K8ODSJE5EPN5lzVFpG4qPrWFVAm3qdZh6KAr1CTG+C5b0Frxr4ywk/EwTiQ++cl/QNAMFYdthXq5rPfnTprKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INBECriHlpJLgJTURvXq/LUDqEAul8uSVX+XQiV7OOU=;
 b=btsz/NDwCpTZrMkKVGNHDIyjS3ZbpHjHIe/NLTvJCvkgVVEUbn3QcpqHPocVlh9CI3t/3M50zdWE+MCKrZDYsyjzupOeylDRrAR9g5mHRQjWl7T4uiRKurP9vi4FrCrNSR1l8v8juzLtahjUIk61r5HHnzE5EdyXjE+Y98asvDnFPz4L35r6tC4c7tMy3uVqsANBlX57zG6bjdXCYB3bYS16y7SouVCKexF5ss20IPY6y/UwtcMQGw71BrBDSDmib5uYdu6RXwKp6TNFYbzEFHljHUe7GNEYBI5JstA97kntYr3vuvs+Kg1KXHkTb7bM0LBja4FILyDsH5Yq6D4X1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TYZPR06MB5783.apcprd06.prod.outlook.com (2603:1096:400:269::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Sun, 2 Apr
 2023 09:21:50 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6254.029; Sun, 2 Apr 2023
 09:21:50 +0000
Message-ID: <TYZPR06MB5418AC3E4B7F013B486581049D8D9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Sun, 2 Apr 2023 18:21:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org,
 Yohei Kojima <y-koj@outlook.jp>
References: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [9SPuEBSKSmlNgQBZoxYn1yjL8efPWr5WuAgu3YnmVAgh4/ACnNLcLL0EjFsLmp/IXiJqNFGjkQM=]
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <f0b007a7-f737-2c33-ac6d-7b943139f220@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TYZPR06MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c106db-5853-4410-eb33-08db335bb0ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GiUhSYOVndpZaHJL1FHSxFsgFXElziV9FTDyhMS9BktUjXRhkXhz7Uh+droZaksMtdWC512tYf7fPXewWmLo/6lFLfEwVBq77HrF+B8AZV3H4PkXqEtyyCzMBRMxt4GlRuxDCy+5lE3xaf+8J8UBTFRrYJ1wtMNhugfXPfBwoEd7Gh/HA9HRxDFlCXPB2TDX3xkI3t7/b3w0wvJmMdi8RqxJXtJd81illwPiqUB4uYikNHZtxzUrW1BgbTKA29f1iYtTssWhzzX3IOYrIOwB+eGjoWrBWDtkXNwMPRdWdDgRS0O4XNVJ9yTakXHy1JFMcUVe8umxdI+3O8AsRra5XYm+ZFxPkD+dAuGnsOUxb6tMkKAicoeRowpCesBycmCWMKYuoaVg5xtX+u48faY1LUZp++peuUhpA9545ff8T0q6yEf2n6xt06r7Rg3aF06aGuF520jhyCyyqvcLfH2lsoeo7kZy7qncm5e8p/KVbFJXNKDk3E2lAhoaoPZcjg9BpdtqxA9zumoOfaOSAejrnlLZJWPaWm282sweIy4CxT10690PgO8lnurpKJfahIvDwx17iXwnSv+AGCpygAC9v/dVjWsutfz7lNXMFAsaHmNNW0tOfzcO577mM9Xv8aiCfvZ1N3H6sdGY6DRZZLEmqUyw1St2THBQq03tBPQxwd0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRPd0ZZYURuV2tUci9xdG5pUHJJcFNMUGNTekczSFNMOGZJWGlqTVA2NTJ2?=
 =?utf-8?B?NVNDUVh4czhROWhmaWlsY2xiVWduQkpWei9XNitaNVRSR0dHcms1K1V2YUh0?=
 =?utf-8?B?d01sYVdVZFdUYk9mN0VQbTJIeWFiY0N1VFNBaWdrUjZTMmcrR2pxTWg2cTFB?=
 =?utf-8?B?NHNWSXZFTGpMcUVTejNJZWUwaHZ3NE5JRzdHcmRma3pHVHMrSHJ0MThkMkZ6?=
 =?utf-8?B?S0kwbDJ4SnEvVzA0SHVma1pKZlNFSjlDOFoyNzZ2cHZndmxIN1NsbXVRMDlp?=
 =?utf-8?B?ZzY1c3diWjk3ZzhBVG9sbVRMVUdjWFZDMERldktvWm04bmF2UlJpRGtUOUw2?=
 =?utf-8?B?M3pDTm1ydURwZTlxL0pwT3pmNjc1WThjRjl4QUZVU0daUW9aRHlYY0NPaXFq?=
 =?utf-8?B?bitwWnNXUlVhaCtyVG5mZXJYekQycElMc1pBVzg5K2tDV3hKQ1lDVlk0YVdl?=
 =?utf-8?B?aGJ4eUVaNmg5L0dNY3hYN1VIazFuVkhxWC9Hdk1QVktQeURxVXJQT21OZHo5?=
 =?utf-8?B?WFhCeTVsK2Q0YzdhbituNEtwNk1XUVRLVG9zRnFyekV4dTlJejhEcmVSNllJ?=
 =?utf-8?B?eXBzamY4SUl3RWVsckNaUVNjNnF4cWhBN3hMTElCc20vZUo2VUFyOUVwc1cr?=
 =?utf-8?B?dWVIRnljTEhCK1NWK2c2ZVFuM0dXNURRWW9lVmZsNFA3WmRrWlRtQ2lyVXBS?=
 =?utf-8?B?ZCtnaGNsMDA0c1RCTFlqK0tYRUtjK3pQbGU0alVEQTlXZFJjQ1g2V2cyQ3J6?=
 =?utf-8?B?MmFxUTRTd3JvWHgrcEVuSDFVNHpjUyt0YmJ6eHd6VjI4eWc1ZUp1NU9Obmhn?=
 =?utf-8?B?RlFjUGFweEFaUGZXTkhad0c4UzlvVFhNeU1FRFpoRE9YREJmU1dLZUZTdEly?=
 =?utf-8?B?M1dweSt2cDhnUjJodkRPQXBpeXBCU0J1QVYvQWZwa3pCVHVVWENVZlhlUEdp?=
 =?utf-8?B?ei9qQ2ZlU3N4ZGlvdm1MS3E5K2xXQlRlZjhkR0lKeVlZdTAxM1J0WnlaQ2U3?=
 =?utf-8?B?bDhDbXFWeE4zeWVTUU5wQUZ1aFIxbDkzcjFDell4YjE3V2RRelhjajlPTnNK?=
 =?utf-8?B?TzFmSmJ5SDRvS1FzYnIwZUNwbDMraTRkM1FWVnBybWxNeWt2SjhXOEpxVTNr?=
 =?utf-8?B?MjZJa2g2ZU0yQVBkTSsxY3BrVC9abHEzamRwVlBOaGNCWHVpS2J5S0FBbUpu?=
 =?utf-8?B?WGNNSUlQSyt3V2dkU3pEZVRmaDhVd2FCM21oc1ppQ0w4RHIrWDhxQ1lsUXI3?=
 =?utf-8?B?QUpOL2VZeVg4WnQ1a2pOZ1FyczBsNVBFL09IUElsa05Cak1DVkR1SytoQ1dm?=
 =?utf-8?B?SFBkL3lKVFdHdVlLVWRGSE1jWTF6ak92ZmFVWjRYMy9XUGNBbFBaYXExWkxT?=
 =?utf-8?B?WXlEUEcwV1RpS241cE90Yk1xTytweTE4bUNSSmNycWVCbzNiOTN5R1hMcTdI?=
 =?utf-8?B?bVRJdUZqUjJhTFpUcEVqekJSc1VFSDdsWkJ5S25GcEtPUmJiWGFsbmt3N3Zm?=
 =?utf-8?B?THRjOU9IK29ueW5PelVIcjFhMWwyek5ub0ZxMlRkOFE3NExIUWFhNFlrTWVx?=
 =?utf-8?B?b2NBSnhXRkx6REwrRUNSTlRQRjBpSnU3dXFyY2sremlnNDZVYUdYRWV5MnJn?=
 =?utf-8?B?TTdSNEhXZnFkdnMwZGxGTEZaNGZFZ2lnMFlDbXlYT1ZsY1d1eGNXcnBoeXpS?=
 =?utf-8?B?TW93RE1JSnU2ajc2czhoSDVibXZmZE1sdkxjd1JwU2hyTnM0dkZsQXlnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c106db-5853-4410-eb33-08db335bb0ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 09:21:50.6439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5783
Received-SPF: pass client-ip=40.92.52.67; envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I add more detailed explanation for the documentation update here.

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

RAM is no longer split equally in this situation. For example, the
command below fails and emits an error. It also reproduces on other
machine types (e.g. pc-q35-5.0).

$ qemu-system-x86_64 -m 2G -machine pc-q35-7.2 \
    -numa node,nodeid=0 -numa node,nodeid=1

qemu-system-x86_64: total memory for NUMA nodes (0x0) should equal RAM size (0x80000000)

> -
> -
> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
> -    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
> -    use it.

And if one node uses ``mem`` (on supported machine type), all of the
rest have to use ``mem``, because omitting the memory option is no
longer supported.

> +    '\ ``memdev``\ ' option assigns RAM from a given memory backend
> +    device to a node. It is recommended to use '\ ``memdev``\ ' option
> +    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
> +    option provides better performance and more control over the
> +    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
> +    '\ ``-memory-backend-ram``\ ' allows memory preallocation).

``memdev`` is described first, because ``mem`` is not supported on
machine type 5.1 and later. Readers will see the supported option first.

> +
> +    For compatibility reasons, legacy '\ ``mem``\ ' option is
> +    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
> +    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
> +    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
> +    option, and vice versa.

Description for ``mem`` is moved here. It also describes that ``mem``
and ``memdev`` is mutually exclusive.

> +
> +    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
> +    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
> +    for '\ ``-numa node``\ ' without memory specified was removed.

Users must specify the memory size for each node like
either (A) or (B), instead of (C). Note that (A) emits warnings (A1).
Also note that, as described above, the machine type for (A) should be
5.0 or older (pc-q35-5.0 here).

(A) qemu-system-x86_64 -m 2G -machine pc-q35-5.0 \
    -numa node,nodeid=0,mem=1G -numa node,nodeid=1,mem=1G

(A1)
qemu-system-x86_64: -numa node,nodeid=0,mem=1G: warning: Parameter -numa node,mem is deprecated, use -numa node,memdev instead
qemu-system-x86_64: -numa node,nodeid=1,mem=1G: warning: Parameter -numa node,mem is deprecated, use -numa node,memdev instead

(B) qemu-system-x86_64 -m 2G -machine pc-q35-7.2 \
    -object memory-backend-ram,size=1G,id=m0 \
    -object memory-backend-ram,size=1G,id=m1 \
    -numa node,nodeid=0,memdev=m0 -numa node,nodeid=1,memdev=m1

(C) qemu-system-x86_64 -m 2G -machine pc-q35-7.2 \
    -numa node,nodeid=0 -numa node,nodeid=1

>  
>      '\ ``initiator``\ ' is an additional option that points to an
>      initiator NUMA node that has best performance (the lowest latency or

