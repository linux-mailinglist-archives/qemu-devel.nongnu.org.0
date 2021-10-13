Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709CC42B235
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:22:08 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSy7-0007lt-Hq
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maSw7-0006yg-15
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:20:03 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maSw5-0006e8-Ah
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:20:02 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p13so3429564edw.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oREK1vF25vCfTBpST1qr74DHki7pW+cnw+6YsFcFZY=;
 b=uy/69YnFDFj/W/sH7GajltKAdAuNgJ6zZzn3AeoTwHVGeOO/EAjul+oYV/XsJifSgz
 3bBun7GPbwuZLdQLoKtHt0avdxUJ2JeEa+5nGUR5j+lfclooZymokexNZKxaMWQ18fyE
 8FJxzhzTtqnvN+OONlNf7FCanVWMvgNlrMBIeBuPeLMtSmvobIYUfKSYf8atXfDgUZi2
 xxp6MZZwtlnBiyKcfjEQgD1/Y73ZgRysa2NLZ//cDsMdN0uF4DsNAtu5hFFzso847/qL
 hOtxR6oJy6JmmmHUCe0cDcbVf3mTe3AMmCtOQP4VPZk5l7HNoMT+kuxptWJdIe9iYSq8
 CfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1oREK1vF25vCfTBpST1qr74DHki7pW+cnw+6YsFcFZY=;
 b=sLrYUQ2diz2JrCIWKgkdWOuomycq/EQIhhl5ZT+DnguK3aNRR73sYLKKAvBnrKcmrG
 Lr8OroBsyDP55/czeaIPVO55W1/4VTu1FKir1xFviAg7owaY7yAaGlYCFxHy/Rwqy7dn
 Qlgo/QTxAqNEpYegAFRgbGrWrTPtEtcM9CerznYIZpISvz5wbNbNgl87W63ulgPoj221
 pSA+jDZv0E4RDZq5j1EE/TzNR8misvWX2rpqvFDQHvNHXpx/opYWNxbMTxTpgWOB3epz
 EFeqaEAeI5AOhGhL4h7B4vTQNtv3uONm3TUJZ9jPx3gxPIiaJZUpEV/XXHxHz/L9+bM7
 jKtA==
X-Gm-Message-State: AOAM532Czxeh5nNnqqqz9n0duJQPOzdtDWJnryuXI/so5Om9stDPPmmc
 i5wbiCJfSK3+lZDX2ZEFgMUvsOGRi/AQ6hfOD6nxiw==
X-Google-Smtp-Source: ABdhPJwFXqcLfd6oo1hawpFKgkbL0Zwo1rEQcyieazbdhhosQ7LPwAJO6bScpyJRqPm3WQFeoEOQIUiAy/IIVSM5dLQ=
X-Received: by 2002:a50:a2a5:: with SMTP id 34mr4967274edm.180.1634087999821; 
 Tue, 12 Oct 2021 18:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-3-sjg@chromium.org>
In-Reply-To: <20211013010120.96851-3-sjg@chromium.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 03:19:49 +0200
Message-ID: <CAHFG_=Wj9w0w8C88O4BNN4pO-C+wMqFuqmVh4F1avcwsqE_csQ@mail.gmail.com>
Subject: Re: [PATCH 02/16] arm: qemu: Explain how to extract the generate
 devicetree
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000c2ef7b05ce31c253"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Tom Rini <trini@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2ef7b05ce31c253
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 oct. 2021 =C3=A0 03:02, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> QEMU currently generates a devicetree for use with U-Boot. Explain how to
> obtain it.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>  doc/board/emulation/qemu-arm.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/doc/board/emulation/qemu-arm.rst
> b/doc/board/emulation/qemu-arm.rst
> index 97b6ec64905..b458a398c69 100644
> --- a/doc/board/emulation/qemu-arm.rst
> +++ b/doc/board/emulation/qemu-arm.rst
> @@ -91,3 +91,15 @@ The debug UART on the ARM virt board uses these
> settings::
>      CONFIG_DEBUG_UART_PL010=3Dy
>      CONFIG_DEBUG_UART_BASE=3D0x9000000
>      CONFIG_DEBUG_UART_CLOCK=3D0
> +
> +Obtaining the QEMU devicetree
> +-----------------------------
> +
> +QEMU generates its own devicetree to pass to U-Boot and does this by
> default.
> +You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree
> version.

this is for either Qemu experts or u-boot for Qemu maintainers. Not for the
kernel d=C3=A9velopper as it is recipe for problems: could you add this war=
ning ?

>
> +
> +To obtain the devicetree that qemu generates, add `-machine
> dumpdtb=3Ddtb.dtb`,
> +e.g.::
> +
> +    qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57 \
> +           -bios u-boot.bin -machine dumpdtb=3Ddtb.dtb
> --
> 2.33.0.882.g93a45727a2-goog
>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000c2ef7b05ce31c253
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 03:02, Simon Glass &lt;<a =
href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">QEMU currently generates a dev=
icetree for use with U-Boot. Explain how to<br>
obtain it.<br>
<br>
Signed-off-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=
=3D"_blank">sjg@chromium.org</a>&gt;<br>
---<br>
<br>
=C2=A0doc/board/emulation/qemu-arm.rst | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu-ar=
m.rst<br>
index 97b6ec64905..b458a398c69 100644<br>
--- a/doc/board/emulation/qemu-arm.rst<br>
+++ b/doc/board/emulation/qemu-arm.rst<br>
@@ -91,3 +91,15 @@ The debug UART on the ARM virt board uses these settings=
::<br>
=C2=A0 =C2=A0 =C2=A0CONFIG_DEBUG_UART_PL010=3Dy<br>
=C2=A0 =C2=A0 =C2=A0CONFIG_DEBUG_UART_BASE=3D0x9000000<br>
=C2=A0 =C2=A0 =C2=A0CONFIG_DEBUG_UART_CLOCK=3D0<br>
+<br>
+Obtaining the QEMU devicetree<br>
+-----------------------------<br>
+<br>
+QEMU generates its own devicetree to pass to U-Boot and does this by defau=
lt.<br>
+You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot&#39;s in-tree ve=
rsion.</blockquote><div dir=3D"auto">this is for either Qemu experts or u-b=
oot for Qemu maintainers. Not for the kernel d=C3=A9velopper as it is recip=
e for problems: could you add this warning ?</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex" dir=3D"auto"><br>
+<br>
+To obtain the devicetree that qemu generates, add `-machine dumpdtb=3Ddtb.=
dtb`,<br>
+e.g.::<br>
+<br>
+=C2=A0 =C2=A0 qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-bios u-boot.bin -machine dumpdtb=
=3Ddtb.dtb<br>
-- <br>
2.33.0.882.g93a45727a2-goog<br>
<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro=
-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:=
rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7oi=
s-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)=
">|</span>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000c2ef7b05ce31c253--

