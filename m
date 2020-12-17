Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E129C2DCF6F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:23:34 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqRa-0006F6-0e
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqQ8-0005Ph-PE
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:22:04 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqQ4-00052M-Cg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:22:04 -0500
Received: by mail-ed1-x536.google.com with SMTP id h16so28060417edt.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pz0oUKq4y/tjKV79kRJJLIT87ZKsu2ZWyTrbotlggps=;
 b=TAFPlLyy/3meqgf+BoWdECl+XtHdAV6+Zv2xb/rv0eL95Jz82GR3UeyXT+p24BLmEc
 /T6dnhYIfevwE+khyrYvKue1WpPAdixsMmB2dGHEHR+WJeXGHSbUF1Yugnsj1nhO8ZRh
 2dMYrinD3k2aZAAGfc3dHfjInGupqBPtFRWck8UXywuBK1VK9oPAh7038Ycik2vkfWbe
 iCQXXD7RNrqDZ48EGHQ9rPzjEp/fGh0fq7dfhFKFR8KGwIKkrUPn+WciI7r8kBdU6GgP
 YiwVhh/1EUUX6frXzCagKJVnd4U7BqclsRyntf0gR8oMVCooa7jk3+SjnMoxtu+u5EIp
 US2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pz0oUKq4y/tjKV79kRJJLIT87ZKsu2ZWyTrbotlggps=;
 b=JrcOgF+4hu7tYSKRr30M4JeV1b9/BZl00wYmAwAdT50uokgFz9Xyl+kQ/9IKkqM1aJ
 mGalWf2pkRjI94ajkvbVbBG/rk55XILaN7VQOk1natOyOcpH/ypVITRhAXgKUJx2GmQY
 NHhIvjxAIuZ2BIrBK3VrN0J7iaaw5FTibMgAnG1S4GXlPFmkMmGJojfPvdOCtwFTtyE1
 yave7KRpdS/acDvkeEkaXq64yqaX03PJGeW8w2ToGZmdBPH0wlmb9wra8rLhRY4Qojn9
 tfbyUK6Gglb/aVFGDZeal5luIBY4R8bKRzZa8NJYJtn70C2WUvmpp2JeH412ERVoLcai
 UABA==
X-Gm-Message-State: AOAM533ls9n/+4CBYcujtVqoixhAjIuvjM7KfqL0trzNZUIzDzSmtdBf
 GyZPMKssqvhgOVea1PjKQ6qrSDz19x+4mggXdPs=
X-Google-Smtp-Source: ABdhPJyFO/KbVVWAeExHrDqzuct0WCxjczgnUYB2NJ0jwa/ovcnr5PDW5KLg8P/QI/WEFUy8li+VgB2VrfTFsdfePcI=
X-Received: by 2002:a50:e846:: with SMTP id k6mr38421424edn.245.1608200517752; 
 Thu, 17 Dec 2020 02:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-3-pbonzini@redhat.com>
In-Reply-To: <20201217085005.10644-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Dec 2020 14:21:46 +0400
Message-ID: <CAJ+F1C+KOz1GHuwE=gk4ijr=MZ7OvHCgHmwABcyNDOLo4iKxtA@mail.gmail.com>
Subject: Re: [PATCH 2/4] configure: remove variable bogus_os
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000969f8805b6a65c41"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000969f8805b6a65c41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The condition can be tested also from $targetos, clean up.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 085a5ad7ff..18af8207d9 100755
> --- a/configure
> +++ b/configure
> @@ -467,7 +467,6 @@ gettext=3D"auto"
>  fuse=3D"auto"
>  fuse_lseek=3D"auto"
>
> -bogus_os=3D"no"
>  malloc_trim=3D"auto"
>
>  # parse CC options second
> @@ -620,7 +619,6 @@ else
>    # might be going to just print the --help text, or it might
>    # be the result of a missing compiler.
>    targetos=3D'bogus'
> -  bogus_os=3D'yes'
>  fi
>
>  # Some host OSes need non-standard checks for which CPU to use.
> @@ -2016,7 +2014,7 @@ if test -z "$werror" ; then
>      fi
>  fi
>
> -if test "$bogus_os" =3D "yes"; then
> +if test "$targetos" =3D "bogus"; then
>      # Now that we know that we're not printing the help and that
>      # the compiler works (so the results of the check_defines we used
>      # to identify the OS are reliable), if we didn't recognize the
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000969f8805b6a65c41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 12:50 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 condition can be tested also from $targetos, clean up.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 085a5ad7ff..18af8207d9 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -467,7 +467,6 @@ gettext=3D&quot;auto&quot;<br>
=C2=A0fuse=3D&quot;auto&quot;<br>
=C2=A0fuse_lseek=3D&quot;auto&quot;<br>
<br>
-bogus_os=3D&quot;no&quot;<br>
=C2=A0malloc_trim=3D&quot;auto&quot;<br>
<br>
=C2=A0# parse CC options second<br>
@@ -620,7 +619,6 @@ else<br>
=C2=A0 =C2=A0# might be going to just print the --help text, or it might<br=
>
=C2=A0 =C2=A0# be the result of a missing compiler.<br>
=C2=A0 =C2=A0targetos=3D&#39;bogus&#39;<br>
-=C2=A0 bogus_os=3D&#39;yes&#39;<br>
=C2=A0fi<br>
<br>
=C2=A0# Some host OSes need non-standard checks for which CPU to use.<br>
@@ -2016,7 +2014,7 @@ if test -z &quot;$werror&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-if test &quot;$bogus_os&quot; =3D &quot;yes&quot;; then<br>
+if test &quot;$targetos&quot; =3D &quot;bogus&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0# Now that we know that we&#39;re not printing the help=
 and that<br>
=C2=A0 =C2=A0 =C2=A0# the compiler works (so the results of the check_defin=
es we used<br>
=C2=A0 =C2=A0 =C2=A0# to identify the OS are reliable), if we didn&#39;t re=
cognize the<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000969f8805b6a65c41--

