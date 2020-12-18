Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EAA2DE307
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:03:18 +0100 (CET)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFPh-0002Vb-Ap
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqFOf-0001qz-Ie
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqFOd-0002VL-12
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608296529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Vv0Voacs4EjNGNInQN48wRSncEFlnzqW2e+mw+Uslk=;
 b=OQNOWaViVhY9IZVjL2ccyx1UThASVaXkmv4aXU0YJLQoO2QRWHY0QvnS1XWXUvTda5hQjf
 2cr6g6oUb9i5coHc2UHb6t1QFp01z3+cGWQi9traPqCHIhE4f4Mhtz75H9jbP6RiedSyEi
 oz8/9umjfISY5/5yY7QVIaiaXV1I4RE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-p0a82sfpM3q3QpWXPbPQ6A-1; Fri, 18 Dec 2020 08:02:05 -0500
X-MC-Unique: p0a82sfpM3q3QpWXPbPQ6A-1
Received: by mail-io1-f71.google.com with SMTP id q140so1703240iod.5
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Vv0Voacs4EjNGNInQN48wRSncEFlnzqW2e+mw+Uslk=;
 b=eM3EFeI0YfDXIKKZN0/E/ouHLuMh8Lwxcb1LH7RTnSDo51gUXcR08Pb6UbHPReAgwh
 s5MOI/Xt69m5tLmNCxwtv6hWx47pbCLKIZ9W9GQ8Y0E3Hz/MPPt/K9Zgx/3YEN8umJzB
 AO3asXwWgJ2+a1DtMcwzuppQjYhddeE44ZYUUgljI5FQf7g1MQYqUhuGSV0ABkw2KxjM
 y4yK79Io2/+4/nQh5d4VgwRTpR7MQ+4gpro66/KKz8fxRerS3ErWqurFd8z7UjbRicSk
 8QCyKlZspwCGfJisILIs+tHGNFEp15ZHrsHrt3NkOYOrgCymkauDuQMmcatdAKdYtena
 LNXA==
X-Gm-Message-State: AOAM533waCeXn9yx/jGx6pe7SVg6Av696HGUjoz+IS/1ysj2YC0YhX0v
 BvLf8wgyxhU475l5VGWvZpl8mZIlG9hfCAMoBHUwSsol7Je6z7YXfQaGGK40y5KNHnlQXOFApdE
 6X/2j9+KoNlYGuvAzku5W7yWGmnpxlRg=
X-Received: by 2002:a92:58dc:: with SMTP id z89mr2087197ilf.11.1608296525214; 
 Fri, 18 Dec 2020 05:02:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwiQ/CD9Mi4Lts+E8BhiisUzt4S3kZtUAp8IYP5azV1Xis8pBQld/DIvkNjNwqwUabAxYtGnXEcsVdy7bq33A=
X-Received: by 2002:a92:58dc:: with SMTP id z89mr2087178ilf.11.1608296525027; 
 Fri, 18 Dec 2020 05:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
 <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
In-Reply-To: <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 18 Dec 2020 17:01:54 +0400
Message-ID: <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000117f0205b6bcb7ca"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000117f0205b6bcb7ca
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Dec 17, 2020 at 3:47 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 17/12/20 12:32, Claudio Fontana wrote:
> > Is the root cause elsewhere though?
> >
> > I don't like stubs very much, because often they are introduced as the
> easy way out of a problem instead of doing the necessary refactoring,
> > and they end up confusing the hell out of someone trying to understand
> what is actually used where, never mind trying to debug the linker errors.
> >
> > There is already an bunch of #ifndef _WIN32, #else , ... in
> util/main-loop.c (quite a bunch of them really),
> > is that what actually needs reworking, and putting the pieces together
> in the build system in a way that makes sense?
>
> qemu_fd_register is almost not needed at all, since we have
>
>          WSAEventSelect(node->pfd.fd, event, bitmask);
>
> in aio_set_fd_handler.  I think we can remove the call to
> qemu_fd_register from qemu_try_set_nonblock, and that should fix the
> issue as well.
>

That's tricky to say whether this won't introduce regression. For most fds
from qemu, if they use aio_set_fd_handler, that should be ok.

But what about other fds? For examples, the ones from slirp? In fact, I
don't understand how it could work today. We are passing socket() fd
directly to g_poll(). But according to the documentation:

 * On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file
 * descriptor as provided by the C runtime) that can be used by
 * MsgWaitForMultipleObjects. This does *not* include file handles
 * from CreateFile, SOCKETs, nor pipe handles. (But you can use
 * WSAEventSelect to signal events when a SOCKET is readable).

And MsgWaitForMultipleObjects doesn't mention SOCKET as being valid handles
to wait for.

But when I run qemu with slirp, with or without qemu_fd_register, I don't
see any error or regression.

Am I missing something?

--000000000000117f0205b6bcb7ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 3:47 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 17/12/20 12:32, Claudio Fontana wrote:<br>
&gt; Is the root cause elsewhere though?<br>
&gt; <br>
&gt; I don&#39;t like stubs very much, because often they are introduced as=
 the easy way out of a problem instead of doing the necessary refactoring,<=
br>
&gt; and they end up confusing the hell out of someone trying to understand=
 what is actually used where, never mind trying to debug the linker errors.=
<br>
&gt; <br>
&gt; There is already an bunch of #ifndef _WIN32, #else , ... in util/main-=
loop.c (quite a bunch of them really),<br>
&gt; is that what actually needs reworking, and putting the pieces together=
 in the build system in a way that makes sense?<br>
<br>
qemu_fd_register is almost not needed at all, since we have<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WSAEventSelect(node-&gt;pfd.fd, event, bi=
tmask);<br>
<br>
in aio_set_fd_handler.=C2=A0 I think we can remove the call to <br>
qemu_fd_register from qemu_try_set_nonblock, and that should fix the <br>
issue as well.<br></blockquote><div><br></div><div>That&#39;s tricky to say=
 whether this won&#39;t introduce regression. For most fds from qemu, if th=
ey use aio_set_fd_handler, that should be ok.</div><div><br></div><div>But =
what about other fds? For examples, the ones from slirp? In fact, I don&#39=
;t understand how it could work today. We are passing socket() fd directly =
to g_poll(). But according to the documentation:</div><div><br></div><div>=
=C2=A0* On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file<=
br>=C2=A0* descriptor as provided by the C runtime) that can be used by<br>=
=C2=A0* MsgWaitForMultipleObjects. This does *not* include file handles<br>=
=C2=A0* from CreateFile, SOCKETs, nor pipe handles. (But you can use<br>=C2=
=A0* WSAEventSelect to signal events when a SOCKET is readable).</div><div>=
<br></div><div>And MsgWaitForMultipleObjects doesn&#39;t mention SOCKET as =
being valid handles to wait for.</div><div><br></div><div>But when I run qe=
mu with slirp, with or without qemu_fd_register, I don&#39;t see any error =
or regression.<br></div><div><br></div><div>Am I missing something?<br></di=
v></div></div>

--000000000000117f0205b6bcb7ca--


