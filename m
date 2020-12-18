Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3722DE217
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:41:58 +0100 (CET)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqE8z-0004Um-QS
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqE77-0003b2-68
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:40:01 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqE74-0007Hj-QZ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:40:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id h16so2018197edt.7
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=62vgbzNic+CZL4Az60lGGnFvaJjKMKTC7d2MxqkCb5k=;
 b=ZKrMZ0sJD7P2+dGdfUHsdoHi6jDTp9v72laNeAmkNQtlz6ueNb/QpYmOSIeVWb+356
 02dBtZXh8ITPmQpqWnFDRZFR3n31SMwiaoL2rmnkLQ/rA0d+Gz98jsk8ZVA5Oej+NhOA
 Bb9KpXjGOzHwpNoIrrmudMveRoheOUPxK30XAOaSIRBwobLGe8r/Gy3zltKmOEUDnkHs
 g9M9b2Alt7hwvQFgjdMIaJYsXj12PMFSxKKADprK4OZn17A2dAoMBib7ClTjzmrGoWE2
 mL8SPoXBWwb8lD1V74c0+roHWx0qOY3h1SKBt58BGerdtgOSZ4MB3NX2STwg3ZBUfHi6
 CZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=62vgbzNic+CZL4Az60lGGnFvaJjKMKTC7d2MxqkCb5k=;
 b=gZ8VPr//ptGu8YRBK6BTeSXlr3P7W30dMxhlbzZlX6Hycxx4Pn8BaPOc/1kfKIOfxQ
 KUpj/WZ06U6dc6ynEfnkPktvCEUm0PbP4Hn70GS1Wlqlsn1+CtiYPoM7SvmhPIQkEmMT
 tSvGMEEoJAJBPUMQhlGrECda2NHjsLqzf5Xsyyoczv6vdC7jjkxJZymeBiCm3OaMFn4+
 og5rQPdmYBCsQIUzFJRmeooBLd4CIpQX0ohEvUZ01U27NhEInzmeOOZ6qOSdVG4qgjmI
 H9GvEPKwV4TE6erAJxAAvlN1OCbL+CcHs7eTTNj0m8zm27oIyTsczkfBWfzREBpZS861
 LKpA==
X-Gm-Message-State: AOAM532j3IqE9VXU0S2OMNSEEb2fLMihQ0nBoABoqFk48mgYKGrmxLVT
 YHVhQihoxp/GOWoUA5Lx3Dp9d28o9O3BB7ZN18w=
X-Google-Smtp-Source: ABdhPJyMBVXE34yMIcstgRSS6DAAvUGcVHM6WQgsNto86T/9wQ6ntaqL8zc06fiZEQS2Fzfmhtp//xbHrSV1oCiufwA=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr3952003edb.237.1608291595780; 
 Fri, 18 Dec 2020 03:39:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
 <8b5f13cc11701ed8a61273aef88eeee0f0aa44c6.1608263018.git.elena.ufimtseva@oracle.com>
In-Reply-To: <8b5f13cc11701ed8a61273aef88eeee0f0aa44c6.1608263018.git.elena.ufimtseva@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Dec 2020 15:39:44 +0400
Message-ID: <CAJ+F1CJ65vE=CsUYPbC776bQ9bP2PyRUpi54G8YEnE0GeEfiNg@mail.gmail.com>
Subject: Re: [PATCH v14 04/21] socket: export socket_get_fd() function
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000043076105b6bb9175"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043076105b6bb9175
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 18, 2020 at 7:59 AM <elena.ufimtseva@oracle.com> wrote:

