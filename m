Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F142D121F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:31:43 +0100 (CET)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGcA-0005VL-5Y
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmGPw-00065N-B7
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:19:07 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmGPs-00029H-4o
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:19:03 -0500
Received: by mail-ej1-x642.google.com with SMTP id d17so19404274ejy.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7PVudM5BHlk/RPkp603smFO5ApCJ4dfqBOrdZbJCtE=;
 b=Pj3vbkEBz20swi+NBXgb9dgO7PH4hrILFp6fXYpzhcrGmtYXiGHBJvfPTX5JJ18atK
 1qoAQwMK36f5XBjEcN387wOvcA9nnVUJNDaexfJSSCCwlcwaE0HxaqelR5miAq4Ts0X+
 Jw5ckq843VoZhauwjO9L4W9vWnHOliC7lC7Pxnj8Ua1tDv1WD1qHqYsljMWnOOyvKmno
 6xagx7JnLuYWlVqtDwjuDE+VLLIXMIBFmgG3Yrz/5MKDw/IL6Wqd5HsXM2EHqcV5QK4b
 4apNqTS9+kbHPbgRZDrpigb3mXEj7FqA1oueFpEpugxo98vw2GN5rmVeFk4J7c90pYxX
 UF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7PVudM5BHlk/RPkp603smFO5ApCJ4dfqBOrdZbJCtE=;
 b=X/EOcyou40ouKfkW7G0H4P0rSGnOtcPS3XIKy94jth90lti71WFs1RXWoPFr/wxn/1
 dCoegHXADAAno3y24w/KEUQmySw9FCQQ1APzzL9A4hEQWh9DXE4iBB/CXfYsVpL7djGK
 jPgJjoTzQiWMrVH/k2C8QGVgZ9t6L7Xq2pd+BI6zXeoDor63CnhjCJxlvv6r4cuLV64h
 t/ImOiU5JHe9Mz4TK7I5MqDx2eUwMxNjzWxDLrjUUiY7Bf3bm0KOq54LF3plUQKPQXH2
 UiZiw/2t+Er5yHK/FRYLqLte8R9UpPlS16o7TKM5re2aNbHB9CoPm8TN6qGXsX5i/Uia
 O16A==
X-Gm-Message-State: AOAM530xNaDlCQpwAu1/1gFTfjH2I3pRWITFZwoUEyEvUdpEgNUSFLz8
 C8fcnOtPJcwcuc6jPAaU8eGTyumD/c0Sw+/ObPw=
X-Google-Smtp-Source: ABdhPJwY6RkvN86cdMBQUAzT1q43XIDG+JH+9RVLZt/JoiqRISv8RzAojthayNLFBSoo9Nx2FDbjEybgYRhnZhBtamA=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr18243393ejx.381.1607347138153; 
 Mon, 07 Dec 2020 05:18:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <b9bcba65f98a763669255dd1bc6533bc8310a235.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <b9bcba65f98a763669255dd1bc6533bc8310a235.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Dec 2020 17:18:46 +0400
Message-ID: <CAJ+F1CK+NHESWKSHEdvJ3j95iiAAY9LkrVw7zSrQpWMj8jNEAw@mail.gmail.com>
Subject: Re: [PATCH v12 08/19] multi-process: define MPQemuMsg format and
 transmission functions
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000003352f205b5dfabc7"
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

