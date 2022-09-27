Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AEE5EBE66
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:21:43 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6mc-000519-It
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6hw-0007na-QG; Tue, 27 Sep 2022 05:16:55 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6hu-0001QP-CG; Tue, 27 Sep 2022 05:16:52 -0400
Received: by mail-lj1-x230.google.com with SMTP id x29so10248572ljq.2;
 Tue, 27 Sep 2022 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=igP0c0sJaDfZh4aw8ZzkZmNyM+z7emPPLiXKyNQm1fU=;
 b=B+C4A+REohi/2wz8ra5/U0YPZT6t/3Dfb5+XQpIp1gdrm4RRyY0CBYfg0eiiwDEl5z
 r9676v6UbgFngDyMnKsz4EMg8Py1kRT5ZRxNLxGfHe2+bfbk2LE/u4Ips8GSocIaRdo3
 NZQBOZzALnrDg8xOJf28WxoPcxm8pmP0dTAx2ePvMrIvUF7rv2u6P3kRdPE+DSThPnei
 IUdtYixYrXoyf2xqvmgLweApS4WYoA2gFAnqbnEJDxDR8wYkIxF0B7lmMSIYdQU/fJ/S
 E/CZNiqtomjYg+yiUzEMyQ8o9V46A35oesPY38p8/uHjzv81g7iz+jrAyKhTMA95hTrJ
 XE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=igP0c0sJaDfZh4aw8ZzkZmNyM+z7emPPLiXKyNQm1fU=;
 b=slOJdtWMY/kGHeKpumqHPcvm5lAqVp/i9rmvk5gAlWLB/BuDPAJeJsoehBULTnFPhP
 j037NiK6l7DYdYCdJR/OKO+ulJAnr59eFsbjc7E2JWjHlc3wYpwFsOCmbAJ9fLjoAlEk
 u4wywQoQjfMG6vj73LJaLkyGQP/DydOwuM4iL6JgxdNmq4ZnqFLE/iB+d1OTywEfLwrQ
 S8WzZTChMcEiJRXR9QcLlt1a9u0CU7mtYeI/mDhG7lHMv3wLoSm2ZGiwp8z3qhwjWED9
 zELYi7U7YrfDohNCIqh5nrMrN4tlAm3m+Fm2GM4HWFiaIh1M4GWd/TQpFwVC3G50Eimo
 5egA==
X-Gm-Message-State: ACrzQf358wILRr1DlbBHw1m3bnjaz8R+2ukgNBygkrpi9g0Wi7x7P+0E
 RM3p7faXRL/AGwRtV8xyUJKOoHlFMyI23FzQReg=
X-Google-Smtp-Source: AMsMyM4aDviZM3NlNLnfrZIkZJfCZi2DBQEbh75kOUBOPgLYrnRsmuQyS5MRnv9K8LMTZbbQzX9iKKwCi/lOLv+BOa4=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr8849623ljp.267.1664270207611; Tue, 27
 Sep 2022 02:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
 <20220911181840.8933-6-arwed.meyer@gmx.de>
In-Reply-To: <20220911181840.8933-6-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 13:16:35 +0400
Message-ID: <CAJ+F1C+qQy2QUCqeiNJGzOCpvF+a_TKC0eQcSDe_aqL=94mb7A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] serial: Allow unaligned i/o access
To: Arwed Meyer <arwed.meyer@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000088f99605e9a51a7c"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088f99605e9a51a7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 11, 2022 at 10:46 PM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Unaligned i/o access on serial UART works on real PCs.
> This is used for example by FreeDOS CTMouse driver. Without this it
> can't reset and detect serial mice.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Michael, can you r-b too?



> ---
>  hw/char/serial.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 7061aacbce..41b5e61977 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t
> frequency)
>  const MemoryRegionOps serial_io_ops =3D {
>      .read =3D serial_ioport_read,
>      .write =3D serial_ioport_write,
> +    .valid =3D {
> +        .unaligned =3D 1,
> +    },
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000088f99605e9a51a7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 11, 2022 at 10:46 PM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Unalign=
ed i/o access on serial UART works on real PCs.<br>
This is used for example by FreeDOS CTMouse driver. Without this it<br>
can&#39;t reset and detect serial mice.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/77" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/77</a><br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div><div>Mi=
chael, can you r-b too?</div><div><br></div><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/char/serial.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/hw/char/serial.c b/hw/char/serial.c<br>
index 7061aacbce..41b5e61977 100644<br>
--- a/hw/char/serial.c<br>
+++ b/hw/char/serial.c<br>
@@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t freq=
uency)<br>
=C2=A0const MemoryRegionOps serial_io_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.read =3D serial_ioport_read,<br>
=C2=A0 =C2=A0 =C2=A0.write =3D serial_ioport_write,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D 1,<br>
+=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0.impl =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.min_access_size =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_access_size =3D 1,<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000088f99605e9a51a7c--

