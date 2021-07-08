Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898FC3BFA39
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:29:39 +0200 (CEST)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T9u-0001BJ-JH
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1T6a-0005eX-7P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1T6W-0008D9-SS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:11 -0400
Received: by mail-ej1-x635.google.com with SMTP id he13so9261155ejc.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOPzsmni+igZnchMBfXRsnH3K30lk4O7eSzMw+/++VQ=;
 b=talgFxfh6rx9nKmEMRCvSX4uKIB9rVCfu922YGqgKgSSuozfXqCutXc7KBoyE30MrD
 zTGfhHPSXJhQxryFJ9Fr+Q6mJYn8wxPy/XxCn+Pf4VC+M/VMUGx+wgUGC3DsDsyW25Hz
 cHm++Vavu/zh+JLrBWEYhsLU34jHyA5Gqk4Rq8VWUHT9a1MNCW4OmkSTVpxTqwMaLDCK
 XlZyVWdXs2MkFswvMYlESwZo5NoxPsF2j4sMa+hzqsKD/NkJMLVeUNifYn+zxgQtvmjV
 03wCsK/VI7m6CDgWgO4YbavqxbV9Kwn2uwjq8KZijRbGh9BuD0QLYNjB6K6TUaegToRe
 Bo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOPzsmni+igZnchMBfXRsnH3K30lk4O7eSzMw+/++VQ=;
 b=kytxT0o7ypLH/HBi3tJDH978OLrs7Do8jiOkspWgKzvn0Jd6VrycNrefo/eiooEDLw
 x2UdGIxtNT1N3BhJBVofLSkQ9SpL7GzEJWv8CcI1vNjCMWD6spQJnzogpOSjkrxYCoPs
 vjSFPYMEKt9Qbk7U5Z91IRIVEKQYitoOZwhy7T3JnwWSqHViJCyu+2W2iYdu1ok8ISiE
 nyDyI3ejuXftbzsTNTK4CfutZBQ0c+TMOzFCONn2aNV7jjFdOVxZFpk8xUgSf0H9+ID9
 JJKtpyYZJ+FrFqwZ/Y5m12WqC/LRFmUOqWxe3qbFno32DOd9lPaDs20QF7tMopg68wDi
 8DQw==
X-Gm-Message-State: AOAM530IDChDd+1dpjI48uDazXFYZQ30lZ/u7bBzuu1YxbvosAWBhS2Q
 Y6tDg7u/bNPSh8wEVjCjaMPT4NftS/L5VrVWqmk=
X-Google-Smtp-Source: ABdhPJy5ypxyzeboXhXlkbRbtNf8ndmiZDGpbHbMce/lJCHBltLsVHD0cXiS7JM9BLtn5lCtov1JZNlNyWGit5Cd0YA=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr17217105ejw.92.1625747167435; 
 Thu, 08 Jul 2021 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 16:25:55 +0400
Message-ID: <CAJ+F1C+9+V+JzQd7r9YiV=D-hSw0ha=9qs71qJK9ZY2inVs-cA@mail.gmail.com>
Subject: Re: [PATCH V5 02/25] cpr: reboot mode
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000068e1b605c69bc29d"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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

--00000000000068e1b605c69bc29d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:45 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Provide the cprsave and cprload functions for live update.  These save an=
d
> restore VM state, with minimal guest pause time, so that qemu may be
> updated
> to a new version in between.
>
> cprsave stops the VM and saves vmstate to an ordinary file.  It supports
> any
> type of guest image and block device, but the caller must not modify gues=
t
> block devices between cprsave and cprload.
>
> cprsave supports several modes, the first of which is reboot.  In this
> mode,
> the caller invokes cprsave and then terminates qemu.  The caller may then
> update the host kernel and system software and reboot.  The caller resume=
s
> the guest by running qemu with the same arguments as the original process
> and invoking cprload.  To use this mode, guest ram must be mapped to a
> persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.
>
> The reboot mode supports vfio devices if the caller first suspends the
> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
> guest drivers' suspend methods flush outstanding requests and re-initiali=
ze
> the devices, and thus there is no device state to save and restore.
>
> cprload loads state from the file.  If the VM was running at cprsave time=
,
> then VM execution resumes.  If the VM was suspended at cprsave time, then
> the caller must issue a system_wakeup command to resume.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS               |   7 +++
>  include/migration/cpr.h   |  17 ++++++
>  include/sysemu/runstate.h |   1 +
>  migration/cpr.c           | 149
> ++++++++++++++++++++++++++++++++++++++++++++++
>  migration/meson.build     |   1 +
>  migration/savevm.h        |   2 +
>  softmmu/runstate.c        |  21 ++++++-
>  7 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 migration/cpr.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 684142e..c3573aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2858,6 +2858,13 @@ F: net/colo*
>  F: net/filter-rewriter.c
>  F: net/filter-mirror.c
>
> +CPR
> +M: Steve Sistare <steven.sistare@oracle.com>
> +M: Mark Kanda <mark.kanda@oracle.com>
> +S: Maintained
> +F: include/migration/cpr.h
> +F: migration/cpr.c
> +
>  Record/replay
>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>  R: Paolo Bonzini <pbonzini@redhat.com>
> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
> new file mode 100644
> index 0000000..bffee19
> --- /dev/null
> +++ b/include/migration/cpr.h
> @@ -0,0 +1,17 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef MIGRATION_CPR_H
> +#define MIGRATION_CPR_H
> +
> +#include "qapi/qapi-types-cpr.h"
> +
> +void cprsave(const char *file, CprMode mode, Error **errp);
>

