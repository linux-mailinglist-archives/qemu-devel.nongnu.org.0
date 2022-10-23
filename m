Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11751609913
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:13:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omlOg-0003Pn-9z
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 20:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWvH-0007FO-Pa
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:05:35 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWvF-0001sx-7x
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:05:35 -0400
Received: by mail-vs1-xe29.google.com with SMTP id 128so5305571vsz.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A32viGiOLmhxP2YJ5iIIeVJ17Js4rAOythNeAvQtFzY=;
 b=YhLXwZRg0pbRUGP47leztXAuPZgrolYxvtIrtbe24uOh9QMKgw0tVdzHGGsY5gECUx
 extJWSUc9me5a6A7jwy3QxrXShJ5mBbg2XUTp22qHGFXbmC2e1rfBZTZyKpvJQ4Usqlt
 +MSvd4MC1oHL+XgTL9uYP9V8TVDvCddYOK6EFWpi0ED4JZT4JkGLD5URELs844V5PXAu
 1kw0OgJPSpGb4O5Tgm3siZcdHwyqOy6SkJS81xNpJKYgRx/TyzXFGTWVsMMZaUjE4+dK
 FW+6cQ5SrmNHuR29Z8i2OGXDtjfpqJmqBAIXpXejP9evemxLlfnrou4unmfpjHDZdPGs
 zlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A32viGiOLmhxP2YJ5iIIeVJ17Js4rAOythNeAvQtFzY=;
 b=qmwRkWZWjViM7LF7otZL2kOFydbJ878qSMnIUHVOQm1miaBLG7ro/dz/H/C2kpQ+6s
 XfaclMHCTFu8eRuF/8EG/lo8RPzbwkse7hxjazMw7tETdq+SHNmZlnbthveVBDh2Bn5a
 M48sgd/Klr525Kt14ycoM8wogy9xumyqLMJttElmlKnzLo0D0e4B3QJuOtBAapmzPqDK
 NFpD9jNFMmZsk/H4VBgx2ggAvF8SAwy+y61mhk2dz2qMDflp/qXxQ/AABDpJQ1QtkPlC
 QCbZ/y8JETb2HG+VWIvTUyYk4J9SHHfbkKBwLv3lXCQ/CKiFaTHbPGhmSPSJ271zmfaI
 owyA==
X-Gm-Message-State: ACrzQf3OAXGT1OXmetH/EMYsyItm9SE2UwJrTqtgvNhjk0U43L6iDF0I
 KRo18LLAiO/XeXa/YV6UmEp8WgI7s06kqSkp/IlK/g==
X-Google-Smtp-Source: AMsMyM6aMioUZFRS8qjo39wB31dEauyhI/hQAKM2nijDv5wkRZvyWkjMyImWvmiTof/RTmze9sOEXkFZqx4GWipLM5w=
X-Received: by 2002:a05:6102:3d84:b0:3aa:1416:b500 with SMTP id
 h4-20020a0561023d8400b003aa1416b500mr1838053vsv.64.1666515931802; Sun, 23 Oct
 2022 02:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
 <20221018084341.16270-2-nivanov@cloudlinux.com> <3388065.HNbAOOnhXR@silver>
In-Reply-To: <3388065.HNbAOOnhXR@silver>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Sun, 23 Oct 2022 12:05:21 +0300
Message-ID: <CAAJ4Ao9f=A11qYr+3oeDL3sFYJ_7vfVf+OF0U05KiK6eCpoGGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000020dfdf05ebaffa95"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=nivanov@cloudlinux.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000020dfdf05ebaffa95
Content-Type: text/plain; charset="UTF-8"

Hi!
Thanks for mentioning the issue. Corrected it in v4.

