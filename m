Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACB54E57C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:57:29 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qw4-0008J0-Ev
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qtz-000671-Ma
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:55:19 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qtx-0006jz-Rf
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:55:19 -0400
Received: by mail-lj1-x22b.google.com with SMTP id c30so1757280ljr.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P93Cc2z2yc5KgHvgJbQQwxfGv2dCYWh3rl+Gj54LIss=;
 b=DDxx4CheRp5qRDncc+akBEl92j5ErMvmMyc+SIG1jh5ISv48JS+E89HBULgYiYeSsZ
 WkyS8ezyM4rQRsLWoDn2yry4GkcGhn+YbniJHRuJEiJ7HuSztYHvw7xtomAeQXJTv7NY
 +e7r9t5/6hvQX3ka/i+UkXCqQ0vVUNhiZMUq9lpPrhKkYG1bux+7psaJGoD+h6++zl2x
 ZWY0EuzNVBNQRiKdZYkIWbUT0/TueMI3ktXV4vgmRMjH+k5YQb5dgrsjqqSSSsSl2gqK
 QXWr4/xgrJEvdLA3JzYHSZGHu1mXIHnA6dQRYErak8nvu/WY2C7XMqB8PHholj4WQYa2
 9XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P93Cc2z2yc5KgHvgJbQQwxfGv2dCYWh3rl+Gj54LIss=;
 b=UnoyqDEB3oZtUKfrzzuigORLqwIU7yvohUzB7bCzj0HSEp5TLo7UhO1f+NZmsvN6Za
 88EuwTusMkPpP1hFsFm1eCcR+4xRwrAfd/rnUcPjOlyrYr09Z/7gGCHapTbhY81MXqX2
 r+rbO/G+IilMJtbGFgba5M2BJdPJj6s7wRBwXG6xzqIuoXNav7eKyjlLFf+S9EwhBaU1
 UFn4ZiIAQnBPGodn2blLTG+0TVw2U1CHEQDPpJZgn6caw7eobOwHk8jMYXsRtRWEi8o2
 9LDyUdRoSzrD/jugEOFUd6IcUH+II5QWX6WB5fezAV09tNlXS8yq3agpUEyRelO3qQMM
 lnXw==
X-Gm-Message-State: AJIora9CYNzh3wbwyfyLlf8SOcf1h+yJ85VdpSvYuF/jQLXRGAWZKyXH
 Eqz1mYQXoHKWCx30PbT59DEoy1spmIOxP9UBxMI=
X-Google-Smtp-Source: AGRyM1t6/0+aUOU+oaRrgUqLpwNd18DHxATYrYMcFgCWYWo162gvjPW/q+HZhYdE22iLYPeNUHaAvfTCklXkq726ERk=
X-Received: by 2002:a2e:954e:0:b0:255:3768:9986 with SMTP id
 t14-20020a2e954e000000b0025537689986mr2815659ljh.516.1655391316051; Thu, 16
 Jun 2022 07:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 18:55:04 +0400
Message-ID: <CAJ+F1C+jXCrtggu1myigkmOVaw0DBAcSHNS5KCdP7b=7b7NC8Q@mail.gmail.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005b8d9c05e191d38b"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b8d9c05e191d38b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 6:54 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
> files and file descriptors.
>

File descriptors are not really unix specific, but that's a detail.

The names of the functions in the summary do not match the code, also
details :)

Eventually, I would suggest to follow the libc fopen/fdopen naming, if that
makes sense. (or the QIOChannel naming)


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>  migration/qemu-file-channel.h |  6 ++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.=
c
> index bb5a575..cc5aebc 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -27,8 +27,10 @@
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
> +#include "io/channel-file.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
> +#include "qapi/error.h"
>  #include "yank_functions.h"
>
>
> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>      object_ref(OBJECT(ioc));
>      return qemu_fopen_ops(ioc, &channel_output_ops, true);
>  }
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                          const char *name, Error **errp)
> +{
>

I would add ERRP_GUARD();


> +    g_autoptr(QIOChannelFile) fioc =3D NULL;
> +    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {
> +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported",
> path);
> +        return NULL;
> +    }
>

Why not take a "bool writable" instead, like the fdopen below?


