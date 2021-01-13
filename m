Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3372F4195
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:17:12 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzVig-0007NR-NF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVh3-0006qr-3E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:15:30 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVh1-0007ek-9y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:15:28 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8046C58066C;
 Tue, 12 Jan 2021 21:15:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 21:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=X
 lDSLcTC3eOCE6nNsf9sREC7dWYenaUkY8cwT0/X0QY=; b=ZJG0/EAs10pHRz/aF
 ILOYwlTT7MfeJNDstDc/dxq4XqmXHMxIfV0Fv8kBVZz3KGgxbgK85I8ezV6QC62U
 EASOCcWkhOH7rNpHvtBIMzjQgFgY9/YVYSXzqjZqQ/xzcg6R4tmM7l9hRGHH0aBC
 sU/xvKqRGG6hO5hoQW0nzFgYiAyExpOPjM9dikO7+AvPfOWp2ZyAgaVQ+yOkecV0
 eGIJSDUsTiJiDgbCel00HUuZpy09ZoUCdRiosiiCo3ZxXVmpdP4xyKmWx+ty11+o
 5G0InpDaGpsF/ZZI7zNfgZLAVNDCyRBET5NNtNkJWHceO1jdEv4QKl86S+Q/uRsJ
 fP6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=XlDSLcTC3eOCE6nNsf9sREC7dWYenaUkY8cwT0/X0
 QY=; b=LiJEx2opJfVUoGQguUagLOu4ygN3Qtv4FJ810aUZqF8lr7ZpsHoNuWqlx
 JvEABaxC38QMVWKJaLX4DfLDOofeqLJJD4yEfYFRzUF6BnVMqVb1QlM2Ln/YwDHM
 w+Y62u4TGfUdEwGmJRe8+7N2NKHLH8xVGf3TTm+kSzamWIlowxOhsj5dNsOzRfHu
 2Nuf5+W9jDYjDQ4p/MYbqJJAGLtDwlaiqNTaE2N03CU9FxI87By4j+J8EMHBnvYp
 h2TJHXm5doWXIfcOnaY5ha0cTg0IRyklU/C3EPThGRt1NdctGbVtwGr9ZrgFRsCC
 TlMwri+c8LNXIioEGLxujef7oVkeA==
X-ME-Sender: <xms:ulf-X3PPm3zwUilYExw4i8631qP3AYofc40UcJrlIBcp9RvXa_JHSQ>
 <xme:ulf-Xx_Cskr9WHyoKmFs5zr0F6lcC8fQl0lzCltM13U_8_lX8F88cRvQ0d3qgWDi8
 beYNUlN-f4HZrgjEfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:ulf-X2TZeDYd7FXs290f9Tho-ZiqPcA0YDtrH_Qadzq9mNDmyMe5kw>
 <xmx:ulf-X7vT1yln7nF6SyVvYybh-DlkLrwbZnxG79iZMShPARWxBx2KmA>
 <xmx:ulf-X_fsxk-KOkEYILBsj6IOoaYLNBVRhxZt_X8cFM8ov-O6p5QrRg>
 <xmx:u1f-X77jHL_08JJlEXA50MEj7KL8Wo1CHAyMOT9jSnqkHrRbM8vnXw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CEA41080066;
 Tue, 12 Jan 2021 21:15:20 -0500 (EST)
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0e1b22ca-7ca0-f92e-2d43-fc10eafd565f@flygoat.com>
Date: Wed, 13 Jan 2021 10:15:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/13 上午5:54, Philippe Mathieu-Daudé 写道:
> Loongson is next step in the "MIPS decodetree conversion" epic.
> Start with the simplest extension.
>
> The diffstat addition comes from the TCG functions expanded.
> The code is easier to review now.
> IMO this is also a good template to show how easy a decodetree
> conversion can be (and how nice the .decode file is to review) :P
>
> Please review,
>
> Phil.
>
> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
>            "decodetree: Allow 'dot' in opcode names"
>
> Philippe Mathieu-Daudé (6):
>    target/mips: Re-introduce OPC_ADDUH_QB_DSP and OPC_MUL_PH_DSP
>    target/mips: Convert Loongson DDIV.G opcodes to decodetree
>    target/mips: Convert Loongson DIV.G opcodes to decodetree
>    target/mips: Convert Loongson [D]DIVU.G opcodes to decodetree
>    target/mips: Convert Loongson [D]MOD[U].G opcodes to decodetree
>    target/mips: Convert Loongson [D]MULT[U].G opcodes to decodetree
>
>   target/mips/translate.h       |   1 +
>   target/mips/godson2.decode    |  29 +++
>   target/mips/loong-ext.decode  |  30 +++

Hi Philippe,

Thanks for the template!

Just a small question, where should we perform ISA availability check?
Before calling generated decoder or after decoded?

Loong-EXT is a super set of Loongson2F's Godson2 and MMI instructions,
how could we tell it?

Thanks.

- Jiaxun

>   target/mips/loong_translate.c | 334 ++++++++++++++++++++++++++++++++++
>   target/mips/translate.c       | 287 ++---------------------------
>   target/mips/meson.build       |   3 +
>   6 files changed, 409 insertions(+), 275 deletions(-)
>   create mode 100644 target/mips/godson2.decode
>   create mode 100644 target/mips/loong-ext.decode
>   create mode 100644 target/mips/loong_translate.c
>


