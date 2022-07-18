Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9B578918
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:00:13 +0200 (CEST)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDV2S-0007EL-Bc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oDUWY-0004T0-Ql
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:27:14 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oDUWW-0002S4-Fo
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:27:13 -0400
Received: by mail-lf1-x12f.google.com with SMTP id z25so20573571lfr.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQkkHJVqtbEPSh5sgoveTctiBk5ntXQfLbpvOOCdcbs=;
 b=ZWnssUMZJJ+CxLqeN3xASdgjNV5ptBv7mKjRs/Ms4DfhF/IKWkgnMvK/iL0uHPdtXG
 ZN0CXpp4rvvMYC3klqJrDRQDgZTJD+/7wfOf8yn2Kp10E69z6qRvhS94QjqrXgGZAuq2
 x1WINUAmfG277GYy38IrC4p0aef4+vtYyE78hmBZ7XJ98gKU+25GJsgx2AZmy2EQjEGj
 y61W/XEhgS218XcAF3tqJXuPACJ/qNdB5MKZyK9i7famoz9F4jnkzzUGmwbBvNAeXWnc
 iPAcZeEbW7GRDkU3tz0Otc4zXwnN3uoL4d2VSwZeFJKHJt9Iwwz/f6pFn9G0JqNbRArT
 VBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQkkHJVqtbEPSh5sgoveTctiBk5ntXQfLbpvOOCdcbs=;
 b=lcoQEfN+Crzv5MlB6prJm8unfjJ3GZ8W63rAmsZYKuSHjF4zMYC8lgSlOgn5siqigc
 v2rAXkIGRjAy7jjjYNxJFxYnbkJA9wj2Sq7ChIuXq6qY9ZY2GQJUP47mYhBLpfNPObXT
 8hYhLRWbF0VPAl8qYjHe3wdVs5T1HGQn4GtBdIZWo1U3axb8QMkF9AvqAfW0nYgVMSYB
 n97OwUojPfgQSLl6enehG6spyAKRhQMHP+3sCAinKOYfeIC1r3JdcEYXqRMlzb6qfG+r
 1RsPRjvMTIcd4opz+M6CD1g/ueDhlJeUDIjdOpfjZyQU/k1ZNNy7OjJVsonGl+78MfSi
 lS7A==
X-Gm-Message-State: AJIora8Pd5aUl97XP05EnXZ3xH8vknMTGWMPKFvBuzyWOR4QhHq49btp
 yPgO2dZPOUfd16YbWH/GGqpbTOkxg7P6PbsN7T8=
X-Google-Smtp-Source: AGRyM1s1J6InSFxiGv1SkjV7QJbg1KuFXn1Ne9eVShj6TEKaOkSSu5r7P0jmSeCsz5L5ND8IbDpKNVZi8Rgmk7eGNHg=
X-Received: by 2002:a05:6512:3409:b0:489:fd59:a78f with SMTP id
 i9-20020a056512340900b00489fd59a78fmr15065393lfr.654.1658165229354; Mon, 18
 Jul 2022 10:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220718172026.139004-1-thuth@redhat.com>
In-Reply-To: <20220718172026.139004-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 18 Jul 2022 21:26:57 +0400
Message-ID: <CAJ+F1CJ8zJWWqfMqVRqgsO8-r+7-5268tmw3Gw1Fw9EuxXnbGg@mail.gmail.com>
Subject: Re: [PATCH] util: Fix broken build on Haiku
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 John Snow <jsnow@redhat.com>, Alexander von Gluck IV <kallisti5@unixzen.com>
Content-Type: multipart/alternative; boundary="0000000000007984f905e417ad56"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--0000000000007984f905e417ad56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2022 at 9:22 PM Thomas Huth <thuth@redhat.com> wrote:

> A recent commit moved some Haiku-specific code parts from oslib-posix.c
> to cutils.c, but failed to move the corresponding header #include
> statement, too, so "make vm-build-haiku.x86_64" is currently broken.
> Fix it by moving the header #include, too.
>
> Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  util/cutils.c      | 4 ++++
>  util/oslib-posix.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/util/cutils.c b/util/cutils.c
> index 8199dac598..cb43dda213 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -35,6 +35,10 @@
>  #include <sys/sysctl.h>
>  #endif
>
> +#ifdef __HAIKU__
> +#include <kernel/image.h>
> +#endif
> +
>  #ifdef G_OS_WIN32
>  #include <pathcch.h>
>  #include <wchar.h>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 7a34c1657c..bffec18869 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -62,10 +62,6 @@
>  #include <mach-o/dyld.h>
>  #endif
>
> -#ifdef __HAIKU__
> -#include <kernel/image.h>
> -#endif
> -
>  #include "qemu/mmap-alloc.h"
>
>  #ifdef CONFIG_DEBUG_STACK_USAGE
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007984f905e417ad56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 18, 2022 at 9:22 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A recent com=
mit moved some Haiku-specific code parts from oslib-posix.c<br>
to cutils.c, but failed to move the corresponding header #include<br>
statement, too, so &quot;make vm-build-haiku.x86_64&quot; is currently brok=
en.<br>
Fix it by moving the header #include, too.<br>
<br>
Fixes: 06680b15b4 (&quot;include: move qemu_*_exec_dir() to cutils&quot;)<b=
r>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0util/cutils.c=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
=C2=A0util/oslib-posix.c | 4 ----<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/util/cutils.c b/util/cutils.c<br>
index 8199dac598..cb43dda213 100644<br>
--- a/util/cutils.c<br>
+++ b/util/cutils.c<br>
@@ -35,6 +35,10 @@<br>
=C2=A0#include &lt;sys/sysctl.h&gt;<br>
=C2=A0#endif<br>
<br>
+#ifdef __HAIKU__<br>
+#include &lt;kernel/image.h&gt;<br>
+#endif<br>
+<br>
=C2=A0#ifdef G_OS_WIN32<br>
=C2=A0#include &lt;pathcch.h&gt;<br>
=C2=A0#include &lt;wchar.h&gt;<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index 7a34c1657c..bffec18869 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -62,10 +62,6 @@<br>
=C2=A0#include &lt;mach-o/dyld.h&gt;<br>
=C2=A0#endif<br>
<br>
-#ifdef __HAIKU__<br>
-#include &lt;kernel/image.h&gt;<br>
-#endif<br>
-<br>
=C2=A0#include &quot;qemu/mmap-alloc.h&quot;<br>
<br>
=C2=A0#ifdef CONFIG_DEBUG_STACK_USAGE<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007984f905e417ad56--