> +
> +    fioc =3D qio_channel_file_new_path(path, flags, mode, errp);
> +    if (!fioc) {
> +        return NULL;
> +    }
> +
> +    ioc =3D QIO_CHANNEL(fioc);
> +    qio_channel_set_name(ioc, name);
> +    f =3D (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    return f;
>

"f" and parentheses are kinda superfluous


> +}
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
> +{
> +    g_autoptr(QIOChannelFile) fioc =3D qio_channel_file_new_fd(fd);
> +    QIOChannel *ioc =3D QIO_CHANNEL(fioc);
> +    QEMUFile *f =3D writable ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    qio_channel_set_name(ioc, name);
> +    return f;
>

or:

g_autoptr(QIOChannelFile) fioc =3D qio_channel_file_new_fd(fd);
qio_channel_set_name(QIO_CHANNEL(fioc), name);
return writable ? qemu_fopen_channel_output(ioc) :
qemu_fopen_channel_input(ioc);


> +}
> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.=
h
> index 0028a09..75fd0ad 100644
> --- a/migration/qemu-file-channel.h
> +++ b/migration/qemu-file-channel.h
> @@ -29,4 +29,10 @@
>
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                         const char *name, Error **errp);
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
> +
>  #endif
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005b8d9c05e191d38b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 6:54 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add qemu_file_open and qemu_fd_open to create QEMUFile objects f=
or unix<br>
files and file descriptors.<br></blockquote><div><br></div><div>File descri=
ptors are not really unix specific, but that&#39;s a detail.</div><div><br>=
</div><div>The names of the functions in the summary do not match the code,=
 also details :)</div><div><br></div><div>Eventually, I would suggest to fo=
llow the libc fopen/fdopen naming, if that makes sense. (or the QIOChannel =
naming)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++=
++<br>
=C2=A0migration/qemu-file-channel.h |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 42 insertions(+)<br>
<br>
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c<=
br>
index bb5a575..cc5aebc 100644<br>
--- a/migration/qemu-file-channel.c<br>
+++ b/migration/qemu-file-channel.c<br>
@@ -27,8 +27,10 @@<br>
=C2=A0#include &quot;qemu-file.h&quot;<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
=C2=A0#include &quot;io/channel-tls.h&quot;<br>
+#include &quot;io/channel-file.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;yank_functions.h&quot;<br>
<br>
<br>
@@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)<b=
r>
=C2=A0 =C2=A0 =C2=A0object_ref(OBJECT(ioc));<br>
=C2=A0 =C2=A0 =C2=A0return qemu_fopen_ops(ioc, &amp;channel_output_ops, tru=
e);<br>
=C2=A0}<br>
+<br>
+QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *name, Error **errp)<br>
+{<br></blockquote><div><br></div><div>I would add ERRP_GUARD();</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 g_autoptr(QIOChannelFile) fioc =3D NULL;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+=C2=A0 =C2=A0 QEMUFile *f;<br>
+<br>
+=C2=A0 =C2=A0 if (flags &amp; O_RDWR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;qemu_fopen_file %s: O_R=
DWR not supported&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Why not take a &quot;b=
ool writable&quot; instead, like the fdopen below?<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 fioc =3D qio_channel_file_new_path(path, flags, mode, errp);=
<br>
+=C2=A0 =C2=A0 if (!fioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ioc =3D QIO_CHANNEL(fioc);<br>
+=C2=A0 =C2=A0 qio_channel_set_name(ioc, name);<br>
+=C2=A0 =C2=A0 f =3D (flags &amp; O_WRONLY) ? qemu_fopen_channel_output(ioc=
) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fopen_channel_input(ioc);<br>
+=C2=A0 =C2=A0 return f;<br></blockquote><div><br></div><div>&quot;f&quot; =
and parentheses are kinda superfluous</div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)<br>
+{<br>
+=C2=A0 =C2=A0 g_autoptr(QIOChannelFile) fioc =3D qio_channel_file_new_fd(f=
d);<br>
+=C2=A0 =C2=A0 QIOChannel *ioc =3D QIO_CHANNEL(fioc);<br>
+=C2=A0 =C2=A0 QEMUFile *f =3D writable ? qemu_fopen_channel_output(ioc) :<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fopen_channel_input(ioc);<br>
+=C2=A0 =C2=A0 qio_channel_set_name(ioc, name);<br>
+=C2=A0 =C2=A0 return f;<br></blockquote><div><br></div><div>or:</div><div>=
<br></div><div>g_autoptr(QIOChannelFile) fioc =3D qio_channel_file_new_fd(f=
d);</div><div> qio_channel_set_name(QIO_CHANNEL(fioc), name);</div><div>ret=
urn writable ? qemu_fopen_channel_output(ioc) : qemu_fopen_channel_input(io=
c);</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+}<br>
diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h<=
br>
index 0028a09..75fd0ad 100644<br>
--- a/migration/qemu-file-channel.h<br>
+++ b/migration/qemu-file-channel.h<br>
@@ -29,4 +29,10 @@<br>
<br>
=C2=A0QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);<br>
=C2=A0QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);<br>
+<br>
+QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *name, Error **errp);<br>
+<br>
+QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);<br>
+<br>
=C2=A0#endif<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005b8d9c05e191d38b--

