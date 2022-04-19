Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F298B506EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:48:03 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngoD5-0004j1-4f
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1ngoBV-0003Lv-Sl; Tue, 19 Apr 2022 09:46:26 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1ngoBT-0005KB-2B; Tue, 19 Apr 2022 09:46:25 -0400
Received: by mail-lj1-x236.google.com with SMTP id bf11so8878485ljb.7;
 Tue, 19 Apr 2022 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmERCTD9duoI8QmcZIw2zR9Aue/W/TbPo4aR/Jvdqyw=;
 b=BUvOx5i64tlCxQzHP8RzAmCn+xqmMF4oRZRSe3qn/p2sVpHjFwSIXdKTXWdyaZYyj5
 uY74rQt3DUQDrSKHAOtrLkfQlnuRfL9UznDmhjZbzoNLIRLiuLXMJLBV1ep4q90RY8Lq
 wZ36ivo8awH5jjl7kp7IG5qg7tRO1zML9FoU1eyDXGAI57Z3wi0mz33RTMtxZH8VQ5C8
 56Lzd5QkxnnnuF7WlzFPDU5YMKULl06nX0M+qzU3+bxDd83a5bIQ3CxkGtO/v/4Bc14o
 7kupuPAvv+QSMmbRJRPuEVTE5YQbbIo267TQmmRkTbUxFC2t9NZiNBJ7swc7Z8AY5IvA
 TZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmERCTD9duoI8QmcZIw2zR9Aue/W/TbPo4aR/Jvdqyw=;
 b=S2FbQtwKs0Wl7Z+2FAVkit1cCOnFHrndSdwMamBKZJ7QGo5CMVzgJt/Gze7U/Es/Af
 BVgLFxmHj69R/J6mz/yzqRu73RYyb32SNcVthT0vjv7j4/EfZsuRcR6eWXzFBQM4hQ67
 jvaea0Xnop0GBzsMjUuLzchhYQqapG7hXTZbpmVBNBoaT5e/4+t3a84gyWCFm4/xoTYW
 uYm4kZc0Eu5y9RZ0IFedc+pzysdTcTPba3BNRsW/3dTcuyNesX5GIpIES5xt1U55qjZ8
 iolMLk8MzwkLlCZb2cEY5d7RetoTyBCrBbcHot4qWaaaA0e7OIlHbLo3aW5rxdYIg8pX
 Kjsg==
X-Gm-Message-State: AOAM530ouWuZ3BQHkvrfej68bTxyNyNp+5rPt93lssPJa1boAxw+wwZO
 SnJ9SwwzJUeDggs69ww0mqxRkdS006DUoVodI7QCdQuT
X-Google-Smtp-Source: ABdhPJx6Jmst8aTke98+YKw8ETpdcYEvVYFSEFe3wnYhG9mOhIMwno+5En8cQRja6IY3g4VsosntanYzEeRtWOP7LqI=
X-Received: by 2002:a2e:a78a:0:b0:24d:b9ba:c1b with SMTP id
 c10-20020a2ea78a000000b0024db9ba0c1bmr6841370ljf.268.1650375981015; Tue, 19
 Apr 2022 06:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
