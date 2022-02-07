Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5B4AC14C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:34:11 +0100 (CET)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH55m-0005f6-2q
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH4qr-0006g2-Ou
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:18:46 -0500
Received: from [2a00:1450:4864:20::233] (port=41781
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH4qp-0004tS-FG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:18:44 -0500
Received: by mail-lj1-x233.google.com with SMTP id t14so19806361ljh.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AoRrIh2y8WK9w8PsZGjH4lTZy9wQDEb/tN8N51IxQrA=;
 b=H6L+3BWF5m2Ykj9v9q0r7uXJmLKXPAgUP2ZOAA0OiUZ9MdGcpf4FCgj3uXNOno85Re
 97vNtJTt+QJATuEAps5RviQFheUdMSbtCmcZ0Gl/5v3vq6O+A2HCYlm5xtS/9E2yAwqk
 Ta/Sf0kbO888o3E0TfH85vZlqVKFOkX2dAKN8+OmUceQgPb5xJGEk3vfwZoNzrNTV9Vk
 5FdGLlbG0ncgENV1u8wAxFa5ixHoUzyaCNFJE+W79241iGHYYcrGKiDlvPXEzC4vVZ+e
 i5M9Y1MClYyGoxNhHHY7f6J9O3wxFEveFMZiLBg2uVcDlSROpRiEB815w7qxAqEX/WI1
 csXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoRrIh2y8WK9w8PsZGjH4lTZy9wQDEb/tN8N51IxQrA=;
 b=bxDcRwp2P0VS+8MstrNpiB9edvm6xopTfQCyzveUuqN3vUS7GnH3PfLJiBBGqdbqrV
 9cbgRi/OCdFEIUqV1fAPxrKfscDjknVeCzIPo5ArN2lebM8rSdHKzlJiS9O7OUkUJoga
 Z7YjNsI4rz3cmXKHOVJdmku1/pQxXgTBvcxsfi2/yIFMxgEoTXVAs7g9jLRjNtxdkVDG
 mWdAWyBoB5ESmfvJm1Afz6sbMpOPGoY+8s/nD0DPhGcNkfUmMXhxD1t7k81kOu/tTuBI
 pm5qgO4pTdpb/CpYgDBXnrEoO2Nao+gV1Lwl7EHhpC5JjfAw4FUmTqE37xoktkM2M8rf
 tL5w==
X-Gm-Message-State: AOAM532Mow5V2a54RKh+hiQt2b7RPqTkB8f7VyRaeOliUaREFToeOIKs
 dyAbu8yISojWkzDibPmA5ZRo6OcuXwdgIaPptfY=
X-Google-Smtp-Source: ABdhPJzkQ5DxVwvfnIJgSauMFVB/mEjsO2ueBPuR5X37lU7lPTR1WfanWnY1OvmPdUno2bTDY1PPa9ZYlv5gNNR3gj8=
X-Received: by 2002:a05:651c:178e:: with SMTP id
 bn14mr9175106ljb.12.1644243521196; 
 Mon, 07 Feb 2022 06:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
 <CAB26zV2sx-9PGhk5Rbz-q+sQJ8yxqOOO32J_k5vb7_sPNgFBnQ@mail.gmail.com>
 <39149990.XXmQAQaIKb@silver>
In-Reply-To: <39149990.XXmQAQaIKb@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 09:18:29 -0500
Message-ID: <CAB26zV26ggct7Tsa5=9vg-5_Z+Dbne07NEzUKNtMFpd8aH-TPA@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000015df705d76e47fb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000015df705d76e47fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 9:15 AM Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
wrote:

> On Montag, 7. Februar 2022 02:05:32 CET Will Cohen wrote:
> > On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> >
> > wrote:
> > > On 6/2/22 21:07, Will Cohen wrote:
> > > > From: Keno Fischer <keno@juliacomputing.com>
> > > >
> > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > [Michael Roitzsch: - Rebase for NixOS]
> > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > [Will Cohen: - Rebase to master]
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > ---
> > > >
> > > >   fsdev/meson.build |  1 +
> > > >   meson.build       | 14 ++++++++++----
> > > >   2 files changed, 11 insertions(+), 4 deletions(-)
> > > >
> > > > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > > > +have_virtfs_proxy_helper =3D targetos =3D=3D 'linux' and have_virt=
fs and
> > >
> > > have_tools
> > >
> > > Why do you restrict the proxy-helper to Linux?
> >
> > Only because porting the proxy-helper to macOS is outside the scope of
> this
> > particular patch. While some initial concepts around it have been
> > considered by some of the contributors to this patch, those
> implementations
> > weren't tested enough and the security implications weren't considered =
in
> > full. We assume that this could be an additional implementation later o=
n,
> > if the functionality is considered important down the road.
>
> In general that's fine with me. I would have probably made that
> "targetos !=3D 'darwin'" instead of "targetos =3D=3D 'linux'", but I leav=
e that
> up
> to you.
>
> On the long term we will probably deprecate the 9p 'proxy' fs driver
> anyway.
> While it had some good ideas, being realistic though: nobody has worked o=
n
> the
> 9p proxy driver/backend for many years and it is not in good shape.
>
> I can imagine that due to the ground being laid by these series, that we
> will
> also open 9p for BSD, but that should be done a bit later and hence does
> not
> belong into these series.
>
> But once again: it would not have hurt to make your intentions clear
> either in
> the commit log or by in-source comment. :)
>
> Best regards,
> Christian Schoenebeck
>
>
>
Acknowledged! For v5 will change it to !=3D 'darwin' and note it as well, f=
or
clarity.

