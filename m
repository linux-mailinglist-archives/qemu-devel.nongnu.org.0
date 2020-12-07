Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872E2D1232
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:35:51 +0100 (CET)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGgA-0000b4-A0
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmGeA-0007n2-DE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:33:46 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmGe5-000731-Ij
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:33:46 -0500
Received: by mail-ej1-x643.google.com with SMTP id lt17so19538035ejb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/JpPNfnFiHKMax9A7Vkh9lJzDcwEOM+xOdwJOQSOoU=;
 b=ENt3oz4FL0ErS78YFlyME9pjD9gCocorYw+iEL55nS06QrPiJbzlxTGFIUoNL2MyzB
 xmsS9Cp3kfApeufmCKylTohHHrTK7DQXgDRwvJ476lbdxMDr5R+Si2UFz6Gcb0ZXM0Qh
 Ef/v7xlR/yVHhS1fvjqcGHLwTXDB/9FHlbGlcXm268PIR2YGUmlVzHVqEFNeCAZ1qSHK
 ODy21WbWt5JiWn9VzkDU+uxhQSRSg7je3YmpmExBpBta0JuFacDwthssibmPud2kzvNr
 lXwSDmrlGnPZGarYo2zTvHyhvY+WH0uBspYdMMghIUTUyOy+cBbdPjcmJGzAPGVC3mYm
 yKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/JpPNfnFiHKMax9A7Vkh9lJzDcwEOM+xOdwJOQSOoU=;
 b=SRZPwNrCP5aUIE1ciiYEyEeviB4040n9EwFKGQ+It2kx3Nq605/jrnrFuzRoZQ384y
 qUhSkEuHFwb3MqNG+xUGRMF2a3NVUn7Mm956nwY/CTrBcaqUx6BWhTh34sjsPIxf1cmE
 FaUYZGqE1wtNoPebTVoG9aNscHwHSp/KwG41QJRRCmJGWYtYgMM2KFlMpy4Dgr7LHp7d
 /CKzXGXtbSO4RbN+1HlWJdzCC+nbRNe+9rdEFvti5ZL9c4+FHmdOJsaDiaizLe1IqFHt
 ikQtxE5Ehy8pZfffTQDLmTZOJZe6idmF9N4tQJGS9LITjfyjhA7hfTekXA3sh5IZkrqd
 8Ezg==
X-Gm-Message-State: AOAM531dkavZeLa9vZwVeVTjP18MQw5LDAERW01J6wOTg0sGoLtEMWSJ
 ha/ojQr7lp51bj+Rc//wKpOi+n4cWJtout/rl/g=
X-Google-Smtp-Source: ABdhPJzuDMlicqCEj4ak5rDkI7B3w2MLjABEcRh3S91a8D91I0SOWgT0Y1kslbakiOxic/jrCZ88xy02P929Vtjl+YQ=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr19021404ejb.532.1607348018964; 
 Mon, 07 Dec 2020 05:33:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <32c713a44d3514b4f0edcd23195e25a10153c347.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <32c713a44d3514b4f0edcd23195e25a10153c347.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Dec 2020 17:33:27 +0400
Message-ID: <CAJ+F1C+O_0Cn_9g6uv3rmjs-7Ha+ZpyAcMKzwqtgGK2xA=YBTA@mail.gmail.com>
Subject: Re: [PATCH v12 09/19] multi-process: Initialize message handler in
 remote device
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000b36dea05b5dfdf95"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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

