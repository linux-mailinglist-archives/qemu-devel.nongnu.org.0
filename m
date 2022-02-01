Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBF4A6A9A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:42:46 +0100 (CET)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6Xd-000058-B1
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2zh-0007Ea-4k
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:55:29 -0500
Received: from [2607:f8b0:4864:20::936] (port=43864
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2zc-00011J-BT
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:55:28 -0500
Received: by mail-ua1-x936.google.com with SMTP id a24so2442848uat.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYwcAQB27IFQPf3klG0J04uXC8Gvw8FYtCcP5ReUBuo=;
 b=6DDhm7VP8ZWWAHzOuzqRJA7p3kmEI1ZQ9GtcoE9xOOsWw9mIq01xaQppRZiw9tMh93
 uHSdClhOki4CnKvFINN+fRtT+yEpmcwlNm9hWwLP73QYDbT3N2VlC9EStbcyVO/ahQFD
 oiO+1JVUOFiRE8WQ2WImZyTJcikk7cK5E7SRH/ew9+s9kXGW4/OhMlnnDC3xPgFsJ5Xm
 916ZAk5HlpWVeYWR7lyAAgA3pl3N5vMEzL1ZZLv/RObQCNsYSE6IxLc2zVYe/iOeyk6L
 xoe4Ow6xfkFVVFQ8gZljcYAKyrsMCqGc8+LNDaKmDtwCtVMeiH9y7L26M9pCrZRgvgNk
 7MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYwcAQB27IFQPf3klG0J04uXC8Gvw8FYtCcP5ReUBuo=;
 b=tdfyyRPStXN+dzfmjSUMy3WPOLg9JX4D+uY1a+giVA+EAJMfYKs7LCy4/ouQYC8pqw
 gIMRcbMOBqQN/9nmEtCescqYIpNfyM1YGYZeOUTv6ynF8bcPVSSvqUzCNPRVlqKKRwkU
 RjUaDcuUuqyV5t6HYYsESFsYpbuTimwQNGCYCXKfFatykH9zsSNBOembfpMwkqdWLQ3i
 H52WeZqOgPxE9Xb75ghRYJoS6fJlc4q+eJ5vch3wyQFaYTbytatmHMpH6ma2Slex3jol
 4JJ0c9CptmnQu6t723AXSl9DIrxYVz8vCKk5V/cEzbxrlt7yubjVV4Ulpc7m6TUsjIze
 F1zA==
X-Gm-Message-State: AOAM533SFO9OA6dCa3Qrec9EwG6sHlRqKzf25J3UvLe8ufR5PobU0yaE
 7uQKj4wxG5pv9fCGfoywzCT94aSGn36VbRKfEl+0ow==
X-Google-Smtp-Source: ABdhPJxEtqFTkvgX16+qhl9KzvYZY5UkrX4WSYXoY0I9x90JV+K8NBHCC1Mg+RncBub3bMFwp2UyVX7dCAfgRDKGhLQ=
X-Received: by 2002:ab0:2a07:: with SMTP id o7mr11554060uar.39.1643759722005; 
 Tue, 01 Feb 2022 15:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-14-imp@bsdimp.com>
 <021f966e-b664-b27f-f24a-fc6dc9f960bb@linaro.org>
In-Reply-To: <021f966e-b664-b27f-f24a-fc6dc9f960bb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 16:55:11 -0700
Message-ID: <CANCZdfqE4DZELJCUvWCxkP-cemaGfN5AGRztti54d=+y2vuSYA@mail.gmail.com>
Subject: Re: [PATCH 13/22] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000539e7a05d6fda22d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Popov <arrowd@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000539e7a05d6fda22d
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 10:43 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/1/22 22:14, Warner Losh wrote:
> > +#ifndef BSD_FILE_H_
> > +#define BSD_FILE_H_
> > +
> > +#include <sys/types.h>
> > +#include <sys/mount.h>
> > +#include <sys/uio.h>
> > +#include <fcntl.h>
> > +#include <poll.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
>
> Many of these should be done by "qemu/osdep.h" already.  Otherwise I
> question putting them
> into this header, as opposed to as needed by other syscall handling c
> files.
>

I can remove the ones that are done by qemu/osdep.h easily enough. That's
changed over time
and these used to be required. I'm hesitant to remove the others since
that's starting to get
into restructuring the code we have working upstream. On the other hand,
the ordering of these
files make it such that these are often included just once, so moving to a
bsd-file.h that's just the
functions and bsd-file.c that's the definition and relying on LTO to
optimize. That would make things
less fragile than they are now. So I'm torn since part of floating these
patches is to do a small sliver
to get feedback...  I may need to sleep on this to figure out how to
weigh the 'cleaner code' vs 'risk
of introducing regressions during refactoring'.

Warner

--000000000000539e7a05d6fda22d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 10:43 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/1/22 22:14, Warner Losh wrote:<br>
&gt; +#ifndef BSD_FILE_H_<br>
&gt; +#define BSD_FILE_H_<br>
&gt; +<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/mount.h&gt;<br>
&gt; +#include &lt;sys/uio.h&gt;<br>
&gt; +#include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
<br>
Many of these should be done by &quot;qemu/osdep.h&quot; already.=C2=A0 Oth=
erwise I question putting them <br>
into this header, as opposed to as needed by other syscall handling c files=
.<br></blockquote><div><br></div><div>I can remove the ones that are done b=
y qemu/osdep.h easily enough. That&#39;s changed over time</div><div>and th=
ese used to be required. I&#39;m hesitant to remove the others since that&#=
39;s starting to get</div><div>into restructuring the code we have working =
upstream. On the other hand, the ordering of these</div><div>files make it =
such that these are often included just once, so moving to a bsd-file.h tha=
t&#39;s just the</div><div>functions and bsd-file.c that&#39;s the definiti=
on and relying on LTO to optimize. That would make things</div><div>less fr=
agile than they are now. So I&#39;m torn since part of floating these patch=
es is to do a small sliver</div><div>to get feedback...=C2=A0 I may need to=
 sleep on this to figure out how to weigh=C2=A0the &#39;cleaner code&#39; v=
s &#39;risk</div><div>of introducing regressions during refactoring&#39;.</=
div><div><br></div><div>Warner</div></div></div>

--000000000000539e7a05d6fda22d--

