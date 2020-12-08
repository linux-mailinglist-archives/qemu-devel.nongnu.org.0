Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03F2D2B3C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:41:15 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcIs-0004BT-4d
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmcH2-0003Wt-79
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:39:20 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmcGz-00032i-HS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:39:19 -0500
Received: by mail-ej1-x642.google.com with SMTP id f23so24395079ejk.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Op6jBfDYhrTOL5wG3fu5T69FJDd/mJZL/SVgFijRRuQ=;
 b=lrON12lO673TmQZjoXN2xIQxTrAeqtXqjLtkYpUaWsXK7CPSwqCFrkf4YFh2ShTDFQ
 CPBqQH668X5+t/YiF6qXyj3oLv2ktOQCz1tIrFyhDV34c8wRBoM+yPWbsZysaTrt475v
 2c/kEPaLUvluiLBJqjxJWnGWKIsKfmY+1KDTBohwXdXcGVjT0oEUT3U7+Tc2bTWXn0ub
 Jp9BrGIGP92E8WtgFRTYjPBZmijpk3Bk/vX4VS2crU1MyavXx8LI/nIScw2lG52VzCiH
 gg7fskLhdO4LMPxUbBEanEtIAY9AVsoO1s2MfnNLKDQaC1MDw0mOdol8dXsTvHnYc+bG
 vvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Op6jBfDYhrTOL5wG3fu5T69FJDd/mJZL/SVgFijRRuQ=;
 b=NtumQ9f7AL6QVJlql8c+x1tDXjGIsARxdrkD17idN6XE8EX2+GDa0JWciooXelhHyZ
 jdkhrNJcemYAeTNXop3dMl19mVTXShVQvXXUTnN6WQWio9DmmEAAcYrOIEOUH7EprnX4
 UbJeIUxI7ZXPFhWlltr81noJzDwS1u6uVTV/qmEVWzxdwWVcr2OFgAdDY/cnxw1lGY75
 q5HEsy0gnsu1Xlg9VK+hwu2WqMcOG4QVoZQWhyZong1xvQpY25Vo+AryNkczVQppQ8OW
 coyzBTb2cf1P27PRHrEJII52yrxigU4Bd3kHPBmlU96oq70kNmKSxznqgUwo5aZ5cnnu
 GRUw==
X-Gm-Message-State: AOAM530/HaVaIIc1vg4qxk9j3S+lDfOdNwRvqrwvP8fDCtXt5JqYM80F
 zqkWl0Co59Pc3R0J5XbmPNQcy+iLOAAHdhj2UBY=
X-Google-Smtp-Source: ABdhPJxms8wkne7Ukdl1oqSHZorQuc5haUv+UHT6c4iR58ySdFgV2kq7DxoUFEEh+3AV//OnRGl8b1pZo79nBwD8pOs=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr23144548ejb.532.1607431155201; 
 Tue, 08 Dec 2020 04:39:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <75c61eaf356343f207ad8d4e244cd3f9a36de792.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <75c61eaf356343f207ad8d4e244cd3f9a36de792.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:39:03 +0400