In-Reply-To: <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 19 Apr 2022 09:46:09 -0400
Message-ID: <CAB26zV1R_9PdBq75zg3aQFNyTojvxcnqRE9NcdWCWMUP=h-FUg@mail.gmail.com>
Subject: Re: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000018266b05dd021aeb"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x236.google.com
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018266b05dd021aeb
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 19, 2022 at 8:18 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating sockets, so divert to
> call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> was passed with mode argument.
>
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by
> <https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/Signed-off-by>:
> Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util-darwin.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index 53e0625501..252a6fc5dd 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -74,6 +74,24 @@ int fsetxattrat_nofollow(int dirfd, const char
> *filename, const char *name,
>   */
>  #if defined CONFIG_PTHREAD_FCHDIR_NP
>
> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> +    int fd, err;
> +    struct sockaddr_un addr = {
> +        .sun_family = AF_UNIX
> +    };
> +
> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> +    if (fd < 0) {
> +        return fd;
> +    }
> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> +    if (err < 0) {
> +        return err;
> +    }
> +    return chmod(addr.sun_path, mode);
> +}
> +
>  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
> @@ -88,7 +106,11 @@ int qemu_mknodat(int dirfd, const char *filename,
> mode_t mode, dev_t dev)
>      if (pthread_fchdir_np(dirfd) < 0) {
>          return -1;
>      }
> -    err = mknod(filename, mode, dev);
> +    if (S_ISSOCK(mode)) {
> +        err = create_socket_file_at_cwd(filename, mode);
> +    } else {
> +        err = mknod(filename, mode, dev);
> +    }
>      preserved_errno = errno;
>      /* Stop using the thread-local cwd */
>      pthread_fchdir_np(-1);
> --
> 2.32.0 (Apple Git-132)


> Reviewed-by: Will Cohen <wwcohen@gmail.com>

--00000000000018266b05dd021aeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Apr 19, 2022 at 8:18 AM Christian Schoenebeck &lt;<a href=3D"m=
ailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></di=
v><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">mknod() on macOS does =
not support creating sockets, so divert to<br>
call sequence socket(), bind() and chmod() respectively if S_IFSOCK<br>
was passed with mode argument.<br>
<br>
Link: <a href=3D"https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@sil=
ver/Signed-off-by" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel=
.org/qemu-devel/17933734.zYzKuhC07K@silver/<br>
Signed-off-by</a>: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@cru=
debyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
---<br>
=C2=A0hw/9pfs/9p-util-darwin.c | 24 +++++++++++++++++++++++-<br>
=C2=A01 file changed, 23 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c<br>
index 53e0625501..252a6fc5dd 100644<br>
--- a/hw/9pfs/9p-util-darwin.c<br>
+++ b/hw/9pfs/9p-util-darwin.c<br>
@@ -74,6 +74,24 @@ int fsetxattrat_nofollow(int dirfd, const char *filename=
, const char *name,<br>
=C2=A0 */<br>
=C2=A0#if defined CONFIG_PTHREAD_FCHDIR_NP<br>
<br>
+static int create_socket_file_at_cwd(const char *filename, mode_t mode) {<=
br>
+=C2=A0 =C2=A0 int fd, err;<br>
+=C2=A0 =C2=A0 struct sockaddr_un addr =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .sun_family =3D AF_UNIX<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 fd =3D socket(PF_UNIX, SOCK_DGRAM, 0);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fd;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 snprintf(addr.sun_path, sizeof(addr.sun_path), &quot;./%s&qu=
ot;, filename);<br>
+=C2=A0 =C2=A0 err =3D bind(fd, (struct sockaddr *) &amp;addr, sizeof(addr)=
);<br>
+=C2=A0 =C2=A0 if (err &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return chmod(addr.sun_path, mode);<br>
+}<br>
+<br>
=C2=A0int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int preserved_errno, err;<br>
@@ -88,7 +106,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_=
t mode, dev_t dev)<br>
=C2=A0 =C2=A0 =C2=A0if (pthread_fchdir_np(dirfd) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
+=C2=A0 =C2=A0 if (S_ISSOCK(mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D create_socket_file_at_cwd(filename, mo=
de);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0preserved_errno =3D errno;<br>
=C2=A0 =C2=A0 =C2=A0/* Stop using the thread-local cwd */<br>
=C2=A0 =C2=A0 =C2=A0pthread_fchdir_np(-1);<br>
-- <br>
2.32.0 (Apple Git-132)</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
</blockquote></div></div><div dir=3D"auto"><span style=3D"border-color:rgb(=
0,0,0);color:rgb(0,0,0)">Reviewed-by: Will Cohen &lt;<a href=3D"mailto:wwco=
hen@gmail.com">wwcohen@gmail.com</a>&gt;</span><br></div>

--00000000000018266b05dd021aeb--

