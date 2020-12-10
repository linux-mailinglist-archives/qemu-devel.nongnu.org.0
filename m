Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E9F2D553D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:22:18 +0100 (CET)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHDM-00043U-La
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knHBe-0003Vt-4X
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:20:30 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:45348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knHBV-0003IE-4G
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:20:29 -0500
Received: by mail-ej1-x641.google.com with SMTP id qw4so6050283ejb.12
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 00:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFjvJixi6u0BUkJOrtev/FcwCEUBhhdxLTAwyPPaVWU=;
 b=usYr7JC9yBcqNGP7inah76kwHkXbx9bohtd313WK5BoobJv+lJ9OhhcmcTyt+f2MpD
 uxQA3SamtAP7nDLmhggINKpBVlo+YtgkKRPRkfbGAFJZZF4JC5mj6yH30W9y5wXQdEYn
 72ebosIXG1K9jXoyDodDUEyXvGzf2UBCXtFlzU338Jjfp30tsAO3LUBQK00ebjh1Eay+
 DXWivzDx22QuxtTFHNDP2DnvNSBp/FJeIIWYHaxNxUKGfTIrAVzbNXhX0fL1G/pnfiXN
 Z4CiZS7KLK8RIJXkM8f/fVY/BRumu6V2d0t4Zjv20VM74HHAAVS6jxjfFXHjzXJVuSFv
 SFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFjvJixi6u0BUkJOrtev/FcwCEUBhhdxLTAwyPPaVWU=;
 b=PX5Ho+z3S/p2JCTyrTnwTbV7jmN+dsx+vAl1OXVd/QzCiDJ894ihDDQXsZ9scbb+dF
 fFjKh6rf6tR1E3OBR8dj2atUJ054eR2Uu0H8tt/0Ss3BG3A5Ly0KTSpix/3hNeHDtCsc
 fgYsJHa+DxJEkx5BpYWRuEDlBabtk0bzfvUkVuZ+EacWKmIcxohMIdgL/ubwcbA+nILw
 5gZbPORSWjydCGUUVG5T6k5ONdnCQPU+y7Gdtquzq30d2HNU61/45iNX0pfVRyoCj1FW
 1HOxvY88CW5xATDSjEmTx1MuZtOlCwXxeQQuPUMvrqARkZAYv0Nh2v/+NTZ0EJpasWGx
 Io1w==
X-Gm-Message-State: AOAM530C00dG30EDHvWCVpgCeDXNELs+2hb+fIkJ2f3zRBiHEBj/GzXV
 PLpUY3nJQTOrTrXZ/hr/vq/k76uO9XWjQChyyPg=
X-Google-Smtp-Source: ABdhPJyL5c9j7yCjmt1RsSDx2lli/Mt6NPAUab7bxdjja7Ho710l1Ji8Li61jmtX2bFYfu/1KqzV31KCaj4sLQ2SDdM=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr5378937ejb.532.1607588419427; 
 Thu, 10 Dec 2020 00:20:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <b9bcba65f98a763669255dd1bc6533bc8310a235.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1CK+NHESWKSHEdvJ3j95iiAAY9LkrVw7zSrQpWMj8jNEAw@mail.gmail.com>
 <20201210014005.GA48815@flaka>
In-Reply-To: <20201210014005.GA48815@flaka>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Dec 2020 12:20:06 +0400
Message-ID: <CAJ+F1CKQLU_=bJwHaFCmiOfmp4XitHMo92fn_Xw9MpAeX3FqEg@mail.gmail.com>
Subject: Re: [PATCH v12 08/19] multi-process: define MPQemuMsg format and
 transmission functions
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000af62a005b617d844"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000af62a005b617d844
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 10, 2020 at 5:42 AM Elena Ufimtseva <elena.ufimtseva@oracle.com=
>
wrote:

