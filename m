Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86F47F4ED
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 03:26:49 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1JFI-0007E4-18
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 21:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1n1JEG-0006Dp-UU
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 21:25:45 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1n1JEF-0002Oo-77
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 21:25:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 195373200BF9;
 Sat, 25 Dec 2021 21:25:39 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Sat, 25 Dec 2021 21:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=fW30j
 1rhfRigN017RcV6UuthfL/FCHqPcP361YRxVEY=; b=DlFhBHXKeH+0I0EYXqgQf
 QYLgycd8m55y19/UakF5uuhl8lL0DhL//8x2EUzbjd0I+KSFqNnOLgwxbzWlGoTY
 7UMIR984F9o6trX3nRsmT2fUDZpbbOWgC+wr+e0w0Oy4jPGxl/z+AQjNvsuWH2tW
 MbCKoEj+oT6JZf8GXpbirCT0OoLGNYyXl5liS6Af5kEoXvqsYbS/nBBFLRuYl3g2
 fnjhiNCvBnFu2eSrw0K3zChOLMhi1AX3QimY0jUdlbZKd+2JsH++Lbn/O5ARr4GY
 s9zAOyWNJMbErEZbGEkjhc2j+RtRVGFEtRn/agG49UR+I1Xfdg+fGpUe8IEYf28U
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=fW30j1rhfRigN017RcV6UuthfL/FCHqPcP361YRxV
 EY=; b=DY73QMVm7pLQ8lETEYJoss9yHlSM/pTSaMEbhPmMgdPs1BNbEneQAgA1F
 qgJ2W9Ps4soJqWbNA64wdPMd0g2YL1WBgOF7wIV87WUTBxoO4UXx86xnrczblvAJ
 8R751jnoqNIUNkSiRwkp8RuNkaBCXc5ELTm8Ha+D17kROfyxF4oMktgqADoI9CKC
 anRn8YGHH2Sjjw/KxJZdzxpkfcdsYstgW6B+i2/qMiHcdQpMVWfsE4d4X1GkOKdS
 pkd4dwKhDnetovUHuL6/eLbyRZMwwRXLFoGA8WcMQ7tGT/v9od6QrBlPQOhYSzgM
 pO8XzwPosk+s5Nnyyt3Fsj+QU0ZAQ==
X-ME-Sender: <xms:otLHYeTA7MbkChoFqabnImbKzt6GFk4sBZUf2scfCZbtJCTaUBrIog>
 <xme:otLHYTwVQTrvecdrsYzLXMTi-VpFHu_30FfH3S8Iq3G759sxuMPO55baPxh09VhGZ
 g2sHh8LvOgqqGyD8Hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddufedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:otLHYb1Ketn2DncbGnxKEgk3WLTtb37cav6S0wL0cFq3QS8MsgSFfA>
 <xmx:otLHYaAMV4mjs_XY2vOz0SGPyTYftpAs4qzhZy2d4L3-f7f3anmZ0Q>
 <xmx:otLHYXjkK08zQy--_FhY0-GIPaNkhh-PWZPTb0YybP0M9OIEtQvA8g>
 <xmx:otLHYasIssEoGvGqGR2xJaAdTdEO1-k83qOjMB1KRV6iwW2i7EdLkQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 44E4AFA0AA6; Sat, 25 Dec 2021 21:25:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4525-g8883000b21-fm-20211221.001-g8883000b
Mime-Version: 1.0
Message-Id: <1cc49727-5ad5-4c4f-be81-6450e5889cff@www.fastmail.com>
In-Reply-To: <20211226001931.3809249-3-f4bug@amsat.org>
References: <20211226001931.3809249-1-f4bug@amsat.org>
 <20211226001931.3809249-3-f4bug@amsat.org>
Date: Sun, 26 Dec 2021 02:25:15 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 2/2] tests/tcg/mips64el: Run float tests
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B412=E6=9C=8826=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8A=E5=8D=8812:19=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=
=93=EF=BC=9A
> Unfortunately this fails:
>
>   $ make run-tcg-tests-mips64el-linux-user
>   ...
>   Files float_convs.out and tests/tcg/mips64el/float_convs.ref differ
>   --- float_convs.out     2021-12-26 01:03:48.585973637 +0100
>   +++ tests/tcg/mips64el/float_convs.ref   2021-12-26 00:29:35.8044653=
40 +0100
>   @@ -1,40 +1,40 @@
>    ### Rounding to nearest
>   -from single: f32(nan:0xffffffff)
>   -  to double: f64(nan:0x007ff7ffffffffffff) (INVALID)
>   -   to int32: 2147483647 (INVALID)
>   -   to int64: 9223372036854775807 (INVALID)
>   -  to uint32: 2147483647 (INVALID)
>   -  to uint64: 9223372036854775807 (INVALID)
>   make[2]: *** [tests/tcg/multiarch/Makefile.target:32: run-float_conv=
s] Error 1
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/tcg/mips64el/Makefile.target | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 tests/tcg/mips64el/Makefile.target
>
> diff --git a/tests/tcg/mips64el/Makefile.target=20
> b/tests/tcg/mips64el/Makefile.target
> new file mode 100644
> index 00000000000..dcb1e9d72ac
> --- /dev/null
> +++ b/tests/tcg/mips64el/Makefile.target
> @@ -0,0 +1,2 @@
> +float_%: CFLAGS+=3D-march=3Dloongson3a
> +float_%: QEMU_OPTS+=3D-cpu Loongson-3A4000

Hmm, -march=3Dloongson3a assumed legacy NaN while our -cpu Loongson-3A40=
00 assumed IEEE 754-2008 style NaN.

I guess switch to Loongson-3A1000 can help?

Thanks.

> --=20
> 2.33.1

--=20
- Jiaxun

