Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBB2D2A4C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:08:17 +0100 (CET)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbmx-0002i8-1i
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmbdY-0002IF-AP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:58:32 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmbdV-0005Hy-SE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:58:32 -0500
Received: by mail-ej1-x642.google.com with SMTP id bo9so24115421ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 03:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OObKwaWB9ryCSgnSstBT1f89WqcAkKPI7qTl8nC+okg=;
 b=aNHb8gTObc0zU0RyaR2MkhCZ605ZUtHQkHJx3019hEqP1Uaott1Z3xMoJY75+UNq/k
 MUJ+tjQY6UpJXnQlVJMjuSzUyjFMjmvCAHByr5CLx4TYs669o3orBvt56NYsB6oyKkUC
 8aVe9PpJMeww7DqDZZtwviOnMNYMIgKXH/XGzo54M3CK6KXp5SzPxpaJTJaYLaF8wqWN
 6Yd4X7S1RgjuYDKoiFoOzg+X4FMr8OTx7+lbh8H+l5/QOxvQCTs8Yg/J90gfOtwEuCZc
 gwZxx/Ff0mJXIzTsl0cce8BAh7DUuLhWKJ9vsuLq6E6WKnfZIHJwWLX3loQWu053pBPM
 jCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OObKwaWB9ryCSgnSstBT1f89WqcAkKPI7qTl8nC+okg=;
 b=U+aA9UvGv7IbYOLCltArGOMtWgKMuZSaXjknBqkceOeIVkkf0vizBD5SpZX7yOTg7X
 GM9STT5woGJ+ONScDTMvXXcMe6iM6ucRvLL0KqN3pv6Jvby1RwNz0ABCUSDHUa28c/Dm
 GG9bH9Jt4m9+9k5hTtQR3JKXjuay6Zs6CrkRy8HeyRdWgBa42z/ik2HEDI+XeBhE1qeq
 lGWbbqkMk3cydafzMeBFlg/IYVy89yFP3G+vENZuJykiVRBASLPtZLXhkGzw9dwz14H1
 8m4yiVAAy1SlTqNRJSyLldDepKqBGMLuagK2rFQC7grBG6GBjNdBI/FoUkKxMYi+aEHa
 ZbNg==
X-Gm-Message-State: AOAM5324k4qUOjQGEXbOwG/XPGtGIx+mbUtEnxKnk92n/TK9kmARu+ce
 Pf0DMCKCJP/Uz8OuU6OPQIDcJJsaAJodBWY+UmI=
X-Google-Smtp-Source: ABdhPJy0mrMEPGVNYXg4L24HzPszpEBbdezvdiUDbLu7zEqulQw5ZF232UUa8+yIzKh0jrtgs7BYPIqpYxjEaQHuNa0=
X-Received: by 2002:a17:906:3e02:: with SMTP id
 k2mr23255278eji.92.1607428708379; 
 Tue, 08 Dec 2020 03:58:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <8609dbecb51f77d45edc1add4b6ccc27b1886a05.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <8609dbecb51f77d45edc1add4b6ccc27b1886a05.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 15:58:14 +0400
Message-ID: <CAJ+F1CLJ27xSXmPW9LKtrpcJSxpBnHpzErHPyEfw3aK=B-MhOA@mail.gmail.com>
Subject: Re: [PATCH v12 11/19] multi-process: setup memory manager for remote
 device
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000002a306905b5f2a99c"
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

