Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8167F210
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXpe-0002R2-ED; Fri, 27 Jan 2023 18:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pLXpb-0002Pr-TH
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:08:28 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pLXpZ-0005Ge-Kp
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:08:27 -0500
Received: by mail-ed1-x535.google.com with SMTP id x10so6028244edd.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jc1NKWKYVKF9M1D2q94NNuHiJJRJR9yHY2mCKrwc8Yc=;
 b=plMu0f1FXGNaLE5E3rQPgp+4aqYQdvtepEIBYechDkbywxwvcj745oyYOuBHptxIk5
 xD1hLewtOeWuk+qYWkzNtXZdu3ZuIUTW0C2l9yYUYxqYGa710Hs2ZuQHJD+JX9Em2H0T
 IxqSXulh3yf8po90GXxUCVtIwOJvO/dJHr7k6/QIHbLam0mTZYAdd8ousVwprQw8eFfx
 JJdFX/zAKjEZqLNVWcv2dvD7cIcEwFvkqFO4zV/zwm3dpk13BOKaY/RooGqPXJlFdj35
 Ft4AuYYKFrgADUIcoeInLUcfZhEQmVkeChfsYcvoOmi85K62+WpdLglPoMnz1gMQ4dz0
 xexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jc1NKWKYVKF9M1D2q94NNuHiJJRJR9yHY2mCKrwc8Yc=;
 b=fSS2Jc8WDEBwM0izclS+B0dwGf89VITe7bAzUMl/A8oljOydkPd3+ITciY/3rtjGj6
 mXX1i17AaRumNkSJkpmyP8F4gARp15NIZxZSBVxPTz6iXsdlLSrzyiMj2QEJyzr+l6j5
 n6y5Pipv+m6CdldDWou5l3V4TgW0vsktU+6jkZLkFNzoWVsj97XVtsXTo17ixMlFKFJv
 EkI6NifKNYvqkPQEnpzzBDiVF67kDUmpT0kAxHrQeJJGiNXUGSi4Rq5HjrB9+x+7RxRV
 hsI5ZNtVkr+byVRt8KzWOsD8ifPapZ27cq4qm4iAsW9qNjAcdIjUC3BKhAmwg93M1V2P
 QMIg==
X-Gm-Message-State: AO0yUKUtkhN+eug4gOU2GcoD34MvXgs/cFAf+J/56m7FQynpbQUQIgUE
 Dmf4XctgI3QuHCsS9oE5rjdLN5CcBjhaZjasFT1vJw==
X-Google-Smtp-Source: AK7set+sE8mYLbqHsPWaDOuimuHw9v+jk1in6dcD+oV63dnQu2LxqnnIoijy2febCjXkgUhCIS+O01NqQnCGKAeiteE=
X-Received: by 2002:aa7:d448:0:b0:4a0:f071:3656 with SMTP id
 q8-20020aa7d448000000b004a0f0713656mr1788887edr.81.1674860903793; Fri, 27 Jan
 2023 15:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-4-armbru@redhat.com>
 <20230127224746.2rqorp2ushelp4wj@redhat.com>
In-Reply-To: <20230127224746.2rqorp2ushelp4wj@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 27 Jan 2023 16:08:12 -0700
Message-ID: <CANCZdfoj4S06hhbGxHiVqCUQgj08Hyg7HCm5f5sQg0n1k854BA@mail.gmail.com>
Subject: Re: [PATCH v4 03/19] scripts/clean-includes: Skip symbolic links
To: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, 
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, 
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me, 
 jasowang@redhat.com, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, quintela@redhat.com, dgilbert@redhat.com, 
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003829ed05f346f145"
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003829ed05f346f145
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 27, 2023 at 3:47 PM Eric Blake <eblake@redhat.com> wrote:

> On Thu, Jan 19, 2023 at 07:59:43AM +0100, Markus Armbruster wrote:
> > When a symbolic link points to a file that needs cleaning, the script
> > replaces the link with a cleaned regular file.  Not wanted; skip them.
> >
> > We have a few symbolic links under subprojects/libvduse/ and
> > subprojects/libvhost-user/.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  scripts/clean-includes | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/clean-includes b/scripts/clean-includes
> > index 8e8420d785..f0466a6262 100755
> > --- a/scripts/clean-includes
> > +++ b/scripts/clean-includes
> > @@ -113,6 +113,10 @@ EOT
> >
> >  files=
> >  for f in "$@"; do
> > +  if [ -L "$f" ]; then
>
> I don't see -L used with test very often, but POSIX requires it, so it
> is safe for our choice of /bin/sh.
>

FYI: -L is in FreeBSD, NetBSD, OpenBSD, etc. It's been in all these trees
since the mid 90s. It wasn't in 4.4BSD, but all these projects have
imported the code from pdksh's test.

So in addition to POSIX, it's been widely implemented, at least in the BSD
world, for over 20 years.

Warner

--0000000000003829ed05f346f145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 27, 2023 at 3:47 PM Eric =
Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan=
 19, 2023 at 07:59:43AM +0100, Markus Armbruster wrote:<br>
&gt; When a symbolic link points to a file that needs cleaning, the script<=
br>
&gt; replaces the link with a cleaned regular file.=C2=A0 Not wanted; skip =
them.<br>
&gt; <br>
&gt; We have a few symbolic links under subprojects/libvduse/ and<br>
&gt; subprojects/libvhost-user/.<br>
&gt; <br>
&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/clean-includes | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/clean-includes b/scripts/clean-includes<br>
&gt; index 8e8420d785..f0466a6262 100755<br>
&gt; --- a/scripts/clean-includes<br>
&gt; +++ b/scripts/clean-includes<br>
&gt; @@ -113,6 +113,10 @@ EOT<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 files=3D<br>
&gt;=C2=A0 for f in &quot;$@&quot;; do<br>
&gt; +=C2=A0 if [ -L &quot;$f&quot; ]; then<br>
<br>
I don&#39;t see -L used with test very often, but POSIX requires it, so it<=
br>
is safe for our choice of /bin/sh.<br></blockquote><div><br></div><div>FYI:=
 -L is in FreeBSD, NetBSD, OpenBSD, etc. It&#39;s been in all these trees s=
ince the mid 90s. It wasn&#39;t in 4.4BSD, but all these projects have impo=
rted the code from pdksh&#39;s test.</div><div><br></div><div>So in additio=
n to POSIX, it&#39;s been widely implemented, at least in the BSD world, fo=
r over 20 years.<br></div><div><br></div><div>Warner<br></div></div></div>

--0000000000003829ed05f346f145--