--0000000000003352f205b5dfabc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Defines MPQemuMsg, which is the message that is sent to the remote
> process. This message is sent over QIOChannel and is used to
> command the remote process to perform various tasks.
> Define transmission functions used by proxy and by remote.
> There are certain restrictions on where its safe to use these
> functions:
>   - From main loop in co-routine context. Will block the main loop if not
> in
>     co-routine context;
>   - From vCPU thread with no co-routine context and if the channel is not
> part
>     of the main loop handling;
>   - From IOThread within co-routine context, outside of co-routine contex=
t
> will
>     block IOThread;
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> ---
>  include/hw/remote/mpqemu-link.h |  60 ++++++++++
>  hw/remote/mpqemu-link.c         | 242
> ++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  hw/remote/meson.build           |   1 +
>  4 files changed, 305 insertions(+)
>  create mode 100644 include/hw/remote/mpqemu-link.h
>  create mode 100644 hw/remote/mpqemu-link.c
>
> diff --git a/include/hw/remote/mpqemu-link.h
> b/include/hw/remote/mpqemu-link.h
> new file mode 100644
> index 0000000..2d79ff8
> --- /dev/null
> +++ b/include/hw/remote/mpqemu-link.h
> @@ -0,0 +1,60 @@
> +/*
> + * Communication channel between QEMU and remote device process
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef MPQEMU_LINK_H
> +#define MPQEMU_LINK_H
> +
> +#include "qom/object.h"
> +#include "qemu/thread.h"
> +#include "io/channel.h"
> +
> +#define REMOTE_MAX_FDS 8
> +
> +#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
> +
> +/**
> + * MPQemuCmd:
> + *
> + * MPQemuCmd enum type to specify the command to be executed on the remo=
te
> + * device.
> + */
> +typedef enum {
> +    MPQEMU_CMD_INIT,
> +    MPQEMU_CMD_MAX,
> +} MPQemuCmd;
> +
> +/**
> + * MPQemuMsg:
> + * @cmd: The remote command
> + * @size: Size of the data to be shared
> + * @data: Structured data
> + * @fds: File descriptors to be shared with remote device
> + *
> + * MPQemuMsg Format of the message sent to the remote device from QEMU.
> + *
> + */
> +typedef struct {
> +    int cmd;
> +    size_t size;
> +
> +    union {
> +        uint64_t u64;
> +    } data;
> +
> +    int fds[REMOTE_MAX_FDS];
> +    int num_fds;
> +} MPQemuMsg;
> +
> +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> +
> +bool mpqemu_msg_valid(MPQemuMsg *msg);
> +
> +#endif
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> new file mode 100644
> index 0000000..e535ed2
> --- /dev/null
> +++ b/hw/remote/mpqemu-link.c
> @@ -0,0 +1,242 @@
> +/*
> + * Communication channel between QEMU and remote device process
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
> +#include "qemu/module.h"
> +#include "hw/remote/mpqemu-link.h"
> +#include "qapi/error.h"
> +#include "qemu/iov.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +/*
> + * Send message over the ioc QIOChannel.
> + * This function is safe to call from:
> + * - From main loop in co-routine context. Will block the main loop if
> not in
> + *   co-routine context;
> + * - From vCPU thread with no co-routine context and if the channel is
> not part
> + *   of the main loop handling;
> + * - From IOThread within co-routine context, outside of co-routine
> context
> + *   will block IOThread;
>

Can drop the extra "From" on each line.

+ */
> +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> +{
> +    bool iolock =3D qemu_mutex_iothread_locked();
> +    bool iothread =3D qemu_get_current_aio_context() =3D=3D
> qemu_get_aio_context() ?
> +                    false : true;
>

I would introduce a qemu_in_iothread() helper (similar to
qemu_in_coroutine() etc)

+    Error *local_err =3D NULL;
> +    struct iovec send[2] =3D {0};
> +    int *fds =3D NULL;
> +    size_t nfds =3D 0;
> +
> +    send[0].iov_base =3D msg;
> +    send[0].iov_len =3D MPQEMU_MSG_HDR_SIZE;
> +
> +    send[1].iov_base =3D (void *)&msg->data;
> +    send[1].iov_len =3D msg->size;
> +
> +    if (msg->num_fds) {
> +        nfds =3D msg->num_fds;
> +        fds =3D msg->fds;
> +    }
> +    /*
> +     * Dont use in IOThread out of co-routine context as
> +     * it will block IOThread.
> +     */
> +    if (iothread) {
> +        assert(qemu_in_coroutine());
> +    }
>

or simply assert(!iothread || qemu_in_coroutine())

+    /*
> +     * Skip unlocking/locking iothread when in IOThread running
> +     * in co-routine context. Co-routine context is asserted above
> +     * for IOThread case.
> +     * Also skip this while in a co-routine in the main context.
> +     */
> +    if (iolock && !iothread && !qemu_in_coroutine()) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +
> +    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds=
,
> nfds,
> +                                      &local_err);
>

That extra (void) is probably unnecessary.