On Wed, Oct 19, 2022 at 6:40 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Dienstag, 18. Oktober 2022 10:43:40 CEST Nikita Ivanov wrote:
> > Rename macro name to more transparent one and refactor
> > it to expression.
> >
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> >  chardev/char-fd.c      | 2 +-
> >  chardev/char-pipe.c    | 8 +++++---
> >  include/qemu/osdep.h   | 8 +++++++-
> >  net/tap-bsd.c          | 6 +++---
> >  net/tap-linux.c        | 2 +-
> >  net/tap-solaris.c      | 8 ++++----
> >  net/tap.c              | 2 +-
> >  os-posix.c             | 2 +-
> >  tests/qtest/libqtest.c | 2 +-
> >  9 files changed, 24 insertions(+), 16 deletions(-)
> >
> > diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> > index cf78454841..d2c4923359 100644
> > --- a/chardev/char-fd.c
> > +++ b/chardev/char-fd.c
> > @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int
> flags, Error **errp)
> >  {
> >      int fd = -1;
> >
> > -    TFR(fd = qemu_open_old(src, flags, 0666));
> > +    fd = RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
> >      if (fd == -1) {
> >          error_setg_file_open(errp, errno, src);
> >      }
> > diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> > index 66d3b85091..5ad30bcc59 100644
> > --- a/chardev/char-pipe.c
> > +++ b/chardev/char-pipe.c
> > @@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
> >
> >      filename_in = g_strdup_printf("%s.in", filename);
> >      filename_out = g_strdup_printf("%s.out", filename);
> > -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> > -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> > +    fd_in = RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR |
> O_BINARY));
> > +    fd_out = RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR |
> O_BINARY));
> >      g_free(filename_in);
> >      g_free(filename_out);
> >      if (fd_in < 0 || fd_out < 0) {
> > @@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
> >          if (fd_out >= 0) {
> >              close(fd_out);
> >          }
> > -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR |
> O_BINARY));
> > +        fd_in = fd_out = RETRY_ON_EINTR(
> > +            qemu_open_old(filename, O_RDWR | O_BINARY)
> > +        );
> >          if (fd_in < 0) {
> >              error_setg_file_open(errp, errno, filename);
> >              return;
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index b1c161c035..45fcf5f2dc 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
> >  #define ESHUTDOWN 4099
> >  #endif
> >
> > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#define RETRY_ON_EINTR(expr) \
> > +    (__extension__                                          \
> > +        ({ typeof(expr) __result;                               \
> > +           do {                                             \
> > +                __result = (typeof(expr)) (expr);         \
>
> You forgot to drop the redundant type cast here. With that dropped:
>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>
> > +           } while (__result == -1 && errno == EINTR);     \
> > +           __result; }))
> >
> >  /* time_t may be either 32 or 64 bits depending on the host OS, and
> >   * can be either signed or unsigned, so we can't just hardcode a
> > diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> > index 005ce05c6e..4c98fdd337 100644
> > --- a/net/tap-bsd.c
> > +++ b/net/tap-bsd.c
> > @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
> >          } else {
> >              snprintf(dname, sizeof dname, "/dev/tap%d", i);
> >          }
> > -        TFR(fd = open(dname, O_RDWR));
> > +        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
> >          if (fd >= 0) {
> >              break;
> >          }
> > @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
> ifname_size, Error **errp)
> >      int fd, s, ret;
> >      struct ifreq ifr;
> >
> > -    TFR(fd = open(PATH_NET_TAP, O_RDWR));
> > +    fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
> >      if (fd < 0) {
> >          error_setg_errno(errp, errno, "could not open %s",
> PATH_NET_TAP);
> >          return -1;
> > @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
> >      if (ifname[0] != '\0') {
> >          char dname[100];
> >          snprintf(dname, sizeof dname, "/dev/%s", ifname);
> > -        TFR(fd = open(dname, O_RDWR));
> > +        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
> >          if (fd < 0 && errno != ENOENT) {
> >              error_setg_errno(errp, errno, "could not open %s", dname);
> >              return -1;
> > diff --git a/net/tap-linux.c b/net/tap-linux.c
> > index 304ff45071..f54f308d35 100644
> > --- a/net/tap-linux.c
> > +++ b/net/tap-linux.c
> > @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
> >      int len = sizeof(struct virtio_net_hdr);
> >      unsigned int features;
> >
> > -    TFR(fd = open(PATH_NET_TUN, O_RDWR));
> > +    fd = RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
> >      if (fd < 0) {
> >          error_setg_errno(errp, errno, "could not open %s",
> PATH_NET_TUN);
> >          return -1;
> > diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> > index a44f8805c2..38e15028bf 100644
> > --- a/net/tap-solaris.c
> > +++ b/net/tap-solaris.c
> > @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size,
> Error **errp)
> >      if( ip_fd )
> >         close(ip_fd);
> >
> > -    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
> > +    ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
> >      if (ip_fd < 0) {
> >          error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
> >          return -1;
> >      }
> >
> > -    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
> > +    tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
> >      if (tap_fd < 0) {
> >          error_setg(errp, "Can't open /dev/tap");
> >          return -1;
> > @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size,
> Error **errp)
> >      if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
> >          error_report("Can't assign new interface");
> >
> > -    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
> > +    if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
> >      if (if_fd < 0) {
> >          error_setg(errp, "Can't open /dev/tap (2)");
> >          return -1;
> > @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size,
> Error **errp)
> >      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
> >          error_report("Can't push ARP module (3)");
> >      /* Open arp_fd */
> > -    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
> > +    arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
> >      if (arp_fd < 0)
> >          error_report("Can't open %s", "/dev/tap");
> >
> > diff --git a/net/tap.c b/net/tap.c
> > index e203d07a12..e090d14203 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *tap,
> int *vnet_hdr,
> >          vnet_hdr_required = 0;
> >      }
> >
> > -    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
> > +    fd = RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr,
> vnet_hdr_required,
> >                        mq_required, errp));
> >      if (fd < 0) {
> >          return -1;
> > diff --git a/os-posix.c b/os-posix.c
> > index 321fc4bd13..bb27f67bac 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -266,7 +266,7 @@ void os_setup_post(void)
> >              error_report("not able to chdir to /: %s", strerror(errno));
> >              exit(1);
> >          }
> > -        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
> > +        fd = RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
> >          if (fd == -1) {
> >              exit(1);
> >          }
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index b23eb3edc3..90648eb8d1 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
> >      /* Skip wait if qtest_probe_child already reaped.  */
> >      if (pid != -1) {
> >          kill(pid, SIGTERM);
> > -        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> > +        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
> >          assert(pid == s->qemu_pid);
> >          s->qemu_pid = -1;
> >      }
> >
>
>
>
>