> On Mon, Dec 07, 2020 at 05:18:46PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com=
>
> > wrote:
> >
> > > From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > >
> > > Defines MPQemuMsg, which is the message that is sent to the remote
> > > process. This message is sent over QIOChannel and is used to
> > > command the remote process to perform various tasks.
> > > Define transmission functions used by proxy and by remote.
> > > There are certain restrictions on where its safe to use these
> > > functions:
> > >   - From main loop in co-routine context. Will block the main loop if
> not
> > > in
> > >     co-routine context;
> > >   - From vCPU thread with no co-routine context and if the channel is
> not
> > > part
> > >     of the main loop handling;
> > >   - From IOThread within co-routine context, outside of co-routine
> context
> > > will
> > >     block IOThread;
> > >
> > > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > ---
> > >  include/hw/remote/mpqemu-link.h |  60 ++++++++++
> > >  hw/remote/mpqemu-link.c         | 242
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  MAINTAINERS                     |   2 +
> > >  hw/remote/meson.build           |   1 +
> > >  4 files changed, 305 insertions(+)
> > >  create mode 100644 include/hw/remote/mpqemu-link.h
> > >  create mode 100644 hw/remote/mpqemu-link.c
> > >
> > > diff --git a/include/hw/remote/mpqemu-link.h
> > > b/include/hw/remote/mpqemu-link.h
> > > new file mode 100644
> > > index 0000000..2d79ff8
> > > --- /dev/null
> > > +++ b/include/hw/remote/mpqemu-link.h
> > > @@ -0,0 +1,60 @@
> > > +/*
> > > + * Communication channel between QEMU and remote device process
> > > + *
> > > + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > > later.
> > > + * See the COPYING file in the top-level directory.
> > > + *
> > > + */
> > > +
> > > +#ifndef MPQEMU_LINK_H
> > > +#define MPQEMU_LINK_H
> > > +
> > > +#include "qom/object.h"
> > > +#include "qemu/thread.h"
> > > +#include "io/channel.h"
> > > +
> > > +#define REMOTE_MAX_FDS 8
> > > +
> > > +#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
> > > +
> > > +/**
> > > + * MPQemuCmd:
> > > + *
> > > + * MPQemuCmd enum type to specify the command to be executed on the
> remote
> > > + * device.
> > > + */
> > > +typedef enum {
> > > +    MPQEMU_CMD_INIT,
> > > +    MPQEMU_CMD_MAX,
> > > +} MPQemuCmd;
> > > +
> > > +/**
> > > + * MPQemuMsg:
> > > + * @cmd: The remote command
> > > + * @size: Size of the data to be shared
> > > + * @data: Structured data
> > > + * @fds: File descriptors to be shared with remote device
> > > + *
> > > + * MPQemuMsg Format of the message sent to the remote device from
> QEMU.
> > > + *
> > > + */
> > > +typedef struct {
> > > +    int cmd;
> > > +    size_t size;
> > > +
> > > +    union {
> > > +        uint64_t u64;
> > > +    } data;
> > > +
> > > +    int fds[REMOTE_MAX_FDS];
> > > +    int num_fds;
> > > +} MPQemuMsg;
> > > +
> > > +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> > > +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> > > +
> > > +bool mpqemu_msg_valid(MPQemuMsg *msg);
> > > +
> > > +#endif
> > > diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> > > new file mode 100644
> > > index 0000000..e535ed2
> > > --- /dev/null
> > > +++ b/hw/remote/mpqemu-link.c
> > > @@ -0,0 +1,242 @@
> > > +/*
> > > + * Communication channel between QEMU and remote device process
> > > + *
> > > + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > > later.
> > > + * See the COPYING file in the top-level directory.
> > > + *
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu-common.h"
> > > +
> > > +#include "qemu/module.h"
> > > +#include "hw/remote/mpqemu-link.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/iov.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/main-loop.h"
> > > +
> > > +/*
> > > + * Send message over the ioc QIOChannel.
> > > + * This function is safe to call from:
> > > + * - From main loop in co-routine context. Will block the main loop =
if
> > > not in
> > > + *   co-routine context;
> > > + * - From vCPU thread with no co-routine context and if the channel =
is
> > > not part
> > > + *   of the main loop handling;
> > > + * - From IOThread within co-routine context, outside of co-routine
> > > context
> > > + *   will block IOThread;
> > >
> >
> > Can drop the extra "From" on each line.
> >
> > + */
> > > +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> > > +{
> > > +    bool iolock =3D qemu_mutex_iothread_locked();
> > > +    bool iothread =3D qemu_get_current_aio_context() =3D=3D
> > > qemu_get_aio_context() ?
> > > +                    false : true;
> > >
> >
> > I would introduce a qemu_in_iothread() helper (similar to
> > qemu_in_coroutine() etc)
> >
> > +    Error *local_err =3D NULL;
> > > +    struct iovec send[2] =3D {0};
> > > +    int *fds =3D NULL;
> > > +    size_t nfds =3D 0;
> > > +
> > > +    send[0].iov_base =3D msg;
> > > +    send[0].iov_len =3D MPQEMU_MSG_HDR_SIZE;
> > > +
> > > +    send[1].iov_base =3D (void *)&msg->data;
> > > +    send[1].iov_len =3D msg->size;
> > > +
> > > +    if (msg->num_fds) {
> > > +        nfds =3D msg->num_fds;
> > > +        fds =3D msg->fds;
> > > +    }
> > > +    /*
> > > +     * Dont use in IOThread out of co-routine context as
> > > +     * it will block IOThread.
> > > +     */
> > > +    if (iothread) {
> > > +        assert(qemu_in_coroutine());
> > > +    }
> > >
> >
> > or simply assert(!iothread || qemu_in_coroutine())
> >
> > +    /*
> > > +     * Skip unlocking/locking iothread when in IOThread running
> > > +     * in co-routine context. Co-routine context is asserted above
> > > +     * for IOThread case.
> > > +     * Also skip this while in a co-routine in the main context.
> > > +     */
> > > +    if (iolock && !iothread && !qemu_in_coroutine()) {
> > > +        qemu_mutex_unlock_iothread();
> > > +    }
> > > +
> > > +    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
> fds,
> > > nfds,
> > > +                                      &local_err);
> > >
> >
> > That extra (void) is probably unnecessary.
> >
> >
> > +
> > > +    if (iolock && !iothread && !qemu_in_coroutine()) {
> > > +        /* See above comment why skip locking here. */
> > > +        qemu_mutex_lock_iothread();
> > > +    }
> > > +
> > > +    if (errp) {
> > > +        error_propagate(errp, local_err);
> > > +    } else if (local_err) {
> > > +        error_report_err(local_err);
> > > +    }
> > >
> >
>
> Hi Marc-Andre,
>
> Thank you for reviewing the patches.
>
>
> > Not sure this behaviour is recommended. Instead, a trace and an
> ERRP_GUARD
> > would be more idiomatic.
>
> Did you mean to suggest using trace_ functions for the general use, not
> only the
> failure path. Just want to make sure I understood correctly.
>

