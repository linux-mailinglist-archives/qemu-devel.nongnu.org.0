Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB73BE802
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:33:38 +0200 (CEST)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16kD-0007gK-C7
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m16iX-0006AF-PV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:31:53 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m16iU-00050L-T1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:31:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v1so3161655edt.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EhR0IdegbDIGhtgrI4sFOp2imJUhuvDf1mdm5RF+h+M=;
 b=DONDYtYRtXl6Sv4bUP0dYhIbCrLrWzZGJCJsZ2joOUCB5SyYwmc3EnH+9i86Q/0Rqj
 5N0ZB7hlhjEDTQrbZ1GrxmSUmGvMaNxXc47Xv/d24Po7PPULzfvEMQ0bJH4NkVR1y+kL
 QQaAFTcRhP9hNlypoq6vGvJ3Fhb/b5SoGdcKe5BZJoVvc5u9DUund3nq6ddsSGyRaCn9
 2jiO4APX/wiADfYxLAivDx3EePtRe6ApkqnXSTmWV6Po4aqypfawLCX0TnTi5e/V4n6+
 A2iUk4B8goTr6GNvGvmUGS3DiQpyIA3+C5MmFg2jjAlr2P7iLP3IQNddeABOK/dnxksd
 XHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhR0IdegbDIGhtgrI4sFOp2imJUhuvDf1mdm5RF+h+M=;
 b=puKnXtYxQzrOZRXnferKTtI04c8k0lmltCCQdibpbNEr1e/L/exKxx8r7z5AL7Yydh
 cbp/3fDwTATwxVKniNWwEGtbI+I6Stn/EHBxRUMSY8USAUPQM2YFwrw8wXwfhJyX8Zik
 EasH5MjxsdrU6R/WAOlJJoB114zp4BuT/VVAd0OtAvy3rsoCczPgdIbOFJ4QoRSN5Jcz
 lm0P2SsDxB3aUstk4K7PMS3nSaSE863vL3m+oY1FltfA8N+k6ogs2z/rj7B4s4M1Lr4J
 x//tlK4ZddkvycaiwSTqjOz7Ypwq2atVJUoaHfIydglX4UscLTBInGSsueF3axu/bx/h
 waBw==
X-Gm-Message-State: AOAM533Av1oevFBIVV3J4UJ9i/rYIAPHLTDWa4pTToTOvE+AvmhpiXSx
 1suaqyg5ZzTzolHm5JIPqeqQ5z+i6cGt0VQbVVo=
X-Google-Smtp-Source: ABdhPJxUtYFFZBIb1cC/cbxJOzATZRBe4bEKxBogMUcSXPg5OZbkivhNIFSsI+D/W8tLG82wVSUnR7ge0O1/f2vvxi8=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr29468870edb.164.1625661108972; 
 Wed, 07 Jul 2021 05:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 7 Jul 2021 16:31:37 +0400
Message-ID: <CAJ+F1C+SvHq3w78vevxMDUi6SFD_E_HnOEqapJFVBQAZp=ZxrQ@mail.gmail.com>
Subject: Re: [PATCH V4 00/25] Live Update
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000ecef8305c687b88f"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
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

--000000000000ecef8305c687b88f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve

On Tue, Jul 6, 2021 at 8:58 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Provide the cprsave, cprexec, and cprload commands for live update.  Thes=
e
> save and restore VM state, with minimal guest pause time, so that qemu ma=
y
> be updated to a new version in between.
>
> cprsave stops the VM and saves vmstate to an ordinary file.  It supports
> any
> type of guest image and block device, but the caller must not modify gues=
t
> block devices between cprsave and cprload.  It supports two modes: reboot
> and restart.
>
> In reboot mode, the caller invokes cprsave and then terminates qemu.
> The caller may then update the host kernel and system software and reboot=
.
> The caller resumes the guest by running qemu with the same arguments as t=
he
> original process and invoking cprload.  To use this mode, guest ram must =
be
> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/sh=
m
> PKRAM as proposed in
> https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yzn=
aga@oracle.com
> .
>
> The reboot mode supports vfio devices if the caller first suspends the
> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
> guest drivers' suspend methods flush outstanding requests and re-initiali=
ze
> the devices, and thus there is no device state to save and restore.
>
> Restart mode preserves the guest VM across a restart of the qemu process.
> After cprsave, the caller passes qemu command-line arguments to cprexec,
> which directly exec's the new qemu binary.  The arguments must include -S
> so new qemu starts in a paused state and waits for the cprload command.
> The restart mode supports vfio devices by preserving the vfio container,
> group, device, and event descriptors across the qemu re-exec, and by
> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR an=
d
> VFIO_DMA_MAP_FLAG_VADDR as defined in
> https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sista=
re@oracle.com/
> and integrated in Linux kernel 5.12.
>
> To use the restart mode, qemu must be started with the memfd-alloc option=
,
> which allocates guest ram using memfd_create.  The memfd's are saved to
> the environment and kept open across exec, after which they are found fro=
m
> the environment and re-mmap'd.  Hence guest ram is preserved in place,
> albeit with new virtual addresses in the qemu process.
>
> The caller resumes the guest by invoking cprload, which loads state from
> the file.  If the VM was running at cprsave time, then VM execution
> resumes.
> If the VM was suspended at cprsave time (reboot mode), then the caller mu=
st
> issue a system_wakeup command to resume.
>
> The first patches add reboot mode:
>   - qemu_ram_volatile
>   - cpr: reboot mode
>   - cpr: QMP interfaces for reboot
>   - cpr: HMP interfaces for reboot
>
> The next patches add restart mode:
>   - as_flat_walk
>   - oslib: qemu_clr_cloexec
>   - machine: memfd-alloc option
>   - vl: add helper to request re-exec
>   - string to strList
>   - util: env var helpers
>   - cpr: restart mode
>   - cpr: QMP interfaces for restart
>   - cpr: HMP interfaces for restart
>
> The next patches add vfio support for restart mode:
>   - pci: export functions for cpr
>   - vfio-pci: refactor for cpr
>   - vfio-pci: cpr part 1
>   - vfio-pci: cpr part 2
>
> The next patches preserve various descriptor-based backend devices across
> cprexec:
>   - vhost: reset vhost devices upon cprsave
>   - hostmem-memfd: cpr support
>   - chardev: cpr framework
>   - chardev: cpr for simple devices
>   - chardev: cpr for pty
>   - chardev: cpr for sockets
>   - cpr: only-cpr-capable option
>   - simplify savevm
>
> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
> restart mode.  The software update is performed while the guest is
> running to minimize downtime.
>
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...                        |
> QEMU 4.2.0 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update qemu
> (qemu) cprsave /tmp/qemu.sav restart            |
> (qemu) cprexec qemu-system-x86_64 -S ...        |
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cprload /tmp/qemu.sav                    |
> (qemu) info status                              |
> VM status: running                              |
>
>
> Here is an example of updating the host kernel using reboot mode.
>
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...mem-path=3D/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update kernel-uek
> (qemu) cprsave /tmp/qemu.sav restart            |
> (qemu) quit                                     |
>                                                 |
> # systemctl kexec                               |
> kexec_core: Starting new kernel                 |
> ...                                             |
>                                                 |
> # qemu-system-x86_64 -S mem-path=3D/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cprload /tmp/qemu.sav                    |
> (qemu) info status                              |
> VM status: running                              |
>
> Changes from V1 to V2:
>   - revert vmstate infrastructure changes
>   - refactor cpr functions into new files
>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>     preserve memory.
>   - add framework to filter chardev's that support cpr
>   - save and restore vfio eventfd's
>   - modify cprinfo QMP interface
>   - incorporate misc review feedback
>   - remove unrelated and unneeded patches
>   - refactor all patches into a shorter and easier to review series
>
> Changes from V2 to V3:
>   - rebase to qemu 6.0.0
>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>   - change memfd-alloc to a machine option
>   - Use qio_channel_socket_new_fd instead of adding
> qio_channel_socket_new_fd
>   - close monitor socket during cpr
>   - fix a few unreported bugs
>   - support memory-backend-memfd
>
> Changes from V3 to V4:
>   - split reboot mode into separate patches
>   - add cprexec command
>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>   - add more checks for vfio and cpr compatibility, and recover after
> errors
>   - save vfio pci config in vmstate
>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>   - use qemu_strtol
>   - change 6.0 references to 6.1
>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>   - distribute MAINTAINERS additions to each patch
>
> Steve Sistare (21):
>   qemu_ram_volatile
>   cpr: reboot mode
>   as_flat_walk
>   oslib: qemu_clr_cloexec
>   machine: memfd-alloc option
>   vl: add helper to request re-exec
>   string to strList
>   util: env var helpers
>   cpr: restart mode
>   cpr: QMP interfaces for restart
>   cpr: HMP interfaces for restart
>   pci: export functions for cpr
>   vfio-pci: refactor for cpr
>   vfio-pci: cpr part 1
>   vfio-pci: cpr part 2
>   hostmem-memfd: cpr support
>   chardev: cpr framework
>   chardev: cpr for simple devices
>   chardev: cpr for pty
>   cpr: only-cpr-capable option
>   simplify savevm
>
> Mark Kanda, Steve Sistare (4):
>   cpr: QMP interfaces for reboot
>   cpr: HMP interfaces for reboot
>   vhost: reset vhost devices upon cprsave
>   chardev: cpr for sockets
>
>  MAINTAINERS                   |  12 +++
>  backends/hostmem-memfd.c      |  21 ++--
>  chardev/char-mux.c            |   1 +
>  chardev/char-null.c           |   1 +
>  chardev/char-pty.c            |  15 ++-
>  chardev/char-serial.c         |   1 +
>  chardev/char-socket.c         |  35 +++++++
>  chardev/char-stdio.c          |   8 ++
>  chardev/char.c                |  41 +++++++-
>  gdbstub.c                     |   1 +
>  hmp-commands.hx               |  62 ++++++++++++
>  hw/core/machine.c             |  19 ++++
>  hw/pci/msix.c                 |  20 ++--
>  hw/pci/pci.c                  |   7 +-
>  hw/vfio/common.c              |  78 ++++++++++++--
>  hw/vfio/cpr.c                 | 154 ++++++++++++++++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 | 230
> +++++++++++++++++++++++++++++++++++++++---
>  hw/vfio/trace-events          |   1 +
>  hw/virtio/vhost.c             |  11 ++
>  include/chardev/char.h        |   6 ++
>  include/exec/memory.h         |  25 +++++
>  include/hw/boards.h           |   1 +
>  include/hw/pci/msix.h         |   5 +
>  include/hw/pci/pci.h          |   2 +
>  include/hw/vfio/vfio-common.h |   8 ++
>  include/hw/virtio/vhost.h     |   1 +
>  include/migration/cpr.h       |  20 ++++
>  include/monitor/hmp.h         |   4 +
>  include/qemu/env.h            |  23 +++++
>  include/qemu/osdep.h          |   1 +
>  include/sysemu/runstate.h     |   2 +
>  include/sysemu/sysemu.h       |   1 +
>  linux-headers/linux/vfio.h    |  27 +++++
>  migration/cpr.c               | 195 +++++++++++++++++++++++++++++++++++
>  migration/meson.build         |   1 +
>  migration/migration.c         |   5 +
>  migration/savevm.c            |  21 ++--
>  migration/savevm.h            |   2 +
>  monitor/hmp-cmds.c            |  75 ++++++++++++--
>  monitor/hmp.c                 |   3 +
>  monitor/qmp-cmds.c            |  36 +++++++
>  monitor/qmp.c                 |   3 +
>  qapi/char.json                |   5 +-
>  qapi/cpr.json                 |  88 ++++++++++++++++
>  qapi/meson.build              |   1 +
>  qapi/qapi-schema.json         |   1 +
>  qemu-options.hx               |  39 ++++++-
>  softmmu/globals.c             |   1 +
>  softmmu/memory.c              |  48 +++++++++
>  softmmu/physmem.c             |  49 +++++++--
>  softmmu/runstate.c            |  58 ++++++++++-
>  softmmu/vl.c                  |  14 ++-
>  stubs/cpr.c                   |   3 +
>  stubs/meson.build             |   1 +
>  trace-events                  |   1 +
>  util/env.c                    |  95 +++++++++++++++++
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |   9 ++
>  util/oslib-win32.c            |   4 +
>  util/qemu-config.c            |   4 +
>  61 files changed, 1525 insertions(+), 83 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 include/qemu/env.h
>  create mode 100644 migration/cpr.c
>  create mode 100644 qapi/cpr.json
>  create mode 100644 stubs/cpr.c
>  create mode 100644 util/env.c
>
> --
> 1.8.3.1
>
>
>
It doesn't apply on master, could you rebase and resend?
thanks