--0000000000002a306905b5f2a99c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> SyncSysMemMsg message format is defined. It is used to send
> file descriptors of the RAM regions to remote device.
> RAM on the remote device is configured with a set of file descriptors.
> Old RAM regions are deleted and new regions, each with an fd, is
> added to the RAM.
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/memory.h      | 19 ++++++++++++++
>  include/hw/remote/mpqemu-link.h | 13 +++++++++
>  hw/remote/memory.c              | 58
> +++++++++++++++++++++++++++++++++++++++++
>  hw/remote/mpqemu-link.c         | 11 ++++++++
>  MAINTAINERS                     |  2 ++
>  hw/remote/meson.build           |  2 ++
>  6 files changed, 105 insertions(+)
>  create mode 100644 include/hw/remote/memory.h
>  create mode 100644 hw/remote/memory.c
>
> diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
> new file mode 100644
> index 0000000..4fd548e
> --- /dev/null
> +++ b/include/hw/remote/memory.h
> @@ -0,0 +1,19 @@
> +/*
> + * Memory manager for remote device
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_MEMORY_H
> +#define REMOTE_MEMORY_H
> +
> +#include "exec/hwaddr.h"
> +#include "hw/remote/mpqemu-link.h"
> +
> +void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);
> +
> +#endif
> diff --git a/include/hw/remote/mpqemu-link.h
> b/include/hw/remote/mpqemu-link.h
> index 2d79ff8..070ac77 100644
> --- a/include/hw/remote/mpqemu-link.h
> +++ b/include/hw/remote/mpqemu-link.h
> @@ -14,6 +14,7 @@
>  #include "qom/object.h"
>  #include "qemu/thread.h"
>  #include "io/channel.h"
> +#include "exec/hwaddr.h"
>
>  #define REMOTE_MAX_FDS 8
>
> @@ -24,12 +25,22 @@
>   *
>   * MPQemuCmd enum type to specify the command to be executed on the remo=
te
>   * device.
> + *
> + * SYNC_SYSMEM      Shares QEMU's RAM with remote device's RAM
>   */
>  typedef enum {
>      MPQEMU_CMD_INIT,
> +    SYNC_SYSMEM,
> +    RET_MSG,
>

RET_MSG is not used here, but later. ok.

     MPQEMU_CMD_MAX,
>  } MPQemuCmd;
>
> +typedef struct {
> +    hwaddr gpas[REMOTE_MAX_FDS];
> +    uint64_t sizes[REMOTE_MAX_FDS];
> +    off_t offsets[REMOTE_MAX_FDS];
> +} SyncSysmemMsg;
> +
>  /**
>   * MPQemuMsg:
>   * @cmd: The remote command
> @@ -40,12 +51,14 @@ typedef enum {
>   * MPQemuMsg Format of the message sent to the remote device from QEMU.
>   *
>   */
> +
>  typedef struct {
>      int cmd;
>      size_t size;
>
>      union {
>          uint64_t u64;
> +        SyncSysmemMsg sync_sysmem;
>      } data;
>
>      int fds[REMOTE_MAX_FDS];
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> new file mode 100644
> index 0000000..6d1e830
> --- /dev/null
> +++ b/hw/remote/memory.c
> @@ -0,0 +1,58 @@
> +/*
> + * Memory manager for remote device
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/memory.h"
> +#include "exec/address-spaces.h"
> +#include "exec/ram_addr.h"
> +#include "qapi/error.h"
> +
> +void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
> +{
> +    SyncSysmemMsg *sysmem_info =3D &msg->data.sync_sysmem;
> +    MemoryRegion *sysmem, *subregion, *next;
> +    static unsigned int suffix;
> +    Error *local_err =3D NULL;
> +    char *name;
> +    int region;
> +
> +    sysmem =3D get_system_memory();
> +
> +    memory_region_transaction_begin();
> +
> +    QTAILQ_FOREACH_SAFE(subregion, &sysmem->subregions, subregions_link,
> next) {
> +        if (subregion->ram) {
> +            memory_region_del_subregion(sysmem, subregion);
> +            object_unparent(OBJECT(subregion));
> +        }
> +    }
> +
> +    for (region =3D 0; region < msg->num_fds; region++) {
> +        subregion =3D g_new(MemoryRegion, 1);
> +        name =3D g_strdup_printf("remote-mem-%u", suffix++);
> +        memory_region_init_ram_from_fd(subregion, NULL,
> +                                       name, sysmem_info->sizes[region],
> +                                       true, msg->fds[region],
> +                                       sysmem_info->offsets[region],
> +                                       &local_err);
> +        g_free(name);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            break;
> +        }
> +
> +        memory_region_add_subregion(sysmem, sysmem_info->gpas[region],
> +                                    subregion);
> +    }
> +
> +    memory_region_transaction_commit();
> +}
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index e535ed2..bbd9df3 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -238,5 +238,16 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
>          }
>      }
>
> +     /* Verify message specific fields. */
> +    switch (msg->cmd) {
> +    case SYNC_SYSMEM:
> +        if (msg->num_fds =3D=3D 0 || msg->size !=3D sizeof(SyncSysmemMsg=
)) {
> +            return false;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
>      return true;
>  }
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aedfc27..24cb36e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3146,6 +3146,8 @@ F: include/hw/remote/mpqemu-link.h
>  F: hw/remote/message.c
>  F: include/hw/remote/remote-obj.h
>  F: hw/remote/remote-obj.c
> +F: include/hw/remote/memory.h
> +F: hw/remote/memory.c
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 71d0a56..64da16c 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -5,4 +5,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'=
))
>
> +specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
> +
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002a306905b5f2a99c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">SyncSysMemMsg message format is defined. It is used to send<br>
file descriptors of the RAM regions to remote device.<br>
RAM on the remote device is configured with a set of file descriptors.<br>
Old RAM regions are deleted and new regions, each with an fd, is<br>
added to the RAM.<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/memory.h=C2=A0 =C2=A0 =C2=A0 | 19 ++++++++++++++<br=
>
=C2=A0include/hw/remote/mpqemu-link.h | 13 +++++++++<br>
=C2=A0hw/remote/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
58 +++++++++++++++++++++++++++++++++++++++++<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++=
+<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 2 ++<br>
=C2=A06 files changed, 105 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/memory.h<br>
=C2=A0create mode 100644 hw/remote/memory.c<br>
<br>
diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h<br>
new file mode 100644<br>
index 0000000..4fd548e<br>
--- /dev/null<br>
+++ b/include/hw/remote/memory.h<br>
@@ -0,0 +1,19 @@<br>
+/*<br>
+ * Memory manager for remote device<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef REMOTE_MEMORY_H<br>
+#define REMOTE_MEMORY_H<br>
+<br>
+#include &quot;exec/hwaddr.h&quot;<br>
+#include &quot;hw/remote/mpqemu-link.h&quot;<br>
+<br>
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);<br>
+<br>
+#endif<br>
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-lin=
k.h<br>
index 2d79ff8..070ac77 100644<br>
--- a/include/hw/remote/mpqemu-link.h<br>
+++ b/include/hw/remote/mpqemu-link.h<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
=C2=A0#include &quot;qemu/thread.h&quot;<br>
=C2=A0#include &quot;io/channel.h&quot;<br>
+#include &quot;exec/hwaddr.h&quot;<br>
<br>
=C2=A0#define REMOTE_MAX_FDS 8<br>
<br>
@@ -24,12 +25,22 @@<br>
=C2=A0 *<br>
=C2=A0 * MPQemuCmd enum type to specify the command to be executed on the r=
emote<br>
=C2=A0 * device.<br>
+ *<br>
+ * SYNC_SYSMEM=C2=A0 =C2=A0 =C2=A0 Shares QEMU&#39;s RAM with remote devic=
e&#39;s RAM<br>
=C2=A0 */<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0MPQEMU_CMD_INIT,<br>
+=C2=A0 =C2=A0 SYNC_SYSMEM,<br>
+=C2=A0 =C2=A0 RET_MSG,<br></blockquote><div><br></div><div>RET_MSG is not =
used here, but later. ok.<br></div><div> <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0MPQEMU_CMD_MAX,<br>
=C2=A0} MPQemuCmd;<br>
<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 hwaddr gpas[REMOTE_MAX_FDS];<br>
+=C2=A0 =C2=A0 uint64_t sizes[REMOTE_MAX_FDS];<br>
+=C2=A0 =C2=A0 off_t offsets[REMOTE_MAX_FDS];<br>
+} SyncSysmemMsg;<br>
+<br>
=C2=A0/**<br>
=C2=A0 * MPQemuMsg:<br>
=C2=A0 * @cmd: The remote command<br>
@@ -40,12 +51,14 @@ typedef enum {<br>
=C2=A0 * MPQemuMsg Format of the message sent to the remote device from QEM=
U.<br>
=C2=A0 *<br>
=C2=A0 */<br>
+<br>
=C2=A0typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0int cmd;<br>
=C2=A0 =C2=A0 =C2=A0size_t size;<br>
<br>
=C2=A0 =C2=A0 =C2=A0union {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t u64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SyncSysmemMsg sync_sysmem;<br>
=C2=A0 =C2=A0 =C2=A0} data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0int fds[REMOTE_MAX_FDS];<br>
diff --git a/hw/remote/memory.c b/hw/remote/memory.c<br>
new file mode 100644<br>
index 0000000..6d1e830<br>
--- /dev/null<br>
+++ b/hw/remote/memory.c<br>
@@ -0,0 +1,58 @@<br>
+/*<br>
+ * Memory manager for remote device<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+<br>
+#include &quot;hw/remote/memory.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;exec/ram_addr.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+<br>
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 SyncSysmemMsg *sysmem_info =3D &amp;msg-&gt;data.sync_sysmem=
;<br>
+=C2=A0 =C2=A0 MemoryRegion *sysmem, *subregion, *next;<br>
+=C2=A0 =C2=A0 static unsigned int suffix;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 char *name;<br>
+=C2=A0 =C2=A0 int region;<br>
+<br>
+=C2=A0 =C2=A0 sysmem =3D get_system_memory();<br>
+<br>
+=C2=A0 =C2=A0 memory_region_transaction_begin();<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH_SAFE(subregion, &amp;sysmem-&gt;subregions, s=
ubregions_link, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (subregion-&gt;ram) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_del_subregion(sysm=
em, subregion);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unparent(OBJECT(subregion=
));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (region =3D 0; region &lt; msg-&gt;num_fds; region++) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subregion =3D g_new(MemoryRegion, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;remote-mem-%u&q=
uot;, suffix++);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_ram_from_fd(subregion, NULL=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, sys=
mem_info-&gt;sizes[region],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true, msg=
-&gt;fds[region],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysmem_in=
fo-&gt;offsets[region],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;loca=
l_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(sysmem, sysmem_inf=
o-&gt;gpas[region],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subregion);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_transaction_commit();<br>
+}<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
index e535ed2..bbd9df3 100644<br>
--- a/hw/remote/mpqemu-link.c<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -238,5 +238,16 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0/* Verify message specific fields. */<br>
+=C2=A0 =C2=A0 switch (msg-&gt;cmd) {<br>
+=C2=A0 =C2=A0 case SYNC_SYSMEM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msg-&gt;num_fds =3D=3D 0 || msg-&gt;size !=
=3D sizeof(SyncSysmemMsg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index aedfc27..24cb36e 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3146,6 +3146,8 @@ F: include/hw/remote/mpqemu-link.h<br>
=C2=A0F: hw/remote/message.c<br>
=C2=A0F: include/hw/remote/remote-obj.h<br>
=C2=A0F: hw/remote/remote-obj.c<br>
+F: include/hw/remote/memory.h<br>
+F: hw/remote/memory.c<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index 71d0a56..64da16c 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -5,4 +5,6 @@ remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true:=
 files(&#39;mpqemu-link.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;message.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;remote-obj.c&#39;))<br>
<br>
+specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;m=
emory.c&#39;))<br>
+<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remo=
te_ss)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002a306905b5f2a99c--