I'd rather use "path" or "filename".

+void cprexec(strList *args, Error **errp);
> +void cprload(const char *file, Error **errp);
>

same

It's recommended to return a bool value TRUE for success.
(see include/qapi/error.h)

+
> +#endif
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index a535691..ed4b735 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>  void qemu_system_suspend_request(void);
>  void qemu_register_suspend_notifier(Notifier *notifier);
>  bool qemu_wakeup_suspend_enabled(void);
> +void qemu_system_start_on_wake_request(void);
>

I suggest introducing the function in a preliminary commit.

Also for consistency with the rest of symbols, use "wakeup".

 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>  void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
> diff --git a/migration/cpr.c b/migration/cpr.c
> new file mode 100644
> index 0000000..c5bad8a
> --- /dev/null
> +++ b/migration/cpr.c
> @@ -0,0 +1,149 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "monitor/monitor.h"
> +#include "migration.h"
> +#include "migration/snapshot.h"
> +#include "chardev/char.h"
> +#include "migration/misc.h"
> +#include "migration/cpr.h"
> +#include "migration/global_state.h"
> +#include "qemu-file-channel.h"
> +#include "qemu-file.h"
> +#include "savevm.h"
> +#include "qapi/error.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qemu/error-report.h"
> +#include "io/channel-buffer.h"
> +#include "io/channel-file.h"
> +#include "sysemu/cpu-timers.h"
> +#include "sysemu/runstate.h"
> +#include "sysemu/runstate-action.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/replay.h"
> +#include "sysemu/xen.h"
> +#include "hw/vfio/vfio-common.h"
> +#include "hw/virtio/vhost.h"
> +
> +QEMUFile *qf_file_open(const char *path, int flags, int mode,
> +                              const char *name, Error **errp)
>

None of our functions have qf_ prefix. We are not very consistent with
QEMUFile functions, but I suggest to spell it out qemu_file_open().

Also, it should probably be in migration/qemu-file.c.

