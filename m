Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15435FC744
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:24:58 +0200 (CEST)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicfJ-0006qw-I1
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiccL-0003Xl-IM
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:21:59 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oicc5-0003wS-W6
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:21:40 -0400
Received: by mail-lf1-x136.google.com with SMTP id a29so26006806lfo.1
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=21Hrd9YuUA1Yv8CVOwu9/fOPnioOXJvKagpZZ7KS2mo=;
 b=pMc9SBHyTQANI7fbUBEFRt9DLYkb309X402zkMSlSJC2vMX7SAJNpXpGm/zV3TlQMd
 qrJVO9YS/L+g6MJxpd6XTvnh0PG1Z5jhFpCadQpztVHrjZ+Y1Hk6gZSEKiVVXSjh1Gez
 dveTLmy5ev32zB2vrxGgYWzqd0EVedIlFlznkDOc6fiHsNkowZy5S7Lfj6xn/x2Hu0+H
 ZA2WbNETGVxVVezUfqjM+fJFVjDpX41SPfD3qe3+QhmXvYtpvExsIWAg6qIknAtfJsb3
 SkYYA6MaG7/r9W5+CLjjvjgNSH+RDUK4QQm3TxBzh6og//r+LOjHEXxq+TNleqgysuBf
 k5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21Hrd9YuUA1Yv8CVOwu9/fOPnioOXJvKagpZZ7KS2mo=;
 b=jlrz8pvN+r/X1tzHL8Ombv1cvZ7CJlOhqa/JkO7z7NWJ+ZtekMOsJf5NqYF8QXi9uW
 r/gwKtwSuqwyOWSaXm7xukjkvqGlxZVjkWuN9HbgSzOMK/uuvuLe/1K14dVBdzD/RNRe
 oYlZBaP0wCm7ul6W44rIUcnxbrqBBE08QY93ZGyLVTycJc/aSTr4YbeTCc68UJhZfug+
 /KbyOaMEaPBkkUDDVsozZ/VJdn8Jvpk77cMQc76uxXoiFkaOTQ6FanLme+bSZwHM0cVV
 pv+MFTCmRxASIejHeOIhkvBvXarAoivvrR/VxMhvdl6mc0vimiqqYXk6cTa848IcYApL
 VIEQ==
X-Gm-Message-State: ACrzQf126Z18Q5C5lMFa6chCuxobTBPlXZjFo4Mx5BY1P7kL/ZAsRFfN
 Bz90XEKjCF2ZwOGSJIN6z6vPxIqw6ZZ1748Iseg=
X-Google-Smtp-Source: AMsMyM6hlY07iMm7JfNB+velKJFO/lp1mvt02dwsHkyp3frb9wiCZLMQeC2U6/K7gtAau9NYVzqYfo/U+j39bTKUF+8=
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id
 u25-20020a056512041900b004a22e450bf0mr11601762lfk.356.1665584495992; Wed, 12
 Oct 2022 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
In-Reply-To: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 Oct 2022 18:21:24 +0400
Message-ID: <CAJ+F1C+OmSbWB=q16k_Ju_r_jh-4Fe=0W4Lux9R2K4oxZ54Jag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000003a265405ead71c9a"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000003a265405ead71c9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 4:29 PM Nikita Ivanov <nivanov@cloudlinux.com>
wrote:

