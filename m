Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF54CFC39
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:05:43 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBBO-0001s3-DQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRAi5-0004dO-M8; Mon, 07 Mar 2022 05:35:26 -0500
Received: from [2a00:1450:4864:20::334] (port=36463
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRAi2-0007x9-36; Mon, 07 Mar 2022 05:35:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h127-20020a1c2185000000b003898fc06f1eso125665wmh.1; 
 Mon, 07 Mar 2022 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAZw8WcPttI5xmtuhJmhhIQHpuJtr1CT1njg9FXf8M4=;
 b=D8rI7MHQ4Fp79amCmf3UwfNMyQ+Homd2t3wXtZ314gHpnKuMQhkbqy57QgHJHqpGpa
 C2lZXJIJqOxio/DMZYNYlzaBQnZdjQoI9x844oGWnWIfFi5G9A06IluADlZO6sOBlG2Q
 k1xn2nt1cTeHSocCDNrqYIYGvZFzbzGQvk43sYVc5SJ+5yPMdup4MgIpilAFM+U3vsje
 PRwrS8s1MIrXMjJlx/oXycUkJdcSP6aKVjs0FL2zQnxfOCCnu8QEOF99xyFNVX/xxxXy
 mQo83MveruXoPU1nATwTLtqnvoOcMSVuFcOYKt2EgVjYbOmTxQo41Y8q3YD6KwumqRDh
 Mb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAZw8WcPttI5xmtuhJmhhIQHpuJtr1CT1njg9FXf8M4=;
 b=pOUOppNcODEXwvDfKSd8AkUQcCbMkx5NGUmDAJnbxWMf6P0x5VZsr7GHnliOkV1gvD
 J7xUe8WKnjy4MFWkmRHzKFbZc7ON7DGm95rAi6r9Yzma9QUU+BBJFXsnrbsDzoG8w7Dr
 E71HSV0J+FWyB/iQK6vw5PeNmGdFlU3wpzwg9e7fG+b75ILzFZY180R2SXxOdOJ+P7/F
 TXqw2ruEkwUxuo53OYj3rlSNLODSYzyMUmTumBhHSBjChFt3irg9J61bioUtDb1P1LT+
 FrnUCr708h9DKgquPm4V+nzT+f4dXUWJzLn+wrjWbV/WhfyHCKWCL7EUG1kShFxHv3iA
 iwOQ==
X-Gm-Message-State: AOAM531xiLR/oGgdLdXh8NxbANaQGrUX9cl05ozxLVQZ+nQXa5UIYQAb
 02+CXhOg/g8XqISYjH/mE288BpKc1ldl5dHw7GU=
X-Google-Smtp-Source: ABdhPJysWYhBfygsM9UTQFbkVbtwtxkMDN+lSILeyd6TjyrZCKKE4rFBUpMZwnFD86hdxXVxCEX0HZgtrchDwNsNSnY=
X-Received: by 2002:a05:600c:2d06:b0:389:9d61:421 with SMTP id
 x6-20020a05600c2d0600b003899d610421mr6556496wmf.190.1646649314196; Mon, 07
 Mar 2022 02:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
 <20220304211618.3715999-5-marcandre.lureau@redhat.com>
 <CAMxuvaz_uCxtL+0e-=AFZsuomNAz6H7Y+6RbdkSzfbxcMSLGrg@mail.gmail.com>
 <960fea17-c5e7-fa6f-c185-8a892998cff7@vivier.eu>
In-Reply-To: <960fea17-c5e7-fa6f-c185-8a892998cff7@vivier.eu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 14:35:01 +0400
Message-ID: <CAJ+F1CLd+6Zkyr5MzZjhQN2uLjYMYxOJc3q2et+Stks3TqTw9Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] Replace qemu_gettimeofday() with g_get_real_time()
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000071418205d99e6bce"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000071418205d99e6bce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 7, 2022 at 2:13 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 05/03/2022 =C3=A0 20:17, Marc-Andr=C3=A9 Lureau a =C3=A9crit :
> > On Sat, Mar 5, 2022 at 1:18 AM <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> GLib g_get_real_time() is an alternative to gettimeofday() which allow=
s
> >> to simplify our code.
> >>
> >> For semihosting, a few bits are lost on POSIX host, but this shouldn't
> >> be a big concern.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> >> ---
> >>   blockdev.c                 |  8 ++++----
> >>   hw/rtc/m41t80.c            |  6 +++---
> >>   hw/virtio/virtio-balloon.c |  9 +--------
> >>   qapi/qmp-event.c           | 12 +++++-------
> >>   qemu-img.c                 |  8 ++++----
> >>   target/m68k/m68k-semi.c    | 22 ++++++++++------------
> >>   target/nios2/nios2-semi.c  | 23 ++++++++++-------------
> >>   7 files changed, 37 insertions(+), 51 deletions(-)
> >>
> ...
> >> index 19d3cd003833..025716b3ec37 100644
> >> --- a/qapi/qmp-event.c
> >> +++ b/qapi/qmp-event.c
> >> @@ -20,15 +20,13 @@
> >>
> >>   static void timestamp_put(QDict *qdict)
> >>   {
> >> -    int err;
> >>       QDict *ts;
> >> -    qemu_timeval tv;
> >> +    int64_t rt =3D g_get_real_time();
> >>
> >> -    err =3D qemu_gettimeofday(&tv);
> >> -    /* Put -1 to indicate failure of getting host time */
> >> -    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds'=
:
> %lld }",
> >> -                                 err < 0 ? -1LL : (long long)tv.tv_se=
c,
> >> -                                 err < 0 ? -1LL : (long
> long)tv.tv_usec);
> >> +    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
> >> +                                 ", 'microseconds': %" G_GINT64_FORMA=
T
> "}",
> >> +                                 rt / G_USEC_PER_SEC,
> >> +                                 rt % G_USEC_PER_SEC);
> >
> > NACK this, fixed in v3
>
> Why keeping the %lld is better than moving to %G_GINT64_FORMAT?
>
>
It's not supported by json-parser.c parse_interpolation(). We could address
this in a different patch.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000071418205d99e6bce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 2:13 PM Laur=
ent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 05/=
03/2022 =C3=A0 20:17, Marc-Andr=C3=A9 Lureau a =C3=A9crit=C2=A0:<br>
&gt; On Sat, Mar 5, 2022 at 1:18 AM &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; GLib g_get_real_time() is an alternative to gettimeofday() which a=
llows<br>
&gt;&gt; to simplify our code.<br>
&gt;&gt;<br>
&gt;&gt; For semihosting, a few bits are lost on POSIX host, but this shoul=
dn&#39;t<br>
&gt;&gt; be a big concern.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
&gt;&gt; Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.e=
u" target=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0blockdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;&gt;=C2=A0 =C2=A0hw/rtc/m41t80.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 6 +++---<br>
&gt;&gt;=C2=A0 =C2=A0hw/virtio/virtio-balloon.c |=C2=A0 9 +--------<br>
&gt;&gt;=C2=A0 =C2=A0qapi/qmp-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 12 +++++-------<br>
&gt;&gt;=C2=A0 =C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;&gt;=C2=A0 =C2=A0target/m68k/m68k-semi.c=C2=A0 =C2=A0 | 22 ++++++++++--=
----------<br>
&gt;&gt;=C2=A0 =C2=A0target/nios2/nios2-semi.c=C2=A0 | 23 ++++++++++-------=
------<br>
&gt;&gt;=C2=A0 =C2=A07 files changed, 37 insertions(+), 51 deletions(-)<br>
&gt;&gt;<br>
...<br>
&gt;&gt; index 19d3cd003833..025716b3ec37 100644<br>
&gt;&gt; --- a/qapi/qmp-event.c<br>
&gt;&gt; +++ b/qapi/qmp-event.c<br>
&gt;&gt; @@ -20,15 +20,13 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void timestamp_put(QDict *qdict)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; -=C2=A0 =C2=A0 int err;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QDict *ts;<br>
&gt;&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt;&gt; +=C2=A0 =C2=A0 int64_t rt =3D g_get_real_time();<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 err =3D qemu_gettimeofday(&amp;tv);<br>
&gt;&gt; -=C2=A0 =C2=A0 /* Put -1 to indicate failure of getting host time =
*/<br>
&gt;&gt; -=C2=A0 =C2=A0 ts =3D qdict_from_jsonf_nofail(&quot;{ &#39;seconds=
&#39;: %lld, &#39;microseconds&#39;: %lld }&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err &lt; 0 ? -1LL : =
(long long)tv.tv_sec,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err &lt; 0 ? -1LL : =
(long long)tv.tv_usec);<br>
&gt;&gt; +=C2=A0 =C2=A0 ts =3D qdict_from_jsonf_nofail(&quot;{ &#39;seconds=
&#39;: %&quot; G_GINT64_FORMAT<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, &#39;microse=
conds&#39;: %&quot; G_GINT64_FORMAT &quot;}&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rt / G_USEC_PER_SEC,=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rt % G_USEC_PER_SEC)=
;<br>
&gt; <br>
&gt; NACK this, fixed in v3<br>
<br>
Why keeping the %lld is better than moving to %G_GINT64_FORMAT?<br>
<br></blockquote><div><br></div>It&#39;s not supported by json-parser.c par=
se_interpolation(). We could address this in a different patch.<br clear=3D=
"all"></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000071418205d99e6bce--