+{
>

I'd ERRP_GUARD on every function with an errp argument.

+    QIOChannelFile *fioc;
>

Let's not miss an opportunity to use g_auto
    g_autoptr(QIOChannelFile) fioc =3D NULL;

+    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {
> +        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
> +        return 0;
> +    }
> +
> +    fioc =3D qio_channel_file_new_path(path, flags, mode, errp);
> +    if (!fioc) {
> +        return 0;
> +    }
> +
> +    ioc =3D QIO_CHANNEL(fioc);
> +    qio_channel_set_name(ioc, name);
> +    f =3D (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
>
 +    object_unref(OBJECT(fioc));

With g_auto, can be removed, and value returned directly.

+    return f;
> +}
> +
> +void cprsave(const char *file, CprMode mode, Error **errp)
> +{
> +    int ret;
> +    QEMUFile *f;
> +    int saved_vm_running =3D runstate_is_running();
> +
> +    if (mode =3D=3D CPR_MODE_REBOOT && qemu_ram_volatile(errp)) {
> +        return;
> +    }
> +
> +    if (migrate_colo_enabled()) {
> +        error_setg(errp, "error: cprsave does not support x-colo");
>

Remove error:

+        return;
> +    }
> +
> +    if (replay_mode !=3D REPLAY_MODE_NONE) {
> +        error_setg(errp, "error: cprsave does not support replay");
>

same

+        return;
> +    }
> +
> +    f =3D qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsav=
e",
> errp);
> +    if (!f) {
> +        return;
> +    }
> +
> +    if (global_state_store()) {
> +        error_setg(errp, "Error saving global state");
> +        qemu_fclose(f);
> +        return;
> +    }
>

Could be called before opening cprsave file?

+    if (runstate_check(RUN_STATE_SUSPENDED)) {
> +        /* Update timers_state before saving.  Suspend did not so do. */
> +        cpu_disable_ticks();
> +    }
> +    vm_stop(RUN_STATE_SAVE_VM);
> +
> +    ret =3D qemu_save_device_state(f);
> +    qemu_fclose(f);
> +    if (ret < 0) {
> +        error_setg(errp, "Error %d while saving VM state", ret);
> +        goto err;
>

Needless goto / labels.


> +    }
> +
> +    goto done;
> +
> +err:
> +    if (saved_vm_running) {
> +        vm_start();
> +    }
> +done:
> +    return;
> +}
> +
> +void cprload(const char *file, Error **errp)
> +{
> +    QEMUFile *f;
> +    int ret;
> +    RunState state;
> +
> +    if (runstate_is_running()) {
> +        error_setg(errp, "cprload called for a running VM");
> +        return;
> +    }
> +
> +    f =3D qf_file_open(file, O_RDONLY, 0, "cprload", errp);
> +    if (!f) {
> +        return;
> +    }
> +
> +    if (qemu_get_be32(f) !=3D QEMU_VM_FILE_MAGIC ||
> +        qemu_get_be32(f) !=3D QEMU_VM_FILE_VERSION) {
> +        error_setg(errp, "error: %s is not a vmstate file", file);
>

f is leaked

+        return;
> +    }
> +
> +    ret =3D qemu_load_device_state(f);
> +    qemu_fclose(f);
> +    if (ret < 0) {
> +        error_setg(errp, "Error %d while loading VM state", ret);
> +        return;
> +    }
> +
> +    state =3D global_state_get_runstate();
> +    if (state =3D=3D RUN_STATE_RUNNING) {
> +        vm_start();
> +    } else {
> +        runstate_set(state);
> +        if (runstate_check(RUN_STATE_SUSPENDED)) {
> +            qemu_system_start_on_wake_request();
> +        }
> +    }
> +}
> diff --git a/migration/meson.build b/migration/meson.build
> index f8714dc..fd59281 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -15,6 +15,7 @@ softmmu_ss.add(files(
>    'channel.c',
>    'colo-failover.c',
>    'colo.c',
> +  'cpr.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 6461342..ce5d710 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f,
> MigrationIncomingState *mis);
>  int qemu_load_device_state(QEMUFile *f);
>  int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>          bool in_postcopy, bool inactivate_disks);
> +QEMUFile *qf_file_open(const char *path, int flags, int mode,
> +                       const char *name, Error **errp);
>
>  #endif
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 10d9b73..7fe4967 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -115,6 +115,8 @@ static const RunStateTransition
> runstate_transitions_def[] =3D {
>      { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
>
>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
> @@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
>      }
>  }
>
> +static bool start_on_wake_requested;
>  static ShutdownCause reset_requested;
>  static ShutdownCause shutdown_requested;
>  static int shutdown_signal;
> @@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier
> *notifier)
>      notifier_list_add(&suspend_notifiers, notifier);
>  }
>
> +void qemu_system_start_on_wake_request(void)
> +{
> +    start_on_wake_requested =3D true;
> +}
> +
>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>  {
>      trace_system_wakeup_request(reason);
> @@ -574,7 +582,18 @@ void qemu_system_wakeup_request(WakeupReason reason,
> Error **errp)
>      if (!(wakeup_reason_mask & (1 << reason))) {
>          return;
>      }
> -    runstate_set(RUN_STATE_RUNNING);
> +
> +    /*
> +     * Must call vm_start if it has never been called, to invoke the sta=
te
> +     * change callbacks for the first time.
> +     */
> +    if (start_on_wake_requested) {
> +        start_on_wake_requested =3D false;
> +        vm_start();
> +    } else {
> +        runstate_set(RUN_STATE_RUNNING);
> +    }
> +
>      wakeup_reason =3D reason;
>      qemu_notify_event();
>  }
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000068e1b605c69bc29d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:45 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Provide the cprsave and cprload functions for live update.=C2=A0=
 These save and<br>
