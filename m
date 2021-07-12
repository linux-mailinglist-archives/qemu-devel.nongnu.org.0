Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88953C63D3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:38:20 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31kx-0005os-8I
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m31jj-0005A9-V7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:37:04 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m31jh-0006Oj-AR
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:37:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nd37so36799915ejc.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gHGAIfVKGyNmjzzE2fdxyx6c9odBxwGW3pYoAwGIAfY=;
 b=EZCxrSrrwUmm01opoKOfwbChlIqHFyIAdmQy81yo5Nhflw85yhlKkQQ80ZWzq4icHi
 3QpTWtuvOaVMpiuodpyd9j6q93P6zXnnB6sKp79+IDjIH3nzpVtdFPHr1QJKK/NSHiTp
 VD/5yG+9mIzAht5tYCc4iNBXGS01GBnOHPJ9zgpRUjzOnHAgrkRnQZ9yvnesLErf2hJn
 7KV9/y2G9db3R28gL+yH3gc1GC4tFlbgQxaa6gs0oJO0twIxgTbNkSnNqmm5NcwJsNBN
 1SoQi/ZRTfX5ZzcMVi7YtnO10AcSfO7CGGQFuFza5Ep5EI0u8hroOa12lomVzKLZyXiO
 a4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHGAIfVKGyNmjzzE2fdxyx6c9odBxwGW3pYoAwGIAfY=;
 b=GpN6UEL9bc+KtMh8it0i8tuCqqdjm7UDbkXiWoKfbL243tBc+cr03iZ4Glx1wvOcWw
 HQkAuGCE+D9Aa4Y8cKqqRvgzlVmpbjX4jgCKzbg75ZV8JDgc4NuCy2rwk7P+Vzno6NpE
 7N5iMfIav0bcoR3lUNtnStSkoxmOGnnQK6F5EUqhjL6cn3c2rlVGkCH7GGK4uXb/mMIg
 Cq7I7XLSiDovquAW0SEEyckKg4q9diCk3y5Zx9WYMBcUfqRN3Z17ANytya4ImPgMVwrD
 BN+7sDO9VKDA8zyuo1qTIODRfxXqtIkL18YBDdKfhD2sBX6tsmaL3mQs7Kk98Oq3FuwZ
 ywHQ==
X-Gm-Message-State: AOAM532qgeVvmlxelKIJhyKh2Wh1Nl6Qzcvrzpjj3hP1r22pyVJOnRD4
 RkW0norzJo6neGcOxtsspC1VOAE0tJubthLjGhg=
X-Google-Smtp-Source: ABdhPJz5j1sf6CzU8POQliPsyBkxjSS+PARBkhYrxmDq2chx0GDOh9nUk5fuibI+HvyBOHaph1qgrQNq5aDsAFNSi3Q=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr734607eje.527.1626118618504; 
 Mon, 12 Jul 2021 12:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKEPHdJLNc7gHzsRm8xz7=qXES2v-mjPrp_6WS+73hp6Q@mail.gmail.com>
 <a682572b-8d24-c6e3-9036-2ba6349eb4e6@oracle.com>
In-Reply-To: <a682572b-8d24-c6e3-9036-2ba6349eb4e6@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Jul 2021 23:36:45 +0400
Message-ID: <CAJ+F1C+OHw5=GOwSEtoEbpujVtbA80bBPmq3DFJKv5d9T1xxPQ@mail.gmail.com>
Subject: Re: [PATCH V5 10/25] util: env var helpers
To: Steven Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000009e60e605c6f23e96"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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

--0000000000009e60e605c6f23e96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 12, 2021 at 11:19 PM Steven Sistare <steven.sistare@oracle.com>
wrote:

