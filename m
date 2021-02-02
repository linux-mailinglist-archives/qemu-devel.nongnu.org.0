Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9D230B5E6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:39:04 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mWt-0000r2-3s
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mV6-0000Ef-77
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:37:12 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:43229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mV4-0004pd-Fr
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:37:11 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D6FDF5803C7;
 Mon,  1 Feb 2021 22:37:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 22:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=h
 /rcmKfbU2mAdVZLxpy/C1yzWCCQAuTWJpzzBadbQGU=; b=Emv20vMAfTm0pjzCg
 JvBzu39qrUD5ontV2Dm8anevxQZCf1cU7ZgLK1Lu1UyDab1b4WB4WGvNTC2RO9vJ
 1UrbmyoaVEwHwWF/29fKvujTQU3uk8hV7yGM/1t4Divlh6cvFWF50rA5IfEdJY/p
 coi+kDF9gXvw1owXU4jbF93wfSpPeJ/W3P685VOfC7z6dBwEoBFM3qWsYy4PixTq
 QawSQ5ysjS3ZKI/MHoEoR2LGMsU4Jkunvh2jEN5BktW0/nvQ5yeV/cw9yA89W1kg
 3jKQ5lcXM2QxxMcbhokzbytLdDGTBEii7lLDzXmrU0AuE2oKWjQHHhvZPFZlDAcq
 OfXmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=h/rcmKfbU2mAdVZLxpy/C1yzWCCQAuTWJpzzBadbQ
 GU=; b=A1BtdqCP6HklrGgwk+F8TOK3WPwOPa+jA7y//EGK8ceBh0Vy8MXBLYilC
 7JeQNlbTYOTzvxoyoLUUx9EDPsbzL4stUAy598Ybqz5GuNalb1cw2Gj5UZx0NTp8
 VPrPR3jkZs7tAH6WVpSNMPuoaQc+a6uE61zzHyeoggoAaNucFPGP4EJxU7qiROWm
 xxVs/XR9zyaw12+5zkkLkV5PXLoYAeSYInl9GwU6lU+749RNzvK6/60HkoKotwZD
 AUjk4ePna9Y9uSwjmDItKTUKZArB6Y0YV16SGXR7ozV3bkuNphrIHjOeQsUu0N3E
 YQvqbwiULMu2zBcnCe6taHwamT8xQ==
X-ME-Sender: <xms:5MgYYEnBd7WfTzWEXxF2YZlMdjRmGXltD0lu1pFOefgcA33erYMjYA>
 <xme:5MgYYNJR3jz0lm7f3hbn3ICsRjzxDnvi5EicWfTbYByb9xepH1dXfkOiTjqAMIxuF
 Oe4hEZO9S0ZMX-smP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:5MgYYJ5ROZgGXjRIAMjv4TFuLCK7TuICZjH9nyK7kDRU1YOfNRjDWw>
 <xmx:5MgYYB3TkyASszqHlj4yfjnw5m6h_lvakoAduGL6i57DGiUMJ4fEZg>
 <xmx:5MgYYPdnYYF1WyVcu77xLKVzuRvQYgbnhkd-zJkhRgoBAEFFaXGSxw>
 <xmx:5cgYYK69GVbGPwB643mT47CS1P_xbfoWHWD1V3gZWYsNmUgfaDqQ3Q>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC0811080067;
 Mon,  1 Feb 2021 22:37:06 -0500 (EST)
Subject: Re: [PATCH 05/13] target/mips: Remove unused MMU definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-6-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0d1d9360-0082-2d4d-b628-611f5fbb66d4@flygoat.com>
Date: Tue, 2 Feb 2021 11:36:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-6-f4bug@amsat.org>
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
> Remove these confusing and unused definitions.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/cpu.h | 16 ----------------
>   1 file changed, 16 deletions(-)
>
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index b9e227a30e9..9e6028f8e63 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1220,22 +1220,6 @@ typedef MIPSCPU ArchCPU;
>   
>   #include "exec/cpu-all.h"
>   
> -/*
> - * Memory access type :
> - * may be needed for precise access rights control and precise exceptions.
> - */
> -enum {
> -    /* 1 bit to define user level / supervisor access */
> -    ACCESS_USER  = 0x00,
> -    ACCESS_SUPER = 0x01,
> -    /* 1 bit to indicate direction */
> -    ACCESS_STORE = 0x02,
> -    /* Type of instruction that generated the access */
> -    ACCESS_CODE  = 0x10, /* Code fetch access                */
> -    ACCESS_INT   = 0x20, /* Integer load/store access        */
> -    ACCESS_FLOAT = 0x30, /* floating point load/store access */
> -};
> -
>   /* Exceptions */
>   enum {
>       EXCP_NONE          = -1,