--=20
Marc-Andr=C3=A9 Lureau

--000000000000ecef8305c687b88f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Steve<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 6, 2021 at 8:58 P=
M Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sis=
tare@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Provide the cprsave, cprexec, and cprload commands for live =
update.=C2=A0 These<br>
save and restore VM state, with minimal guest pause time, so that qemu may<=
br>
be updated to a new version in between.<br>
<br>
cprsave stops the VM and saves vmstate to an ordinary file.=C2=A0 It suppor=
ts any<br>
type of guest image and block device, but the caller must not modify guest<=
br>
block devices between cprsave and cprload.=C2=A0 It supports two modes: reb=
oot<br>
and restart.<br>
<br>
In reboot mode, the caller invokes cprsave and then terminates qemu.<br>
The caller may then update the host kernel and system software and reboot.<=
br>
The caller resumes the guest by running qemu with the same arguments as the=
<br>
original process and invoking cprload.=C2=A0 To use this mode, guest ram mu=
st be<br>
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm<=
br>
PKRAM as proposed in <a href=3D"https://lore.kernel.org/lkml/1617140178-877=
3-1-git-send-email-anthony.yznaga@oracle.com" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-antho=
ny.yznaga@oracle.com</a>.<br>
<br>
The reboot mode supports vfio devices if the caller first suspends the<br>
guest, such as by issuing guest-suspend-ram to the qemu guest agent.=C2=A0 =
The<br>
guest drivers&#39; suspend methods flush outstanding requests and re-initia=
lize<br>
the devices, and thus there is no device state to save and restore.<br>
<br>
Restart mode preserves the guest VM across a restart of the qemu process.<b=
r>
After cprsave, the caller passes qemu command-line arguments to cprexec,<br=
>
which directly exec&#39;s the new qemu binary.=C2=A0 The arguments must inc=
lude -S<br>
so new qemu starts in a paused state and waits for the cprload command.<br>
The restart mode supports vfio devices by preserving the vfio container,<br=
>
group, device, and event descriptors across the qemu re-exec, and by<br>
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and<=
br>
VFIO_DMA_MAP_FLAG_VADDR as defined in <a href=3D"https://lore.kernel.org/kv=
m/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/" rel=3D"noref=
errer" target=3D"_blank">https://lore.kernel.org/kvm/1611939252-7240-1-git-=
send-email-steven.sistare@oracle.com/</a><br>
and integrated in Linux kernel 5.12.<br>
<br>
To use the restart mode, qemu must be started with the memfd-alloc option,<=
br>
which allocates guest ram using memfd_create.=C2=A0 The memfd&#39;s are sav=
ed to<br>
the environment and kept open across exec, after which they are found from<=
br>
the environment and re-mmap&#39;d.=C2=A0 Hence guest ram is preserved in pl=
ace,<br>
albeit with new virtual addresses in the qemu process.<br>
<br>
The caller resumes the guest by invoking cprload, which loads state from<br=
>
the file.=C2=A0 If the VM was running at cprsave time, then VM execution re=
sumes.<br>
If the VM was suspended at cprsave time (reboot mode), then the caller must=
<br>
issue a system_wakeup command to resume.<br>
<br>
The first patches add reboot mode:<br>
=C2=A0 - qemu_ram_volatile<br>
=C2=A0 - cpr: reboot mode<br>
=C2=A0 - cpr: QMP interfaces for reboot<br>
=C2=A0 - cpr: HMP interfaces for reboot<br>
<br>
The next patches add restart mode:<br>
=C2=A0 - as_flat_walk<br>
=C2=A0 - oslib: qemu_clr_cloexec<br>
=C2=A0 - machine: memfd-alloc option<br>
=C2=A0 - vl: add helper to request re-exec<br>
=C2=A0 - string to strList<br>
=C2=A0 - util: env var helpers<br>
=C2=A0 - cpr: restart mode<br>
=C2=A0 - cpr: QMP interfaces for restart<br>
=C2=A0 - cpr: HMP interfaces for restart<br>
<br>
The next patches add vfio support for restart mode:<br>
=C2=A0 - pci: export functions for cpr<br>
=C2=A0 - vfio-pci: refactor for cpr<br>
=C2=A0 - vfio-pci: cpr part 1<br>
=C2=A0 - vfio-pci: cpr part 2<br>
<br>
The next patches preserve various descriptor-based backend devices across<b=
r>
cprexec:<br>
=C2=A0 - vhost: reset vhost devices upon cprsave<br>
=C2=A0 - hostmem-memfd: cpr support<br>
=C2=A0 - chardev: cpr framework<br>
=C2=A0 - chardev: cpr for simple devices<br>
=C2=A0 - chardev: cpr for pty<br>
=C2=A0 - chardev: cpr for sockets<br>
=C2=A0 - cpr: only-cpr-capable option<br>
=C2=A0 - simplify savevm<br>
<br>
Here is an example of updating qemu from v4.2.0 to v4.2.1 using<br>
restart mode.=C2=A0 The software update is performed while the guest is<br>
running to minimize downtime.<br>
<br>
window 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 window 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>
# qemu-system-x86_64 ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
QEMU 4.2.0 monitor - type &#39;help&#39; ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: running=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | # yum update qemu<br>
(qemu) cprsave /tmp/qemu.sav restart=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
(qemu) cprexec qemu-system-x86_64 -S ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
QEMU 4.2.1 monitor - type &#39;help&#39; ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: paused (prelaunch)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
(qemu) cprload /tmp/qemu.sav=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: running=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
<br>
<br>
Here is an example of updating the host kernel using reboot mode.<br>
<br>
window 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 window 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>
# qemu-system-x86_64 ...mem-path=3D/dev/dax0.0 ...|<br>
QEMU 4.2.1 monitor - type &#39;help&#39; ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: running=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | # yum update kernel-uek<br>
(qemu) cprsave /tmp/qemu.sav restart=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
(qemu) quit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>
# systemctl kexec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
kexec_core: Starting new kernel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|<br>
...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>
# qemu-system-x86_64 -S mem-path=3D/dev/dax0.0 ...|<br>
QEMU 4.2.1 monitor - type &#39;help&#39; ...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: paused (prelaunch)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
(qemu) cprload /tmp/qemu.sav=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
(qemu) info status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
VM status: running=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
<br>
Changes from V1 to V2:<br>
=C2=A0 - revert vmstate infrastructure changes<br>
=C2=A0 - refactor cpr functions into new files<br>
=C2=A0 - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to<=
br>
=C2=A0 =C2=A0 preserve memory.<br>
=C2=A0 - add framework to filter chardev&#39;s that support cpr<br>
=C2=A0 - save and restore vfio eventfd&#39;s<br>
=C2=A0 - modify cprinfo QMP interface<br>
=C2=A0 - incorporate misc review feedback<br>
=C2=A0 - remove unrelated and unneeded patches<br>
=C2=A0 - refactor all patches into a shorter and easier to review series<br=
>
<br>
Changes from V2 to V3:<br>
=C2=A0 - rebase to qemu 6.0.0<br>
=C2=A0 - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc=
)<br>
=C2=A0 - change memfd-alloc to a machine option<br>
=C2=A0 - Use qio_channel_socket_new_fd instead of adding qio_channel_socket=
_new_fd<br>
=C2=A0 - close monitor socket during cpr<br>
=C2=A0 - fix a few unreported bugs<br>
=C2=A0 - support memory-backend-memfd<br>
<br>
Changes from V3 to V4:<br>
=C2=A0 - split reboot mode into separate patches<br>
=C2=A0 - add cprexec command<br>
=C2=A0 - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec<br>
=C2=A0 - add more checks for vfio and cpr compatibility, and recover after =
errors<br>
=C2=A0 - save vfio pci config in vmstate<br>
=C2=A0 - rename {setenv,getenv}_event_fd to {save,load}_event_fd<br>
=C2=A0 - use qemu_strtol<br>
=C2=A0 - change 6.0 references to 6.1<br>
=C2=A0 - use strerror(), use EXIT_FAILURE, remove period from error message=
s<br>
=C2=A0 - distribute MAINTAINERS additions to each patch<br>
<br>
Steve Sistare (21):<br>
=C2=A0 qemu_ram_volatile<br>
=C2=A0 cpr: reboot mode<br>
=C2=A0 as_flat_walk<br>
=C2=A0 oslib: qemu_clr_cloexec<br>
=C2=A0 machine: memfd-alloc option<br>
=C2=A0 vl: add helper to request re-exec<br>
=C2=A0 string to strList<br>
=C2=A0 util: env var helpers<br>
=C2=A0 cpr: restart mode<br>
=C2=A0 cpr: QMP interfaces for restart<br>
=C2=A0 cpr: HMP interfaces for restart<br>
=C2=A0 pci: export functions for cpr<br>
=C2=A0 vfio-pci: refactor for cpr<br>
=C2=A0 vfio-pci: cpr part 1<br>
=C2=A0 vfio-pci: cpr part 2<br>
=C2=A0 hostmem-memfd: cpr support<br>
=C2=A0 chardev: cpr framework<br>
=C2=A0 chardev: cpr for simple devices<br>
=C2=A0 chardev: cpr for pty<br>
=C2=A0 cpr: only-cpr-capable option<br>
=C2=A0 simplify savevm<br>
<br>
Mark Kanda, Steve Sistare (4):<br>
=C2=A0 cpr: QMP interfaces for reboot<br>
=C2=A0 cpr: HMP interfaces for reboot<br>
=C2=A0 vhost: reset vhost devices upon cprsave<br>
=C2=A0 chardev: cpr for sockets<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 12 +++<br>
=C2=A0backends/hostmem-memfd.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 ++--<br>
=C2=A0chardev/char-mux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0chardev/char-null.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0chardev/char-pty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
5 ++-<br>
=C2=A0chardev/char-serial.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0chardev/char-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 +++=
++++<br>
=C2=A0chardev/char-stdio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
8 ++<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 41 +++++++-<br>
=C2=A0gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hmp-commands.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 62 ++++++++++++<br>
=C2=A0hw/core/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 19 ++++<br>
=C2=A0hw/pci/msix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 20 ++--<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0hw/vfio/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 78 ++++++++++++--<br>
=C2=A0hw/vfio/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 154 ++++++++++++++++++++++++++++<br>
=C2=A0hw/vfio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/vfio/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 230 +++++++++++++++++++++++++++++++++++++++---<br>
=C2=A0hw/vfio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0hw/virtio/vhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 11 ++<br>
=C2=A0include/chardev/char.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 ++<=
br>
=C2=A0include/exec/memory.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++=
++<br>
=C2=A0include/hw/boards.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0include/hw/pci/msix.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
5 +<br>
=C2=A0include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +<br>
=C2=A0include/hw/vfio/vfio-common.h |=C2=A0 =C2=A08 ++<br>
=C2=A0include/hw/virtio/vhost.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0include/migration/cpr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 ++++<br>
=C2=A0include/monitor/hmp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
4 +<br>
=C2=A0include/qemu/env.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
3 +++++<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0include/sysemu/runstate.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0include/sysemu/sysemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0linux-headers/linux/vfio.h=C2=A0 =C2=A0 |=C2=A0 27 +++++<br>
=C2=A0migration/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 195 +++++++++++++++++++++++++++++++++++<br>
=C2=A0migration/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0migration/migration.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
5 +<br>
=C2=A0migration/savevm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
1 ++--<br>
=C2=A0migration/savevm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0monitor/hmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7=
5 ++++++++++++--<br>
=C2=A0monitor/hmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3=
6 +++++++<br>
=C2=A0monitor/qmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A05 +-<br>
=C2=A0qapi/cpr.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 88 ++++++++++++++++<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0qapi/qapi-schema.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 39 ++++++-<br>
=C2=A0softmmu/globals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 48 +++++++++<br>
=C2=A0softmmu/physmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 49 +++++++--<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5=
8 ++++++++++-<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 14 ++-<br>
=C2=A0stubs/cpr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0stubs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0util/env.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 95 +++++++++++++++++<br>
=C2=A0util/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 ++<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0util/qemu-config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A061 files changed, 1525 insertions(+), 83 deletions(-)<br>
=C2=A0create mode 100644 hw/vfio/cpr.c<br>
=C2=A0create mode 100644 include/migration/cpr.h<br>
=C2=A0create mode 100644 include/qemu/env.h<br>
=C2=A0create mode 100644 migration/cpr.c<br>
=C2=A0create mode 100644 qapi/cpr.json<br>
=C2=A0create mode 100644 stubs/cpr.c<br>
=C2=A0create mode 100644 util/env.c<br>
<br>
-- <br>
1.8.3.1<br>
<br>
<br></blockquote><div><br></div><div>It doesn&#39;t apply on master, could =
you rebase and resend?</div><div>thanks <br></div></div><br clear=3D"all"><=
br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau=
<br></div></div>

--000000000000ecef8305c687b88f--

