Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C63C14CF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:01:21 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Uae-0000vt-Ar
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1UYA-0008UF-KH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:58:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1UY4-0006XT-2u
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:58:46 -0400
Received: by mail-ej1-x632.google.com with SMTP id bu12so9870779ejb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2p9o/LX1RsV0JGVGoUNq4L4r84vauhZdn01KvOQrA3k=;
 b=XUeCLT8kZwaeiAUSYLd4aBRuhTgEruEQSp6nQbT8asxkLaNsNC5XzuIxD1sYFpDnJW
 svPESCow+d0CK8ZXN73gfk4UUl7mUvgexC1FzqgOUd+wWlkbtg8n3MhBOJpziCacWnKS
 2sVjIrXSUZJzHLeLjYURaUG5ZhqEesP/17XDsVf2/bGH1qWA6no9y/zg43a35jP33TAm
 ldjn5AiyWMMQ5/9qQi/6wHv9q8Uv+wB1FVI422I7N0nEtvQ6pN/D2kv1BplMK1RCYf1d
 UNwLz/1VgFnvrc2BQ9yal3byC+rf5ZqyvEd0Cv8V9el/p+ciqbwa9Kn77BRnjPCdg0pn
 3Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2p9o/LX1RsV0JGVGoUNq4L4r84vauhZdn01KvOQrA3k=;
 b=b7eUuzJiX30yntR8UEjdiGi1jlL+lWegk23TQ6CzF6qfU16mzfvmNBKKN9uesFeVfY
 gaEzvMqxpYvltg3GKSPZ54Al6BGtAyxPuz81gMsHsHqVgw00Nu97fN75hHRZ1KGcO1iM
 ohtApztdICK+oeYH3My1OjaPgRp6sKMY7dieyqslo7l3Mb99ijSIgKYMP0/EJdLXNmc+
 OivZcXhajKOmpYy6IZ1X7+vgw7e3I7TJozTVePkNx+3THV1HgezOx9Ul8mswF7FsVczM
 XCnnjORcgffYBEBtmuLLb6Jf+ObLEp2CTwmRbZbpt5JW7fQnpuFrKz5bNi5D/+ZgMTyS
 loOA==
X-Gm-Message-State: AOAM533pO3oW/FkFXd4P1Dlysdekp+ON5Ez1fcAvnQ19g5XaBRJDZriU
 DeKgqMjiwOffgqd86sckFqQTP95FA/GFZYMO6po=
X-Google-Smtp-Source: ABdhPJw1EBX0ZWtliPT8f5SWcNX3efE1/X0hzqN6ciTH5OVlVLTx8mRt33zI7hLf3ZueLUGzYT8JeLf+445L80sP6T8=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr30933744eje.527.1625752717949; 
 Thu, 08 Jul 2021 06:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-7-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-7-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 17:58:26 +0400
Message-ID: <CAJ+F1C+ZOUi4+P32WorCJsusQxFUo-7T4=pbhmj0n2WzBHqnsQ@mail.gmail.com>
Subject: Re: [PATCH V5 06/25] oslib: qemu_clr_cloexec
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000003efeed05c69d0d5d"
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003efeed05c69d0d5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:33 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Define qemu_clr_cloexec, analogous to qemu_set_cloexec.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/qemu/osdep.h | 1 +
>  util/oslib-posix.c   | 9 +++++++++
>  util/oslib-win32.c   | 4 ++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index c91a78b..3d6a6ca 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval
> *val1,
>  #endif
>
>  void qemu_set_cloexec(int fd);
> +void qemu_clr_cloexec(int fd);
>

I wish we would have a single function to set or unset, tbh. (as _clr_
isn't as readable to me)

 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
>   * instead of QEMU_VERSION, so setting hw_version on MachineClass
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index e8bdb02..97577f1 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)
>      assert(f !=3D -1);
>  }
>
> +void qemu_clr_cloexec(int fd)
> +{
> +    int f;
> +    f =3D fcntl(fd, F_GETFD);
> +    assert(f !=3D -1);
> +    f =3D fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
> +    assert(f !=3D -1);
> +}
>

(asserting() may not be very judicious for calls that we intend to make
during running time, but that's the way it is so far)

+
>  /*
>   * Creates a pipe with FD_CLOEXEC set on both file descriptors
>   */
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index af559ef..46e94d9 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)
>  {
>  }
>
> +void qemu_clr_cloexec(int fd)
> +{
> +}
> +
>  /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
>  #define _W32_FT_OFFSET (116444736000000000ULL)
>
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003efeed05c69d0d5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:33 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Define qemu_clr_cloexec, analogous to qemu_set_cloexec.<br>
<br>
Reviewed-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.c=
om" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/osdep.h | 1 +<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0| 9 +++++++++<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0| 4 ++++<br>
=C2=A03 files changed, 14 insertions(+)<br>
<br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index c91a78b..3d6a6ca 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval *=
val1,<br>
=C2=A0#endif<br>
<br>
=C2=A0void qemu_set_cloexec(int fd);<br>
+void qemu_clr_cloexec(int fd);<br></blockquote><div><br></div><div>I wish =
we would have a single function to set or unset, tbh. (as _clr_ isn&#39;t a=
s readable to me)<br></div><br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0/* Starting on QEMU 2.5, qemu_hw_version() returns &quot;2.5+&quot; b=
y default<br>
=C2=A0 * instead of QEMU_VERSION, so setting hw_version on MachineClass<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index e8bdb02..97577f1 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)<br>
=C2=A0 =C2=A0 =C2=A0assert(f !=3D -1);<br>
=C2=A0}<br>
<br>
+void qemu_clr_cloexec(int fd)<br>
+{<br>
+=C2=A0 =C2=A0 int f;<br>
+=C2=A0 =C2=A0 f =3D fcntl(fd, F_GETFD);<br>
+=C2=A0 =C2=A0 assert(f !=3D -1);<br>
+=C2=A0 =C2=A0 f =3D fcntl(fd, F_SETFD, f &amp; ~FD_CLOEXEC);<br>
+=C2=A0 =C2=A0 assert(f !=3D -1);<br>
+}<br></blockquote><div><br></div><div>(asserting() may not be very judicio=
us for calls that we intend to make during running time, but that&#39;s the=
 way it is so far)<br></div><div> <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+<br>
=C2=A0/*<br>
=C2=A0 * Creates a pipe with FD_CLOEXEC set on both file descriptors<br>
=C2=A0 */<br>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
index af559ef..46e94d9 100644<br>
--- a/util/oslib-win32.c<br>
+++ b/util/oslib-win32.c<br>
@@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)<br>
=C2=A0{<br>
=C2=A0}<br>
<br>
+void qemu_clr_cloexec(int fd)<br>
+{<br>
+}<br>
+<br>
=C2=A0/* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */<br>
=C2=A0#define _W32_FT_OFFSET (116444736000000000ULL)<br>
<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003efeed05c69d0d5d--

