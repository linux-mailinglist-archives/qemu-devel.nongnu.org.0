Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93DF533D4C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:09:45 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqlh-00086r-1D
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntqhB-00052t-Ck
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:05:01 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ntqh7-0003zL-TN
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:05:00 -0400
Received: by mail-lf1-x130.google.com with SMTP id w14so35857590lfl.13
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tayXs8MO6fr3EfgPiiELvpEgjrY45hbDHbQm1kc8hI0=;
 b=CqgFR0s4Nv3+nZj5bnySUZR52kQ3MMbKuepVOy1FuJoOj5jiBIHyKKjVqPA2yVUepx
 TYKFfW7Vq57+tQ+8q0eobUTotyuTeZA6qzCbzWSANXYOR4VzMZ2FvAondupMpU0P+t07
 v5jOmwcX7doiQdB5L0gBiiDJAXz7+x9Wl7uQgZjme2hZEjP409o0g2NwhRC1vdHf9yTp
 oHuvsHcFBuVPjZdcaRb7ADdWVHR6eE1no1Fim45dQXparVTY/O6Tc/PK1f5en79DLNLm
 tsFajGsF3NpX+YisFAM+fxdhXV9DQXw7KW1yKLoaREHszVg5an1/4Gpy3RRHpRCpTdYc
 bL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tayXs8MO6fr3EfgPiiELvpEgjrY45hbDHbQm1kc8hI0=;
 b=RUTk/FevAjvfP/lPfLUYxGdZDWGlGayAVZfxQOg5OXtv23J927STQvhHyYqUiU0uIo
 2e0FdQoZoSJtVAIrfb+v/jhbYU6vQa0eoEoldXGTU7FjKfUkn66TzgmiX4WzDgWKkSXJ
 rgpXrskZcW9RxRB9lNqY9CzIDbvhh4cyxsmcrecLkZBhEwKlzQFMxcxPG4gYGjZQtMKE
 5H/SHZ94xNMvuVWCW3TLvIlGBwj6iP3RytMtk2a0raoGL2CBbGxLd7bTI2zbmVS0WaS3
 8ujuGBaJBDxJskDBBD75G20FCUvQgEH9+BEXUqoAuwx7/z1gFOxk5KRpVgrR615b/TaL
 PkKg==
X-Gm-Message-State: AOAM5327NCcUNTJCf6oSTIlTanZu3Gso2h7G92rSjQKWQL8UdQy3vu5g
 JdoB0/gDw9OSSFGZELJ3iQo4//nfWj7JkWOuxCg=
X-Google-Smtp-Source: ABdhPJyzJNWkuqmdngoYhhvBoJisCmeZdxOowykcaXJcowxx53sUwE75nR5k9+jZeEZ6+Y6q6+wiRFwTJeT9C88qXsQ=
X-Received: by 2002:a19:e050:0:b0:477:b0ae:1312 with SMTP id
 g16-20020a19e050000000b00477b0ae1312mr22251159lfj.357.1653483894795; Wed, 25
 May 2022 06:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220525125904.483075-1-stefanb@linux.ibm.com>
In-Reply-To: <20220525125904.483075-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 May 2022 15:04:43 +0200
Message-ID: <CAJ+F1CLo6cJE-S819UyG+nXUZOk-kYY8=mgtzPCFtiCJwuXaJQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/tpm/tpm_tis_common.c: Assert that locty is in range
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000030f44105dfd5b8f1"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000030f44105dfd5b8f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 3:02 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:

> From: Peter Maydell <peter.maydell@linaro.org>
>
> In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
> tpm_tis_dump_state(), we calculate a locality index with
> tpm_tis_locality_from_addr() and then use it as an index into the
> s->loc[] array.  In all these cases, the array index can't overflow
> because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
> TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
> it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).
>
> Add an assertion to tpm_tis_locality_from_addr() that the calculated
> locality index is valid, which will help Coverity and also catch any
> potential future bug where the MemoryRegion isn't sized exactly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>
> ---
>
> v2:
>   - Moved 3 asserts from 3 callsites of tpm_tis_locality_from_addr() into
>     tpm_tis_locality_from_addr()
> ---
>  hw/tpm/tpm_tis_common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index e700d82181..503be2a541 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -50,7 +50,12 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr
> addr,
>
>  static uint8_t tpm_tis_locality_from_addr(hwaddr addr)
>  {
> -    return (uint8_t)((addr >> TPM_TIS_LOCALITY_SHIFT) & 0x7);
> +    uint8_t locty;
> +
> +    locty =3D (uint8_t)((addr >> TPM_TIS_LOCALITY_SHIFT) & 0x7);
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
> +    return locty;
>  }
>
>
> --
> 2.36.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000030f44105dfd5b8f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 25, 2022 at 3:02 PM Stefa=
n Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
In tpm_tis_mmio_read(), tpm_tis_mmio_write() and<br>
tpm_tis_dump_state(), we calculate a locality index with<br>
tpm_tis_locality_from_addr() and then use it as an index into the<br>
s-&gt;loc[] array.=C2=A0 In all these cases, the array index can&#39;t over=
flow<br>
because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES &lt;&lt;<br>
TPM_TIS_LOCALITY_SHIFT bytes.=C2=A0 However, Coverity can&#39;t see that, a=
nd<br>
it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).<br>
<br>
Add an assertion to tpm_tis_locality_from_addr() that the calculated<br>
locality index is valid, which will help Coverity and also catch any<br>
potential future bug where the MemoryRegion isn&#39;t sized exactly.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com" t=
arget=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
---<br>
<br>
v2:<br>
=C2=A0 - Moved 3 asserts from 3 callsites of tpm_tis_locality_from_addr() i=
nto<br>
=C2=A0 =C2=A0 tpm_tis_locality_from_addr()<br>
---<br>
=C2=A0hw/tpm/tpm_tis_common.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c<br>
index e700d82181..503be2a541 100644<br>
--- a/hw/tpm/tpm_tis_common.c<br>
+++ b/hw/tpm/tpm_tis_common.c<br>
@@ -50,7 +50,12 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr a=
ddr,<br>
<br>
=C2=A0static uint8_t tpm_tis_locality_from_addr(hwaddr addr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (uint8_t)((addr &gt;&gt; TPM_TIS_LOCALITY_SHIFT) &amp=
; 0x7);<br>
+=C2=A0 =C2=A0 uint8_t locty;<br>
+<br>
+=C2=A0 =C2=A0 locty =3D (uint8_t)((addr &gt;&gt; TPM_TIS_LOCALITY_SHIFT) &=
amp; 0x7);<br>
+=C2=A0 =C2=A0 assert(TPM_TIS_IS_VALID_LOCTY(locty));<br>
+<br>
+=C2=A0 =C2=A0 return locty;<br>
=C2=A0}<br>
<br>
<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000030f44105dfd5b8f1--