> Rename macro name to more transparent one and refactor
> it to expression.
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  chardev/char-fd.c    | 2 +-
>  chardev/char-pipe.c  | 8 +++++---
>  include/qemu/osdep.h | 8 +++++++-
>  net/tap-bsd.c        | 6 +++---
>  net/tap-linux.c      | 2 +-
>  net/tap-solaris.c    | 8 ++++----
>  os-posix.c           | 2 +-
>  7 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..d2c4923359 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags=
,
> Error **errp)
>  {
>      int fd =3D -1;
>
> -    TFR(fd =3D qemu_open_old(src, flags, 0666));
> +    fd =3D RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
>      if (fd =3D=3D -1) {
>          error_setg_file_open(errp, errno, src);
>      }
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b85091..5ad30bcc59 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
>
>      filename_in =3D g_strdup_printf("%s.in", filename);
>      filename_out =3D g_strdup_printf("%s.out", filename);
> -    TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));
> -    TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));
> +    fd_in =3D RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR | O_BINAR=
Y));
> +    fd_out =3D RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR |
> O_BINARY));
>      g_free(filename_in);
>      g_free(filename_out);
>      if (fd_in < 0 || fd_out < 0) {
> @@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >=3D 0) {
>              close(fd_out);
>          }
> -        TFR(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BINA=
RY));
> +        fd_in =3D fd_out =3D RETRY_ON_EINTR(
> +            qemu_open_old(filename, O_RDWR | O_BINARY)
> +        );
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
>              return;
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..a470905475 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>  #define ESHUTDOWN 4099
>  #endif
>
> -#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D =
EINTR)
> +#define RETRY_ON_EINTR(expr) \
> +    (__extension__                                          \
> +        ({ typeof(expr) __result;                               \
> +           do {                                             \
> +                __result =3D (typeof(expr)) (expr);         \
> +           } while (__result =3D=3D -1L && errno =3D=3D EINTR);     \
> +           __result; }))
>
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e..4c98fdd337 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>          } else {
>              snprintf(dname, sizeof dname, "/dev/tap%d", i);
>          }
> -        TFR(fd =3D open(dname, O_RDWR));
> +        fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd >=3D 0) {
>              break;
>          }
> @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
> ifname_size, Error **errp)
>      int fd, s, ret;
>      struct ifreq ifr;
>
> -    TFR(fd =3D open(PATH_NET_TAP, O_RDWR));
> +    fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP)=
;
>          return -1;
> @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      if (ifname[0] !=3D '\0') {
>          char dname[100];
>          snprintf(dname, sizeof dname, "/dev/%s", ifname);
> -        TFR(fd =3D open(dname, O_RDWR));
> +        fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd < 0 && errno !=3D ENOENT) {
>              error_setg_errno(errp, errno, "could not open %s", dname);
>              return -1;
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 304ff45071..f54f308d35 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      int len =3D sizeof(struct virtio_net_hdr);
>      unsigned int features;
>
> -    TFR(fd =3D open(PATH_NET_TUN, O_RDWR));
> +    fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN)=
;
>          return -1;
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index a44f8805c2..38e15028bf 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if( ip_fd )
>         close(ip_fd);
>
> -    TFR(ip_fd =3D open("/dev/udp", O_RDWR, 0));
> +    ip_fd =3D RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
>      if (ip_fd < 0) {
>          error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
>          return -1;
>      }
>
> -    TFR(tap_fd =3D open("/dev/tap", O_RDWR, 0));
> +    tap_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (tap_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap");
>          return -1;
> @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if ((ppa =3D ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
>          error_report("Can't assign new interface");
>
> -    TFR(if_fd =3D open("/dev/tap", O_RDWR, 0));
> +    if_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap (2)");
>          return -1;
> @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
>          error_report("Can't push ARP module (3)");
>      /* Open arp_fd */
> -    TFR(arp_fd =3D open ("/dev/tap", O_RDWR, 0));
> +    arp_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (arp_fd < 0)
>          error_report("Can't open %s", "/dev/tap");
>
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..bb27f67bac 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -266,7 +266,7 @@ void os_setup_post(void)
>              error_report("not able to chdir to /: %s", strerror(errno));
>              exit(1);
>          }
> -        TFR(fd =3D qemu_open_old("/dev/null", O_RDWR));
> +        fd =3D RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
>          if (fd =3D=3D -1) {
>              exit(1);
>          }
> --
> 2.37.3
> --
> Best Regards,
> *Nikita Ivanov* | C developer
> *Telephone:* +79140870696
> *Telephone:* +79015053149
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000003a265405ead71c9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 12, 2022 at 4:29 PM Nikit=
a Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com">nivanov@cloudlinux.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">Rename macro name to more transparent one and refactor<b=
r>it to expression.<br><br>Signed-off-by: Nikita Ivanov &lt;<a href=3D"mail=
to:nivanov@cloudlinux.com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;=
<br></div></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lur=
eau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">---<br>=C2=A0chardev/char-fd.c =C2=A0 =C2=A0| 2=
 +-<br>=C2=A0chardev/char-pipe.c =C2=A0| 8 +++++---<br>=C2=A0include/qemu/o=
sdep.h | 8 +++++++-<br>=C2=A0net/tap-bsd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +=
++---<br>=C2=A0net/tap-linux.c =C2=A0 =C2=A0 =C2=A0| 2 +-<br>=C2=A0net/tap-=
solaris.c =C2=A0 =C2=A0| 8 ++++----<br>=C2=A0os-posix.c =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>=C2=A07 files changed, 22 insertions(+), 14 del=
etions(-)<br><br>diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>inde=
x cf78454841..d2c4923359 100644<br>--- a/chardev/char-fd.c<br>+++ b/chardev=
/char-fd.c<br>@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *sr=
c, int flags, Error **errp)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0int fd =3D -1=
;<br><br>- =C2=A0 =C2=A0TFR(fd =3D qemu_open_old(src, flags, 0666));<br>+ =
=C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));<br>=C2=
=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
rror_setg_file_open(errp, errno, src);<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --g=
it a/chardev/char-pipe.c b/chardev/char-pipe.c<br>index 66d3b85091..5ad30bc=
c59 100644<br>--- a/chardev/char-pipe.c<br>+++ b/chardev/char-pipe.c<br>@@ =
-131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,<br><br>=C2=A0=
 =C2=A0 =C2=A0filename_in =3D g_strdup_printf(&quot;%<a href=3D"http://s.in=
" target=3D"_blank">s.in</a>&quot;, filename);<br>=C2=A0 =C2=A0 =C2=A0filen=
ame_out =3D g_strdup_printf(&quot;%s.out&quot;, filename);<br>- =C2=A0 =C2=
=A0TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));<br>- =C2=
=A0 =C2=A0TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));<b=
r>+ =C2=A0 =C2=A0fd_in =3D RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR=
 | O_BINARY));<br>+ =C2=A0 =C2=A0fd_out =3D RETRY_ON_EINTR(qemu_open_old(fi=
lename_out, O_RDWR | O_BINARY));<br>=C2=A0 =C2=A0 =C2=A0g_free(filename_in)=
;<br>=C2=A0 =C2=A0 =C2=A0g_free(filename_out);<br>=C2=A0 =C2=A0 =C2=A0if (f=
d_in &lt; 0 || fd_out &lt; 0) {<br>@@ -142,7 +142,9 @@ static void qemu_chr=
_open_pipe(Chardev *chr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_out &g=
t;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd_out)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TF=
R(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BINARY));<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd_in =3D fd_out =3D RETRY_ON_EINTR(<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_open_old(filename, O_RDWR | O_BINAR=
Y)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (fd_in &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0erro=
r_setg_file_open(errp, errno, filename);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return;<br>diff --git a/include/qemu/osdep.h b/include/qem=
u/osdep.h<br>index b1c161c035..a470905475 100644<br>--- a/include/qemu/osde=
p.h<br>+++ b/include/qemu/osdep.h<br>@@ -243,7 +243,13 @@ void QEMU_ERROR(&=
quot;code path is reachable&quot;)<br>=C2=A0#define ESHUTDOWN 4099<br>=C2=
=A0#endif<br><br>-#define TFR(expr) do { if ((expr) !=3D -1) break; } while=
 (errno =3D=3D EINTR)<br>+#define RETRY_ON_EINTR(expr) \<br>+ =C2=A0 =C2=A0=
(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0({ typeof(expr) __result; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
o { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__=
result =3D (typeof(expr)) (expr); =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (__result =3D=3D -1L &amp;&amp; errno =
=3D=3D EINTR); =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __re=
sult; }))<br><br>=C2=A0/* time_t may be either 32 or 64 bits depending on t=
he host OS, and<br>=C2=A0 * can be either signed or unsigned, so we can&#39=
;t just hardcode a<br>diff --git a/net/tap-bsd.c b/net/tap-bsd.c<br>index 0=
05ce05c6e..4c98fdd337 100644<br>--- a/net/tap-bsd.c<br>+++ b/net/tap-bsd.c<=
br>@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_=
hdr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dname, &quot;/dev/tap%d&q=
uot;, i);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TFR(fd =3D open(dname, O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =
=3D RETRY_ON_EINTR(open(dname, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (fd &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
reak;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>@@ -111,7 +111,7 @@ static =
int tap_open_clone(char *ifname, int ifname_size, Error **errp)<br>=C2=A0 =
=C2=A0 =C2=A0int fd, s, ret;<br>=C2=A0 =C2=A0 =C2=A0struct ifreq ifr;<br><b=
r>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TAP, O_RDWR));<br>+ =C2=A0 =C2=A0=
fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0i=
f (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp,=
 errno, &quot;could not open %s&quot;, PATH_NET_TAP);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -1;<br>@@ -159,7 +159,7 @@ int tap_open(char *ifnam=
e, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0if (ifname[0] !=
=3D &#39;\0&#39;) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char dname[100];<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dname, &quot;/de=
v/%s&quot;, ifname);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D open(dname,=
 O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(open(dname=
, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0 &amp;&amp; e=
rrno !=3D ENOENT) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0erro=
r_setg_errno(errp, errno, &quot;could not open %s&quot;, dname);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/net/tap=
-linux.c b/net/tap-linux.c<br>index 304ff45071..f54f308d35 100644<br>--- a/=
net/tap-linux.c<br>+++ b/net/tap-linux.c<br>@@ -45,7 +45,7 @@ int tap_open(=
char *ifname, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0int le=
n =3D sizeof(struct virtio_net_hdr);<br>=C2=A0 =C2=A0 =C2=A0unsigned int fe=
atures;<br><br>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TUN, O_RDWR));<br>+ =
=C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));<br>=C2=A0 =
=C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_se=
tg_errno(errp, errno, &quot;could not open %s&quot;, PATH_NET_TUN);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/net/tap-solaris.c=
 b/net/tap-solaris.c<br>index a44f8805c2..38e15028bf 100644<br>--- a/net/ta=
p-solaris.c<br>+++ b/net/tap-solaris.c<br>@@ -84,13 +84,13 @@ static int ta=
p_alloc(char *dev, size_t dev_size, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0if=
( ip_fd )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ip_fd);<br><br>- =C2=A0 =C2=
=A0TFR(ip_fd =3D open(&quot;/dev/udp&quot;, O_RDWR, 0));<br>+ =C2=A0 =C2=A0=
ip_fd =3D RETRY_ON_EINTR(open(&quot;/dev/udp&quot;, O_RDWR, 0));<br>=C2=A0 =
=C2=A0 =C2=A0if (ip_fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error=
_setg(errp, &quot;Can&#39;t open /dev/ip (actually /dev/udp)&quot;);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0}<br><br>-=
 =C2=A0 =C2=A0TFR(tap_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0));<br>+ =
=C2=A0 =C2=A0tap_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR, 0=
));<br>=C2=A0 =C2=A0 =C2=A0if (tap_fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /dev/tap&quot;);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>@@ -104,7 +104,7 @@ static int tap=
_alloc(char *dev, size_t dev_size, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0if =
((ppa =3D ioctl (tap_fd, I_STR, &amp;strioc_ppa)) &lt; 0)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t assign new interface&quot;=
);<br><br>- =C2=A0 =C2=A0TFR(if_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0=
));<br>+ =C2=A0 =C2=A0if_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O=
_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=A0if (if_fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /dev/tap (2)&quot;);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>@@ -137,7 +137,7 @@ sta=
tic int tap_alloc(char *dev, size_t dev_size, Error **errp)<br>=C2=A0 =C2=
=A0 =C2=A0if (ioctl (ip_fd, I_PUSH, &quot;arp&quot;) &lt; 0)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t push ARP module (3)&qu=
ot;);<br>=C2=A0 =C2=A0 =C2=A0/* Open arp_fd */<br>- =C2=A0 =C2=A0TFR(arp_fd=
 =3D open (&quot;/dev/tap&quot;, O_RDWR, 0));<br>+ =C2=A0 =C2=A0arp_fd =3D =
RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=
=A0if (arp_fd &lt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&qu=
ot;Can&#39;t open %s&quot;, &quot;/dev/tap&quot;);<br><br>diff --git a/os-p=
osix.c b/os-posix.c<br>index 321fc4bd13..bb27f67bac 100644<br>--- a/os-posi=
x.c<br>+++ b/os-posix.c<br>@@ -266,7 +266,7 @@ void os_setup_post(void)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;not able=
 to chdir to /: %s&quot;, strerror(errno));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0exit(1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D qemu_open_old(&quot;/dev/null&quot;, =
O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(qemu_open_o=
ld(&quot;/dev/null&quot;, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1=
);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>--<br>2.37.3<br>-- <br><div di=
r=3D"ltr"><div dir=3D"ltr">Best Regards,<div><b>Nikita Ivanov</b> | C devel=
oper</div><div><b>Telephone:</b> +79140870696<br></div><div><div><b>Telepho=
ne:</b>=C2=A0+79015053149</div></div></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003a265405ead71c9a--

