Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF22E5A7EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:26:55 +0200 (CEST)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNk7-0004Yr-13
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNdx-00006Q-PY
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:20:38 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNdv-0006OR-J7
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:20:33 -0400
Received: by mail-lf1-x12c.google.com with SMTP id p7so8793716lfu.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=86UyIQ4fk+5bWAB2z4Cy5OrtZmxY7Rpx7fs9PiVGevY=;
 b=EPDyvflHqjaJGSiSIWodee6tkFr5FFL8ClrzUFDBLRpV5tZPYt2xzfHJhxT82QlJIi
 //jxo0AIb/eQXW8IPQ1CAejQcQj+/c/rcalu37M+9D6Nv0mGp+xvyxy5oIre6W4lfeOg
 W2dH6/UqS7Q8nDqj73elD8I0ywwHcpHKozjKmC7k0bJrnGDL5TD5SjcLaZ8d0nLdytS9
 LE/fsHhfCw8u5xdKVPVX1Z+4QBzz5a/zcDGQK0/M4exiZn+Ps1gza7BaU0P6VDFyTULO
 /i5BIPcCxtbd2NSfjetoPx4c1t68T3fEsxkmtUEEOynzDFyhOZ31h00NXSdbcpUt1yf5
 Ed6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=86UyIQ4fk+5bWAB2z4Cy5OrtZmxY7Rpx7fs9PiVGevY=;
 b=3szKRsYxSzRfbRHese5cChSEVWxgDzpmOfl7+S2ZicxIgf3SRz/ZlRYvuGx1B8pUQi
 L0bmHIu6c24VdKrLy9ArM4XIlaemMoVteWSOCEDw8D+TONF5CB0sZKlavsJF4zteUbe8
 VtS8Q306Izpx/vxmbxDgl3mIP7ZZ5A7hB5b0NM77rQZC1THpcVp/qep/zSAi7wVBiFnr
 ma8sFC1XOudmoZo05o6SJFmCEzC86PsNlS4Uzx1yVgqBuLY+bo8Ed92CIvCI09TpVTgx
 E135kLy/2gH1FwgNFYk14wiB9EDtwwePPAGC1Lj/hZpNBPwFwgWWtVojVNKqV71BInzl
 60nw==
X-Gm-Message-State: ACgBeo0UHMP1Juf8DR8ScQ84yYCnu37Miw92xZbdGqNhB1A5SP6L7Uat
 xccUMkS5NWOOWMna0xWZZXtpffhFHtC48QqQseI=
X-Google-Smtp-Source: AA6agR5CHLzopjJoQXdoKZKLbfdw2YIk212zMhkJS3AOB/bhHfe5Bkwq/JXZA9B4GR+FAYYFUNP3K4ZiKxCBTV1WyZw=
X-Received: by 2002:a19:2d08:0:b0:494:62f3:fcc3 with SMTP id
 k8-20020a192d08000000b0049462f3fcc3mr5795336lfj.362.1661952028915; Wed, 31
 Aug 2022 06:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-15-bmeng.cn@gmail.com>
 <dc3c5917-e0bf-93a1-0538-563a720dcfc7@linux.ibm.com>
In-Reply-To: <dc3c5917-e0bf-93a1-0538-563a720dcfc7@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:20:17 +0400
Message-ID: <CAJ+F1CK-ZwOtPFzqFOh3DKpOfCKVAL0hnTuFxa3gtypu7mYN+w@mail.gmail.com>
Subject: Re: [PATCH 14/51] backends/tpm: Exclude headers and macros that don't
 exist on win32
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000051418805e7895cbf"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

--00000000000051418805e7895cbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 5:26 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:

>
>
> On 8/24/22 05:39, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > These headers and macros do not exist on Windows. Exclude them.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   backends/tpm/tpm_ioctl.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> > index bd6c12cb86..d67bf0283b 100644
> > --- a/backends/tpm/tpm_ioctl.h
> > +++ b/backends/tpm/tpm_ioctl.h
> > @@ -9,8 +9,10 @@
> >   #ifndef TPM_IOCTL_H
> >   #define TPM_IOCTL_H
> >
> > +#ifndef _WIN32
> >   #include <sys/uio.h>
> >   #include <sys/ioctl.h>
> > +#endif
> >
> >   #ifdef HAVE_SYS_IOCCOM_H
> >   #include <sys/ioccom.h>
> > @@ -222,6 +224,7 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
> >   #define PTM_CAP_SET_DATAFD         (1 << 12)
> >   #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
> >
> > +#ifndef _WIN32
> >   enum {
> >       PTM_GET_CAPABILITY     =3D _IOR('P', 0, ptm_cap),
> >       PTM_INIT               =3D _IOWR('P', 1, ptm_init),
> > @@ -241,6 +244,7 @@ enum {
> >       PTM_SET_DATAFD         =3D _IOR('P', 15, ptm_res),
> >       PTM_SET_BUFFERSIZE     =3D _IOWR('P', 16, ptm_setbuffersize),
> >   };
> > +#endif
> >
> >   /*
> >    * Commands used by the non-CUSE TPMs
>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>
>
I guess it would be worthy to make libtpms/swtpm work under windows too,
but this is a larger goal.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000051418805e7895cbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 5:26 PM Ste=
fan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 8/24/22 05:39, Bin Meng wrote:<br>
&gt; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D=
"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; <br>
&gt; These headers and macros do not exist on Windows. Exclude them.<br>
&gt; <br>
&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" =
target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0backends/tpm/tpm_ioctl.h | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h<br>
&gt; index bd6c12cb86..d67bf0283b 100644<br>
&gt; --- a/backends/tpm/tpm_ioctl.h<br>
&gt; +++ b/backends/tpm/tpm_ioctl.h<br>
&gt; @@ -9,8 +9,10 @@<br>
&gt;=C2=A0 =C2=A0#ifndef TPM_IOCTL_H<br>
&gt;=C2=A0 =C2=A0#define TPM_IOCTL_H<br>
&gt; <br>
&gt; +#ifndef _WIN32<br>
&gt;=C2=A0 =C2=A0#include &lt;sys/uio.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;sys/ioctl.h&gt;<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 =C2=A0#ifdef HAVE_SYS_IOCCOM_H<br>
&gt;=C2=A0 =C2=A0#include &lt;sys/ioccom.h&gt;<br>
&gt; @@ -222,6 +224,7 @@ typedef struct ptm_setbuffersize ptm_setbuffersize=
;<br>
&gt;=C2=A0 =C2=A0#define PTM_CAP_SET_DATAFD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; 12)<br>
&gt;=C2=A0 =C2=A0#define PTM_CAP_SET_BUFFERSIZE=C2=A0 =C2=A0 =C2=A0(1 &lt;&=
lt; 13)<br>
&gt; <br>
&gt; +#ifndef _WIN32<br>
&gt;=C2=A0 =C2=A0enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PTM_GET_CAPABILITY=C2=A0 =C2=A0 =C2=A0=3D _I=
OR(&#39;P&#39;, 0, ptm_cap),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PTM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D _IOWR(&#39;P&#39;, 1, ptm_init),<br>
&gt; @@ -241,6 +244,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PTM_SET_DATAFD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D _IOR(&#39;P&#39;, 15, ptm_res),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PTM_SET_BUFFERSIZE=C2=A0 =C2=A0 =C2=A0=3D _I=
OWR(&#39;P&#39;, 16, ptm_setbuffersize),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * Commands used by the non-CUSE TPMs<br>
<br>
Reviewed-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com" tar=
get=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br>
<br>
</blockquote></div><div><br></div><div>I guess it would be worthy to make l=
ibtpms/swtpm work under windows too, but this is a larger goal.</div><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br=
></div></div>

--00000000000051418805e7895cbf--