> On 7/8/2021 11:10 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 7, 2021 at 9:30 PM Steve Sistare <steven.sistare@oracle.com
> <mailto:steven.sistare@oracle.com>> wrote:
> >
> >     Add functions for saving fd's and other values in the environment v=
ia
> >     setenv, and for reading them back via getenv.
> >
> >
> > I understand that the rest of the series will rely on environment
> variables to associate and recover the child-passed FDs, but I am not
> really convinced that it is a good idea.
> >
> > Environment variables have a number of issues that we may encounter dow=
n
> the road: namespace, limits, concurrency, observability etc.. I wonder if
> the VMState couldn't have a section about the FD to recover. Or maybe jus=
t
> another shared memory region?
>
> They also have some advantages.  Their post-exec value can be observed vi=
a
> /proc/$pid/environ,
> and modified values can be observed by calling printenv() in a debugger.
> They are naturally carried
> across exec, with no external file to create and potentially lose.
> Lastly, libcs already defines
> put and get methods, so the additional layered code is small and simple.
> The number of variables
> is small, and I would rather not over-engineer an alternate solution unti=
l
> the env proves
> inadequate.  The limits on env size are huge on Linux.  The limits are
> smaller on Windows, but
> that is just one of multiple issues to be addressed to support live updat=
e
> on windows.
>
> For the alternatives, shared memory is no more observable (maybe less) an=
d
> also has no concurrency
> protection.  VMstate does not help because the descriptors are needed
> before the vmstate file
> is opened.
>

Why does it need to be "observable" from outside the process?

I meant memory to be shared between the qemu instances (without concurrency
etc).

You would only need that memory fd to be passed as argument to the next
qemu instance, to restore the rest of the contexts/fds I suppose.

I think we need to do this right, as it may have consequences for future
updates. It's effectively a kind of protocol. We have better chances to
handle different versions correctly by reusing VMState imho.


