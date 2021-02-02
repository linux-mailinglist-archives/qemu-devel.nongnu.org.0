Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A498E30B5EA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:40:53 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mYe-0002oC-M3
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mWO-00019L-JF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:38:33 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mWJ-0005M9-NA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:38:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14D585803E4;
 Mon,  1 Feb 2021 22:38:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=q
 bLFmGMEAelVxcGl1kKe1IDBsWURbBZ7/OtCHRKnZ9w=; b=W1wdgujWE4tcaVWfs
 GjFl1ExDuMeBxaLo8cBnlz2AJg0HbXjspiKGNHzV6cPhTXK2JAkwmp48kAPvFAu8
 08PsQKX6hxh6zHdACrxmzBQ9uYKR9314arAEMVT3YUJdrLx+S7SWBWthIs7xN98j
 LuYuIVh9B7JdKcurBJpTaFPMeqsAgeFUSZi/g1Fh2TNvBGvOb3KHKnUj6t/lXFrO
 BZwCdLXd3ggfClVzXAM2uYnQhx6oSbhhdU+v+cZQqDGXZ/gr1dALXF47lkbmEShX
 GOqxtUIJnUh4G4c3rJ6goaWjru6FMbIK67ZacLYdJstZ2oLgfwrD3V5+tzhPfBt+
 MhtpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=qbLFmGMEAelVxcGl1kKe1IDBsWURbBZ7/OtCHRKnZ
 9w=; b=Gte5pH/l1EiKrfuBsc6ebZ5CTDDSKsdzfZQcfMSxXs7dsY9gXpK5bCdGq
 8FPoGKEw5cjyNj1YO8jeC46vKRizIQ53u/d95MOiyA0Tiqx0XfT5RQW5NswzDrPs
 U11fnWilWeHBkLLiRC4mQ5dX+YPeI1l1FI6ZFYTS5vsFnXeeCxjL/QL/Gb/K+g3b
 oyjtOFm2Gg87NU7PTH8FblDIhbyMKM5zXZFnrcnPIKUeA6LrsZQsB69cSaybr/Pi
 gOw5Gy7AA+QjrXL1nAwNxreIXyPaf5NdkwbG45/cx4nr/dFG54hVpgfG6sQJ+otY
 hFACi1QLdrrkva+KUETkaSwQB6bRQ==
X-ME-Sender: <xms:MskYYPe5DM4GXpwJXxm_xDHaE-K6OJuG_eb1izzyB8Z9kiU2U5OI-Q>
 <xme:MskYYFM0KRS3Gw5mtjkKMNPsv-WjI98khVRRiEvIAVpf2PLDFd2aetlm6FnwzsF3w
 JFqVb2e3ip6ffzBvOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:MskYYIgxcsj0vyfm2IAxtwiOWpg1j8nA3YHfln2OeSmiqXg52GyBKw>
 <xmx:MskYYA-zYs9MMuQ9zKCqJr59t5D4lBblRIurGjQsxxOH5iqiL_Ae1g>
 <xmx:MskYYLt7_UnHYwoMdu-w-OH01Hx3hngQMTfrb4jxf92pmyT6DgOUGA>
 <xmx:MskYYFJq3JMG5Jc4b8L2q1Sgi0zIB9wXPDGK2lLA2ZHuyQ_RUz9qLg>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB13E24005D;
 Mon,  1 Feb 2021 22:38:23 -0500 (EST)
Subject: Re: [PATCH 07/13] target/mips: Let page_table_walk_refill() take
 MMUAccessType argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-8-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <eb573b44-2613-bd4d-a52e-05ff5c700f4c@flygoat.com>
Date: Tue, 2 Feb 2021 11:38:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/28 下午10:41, Philippe Mathieu-Daudé 写道:
> The single caller, mips_cpu_tlb_fill(), passes MMUAccessType
> to page_table_walk_refill(). Let the prototype use it as
> argument, as it is stricter than an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 9216c7a91b3..afcc269750d 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -621,8 +621,8 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
>       }
>   }
>   
> -static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
> -        int mmu_idx)
> +static bool page_table_walk_refill(CPUMIPSState *env, vaddr address,
> +                                   MMUAccessType access_type, int mmu_idx)
>   {
>       int gdw = (env->CP0_PWSize >> CP0PS_GDW) & 0x3F;
>       int udw = (env->CP0_PWSize >> CP0PS_UDW) & 0x3F;


