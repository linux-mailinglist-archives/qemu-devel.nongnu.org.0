Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5821E44E2F3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 09:25:41 +0100 (CET)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlRsR-0001My-VQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 03:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlRrJ-0000RC-RT; Fri, 12 Nov 2021 03:24:29 -0500
Received: from [2a00:1450:4864:20::336] (port=38795
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlRrA-0002Ap-QR; Fri, 12 Nov 2021 03:24:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso6330315wms.3; 
 Fri, 12 Nov 2021 00:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySXIAb0bIYUZkIOoYRZhUg69q5GCKabGEtjERHa6NJM=;
 b=YkaSTi6Kb2lv4FWADMp3m8wLwQp+MNdlHG2RWLlJj9iOdEptXBVE/bDNlnaCihp+4T
 GG1X35v4pKLvM/PVuM2KOlAR7jIXfR9p5bA3whBxd7podHpqcQstNABMTzkQZlInl+6A
 5/Yof1BDDbqHJMRkxvYCljXOhIZtKG9DJKi2fMZ4mUIFEjergFziIukbT8TkUDqnU/Bo
 /c3ME8/TjmsRN9jWtSCvZDh+Ckghbxv283tLnEKZDTHpICyMHk2exGzjUfDuX4rniqjU
 xvVYbLkFB8hpAm8NaZiLBuphyNO/SR6hh6A8b/qQ3RlnsVCPc1b04DPb72FScFxSroli
 Gd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySXIAb0bIYUZkIOoYRZhUg69q5GCKabGEtjERHa6NJM=;
 b=7UtmtJkm4jvGn0YGH33EM8H8O7kTDiUSGLlrDtr7ud8aSS5Gq3oNqz/Xnh9EKBa6fH
 ynbg2eZzO4yTBWzkEONSyiH5fHQxabinLtCK7OhnUl7O7oDBevSd6rsh40x0mkKFXbWy
 SKKSxsrKCwRIS99fo0zBtr/EBpxxV1UX+7O5ZA/q/+jVI3wDmQmwl3CS2fC3R3NbuGxz
 VB7b8nfQ/SLQAMAxqcifk4IdEq49AW2/gtbD4Lw7ueqon5Adrb1BRAGM3PxTkIdSkyTU
 A+53PLUQxU01LWBBDJnjGC9QEAidBEJrK/6bCNYPMOZizZyxPXNOnRlekHhi10Fxu9mh
 uAIw==
X-Gm-Message-State: AOAM530+KAtyZODeOTtlUU1YCgvvjhW751yBghFMYg/nHY57XT3hRF25
 n3F8Hb4MiyxIiauKHLbYu7NnybrAsuPsLB5x4x4=
X-Google-Smtp-Source: ABdhPJxa9N9aDkTdLKWXKPjClWAVoF5FEXbEoCb2YIZDtjESdHnLi7T0G/liD2Ml7kmncMorDgUqHcxQ+/5ewvbilPU=
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr15786595wms.96.1636705458541; 
 Fri, 12 Nov 2021 00:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-5-rvkagan@yandex-team.ru>
In-Reply-To: <20211111153354.18807-5-rvkagan@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Nov 2021 12:24:06 +0400
Message-ID: <CAJ+F1CKmAR9K6_HRr66+rTxzBVUTbw+GNJ22tByuLyx+CHYfVw@mail.gmail.com>
Subject: Re: [PATCH 04/10] chardev/char-fe: don't allow EAGAIN from blocking
 read
To: Roman Kagan <rvkagan@yandex-team.ru>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007559eb05d0932fe6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007559eb05d0932fe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 11, 2021 at 7:44 PM Roman Kagan <rvkagan@yandex-team.ru> wrote:

> As its name suggests, ChardevClass.chr_sync_read is supposed to do a
> blocking read.  The only implementation of it, tcp_chr_sync_read, does
> set the underlying io channel to the blocking mode indeed.
>
> Therefore a failure return with EAGAIN is not expected from this call.
>
> So do not retry it in qemu_chr_fe_read_all; instead place an assertion
> that it doesn't fail with EAGAIN.
>

The code was introduced in :
commit 7b0bfdf52d694c9a3a96505aa42ce3f8d63acd35
Author: Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>
Date:   Tue May 27 15:03:48 2014 +0300

    Add chardev API qemu_chr_fe_read_all

Also touched later by Daniel in:
commit 53628efbc8aa7a7ab5354d24b971f4d69452151d
Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Date:   Thu Mar 31 16:29:27 2016 +0100

    char: fix broken EAGAIN retry on OS-X due to errno clobbering



> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  chardev/char-fe.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/chardev/char-fe.c b/chardev/char-fe.c
> index 7789f7be9c..f94efe928e 100644
> --- a/chardev/char-fe.c
> +++ b/chardev/char-fe.c
> @@ -68,13 +68,10 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t
> *buf, int len)
>      }
>
>      while (offset < len) {
> -    retry:
>          res =3D CHARDEV_GET_CLASS(s)->chr_sync_read(s, buf + offset,
>                                                    len - offset);
> -        if (res =3D=3D -1 && errno =3D=3D EAGAIN) {
> -            g_usleep(100);
> -            goto retry;
> -        }
> +        /* ->chr_sync_read should block */
> +        assert(!(res < 0 && errno =3D=3D EAGAIN));
>
>
While I agree with the rationale to clean this code a bit, I am not so sure
about replacing it with an assert(). In the past, when we did such things
we had unexpected regressions :)

