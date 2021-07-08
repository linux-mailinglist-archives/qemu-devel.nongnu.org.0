Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62063C16E5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:13:20 +0200 (CEST)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WeN-0004v9-Rx
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WBS-0004Zn-EU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:43:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WBQ-0007M0-C7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:43:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id l2so9202796edt.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Ud3TrcPWKEXx/aYot/P+sLNDa+aPYa2luG1JD2Ppfc=;
 b=lIZ10te1DZ01u8khci0ynryXMug2GxDsucuB4wFWWO1xz5P8BK93OF8BXcRUkkvFAk
 TsgcrYMPbwIt99hXRO2v3adS3PzLa16yY2kT8ipCF1XehxT/nErYSN35ylclZvwa/FNJ
 x2E3VeWnfFveZZ+GbeMb+bqm+fl20MEmrbzbTC1sLoVN1pFwUI8zFtUYQfQntxQ0VLwy
 o/aoudCNYm3Im/f+5Fo5mo2ajgufHhtG4z4hYDOiygPKUtBS7CysbFt0BZctBX6hDVnj
 QgPpbyejSKidmlpRWmJS7YLuNmkXcYY20Xyb2lPMIkw6hx4olCE8P5xkPONkBTasgIUy
 b3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Ud3TrcPWKEXx/aYot/P+sLNDa+aPYa2luG1JD2Ppfc=;
 b=BbXmAW6Av2RJC/vH4o9+zM8EqwWQr2sPUFPcgm3bzMEuSM/aEq3RTc6rEnuFBcLZH/
 pzYgQkAL7h4Lbu+kC5Ijbw49L4knpnLwDZc8lJsh5TXHZ09SkcxxBqH6TUTtXQXVWy0r
 TFkHtgKoG5A1P7dmo74bOM69fOb/pa2exVvUTiveChnRRpP8QuTUdtEZ4TIld5IiQUvL
 QkfTiyUOkFahn6ioweQi5qxBraUeWajU0/f0TAgjDbdkXGu0YeQrVP5ehq4/hXTVV9QP
 zV140ZxI7fct4Ob+A3UrB2rv9yJz1APCWabKC7oLJRauMfEODAJSlGKKh5ANbuwHFtw6
 vxCw==
X-Gm-Message-State: AOAM533alYTrIMD1oRmgzp96asVClPWBnG4vsxQlFvrKGuJlEsvfEEot
 aMc4Dc7uuyj+Ky9P/y7uW5zTqUFI8qUEafAYgOg=
X-Google-Smtp-Source: ABdhPJwUIZnXOvW4cy7jV8Kp2pBNvlr/Lp6NK4Hvss8paQyyRzVycETWmjFYYWQ+jmGnviokaJY+tsR885hUSyGr5i8=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr39013690edb.164.1625759002170; 
 Thu, 08 Jul 2021 08:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-12-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-12-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 19:43:10 +0400
Message-ID: <CAJ+F1CLAKCE__kj4cMgGUvUzqfGkT1igbqpdQ3CZWtgD8SGL7Q@mail.gmail.com>
Subject: Re: [PATCH V5 11/25] cpr: restart mode
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000d0978505c69e83e3"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
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

--000000000000d0978505c69e83e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:31 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Provide the cprsave restart mode, which preserves the guest VM across a
> restart of the qemu process.  After cprsave, the caller passes qemu
> command-line arguments to cprexec, which directly exec's the new qemu
> binary.  The arguments must include -S so new qemu starts in a paused
> state.
> The caller resumes the guest by calling cprload.
>
> To use the restart mode, qemu must be started with the memfd-alloc machin=
e
> option.  The memfd's are saved to the environment and kept open across
> exec,
> after which they are found from the environment and re-mmap'd.  Hence gue=
st
> ram is preserved in place, albeit with new virtual addresses in the qemu
> process.
>
> The restart mode supports vfio devices in a subsequent patch.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

