Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278151BBF1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:26:28 +0200 (CEST)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXkh-0004f7-3P
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWzx-0005Tt-Gj
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:38:13 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWzv-0004Ca-GX
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:38:09 -0400
Received: by mail-lf1-x130.google.com with SMTP id j4so6296684lfh.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+F7xaU4L2/vyARZA2TMxx6k9H/TsRo6qPxolo+d2BA=;
 b=Fh59/ypD6thWKMH2NiP6Uvju+bqFAGup33dz/yAuHVAuAhKA7eeKcViDtmKZhRM6Uz
 mWPZHgUDvxt9mVpfWnl/XeeUfGI5aDyr4Bx2giFfWbdtMxRbRduI9W38jutj3fZVDd2r
 vUkIkFiMHw4HnPDXCSyk4h5YeTfn7if24VfaR6liSr9J8b31NYdADI8V4rbWr+m1Zx1n
 9a0X8qyJ6UbU8GQASnp3K4cpqPQdMZ72AGeJV5rw40l+cp3RzAbRX22lU2Rc7KqCGCN2
 2mXULBNPRyVtNKRF844YgGgaD4d5jbfDniW9MHwpEFnLASbXFZ44dW4f0gxXXMiVYCbP
 YGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+F7xaU4L2/vyARZA2TMxx6k9H/TsRo6qPxolo+d2BA=;
 b=jv7ATu8wt0pvLK/uWJ9rXqx57U6RlQUtf4LmDd5xwHcPbftpZ4nipBMD5BDb2mNXqe
 paXed6DotOn6bESMy5Z7NVaWLO7j7wRINsn/8VYiaytOEU70/s1CEMLyd/Sc5vtSj6gS
 onoUkiGjVp21j6FJ2rJXE3ulw0n1qhFW6eATUTfhezasyPxeebU50WvleZNPngH8ndWD
 A0uPVl4H1JVAWc59EaLr7SYCZttIUBwyhElr4nmYRIqO0mBRrHVxKJemndGWh1ptNC60
 bsSRkiSty/WdT9tYXgt/pACcRwGEWDT9AUL7WMhuzeJDV0lHEwFt5CdU77LQVtZxZad/
 eKGQ==
X-Gm-Message-State: AOAM532YlV15imEQ/NqLKyno1Em5nAraZCVbvseILbJiJdU/csPq6Hc8
 xWOlNgz1TLjOaT7OOFl7DQraW+iIjYBEkx6c7b8=
X-Google-Smtp-Source: ABdhPJwUz5iuTF6zOMjtSpUpPoLjNyqYPFcMoGVefQR5YOVTAgvHy9uvrKhKiXPtpkeCdO943+cOqSoUnkTN0lwr7IU=
X-Received: by 2002:a05:6512:321c:b0:46b:b7fd:1eca with SMTP id
 d28-20020a056512321c00b0046bb7fd1ecamr17217877lfe.481.1651739885918; Thu, 05
 May 2022 01:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-2-pbonzini@redhat.com>
 <CAJ+F1CJgNMcVNFsctNR9MAaQ_5XojbX1J=LgjsVqyveArW6Xuw@mail.gmail.com>
 <CABgObfY=YNOPa0DjqEgWkeZZOCrOJAco1xfnmSjYSme8T=KcOQ@mail.gmail.com>
In-Reply-To: <CABgObfY=YNOPa0DjqEgWkeZZOCrOJAco1xfnmSjYSme8T=KcOQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:37:54 +0400
Message-ID: <CAJ+F1CLKHrEUNoYoYmXw2_pDp+An1TqjhniWqoMZO3brZ1m2Fg@mail.gmail.com>
Subject: Re: [PATCH 1/5] slirp: bump submodule to 4.7 release
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000295fca05de3fa92e"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000295fca05de3fa92e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 12:34 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On Thu, May 5, 2022 at 10:21 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> >
> >
> > On Thu, May 5, 2022 at 1:06 AM Paolo Bonzini <pbonzini@redhat.com>
> wrote:
> >>
> >> Version 4.7 of slirp provides a new timer API that works better with
> CFI,
> >> together with several other improvements:
> >>
> >> * Allow disabling the internal DHCP server !22
> >> * Support Unix sockets in hostfwd !103
> >> * IPv6 DNS proxying support !110
> >> * bootp: add support for UEFI HTTP boot !111
> >>
> >> and bugfixes.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Unfortunately this fails to build on Windows due to a libslirp bug
> (https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/121).
> We could include the couple extra commits in QEMU, since there are no
> other changes to libslirp since 4.7.0 and they only fix a compiler
> warning; or wait for 4.7.1 to be released; or resuscitate the patches
> that switch libslirp to a subproject, but that's my least favorite
> because we're going to remove the bundled source code anyway sooner or
> later.
>

Sad the CI didn't catch it. What is missing to cover it?

To me it's fine to update the submodule to the fixed commit, with a comment
explaining why.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000295fca05de3fa92e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 12:34 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, May 5, 2022 at 10:21 AM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 5, 2022 at 1:06 AM Paolo Bonzini &lt;<a href=3D"mailto:pbo=
nzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Version 4.7 of slirp provides a new timer API that works better wi=
th CFI,<br>
&gt;&gt; together with several other improvements:<br>
&gt;&gt;<br>
&gt;&gt; * Allow disabling the internal DHCP server !22<br>
&gt;&gt; * Support Unix sockets in hostfwd !103<br>
&gt;&gt; * IPv6 DNS proxying support !110<br>
&gt;&gt; * bootp: add support for UEFI HTTP boot !111<br>
&gt;&gt;<br>
&gt;&gt; and bugfixes.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat=
.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Unfortunately this fails to build on Windows due to a libslirp bug<br>
(<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/=
121" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/sl=
irp/libslirp/-/merge_requests/121</a>).<br>
We could include the couple extra commits in QEMU, since there are no<br>
other changes to libslirp since 4.7.0 and they only fix a compiler<br>
warning; or wait for 4.7.1 to be released; or resuscitate the patches<br>
that switch libslirp to a subproject, but that&#39;s my least favorite<br>
because we&#39;re going to remove the bundled source code anyway sooner or<=
br>
later.<br></blockquote><div><br></div><div>Sad the CI didn&#39;t catch it. =
What is missing to cover it?</div><div><br></div><div>To me it&#39;s fine t=
o update the submodule to the fixed commit, with a comment explaining why.<=
/div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000295fca05de3fa92e--