-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--00000000000020dfdf05ebaffa95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br>Thanks for mentioning the issue. Corrected it in v4=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Oct 19, 2022 at 6:40 PM Christian Schoenebeck &lt;<a href=3D"mailt=
o:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Dienstag, 18. Oktober 20=
22 10:43:40 CEST Nikita Ivanov wrote:<br>
&gt; Rename macro name to more transparent one and refactor<br>
&gt; it to expression.<br>
&gt; <br>
&gt; Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.=
com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 chardev/char-pipe.c=C2=A0 =C2=A0 | 8 +++++---<br>
&gt;=C2=A0 include/qemu/osdep.h=C2=A0 =C2=A0| 8 +++++++-<br>
&gt;=C2=A0 net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
&gt;=C2=A0 net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-=
<br>
&gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 tests/qtest/libqtest.c | 2 +-<br>
&gt;=C2=A0 9 files changed, 24 insertions(+), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>
&gt; index cf78454841..d2c4923359 100644<br>
&gt; --- a/chardev/char-fd.c<br>
&gt; +++ b/chardev/char-fd.c<br>
&gt; @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int fl=
ags, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fd =3D -1;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(fd =3D qemu_open_old(src, flags, 0666));<br>
&gt; +=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, sr=
c);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c<br>
&gt; index 66d3b85091..5ad30bcc59 100644<br>
&gt; --- a/chardev/char-pipe.c<br>
&gt; +++ b/chardev/char-pipe.c<br>
&gt; @@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 filename_in =3D g_strdup_printf(&quot;%<a href=3D"=
http://s.in" rel=3D"noreferrer" target=3D"_blank">s.in</a>&quot;, filename)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filename_out =3D g_strdup_printf(&quot;%s.out&quot=
;, filename);<br>
&gt; -=C2=A0 =C2=A0 TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BIN=
ARY));<br>
&gt; -=C2=A0 =C2=A0 TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_B=
INARY));<br>
&gt; +=C2=A0 =C2=A0 fd_in =3D RETRY_ON_EINTR(qemu_open_old(filename_in, O_R=
DWR | O_BINARY));<br>
&gt; +=C2=A0 =C2=A0 fd_out =3D RETRY_ON_EINTR(qemu_open_old(filename_out, O=
_RDWR | O_BINARY));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(filename_in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(filename_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd_in &lt; 0 || fd_out &lt; 0) {<br>
&gt; @@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_out &gt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd_in =3D fd_out =3D qemu_open_old(fi=
lename, O_RDWR | O_BINARY));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_in =3D fd_out =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_open_old(filename, O_R=
DWR | O_BINARY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_in &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(e=
rrp, errno, filename);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; index b1c161c035..45fcf5f2dc 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -243,7 +243,13 @@ void QEMU_ERROR(&quot;code path is reachable&quot=
;)<br>
&gt;=C2=A0 #define ESHUTDOWN 4099<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=
=3D EINTR)<br>
&gt; +#define RETRY_ON_EINTR(expr) \<br>
&gt; +=C2=A0 =C2=A0 (__extension__=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ typeof(expr) __result;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __result =3D =
(typeof(expr)) (expr);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
You forgot to drop the redundant type cast here. With that dropped:<br>
<br>
Reviewed-by: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte=
.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (__result =3D=3D -1 =
&amp;&amp; errno =3D=3D EINTR);=C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__result; }))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* time_t may be either 32 or 64 bits depending on the host OS, =
and<br>
&gt;=C2=A0 =C2=A0* can be either signed or unsigned, so we can&#39;t just h=
ardcode a<br>
&gt; diff --git a/net/tap-bsd.c b/net/tap-bsd.c<br>
&gt; index 005ce05c6e..4c98fdd337 100644<br>
&gt; --- a/net/tap-bsd.c<br>
&gt; +++ b/net/tap-bsd.c<br>
&gt; @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vne=
t_hdr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(dname, sizeof=
 dname, &quot;/dev/tap%d&quot;, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D open(dname, O_RDWR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(dname, O_RDWR)=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &gt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int ifname=
_size, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fd, s, ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct ifreq ifr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(fd =3D open(PATH_NET_TAP, O_RDWR));<br>
&gt; +=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;=
could not open %s&quot;, PATH_NET_TAP);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int *v=
net_hdr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ifname[0] !=3D &#39;\0&#39;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char dname[100];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(dname, sizeof dname, &quot;=
/dev/%s&quot;, ifname);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D open(dname, O_RDWR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(dname, O_RDWR)=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0 &amp;&amp; errno !=3D =
ENOENT) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp,=
 errno, &quot;could not open %s&quot;, dname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; diff --git a/net/tap-linux.c b/net/tap-linux.c<br>