What's the plan to make it work with -object memory-backend-memfd -machine
memory-backend? (or memory-backend-file, I guess that should work?)

There should be some extra checks before accepting cprexec() on a
misconfigured VM.

---
>  migration/cpr.c   | 21 +++++++++++++++++++++
>  softmmu/physmem.c |  6 +++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/migration/cpr.c b/migration/cpr.c
> index c5bad8a..fb57dec 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -29,6 +29,7 @@
>  #include "sysemu/xen.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "hw/virtio/vhost.h"
> +#include "qemu/env.h"
>
>  QEMUFile *qf_file_open(const char *path, int flags, int mode,
>                                const char *name, Error **errp)
> @@ -108,6 +109,26 @@ done:
>      return;
>  }
>
> +static int preserve_fd(const char *name, const char *val, void *handle)
> +{
> +    qemu_clr_cloexec(atoi(val));
> +    return 0;
> +}
> +
> +void cprexec(strList *args, Error **errp)
> +{
> +    if (xen_enabled()) {
> +        error_setg(errp, "xen does not support cprexec");
> +        return;
> +    }
> +    if (!runstate_check(RUN_STATE_SAVE_VM)) {
> +        error_setg(errp, "runstate is not save-vm");
> +        return;
> +    }
> +    walkenv(FD_PREFIX, preserve_fd, 0);


I am  not convinced that relying on environment variables here is the best
thing to do.

+    qemu_system_exec_request(args);
> +}
> +
>  void cprload(const char *file, Error **errp)
>  {
>      QEMUFile *f;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index b149250..8a65ef7 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -65,6 +65,7 @@
>  #include "qemu/pmem.h"
>
>  #include "qemu/memfd.h"
> +#include "qemu/env.h"
>  #include "migration/vmstate.h"
>
>  #include "qemu/range.h"
> @@ -1986,7 +1987,7 @@ static void ram_block_add(RAMBlock *new_block, Erro=
r
> **errp)
>          } else {
>              name =3D memory_region_name(new_block->mr);
>              if (ms->memfd_alloc) {
>


-                int mfd =3D -1;          /* placeholder until next patch *=
/
> +                int mfd =3D getenv_fd(name);
>                  mr->align =3D QEMU_VMALLOC_ALIGN;
>                  if (mfd < 0) {
>                      mfd =3D qemu_memfd_create(name, maxlen + mr->align,
> @@ -1994,7 +1995,9 @@ static void ram_block_add(RAMBlock *new_block, Erro=
r
> **errp)
>                      if (mfd < 0) {
>                          return;
>                      }
> +                    setenv_fd(name, mfd);
>                  }
> +                qemu_clr_cloexec(mfd);
>

Why clear it now, and on exec again?

                 new_block->flags |=3D RAM_SHARED;
>                  addr =3D file_ram_alloc(new_block, maxlen, mfd,
>                                        false, false, 0, errp);
> @@ -2246,6 +2249,7 @@ void qemu_ram_free(RAMBlock *block)
>      }
>
>      qemu_mutex_lock_ramlist();
> +    unsetenv_fd(memory_region_name(block->mr));
>      QLIST_REMOVE_RCU(block, next);
>      ram_list.mru_block =3D NULL;
>      /* Write list before version */
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d0978505c69e83e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:31 PM Steve Sistare =
&lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@oracle.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">P=
rovide the cprsave restart mode, which preserves the guest VM across a<br>
restart of the qemu process.=C2=A0 After cprsave, the caller passes qemu<br=
>
command-line arguments to cprexec, which directly exec&#39;s the new qemu<b=
r>
binary.=C2=A0 The arguments must include -S so new qemu starts in a paused =
state.<br>
The caller resumes the guest by calling cprload.<br>
<br>
To use the restart mode, qemu must be started with the memfd-alloc machine<=
br>
option.=C2=A0 The memfd&#39;s are saved to the environment and kept open ac=
ross exec,<br>
after which they are found from the environment and re-mmap&#39;d.=C2=A0 He=
nce guest<br>
ram is preserved in place, albeit with new virtual addresses in the qemu<br=
>
process.<br>
<br>
The restart mode supports vfio devices in a subsequent patch.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockquote><div=
><br></div><div>What&#39;s the plan to make it work with -object memory-bac=
kend-memfd -machine memory-backend? (or memory-backend-file, I guess that s=
hould work?)<br></div><div><br></div><div>There should be some extra checks=
 before accepting cprexec() on a misconfigured VM.</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0migration/cpr.c=C2=A0 =C2=A0| 21 +++++++++++++++++++++<br>
=C2=A0softmmu/physmem.c |=C2=A0 6 +++++-<br>
=C2=A02 files changed, 26 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/migration/cpr.c b/migration/cpr.c<br>
index c5bad8a..fb57dec 100644<br>
--- a/migration/cpr.c<br>
+++ b/migration/cpr.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;sysemu/xen.h&quot;<br>
=C2=A0#include &quot;hw/vfio/vfio-common.h&quot;<br>
=C2=A0#include &quot;hw/virtio/vhost.h&quot;<br>
+#include &quot;qemu/env.h&quot;<br>
<br>
=C2=A0QEMUFile *qf_file_open(const char *path, int flags, int mode,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name, Error **errp)<br>
@@ -108,6 +109,26 @@ done:<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0}<br>
<br>
+static int preserve_fd(const char *name, const char *val, void *handle)<br=
>
+{<br>
+=C2=A0 =C2=A0 qemu_clr_cloexec(atoi(val));<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+void cprexec(strList *args, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 if (xen_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;xen does not support cp=
rexec&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (!runstate_check(RUN_STATE_SAVE_VM)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;runstate is not save-vm=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 walkenv(FD_PREFIX, preserve_fd, 0);</blockquote><div><br></d=
iv><div>I am=C2=A0 not convinced that relying on environment variables here=
 is the best thing to do.<br></div><div> <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 qemu_system_exec_request(args);<br>
+}<br>
+<br>
=C2=A0void cprload(const char *file, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUFile *f;<br>
diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
index b149250..8a65ef7 100644<br>
--- a/softmmu/physmem.c<br>
+++ b/softmmu/physmem.c<br>
@@ -65,6 +65,7 @@<br>
=C2=A0#include &quot;qemu/pmem.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/memfd.h&quot;<br>
+#include &quot;qemu/env.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
@@ -1986,7 +1987,7 @@ static void ram_block_add(RAMBlock *new_block, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D memory_region_name=
(new_block-&gt;mr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ms-&gt;memfd_alloc) {<b=
r></blockquote><div><br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mfd =3D -1;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* placeholder until next patch */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mfd =3D getenv=
_fd(name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mr-&gt;align =
=3D QEMU_VMALLOC_ALIGN;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mfd &lt; =
0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mfd =3D qemu_memfd_create(name, maxlen + mr-&gt;align,<br>
@@ -1994,7 +1995,9 @@ static void ram_block_add(RAMBlock *new_block, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (mfd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sete=
nv_fd(name, mfd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clr_cloexec(m=
fd);<br></blockquote><div><br></div><div>Why clear it now, and on exec agai=
n?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_block-&gt=
;flags |=3D RAM_SHARED;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D file=
_ram_alloc(new_block, maxlen, mfd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false, fa=
lse, 0, errp);<br>
@@ -2246,6 +2249,7 @@ void qemu_ram_free(RAMBlock *block)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_ramlist();<br>
+=C2=A0 =C2=A0 unsetenv_fd(memory_region_name(block-&gt;mr));<br>
=C2=A0 =C2=A0 =C2=A0QLIST_REMOVE_RCU(block, next);<br>
=C2=A0 =C2=A0 =C2=A0ram_list.mru_block =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0/* Write list before version */<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d0978505c69e83e3--

