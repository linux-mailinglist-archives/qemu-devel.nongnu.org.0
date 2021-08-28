Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9F3FA47B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 10:17:32 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJtWt-0005p2-3H
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 04:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtVW-0004qd-So
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:16:06 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtVT-00076q-Br
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:16:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 8C4C913B1A2;
 Sat, 28 Aug 2021 08:15:52 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 10:15:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d48e4611-9e17-4dae-b075-f65fb2caac4e,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
To: <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a7740ed2-67ef-d0f8-09e6-c417c3904ade@kaod.org>
Date: Sat, 28 Aug 2021 10:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827210417.4022054-5-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 24352444-0b68-427d-bdae-64eefd4de45c
X-Ovh-Tracer-Id: 17345613968006613984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefggeehhfdtkefhteeghfeghefgudfhteevteeltefgffevhfeggeffhfevleelfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This register address is not actually used anywhere, and the datasheet
> specifies that it's zero-initialized by default anyways, but the address
> is incorrect. This just corrects the address.
> 
> Fixes: e09cf36321f6 ("hw: aspeed_scu: Add AST2600 support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

This is covered by a patch already sent by Joel. 

See https://github.com/legoater/qemu/commits/aspeed-6.2

Thanks,

C.

> ---
>  hw/misc/aspeed_scu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 40a38ebd85..c373e678f0 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -108,7 +108,7 @@
>  #define AST2600_EPLL_EXT          TO_REG(0x244)
>  #define AST2600_CLK_SEL           TO_REG(0x300)
>  #define AST2600_CLK_SEL2          TO_REG(0x304)
> -#define AST2600_CLK_SEL3          TO_REG(0x310)
> +#define AST2600_CLK_SEL3          TO_REG(0x308)
>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> 


