Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282B397412
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:25:36 +0200 (CEST)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Ol-0002CA-Gt
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <astrauss11@gmail.com>)
 id 1lo231-0006Pj-3R; Tue, 01 Jun 2021 06:54:59 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <astrauss11@gmail.com>)
 id 1lo22z-0005qD-Bg; Tue, 01 Jun 2021 06:54:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id ci15so17627614ejc.10;
 Tue, 01 Jun 2021 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+K4KYma2ayRi2OWc/DZOjd0Tbo0VDgdc0W30Vd7I3o=;
 b=r3CfU38Rt1e6DFJPYDimAgjzZ840mPy8Gg8+9f2Tj5CVIf0W1hUzQm0clIEJmshPRk
 6dKAnHeoi2ZdxIW/Q37eAvs9JGnSYVMjbXvKTArVmrF/Fh9GX7FSlNUSvNrr45jQPoPw
 p2/Bj913uldf+4hH4frueN2utc3tiiXTFnUdWCxFkB7GqhC583M1KoKysLn5sRnztfZt
 NGnywGQwhyC5PEIcJ+SEJEqvIDcLAvwi0nOHY8UAxV2CyoDSZN6w/tx9DUXiCD6Z8Ie8
 P2DZAFczTr2K373WeS1gyucxUQrgRt3dH8VFs1hK1g0aEkqa3OeeFfscNiXZkFKVNAoL
 Yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+K4KYma2ayRi2OWc/DZOjd0Tbo0VDgdc0W30Vd7I3o=;
 b=TekK8lUIu4aHxqDA3TAs2XdaCz/haJ3S4WqFNYxtYnwJQd8Zasn0DWmc9Yw6K2a5bX
 DFEygCIOnUrfvl611a72fUh20Gxlg/jf2UIlrsgakUR232oDKJMF589SvjuUCveqEJCw
 e9TZ9xfz3tlGkWvp0+O8j6eGiVIU29o4k1bZ3XisTKnnpoDysj2zsTEgSnOvochy4Ld/
 fhZlVmhBOWV7mIhJTN4PCTrrxUWe0a66+UtUeVTi8dDGf75E1p7M0VXqEFGZao2sqscs
 8In8qi4S/jLLIhT9fb5mRurXGMiX9tNrPgzfEEVfs9gs+NcKgdLomvs/KxBCcnMgW2RR
 G36g==
X-Gm-Message-State: AOAM531wQzjEnBjYAviAxKb2gLw9hdx1UOC24wSZ2nEyXWpGPFOeZ97q
 WNbX+7k/Pl1AyROSHgXxoxh5Ul644If/d30xcQs=
X-Google-Smtp-Source: ABdhPJy8tefGQQYAfhTy45qtfFUv4SgT7l8MsFCFshSnC9tKD8ndaH8M0Hqb16B5uWAq8yzWLBRHYD0mbMd1aMLWzfs=
X-Received: by 2002:a17:906:1c49:: with SMTP id
 l9mr11320196ejg.39.1622544895133; 
 Tue, 01 Jun 2021 03:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
In-Reply-To: <20210601090715.22330-1-alex.bennee@linaro.org>
From: Andrew Strauss <astrauss11@gmail.com>
Date: Tue, 1 Jun 2021 06:54:44 -0400
Message-ID: <CAP=E3Jjz3XYLOQS5ATNo_ncVwJ4eqiNhv6X4N1AURdcEZtc22A@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001b58a205c3b22ccf"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=astrauss11@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:22:09 -0400
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001b58a205c3b22ccf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Andrew Strauss <astrauss11@gmail.com>
Reviewed-by: Andrew Strauss <astrauss11@gmail.com>

On Tue, Jun 1, 2021 at 5:07 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code has access to the same symbols in run time to make a
> determination of the location of the heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew <astrauss11@gmail.com>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..041b4f6c04 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_HEAPINFO:
>          {
>              target_ulong retvals[4];
> -            target_ulong limit;
>              int i;
>  #ifdef CONFIG_USER_ONLY
> +            target_ulong limit;
>              TaskState *ts =3D cs->opaque;
> -#else
> -            target_ulong rambase =3D common_semi_rambase(cs);
>  #endif
>
>              GET_ARG(0);
> @@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D ts->stack_base;
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
> -            limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application.
> */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> -            retvals[3] =3D rambase; /* Stack limit.  */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D 0; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
> +            retvals[3] =3D 0; /* Stack limit.  */
>  #endif
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
> --
> 2.20.1
>
>

--0000000000001b58a205c3b22ccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Tested-by: Andrew Strauss &lt;<a href=3D"mailto:astra=
uss11@gmail.com">astrauss11@gmail.com</a>&gt;</div><div>Reviewed-by: Andrew=
 Strauss &lt;<a href=3D"mailto:astrauss11@gmail.com">astrauss11@gmail.com</=
a>&gt;<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 1, 2021 at 5:07 AM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The previous numbe=
rs were a guess at best. While we could extract the<br>
information from a loaded ELF file via -kernel we could still get<br>
tripped up by self decompressing or relocating code. Besides sane<br>
library code has access to the same symbols in run time to make a<br>
determination of the location of the heap.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Andrew &lt;<a href=3D"mailto:astrauss11@gmail.com" target=3D"_blank">as=
trauss11@gmail.com</a>&gt;<br>
---<br>
=C2=A0semihosting/arm-compat-semi.c | 19 ++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c<=
br>
index 1c29146dcf..041b4f6c04 100644<br>
--- a/semihosting/arm-compat-semi.c<br>
+++ b/semihosting/arm-compat-semi.c<br>
@@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)<br=
>
=C2=A0 =C2=A0 =C2=A0case TARGET_SYS_HEAPINFO:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong retvals[4];<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong limit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong limit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TaskState *ts =3D cs-&gt;op=
aque;<br>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong rambase =3D common_=
semi_rambase(cs);<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_ARG(0);<br>
@@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retvals[2] =3D ts-&gt;stack=
_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retvals[3] =3D 0; /* Stack =
limit.=C2=A0 */<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D current_machine-&gt;ra=
m_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: Make this use the limit=
 of the loaded application.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[0] =3D rambase + limit /=
 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[1] =3D rambase + limit;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[2] =3D rambase + limit; =
/* Stack base */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[3] =3D rambase; /* Stack=
 limit.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Reporting 0 indicates we=
 couldn&#39;t calculate the real<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* values which should forc=
e most software to fall back to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* using information it has=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[0] =3D 0; /* Heap Base *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[1] =3D 0; /* Heap Limit =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[2] =3D 0; /* Stack base =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[3] =3D 0; /* Stack limit=
.=C2=A0 */<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_=
SIZE(retvals); i++) {<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000001b58a205c3b22ccf--

