Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663014AA135
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:33:52 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5HD-0002DH-31
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1nG5G9-0001XZ-N2
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:32:45 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1nG5G2-0005aJ-I8
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:32:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E59873200D25;
 Fri,  4 Feb 2022 15:32:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Feb 2022 15:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=anA/sFVOktga8a
 QmnQdlp9xuE+8bV3uDwOsMav090cc=; b=uxlT31HR5TtJsRpTaJQT8i42i1AYwK
 2R8xpec4a4Gw12Mj6YsiyR8cZi+spf0I7WF0lmBhitRuhWuUDrS0ME7Y72QRnRrh
 HrCquXl8KcoOhHJbXnU3zTItcuHbSpgyqVQ/gU1FhJ6uDDi1IPtCPybOGtDX87tw
 1mm9xW2PXSpkPkZfff0ZmK+uno4H0DgeFlRzntviHt5NnEoE3fbKMPp0EXMHHXY4
 vLK1ijpKeOQiPAU3/EK1i9wQ2Ro6DoQvlReX1cEu2dtI9nJ8SdG2Q7MPUpiBhU+B
 XMUTDYrWweMCsZpqNMq8S70DbCChr3MIg9EMK3x+tLIeQseaWZ+X+1kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=anA/sFVOktga8aQmnQdlp9xuE+8bV3uDwOsMav090
 cc=; b=c61elK25IZlw8aVlaxEhm86GPgsMARPKoI7ooN4ezm3d3mR5unOwDeB1F
 n86w4V63T9kdbjAgavqqDgf6lDrfiEFIf19iY4rI3f3woRxXRcwWmm8hpGftA0Fv
 spB6/R7nff+/1v3riUa1nB5dWE7LIlG5WPYvvCYd484tX0Gk8fp3qVnEM6+LBQZX
 RO0LHQHVr72D241+odILEbbPVanBkXsjcUhrhfNFFCMfjSmB5qUd/n0ADIClIAue
 lQT07ZZL5ac0LXSzsWjR1o0J5LsaooWHkY9oM59kRb0E5FPZCBoELjPfb9vdLoi6
 RCbzF3694M2jO/ScsM9gpy8esaUcQ==
X-ME-Sender: <xms:W439YSBTg99CSbbP5OEAZ0V2uD_P4Ce4SEUDPA_LPXD4QwT7YzGk9g>
 <xme:W439YchAD9Fyb89sMudTYt0IV9tbJ1wlamz4kA6HzaNQYI9fTRz5V2H6JKuE5XnJA
 6TN2oG5UPKWzvnvEEM>
X-ME-Received: <xmr:W439YVmdctfV3sWqg73XlfmkQHfcMYfmJNKm5aKvSaET5EcZ5t98121azRXbczA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeelgddufeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:W439YQxhGjYNhdVWVOxMHWh5xKg8s-y15IOhzTQ7KxxO-so-FoOcKg>
 <xmx:W439YXTev9cIaBTpl8eRF7mLi9lJ10NW-Q8LaZdvi1u_czi0wkRjAA>
 <xmx:W439YbaLZGqKSD35XBvtVQvVYepESYnPqIlnzmbkmQmwIIf6cUTVdw>
 <xmx:W439YSfGdOpxA4TC-Y7HVI70YfyO_rMKSSGjHjAOYHau_Ot8U3kw9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Feb 2022 15:32:26 -0500 (EST)
Message-ID: <947933bf-3995-dce6-70be-21549628f97b@flygoat.com>
Date: Fri, 4 Feb 2022 20:32:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 0/2] tcg/mips: Unaligned access support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220201234107.316487-1-richard.henderson@linaro.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220201234107.316487-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/1 23:41, Richard Henderson 写道:
> Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>
> ("[PATCH v4 0/7] Unaligned access for user only")
>
> Changes from v4:
>    * Rebase on master.
>    * Drop other cleanup for now.
>
> Changes from v3:
>    * Rebase on master, which has some patches applied.

For the whole series:

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Run some sample program with GCC unaligned-access enabled.

Thanks.

>
>
> r~
>
> Richard Henderson (2):
>    tcg/mips: Support unaligned access for user-only
>    tcg/mips: Support unaligned access for softmmu
>
>   tcg/mips/tcg-target.h     |   2 -
>   tcg/mips/tcg-target.c.inc | 387 +++++++++++++++++++++++++++++++++++---
>   2 files changed, 360 insertions(+), 29 deletions(-)
>