restore VM state, with minimal guest pause time, so that qemu may be update=
d<br>
to a new version in between.<br>
<br>
cprsave stops the VM and saves vmstate to an ordinary file.=C2=A0 It suppor=
ts any<br>
type of guest image and block device, but the caller must not modify guest<=
br>
block devices between cprsave and cprload.<br>
<br>
cprsave supports several modes, the first of which is reboot.=C2=A0 In this=
 mode,<br>
the caller invokes cprsave and then terminates qemu.=C2=A0 The caller may t=
hen<br>
update the host kernel and system software and reboot.=C2=A0 The caller res=
umes<br>
the guest by running qemu with the same arguments as the original process<b=
r>
and invoking cprload.=C2=A0 To use this mode, guest ram must be mapped to a=
<br>
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.<br>
<br>
The reboot mode supports vfio devices if the caller first suspends the<br>
guest, such as by issuing guest-suspend-ram to the qemu guest agent.=C2=A0 =
The<br>
guest drivers&#39; suspend methods flush outstanding requests and re-initia=
lize<br>
the devices, and thus there is no device state to save and restore.<br>
<br>
cprload loads state from the file.=C2=A0 If the VM was running at cprsave t=
ime,<br>
then VM execution resumes.=C2=A0 If the VM was suspended at cprsave time, t=
hen<br>
the caller must issue a system_wakeup command to resume.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +++<br>
=C2=A0include/migration/cpr.h=C2=A0 =C2=A0|=C2=A0 17 ++++++<br>
=C2=A0include/sysemu/runstate.h |=C2=A0 =C2=A01 +<br>
=C2=A0migration/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 149 +++++++=
+++++++++++++++++++++++++++++++++++++++<br>
=C2=A0migration/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0migration/savevm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 ++++++-<br>
=C2=A07 files changed, 197 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 include/migration/cpr.h<br>
=C2=A0create mode 100644 migration/cpr.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 684142e..c3573aa 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2858,6 +2858,13 @@ F: net/colo*<br>
=C2=A0F: net/filter-rewriter.c<br>
=C2=A0F: net/filter-mirror.c<br>
<br>
+CPR<br>
+M: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com" target=
=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
+M: Mark Kanda &lt;<a href=3D"mailto:mark.kanda@oracle.com" target=3D"_blan=
k">mark.kanda@oracle.com</a>&gt;<br>
+S: Maintained<br>
+F: include/migration/cpr.h<br>
+F: migration/cpr.c<br>
+<br>
=C2=A0Record/replay<br>
=C2=A0M: Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgaluk@ispras.ru" ta=
rget=3D"_blank">pavel.dovgaluk@ispras.ru</a>&gt;<br>
=C2=A0R: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h<br>
new file mode 100644<br>
index 0000000..bffee19<br>
--- /dev/null<br>
+++ b/include/migration/cpr.h<br>
@@ -0,0 +1,17 @@<br>
+/*<br>
+ * Copyright (c) 2021 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef MIGRATION_CPR_H<br>
+#define MIGRATION_CPR_H<br>
+<br>
+#include &quot;qapi/qapi-types-cpr.h&quot;<br>
+<br>
+void cprsave(const char *file, CprMode mode, Error **errp);<br></blockquot=
e><div><br></div><div>I&#39;d rather use &quot;path&quot; or &quot;filename=
&quot;.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+void cprexec(strList *args, Error **errp);<br>
+void cprload(const char *file, Error **errp);<br></blockquote><div><br></d=
iv><div>same</div><div><br></div><div>It&#39;s recommended to return a bool=
 value TRUE for success.</div><div>(see include/qapi/error.h)</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+#endif<br>
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h<br>
index a535691..ed4b735 100644<br>
--- a/include/sysemu/runstate.h<br>
+++ b/include/sysemu/runstate.h<br>
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);<br>
=C2=A0void qemu_system_suspend_request(void);<br>
=C2=A0void qemu_register_suspend_notifier(Notifier *notifier);<br>
=C2=A0bool qemu_wakeup_suspend_enabled(void);<br>
+void qemu_system_start_on_wake_request(void);<br></blockquote><div><br></d=
iv><div>I suggest introducing the function in a preliminary commit.</div><d=
iv><br></div><div> Also for consistency with the rest of symbols, use &quot=
;wakeup&quot;.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0void qemu_system_wakeup_request(WakeupReason reason, Error **errp);<b=
r>
=C2=A0void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);<br=
>
=C2=A0void qemu_register_wakeup_notifier(Notifier *notifier);<br>
diff --git a/migration/cpr.c b/migration/cpr.c<br>
new file mode 100644<br>
index 0000000..c5bad8a<br>
--- /dev/null<br>
+++ b/migration/cpr.c<br>
@@ -0,0 +1,149 @@<br>
+/*<br>
+ * Copyright (c) 2021 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;monitor/monitor.h&quot;<br>
+#include &quot;migration.h&quot;<br>
+#include &quot;migration/snapshot.h&quot;<br>
+#include &quot;chardev/char.h&quot;<br>
+#include &quot;migration/misc.h&quot;<br>
+#include &quot;migration/cpr.h&quot;<br>
+#include &quot;migration/global_state.h&quot;<br>
+#include &quot;qemu-file-channel.h&quot;<br>
+#include &quot;qemu-file.h&quot;<br>
+#include &quot;savevm.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/qmp/qerror.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;io/channel-buffer.h&quot;<br>
+#include &quot;io/channel-file.h&quot;<br>
+#include &quot;sysemu/cpu-timers.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
+#include &quot;sysemu/runstate-action.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;sysemu/replay.h&quot;<br>
+#include &quot;sysemu/xen.h&quot;<br>
+#include &quot;hw/vfio/vfio-common.h&quot;<br>
+#include &quot;hw/virtio/vhost.h&quot;<br>
+<br>
+QEMUFile *qf_file_open(const char *path, int flags, int mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name, Error **errp)<br></blockq=
uote><div><br></div><div>None of our functions have qf_ prefix. We are not =
very consistent with QEMUFile functions, but I suggest to spell it out qemu=
_file_open().</div><div><br></div><div>Also, it should probably be in migra=
tion/qemu-file.c.</div><div> <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+{<br></blockquote><div><br></div><div>I&#39;d ERRP_GUARD on every function=
 with an errp argument.</div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 QIOChannelFile *fioc;<br></blockquote><div><br></div><div>Le=
t&#39;s not miss an opportunity to use g_auto</div><div>=C2=A0 =C2=A0 g_aut=
optr(QIOChannelFile) fioc =3D NULL;</div><div><br> </div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+=C2=A0 =C2=A0 QEMUFile *f;<br>
+<br>
+=C2=A0 =C2=A0 if (flags &amp; O_RDWR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;qf_file_open %s: O_RDWR=
 not supported&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fioc =3D qio_channel_file_new_path(path, flags, mode, errp);=
<br>
+=C2=A0 =C2=A0 if (!fioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ioc =3D QIO_CHANNEL(fioc);<br>
+=C2=A0 =C2=A0 qio_channel_set_name(ioc, name);<br>
+=C2=A0 =C2=A0 f =3D (flags &amp; O_WRONLY) ? qemu_fopen_channel_output(ioc=
) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fopen_channel_input(ioc);<br>
</blockquote><div>=C2=A0+=C2=A0 =C2=A0 object_unref(OBJECT(fioc));<br>
</div><div>=C2=A0</div><div>With g_auto, can be removed, and value returned=
 directly.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+=C2=A0 =C2=A0 return f;<br>
+}<br>
+<br>
+void cprsave(const char *file, CprMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 QEMUFile *f;<br>
+=C2=A0 =C2=A0 int saved_vm_running =3D runstate_is_running();<br>
+<br>
+=C2=A0 =C2=A0 if (mode =3D=3D CPR_MODE_REBOOT &amp;&amp; qemu_ram_volatile=
(errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (migrate_colo_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error: cprsave does not=
 support x-colo&quot;);<br></blockquote><div><br></div><div>Remove error:</=
div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (replay_mode !=3D REPLAY_MODE_NONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error: cprsave does not=
 support replay&quot;);<br></blockquote><div><br></div><div>same</div><div>=
 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 f =3D qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600,=
 &quot;cprsave&quot;, errp);<br>
+=C2=A0 =C2=A0 if (!f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (global_state_store()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Error saving global sta=
te&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fclose(f);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Could be called before=
 opening cprsave file?</div><div> <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_SUSPENDED)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update timers_state before saving.=C2=A0 Su=
spend did not so do. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_disable_ticks();<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 vm_stop(RUN_STATE_SAVE_VM);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qemu_save_device_state(f);<br>
+=C2=A0 =C2=A0 qemu_fclose(f);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Error %d while saving V=
M state&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
</blockquote><div><br></div><div>Needless goto / labels.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 }=
<br>
+<br>
+=C2=A0 =C2=A0 goto done;<br>
+<br>
+err:<br>
+=C2=A0 =C2=A0 if (saved_vm_running) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_start();<br>
+=C2=A0 =C2=A0 }<br>
+done:<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
+<br>
+void cprload(const char *file, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 QEMUFile *f;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 RunState state;<br>
+<br>
+=C2=A0 =C2=A0 if (runstate_is_running()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cprload called for a ru=
nning VM&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 f =3D qf_file_open(file, O_RDONLY, 0, &quot;cprload&quot;, e=
rrp);<br>
+=C2=A0 =C2=A0 if (!f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (qemu_get_be32(f) !=3D QEMU_VM_FILE_MAGIC ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32(f) !=3D QEMU_VM_FILE_VERSION) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error: %s is not a vmst=
ate file&quot;, file);<br></blockquote><div><br></div><div>f is leaked</div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qemu_load_device_state(f);<br>
+=C2=A0 =C2=A0 qemu_fclose(f);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Error %d while loading =
VM state&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 state =3D global_state_get_runstate();<br>
+=C2=A0 =C2=A0 if (state =3D=3D RUN_STATE_RUNNING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_start();<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runstate_set(state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (runstate_check(RUN_STATE_SUSPENDED)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_start_on_wake_reques=
t();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
diff --git a/migration/meson.build b/migration/meson.build<br>
index f8714dc..fd59281 100644<br>
--- a/migration/meson.build<br>
+++ b/migration/meson.build<br>
@@ -15,6 +15,7 @@ softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;channel.c&#39;,<br>
=C2=A0 =C2=A0&#39;colo-failover.c&#39;,<br>
=C2=A0 =C2=A0&#39;colo.c&#39;,<br>
+=C2=A0 &#39;cpr.c&#39;,<br>
=C2=A0 =C2=A0&#39;exec.c&#39;,<br>
=C2=A0 =C2=A0&#39;fd.c&#39;,<br>
=C2=A0 =C2=A0&#39;global_state.c&#39;,<br>
diff --git a/migration/savevm.h b/migration/savevm.h<br>
index 6461342..ce5d710 100644<br>
--- a/migration/savevm.h<br>
+++ b/migration/savevm.h<br>
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncoming=
State *mis);<br>
=C2=A0int qemu_load_device_state(QEMUFile *f);<br>
=C2=A0int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool in_postcopy, bool inactivate_disks);=
<br>
+QEMUFile *qf_file_open(const char *path, int flags, int mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *name, Error **errp);<br>
<br>
=C2=A0#endif<br>
diff --git a/softmmu/runstate.c b/softmmu/runstate.c<br>
index 10d9b73..7fe4967 100644<br>
--- a/softmmu/runstate.c<br>
+++ b/softmmu/runstate.c<br>
@@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_de=
f[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },<br>
+=C2=A0 =C2=A0 { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },<br>
+=C2=A0 =C2=A0 { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },<br>
<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },<br>
@@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static bool start_on_wake_requested;<br>
=C2=A0static ShutdownCause reset_requested;<br>
=C2=A0static ShutdownCause shutdown_requested;<br>
=C2=A0static int shutdown_signal;<br>
@@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier=
)<br>
=C2=A0 =C2=A0 =C2=A0notifier_list_add(&amp;suspend_notifiers, notifier);<br=
>
=C2=A0}<br>
<br>
+void qemu_system_start_on_wake_request(void)<br>
+{<br>
+=C2=A0 =C2=A0 start_on_wake_requested =3D true;<br>
+}<br>
+<br>
=C2=A0void qemu_system_wakeup_request(WakeupReason reason, Error **errp)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0trace_system_wakeup_request(reason);<br>
@@ -574,7 +582,18 @@ void qemu_system_wakeup_request(WakeupReason reason, E=
rror **errp)<br>
=C2=A0 =C2=A0 =C2=A0if (!(wakeup_reason_mask &amp; (1 &lt;&lt; reason))) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 runstate_set(RUN_STATE_RUNNING);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Must call vm_start if it has never been called, to i=
nvoke the state<br>
+=C2=A0 =C2=A0 =C2=A0* change callbacks for the first time.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (start_on_wake_requested) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_on_wake_requested =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_start();<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runstate_set(RUN_STATE_RUNNING);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0wakeup_reason =3D reason;<br>
=C2=A0 =C2=A0 =C2=A0qemu_notify_event();<br>
=C2=A0}<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000068e1b605c69bc29d--

