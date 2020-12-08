Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC42D2A56
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:11:15 +0100 (CET)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbpq-0005Na-IW
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmbmp-0003qy-LU
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:08:07 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmbmn-0000V9-87
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:08:07 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so24293321ejb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pr1LvOiHeayHKQcK+XCnPqv9fqhBUcIlKGhv6Ex/c3Y=;
 b=BM9AUJYGyiBJ/ksXK8RIu70t3td6hegOCy8BXjtuHXi+1XuUm65p6rV9WfpJO5XaeT
 T7a+/MNfbJQw3RIrpb3gfQa/MaKBGYb36rR+LMEhZ3ioEc1eKzvMGe059rNY+TXXRVOD
 Ae+5RId+EVUUcrGIL/BcEm5EM6qX3WIyNmI3OBUFUZ89RJFbST0noQnYX++63JBnv2Ez
 jNsjfQMVrfXAoDJFjd84tU66My7w41heQCiXhZ5+24i4MOi7AitQQx4HzWTD3ofugJCM
 luSyY782UV2smYDdqqJYU5O3W79AdNgZUL2DotCPV8ZPHV0czKsrSaG/rkynfYBvjSRR
 TZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pr1LvOiHeayHKQcK+XCnPqv9fqhBUcIlKGhv6Ex/c3Y=;
 b=dHOzm5CylpcFfhCmAJp1EM2MDGM+FYyFBNJVWUZ4OJgCOdWnAxoC8gY7RTlt2/Z2Fw
 YxmrDpsLJLjYjjUmm129bct1qjLHPkRxZBB5/5NZhh/MgB3nR8aZxdnb0cUk8BPR+EcF
 gidTAOAsYa6vWIETlKDU7bek3f/Va4CS/VEyK+v3IV5FXNcBkSgkonJPNnRnmx2BwEsR
 gHGZwjddPMj8n+T9KCuUpI1Q1GegoREgBb1psMTAHJjIPoM91+bHX+mDDTZE3Fe9paaO
 o/TD+KBLj9qu4PtYf79Y+Mn2+gtixGI9z7tdfJUZZgEGl4hLA8tm8iWTuWskPfJdN06u
 lJZg==
X-Gm-Message-State: AOAM530ulMCD7A+c5eOf5euLNE7YUahvq6qavH32LJ6r5eCf6JEV6QjL
 HGhihLNVlRIplkwissUbVY/8Bag7aRlcrE5MkYY=
X-Google-Smtp-Source: ABdhPJzny+nzFxQ6CAG2zI2vlh5db/xsj0GK5pTIrydxtQSjeIsSvK5yDz2tyoteLtd7lxoiOUTF9EfwE1wkrFDOmi4=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr1693723ejb.109.1607429283736; 
 Tue, 08 Dec 2020 04:08:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <c3a68434b32d8f5379a9fa197e89748f54423632.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1CJtT2miTiGN6f9fWCGmpT8D=KtnJu8UpPg=2O9PptCF4A@mail.gmail.com>
In-Reply-To: <CAJ+F1CJtT2miTiGN6f9fWCGmpT8D=KtnJu8UpPg=2O9PptCF4A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:07:51 +0400
Message-ID: <CAJ+F1CJsT0AMCeAm3LscLD4GpcyvcKpiw=paM33E_FfW5U5P_Q@mail.gmail.com>
Subject: Re: [PATCH v12 10/19] multi-process: Associate fd of a PCIDevice with
 its object
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000075710905b5f2cb90"
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

--00000000000075710905b5f2cb90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2020 at 6:03 PM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