&gt; index 304ff45071..f54f308d35 100644<br>
&gt; --- a/net/tap-linux.c<br>
&gt; +++ b/net/tap-linux.c<br>
&gt; @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vne=
t_hdr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int len =3D sizeof(struct virtio_net_hdr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int features;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(fd =3D open(PATH_NET_TUN, O_RDWR));<br>
&gt; +=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;=
could not open %s&quot;, PATH_NET_TUN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; diff --git a/net/tap-solaris.c b/net/tap-solaris.c<br>
&gt; index a44f8805c2..38e15028bf 100644<br>
&gt; --- a/net/tap-solaris.c<br>
&gt; +++ b/net/tap-solaris.c<br>
&gt; @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if( ip_fd )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(ip_fd);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(ip_fd =3D open(&quot;/dev/udp&quot;, O_RDWR, 0));<b=
r>
&gt; +=C2=A0 =C2=A0 ip_fd =3D RETRY_ON_EINTR(open(&quot;/dev/udp&quot;, O_R=
DWR, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ip_fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Can&#39;t ope=
n /dev/ip (actually /dev/udp)&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(tap_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0));<=
br>
&gt; +=C2=A0 =C2=A0 tap_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_=
RDWR, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (tap_fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Can&#39;t ope=
n /dev/tap&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((ppa =3D ioctl (tap_fd, I_STR, &amp;strioc_ppa=
)) &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Can&#39;t assign =
new interface&quot;);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(if_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0));<b=
r>
&gt; +=C2=A0 =C2=A0 if_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_R=
DWR, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (if_fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Can&#39;t ope=
n /dev/tap (2)&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ioctl (ip_fd, I_PUSH, &quot;arp&quot;) &lt; 0)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Can&#39;t push AR=
P module (3)&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Open arp_fd */<br>
&gt; -=C2=A0 =C2=A0 TFR(arp_fd =3D open (&quot;/dev/tap&quot;, O_RDWR, 0));=
<br>
&gt; +=C2=A0 =C2=A0 arp_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_=
RDWR, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (arp_fd &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Can&#39;t open %s=
&quot;, &quot;/dev/tap&quot;);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/net/tap.c b/net/tap.c<br>
&gt; index e203d07a12..e090d14203 100644<br>
&gt; --- a/net/tap.c<br>
&gt; +++ b/net/tap.c<br>
&gt; @@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *ta=
p, int *vnet_hdr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnet_hdr_required =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 TFR(fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_h=
dr_required,<br>
&gt; +=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_=
hdr, vnet_hdr_required,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mq_required, errp));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; diff --git a/os-posix.c b/os-posix.c<br>
&gt; index 321fc4bd13..bb27f67bac 100644<br>
&gt; --- a/os-posix.c<br>
&gt; +++ b/os-posix.c<br>
&gt; @@ -266,7 +266,7 @@ void os_setup_post(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;not=
 able to chdir to /: %s&quot;, strerror(errno));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D qemu_open_old(&quot;/dev/null&=
quot;, O_RDWR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(qemu_open_old(&quot=
;/dev/null&quot;, O_RDWR));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
&gt; index b23eb3edc3..90648eb8d1 100644<br>
&gt; --- a/tests/qtest/libqtest.c<br>
&gt; +++ b/tests/qtest/libqtest.c<br>
&gt; @@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Skip wait if qtest_probe_child already reaped.=
=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (pid !=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(pid, SIGTERM);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(pid =3D waitpid(s-&gt;qemu_pid, &amp;=
s-&gt;wstatus, 0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid =3D RETRY_ON_EINTR(waitpid(s-&gt;qemu=
_pid, &amp;s-&gt;wstatus, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(pid =3D=3D s-&gt;qemu_pid);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;qemu_pid =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--00000000000020dfdf05ebaffa95--