That's what I would suggest for error handling: (not tested)

diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index d75b4782ee..a7ac37627e 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -31,10 +31,10 @@
  */
 void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
 {
+    ERRP_GUARD();
     bool iolock =3D qemu_mutex_iothread_locked();
     bool iothread =3D qemu_get_current_aio_context() =3D=3D
qemu_get_aio_context() ?
                     false : true;
-    Error *local_err =3D NULL;
     struct iovec send[2] =3D {0};
     int *fds =3D NULL;
     size_t nfds =3D 0;
@@ -66,21 +66,15 @@ void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc,
Error **errp)
         qemu_mutex_unlock_iothread();
     }

-    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds,
nfds,
-                                      &local_err);
+    if (qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds,
nfds, errp) =3D=3D -1) {
+        trace_mpqemu_io_error(msg, ioc, error_get_pretty(*errp));
+    }

     if (iolock && !iothread && !qemu_in_coroutine()) {
         /* See above comment why skip locking here. */
         qemu_mutex_lock_iothread();
     }

-    if (errp) {
-        error_propagate(errp, local_err);
-    } else if (local_err) {
-        error_report_err(local_err);
-    }
-
-    return;
 }




>
> Should the trace file subdirectory (in this case ./hw/remote/) be include=
d
> into
> trace_events_subdirs of meson.build with the condition that
> CONFIG_MULTIPROCESS is enabled?
>
> Something like
> <snip>
>
> config_devices_mak_file =3D target + '-config-devices.mak'
> devconfig =3D keyval.load(meson.current_build_dir() / target +
> '-config-devices.mak')
> have_multiprocess =3D 'CONFIG_MULTIPROCESS' in devconfig
>
> if have_multiproces
> ...'
>
> </snip>
>