Message-ID: <CAJ+F1CJiwy6TVXLsnA=SezM2U0_D1p1OGmQx8mWx89mwmtFhWw@mail.gmail.com>
Subject: Re: [PATCH v12 13/19] multi-process: add proxy communication functions
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000001be9105b5f33bc9"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001be9105b5f33bc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/mpqemu-link.h |  4 ++++
>  hw/remote/mpqemu-link.c         | 38
> ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/include/hw/remote/mpqemu-link.h
> b/include/hw/remote/mpqemu-link.h
> index 070ac77..cee9468 100644
> --- a/include/hw/remote/mpqemu-link.h
> +++ b/include/hw/remote/mpqemu-link.h
> @@ -15,6 +15,8 @@
>  #include "qemu/thread.h"
>  #include "io/channel.h"
>  #include "exec/hwaddr.h"
> +#include "io/channel-socket.h"
> +#include "hw/remote/proxy.h"
>
>  #define REMOTE_MAX_FDS 8
>
> @@ -65,6 +67,8 @@ typedef struct {
>      int num_fds;
>  } MPQemuMsg;
>
> +uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev
> *pdev,
> +                                         Error **errp);
>  void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
>  void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
>
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index bbd9df3..18c8a54 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -17,6 +17,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "io/channel.h"
>
>  /*
>   * Send message over the ioc QIOChannel.
> @@ -219,6 +220,43 @@ fail:
>      }
>  }
>
> +/*
> + * Called from VCPU thread in non-coroutine context.
>

You could check that precondition in code early on, presumably.

The comment could use some further description, like "Send @msg and wait
for a RET_MSG reply. Returns the associated u64 message code, or UINT64_MAX
on error."

+ */
> +uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev
> *pdev,
> +                                         Error **errp)
> +{
> +    MPQemuMsg msg_reply =3D {0};
> +    uint64_t ret =3D UINT64_MAX;
> +    Error *local_err =3D NULL;
> +
>

Should work with ERRP_GUARD instead

+    qemu_mutex_lock(&pdev->io_mutex);
>

Should work with QEMU_LOCK_GUARD

+    mpqemu_msg_send(msg, pdev->ioc, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto exit_send;
> +    }
> +
>

By making mpqemu_msg_send() return true on success, this should then become
simply

if (!mpqemu_msg_send(msg, pdev->ioc, errp))
  return ret;

+    mpqemu_msg_recv(&msg_reply, pdev->ioc, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto exit_send;
> +    }
> +
> +    if (!mpqemu_msg_valid(&msg_reply) || msg_reply.cmd !=3D RET_MSG) {
> +        error_setg(errp, "ERROR: Invalid reply received for command %d",
> +                         msg->cmd);
> +        goto exit_send;
> +    } else {
>

that else is unneeded.

The function with automatic cleanups should be simpler.

+        ret =3D msg_reply.data.u64;
> +    }
> +
> + exit_send:
> +    qemu_mutex_unlock(&pdev->io_mutex);
> +
> +    return ret;
> +}
> +
>  bool mpqemu_msg_valid(MPQemuMsg *msg)
>  {
>      if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000001be9105b5f33bc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagannathan R=
aman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" target=3D=
"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/mpqemu-link.h |=C2=A0 4 ++++<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++=
+++++++++++++++++++++++++++++++<br>
=C2=A02 files changed, 42 insertions(+)<br>
<br>
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-lin=
k.h<br>
index 070ac77..cee9468 100644<br>
--- a/include/hw/remote/mpqemu-link.h<br>
+++ b/include/hw/remote/mpqemu-link.h<br>
@@ -15,6 +15,8 @@<br>
=C2=A0#include &quot;qemu/thread.h&quot;<br>
=C2=A0#include &quot;io/channel.h&quot;<br>
=C2=A0#include &quot;exec/hwaddr.h&quot;<br>
+#include &quot;io/channel-socket.h&quot;<br>
+#include &quot;hw/remote/proxy.h&quot;<br>
<br>
=C2=A0#define REMOTE_MAX_FDS 8<br>
<br>
@@ -65,6 +67,8 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0int num_fds;<br>
=C2=A0} MPQemuMsg;<br>
<br>
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Er=
ror **errp);<br>
=C2=A0void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);<=
br>
=C2=A0void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);<=
br>
<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
index bbd9df3..18c8a54 100644<br>
--- a/hw/remote/mpqemu-link.c<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Send message over the ioc QIOChannel.<br>
@@ -219,6 +220,43 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Called from VCPU thread in non-coroutine context.<br></blockquote><div>=
<br></div><div>You could check that precondition in code early on, presumab=
ly. <br></div><div><br></div><div>The comment could use some further descri=
ption, like &quot;Send @msg and wait for a RET_MSG reply. Returns the assoc=
iated u64 message code, or UINT64_MAX on error.&quot;</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Er=
ror **errp)<br>
+{<br>
+=C2=A0 =C2=A0 MPQemuMsg msg_reply =3D {0};<br>
+=C2=A0 =C2=A0 uint64_t ret =3D UINT64_MAX;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br></blockquote><div><br></div><div>Should work with ERRP_GUARD instead<b=
r> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 qemu_mutex_lock(&amp;pdev-&gt;io_mutex);<br></blockquote><di=
v><br></div><div>Should work with QEMU_LOCK_GUARD</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 mpqemu_msg_send(msg, pdev-&gt;ioc, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit_send;<br>
+=C2=A0 =C2=A0 }<br>
+<br></blockquote><div><br></div><div>By making  mpqemu_msg_send() return t=
rue on success, this should then become simply</div><div><br></div><div>if =
(!mpqemu_msg_send(msg, pdev-&gt;ioc, errp))</div><div>=C2=A0 return ret;<br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 mpqemu_msg_recv(&amp;msg_reply, pdev-&gt;ioc, &amp;local_err=
);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit_send;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!mpqemu_msg_valid(&amp;msg_reply) || msg_reply.cmd !=3D =
RET_MSG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;ERROR: Invalid reply re=
ceived for command %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0msg-&gt;cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit_send;<br>
+=C2=A0 =C2=A0 } else {<br></blockquote><div><br></div><div>that else is un=
needed.</div><div><br></div><div>The function with automatic cleanups shoul=
d be simpler.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D msg_reply.data.u64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+ exit_send:<br>
+=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;pdev-&gt;io_mutex);<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0bool mpqemu_msg_valid(MPQemuMsg *msg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (msg-&gt;cmd &gt;=3D MPQEMU_CMD_MAX &amp;&amp; msg-&=
gt;cmd &lt; 0) {<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000001be9105b5f33bc9--