> > Some comments below. These new utils could also have some unit tests.
>
> OK.
>
> >     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:
> steven.sistare@oracle.com>>
> >     ---
> >      MAINTAINERS        |  2 ++
> >      include/qemu/env.h | 23 +++++++++++++
> >      util/env.c         | 95
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >      util/meson.build   |  1 +
> >      4 files changed, 121 insertions(+)
> >      create mode 100644 include/qemu/env.h
> >      create mode 100644 util/env.c
> >
> >     diff --git a/MAINTAINERS b/MAINTAINERS
> >     index c48dd37..8647a97 100644
> >     --- a/MAINTAINERS
> >     +++ b/MAINTAINERS
> >     @@ -2865,6 +2865,8 @@ S: Maintained
> >      F: include/migration/cpr.h
> >      F: migration/cpr.c
> >      F: qapi/cpr.json
> >     +F: include/qemu/env.h
> >     +F: util/env.c
> >
> >      Record/replay
> >      M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru <mailto:
> pavel.dovgaluk@ispras.ru>>
> >     diff --git a/include/qemu/env.h b/include/qemu/env.h
> >     new file mode 100644
> >     index 0000000..3dad503
> >     --- /dev/null
> >     +++ b/include/qemu/env.h
> >     @@ -0,0 +1,23 @@
> >     +/*
> >     + * Copyright (c) 2021 Oracle and/or its affiliates.
> >     + *
> >     + * This work is licensed under the terms of the GNU GPL, version 2=
.
> >     + * See the COPYING file in the top-level directory.
> >     + *
> >     + */
> >     +
> >     +#ifndef QEMU_ENV_H
> >     +#define QEMU_ENV_H
> >     +
> >     +#define FD_PREFIX "QEMU_FD_"
> >     +
> >     +typedef int (*walkenv_cb)(const char *name, const char *val, void
> *handle);
> >     +
> >     +int getenv_fd(const char *name);
> >     +void setenv_fd(const char *name, int fd);
> >     +void unsetenv_fd(const char *name);
> >     +void unsetenv_fdv(const char *fmt, ...);
> >     +int walkenv(const char *prefix, walkenv_cb cb, void *handle);
> >     +void printenv(void);
> >
> >
> > Please use qemu prefix, that avoids potential confusion with system
> libraries.
> >
> >     +
> >     +#endif
> >     diff --git a/util/env.c b/util/env.c
> >     new file mode 100644
> >     index 0000000..863678d
> >     --- /dev/null
> >     +++ b/util/env.c
> >     @@ -0,0 +1,95 @@
> >     +/*
> >     + * Copyright (c) 2021 Oracle and/or its affiliates.
> >     + *
> >     + * This work is licensed under the terms of the GNU GPL, version 2=
.
> >     + * See the COPYING file in the top-level directory.
> >     + */
> >     +
> >     +#include "qemu/osdep.h"
> >     +#include "qemu/cutils.h"
> >     +#include "qemu/env.h"
> >     +
> >     +static uint64_t getenv_ulong(const char *prefix, const char *name,
> int *err)
> >     +{
> >     +    char var[80], *val;
> >     +    uint64_t res =3D 0;
> >     +
> >     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> >
> >
> > No check for success / truncation...
> >
> > Please use g_autofree char *var =3D g_strdup_printf()..
> >
> >     +    val =3D getenv(var);
> >
> >
> > For consistency, I'd use g_getenv()
> >
> >     +    if (val) {
> >     +        *err =3D qemu_strtoul(val, NULL, 10, &res);
> >     +    } else {
> >     +        *err =3D -ENOENT;
> >     +    }
> >     +    return res;
> >     +}
> >     +
> >     +static void setenv_ulong(const char *prefix, const char *name,
> uint64_t val)
> >     +{
> >     +    char var[80], val_str[80];
> >     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> >     +    snprintf(val_str, sizeof(val_str), "%"PRIu64, val);
> >
> >
> > g_strdup_printf
> >
> >     +    setenv(var, val_str, 1);
> >
> >
> > g_setenv(), and return error value (or assert() if that makes more sens=
e)
> >
> >     +}
> >     +
> >     +static void unsetenv_ulong(const char *prefix, const char *name)
> >     +{
> >     +    char var[80];
> >     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> >
> >
> > g_strdup_printf
> >
> >
> >     +    unsetenv(var);
> >
> >
> > g_unsetenv
> >
> >     +}
> >     +
> >     +int getenv_fd(const char *name)
> >     +{
> >     +    int err;
> >     +    int fd =3D getenv_ulong(FD_PREFIX, name, &err);
> >
> >
> > I'd try to use qemu_parse_fd() instead.
> >
> >     +    return err ? -1 : fd;
> >     +}
> >     +
> >     +void setenv_fd(const char *name, int fd)
> >     +{
> >
> >
> > Maybe check fd >=3D 0 ?
> >
> >     +    setenv_ulong(FD_PREFIX, name, fd);
> >     +}
> >     +
> >     +void unsetenv_fd(const char *name)
> >     +{
> >     +    unsetenv_ulong(FD_PREFIX, name);
> >     +}
> >     +
> >     +void unsetenv_fdv(const char *fmt, ...)
> >     +{
> >     +    va_list args;
> >     +    char buf[80];
> >     +    va_start(args, fmt);
> >     +    vsnprintf(buf, sizeof(buf), fmt, args);
> >     +    va_end(args);
> >
> >
> > That seems to be a leftover.
>
> It is called in the subsequent vfio cpr patches.
>
> >     +}
> >     +
> >     +int walkenv(const char *prefix, walkenv_cb cb, void *handle)
> >
> >     +{
> >     +    char *str, name[128];
> >     +    char **envp =3D environ;
> >     +    size_t prefix_len =3D strlen(prefix);
> >     +
> >     +    while (*envp) {
> >     +        str =3D *envp++;
> >     +        if (!strncmp(str, prefix, prefix_len)) {
> >
> >     +            char *val =3D strchr(str, '=3D');
> >     +            str +=3D prefix_len;
> >     +            strncpy(name, str, val - str);
> >
> >
> > g_strndup() to avoid potential buffer overflow.
> >
> >     +            name[val - str] =3D 0;
> >     +            if (cb(name, val + 1, handle)) {
> >     +                return 1;
> >     +            }
> >     +        }
> >     +    }
> >     +    return 0;
> >     +}
> >     +
> >     +void printenv(void)
> >     +{
> >     +    char **ptr =3D environ;
> >     +    while (*ptr) {
> >     +        puts(*ptr++);
> >     +    }
> >     +}
> >
> >
> > Is this really useful? I doubt it.
>
> I call it from gdb for debugging, but I can delete it and cast g_listenv(=
)
> instead:
>   print *(((char ** (*)(void))g_listenv)())@100
>

Or just *environ@N ?


