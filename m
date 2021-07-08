Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037763C1448
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:29:05 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1U5Q-0002In-3s
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1U3n-0000Cr-8W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:27:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1U3k-0004f6-Pl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:27:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gb6so9615388ejc.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4Rsgs+2Fc4YrAZLenPi78VR2dNix/ag15tqYtYQblk=;
 b=oPwKvV1AnPXcKJqrJED6izt1tl2sE3HziqWI8tCKpLnde4Bmdj1Uh4lT6vLo6zBV5A
 CHF00pizbzprZRVQy76qdFkC5EzuIe8iwCgSN1kW+f/kNYDZ+SdOKHvwhDHlPoS9akwz
 S1dgxwj/0kferxEBExzkfCHw6GBupo6aL/Y/e8b0v6JGLBNtqJMDcnvUUnktnTNB1k7O
 8w/AOGv2VAC6fecTQz7O4OnvyWt8TQEXmZgFJFvOkh2P3WYSF72f+oTZfv/2qQ54Eayz
 wsmBCPuDirUdODbRvk1NyEzAgey0LbX3XXo7xl1yk3stq+jlE5xYDkAXC8eGiqpI2WSz
 VBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4Rsgs+2Fc4YrAZLenPi78VR2dNix/ag15tqYtYQblk=;
 b=IS022ViCQcYb5kkqLZ2unDqAvn4xjhOLLWdgy/Q/e84PLTy1/ZVtLT73biZj/+S8L+
 y/XGMVpuKcuseeWSEJNewClzt6VhYYe5vDGrVR7vqpyyyeWLo11U1jWzp5XA7c3eTcJJ
 DyLKKywejCbeA6KlJqysrm+m8X/x2DcuHPhpFTKrPvh9R1eMUhXeZGGCyY7E4YNB4flJ
 GRhCog0+5ngtT/cWypCxYVy0Yp9n1nu+0hsTEepdCUT8y9EliAnO3Xs7pneFkmIrVur9
 YKzyO8f7Ygy4XokXbr0Gv12DiTQZkTIQn+IvoG0s5IscBCQQx8sfiOJJMKkhAKd6FdqF
 c9kA==
X-Gm-Message-State: AOAM530C9shVg5QKbBr2nbDwpCxJC8a3Js/aoNdsmbqiRVsCD6MVYJ5H
 RG8BxWRUXal8xTjNF7YytUrx960X9qHdua+zcT8=
X-Google-Smtp-Source: ABdhPJxbx0ywGqetGg0x0qGl1lkhhenoD8Av5zocclQgKIeqTJTRvD1NLXn1G51+LLR0c2tx+/d+0tK+KA9XbDjuc+A=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr17540831ejw.92.1625750839376; 
 Thu, 08 Jul 2021 06:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 17:27:07 +0400
Message-ID: <CAJ+F1CJ6pa1nVu5BgskV3xG+j9wWRroC-=ChmmCKg6Q=ofA2SA@mail.gmail.com>
Subject: Re: [PATCH V5 03/25] cpr: QMP interfaces for reboot
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000004652f605c69c9de2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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