--000000000000b36dea05b5dfdf95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> Initializes the message handler function in the remote process. It is
> called whenever there's an event pending on QIOChannel that registers
> this function.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/machine.h |  9 +++++++
>  hw/remote/message.c         | 61
> +++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  1 +
>  hw/remote/meson.build       |  1 +
>  4 files changed, 72 insertions(+)
>  create mode 100644 hw/remote/message.c
>
> diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
> index d312972..3073db6 100644
> --- a/include/hw/remote/machine.h
> +++ b/include/hw/remote/machine.h
> @@ -14,6 +14,7 @@
>  #include "qom/object.h"
>  #include "hw/boards.h"
>  #include "hw/pci-host/remote.h"
> +#include "io/channel.h"
>
>  typedef struct RemoteMachineState {
>      MachineState parent_obj;
> @@ -21,8 +22,16 @@ typedef struct RemoteMachineState {
>      RemotePCIHost *host;
>  } RemoteMachineState;
>
> +/* Used to pass to co-routine device and ioc. */
> +typedef struct RemoteCommDev {
> +    PCIDevice *dev;
> +    QIOChannel *ioc;
> +} RemoteCommDev;
> +
>  #define TYPE_REMOTE_MACHINE "x-remote-machine"
>  #define REMOTE_MACHINE(obj) \
>      OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)
>
> +void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
> +
>  #endif
> diff --git a/hw/remote/message.c b/hw/remote/message.c
> new file mode 100644
> index 0000000..5d87bf4
> --- /dev/null
> +++ b/hw/remote/message.c
> @@ -0,0 +1,61 @@
> +/*
> + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL-v2, version 2 or
> later.
> + *
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/machine.h"
> +#include "io/channel.h"
> +#include "hw/remote/mpqemu-link.h"
> +#include "qapi/error.h"
> +#include "sysemu/runstate.h"
> +
> +void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
> +{
> +    RemoteCommDev *com =3D (RemoteCommDev *)data;
> +    PCIDevice *pci_dev =3D NULL;
> +
> +    pci_dev =3D com->dev;
> +    for (;;) {
> +        MPQemuMsg msg =3D {0};
> +        Error *local_err =3D NULL;
> +
> +        if (!com->ioc) {
> +            error_report("ERROR: No channel available");
> +            break;
> +        }
>

Shouldn't this be assert() at the top?


> +        mpqemu_msg_recv(&msg, com->ioc, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            break;
>

Error handling is not consistent in this function. Could you cleanup error
code paths so error handling & reporting is done in one place?

+        }
> +
> +        if (!mpqemu_msg_valid(&msg)) {
> +            error_report("Received invalid message from proxy"
> +                         "in remote process pid=3D%d", getpid());
> +            break;
> +        }
> +
> +        switch (msg.cmd) {
> +        default:
> +            error_setg(&local_err,
> +                       "Unknown command (%d) received for device %s
> (pid=3D%d)",
> +                       msg.cmd, DEVICE(pci_dev)->id, getpid());
> +        }
> +
> +        if (local_err) {
> +            error_report_err(local_err);
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>

Presumably that error handling should be done outside of the for(;;) loop.

SHUTDOWN_CAUSE_HOST_ERROR might be more appropriate in this case, or
perhaps introduce a new ShutdownCause?

+            break;
> +        }
> +    }
> +    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +
> +    return;
>

needless return statement

+}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d0c891a..b64e4b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3143,6 +3143,7 @@ F: hw/remote/machine.c
>  F: include/hw/remote/machine.h
>  F: hw/remote/mpqemu-link.c
>  F: include/hw/remote/mpqemu-link.h
> +F: hw/remote/message.c
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index a2b2fc0..9f5c57f 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -2,5 +2,6 @@ remote_ss =3D ss.source_set()
>
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
>
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b36dea05b5dfdf95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Initializes the message handler function in the remote process. It is<b=
r>
called whenever there&#39;s an event pending on QIOChannel that registers<b=
r>
this function.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/machine.h |=C2=A0 9 +++++++<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 61 +++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A04 files changed, 72 insertions(+)<br>
=C2=A0create mode 100644 hw/remote/message.c<br>
<br>
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h<br>
index d312972..3073db6 100644<br>
--- a/include/hw/remote/machine.h<br>
+++ b/include/hw/remote/machine.h<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/remote.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
<br>
=C2=A0typedef struct RemoteMachineState {<br>
=C2=A0 =C2=A0 =C2=A0MachineState parent_obj;<br>
@@ -21,8 +22,16 @@ typedef struct RemoteMachineState {<br>
=C2=A0 =C2=A0 =C2=A0RemotePCIHost *host;<br>
=C2=A0} RemoteMachineState;<br>
<br>
+/* Used to pass to co-routine device and ioc. */<br>
+typedef struct RemoteCommDev {<br>
+=C2=A0 =C2=A0 PCIDevice *dev;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+} RemoteCommDev;<br>
+<br>
=C2=A0#define TYPE_REMOTE_MACHINE &quot;x-remote-machine&quot;<br>
=C2=A0#define REMOTE_MACHINE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MAC=
HINE)<br>
<br>
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data);<br>
+<br>
=C2=A0#endif<br>
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
new file mode 100644<br>
index 0000000..5d87bf4<br>
--- /dev/null<br>
+++ b/hw/remote/message.c<br>
@@ -0,0 +1,61 @@<br>
+/*<br>
+ * Copyright =C2=A9 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or l=
ater.<br>
+ *<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+<br>
+#include &quot;hw/remote/machine.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;hw/remote/mpqemu-link.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
+<br>
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteCommDev *com =3D (RemoteCommDev *)data;<br>
+=C2=A0 =C2=A0 PCIDevice *pci_dev =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 pci_dev =3D com-&gt;dev;<br>
+=C2=A0 =C2=A0 for (;;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MPQemuMsg msg =3D {0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!com-&gt;ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;ERROR: No cha=
nnel available&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Shouldn&=
#39;t this be assert() at the top?<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mpqemu_msg_recv(&amp;msg, com-&gt;ioc, &amp;lo=
cal_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br></blockquote><div><br>=
</div><div>Error handling is not consistent in this function. Could you cle=
anup error code paths so error handling &amp; reporting is done in one plac=
e?<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mpqemu_msg_valid(&amp;msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Received inva=
lid message from proxy&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;in remote process pid=3D%d&quot;, getpid());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (msg.cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unknown command (%d) received for device %s (pid=3D%d)&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0msg.cmd, DEVICE(pci_dev)-&gt;id, getpid());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_shutdown_request(SHU=
TDOWN_CAUSE_GUEST_SHUTDOWN);<br></blockquote><div><br></div><div>Presumably=
 that error handling should be done outside of the for(;;) loop.</div><div>=
<br></div><div>SHUTDOWN_CAUSE_HOST_ERROR might be more appropriate in this =
case, or perhaps introduce a new ShutdownCause?</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);=
<br>
+<br>
+=C2=A0 =C2=A0 return;<br></blockquote><div><br></div><div>needless return =
statement<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+}<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index d0c891a..b64e4b8 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3143,6 +3143,7 @@ F: hw/remote/machine.c<br>
=C2=A0F: include/hw/remote/machine.h<br>
=C2=A0F: hw/remote/mpqemu-link.c<br>
=C2=A0F: include/hw/remote/mpqemu-link.h<br>
+F: hw/remote/message.c<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index a2b2fc0..9f5c57f 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -2,5 +2,6 @@ remote_ss =3D ss.source_set()<br>
<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;machine.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;mpqemu-link.c&#39;))<br>
+remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;mes=
sage.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remo=
te_ss)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b36dea05b5dfdf95--