> Will do on the rest.
>
> - Steve
>
> >     diff --git a/util/meson.build b/util/meson.build
> >     index 0ffd7f4..5e8097a 100644
> >     --- a/util/meson.build
> >     +++ b/util/meson.build
> >     @@ -23,6 +23,7 @@ util_ss.add(files('host-utils.c'))
> >      util_ss.add(files('bitmap.c', 'bitops.c'))
> >      util_ss.add(files('fifo8.c'))
> >      util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
> >     +util_ss.add(files('env.c'))
> >      util_ss.add(files('error.c', 'qemu-error.c'))
> >      util_ss.add(files('qemu-print.c'))
> >      util_ss.add(files('id.c'))
> >     --
> >     1.8.3.1
> >
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009e60e605c6f23e96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 11:19 PM St=
even Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistar=
e@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 7/8/2021 11:10 AM, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Jul 7, 2021 at 9:30 PM Steve Sistare &lt;<a href=3D"mailto:ste=
ven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> &lt=
;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">stev=
en.sistare@oracle.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add functions for saving fd&#39;s and other values =
in the environment via<br>
&gt;=C2=A0 =C2=A0 =C2=A0setenv, and for reading them back via getenv.<br>
&gt; <br>
&gt; <br>
&gt; I understand that the rest of the series will rely on environment vari=
ables to associate and recover the child-passed FDs, but I am not really co=
nvinced that it is a good idea.<br>
&gt; <br>
&gt; Environment variables have a number of issues that we may encounter do=
wn the road: namespace, limits, concurrency, observability etc.. I wonder i=
f the VMState couldn&#39;t have a section about the FD to recover. Or maybe=
 just another shared memory region?<br>
<br>
They also have some advantages.=C2=A0 Their post-exec value can be observed=
 via /proc/$pid/environ,<br>