--0000000000004652f605c69c9de2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:28 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> cprsave calls cprsave().  Syntax:
>   { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
>
> cprload calls cprload().  Syntax:
>   { 'command': 'cprload', 'data': { 'file': 'str' } }
>
> cprinfo returns a list of supported modes.  Syntax:
>   { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>   { 'command': 'cprinfo', 'returns': 'CprInfo' }
>

It may not be necessary, we may instead rely on query-qmp-schema
introspection.


> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS           |  1 +
>  monitor/qmp-cmds.c    | 31 +++++++++++++++++++++
>  qapi/cpr.json         | 74
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/meson.build      |  1 +
>  qapi/qapi-schema.json |  1 +
>  5 files changed, 108 insertions(+)
>  create mode 100644 qapi/cpr.json
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3573aa..c48dd37 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2864,6 +2864,7 @@ M: Mark Kanda <mark.kanda@oracle.com>
>  S: Maintained
>  F: include/migration/cpr.h
>  F: migration/cpr.c
> +F: qapi/cpr.json
>
>  Record/replay
>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index f7d64a6..1128604 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -37,9 +37,11 @@
>  #include "qapi/qapi-commands-machine.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qapi/qapi-commands-cpr.h"
>  #include "qapi/qmp/qerror.h"
>  #include "hw/mem/memory-device.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> +#include "migration/cpr.h"
>
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -153,6 +155,35 @@ void qmp_cont(Error **errp)
>      }
>  }
>
> +CprInfo *qmp_cprinfo(Error **errp)
> +{
> +    CprInfo *cprinfo;
> +    CprModeList *mode, *mode_list =3D NULL;
> +    CprMode i;
> +
> +    cprinfo =3D g_malloc0(sizeof(*cprinfo));
> +
> +    for (i =3D 0; i < CPR_MODE__MAX; i++) {
> +        mode =3D g_malloc0(sizeof(*mode));
> +        mode->value =3D i;
> +        mode->next =3D mode_list;
> +        mode_list =3D mode;
> +    }
> +
> +    cprinfo->modes =3D mode_list;
> +    return cprinfo;
> +}
> +
> +void qmp_cprsave(const char *file, CprMode mode, Error **errp)
> +{
> +    cprsave(file, mode, errp);
> +}
> +
> +void qmp_cprload(const char *file, Error **errp)
> +{
> +    cprload(file, errp);
> +}
> +
>  void qmp_system_wakeup(Error **errp)
>  {
>      if (!qemu_wakeup_suspend_enabled()) {
> diff --git a/qapi/cpr.json b/qapi/cpr.json
> new file mode 100644
> index 0000000..b6fdc89
> --- /dev/null
> +++ b/qapi/cpr.json
> @@ -0,0 +1,74 @@
> +# -*- Mode: Python -*-
> +#
> +# Copyright (c) 2021 Oracle and/or its affiliates.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.
> +# See the COPYING file in the top-level directory.
> +
> +##
> +# =3D CPR
>

Please spell it out in the doc at least (it's not obvious, I had to search
for the meaning in list archives ;).

+##
> +
> +{ 'include': 'common.json' }
> +
> +##
> +# @CprMode:
> +#
> +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'CprMode',
> +  'data': [ 'reboot' ] }
> +
> +
> +##
> +# @CprInfo:
> +#
> +# @modes: @CprMode list
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CprInfo',
> +  'data': { 'modes': [ 'CprMode' ] } }
> +
> +##
> +# @cprinfo:
> +#
> +# Returns the modes supported by @cprsave.
> +#
> +# Returns: @CprInfo
> +#
> +# Since: 6.1
> +#
> +##
> +{ 'command': 'cprinfo',
> +  'returns': 'CprInfo' }
> +
> +##
> +# @cprsave:
> +#
> +# Create a checkpoint of the virtual machine device state in @file.
> +# Guest RAM and guest block device blocks are not saved.
> +#
>

It would be worth highlighting the differences with snapshot-save/load.

I guess it would make sense to consider this as an extension/variant to
those commands.