--000000000000015df705d76e47fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:15 AM Christ=
ian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crud=
ebyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Montag, 7. Februar 2022 02:05:32 CET Will Cohen wrote:<br>
&gt; On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; <br>
&gt; wrote:<br>
&gt; &gt; On 6/2/22 21:07, Will Cohen wrote:<br>
&gt; &gt; &gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing=
.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@julia=
computing.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; &gt; &gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reacto=
rcontrol@icloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br=
>
&gt; &gt; &gt; [Will Cohen: - Rebase to master]<br>
&gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; &gt; &gt; [Will Cohen: - Add check for pthread_fchdir_np to virtfs]<br=
>
&gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0fsdev/meson.build |=C2=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++=
+++++----<br>
&gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 11 insertions(+), 4 deletions(-=
)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -have_virtfs_proxy_helper =3D have_virtfs and have_tools<br>
&gt; &gt; &gt; +have_virtfs_proxy_helper =3D targetos =3D=3D &#39;linux&#39=
; and have_virtfs and<br>
&gt; &gt; <br>
&gt; &gt; have_tools<br>
&gt; &gt; <br>
&gt; &gt; Why do you restrict the proxy-helper to Linux?<br>
&gt;<br>
&gt; Only because porting the proxy-helper to macOS is outside the scope of=
 this<br>
&gt; particular patch. While some initial concepts around it have been<br>
&gt; considered by some of the contributors to this patch, those implementa=
tions<br>
&gt; weren&#39;t tested enough and the security implications weren&#39;t co=
nsidered in<br>
&gt; full. We assume that this could be an additional implementation later =
on,<br>
&gt; if the functionality is considered important down the road.<br>
<br>
In general that&#39;s fine with me. I would have probably made that<br>
&quot;targetos !=3D &#39;darwin&#39;&quot; instead of &quot;targetos =3D=3D=
 &#39;linux&#39;&quot;, but I leave that up <br>
to you.<br>
<br>
On the long term we will probably deprecate the 9p &#39;proxy&#39; fs drive=
r anyway. <br>
While it had some good ideas, being realistic though: nobody has worked on =
the <br>
9p proxy driver/backend for many years and it is not in good shape.<br>
<br>
I can imagine that due to the ground being laid by these series, that we wi=
ll <br>
also open 9p for BSD, but that should be done a bit later and hence does no=
t <br>
belong into these series.<br>
<br>
But once again: it would not have hurt to make your intentions clear either=
 in <br>
the commit log or by in-source comment. :)<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br></blockquote><div><br></div><div>Acknowledged! For v5 will change it to=
 !=3D &#39;darwin&#39; and note it as well, for clarity. <br></div></div></=
div>

--000000000000015df705d76e47fb--