That shouldn't be necessary, do like the other hw/ traces, adding themself
to trace_events_subdirs.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000af62a005b617d844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 5:42 AM Ele=
na Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com">elena.ufimts=
eva@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Mon, Dec 07, 2020 at 05:18:46PM +0400, Marc-Andr=C3=A9 Lur=
eau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman &lt;<a href=3D"mailt=
o:jag.raman@oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracl=
e.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Defines MPQemuMsg, which is the message that is sent to the remot=
e<br>
&gt; &gt; process. This message is sent over QIOChannel and is used to<br>
&gt; &gt; command the remote process to perform various tasks.<br>
&gt; &gt; Define transmission functions used by proxy and by remote.<br>
&gt; &gt; There are certain restrictions on where its safe to use these<br>
&gt; &gt; functions:<br>
&gt; &gt;=C2=A0 =C2=A0- From main loop in co-routine context. Will block th=
e main loop if not<br>
&gt; &gt; in<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0co-routine context;<br>
&gt; &gt;=C2=A0 =C2=A0- From vCPU thread with no co-routine context and if =
the channel is not<br>
&gt; &gt; part<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0of the main loop handling;<br>
&gt; &gt;=C2=A0 =C2=A0- From IOThread within co-routine context, outside of=
 co-routine context<br>
&gt; &gt; will<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0block IOThread;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@=
oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt; &gt; Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnso=
n@oracle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimts=
eva@oracle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 include/hw/remote/mpqemu-link.h |=C2=A0 60 ++++++++++<br>
&gt; &gt;=C2=A0 hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
242<br>
&gt; &gt; ++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt;=C2=A0 hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 4 files changed, 305 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 include/hw/remote/mpqemu-link.h<br>
&gt; &gt;=C2=A0 create mode 100644 hw/remote/mpqemu-link.c<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/include/hw/remote/mpqemu-link.h<br>
&gt; &gt; b/include/hw/remote/mpqemu-link.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..2d79ff8<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/include/hw/remote/mpqemu-link.h<br>
&gt; &gt; @@ -0,0 +1,60 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Communication channel between QEMU and remote device process<=
br>
&gt; &gt; + *<br>
&gt; &gt; + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
&gt; &gt; + *<br>
&gt; &gt; + * This work is licensed under the terms of the GNU GPL, version=
 2 or<br>
&gt; &gt; later.<br>
&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt; &gt; + *<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef MPQEMU_LINK_H<br>
&gt; &gt; +#define MPQEMU_LINK_H<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;qom/object.h&quot;<br>
&gt; &gt; +#include &quot;qemu/thread.h&quot;<br>
&gt; &gt; +#include &quot;io/channel.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#define REMOTE_MAX_FDS 8<br>
&gt; &gt; +<br>
&gt; &gt; +#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * MPQemuCmd:<br>
&gt; &gt; + *<br>
&gt; &gt; + * MPQemuCmd enum type to specify the command to be executed on =
the remote<br>
&gt; &gt; + * device.<br>
&gt; &gt; + */<br>
&gt; &gt; +typedef enum {<br>
&gt; &gt; +=C2=A0 =C2=A0 MPQEMU_CMD_INIT,<br>
&gt; &gt; +=C2=A0 =C2=A0 MPQEMU_CMD_MAX,<br>
&gt; &gt; +} MPQemuCmd;<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * MPQemuMsg:<br>
&gt; &gt; + * @cmd: The remote command<br>
&gt; &gt; + * @size: Size of the data to be shared<br>
&gt; &gt; + * @data: Structured data<br>
&gt; &gt; + * @fds: File descriptors to be shared with remote device<br>
&gt; &gt; + *<br>
&gt; &gt; + * MPQemuMsg Format of the message sent to the remote device fro=
m QEMU.<br>
&gt; &gt; + *<br>
&gt; &gt; + */<br>
&gt; &gt; +typedef struct {<br>
&gt; &gt; +=C2=A0 =C2=A0 int cmd;<br>
&gt; &gt; +=C2=A0 =C2=A0 size_t size;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 union {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64;<br>
&gt; &gt; +=C2=A0 =C2=A0 } data;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 int fds[REMOTE_MAX_FDS];<br>
&gt; &gt; +=C2=A0 =C2=A0 int num_fds;<br>
&gt; &gt; +} MPQemuMsg;<br>
&gt; &gt; +<br>
&gt; &gt; +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **er=
rp);<br>
&gt; &gt; +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **er=
rp);<br>
&gt; &gt; +<br>
&gt; &gt; +bool mpqemu_msg_valid(MPQemuMsg *msg);<br>
&gt; &gt; +<br>
&gt; &gt; +#endif<br>
&gt; &gt; diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br=
>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..e535ed2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/hw/remote/mpqemu-link.c<br>
&gt; &gt; @@ -0,0 +1,242 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Communication channel between QEMU and remote device process<=
br>
&gt; &gt; + *<br>
&gt; &gt; + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
&gt; &gt; + *<br>
&gt; &gt; + * This work is licensed under the terms of the GNU GPL, version=
 2 or<br>