> +# @file: name of checkpoint file
> +# @mode: @CprMode mode
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'cprsave',
> +  'data': { 'file': 'str',
> +            'mode': 'CprMode' } }
> +
> +##
> +# @cprload:
> +#
> +# Start virtual machine from checkpoint file that was created earlier
> using
> +# the cprsave command.
> +#
> +# @file: name of checkpoint file
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'cprload',
> +  'data': { 'file': 'str' } }
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 376f4ce..7e7c48a 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -26,6 +26,7 @@ qapi_all_modules =3D [
>    'common',
>    'compat',
>    'control',
> +  'cpr',
>    'crypto',
>    'dump',
>    'error',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b97..001d790 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -77,6 +77,7 @@
>  { 'include': 'ui.json' }
>  { 'include': 'authz.json' }
>  { 'include': 'migration.json' }
> +{ 'include': 'cpr.json' }
>  { 'include': 'transaction.json' }
>  { 'include': 'trace.json' }
>  { 'include': 'compat.json' }
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004652f605c69c9de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:28 PM Steve Sistare =
&lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@oracle.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">c=
prsave calls cprsave().=C2=A0 Syntax:<br>
=C2=A0 { &#39;enum&#39;: &#39;CprMode&#39;, &#39;data&#39;: [ &#39;reboot&#=
39; ] }<br>
=C2=A0 { &#39;command&#39;: &#39;cprsave&#39;, &#39;data&#39;: { &#39;file&=
#39;: &#39;str&#39;, &#39;mode&#39;: &#39;CprMode&#39; } }<br>
<br>
cprload calls cprload().=C2=A0 Syntax:<br>
=C2=A0 { &#39;command&#39;: &#39;cprload&#39;, &#39;data&#39;: { &#39;file&=
#39;: &#39;str&#39; } }<br>
<br>
cprinfo returns a list of supported modes.=C2=A0 Syntax:<br>
=C2=A0 { &#39;struct&#39;: &#39;CprInfo&#39;, &#39;data&#39;: { &#39;modes&=
#39;: [ &#39;CprMode&#39; ] } }<br>
=C2=A0 { &#39;command&#39;: &#39;cprinfo&#39;, &#39;returns&#39;: &#39;CprI=
nfo&#39; }<br></blockquote><div><br></div><div>It may not be necessary, we =
may instead rely on query-qmp-schema introspection.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Mark Kanda &lt;<a href=3D"mailto:mark.kanda@oracle.com" targ=
et=3D"_blank">mark.kanda@oracle.com</a>&gt;<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 | 31 +++++++++++++++++++++<br>
=C2=A0qapi/cpr.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 74 +++++++++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0qapi/qapi-schema.json |=C2=A0 1 +<br>
=C2=A05 files changed, 108 insertions(+)<br>
=C2=A0create mode 100644 qapi/cpr.json<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index c3573aa..c48dd37 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2864,6 +2864,7 @@ M: Mark Kanda &lt;<a href=3D"mailto:mark.kanda@oracle=
.com" target=3D"_blank">mark.kanda@oracle.com</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0F: include/migration/cpr.h<br>
=C2=A0F: migration/cpr.c<br>
+F: qapi/cpr.json<br>
<br>
=C2=A0Record/replay<br>
=C2=A0M: Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgaluk@ispras.ru" ta=
rget=3D"_blank">pavel.dovgaluk@ispras.ru</a>&gt;<br>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
index f7d64a6..1128604 100644<br>
--- a/monitor/qmp-cmds.c<br>
+++ b/monitor/qmp-cmds.c<br>
@@ -37,9 +37,11 @@<br>
=C2=A0#include &quot;qapi/qapi-commands-machine.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-misc.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
+#include &quot;qapi/qapi-commands-cpr.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
=C2=A0#include &quot;hw/mem/memory-device.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
+#include &quot;migration/cpr.h&quot;<br>
<br>
=C2=A0NameInfo *qmp_query_name(Error **errp)<br>
=C2=A0{<br>
@@ -153,6 +155,35 @@ void qmp_cont(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+CprInfo *qmp_cprinfo(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 CprInfo *cprinfo;<br>
+=C2=A0 =C2=A0 CprModeList *mode, *mode_list =3D NULL;<br>
+=C2=A0 =C2=A0 CprMode i;<br>
+<br>
+=C2=A0 =C2=A0 cprinfo =3D g_malloc0(sizeof(*cprinfo));<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; CPR_MODE__MAX; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D g_malloc0(sizeof(*mode));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;value =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;next =3D mode_list;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_list =3D mode;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cprinfo-&gt;modes =3D mode_list;<br>
+=C2=A0 =C2=A0 return cprinfo;<br>
+}<br>
+<br>
+void qmp_cprsave(const char *file, CprMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 cprsave(file, mode, errp);<br>
+}<br>
+<br>
+void qmp_cprload(const char *file, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 cprload(file, errp);<br>
+}<br>
+<br>
=C2=A0void qmp_system_wakeup(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!qemu_wakeup_suspend_enabled()) {<br>
diff --git a/qapi/cpr.json b/qapi/cpr.json<br>
new file mode 100644<br>
index 0000000..b6fdc89<br>
--- /dev/null<br>
+++ b/qapi/cpr.json<br>
@@ -0,0 +1,74 @@<br>
+# -*- Mode: Python -*-<br>
+#<br>
+# Copyright (c) 2021 Oracle and/or its affiliates.<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2.<br>
+# See the COPYING file in the top-level directory.<br>
+<br>
+##<br>
+# =3D CPR<br></blockquote><div><br></div><div>Please spell it out in the d=
oc at least (it&#39;s not obvious, I had to search for the meaning in list =
archives ;).</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+##<br>
+<br>
+{ &#39;include&#39;: &#39;common.json&#39; }<br>
+<br>
+##<br>
+# @CprMode:<br>
+#<br>
+# @reboot: checkpoint can be cprload&#39;ed after a host kexec reboot.<br>
+#<br>
+# Since: 6.1<br>
+##<br>
+{ &#39;enum&#39;: &#39;CprMode&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;reboot&#39; ] }<br>
+<br>
+<br>
+##<br>
+# @CprInfo:<br>
+#<br>
+# @modes: @CprMode list<br>
+#<br>
+# Since: 6.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;CprInfo&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;modes&#39;: [ &#39;CprMode&#39; ] } }<br>
+<br>
+##<br>
+# @cprinfo:<br>
+#<br>
+# Returns the modes supported by @cprsave.<br>
+#<br>
+# Returns: @CprInfo<br>
+#<br>
+# Since: 6.1<br>
+#<br>
+##<br>
+{ &#39;command&#39;: &#39;cprinfo&#39;,<br>
+=C2=A0 &#39;returns&#39;: &#39;CprInfo&#39; }<br>
+<br>
+##<br>
+# @cprsave:<br>
+#<br>
+# Create a checkpoint of the virtual machine device state in @file.<br>
+# Guest RAM and guest block device blocks are not saved.<br>
+#<br></blockquote><div><br></div><div>It would be worth highlighting the d=
ifferences with snapshot-save/load.</div><div><br></div><div>I guess it wou=
ld make sense to consider this as an extension/variant to those commands.<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+# @file: name of checkpoint file<br>
+# @mode: @CprMode mode<br>
+#<br>
+# Since: 6.1<br>
+##<br>
+{ &#39;command&#39;: &#39;cprsave&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;file&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;mode&#39;: &#39;CprMode&#39=
; } }<br>
+<br>
+##<br>
+# @cprload:<br>
+#<br>
+# Start virtual machine from checkpoint file that was created earlier usin=
g<br>
+# the cprsave command.<br>
+#<br>
+# @file: name of checkpoint file<br>
+#<br>
+# Since: 6.1<br>
+##<br>
+{ &#39;command&#39;: &#39;cprload&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;file&#39;: &#39;str&#39; } }<br>
diff --git a/qapi/meson.build b/qapi/meson.build<br>
index 376f4ce..7e7c48a 100644<br>
--- a/qapi/meson.build<br>
+++ b/qapi/meson.build<br>
@@ -26,6 +26,7 @@ qapi_all_modules =3D [<br>
=C2=A0 =C2=A0&#39;common&#39;,<br>
=C2=A0 =C2=A0&#39;compat&#39;,<br>
=C2=A0 =C2=A0&#39;control&#39;,<br>
+=C2=A0 &#39;cpr&#39;,<br>
=C2=A0 =C2=A0&#39;crypto&#39;,<br>
=C2=A0 =C2=A0&#39;dump&#39;,<br>
=C2=A0 =C2=A0&#39;error&#39;,<br>
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json<br>
index 4912b97..001d790 100644<br>
--- a/qapi/qapi-schema.json<br>
+++ b/qapi/qapi-schema.json<br>
@@ -77,6 +77,7 @@<br>
=C2=A0{ &#39;include&#39;: &#39;ui.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;authz.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;migration.json&#39; }<br>
+{ &#39;include&#39;: &#39;cpr.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;transaction.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;trace.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;compat.json&#39; }<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004652f605c69c9de2--