> Hi
>
> On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com>
> wrote:
>
>> Associate the file descriptor for a PCIDevice in remote process with
>> DeviceState object.
>>
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  include/hw/remote/remote-obj.h |  42 +++++++++++
>>  hw/remote/message.c            |   1 +
>>  hw/remote/remote-obj.c         | 154
>> +++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                    |   2 +
>>  hw/remote/meson.build          |   1 +
>>  5 files changed, 200 insertions(+)
>>  create mode 100644 include/hw/remote/remote-obj.h
>>  create mode 100644 hw/remote/remote-obj.c
>>
>> diff --git a/include/hw/remote/remote-obj.h
>> b/include/hw/remote/remote-obj.h
>> new file mode 100644
>> index 0000000..0e95813
>> --- /dev/null
>> +++ b/include/hw/remote/remote-obj.h
>> @@ -0,0 +1,42 @@
>> +/*
>> + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL-v2, version 2 o=
r
>> later.
>> + *
>> + * See the COPYING file in the top-level directory.
>> + *
>> + */
>> +
>> +#ifndef REMOTE_OBJECT_H
>> +#define REMOTE_OBJECT_H
>> +
>> +#include "io/channel.h"
>> +#include "qemu/notify.h"
>> +
>> +#define TYPE_REMOTE_OBJECT "x-remote-object"
>> +#define REMOTE_OBJECT(obj) \
>> +    OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)
>> +#define REMOTE_OBJECT_GET_CLASS(obj) \
>> +    OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_OBJECT)
>> +#define REMOTE_OBJECT_CLASS(klass) \
>> +    OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REMOTE_OBJECT)
>> +
>> +typedef struct {
>> +    ObjectClass parent_class;
>> +
>> +    unsigned int nr_devs;
>> +    unsigned int max_devs;
>> +} RemoteObjectClass;
>> +
>> +typedef struct {
>> +    /* private */
>> +    Object parent;
>> +
>> +    Notifier machine_done;
>> +
>> +    int fd;
>> +    char *devid;
>> +    QIOChannel *ioc;
>> +} RemoteObject;
>> +
>> +#endif
>>
>
> There is no need for a header if the header isn't actually shared with
> various .c units. In this series, you can just declare those structs in
> remote-obj.c
>
> diff --git a/hw/remote/message.c b/hw/remote/message.c
>> index 5d87bf4..1f2edc7 100644
>> --- a/hw/remote/message.c
>> +++ b/hw/remote/message.c
>> @@ -56,6 +56,7 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data=
)
>>          }
>>      }
>>      qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> +    g_free(com);
>>
>
>
> Should be squashed with the previous patch
>
>
>>      return;
>>  }
>> diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
>> new file mode 100644
>> index 0000000..3b4c0d4
>> --- /dev/null
>> +++ b/hw/remote/remote-obj.c
>> @@ -0,0 +1,154 @@
>> +/*
>> + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL-v2, version 2 o=
r
>> later.
>> + *
>> + * See the COPYING file in the top-level directory.
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +
>> +#include "hw/remote/remote-obj.h"
>> +#include "qemu/error-report.h"
>> +#include "qom/object_interfaces.h"
>> +#include "hw/qdev-core.h"
>> +#include "io/channel.h"
>> +#include "hw/qdev-core.h"
>> +#include "hw/remote/machine.h"
>> +#include "io/channel-util.h"
>> +#include "qapi/error.h"
>> +#include "sysemu/sysemu.h"
>> +#include "hw/pci/pci.h"
>> +
>> +static void remote_object_set_fd(Object *obj, const char *str, Error
>> **errp)
>> +{
>> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
>> +
>> +    o->fd =3D atoi(str);
>>
>
>  qemu_strtoi() has better error handling semantics. You may also want to
> check it's a valid socket fd with fd_is_socket().
>
> Alternatively, you could use qemu_open() which allows to open from QMP
> fdset ("/dev/fdset/..."). This should be more flexible.
>


A better alternative is qemu_parse_fd().

In some later patch, you use monitor_fd_param(monitor_cur(), ...) for
x-pci-proxy-dev "fd" property.

That might be the right API, for consistency, use it here too?


--=20
Marc-Andr=C3=A9 Lureau

--00000000000075710905b5f2cb90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 7, 2020 at 6:03 PM Marc-A=
ndr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandr=
e.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 20=
20 at 12:25 AM Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Associate the file descriptor for a=
 PCIDevice in remote process with<br>
DeviceState object.<br>
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
=C2=A0include/hw/remote/remote-obj.h |=C2=A0 42 +++++++++++<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/remote/remote-obj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 154 +++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A05 files changed, 200 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/remote-obj.h<br>
=C2=A0create mode 100644 hw/remote/remote-obj.c<br>
<br>
diff --git a/include/hw/remote/remote-obj.h b/include/hw/remote/remote-obj.=
h<br>
new file mode 100644<br>
index 0000000..0e95813<br>
--- /dev/null<br>
+++ b/include/hw/remote/remote-obj.h<br>
@@ -0,0 +1,42 @@<br>
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
+#ifndef REMOTE_OBJECT_H<br>
+#define REMOTE_OBJECT_H<br>
+<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;qemu/notify.h&quot;<br>
+<br>
+#define TYPE_REMOTE_OBJECT &quot;x-remote-object&quot;<br>
+#define REMOTE_OBJECT(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)<br>
+#define REMOTE_OBJECT_GET_CLASS(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_OBJEC=
T)<br>
+#define REMOTE_OBJECT_CLASS(klass) \<br>
+=C2=A0 =C2=A0 OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REMOTE_O=
BJECT)<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 ObjectClass parent_class;<br>
+<br>
+=C2=A0 =C2=A0 unsigned int nr_devs;<br>
+=C2=A0 =C2=A0 unsigned int max_devs;<br>
+} RemoteObjectClass;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 /* private */<br>
+=C2=A0 =C2=A0 Object parent;<br>
+<br>
+=C2=A0 =C2=A0 Notifier machine_done;<br>
+<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 char *devid;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+} RemoteObject;<br>
+<br>
+#endif<br></blockquote><div><br></div><div>There is no need for a header i=
f the header isn&#39;t actually shared with various .c units. In this serie=
s, you can just declare those structs in remote-obj.c<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
index 5d87bf4..1f2edc7 100644<br>
--- a/hw/remote/message.c<br>
+++ b/hw/remote/message.c<br>
@@ -56,6 +56,7 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTD=
OWN);<br>
+=C2=A0 =C2=A0 g_free(com);<br></blockquote><div><br></div><div><br></div><=
div>Should be squashed with the previous patch</div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0}<br>
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c<br>
new file mode 100644<br>
index 0000000..3b4c0d4<br>
--- /dev/null<br>
+++ b/hw/remote/remote-obj.c<br>
@@ -0,0 +1,154 @@<br>
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
+#include &quot;hw/remote/remote-obj.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qom/object_interfaces.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;hw/remote/machine.h&quot;<br>
+#include &quot;io/channel-util.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+<br>
+static void remote_object_set_fd(Object *obj, const char *str, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;fd =3D atoi(str);<br></blockquote><div><br></div><div>=
=C2=A0qemu_strtoi() has better error handling semantics. You may also want =
to check it&#39;s a valid socket fd with fd_is_socket().</div><div><br></di=
v><div>Alternatively, you could use qemu_open() which allows to open from Q=
MP fdset (&quot;/dev/fdset/...&quot;). This should be more flexible.<br></d=
iv></div></div></blockquote><div><br></div><div>=C2=A0</div><div>A better a=
lternative is qemu_parse_fd().</div><div><br></div><div>In some later patch=
, you use monitor_fd_param(monitor_cur(), ...) for x-pci-proxy-dev &quot;fd=
&quot; property.<br></div><div><br></div><div>That might be the right API, =
for consistency, use it here too?<br></div></div><br clear=3D"all"><br>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></d=
iv></div>

--00000000000075710905b5f2cb90--

