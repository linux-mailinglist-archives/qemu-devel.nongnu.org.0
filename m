Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F73F99A5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:51 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbpl-0007ZG-RZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJboF-0006rw-Lg
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:22:15 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJboD-0008B1-CY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:22:15 -0400
Received: by mail-ej1-x632.google.com with SMTP id bt14so13825341ejb.3
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AJq6Ujy2eOwY4Ado6FRm2/JiOIMq637T8n4VcXvLw4=;
 b=hcirLzvddyevW1IdcdfXBT/5ld2gsFE104FkV4OdKzg+M9bkvO5Y0YNeGfU74t0X5X
 QdcfeNABWTsic0059lbB4fHEj0fyQwCkmCX1R7CMtITWmqXkidPfVnzLC8E/QmayYTVP
 6AbtBR7yVEHu22JkTFvsx06uDTEeQjUcWD+HyKnfKuTwavXMfFD4wnVRMHcpfXHoaur4
 oqsw79FIcUEp6AZKedmxSwryT23xY+RXyiLEXNEjSdFLbNjy8LC3K6W29InclYmY7H3z
 OyILOhk/HAmTARyXTKbVpLn6cVymm03EjEvz5NT+CW4SOKFhbI9UYPq9CimJQXFjIHuj
 g3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AJq6Ujy2eOwY4Ado6FRm2/JiOIMq637T8n4VcXvLw4=;
 b=M/DcbM5XwRrTtCjrnQDuamuI83gj5aUf6CXwtzVT6t8eKiffeHqyfAet2h3nNdcXYB
 ep/pwXsD5CpyGjQjcy7TLaJMOCann0nWXzo3znsf5Tzv9X8ruojnM0cjfXZEVr1rZG6f
 W5i+q7imRDVwzujs9TAJtuqt1g1aJwObpFJ6H8MCE3imkZGidVfGjRQfQB94VSW23W2s
 TxH0sa8+yhBM6eoCIIdY/0b5eHaxUN3yvwYSDv+eUusx0cocSebLxjqCyN7o38TgnR9W
 SJjtPasrc7TK5q456DOLzxIw8npobrwQfyRs1psgYZU4hhGnH4rSTwviRUcaUUkVYr9C
 0nrg==
X-Gm-Message-State: AOAM531pwvf3PujMNLK+GUdWSIFXwjDtVjgmRqBoGZXtkBiL9KJRHDxf
 ffWUtZvPhBzKyDCAmELYyNHeGix1fOy2HzpYFxUc8yII5rk=
X-Google-Smtp-Source: ABdhPJxDthmniqTABekt/kQBrlDHg+/CrhXZAaESwkmuLnLcQifo7PAJW2Mdb6+oaNFkZEWnw2BgWUA1Bb1EcGBa/20=
X-Received: by 2002:a17:906:4a8e:: with SMTP id
 x14mr10094088eju.389.1630070531355; 
 Fri, 27 Aug 2021 06:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 27 Aug 2021 17:21:59 +0400
Message-ID: <CAJ+F1C+sFJaHbg5bP+cqH6Dg=XfX9k-BKfFqEDSw3OMNcPen9w@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] Clipboard fixes (for 6.1?)
To: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000faf6bc05ca8a5e0a"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000faf6bc05ca8a5e0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 5, 2021 at 5:59 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Here is a few fixes I have collected while working on clipboard-related
> code.
>
> There are some obvious code improvements/fixes, and better handling of
> release &
> unregister to avoid dangling pointers and improve user experience.
>
> v3:
>  - add a migration blocker
>  - improve the code by using a few helpers
>
> v2:
>  - replaced "ui/vdagent: unregister clipboard peer on finalize" with
> "ui/vdagent: disconnect handlers and reset state on finalize" patch.
>  - added "ui/vdagent: reset outbuf on disconnect"
>  - commit message tweaks
>
> Marc-Andr=C3=A9 Lureau (18):
>   ui/vdagent: fix leak on error path
>   ui/vdagent: remove copy-pasta comment
>   ui/gtk-clipboard: use existing macros
>   ui/gtk-clipboard: fix clipboard enum typo
>   ui/clipboard: add helper to retrieve current clipboard
>   ui/clipboard: add qemu_clipboard_peer_owns() helper
>   ui/clipboard: add qemu_clipboard_peer_release() helper
>   ui/clipboard: release owned grabs on unregister
>   ui/vdagent: disconnect handlers and reset state on finalize
>   ui/vdagent: reset outbuf on disconnect
>   ui/vdagent: split clipboard recv message handling
>   ui/vdagent: use qemu_clipboard_peer_release helper
>   ui/vdagent: use qemu_clipboard_info helper
>   ui/vdagent: send empty clipboard when unhandled
>   ui/gtk-clipboard: use qemu_clipboard_info helper
>   ui/vdagent: send release when no clipboard owner
>   ui/gtk-clipboard: emit release clipboard events
>   ui/vdagent: add a migration blocker
>
>  include/ui/clipboard.h |  33 ++++++
>  include/ui/gtk.h       |   1 -
>  ui/clipboard.c         |  41 +++++++
>  ui/gtk-clipboard.c     |  24 ++---
>  ui/vdagent.c           | 239 ++++++++++++++++++++++++++---------------
>  ui/trace-events        |   1 +
>  6 files changed, 240 insertions(+), 99 deletions(-)
>
> --
> 2.32.0.264.g75ae10bc75
>
>
>
>