A slightly better approach perhaps is g_warn_if_fail(), although it's not
very popular in qemu.



>          if (res =3D=3D 0) {
>              break;
> --
> 2.33.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007559eb05d0932fe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 11, 2021 at 7:44 PM Rom=
an Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru">rvkagan@yandex-team.=
ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">As its name suggests, ChardevClass.chr_sync_read is supposed to do a<br>
blocking read.=C2=A0 The only implementation of it, tcp_chr_sync_read, does=
<br>
set the underlying io channel to the blocking mode indeed.<br>
<br>
Therefore a failure return with EAGAIN is not expected from this call.<br>
<br>
So do not retry it in qemu_chr_fe_read_all; instead place an assertion<br>
that it doesn&#39;t fail with EAGAIN.<br></blockquote><div><br></div><div>T=
he code was introduced in :<br></div><div>commit 7b0bfdf52d694c9a3a96505aa4=
2ce3f8d63acd35<br>Author: Nikolay Nikolaev &lt;<a href=3D"mailto:n.nikolaev=
@virtualopensystems.com">n.nikolaev@virtualopensystems.com</a>&gt;<br>Date:=
 =C2=A0 Tue May 27 15:03:48 2014 +0300<br><br>=C2=A0 =C2=A0 Add chardev API=
 qemu_chr_fe_read_all</div><div><br></div><div>Also touched later by Daniel=
 in:</div><div>commit 53628efbc8aa7a7ab5354d24b971f4d69452151d<br>Author: D=
aniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@=
redhat.com</a>&gt;<br>Date: =C2=A0 Thu Mar 31 16:29:27 2016 +0100<br><br>=
=C2=A0 =C2=A0 char: fix broken EAGAIN retry on OS-X due to errno clobbering=
</div><div><br></div><div><br> </div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Signed-off-by: Roman Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru" ta=
rget=3D"_blank">rvkagan@yandex-team.ru</a>&gt;<br>
---<br>
=C2=A0chardev/char-fe.c | 7 ++-----<br>
=C2=A01 file changed, 2 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/chardev/char-fe.c b/chardev/char-fe.c<br>
index 7789f7be9c..f94efe928e 100644<br>
--- a/chardev/char-fe.c<br>
+++ b/chardev/char-fe.c<br>
@@ -68,13 +68,10 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf,=
 int len)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (offset &lt; len) {<br>
-=C2=A0 =C2=A0 retry:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D CHARDEV_GET_CLASS(s)-&gt;chr_sync=
_read(s, buf + offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len - offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D -1 &amp;&amp; errno =3D=3D EAGA=
IN) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_usleep(100);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto retry;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* -&gt;chr_sync_read should block */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!(res &lt; 0 &amp;&amp; errno =3D=3D EA=
GAIN));<br>
<br></blockquote><div><br></div><div>While I agree with the rationale to cl=
ean this code a bit, I am not so sure about replacing it with an assert(). =
In the past, when we did such things we had unexpected regressions :)</div>=
<div><br></div><div>A slightly better approach perhaps is g_warn_if_fail(),=
 although it&#39;s not very popular in qemu.<br></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007559eb05d0932fe6--