+
> +    if (iolock && !iothread && !qemu_in_coroutine()) {
> +        /* See above comment why skip locking here. */
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    if (errp) {
> +        error_propagate(errp, local_err);
> +    } else if (local_err) {
> +        error_report_err(local_err);
> +    }
>

Not sure this behaviour is recommended. Instead, a trace and an ERRP_GUARD
would be more idiomatic.


> +
> +    return;
>

That's an unnecessary return. Why not return true/false based on error?

+}
> +
> +/*
> + * Read message from the ioc QIOChannel.
> + * This function is safe to call from:
> + * - From main loop in co-routine context. Will block the main loop if
> not in
> + *   co-routine context;
> + * - From vCPU thread with no co-routine context and if the channel is
> not part
> + *   of the main loop handling;
> + * - From IOThread within co-routine context, outside of co-routine
> context
> + *   will block IOThread;
> + */
> +static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int
> **fds,
> +                           size_t *nfds, Error **errp)
>
+{
> +    struct iovec iov =3D { .iov_base =3D buf, .iov_len =3D len };
> +    bool iolock =3D qemu_mutex_iothread_locked();
> +    bool iothread =3D qemu_get_current_aio_context() =3D=3D
> qemu_get_aio_context()
> +                        ? false : true;
> +    struct iovec *iovp =3D &iov;
> +    Error *local_err =3D NULL;
> +    unsigned int niov =3D 1;
> +    size_t *l_nfds =3D nfds;
> +    int **l_fds =3D fds;
> +    ssize_t bytes =3D 0;
> +    size_t size;
> +
> +    size =3D iov.iov_len;
> +
> +    /*
> +     * Dont use in IOThread out of co-routine context as
> +     * it will block IOThread.
> +     */
> +    if (iothread) {
> +        assert(qemu_in_coroutine());
> +    }
>

as above


> +
> +    while (size > 0) {
> +        bytes =3D qio_channel_readv_full(ioc, iovp, niov, l_fds, l_nfds,
> +                                       &local_err);
> +        if (bytes =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> +            /*
> +             * Skip unlocking/locking iothread when in IOThread running
> +             * in co-routine context. Co-routine context is asserted abo=
ve
> +             * for IOThread case.
> +             * Also skip this while in a co-routine in the main context.
> +             */
> +            if (iolock && !iothread && !qemu_in_coroutine()) {
> +                qemu_mutex_unlock_iothread();
>

Why not lock the iothread at the beginning of the function and call a
readv_full_all like we do for writes?

+            }
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_IN);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_IN);
> +            }
> +            /* See above comment why skip locking here. */
> +            if (iolock && !iothread && !qemu_in_coroutine()) {
> +                qemu_mutex_lock_iothread();
> +            }
> +            continue;
>
+        }
> +
> +        if (bytes <=3D 0) {
> +            error_propagate(errp, local_err);
> +            return -EIO;
> +        }
> +
> +        l_fds =3D NULL;
> +        l_nfds =3D NULL;
> +
> +        size -=3D bytes;
> +
> +        (void)iov_discard_front(&iovp, &niov, bytes);
>

needless cast

