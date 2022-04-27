Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DB5114EB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:44:17 +0200 (CEST)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njf9c-0004Gp-Fq
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njf4o-0001ic-Nf
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:39:19 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njf4n-0000Hi-3N
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:39:18 -0400
Received: by mail-qt1-x82f.google.com with SMTP id x9so799664qts.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bMFKpGPI7GGZnUf2AbunAheONGkvKapZaP4WHQnQQHs=;
 b=oFlMvg16bbmDX80QaJAK475Q/DRne8nfArgciiC5wlfdA2rmyP/Gu8mVxY3FFdtSxX
 x1qOzqCzS98Sc7TCeyrtH/CqNGm346U61mgpEWG9PfQI3Ew2yzQBox0CzYUvENngo92l
 gH2m7TlGVcmv038rer+KZlzU5v8BKkgxXPkgR3YnMaxR+QjiCH2oxfuaYVDE5hPF12Mm
 zlN3WGMda2yVs9/8ZXw36/6gn9CBzav9EU7eDMd/oXBLnD8Zx4FXL84mRv12yMJLiNkU
 AbFqNgrgoeXP9EW9x4fvQAIIQ0hoNksg5sMn/RYv197kNIknvVKeTIiVFyyjjZzLJBCN
 TUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bMFKpGPI7GGZnUf2AbunAheONGkvKapZaP4WHQnQQHs=;
 b=Ud4BbOHXcX5a2piaGI0QS76a81xQBRBugbK5ICItntx6ZWDSfjr30/tpbSSkjQSsDv
 01jw/GUPbebu6jmdErJ3BIPKyc8/lDM8ya7ny95scOVVPo6n4EukTcE0nrtyBa8Uz1ez
 dumir9d+qIAyaYsbs2SKMsIhiwrxUL+aaapIx+rv89fp3WmqyLusMyYwHSOHkAeThUAc
 fjHmPo2rpoleYgv6DiPvFEbxrr1g9oxEAKTImgyqFItnhR6iuFoWaYA9ritVQh2SMJ6N
 aj0QHsxglrC3ooNXcbZCO/KrdULP/HuIckrW6S2bySXX8igSyqIT/FVlRVG8M+bVK3P2
 ZaNw==
X-Gm-Message-State: AOAM530cuUrL37t8B3CkPrulHVMgm12r3vj+8JlvD18vkoYNb+aFTPpU
 LRz6Y1UQ6y1CjqLlbeZMdEkXYzjj6qmMFfKGNpc=
X-Google-Smtp-Source: ABdhPJwn+bTV+hnBE4agjdNEXl7M4TfvEG/Th8N2XjcCWQXcCxiAydWhzsW/iKPVONh8jY1OF8+AHx7ZqIFl+xH4Xcg=
X-Received: by 2002:a05:622a:144e:b0:2f3:4da8:6a77 with SMTP id
 v14-20020a05622a144e00b002f34da86a77mr18123566qtx.574.1651055952609; Wed, 27
 Apr 2022 03:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-27-marcandre.lureau@redhat.com>
 <YmgCrkayyFod+JcS@stefanha-x1.localdomain>
In-Reply-To: <YmgCrkayyFod+JcS@stefanha-x1.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 27 Apr 2022 14:39:01 +0400
Message-ID: <CAJ+F1CJomYhKcTXE3puF6Y-4+FTjd+aZ8b=3-oy5B3wPmOWmdw@mail.gmail.com>
Subject: Re: [PATCH v2 26/26] util: rename qemu_*block() socket functions
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008f432205dda06bf3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82f.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008f432205dda06bf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan

On Tue, Apr 26, 2022 at 6:33 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Tue, Apr 26, 2022 at 01:27:15PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The qemu_*block() functions are meant to be be used with sockets (the
> > win32 implementation expects SOCKET)
> >
> > Over time, those functions where used with Win32 SOCKET or
> > file-descriptors interchangeably. But for portability, they must only b=
e
> > used with socket-like file-descriptors. FDs can use
> > g_unix_set_fd_nonblocking() instead.
> >
> > Rename the functions with "socket" in the name to prevent bad usages.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/sockets.h                  |  6 +++---
> >  chardev/char-socket.c                   |  2 +-
> >  contrib/ivshmem-server/ivshmem-server.c |  2 +-
> >  hw/hyperv/syndbg.c                      |  2 +-
> >  hw/virtio/vhost-user.c                  |  2 +-
> >  io/channel-socket.c                     |  6 +++---
> >  net/l2tpv3.c                            |  2 +-
> >  net/socket.c                            | 10 +++++-----
> >  qga/channel-posix.c                     |  2 +-
> >  tests/unit/socket-helpers.c             |  2 +-
> >  tests/unit/test-crypto-tlssession.c     |  8 ++++----
> >  util/oslib-posix.c                      |  8 ++++----
> >  util/oslib-win32.c                      |  8 ++++----
> >  util/vhost-user-server.c                |  4 ++--
> >  14 files changed, 32 insertions(+), 32 deletions(-)
>
> Thanks for fixing this!
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Thanks, could you also review the preliminary patches 19-25 ? They reduce
the usage of qemu_socket* functions, and use glib API instead.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008f432205dda06bf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Stefan<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 26, 2022 at 6:33=
 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Tue, Apr 26, 2022 at 01:27:15PM +0400, <a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:=
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The qemu_*block() functions are meant to be be used with sockets (the<=
br>
&gt; win32 implementation expects SOCKET)<br>
&gt; <br>
&gt; Over time, those functions where used with Win32 SOCKET or<br>
&gt; file-descriptors interchangeably. But for portability, they must only =
be<br>
&gt; used with socket-like file-descriptors. FDs can use<br>
&gt; g_unix_set_fd_nonblocking() instead.<br>
&gt; <br>
&gt; Rename the functions with &quot;socket&quot; in the name to prevent ba=
d usages.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt;=C2=A0 chardev/char-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 contrib/ivshmem-server/ivshmem-server.c |=C2=A0 2 +-<br>
&gt;=C2=A0 hw/hyperv/syndbg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 hw/virtio/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 io/channel-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt;=C2=A0 net/l2tpv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 qga/channel-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 tests/unit/socket-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 tests/unit/test-crypto-tlssession.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 8=
 ++++----<br>
&gt;=C2=A0 util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 util/vhost-user-server.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 14 files changed, 32 insertions(+), 32 deletions(-)<br>
<br>
Thanks for fixing this!<br>
<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Thanks, could you also review the preliminary patches 19-25 ? They redu=
ce the usage of qemu_socket* functions, and use glib API instead. <br></div=
></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--0000000000008f432205dda06bf3--