and modified values can be observed by calling printenv() in a debugger.=C2=
=A0 They are naturally carried<br>
across exec, with no external file to create and potentially lose.=C2=A0 La=
stly, libcs already defines<br>
put and get methods, so the additional layered code is small and simple.=C2=
=A0 The number of variables<br>
is small, and I would rather not over-engineer an alternate solution until =
the env proves<br>
inadequate.=C2=A0 The limits on env size are huge on Linux.=C2=A0 The limit=
s are smaller on Windows, but<br>
that is just one of multiple issues to be addressed to support live update =
on windows.<br>
<br>
For the alternatives, shared memory is no more observable (maybe less) and =
also has no concurrency<br>
protection.=C2=A0 VMstate does not help because the descriptors are needed =
before the vmstate file<br>
is opened.<br></blockquote><div><br></div><div>Why does it need to be &quot=
;observable&quot; from outside the process?</div><div><br></div><div>I mean=
t memory to be shared between the qemu instances (without concurrency etc).=
</div><div><br></div><div>You would only need that memory fd to be passed a=
s argument to the next qemu instance, to restore the rest of the contexts/f=
ds I suppose.<br></div><div><br></div><div>I think we need to do this right=
, as it may have consequences for future updates. It&#39;s effectively a ki=
nd of protocol. We have better chances to handle different versions correct=
ly by reusing VMState imho.<br></div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt; Some comments below. These new utils could also have some unit tests.<=
br>
<br>
OK.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:=
steven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> =
&lt;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">s=
teven.sistare@oracle.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/qemu/env.h | 23 +++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util/env.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util/meson.build=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A04 files changed, 121 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/qemu/env.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 util/env.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0index c48dd37..8647a97 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/MAINTAINERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/MAINTAINERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -2865,6 +2865,8 @@ S: Maintained<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0F: include/migration/cpr.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0F: migration/cpr.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0F: qapi/cpr.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0+F: include/qemu/env.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+F: util/env.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Record/replay<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0M: Pavel Dovgalyuk &lt;<a href=3D"mailto:pave=
l.dovgaluk@ispras.ru" target=3D"_blank">pavel.dovgaluk@ispras.ru</a> &lt;ma=
ilto:<a href=3D"mailto:pavel.dovgaluk@ispras.ru" target=3D"_blank">pavel.do=
vgaluk@ispras.ru</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/qemu/env.h b/include/qemu/env.=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000..3dad503<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/qemu/env.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,23 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Copyright (c) 2021 Oracle and/or its affiliates=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This work is licensed under the terms of the GN=
U GPL, version 2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See the COPYING file in the top-level directory=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#ifndef QEMU_ENV_H<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define QEMU_ENV_H<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define FD_PREFIX &quot;QEMU_FD_&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+typedef int (*walkenv_cb)(const char *name, const =
char *val, void *handle);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+int getenv_fd(const char *name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void setenv_fd(const char *name, int fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void unsetenv_fd(const char *name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void unsetenv_fdv(const char *fmt, ...);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+int walkenv(const char *prefix, walkenv_cb cb, voi=
d *handle);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void printenv(void);<br>
&gt; <br>
&gt; <br>
&gt; Please use qemu prefix, that avoids potential confusion with system li=
braries.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/util/env.c b/util/env.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000..863678d<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/util/env.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,95 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Copyright (c) 2021 Oracle and/or its affiliates=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * This work is licensed under the terms of the GN=
U GPL, version 2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * See the COPYING file in the top-level directory=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qemu/cutils.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qemu/env.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static uint64_t getenv_ulong(const char *prefix, c=
onst char *name, int *err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char var[80], *val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 uint64_t res =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%=
s&quot;, prefix, name);<br>
&gt; <br>
&gt; <br>
&gt; No check for success / truncation...<br>
&gt; <br>
&gt; Please use g_autofree char *var =3D g_strdup_printf()..<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 val =3D getenv(var);<br>
&gt; <br>
&gt; <br>
&gt; For consistency, I&#39;d use g_getenv()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (val) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *err =3D qemu_strtoul(=
val, NULL, 10, &amp;res);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *err =3D -ENOENT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void setenv_ulong(const char *prefix, const=
 char *name, uint64_t val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char var[80], val_str[80];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%=
s&quot;, prefix, name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 snprintf(val_str, sizeof(val_str), &=
quot;%&quot;PRIu64, val);<br>
&gt; <br>
&gt; <br>
&gt; g_strdup_printf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 setenv(var, val_str, 1);<br>
&gt; <br>
&gt; <br>
&gt; g_setenv(), and return error value (or assert() if that makes more sen=
se)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void unsetenv_ulong(const char *prefix, con=
st char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char var[80];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%=
s&quot;, prefix, name);<br>
&gt; <br>
&gt; <br>
&gt; g_strdup_printf<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 unsetenv(var);<br>
&gt; <br>
&gt; <br>
&gt; g_unsetenv<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+int getenv_fd(const char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 int err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 int fd =3D getenv_ulong(FD_PREFIX, n=
ame, &amp;err);<br>
&gt; <br>
&gt; <br>
&gt; I&#39;d try to use qemu_parse_fd() instead.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return err ? -1 : fd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void setenv_fd(const char *name, int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt; <br>
&gt; <br>
&gt; Maybe check fd &gt;=3D 0 ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 setenv_ulong(FD_PREFIX, name, fd);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void unsetenv_fd(const char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 unsetenv_ulong(FD_PREFIX, name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void unsetenv_fdv(const char *fmt, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 va_list args;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char buf[80];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 va_start(args, fmt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 vsnprintf(buf, sizeof(buf), fmt, arg=
s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 va_end(args);<br>
&gt; <br>
&gt; <br>
&gt; That seems to be a leftover.<br>
<br>
It is called in the subsequent vfio cpr patches.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+int walkenv(const char *prefix, walkenv_cb cb, voi=
d *handle)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char *str, name[128];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char **envp =3D environ;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 size_t prefix_len =3D strlen(prefix)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 while (*envp) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D *envp++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(str, pref=
ix, prefix_len)) {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *va=
l =3D strchr(str, &#39;=3D&#39;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str +=3D=
 prefix_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(=
name, str, val - str);<br>
&gt; <br>
&gt; <br>
&gt; g_strndup() to avoid potential buffer overflow.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[val=
 - str] =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cb(n=
ame, val + 1, handle)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+void printenv(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char **ptr =3D environ;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 while (*ptr) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 puts(*ptr++);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt; <br>
&gt; <br>
&gt; Is this really useful? I doubt it.<br>
<br>
I call it from gdb for debugging, but I can delete it and cast g_listenv() =
instead:<br>
=C2=A0 print *(((char ** (*)(void))g_listenv)())@100<br></blockquote><div><=
br></div><div>Or just *environ@N ?</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Will do on the rest.<br>
<br>
- Steve<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/util/meson.build b/util/meson.build<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0index 0ffd7f4..5e8097a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/util/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/util/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -23,6 +23,7 @@ util_ss.add(files(&#39;host-utils=
.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;bitmap.c&#39;, &#39;bi=
tops.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;fifo8.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;cacheinfo.c&#39;, &#39=
;cacheflush.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+util_ss.add(files(&#39;env.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;error.c&#39;, &#39;qem=
u-error.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;qemu-print.c&#39;))<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0util_ss.add(files(&#39;id.c&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A01.8.3.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009e60e605c6f23e96--