+    }
> +
> +    return len - size;
> +}
> +
> +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    int *fds =3D NULL;
> +    size_t nfds =3D 0;
> +    ssize_t len;
> +
> +    len =3D mpqemu_read(ioc, (void *)msg, MPQEMU_MSG_HDR_SIZE, &fds, &nf=
ds,
>

This cast is not necessary

+                      &local_err);
> +    if (!local_err) {
> +        if (len =3D=3D -EIO) {
> +            error_setg(&local_err, "Connection closed.");
> +            goto fail;
> +        }
> +        if (len < 0) {
> +            error_setg(&local_err, "Message length is less than 0");
> +            goto fail;
> +        }
> +        if (len !=3D MPQEMU_MSG_HDR_SIZE) {
> +            error_setg(&local_err, "Message header corrupted");
> +            goto fail;
> +        }
> +    } else {
> +        goto fail;
> +    }
> +
> +    if (msg->size > sizeof(msg->data)) {
> +        error_setg(&local_err, "Invalid size for message");
> +        goto fail;
> +    }
> +
> +    if (mpqemu_read(ioc, (void *)&msg->data, msg->size, NULL, NULL,
>

that one too

+                    &local_err) < 0) {
> +        goto fail;
> +    }
> +
> +    msg->num_fds =3D nfds;
> +    if (nfds > G_N_ELEMENTS(msg->fds)) {
> +        error_setg(&local_err,
> +                   "Overflow error: received %zu fds, more than max of %=
d
> fds",
> +                   nfds, REMOTE_MAX_FDS);
> +        goto fail;
> +    } else if (nfds) {
> +        memcpy(msg->fds, fds, nfds * sizeof(int));
> +    }
> +
> +fail:
> +    while (local_err && nfds) {
> +        close(fds[nfds - 1]);
> +        nfds--;
> +    }
> +
> +    g_free(fds);
> +
> +    if (errp) {
> +        error_propagate(errp, local_err);
> +    } else if (local_err) {
> +        error_report_err(local_err);
> +    }
> +}
> +
> +bool mpqemu_msg_valid(MPQemuMsg *msg)
> +{
> +    if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
> +        return false;
> +    }
> +
> +    /* Verify FDs. */
> +    if (msg->num_fds >=3D REMOTE_MAX_FDS) {
> +        return false;
> +    }
> +
> +    if (msg->num_fds > 0) {
> +        for (int i =3D 0; i < msg->num_fds; i++) {
> +            if (fcntl(msg->fds[i], F_GETFL) =3D=3D -1) {
> +                return false;
> +            }
> +        }
> +    }
> +
> +    return true;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c45ac1d..d0c891a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3141,6 +3141,8 @@ F: hw/pci-host/remote.c
>  F: include/hw/pci-host/remote.h
>  F: hw/remote/machine.c
>  F: include/hw/remote/machine.h
> +F: hw/remote/mpqemu-link.c
> +F: include/hw/remote/mpqemu-link.h
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 197b038..a2b2fc0 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -1,5 +1,6 @@
>  remote_ss =3D ss.source_set()
>
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
>
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003352f205b5dfabc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:25 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D"_blank=
">jag.raman@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufi=
mtseva@oracle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Defines MPQemuMsg, which is the message that is sent to the remote<br>
process. This message is sent over QIOChannel and is used to<br>
command the remote process to perform various tasks.<br>
Define transmission functions used by proxy and by remote.<br>
There are certain restrictions on where its safe to use these<br>
functions:<br>
=C2=A0 - From main loop in co-routine context. Will block the main loop if =
not in<br>
=C2=A0 =C2=A0 co-routine context;<br>
=C2=A0 - From vCPU thread with no co-routine context and if the channel is =
not part<br>
=C2=A0 =C2=A0 of the main loop handling;<br>
=C2=A0 - From IOThread within co-routine context, outside of co-routine con=
text will<br>
=C2=A0 =C2=A0 block IOThread;<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/mpqemu-link.h |=C2=A0 60 ++++++++++<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 242 ++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A04 files changed, 305 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/mpqemu-link.h<br>
=C2=A0create mode 100644 hw/remote/mpqemu-link.c<br>
<br>
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-lin=
k.h<br>
new file mode 100644<br>
index 0000000..2d79ff8<br>
--- /dev/null<br>
+++ b/include/hw/remote/mpqemu-link.h<br>
@@ -0,0 +1,60 @@<br>
+/*<br>
+ * Communication channel between QEMU and remote device process<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef MPQEMU_LINK_H<br>
+#define MPQEMU_LINK_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;qemu/thread.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+<br>
+#define REMOTE_MAX_FDS 8<br>
+<br>
+#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)<br>
+<br>
+/**<br>
+ * MPQemuCmd:<br>
+ *<br>
+ * MPQemuCmd enum type to specify the command to be executed on the remote=
<br>
+ * device.<br>
+ */<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 MPQEMU_CMD_INIT,<br>
+=C2=A0 =C2=A0 MPQEMU_CMD_MAX,<br>
+} MPQemuCmd;<br>
+<br>
+/**<br>
+ * MPQemuMsg:<br>
+ * @cmd: The remote command<br>
+ * @size: Size of the data to be shared<br>
+ * @data: Structured data<br>
+ * @fds: File descriptors to be shared with remote device<br>
+ *<br>
+ * MPQemuMsg Format of the message sent to the remote device from QEMU.<br=
>
+ *<br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 int cmd;<br>
+=C2=A0 =C2=A0 size_t size;<br>
+<br>
+=C2=A0 =C2=A0 union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64;<br>
+=C2=A0 =C2=A0 } data;<br>
+<br>
+=C2=A0 =C2=A0 int fds[REMOTE_MAX_FDS];<br>
+=C2=A0 =C2=A0 int num_fds;<br>
+} MPQemuMsg;<br>
+<br>
+void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);<br>
+void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);<br>
+<br>
+bool mpqemu_msg_valid(MPQemuMsg *msg);<br>
+<br>
+#endif<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
new file mode 100644<br>
index 0000000..e535ed2<br>
--- /dev/null<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -0,0 +1,242 @@<br>
+/*<br>
+ * Communication channel between QEMU and remote device process<br>
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
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;hw/remote/mpqemu-link.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/iov.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+<br>
+/*<br>
+ * Send message over the ioc QIOChannel.<br>
+ * This function is safe to call from:<br>
+ * - From main loop in co-routine context. Will block the main loop if not=
 in<br>
+ *=C2=A0 =C2=A0co-routine context;<br>
+ * - From vCPU thread with no co-routine context and if the channel is not=
 part<br>
+ *=C2=A0 =C2=A0of the main loop handling;<br>
+ * - From IOThread within co-routine context, outside of co-routine contex=
t<br>
+ *=C2=A0 =C2=A0will block IOThread;<br></blockquote><div><br></div><div>Ca=
n drop the extra &quot;From&quot; on each line.</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 bool iolock =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool iothread =3D qemu_get_current_aio_context() =3D=3D qemu=
_get_aio_context() ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fals=
e : true;<br></blockquote><div><br></div><div>I would introduce a qemu_in_i=
othread() helper (similar to qemu_in_coroutine() etc)<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 struct iovec send[2] =3D {0};<br>
+=C2=A0 =C2=A0 int *fds =3D NULL;<br>
+=C2=A0 =C2=A0 size_t nfds =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 send[0].iov_base =3D msg;<br>
+=C2=A0 =C2=A0 send[0].iov_len =3D MPQEMU_MSG_HDR_SIZE;<br>
+<br>
+=C2=A0 =C2=A0 send[1].iov_base =3D (void *)&amp;msg-&gt;data;<br>
+=C2=A0 =C2=A0 send[1].iov_len =3D msg-&gt;size;<br>
+<br>
+=C2=A0 =C2=A0 if (msg-&gt;num_fds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds =3D msg-&gt;num_fds;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fds =3D msg-&gt;fds;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Dont use in IOThread out of co-routine context as<br=
>
+=C2=A0 =C2=A0 =C2=A0* it will block IOThread.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (iothread) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(qemu_in_coroutine());<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>or simply assert(!ioth=
read || qemu_in_coroutine())</div><div> <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Skip unlocking/locking iothread when in IOThread run=
ning<br>
+=C2=A0 =C2=A0 =C2=A0* in co-routine context. Co-routine context is asserte=
d above<br>
+=C2=A0 =C2=A0 =C2=A0* for IOThread case.<br>
+=C2=A0 =C2=A0 =C2=A0* Also skip this while in a co-routine in the main con=
text.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(se=
nd), fds, nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;local_err)=
;<br></blockquote><div><br></div><div>That extra (void) is probably unneces=
sary.<br></div><div><br></div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread &amp;&amp; !qemu_in_coroutin=
e()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See above comment why skip locking here. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 } else if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Not sure this behaviou=
r is recommended. Instead, a trace and an ERRP_GUARD would be more idiomati=
c.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+<br>
+=C2=A0 =C2=A0 return;<br></blockquote><div><br></div><div>That&#39;s an un=
necessary return. Why not return true/false based on error?</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+/*<br>
+ * Read message from the ioc QIOChannel.<br>
+ * This function is safe to call from:<br>
+ * - From main loop in co-routine context. Will block the main loop if not=
 in<br>
+ *=C2=A0 =C2=A0co-routine context;<br>
+ * - From vCPU thread with no co-routine context and if the channel is not=
 part<br>
+ *=C2=A0 =C2=A0of the main loop handling;<br>
+ * - From IOThread within co-routine context, outside of co-routine contex=
t<br>
+ *=C2=A0 =C2=A0will block IOThread;<br>
+ */<br>
+static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **f=
ds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size_t *nfds, Error **errp) <br></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 struct iovec iov =3D { .iov_base =3D buf, .iov_len =3D len }=
;<br>
+=C2=A0 =C2=A0 bool iolock =3D qemu_mutex_iothread_locked();<br>
+=C2=A0 =C2=A0 bool iothread =3D qemu_get_current_aio_context() =3D=3D qemu=
_get_aio_context()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ? false : true;<br>
+=C2=A0 =C2=A0 struct iovec *iovp =3D &amp;iov;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 unsigned int niov =3D 1;<br>
+=C2=A0 =C2=A0 size_t *l_nfds =3D nfds;<br>
+=C2=A0 =C2=A0 int **l_fds =3D fds;<br>
+=C2=A0 =C2=A0 ssize_t bytes =3D 0;<br>
+=C2=A0 =C2=A0 size_t size;<br>
+<br>
+=C2=A0 =C2=A0 size =3D iov.iov_len;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Dont use in IOThread out of co-routine context as<br=
>
+=C2=A0 =C2=A0 =C2=A0* it will block IOThread.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (iothread) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(qemu_in_coroutine());<br>
+=C2=A0 =C2=A0 }<br>
</blockquote><div><br></div><div>as above<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">+<br>
+=C2=A0 =C2=A0 while (size &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes =3D qio_channel_readv_full(ioc, iovp, ni=
ov, l_fds, l_nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;loca=
l_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes =3D=3D QIO_CHANNEL_ERR_BLOCK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Skip unlocking/locking i=
othread when in IOThread running<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in co-routine context. C=
o-routine context is asserted above<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for IOThread case.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Also skip this while in =
a co-routine in the main context.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread =
&amp;&amp; !qemu_in_coroutine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_=
iothread();<br></blockquote><div><br></div><div>Why not lock the iothread a=
t the beginning of the function and call a readv_full_all like we do for wr=
ites?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_in_coroutine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_yield(=
ioc, G_IO_IN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_wait(i=
oc, G_IO_IN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See above comment why skip lo=
cking here. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iolock &amp;&amp; !iothread =
&amp;&amp; !qemu_in_coroutine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_io=
thread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue; <br></blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 l_fds =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 l_nfds =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size -=3D bytes;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)iov_discard_front(&amp;iovp, &amp;niov, =
bytes);<br></blockquote><div><br></div><div>needless cast</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return len - size;<br>
+}<br>
+<br>
+void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 int *fds =3D NULL;<br>
+=C2=A0 =C2=A0 size_t nfds =3D 0;<br>
+=C2=A0 =C2=A0 ssize_t len;<br>
+<br>
+=C2=A0 =C2=A0 len =3D mpqemu_read(ioc, (void *)msg, MPQEMU_MSG_HDR_SIZE, &=
amp;fds, &amp;nfds,<br></blockquote><div><br></div><div>This cast is not ne=
cessary<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;local_err);<br>
+=C2=A0 =C2=A0 if (!local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D -EIO) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot=
;Connection closed.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot=
;Message length is less than 0&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len !=3D MPQEMU_MSG_HDR_SIZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot=
;Message header corrupted&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (msg-&gt;size &gt; sizeof(msg-&gt;data)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot;Invalid size =
for message&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (mpqemu_read(ioc, (void *)&amp;msg-&gt;data, msg-&gt;size=
, NULL, NULL,<br></blockquote><div><br></div><div>that one too</div><div> <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;local_err) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msg-&gt;num_fds =3D nfds;<br>
+=C2=A0 =C2=A0 if (nfds &gt; G_N_ELEMENTS(msg-&gt;fds)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Overflow error: received %zu fds, more than max of %d fds&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfds,=
 REMOTE_MAX_FDS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 } else if (nfds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(msg-&gt;fds, fds, nfds * sizeof(int));<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+fail:<br>
+=C2=A0 =C2=A0 while (local_err &amp;&amp; nfds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fds[nfds - 1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds--;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(fds);<br>
+<br>
+=C2=A0 =C2=A0 if (errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 } else if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+bool mpqemu_msg_valid(MPQemuMsg *msg)<br>
+{<br>
+=C2=A0 =C2=A0 if (msg-&gt;cmd &gt;=3D MPQEMU_CMD_MAX &amp;&amp; msg-&gt;cm=
d &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Verify FDs. */<br>
+=C2=A0 =C2=A0 if (msg-&gt;num_fds &gt;=3D REMOTE_MAX_FDS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (msg-&gt;num_fds &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; msg-&gt;num_fds; i++)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fcntl(msg-&gt;fds[i], F_GETF=
L) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index c45ac1d..d0c891a 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3141,6 +3141,8 @@ F: hw/pci-host/remote.c<br>
=C2=A0F: include/hw/pci-host/remote.h<br>
=C2=A0F: hw/remote/machine.c<br>
=C2=A0F: include/hw/remote/machine.h<br>
+F: hw/remote/mpqemu-link.c<br>
+F: include/hw/remote/mpqemu-link.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index 197b038..a2b2fc0 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -1,5 +1,6 @@<br>
=C2=A0remote_ss =3D ss.source_set()<br>
<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;machine.c&#39;))<br>
+remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;mpq=
emu-link.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remo=
te_ss)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000003352f205b5dfabc7--