> From: Jagannathan Raman <jag.raman@oracle.com>
>
> Export socket_get_fd() helper function. The function protorype is
> changed to be more generic. Use monitor_fd_param() instead of
> monitor_fd_get() in order to support named fds as well.
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> ---
>  include/qemu/sockets.h    |  1 +
>  stubs/monitor.c           |  2 +-
>  tests/test-util-sockets.c |  2 +-
>  util/qemu-sockets.c       | 18 ++++++++++--------
>  4 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 7d1f813576..d87cf9f1c5 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);
>  int unix_connect(const char *path, Error **errp);
>
>  SocketAddress *socket_parse(const char *str, Error **errp);
> +int socket_get_fd(const char *fdstr, Error **errp);
>  int socket_connect(SocketAddress *addr, Error **errp);
>  int socket_listen(SocketAddress *addr, int num, Error **errp);
>  void socket_listen_cleanup(int fd, Error **errp);
> diff --git a/stubs/monitor.c b/stubs/monitor.c
> index 20786ac4ff..6e6850cd3a 100644
> --- a/stubs/monitor.c
> +++ b/stubs/monitor.c
> @@ -3,7 +3,7 @@
>  #include "monitor/monitor.h"
>  #include "../monitor/monitor-internal.h"
>
> -int monitor_get_fd(Monitor *mon, const char *name, Error **errp)
> +int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
>  {
>      error_setg(errp, "only QEMU supports file descriptor passing");
>      return -1;
> diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
> index 67486055ed..e790a0af25 100644
> --- a/tests/test-util-sockets.c
> +++ b/tests/test-util-sockets.c
> @@ -54,7 +54,7 @@ static int mon_fd =3D -1;
>  static const char *mon_fdname;
>  __thread Monitor *cur_mon;
>
> -int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
> +int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
>  {
>      g_assert(cur_mon);
>      g_assert(mon =3D=3D cur_mon);
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15..694552cb7d 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1116,16 +1116,12 @@ fail:
>      return NULL;
>  }
>
> -static int socket_get_fd(const char *fdstr, int num, Error **errp)
> +int socket_get_fd(const char *fdstr, Error **errp)
>  {
>      Monitor *cur_mon =3D monitor_cur();
>      int fd;
> -    if (num !=3D 1) {
> -        error_setg_errno(errp, EINVAL, "socket_get_fd: too many
> connections");
> -        return -1;
> -    }
>      if (cur_mon) {
> -        fd =3D monitor_get_fd(cur_mon, fdstr, errp);
> +        fd =3D monitor_fd_param(cur_mon, fdstr, errp);
>

It's not a good idea to change 2 things in the same patch. Although here
the change is fairly small, it may have consequences that are unrelated,
and we may want to revert just that.

Here, if the fd name is numeric, it will break current users. So I am
afraid we can't change it like that. Perhaps add a flag like
"named_fd_only" and call one or the other?

On a related note, I find it quite confusing that we have -add-fd using
fdset, but qmp 'getfd' for named fd (and no command line version?). Some
commands can use fdset (all with file path, since /dev/fdset/ makes it
accessible), while others rely on monitor_get_fd(). It's an area that could
benefit cleanups and better API/docs. That's not for you to do though, just
me mumbling.



>          if (fd < 0) {
>              return -1;
>          }
> @@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **err=
p)
>          break;
>
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd =3D socket_get_fd(addr->u.fd.str, 1, errp);
> +        fd =3D socket_get_fd(addr->u.fd.str, errp);
>          break;
>
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> @@ -1177,6 +1173,12 @@ int socket_listen(SocketAddress *addr, int num,
> Error **errp)
>      int fd;
>
>      trace_socket_listen(num);
> +
> +    if (num !=3D 1) {
> +        error_setg_errno(errp, EINVAL, "socket_get_fd: too many
> connections");
>

You should also change the error message to locate socket_listen instead.

+        return -1;
> +    }
> +
>      switch (addr->type) {
>      case SOCKET_ADDRESS_TYPE_INET:
>          fd =3D inet_listen_saddr(&addr->u.inet, 0, num, errp);
> @@ -1187,7 +1189,7 @@ int socket_listen(SocketAddress *addr, int num,
> Error **errp)
>          break;
>
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd =3D socket_get_fd(addr->u.fd.str, num, errp);
> +        fd =3D socket_get_fd(addr->u.fd.str, errp);
>          break;
>
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> --
> 2.25.GIT
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000043076105b6bb9175
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 7:59 AM &lt=
;<a href=3D"mailto:elena.ufimtseva@oracle.com">elena.ufimtseva@oracle.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D=
"_blank">jag.raman@oracle.com</a>&gt;<br>
<br>
Export socket_get_fd() helper function. The function protorype is<br>
changed to be more generic. Use monitor_fd_param() instead of<br>
monitor_fd_get() in order to support named fds as well.<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0stubs/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0tests/test-util-sockets.c |=C2=A0 2 +-<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++--------=
<br>
=C2=A04 files changed, 13 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
index 7d1f813576..d87cf9f1c5 100644<br>
--- a/include/qemu/sockets.h<br>
+++ b/include/qemu/sockets.h<br>
@@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);<br>
=C2=A0int unix_connect(const char *path, Error **errp);<br>
<br>
=C2=A0SocketAddress *socket_parse(const char *str, Error **errp);<br>
+int socket_get_fd(const char *fdstr, Error **errp);<br>
=C2=A0int socket_connect(SocketAddress *addr, Error **errp);<br>
=C2=A0int socket_listen(SocketAddress *addr, int num, Error **errp);<br>
=C2=A0void socket_listen_cleanup(int fd, Error **errp);<br>
diff --git a/stubs/monitor.c b/stubs/monitor.c<br>
index 20786ac4ff..6e6850cd3a 100644<br>
--- a/stubs/monitor.c<br>
+++ b/stubs/monitor.c<br>
@@ -3,7 +3,7 @@<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;../monitor/monitor-internal.h&quot;<br>
<br>
-int monitor_get_fd(Monitor *mon, const char *name, Error **errp)<br>
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;only QEMU supports file descript=
or passing&quot;);<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c<br>
index 67486055ed..e790a0af25 100644<br>
--- a/tests/test-util-sockets.c<br>
+++ b/tests/test-util-sockets.c<br>
@@ -54,7 +54,7 @@ static int mon_fd =3D -1;<br>
=C2=A0static const char *mon_fdname;<br>
=C2=A0__thread Monitor *cur_mon;<br>
<br>
-int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)<br>
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert(cur_mon);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(mon =3D=3D cur_mon);<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 8af0278f15..694552cb7d 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -1116,16 +1116,12 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-static int socket_get_fd(const char *fdstr, int num, Error **errp)<br>
+int socket_get_fd(const char *fdstr, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Monitor *cur_mon =3D monitor_cur();<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 if (num !=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, EINVAL, &quot;socket_ge=
t_fd: too many connections&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (cur_mon) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D monitor_get_fd(cur_mon, fdstr, errp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D monitor_fd_param(cur_mon, fdstr, errp);=
<br></blockquote><div><br></div><div>It&#39;s not a good idea to change 2 t=
hings in the same patch. Although here the change is fairly small, it may h=
ave consequences that are unrelated, and we may want to revert just that.<b=
r></div><div><br></div><div>Here, if the fd name is numeric, it will break =
current users. So I am afraid we can&#39;t change it like that. Perhaps add=
 a flag like &quot;named_fd_only&quot; and call one or the other?<br></div>=
<div><br></div><div>On a related note, I find it quite confusing that we ha=
ve -add-fd using fdset, but qmp &#39;getfd&#39; for named fd (and no comman=
d line version?). Some commands can use fdset (all with file path, since /d=
ev/fdset/ makes it accessible), while others rely on monitor_get_fd(). It&#=
39;s an area that could benefit cleanups and better API/docs. That&#39;s no=
t for you to do though, just me mumbling.<br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case SOCKET_ADDRESS_TYPE_FD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_get_fd(addr-&gt;u.fd.str, 1, err=
p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_get_fd(addr-&gt;u.fd.str, errp);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case SOCKET_ADDRESS_TYPE_VSOCK:<br>
@@ -1177,6 +1173,12 @@ int socket_listen(SocketAddress *addr, int num, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_socket_listen(num);<br>
+<br>
+=C2=A0 =C2=A0 if (num !=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, EINVAL, &quot;socket_ge=
t_fd: too many connections&quot;);<br></blockquote><div><br></div><div>You =
should also change the error message to locate socket_listen instead.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0switch (addr-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0case SOCKET_ADDRESS_TYPE_INET:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D inet_listen_saddr(&amp;addr-&gt;u.=
inet, 0, num, errp);<br>
@@ -1187,7 +1189,7 @@ int socket_listen(SocketAddress *addr, int num, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case SOCKET_ADDRESS_TYPE_FD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_get_fd(addr-&gt;u.fd.str, num, e=
rrp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_get_fd(addr-&gt;u.fd.str, errp);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case SOCKET_ADDRESS_TYPE_VSOCK:<br>
-- <br>
2.25.GIT<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000043076105b6bb9175--

