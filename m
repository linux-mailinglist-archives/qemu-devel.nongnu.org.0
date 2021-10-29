Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761AB43FBBB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:47:43 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQMI-0000i1-2D
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mgQFp-0007GC-VW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:41:02 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mgQFn-0007kM-OQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:41:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D75725C0200;
 Fri, 29 Oct 2021 07:40:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 29 Oct 2021 07:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=B
 24tUSm26KQzgt8301w4Y3yS2/1r5ZKJHeIXOr7yUI8=; b=jtOa8wp5v84Jex4UL
 RS4BFeWUj3E5/IHDY/Ta2YI9OsznJt7aeKYphHrVayguQIi9FJDYWgKcmb47QlaY
 3YhFfkov7IHOWSJhQ7pEvVXENhuMNLEIQggG9ld1s7xpuqnEiHC6iCIpas9TIbNu
 iTsHP2vXwvjRhos2dEJTRDm/2fEV55ZcbMGc33q0O860xXps0nPrK76HorxTJmMc
 BRy5JzN5n2Y4RWqkQFb99/j0eZnXIl1PAtxYtT3jC3sS20ulGOAf2tX9lwO/whbq
 Nm+2SiNnGJlNr0Ip2wYvpWRru4sou5R1m8PuzEhm8DnaI5sEhuH6pjr/xRPntFGC
 XbDIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=B24tUSm26KQzgt8301w4Y3yS2/1r5ZKJHeIXOr7yU
 I8=; b=gAfrb3nJPK5HZdKDFCkJrcXfHXSVLdFzrJPgCgvyaKtqTNZ2Y2W3+Et/2
 OWNQhwVt2xJcJFzZaoutOeBSfJCbtSBrvfJqdMScuhccBBFbBx66NiTbZ4LU+c6z
 KFe+gTr1Rle9YQaMDHw/jIvjwcNHCNgjiU70HqCdfX9J/WX7lT67eHGUqsswUNMk
 sb6G27126jLs0mEd5I4Hba+f2cqQpis8TxcKCAlOIo31LYx6TeJ90rPRsSbx4NIc
 /g0cSducwGrdeEEatL7/Yl7w2rQWAa/nKxVxIZQWaeco2f1w4W6Q7/yATdT9W7ob
 UPnmTu5z+8gQQs0ER0zgNrn+/XG+w==
X-ME-Sender: <xms:x917Yamz0XxcRmy4VrulokmkB_vlyssOQ_XMoqW6jkRxZM2HcQfl3g>
 <xme:x917YR1xdQKzx5NoXV4Kgj2H-H32aAYn126eWrcljtatf8o1yQWX5o9LNkDZeFJlV
 QKzRDz_nGqKZ2eBf0Y>
X-ME-Received: <xmr:x917YYqPvfOo6AAAr838-mp5SsQ8QOUSJVzYY6fBkh1-Y6B8QavMotj_rrCbimM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:x917YemFx1qyVl1UvJShJM88elmdsuV5ZVp9v9UCjWXcEfhy2lgBmw>
 <xmx:x917YY0eU6ZzX7w3OFXh2wOmcvhy3uYzJBIO332jN18mefYBj50Omg>
 <xmx:x917YVtMuW9JO_BhU-ZIPbd6i0dhqpisZtQJhqIyKwYHUdNRsiva-g>
 <xmx:yN17YVzCHvGKvXiq3iDw59pDH23Hqy-QWR-dixTNDW6AeIAHjV-N5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 07:40:54 -0400 (EDT)
Message-ID: <e391558c-5c5e-d6be-3c41-824a52c2783b@flygoat.com>
Date: Fri, 29 Oct 2021 12:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] target/mips: Remove obsolete FCR0_HAS2008 comment on
 P5600 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028212103.2126176-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211028212103.2126176-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/28 22:21, Philippe Mathieu-Daudé 写道:
> FCR0_HAS2008 flag has been enabled in commit ba5c79f2622
> ("target-mips: indicate presence of IEEE 754-2008 FPU in
> R6/R5+MSA CPUs"), so remove the obsolete FIXME comment.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.

- Jiaxun

> ---
>   target/mips/cpu-defs.c.inc | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index cbc45fcb0e8..b946f8f957f 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -369,7 +369,6 @@ const mips_def_t mips_defs[] =
>            * Config3: VZ, CTXTC, CDMM, TL
>            * Config4: MMUExtDef
>            * Config5: MRP
> -         * FIR(FCR0): Has2008
>            * */
>           .name = "P5600",
>           .CP0_PRid = 0x0001A800,

