Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9F478023
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:47:30 +0100 (CET)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzX7-0001du-Hh
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mxxlV-0006T4-EZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:54:13 -0500
Received: from [2a00:1450:4864:20::431] (port=42730
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mxxlT-0004ga-HE
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:54:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id c4so245640wrd.9
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 12:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8F1tGHHJn/8X1S7A3mjlZad7t1hOk6jVyBEfW6QX30=;
 b=bSBo9uQOdv66yCjsYPPbohmbIb29usAtWCK6r6Cm7Hf2o3WaCS8LIupfhfbN7zFRQt
 uJ9icqb+F2c+rHjGNn770OKIcpC1mJ4lOy+HtnJI2rPEof2u6RaGzhCmsNnswDO8INkc
 gVNF0HpQVF0qM6MwnnRHMXz5P0YHv9whVD/dP1ocztTfedsunzbNteBVXwRLCvKxa3lQ
 DqhaJ6j1dQ2snnpQwFGXMh/pFLq7/9UYzPEJv14zpyIo3NNC1n7q2NTI+oXJwEOOyXT2
 KHgot3rLdEGj+7kY3lGVupGNoqY28COyLZSDpNE5YWcH47xxEe9VYGDyv4x99LlPCBcx
 dd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8F1tGHHJn/8X1S7A3mjlZad7t1hOk6jVyBEfW6QX30=;
 b=0DrOJA0OJdT8xSv/v2juuW+wdaEPAOHOQn7WfF9i02qW8NRPI67puXlmaaUtzIbLYs
 IaW2RnvSKIuxH7HLauRxX7LRKef7XZQDWIVh5UOnPp5AEYD/O3M1bL7SrnHxFvqcu5qa
 qbREwQgx5o+ideAVwETpWE9LnRQrS3xcqYDPtKuR2WR+VNQuZOisCwdeyFAtJ+YV+eE2
 EyS2W3iZlNYx56ma+DXoioJGfa+PBIJ7wNt5Trk+xQDiYDSU8Fhfb730DWPribvjMl7Z
 POqNGU515Bm6UiZfn9fnxzbxz+/+uSRgxfUrkDTsyWE6nxXbGx5FihNnV+NrLb8aZw97
 dNjQ==
X-Gm-Message-State: AOAM532gsHFVf2kzIFk1D9DJm/gJe7ELiAlWB8ocJzuVrnJX6rN9e8rZ
 tPvvEMPYXXJAwgw0LR41WQi7L86vxQQXeOjknGg=
X-Google-Smtp-Source: ABdhPJyQBONS8ccc6AOV9xlFOcxR/wzkkgRbB+kR+/1XtyW+BPiMe5brhXH/RwfLecQ++s9mSUDYsYQ3qKyxTgZpDbA=
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr10917416wri.343.1639688047748; 
 Thu, 16 Dec 2021 12:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211013052214.stif2dodyueetm3p@sirius.home.kraxel.org>
In-Reply-To: <20211013052214.stif2dodyueetm3p@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Dec 2021 00:53:55 +0400
Message-ID: <CAJ+F1C+ByHUSshCcrXYf+sw1yRjV4+AzWYPk_=oMwyWoAV3v_A@mail.gmail.com>
Subject: Re: [PATCH v2 00/37] Add D-Bus display backend
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a0e77b05d3499f59"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a0e77b05d3499f59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Oct 13, 2021 at 9:23 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Sun, Oct 10, 2021 at 01:08:01AM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Both Spice and VNC are relatively complex and inefficient for local-onl=
y
> > display/console export.
> >
> > The goal of this display backend is to export over D-Bus an interface
> close to
> > the QEMU internal APIs. Any -display or -audio backend should be
> possible to
> > implement externally that way. It will allow third-parties to maintain
> their own
> > backends (UI toolkits, servers etc), and eventually reduce the
> responsability on
> > QEMU.
> >
> > D-Bus is the protocol of choice for the desktop, it has many convenient
> bindings
> > for various languages and tools. Data blob transfer is more efficient
> than QMP
> > too. Backends can come and go as needed: you can have several display
> opened
> > (say Boxes & virt-manager), while exporting the display over VNC for
> example
> > from a different process. It works best on Unix, but there is some
> Windows
> > support too (even Windows has some AF_UNIX nowadays, and the WSL2
> situation may
> > change the future of QEMU on Windows anyway).
> >
> > Using it only requires "-display dbus" on any reasonable Linux desktop
> with a
> > D-Bus session bus. Then you use can use busctl, d-feet or gdbus, ex:
> > $ gdbus introspect --session -r -d org.qemu -o /
> >
> > See the different patches and documentation for further options. The
> p2p=3Don mode
> > should also allow users running bus-less (on MacOS for ex). We can also
> add TCP
> > socket if needed (although more work would be needed in this case to
> replace
> > the FD-passing with some extra TCP listening socket).
>
> Wow.  That series got a lot of fine tuning.  The patches look all good
> to me.
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>

I have rebased the series and added your acked-by (
https://gitlab.com/marcandre.lureau/qemu/-/tree/dbus)

The client side is still in development. However, the libvirt series is in
shape (
https://patchew.org/Libvirt/20211202142411.1718032-1-marcandre.lureau@redha=
t.com/),
waiting for QEMU side to land.

Should I make a PR or ask for more reviews? Since this is fairly long to
review but quite independent from existing code, I think sending a PR is
reasonable wdyt?


> > A WIP Rust/Gtk4 client and VNC server is:
> https://gitlab.com/marcandre.lureau/qemu-display/
> > (check README.md for details, then `cargo run` should connect to QEMU)
>
> Hmm, that wants rather cutting edge versions, stock Fedora 34 isn't new
> enough to build it.  And I don't feel like updating to Fedora 35 beta
> for that.  So unfortunately I couldn't easily test it, but I'd love to
> see that live in action.
>
> Is it possible to keep the client running while starting and stopping
> qemu (comparable to "virt-viewer --wait --reconnect" behaviour)?
>
>
That's doable. I just added a --wait option to the demo client.

For reconnect to work, we would need a better way to track name ownership
changes (connection and disconnections) in zbus. I am working on it.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a0e77b05d3499f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 9:23 AM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxe=
l@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Sun, Oct 10, 2021 at 01:08:01AM +0400, <a href=3D"mailto:mar=
candre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>=
 wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; Both Spice and VNC are relatively complex and inefficient for local-on=
ly<br>
&gt; display/console export.<br>
&gt; <br>
&gt; The goal of this display backend is to export over D-Bus an interface =
close to<br>
&gt; the QEMU internal APIs. Any -display or -audio backend should be possi=
ble to<br>
&gt; implement externally that way. It will allow third-parties to maintain=
 their own<br>
&gt; backends (UI toolkits, servers etc), and eventually reduce the respons=
ability on<br>
&gt; QEMU.<br>
&gt; <br>
&gt; D-Bus is the protocol of choice for the desktop, it has many convenien=
t bindings<br>
&gt; for various languages and tools. Data blob transfer is more efficient =
than QMP<br>
&gt; too. Backends can come and go as needed: you can have several display =
opened<br>
&gt; (say Boxes &amp; virt-manager), while exporting the display over VNC f=
or example<br>
&gt; from a different process. It works best on Unix, but there is some Win=
dows<br>
&gt; support too (even Windows has some AF_UNIX nowadays, and the WSL2 situ=
ation may<br>
&gt; change the future of QEMU on Windows anyway).<br>
&gt; <br>
&gt; Using it only requires &quot;-display dbus&quot; on any reasonable Lin=
ux desktop with a<br>
&gt; D-Bus session bus. Then you use can use busctl, d-feet or gdbus, ex:<b=
r>
&gt; $ gdbus introspect --session -r -d org.qemu -o /<br>
&gt; <br>
&gt; See the different patches and documentation for further options. The p=
2p=3Don mode<br>
&gt; should also allow users running bus-less (on MacOS for ex). We can als=
o add TCP<br>
&gt; socket if needed (although more work would be needed in this case to r=
eplace<br>
&gt; the FD-passing with some extra TCP listening socket).<br>
<br>
Wow.=C2=A0 That series got a lot of fine tuning.=C2=A0 The patches look all=
 good<br>
to me.<br>
<br>
Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"=
_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>I hav=
e rebased the series and added your acked-by (<a href=3D"https://gitlab.com=
/marcandre.lureau/qemu/-/tree/dbus" target=3D"_blank">https://gitlab.com/ma=
rcandre.lureau/qemu/-/tree/dbus</a>)</div><div><br></div><div>The client si=
de is still in development. However, the libvirt series is in shape (<a hre=
f=3D"https://patchew.org/Libvirt/20211202142411.1718032-1-marcandre.lureau@=
redhat.com/" target=3D"_blank">https://patchew.org/Libvirt/20211202142411.1=
718032-1-marcandre.lureau@redhat.com/</a>), waiting for QEMU side to land.<=
br></div><div><br></div><div>Should I make a PR or ask for more reviews? Si=
nce this is fairly long to review but quite independent from existing code,=
 I think sending a PR is reasonable wdyt?<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; A WIP Rust/Gtk4 client and VNC server is: <a href=3D"https://gitlab.co=
m/marcandre.lureau/qemu-display/" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.com/marcandre.lureau/qemu-display/</a><br>
&gt; (check README.md for details, then `cargo run` should connect to QEMU)=
<br>
<br>
Hmm, that wants rather cutting edge versions, stock Fedora 34 isn&#39;t new=
<br>
enough to build it.=C2=A0 And I don&#39;t feel like updating to Fedora 35 b=
eta<br>
for that.=C2=A0 So unfortunately I couldn&#39;t easily test it, but I&#39;d=
 love to<br>
see that live in action.<br>
<br>
Is it possible to keep the client running while starting and stopping<br>
qemu (comparable to &quot;virt-viewer --wait --reconnect&quot; behaviour)?<=
br clear=3D"all"><br></blockquote><div><br></div><div>That&#39;s doable. I =
just added a --wait option to the demo client.</div><div><br></div><div>For=
 reconnect to work, we would need a better way to track name ownership chan=
ges (connection and disconnections) in zbus. I am working on it.</div><div>=
<br></div>thanks<br></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lurea=
u<br></div></div>

--000000000000a0e77b05d3499f59--

