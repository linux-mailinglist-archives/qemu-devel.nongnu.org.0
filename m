Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D8694BDD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbCU-0007Fq-Pl; Mon, 13 Feb 2023 10:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pRbCS-0007FK-RJ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:57:04 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pRbCR-0002OB-4m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:57:04 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1442977d77dso15659054fac.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M7SnJbgGJXj+fTFf3xsoqnXiRCe3dUDlA+Yb5mecyMY=;
 b=fYz7HBeOCRV/CLZsCzHyseMYFBNotNr+L2FSDjzHu6WKB4Hvwr8Qf/yaTorsZf0oeh
 numhwaIG1sd0Jan38Cq4v4dR6R7gBOrkQtOTaZsmqWxyVw0g9Xt7KmLqMiIwWIfsZQw8
 o7EgELzKZFjc7psyIYjWTqVinTYGTB90mzf3Z7xcxhzBJsALOMqJmZDphuOq8PheIepV
 5OyUNja5Gmw8AiRpHnPJiSKOHGVKIrv5K6z2clCQeu8jq+65MBx/Bu/Xq0XeWldzRWmT
 PY72pVWUbE9nkSSLtExZ2tbHmVsTch94r2UwuM9KUubbCjPilS8wlScGFEi2BSZ731u8
 ZnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7SnJbgGJXj+fTFf3xsoqnXiRCe3dUDlA+Yb5mecyMY=;
 b=ft/Wn0jo+kfxFR7LJthTPFbxnka0x94iPS7j+rpEC7JODq7ZBRHj2AMuF/rXlZT4qY
 4MQV8ClsgnECVhDPJPJkAu3vDF2BwdgeWNGDwxGcH5/A6Wbwn1JnibXkI33gyWdiAVTq
 QVk+N7ndQZBFTwiKwmiCUN0A7nzmJ66RYTe1nos41sPpngNEfWKfO9LmpqE1JSjjiHF9
 n6bPvme3qKWZEmMFPGpgUKoLjSkyA7bqjAfALnRINyI5ZDf6aUy0HmqUXrq7v44ksBzs
 PXILZa4+6ZPeFy8cvTB9HN2187V+Vee/CXZYucazbZFLXlL6t5kSGznVsZ0JBw2gf7S1
 I3RQ==
X-Gm-Message-State: AO0yUKUoAtrT/k575UD6a/FYYD/PfYBU8QFTy+7MlKVdxErMeawlMxIT
 qWSQOKK7RhUoR8Af/625mkDAK3BWAvieV0oBwJTxdg==
X-Google-Smtp-Source: AK7set9dMZLEOuGw9ZPZTCOh0cv+K0rDD9qKEdWXBQDL3scn1i5oTVCGTntRBPdQ87z0DKXHY/BuMBXtASQ3ZEjHx8A=
X-Received: by 2002:a05:6870:c68a:b0:16a:4376:e95f with SMTP id
 cv10-20020a056870c68a00b0016a4376e95fmr2284151oab.165.1676303821477; Mon, 13
 Feb 2023 07:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 13 Feb 2023 23:56:50 +0800
Message-ID: <CAE_xrPgZbi507=QOnXmxP--QGwFMRT_rH97nTrxdVwc=FqJzdQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix vslide1up.vf and vslide1down.vf
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 palmer@dabbelt.com
Content-Type: multipart/alternative; boundary="000000000000d0b06a05f496e56c"
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=frank.chang@sifive.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000d0b06a05f496e56c
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Mon, Feb 13, 2023 at 5:45 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
wrote:

> vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide1up.vf. So its
> scalar input should be uint64_t to hold the 64 bits float register.And the
> same for vslide1down_##BITWIDTH.
>
> This bug is caught when run these instructions on qemu-riscv32.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/vector_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..3073c54871 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
>
>  #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)
>   \
> -static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,
>    \
> +static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,
>    \
>                       void *vs2, CPURISCVState *env, uint32_t desc)
>   \
>  {
>    \
>      typedef uint##BITWIDTH##_t ETYPE;
>    \
> @@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
>  GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
>
>  #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)
>      \
> -static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,
>      \
> +static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,
>      \
>                         void *vs2, CPURISCVState *env, uint32_t desc)
>     \
>  {
>      \
>      typedef uint##BITWIDTH##_t ETYPE;
>      \
> --
> 2.17.1
>
>

--000000000000d0b06a05f496e56c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13, 2023 at 5:45 PM =
LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.alibaba.com">zhiwei_liu@l=
inux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide=
1up.vf. So its<br>
scalar input should be uint64_t to hold the 64 bits float register.And the<=
br>
same for vslide1down_##BITWIDTH.<br>
<br>
This bug is caught when run these instructions on qemu-riscv32.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.alibaba.co=
m" target=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/vector_helper.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br=
>
index 00de879787..3073c54871 100644<br>
--- a/target/riscv/vector_helper.c<br>
+++ b/target/riscv/vector_helper.c<br>
@@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)=
<br>
=C2=A0GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)<br>
<br>
=C2=A0#define GEN_VEXT_VSLIE1UP(BITWIDTH, H)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 void *vs2, CPURISCVState *env, uint32_t desc)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
=C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0typedef uint##BITWIDTH##_t ETYPE;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)<br>
=C2=A0GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)<br>
<br>
=C2=A0#define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *vs2, CPURISCVState *env, uint32_t desc)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
=C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0typedef uint##BITWIDTH##_t ETYPE;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000d0b06a05f496e56c--