Ping

Since Gerd is lowering his maintainer responsibilities, is anyone else
interested?

--=20
Marc-Andr=C3=A9 Lureau

--000000000000faf6bc05ca8a5e0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 5:59 PM &lt;=
<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Here is a few fixes I have collected while working on clipboard-related cod=
e.<br>
<br>
There are some obvious code improvements/fixes, and better handling of rele=
ase &amp;<br>
unregister to avoid dangling pointers and improve user experience.<br>
<br>
v3:<br>
=C2=A0- add a migration blocker<br>
=C2=A0- improve the code by using a few helpers<br>
<br>
v2:<br>
=C2=A0- replaced &quot;ui/vdagent: unregister clipboard peer on finalize&qu=
ot; with &quot;ui/vdagent: disconnect handlers and reset state on finalize&=
quot; patch.<br>
=C2=A0- added &quot;ui/vdagent: reset outbuf on disconnect&quot;<br>
=C2=A0- commit message tweaks<br>
<br>
Marc-Andr=C3=A9 Lureau (18):<br>
=C2=A0 ui/vdagent: fix leak on error path<br>
=C2=A0 ui/vdagent: remove copy-pasta comment<br>
=C2=A0 ui/gtk-clipboard: use existing macros<br>
=C2=A0 ui/gtk-clipboard: fix clipboard enum typo<br>
=C2=A0 ui/clipboard: add helper to retrieve current clipboard<br>
=C2=A0 ui/clipboard: add qemu_clipboard_peer_owns() helper<br>
=C2=A0 ui/clipboard: add qemu_clipboard_peer_release() helper<br>
=C2=A0 ui/clipboard: release owned grabs on unregister<br>
=C2=A0 ui/vdagent: disconnect handlers and reset state on finalize<br>
=C2=A0 ui/vdagent: reset outbuf on disconnect<br>
=C2=A0 ui/vdagent: split clipboard recv message handling<br>
=C2=A0 ui/vdagent: use qemu_clipboard_peer_release helper<br>
=C2=A0 ui/vdagent: use qemu_clipboard_info helper<br>
=C2=A0 ui/vdagent: send empty clipboard when unhandled<br>
=C2=A0 ui/gtk-clipboard: use qemu_clipboard_info helper<br>
=C2=A0 ui/vdagent: send release when no clipboard owner<br>
=C2=A0 ui/gtk-clipboard: emit release clipboard events<br>
=C2=A0 ui/vdagent: add a migration blocker<br>
<br>
=C2=A0include/ui/clipboard.h |=C2=A0 33 ++++++<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0ui/clipboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++++++<br=
>
=C2=A0ui/gtk-clipboard.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ++---<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 239 ++++++++++=
++++++++++++++++---------------<br>
=C2=A0ui/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A06 files changed, 240 insertions(+), 99 deletions(-)<br>
<br>
-- <br>
2.32.0.264.g75ae10bc75<br>
<br>
<br>
<br>
</blockquote></div><div><br></div><div><br></div><div>Ping</div><div><br></=
div><div>Since Gerd is lowering his maintainer responsibilities, is anyone =
else interested?<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000faf6bc05ca8a5e0a--