&gt; &gt; later.<br>
&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt; &gt; + *<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; +#include &quot;qemu-common.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;qemu/module.h&quot;<br>
&gt; &gt; +#include &quot;hw/remote/mpqemu-link.h&quot;<br>
&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt; &gt; +#include &quot;qemu/iov.h&quot;<br>
&gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; &gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Send message over the ioc QIOChannel.<br>
&gt; &gt; + * This function is safe to call from:<br>
&gt; &gt; + * - From main loop in co-routine context. Will block the main l=
oop if<br>
&gt; &gt; not in<br>
&gt; &gt; + *=C2=A0 =C2=A0co-routine context;<br>
&gt; &gt; + * - From vCPU thread with no co-routine context and if the chan=
nel is<br>
&gt; &gt; not part<br>
&gt; &gt; + *=C2=A0 =C2=A0of the main loop handling;<br>
&gt; &gt; + * - From IOThread within co-routine context, outside of co-rout=
ine<br>
&gt; &gt; context<br>
&gt; &gt; + *=C2=A0 =C2=A0will block IOThread;<br>
&gt; &gt;<br>
&gt; <br>
&gt; Can drop the extra &quot;From&quot; on each line.<br>
&gt; <br>
&gt; + */<br>
&gt; &gt; +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **er=
rp)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 bool iolock =3D qemu_mutex_iothread_locked();<br>
&gt; &gt; +=C2=A0 =C2=A0 bool iothread =3D qemu_get_current_aio_context() =
=3D=3D<br>
&gt; &gt; qemu_get_aio_context() ?<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 false : true;<br>
&gt; &gt;<br>
&gt; <br>
&gt; I would introduce a qemu_in_iothread() helper (similar to<br>
&gt; qemu_in_coroutine() etc)<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0 struct iovec send[2] =3D {0};<br>
&gt; &gt; +=C2=A0 =C2=A0 int *fds =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0 size_t nfds =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 send[0].iov_base =3D msg;<br>
&gt; &gt; +=C2=A0 =C2=A0 send[0].iov_len =3D MPQEMU_MSG_HDR_SIZE;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 send[1].iov_base =3D (void *)&amp;msg-&gt;data;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 send[1].iov_len =3D msg-&gt;size;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (msg-&gt;num_fds) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds =3D msg-&gt;num_fds;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fds =3D msg-&gt;fds;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Dont use in IOThread out of co-routine con=
text as<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* it will block IOThread.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 if (iothread) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(qemu_in_coroutine());<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; <br>
&gt; or simply assert(!iothread || qemu_in_coroutine())<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Skip unlocking/locking iothread when in IO=
Thread running<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* in co-routine context. Co-routine context =
is asserted above<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* for IOThread case.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Also skip this while in a co-routine in th=
e main context.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_i=
n_coroutine()) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 (void)qio_channel_writev_full_all(ioc, send, G_N_E=
LEMENTS(send), fds,<br>
&gt; &gt; nfds,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;=
local_err);<br>
&gt; &gt;<br>
&gt; <br>
&gt; That extra (void) is probably unnecessary.<br>
&gt; <br>
&gt; <br>
&gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_i=
n_coroutine()) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See above comment why skip lockin=
g here. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (errp) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 } else if (local_err) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; <br>
<br>
Hi Marc-Andre,<br>
<br>
Thank you for reviewing the patches.<br>
<br>
<br>
&gt; Not sure this behaviour is recommended. Instead, a trace and an ERRP_G=
UARD<br>
&gt; would be more idiomatic.<br>
<br>
Did you mean to suggest using trace_ functions for the general use, not onl=
y the<br>
failure path. Just want to make sure I understood correctly.<br></blockquot=
e></div><div class=3D"gmail_quote"><div><br></div><div>That&#39;s what I wo=
uld suggest for error handling: (not tested)<br></div><div><br></div><div>d=
iff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>index d75b=
4782ee..a7ac37627e 100644<br>--- a/hw/remote/mpqemu-link.c<br>+++ b/hw/remo=
te/mpqemu-link.c<br>@@ -31,10 +31,10 @@<br>=C2=A0 */<br>=C2=A0void mpqemu_m=
sg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)<br>=C2=A0{<br>+ =C2=
=A0 =C2=A0ERRP_GUARD();<br>=C2=A0 =C2=A0 =C2=A0bool iolock =3D qemu_mutex_i=
othread_locked();<br>=C2=A0 =C2=A0 =C2=A0bool iothread =3D qemu_get_current=
_aio_context() =3D=3D qemu_get_aio_context() ?<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false : true;<br>- =C2=
=A0 =C2=A0Error *local_err =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0struct iovec se=
nd[2] =3D {0};<br>=C2=A0 =C2=A0 =C2=A0int *fds =3D NULL;<br>=C2=A0 =C2=A0 =
=C2=A0size_t nfds =3D 0;<br>@@ -66,21 +66,15 @@ void mpqemu_msg_send(MPQemu=
Msg *msg, QIOChannel *ioc, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qemu_mutex_unlock_iothread();<br>=C2=A0 =C2=A0 =C2=A0}<br><br>- =C2=A0 =
=C2=A0(void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds,=
 nfds,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;l=
ocal_err);<br>+ =C2=A0 =C2=A0if (qio_channel_writev_full_all(ioc, send, G_N=
_ELEMENTS(send), fds, nfds, errp) =3D=3D -1) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0trace_mpqemu_io_error(msg, ioc, error_get_pretty(*errp));<br>+ =C2=A0=
 =C2=A0}<br><br>=C2=A0 =C2=A0 =C2=A0if (iolock &amp;&amp; !iothread &amp;&a=
mp; !qemu_in_coroutine()) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* See abo=
ve comment why skip locking here. */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q=
emu_mutex_lock_iothread();<br>=C2=A0 =C2=A0 =C2=A0}<br><br>- =C2=A0 =C2=A0i=
f (errp) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err)=
;<br>- =C2=A0 =C2=A0} else if (local_err) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0error_report_err(local_err);<br>- =C2=A0 =C2=A0}<br>-<br>- =C2=A0 =C2=A0=
return;<br>=C2=A0}<br><br><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Should the trace file subdirectory (in this case ./hw/remote/) be included =
into<br>
trace_events_subdirs of meson.build with the condition that CONFIG_MULTIPRO=
CESS is enabled?<br>
<br>
Something like <br>
&lt;snip&gt;<br>
<br>
config_devices_mak_file =3D target + &#39;-config-devices.mak&#39;<br>
devconfig =3D keyval.load(meson.current_build_dir() / target + &#39;-config=
-devices.mak&#39;)<br>
have_multiprocess =3D &#39;CONFIG_MULTIPROCESS&#39; in devconfig<br>
<br>
if have_multiproces<br>
...&#39;<br>
<br>
&lt;/snip&gt;<br></blockquote><div><br></div><div>That shouldn&#39;t be nec=
essary, do like the other hw/ traces, adding themself to trace_events_subdi=
rs.</div><div> </div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000af62a005b617d844--

