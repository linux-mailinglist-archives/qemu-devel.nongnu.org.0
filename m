Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9B3FC7B5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:58:36 +0200 (CEST)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3LX-0008VI-DX
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2y3-0007Pt-2C
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:34:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2y1-0003tZ-6J
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:34:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id j13so21205159edv.13
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DyeuXR5mbs9NMH3lqJAd5qzM/+0spkEgo/gmyT98bE=;
 b=t9PCZ5jshKvVYJZHeclGzXqS6R1pmGJCH+vtzYsSlTDf0kPKQV3ZnGpx3/sRcddvGi
 xo5RfvcQe/mZZZ6kTEvlTbEDSq47YnA6SIknCGW81T8RVTQhGTeysNW58MiNA14A0RaG
 RK0e3TeAQ8EskQLDXlqTQWT0BogtWac/6CKp4XSM2VZ6h+Ui2uDDxS3AX6vsw+8LKC5A
 VweFmZa9JNO8dz409JGMLgSeyWr8LnsN71xmgHiM5kK6g3gaoYPjQQDYxXzrXQaT0FV1
 eQFXuxFRef45aq3HyMgBBJEKnZsfFywEDmvoiXMFrNx986lZgL/V4Akz0Z4unNH6Z+e8
 A1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DyeuXR5mbs9NMH3lqJAd5qzM/+0spkEgo/gmyT98bE=;
 b=ahjf5pO/jwnda/N7JDOuMqoYAs0s/qhB16mAJIhnXOP9MkoGQX78RF9murZFmXuD/h
 B+tpMxQDXZBHq9uC38Fs2d8XZbhA64jKmcAQWwq2SpyqHvivMSgqFJO9X2RDk+d7aQDi
 hYU4e08NnUWeXlLOcz50XQY4YPcV4uVrUft9ebidfZ3zMuR049dIEF39vcLg6rnIDO6/
 5PLmqwmFWgL61JmErTiOGzyApH8w+9YwikwxKZPB8UL5AJ+CIHohafIE5RrtNTPTy/mV
 gq6BNvCiy5YWQB2B0+Hq7EEGKWFGqLkljsFFnsmv4uswan/i9ttRxiact2Syv3yVQTwF
 +1gg==
X-Gm-Message-State: AOAM530gkDKAk8cZT+DSB1XhaOeQKRS69XcV6RyLEEI+HGhkUM2vhU1U
 4kM7li0IANvjnFMsv4LZFI2GoUvpfIxw9trwnMQ5R0ZCuTk=
X-Google-Smtp-Source: ABdhPJzFyKy2tVvtQnzAuAJyhj56/A9CR3AsmoFOjAkqjXE+OKwADFykitF/STK0fkURjGjsvWJ3vL4ePH6BB8Wqulc=
X-Received: by 2002:aa7:d9d3:: with SMTP id v19mr29732842eds.257.1630413255685; 
 Tue, 31 Aug 2021 05:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
 <CAJ+F1C+sFJaHbg5bP+cqH6Dg=XfX9k-BKfFqEDSw3OMNcPen9w@mail.gmail.com>
 <20210831123001.jnot6uohtdeaobgt@sirius.home.kraxel.org>
In-Reply-To: <20210831123001.jnot6uohtdeaobgt@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Aug 2021 16:34:03 +0400
Message-ID: <CAJ+F1CJeueLyTjBuS6s8PgtS+Mh=gWY3wq45EZ=+_92Ddq+GjQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] Clipboard fixes (for 6.1?)
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f1381405cada2a12"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1381405cada2a12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 31, 2021 at 4:30 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > Marc-Andr=C3=A9 Lureau (18):
> > >   ui/vdagent: fix leak on error path
> > >   ui/vdagent: remove copy-pasta comment
> > >   ui/gtk-clipboard: use existing macros
> > >   ui/gtk-clipboard: fix clipboard enum typo
> > >   ui/clipboard: add helper to retrieve current clipboard
> > >   ui/clipboard: add qemu_clipboard_peer_owns() helper
> > >   ui/clipboard: add qemu_clipboard_peer_release() helper
> > >   ui/clipboard: release owned grabs on unregister
> > >   ui/vdagent: disconnect handlers and reset state on finalize
> > >   ui/vdagent: reset outbuf on disconnect
> > >   ui/vdagent: split clipboard recv message handling
> > >   ui/vdagent: use qemu_clipboard_peer_release helper
> > >   ui/vdagent: use qemu_clipboard_info helper
> > >   ui/vdagent: send empty clipboard when unhandled
> > >   ui/gtk-clipboard: use qemu_clipboard_info helper
> > >   ui/vdagent: send release when no clipboard owner
> > >   ui/gtk-clipboard: emit release clipboard events
> > >   ui/vdagent: add a migration blocker
>
> Looks all sane to me.
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
>
thanks

> Ping
> >
> > Since Gerd is lowering his maintainer responsibilities, is anyone else
> > interested?
>
> Don't be shy, send a pull request?
>

Ok!


--=20
Marc-Andr=C3=A9 Lureau

--000000000000f1381405cada2a12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 4:30 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi,<br>
<br>
&gt; &gt; Marc-Andr=C3=A9 Lureau (18):<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: fix leak on error path<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: remove copy-pasta comment<br>
&gt; &gt;=C2=A0 =C2=A0ui/gtk-clipboard: use existing macros<br>
&gt; &gt;=C2=A0 =C2=A0ui/gtk-clipboard: fix clipboard enum typo<br>
&gt; &gt;=C2=A0 =C2=A0ui/clipboard: add helper to retrieve current clipboar=
d<br>
&gt; &gt;=C2=A0 =C2=A0ui/clipboard: add qemu_clipboard_peer_owns() helper<b=
r>
&gt; &gt;=C2=A0 =C2=A0ui/clipboard: add qemu_clipboard_peer_release() helpe=
r<br>
&gt; &gt;=C2=A0 =C2=A0ui/clipboard: release owned grabs on unregister<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: disconnect handlers and reset state on fi=
nalize<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: reset outbuf on disconnect<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: split clipboard recv message handling<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: use qemu_clipboard_peer_release helper<br=
>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: use qemu_clipboard_info helper<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: send empty clipboard when unhandled<br>
&gt; &gt;=C2=A0 =C2=A0ui/gtk-clipboard: use qemu_clipboard_info helper<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: send release when no clipboard owner<br>
&gt; &gt;=C2=A0 =C2=A0ui/gtk-clipboard: emit release clipboard events<br>
&gt; &gt;=C2=A0 =C2=A0ui/vdagent: add a migration blocker<br>
<br>
Looks all sane to me.<br>
<br>
Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"=
_blank">kraxel@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>thanks</div><div> <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt; Ping<br>
&gt; <br>
&gt; Since Gerd is lowering his maintainer responsibilities, is anyone else=
<br>
&gt; interested?<br>
<br>
Don&#39;t be shy, send a pull request?<br></blockquote><div><br></div><div>=
Ok! <br></div><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f1381405cada2a12--

