Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4F2D4CE5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 22:33:26 +0100 (CET)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn75R-0003VO-4U
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 16:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kn71B-0002OR-Ok
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:29:01 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kn718-0001x5-Gs
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:29:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id b2so3223580edm.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oS+fUiPiQIRlzerKyCSUKf5efXvgFTPX8LWoZPkKrPw=;
 b=bNXxb2Vg1SPZt0gT1EtKGyXPZyexbeoxxT1KW+8PJAxfCb4Ai/WkQ0DMqk/WTIvJpV
 sRfKSuj//pKSBUL4MH5np9Y2F9mwO2fdo2g7hJ6OaAguDdsuVBJSEsuD0uOUP4g0OS2z
 yoki1FkF+Hy7AycvpBwVBoCH3RZmFsiIC+dNCwrgLQxA4R7cf3azGtisFkWo7E+z6I+P
 cXikaez8J03EvrnHL7Ok0CoEjfAiTj6Cx5/U15tmm7JGMWiDAIo/br9uRL7qVJcOgnhW
 G6Z54brqh0IzuZ8L2pHvCDknP8VDibzhHNsAo96SjF1V7x2gynSTaKCdZripMD0q93iQ
 Sh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oS+fUiPiQIRlzerKyCSUKf5efXvgFTPX8LWoZPkKrPw=;
 b=bHKjBizMpcodlGMUFkVAi20fOiZsHljL+pHxNpzms1BnrzrHLq1KfO8HTqiE27Dh7Y
 TOx7CYdBCtBmSt0//lGKaNiWg6OYCQ0OPSlQ2Xndf0EUCpYMXNkk2DL2OtezWjFUVxNK
 1hL3Tzlp1igK9j/K4WsMvdU/eC9dMhvdPiI7e57+iM8n0XJE+gNA0/TxO+lvRf9BnuTU
 Ww39hU6djBqIQMN2snKsNsQpOgd7s+/NnE2NMf9AB8zkwKr5TX+a/5pW3e2fzx0cE01M
 Vfpu6ml8SKlYgKhAD2zjEMg6eGg5xIqHRCzxs60ds7eo1O7qo9mIrgxt9+2icHoGxn6P
 PIbw==
X-Gm-Message-State: AOAM531pdomrEsnBnCBOifrFLujSKnUPNBlNaJUdfj8DMLvI4Ln2/x9R
 sucvAdO0pKdEvD1mY5kzi8Wx0Wg1L1fhwWBzv7c=
X-Google-Smtp-Source: ABdhPJy7ygw3w2vyFU7prxiF+zPgxtBrX1L/i0qWQG1Vx+O9dXGXookE/LDjSDrAYlrkEqfYT3Nf8Z4+HrLudOI44/g=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr3987400edw.53.1607549336382; 
 Wed, 09 Dec 2020 13:28:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <de6b80ac6978fa217588f6e57bb09c28269433f5.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1C+oNxe3M1xg8LQJM-sBS4pPYyeYZ3j6wQzRs+pLbp3c+A@mail.gmail.com>
 <DC9181AF-A1D6-487E-A594-2870E528359A@oracle.com>
In-Reply-To: <DC9181AF-A1D6-487E-A594-2870E528359A@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Dec 2020 01:28:44 +0400
Message-ID: <CAJ+F1CJLHuZmRLnYrtHquY6NdS_WjmcEdgMuPnpBwq7n-0EQ_w@mail.gmail.com>
Subject: Re: [PATCH v12 16/19] multi-process: Synchronize remote memory
To: Jag Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000027715805b60ebf31"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000027715805b60ebf31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 9, 2020 at 8:20 PM Jag Raman <jag.raman@oracle.com> wrote:

>
>
> > On Dec 8, 2020, at 8:57 AM, Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com=
>
> wrote:
> > Add memory-listener object which is used to keep the view of the RAM
> > in sync between QEMU and remote process.
> > A MemoryListener is registered for system-memory AddressSpace. The
> > listener sends SYNC_SYSMEM message to the remote process when memory
> > listener commits the changes to memory, the remote process receives
> > the message and processes it in the handler for SYNC_SYSMEM message.
> >
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/hw/remote/memory-sync.h |  27 ++++++
> >  include/hw/remote/proxy.h       |   2 +
> >  hw/remote/memory-sync.c         | 210
> ++++++++++++++++++++++++++++++++++++++++
> >  hw/remote/message.c             |   5 +
> >  hw/remote/proxy.c               |   6 ++
> >  MAINTAINERS                     |   2 +
> >  hw/remote/meson.build           |   1 +
> >  7 files changed, 253 insertions(+)
> >  create mode 100644 include/hw/remote/memory-sync.h
> >  create mode 100644 hw/remote/memory-sync.c
> >
> > diff --git a/include/hw/remote/memory-sync.h
> b/include/hw/remote/memory-sync.h
> > new file mode 100644
> > index 0000000..785f76a
> > --- /dev/null
> > +++ b/include/hw/remote/memory-sync.h
> > @@ -0,0 +1,27 @@
> > +/*
> > + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef MEMORY_SYNC_H
> > +#define MEMORY_SYNC_H
> > +
> > +#include "exec/memory.h"
> > +#include "io/channel.h"
> > +
> > +typedef struct RemoteMemSync {
> > +    MemoryListener listener;
> > +
> > +    int n_mr_sections;
> > +    MemoryRegionSection *mr_sections;
> > +
> > +    QIOChannel *ioc;
> > +} RemoteMemSync;
> > +
> > +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc);
> > +void deconfigure_memory_sync(RemoteMemSync *sync);
> >
> > RemoteMemSync vs MemorySync, and function with _memory_sync suffixes...
> > Naming things is hard, but trying to be consistent generally helps.
> >
> > My understanding is that this is a proxy-dev helper to handle memory
> listening and sending SYNC_SYSMEM.
> >
> > I would thus suggest naming it ProxyMemoryListener. It could eventually
> be folded in proxy.c
> >
> > Please try to be consistent with header naming, structure naming, type,
> functions and enum prefixes etc.
> >
> > proxy_memory_listener isn't that long imho.
> >
> > +
> > +#endif
> > diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
> > index e29c61b..a687b7d 100644
> > --- a/include/hw/remote/proxy.h
> > +++ b/include/hw/remote/proxy.h
> > @@ -11,6 +11,7 @@
> >
> >  #include "hw/pci/pci.h"
> >  #include "io/channel.h"
> > +#include "hw/remote/memory-sync.h"
> >
> >  #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
> >
> > @@ -40,6 +41,7 @@ struct PCIProxyDev {
> >      QemuMutex io_mutex;
> >      QIOChannel *ioc;
> >      Error *migration_blocker;
> > +    RemoteMemSync sync;
> >      ProxyMemoryRegion region[PCI_NUM_REGIONS];
> >  };
> >
> > diff --git a/hw/remote/memory-sync.c b/hw/remote/memory-sync.c
> > new file mode 100644
> > index 0000000..2365e69
> > --- /dev/null
> > +++ b/hw/remote/memory-sync.c
> > @@ -0,0 +1,210 @@
> > +/*
> > + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu-common.h"
> > +
> > +#include "qemu/compiler.h"
> > +#include "qemu/int128.h"
> > +#include "qemu/range.h"
> > +#include "exec/memory.h"
> > +#include "exec/cpu-common.h"
> > +#include "cpu.h"
> > +#include "exec/ram_addr.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/remote/mpqemu-link.h"
> > +#include "hw/remote/memory-sync.h"
> > +
> > +static void proxy_ml_begin(MemoryListener *listener)
> >
> > I suggest to rename begin -> reset
> >
> > +{
> > +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync,
> listener);
> > +    int mrs;
> > +
> > +    for (mrs =3D 0; mrs < sync->n_mr_sections; mrs++) {
> > +        memory_region_unref(sync->mr_sections[mrs].mr);
> > +    }
> > +
> > +    g_free(sync->mr_sections);
> > +    sync->mr_sections =3D NULL;
> > +    sync->n_mr_sections =3D 0;
> > +}
> > +
> > +static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)
> >
> > This function is very similar to vhost_user_get_mr_data(). That suggest=
s
> we could factor the code.
> >
> > Perhaps a new memory_region_from_host_full(), or extend
> memory_region_from_host() with an extra optional "int *fd" argument.
> >
> > +{
> > +    MemoryRegion *mr;
> > +    ram_addr_t off;
> > +
> > +    /**
> > +     * Assumes that the host address is a valid address as it's
> > +     * coming from the MemoryListener system. In the case host
> > +     * address is not valid, the following call would return
> > +     * the default subregion of "system_memory" region, and
> > +     * not NULL. So it's not possible to check for NULL here.
> > +     */
> > +    mr =3D memory_region_from_host((void *)(uintptr_t)host, &off);
> > +
> > +    if (offset) {
> > +        *offset =3D off;
> > +    }
> > +
> > +    return memory_region_get_fd(mr);
> > +}
> > +
> > +static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host,
> size_t size)
> > +{
> >
> > This seems similar to vhost_user_can_merge().
> >
> > +    bool merge;
> > +    int fd1, fd2;
> > +
> > +    fd1 =3D get_fd_from_hostaddr(host, NULL);
> > +
> > +    fd2 =3D get_fd_from_hostaddr(prev_host, NULL);
> > +
> > +    merge =3D (fd1 =3D=3D fd2);
> >
> > This could be written in a simpler manner, ex:
> >
> > if (get_fd_from_hostaddr(host, NULL) !=3D get_fd_from_hostaddr(prev_hos=
t,
> NULL))
> >   return false
> >
> > +
> > +    merge &=3D ((prev_host + size) =3D=3D host);
> >
> > That check could be done early on before doing the more expensive
> memory_region_from_host() calls
> >
> > +
> > +    return merge;
> > +}
> > +
> > +static bool try_merge(RemoteMemSync *sync, MemoryRegionSection *sectio=
n)
> > +{
> > +    uint64_t mrs_size, mrs_gpa, mrs_page;
> > +    MemoryRegionSection *prev_sec;
> > +    bool merged =3D false;
> > +    uintptr_t mrs_host;
> > +    RAMBlock *mrs_rb;
> > +
> > +    if (!sync->n_mr_sections) {
> > +        return false;
> > +    }
> > +
> > +    mrs_rb =3D section->mr->ram_block;
> > +    mrs_page =3D (uint64_t)qemu_ram_pagesize(mrs_rb);
> > +    mrs_size =3D int128_get64(section->size);
> > +    mrs_gpa =3D section->offset_within_address_space;
> > +    mrs_host =3D (uintptr_t)memory_region_get_ram_ptr(section->mr) +
> > +               section->offset_within_region;
> > +
> > +    if (get_fd_from_hostaddr(mrs_host, NULL) < 0) {
> > +        return true;
> > +    }
> > +
> > +    mrs_host =3D mrs_host & ~(mrs_page - 1);
> > +    mrs_gpa =3D mrs_gpa & ~(mrs_page - 1);
> > +    mrs_size =3D ROUND_UP(mrs_size, mrs_page);
> > +
> > +    prev_sec =3D sync->mr_sections + (sync->n_mr_sections - 1);
> > +    uint64_t prev_gpa_start =3D prev_sec->offset_within_address_space;
> > +    uint64_t prev_size =3D int128_get64(prev_sec->size);
> > +    uint64_t prev_gpa_end   =3D range_get_last(prev_gpa_start, prev_si=
ze);
> > +    uint64_t prev_host_start =3D
> > +        (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr) +
> > +        prev_sec->offset_within_region;
> > +    uint64_t prev_host_end =3D range_get_last(prev_host_start, prev_si=
ze);
> > +
> > +    if (mrs_gpa <=3D (prev_gpa_end + 1)) {
> > +        g_assert(mrs_gpa > prev_gpa_start);
> > +
> > +        if ((section->mr =3D=3D prev_sec->mr) &&
> > +            proxy_mrs_can_merge(mrs_host, prev_host_start,
> > +                                (mrs_gpa - prev_gpa_start))) {
> > +            uint64_t max_end =3D MAX(prev_host_end, mrs_host + mrs_siz=
e);
> > +            merged =3D true;
> > +            prev_sec->offset_within_address_space =3D
> > +                MIN(prev_gpa_start, mrs_gpa);
> > +            prev_sec->offset_within_region =3D
> > +                MIN(prev_host_start, mrs_host) -
> > +                (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr);
> > +            prev_sec->size =3D int128_make64(max_end -
> MIN(prev_host_start,
> > +                                                         mrs_host));
> > +        }
> > +    }
> > +
> > +    return merged;
> > +}
> > +
> > +static void proxy_ml_region_addnop(MemoryListener *listener,
> > +                                   MemoryRegionSection *section)
> > +{
> > +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync,
> listener);
> > +
> > +    if (!(memory_region_is_ram(section->mr) &&
> > +          !memory_region_is_rom(section->mr))) {
> > +        return;
> >
> > A bit clearer in vhost.c:
> > if (memory_region_is_ram(mr) && !memory_region_is_rom(mr)) {
> >
> > +    }
> > +
> > +    if (try_merge(sync, section)) {
> > +        return;
> > +    }
> > +
> > +    ++sync->n_mr_sections;
> > +    sync->mr_sections =3D g_renew(MemoryRegionSection, sync->mr_sectio=
ns,
> > +                                sync->n_mr_sections);
> > +    sync->mr_sections[sync->n_mr_sections - 1] =3D *section;
> > +    sync->mr_sections[sync->n_mr_sections - 1].fv =3D NULL;
> > +    memory_region_ref(section->mr);
> > +}
> > +
> > +static void proxy_ml_commit(MemoryListener *listener)
> > +{
> > +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync,
> listener);
> > +    MPQemuMsg msg;
> > +    MemoryRegionSection *section;
> > +    ram_addr_t offset;
> > +    uintptr_t host_addr;
> > +    int region;
> > +    Error *local_err =3D NULL;
> > +
> > +    memset(&msg, 0, sizeof(MPQemuMsg));
> > +
> > +    msg.cmd =3D SYNC_SYSMEM;
> > +    msg.num_fds =3D sync->n_mr_sections;
> > +    msg.size =3D sizeof(SyncSysmemMsg);
> > +    if (msg.num_fds > REMOTE_MAX_FDS) {
> > +        error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
> > +        return;
> > +    }
> > +
> > +    for (region =3D 0; region < sync->n_mr_sections; region++) {
> > +        section =3D &sync->mr_sections[region];
> > +        msg.data.sync_sysmem.gpas[region] =3D
> > +            section->offset_within_address_space;
> > +        msg.data.sync_sysmem.sizes[region] =3D
> int128_get64(section->size);
> > +        host_addr =3D (uintptr_t)memory_region_get_ram_ptr(section->mr=
) +
> > +                    section->offset_within_region;
> > +        msg.fds[region] =3D get_fd_from_hostaddr(host_addr, &offset);
> > +        msg.data.sync_sysmem.offsets[region] =3D offset;
> > +    }
> > +    mpqemu_msg_send(&msg, sync->ioc, &local_err);
> > +    if (local_err) {
> > +        error_report("Error in sending command %d", msg.cmd);
> > +    }
> > +}
> >
> > That whole complex code above duplicates much of the logic in vhost.c.
> Can we try to factorize it instead?
>
> Hi Marc-Andre,
>
> Thank you for sharing your feedback!
>
> Would it be alright if we addressed this item alone in a separate patch i=
n
> the future? Since
> this refactoring affects vhost code, we=E2=80=99re wondering it would be =
better to
> address it in a
> future patch to help with any regression analysis in the future.
>

That's fine with me, but please leave a TODO note in the code then.

thanks


> Thank you!
> =E2=80=94
> Jag
>
> >
> > +
> > +void deconfigure_memory_sync(RemoteMemSync *sync)
> > +{
> > +    memory_listener_unregister(&sync->listener);
> > +
> > +    proxy_ml_begin(&sync->listener);
> > +}
> > +
> > +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc)
> > +{
> > +    sync->n_mr_sections =3D 0;
> > +    sync->mr_sections =3D NULL;
> > +
> > +    sync->ioc =3D ioc;
> > +
> > +    sync->listener.begin =3D proxy_ml_begin;
> > +    sync->listener.commit =3D proxy_ml_commit;
> > +    sync->listener.region_add =3D proxy_ml_region_addnop;
> > +    sync->listener.region_nop =3D proxy_ml_region_addnop;
> > +    sync->listener.priority =3D 10;
> > +
> > +    memory_listener_register(&sync->listener, &address_space_memory);
> > +}
> > diff --git a/hw/remote/message.c b/hw/remote/message.c
> > index 0f3e38a..454fd2d 100644
> > --- a/hw/remote/message.c
> > +++ b/hw/remote/message.c
> > @@ -17,6 +17,7 @@
> >  #include "sysemu/runstate.h"
> >  #include "hw/pci/pci.h"
> >  #include "exec/memattrs.h"
> > +#include "hw/remote/memory.h"
> >
> >  static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
> >                                   MPQemuMsg *msg);
> > @@ -64,6 +65,10 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void
> *data)
> >          case BAR_READ:
> >              process_bar_read(com->ioc, &msg, &local_err);
> >              break;
> > +        case SYNC_SYSMEM:
> > +            remote_sysmem_reconfig(&msg, &local_err);
> > +            break;
> > +
> >          default:
> >              error_setg(&local_err,
> >                         "Unknown command (%d) received for device %s
> (pid=3D%d)",
> > diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> > index 039347d..0f2d1aa 100644
> > --- a/hw/remote/proxy.c
> > +++ b/hw/remote/proxy.c
> > @@ -18,6 +18,8 @@
> >  #include "migration/blocker.h"
> >  #include "hw/remote/mpqemu-link.h"
> >  #include "qemu/error-report.h"
> > +#include "hw/remote/memory-sync.h"
> > +#include "qom/object.h"
> >
> >  static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
> >  {
> > @@ -58,6 +60,8 @@ static void pci_proxy_dev_realize(PCIDevice *device,
> Error **errp)
> >
> >      qemu_mutex_init(&dev->io_mutex);
> >      qio_channel_set_blocking(dev->ioc, true, NULL);
> > +
> > +    configure_memory_sync(&dev->sync, dev->ioc);
> >  }
> >
> >  static void pci_proxy_dev_exit(PCIDevice *pdev)
> > @@ -69,6 +73,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
> >      migrate_del_blocker(dev->migration_blocker);
> >
> >      error_free(dev->migration_blocker);
> > +
> > +    deconfigure_memory_sync(&dev->sync);
> >  }
> >
> >  static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t
> *val,
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ebd1d1d..5d78b78 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3150,6 +3150,8 @@ F: include/hw/remote/memory.h
> >  F: hw/remote/memory.c
> >  F: hw/remote/proxy.c
> >  F: include/hw/remote/proxy.h
> > +F: hw/remote/memory-sync.c
> > +F: include/hw/remote/memory-sync.h
> >
> >  Build and test automation
> >  -------------------------
> > diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> > index 569cd20..7d434a5 100644
> > --- a/hw/remote/meson.build
> > +++ b/hw/remote/meson.build
> > @@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('remote-obj.c'))
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
> >
> >  specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'=
))
> > +specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('memory-sync.c'))
> >
> >  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> > --
> > 1.8.3.1
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000027715805b60ebf31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 9, 2020 at 8:20 PM Jag Ra=
man &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Dec 8, 2020, at 8:57 AM, Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.com=
</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman &lt;<a href=3D"mailt=
o:jag.raman@oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt; wrot=
e:<br>
&gt; Add memory-listener object which is used to keep the view of the RAM<b=
r>
&gt; in sync between QEMU and remote process.<br>
&gt; A MemoryListener is registered for system-memory AddressSpace. The<br>
&gt; listener sends SYNC_SYSMEM message to the remote process when memory<b=
r>
&gt; listener commits the changes to memory, the remote process receives<br=
>
&gt; the message and processes it in the handler for SYNC_SYSMEM message.<b=
r>
&gt; <br>
&gt; Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracl=
e.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt; Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@ora=
cle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
&gt; Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@o=
racle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/remote/memory-sync.h |=C2=A0 27 ++++++<br>
&gt;=C2=A0 include/hw/remote/proxy.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 hw/remote/memory-sync.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 210 +=
+++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 ++<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 7 files changed, 253 insertions(+)<br>
&gt;=C2=A0 create mode 100644 include/hw/remote/memory-sync.h<br>
&gt;=C2=A0 create mode 100644 hw/remote/memory-sync.c<br>
&gt; <br>
&gt; diff --git a/include/hw/remote/memory-sync.h b/include/hw/remote/memor=
y-sync.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..785f76a<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/remote/memory-sync.h<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +/*<br>
&gt; + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef MEMORY_SYNC_H<br>
&gt; +#define MEMORY_SYNC_H<br>
&gt; +<br>
&gt; +#include &quot;exec/memory.h&quot;<br>
&gt; +#include &quot;io/channel.h&quot;<br>
&gt; +<br>
&gt; +typedef struct RemoteMemSync {<br>
&gt; +=C2=A0 =C2=A0 MemoryListener listener;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 int n_mr_sections;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegionSection *mr_sections;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QIOChannel *ioc;<br>
&gt; +} RemoteMemSync;<br>
&gt; +<br>
&gt; +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc);<br>
&gt; +void deconfigure_memory_sync(RemoteMemSync *sync);<br>
&gt; <br>
&gt; RemoteMemSync vs MemorySync, and function with _memory_sync suffixes..=
.<br>
&gt; Naming things is hard, but trying to be consistent generally helps.<br=
>
&gt; <br>
&gt; My understanding is that this is a proxy-dev helper to handle memory l=
istening and sending SYNC_SYSMEM.<br>
&gt; <br>
&gt; I would thus suggest naming it ProxyMemoryListener. It could eventuall=
y be folded in proxy.c<br>
&gt; <br>
&gt; Please try to be consistent with header naming, structure naming, type=
, functions and enum prefixes etc.<br>
&gt; <br>
&gt; proxy_memory_listener isn&#39;t that long imho.<br>
&gt; <br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h<br>
&gt; index e29c61b..a687b7d 100644<br>
&gt; --- a/include/hw/remote/proxy.h<br>
&gt; +++ b/include/hw/remote/proxy.h<br>
&gt; @@ -11,6 +11,7 @@<br>
&gt; <br>
&gt;=C2=A0 #include &quot;hw/pci/pci.h&quot;<br>
&gt;=C2=A0 #include &quot;io/channel.h&quot;<br>
&gt; +#include &quot;hw/remote/memory-sync.h&quot;<br>
&gt; <br>
&gt;=C2=A0 #define TYPE_PCI_PROXY_DEV &quot;x-pci-proxy-dev&quot;<br>
&gt; <br>
&gt; @@ -40,6 +41,7 @@ struct PCIProxyDev {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QemuMutex io_mutex;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QIOChannel *ioc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *migration_blocker;<br>
&gt; +=C2=A0 =C2=A0 RemoteMemSync sync;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ProxyMemoryRegion region[PCI_NUM_REGIONS];<br>
&gt;=C2=A0 };<br>
&gt; <br>
&gt; diff --git a/hw/remote/memory-sync.c b/hw/remote/memory-sync.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..2365e69<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/remote/memory-sync.c<br>
&gt; @@ -0,0 +1,210 @@<br>
&gt; +/*<br>
&gt; + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu-common.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;qemu/compiler.h&quot;<br>
&gt; +#include &quot;qemu/int128.h&quot;<br>
&gt; +#include &quot;qemu/range.h&quot;<br>
&gt; +#include &quot;exec/memory.h&quot;<br>
&gt; +#include &quot;exec/cpu-common.h&quot;<br>
&gt; +#include &quot;cpu.h&quot;<br>
&gt; +#include &quot;exec/ram_addr.h&quot;<br>
&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; +#include &quot;hw/remote/mpqemu-link.h&quot;<br>
&gt; +#include &quot;hw/remote/memory-sync.h&quot;<br>
&gt; +<br>
&gt; +static void proxy_ml_begin(MemoryListener *listener)<br>
&gt; <br>
&gt; I suggest to rename begin -&gt; reset <br>
&gt; <br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMe=
mSync, listener);<br>
&gt; +=C2=A0 =C2=A0 int mrs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (mrs =3D 0; mrs &lt; sync-&gt;n_mr_sections; mrs++)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_unref(sync-&gt;mr_sections[=
mrs].mr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_free(sync-&gt;mr_sections);<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;mr_sections =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;n_mr_sections =3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)<br=
>
&gt; <br>
&gt; This function is very similar to vhost_user_get_mr_data(). That sugges=
ts we could factor the code.<br>
&gt; <br>
&gt; Perhaps a new memory_region_from_host_full(), or extend memory_region_=
from_host() with an extra optional &quot;int *fd&quot; argument.<br>
&gt;=C2=A0 <br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *mr;<br>
&gt; +=C2=A0 =C2=A0 ram_addr_t off;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Assumes that the host address is a valid addres=
s as it&#39;s<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* coming from the MemoryListener system. In the c=
ase host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* address is not valid, the following call would =
return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the default subregion of &quot;system_memory&qu=
ot; region, and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* not NULL. So it&#39;s not possible to check for=
 NULL here.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 mr =3D memory_region_from_host((void *)(uintptr_t)host,=
 &amp;off);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (offset) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *offset =3D off;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return memory_region_get_fd(mr);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, si=
ze_t size)<br>
&gt; +{<br>
&gt; <br>
&gt; This seems similar to vhost_user_can_merge(). <br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 bool merge;<br>
&gt; +=C2=A0 =C2=A0 int fd1, fd2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fd1 =3D get_fd_from_hostaddr(host, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fd2 =3D get_fd_from_hostaddr(prev_host, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 merge =3D (fd1 =3D=3D fd2);<br>
&gt; <br>
&gt; This could be written in a simpler manner, ex:<br>
&gt; <br>
&gt; if (get_fd_from_hostaddr(host, NULL) !=3D get_fd_from_hostaddr(prev_ho=
st, NULL))<br>
&gt;=C2=A0 =C2=A0return false<br>
&gt; <br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 merge &amp;=3D ((prev_host + size) =3D=3D host);<br>
&gt; <br>
&gt; That check could be done early on before doing the more expensive memo=
ry_region_from_host() calls<br>
&gt; <br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return merge;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool try_merge(RemoteMemSync *sync, MemoryRegionSection *secti=
on)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t mrs_size, mrs_gpa, mrs_page;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegionSection *prev_sec;<br>
&gt; +=C2=A0 =C2=A0 bool merged =3D false;<br>
&gt; +=C2=A0 =C2=A0 uintptr_t mrs_host;<br>
&gt; +=C2=A0 =C2=A0 RAMBlock *mrs_rb;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!sync-&gt;n_mr_sections) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mrs_rb =3D section-&gt;mr-&gt;ram_block;<br>
&gt; +=C2=A0 =C2=A0 mrs_page =3D (uint64_t)qemu_ram_pagesize(mrs_rb);<br>
&gt; +=C2=A0 =C2=A0 mrs_size =3D int128_get64(section-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 mrs_gpa =3D section-&gt;offset_within_address_space;<br=
>
&gt; +=C2=A0 =C2=A0 mrs_host =3D (uintptr_t)memory_region_get_ram_ptr(secti=
on-&gt;mr) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section-&gt;of=
fset_within_region;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (get_fd_from_hostaddr(mrs_host, NULL) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mrs_host =3D mrs_host &amp; ~(mrs_page - 1);<br>
&gt; +=C2=A0 =C2=A0 mrs_gpa =3D mrs_gpa &amp; ~(mrs_page - 1);<br>
&gt; +=C2=A0 =C2=A0 mrs_size =3D ROUND_UP(mrs_size, mrs_page);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 prev_sec =3D sync-&gt;mr_sections + (sync-&gt;n_mr_sect=
ions - 1);<br>
&gt; +=C2=A0 =C2=A0 uint64_t prev_gpa_start =3D prev_sec-&gt;offset_within_=
address_space;<br>
&gt; +=C2=A0 =C2=A0 uint64_t prev_size =3D int128_get64(prev_sec-&gt;size);=
<br>
&gt; +=C2=A0 =C2=A0 uint64_t prev_gpa_end=C2=A0 =C2=A0=3D range_get_last(pr=
ev_gpa_start, prev_size);<br>
&gt; +=C2=A0 =C2=A0 uint64_t prev_host_start =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintptr_t)memory_region_get_ram_ptr(prev=
_sec-&gt;mr) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_region;<br>
&gt; +=C2=A0 =C2=A0 uint64_t prev_host_end =3D range_get_last(prev_host_sta=
rt, prev_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (mrs_gpa &lt;=3D (prev_gpa_end + 1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(mrs_gpa &gt; prev_gpa_start);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((section-&gt;mr =3D=3D prev_sec-&gt;m=
r) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_mrs_can_merge(mrs_hos=
t, prev_host_start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mrs_gpa - prev_gpa_start))) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t max_end =3D MAX(pr=
ev_host_end, mrs_host + mrs_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 merged =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_=
address_space =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(prev_gpa_=
start, mrs_gpa);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_=
region =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(prev_host=
_start, mrs_host) -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintptr_t)me=
mory_region_get_ram_ptr(prev_sec-&gt;mr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;size =3D int12=
8_make64(max_end - MIN(prev_host_start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mrs_host));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return merged;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void proxy_ml_region_addnop(MemoryListener *listener,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection=
 *section)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMe=
mSync, listener);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(memory_region_is_ram(section-&gt;mr) &amp;&amp;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !memory_region_is_rom(section-&gt;=
mr))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; <br>
&gt; A bit clearer in vhost.c:<br>
&gt; if (memory_region_is_ram(mr) &amp;&amp; !memory_region_is_rom(mr)) {<b=
r>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (try_merge(sync, section)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ++sync-&gt;n_mr_sections;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;mr_sections =3D g_renew(MemoryRegionSection, s=
ync-&gt;mr_sections,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync-&gt;n_mr_sections);<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;mr_sections[sync-&gt;n_mr_sections - 1] =3D *s=
ection;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;mr_sections[sync-&gt;n_mr_sections - 1].fv =3D=
 NULL;<br>
&gt; +=C2=A0 =C2=A0 memory_region_ref(section-&gt;mr);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void proxy_ml_commit(MemoryListener *listener)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMe=
mSync, listener);<br>
&gt; +=C2=A0 =C2=A0 MPQemuMsg msg;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegionSection *section;<br>
&gt; +=C2=A0 =C2=A0 ram_addr_t offset;<br>
&gt; +=C2=A0 =C2=A0 uintptr_t host_addr;<br>
&gt; +=C2=A0 =C2=A0 int region;<br>
&gt; +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(&amp;msg, 0, sizeof(MPQemuMsg));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 msg.cmd =3D SYNC_SYSMEM;<br>
&gt; +=C2=A0 =C2=A0 msg.num_fds =3D sync-&gt;n_mr_sections;<br>
&gt; +=C2=A0 =C2=A0 msg.size =3D sizeof(SyncSysmemMsg);<br>
&gt; +=C2=A0 =C2=A0 if (msg.num_fds &gt; REMOTE_MAX_FDS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Number of fds is more =
than %d&quot;, REMOTE_MAX_FDS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (region =3D 0; region &lt; sync-&gt;n_mr_sections; =
region++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 section =3D &amp;sync-&gt;mr_sections[reg=
ion];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.gpas[region] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&gt;offset_within_a=
ddress_space;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.sizes[region] =3D in=
t128_get64(section-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_addr =3D (uintptr_t)memory_region_ge=
t_ram_ptr(section-&gt;mr) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 section-&gt;offset_within_region;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.fds[region] =3D get_fd_from_hostaddr(=
host_addr, &amp;offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.offsets[region] =3D =
offset;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 mpqemu_msg_send(&amp;msg, sync-&gt;ioc, &amp;local_err)=
;<br>
&gt; +=C2=A0 =C2=A0 if (local_err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Error in sending comma=
nd %d&quot;, msg.cmd);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; <br>
&gt; That whole complex code above duplicates much of the logic in vhost.c.=
 Can we try to factorize it instead?<br>
<br>
Hi Marc-Andre,<br>
<br>
Thank you for sharing your feedback!<br>
<br>
Would it be alright if we addressed this item alone in a separate patch in =
the future? Since<br>
this refactoring affects vhost code, we=E2=80=99re wondering it would be be=
tter to address it in a<br>
future patch to help with any regression analysis in the future.<br></block=
quote><div><br></div><div>That&#39;s fine with me, but please leave a TODO =
note in the code then.</div><div><br></div><div>thanks</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thank you!<br>
=E2=80=94<br>
Jag<br>
<br>
&gt; <br>
&gt; +<br>
&gt; +void deconfigure_memory_sync(RemoteMemSync *sync)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 memory_listener_unregister(&amp;sync-&gt;listener);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 proxy_ml_begin(&amp;sync-&gt;listener);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;n_mr_sections =3D 0;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;mr_sections =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;ioc =3D ioc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;listener.begin =3D proxy_ml_begin;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;listener.commit =3D proxy_ml_commit;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;listener.region_add =3D proxy_ml_region_addnop=
;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;listener.region_nop =3D proxy_ml_region_addnop=
;<br>
&gt; +=C2=A0 =C2=A0 sync-&gt;listener.priority =3D 10;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_listener_register(&amp;sync-&gt;listener, &amp;a=
ddress_space_memory);<br>
&gt; +}<br>
&gt; diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
&gt; index 0f3e38a..454fd2d 100644<br>
&gt; --- a/hw/remote/message.c<br>
&gt; +++ b/hw/remote/message.c<br>
&gt; @@ -17,6 +17,7 @@<br>
&gt;=C2=A0 #include &quot;sysemu/runstate.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/memattrs.h&quot;<br>
&gt; +#include &quot;hw/remote/memory.h&quot;<br>
&gt; <br>
&gt;=C2=A0 static void process_config_write(QIOChannel *ioc, PCIDevice *dev=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MPQemuMsg *msg);<br>
&gt; @@ -64,6 +65,10 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *d=
ata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case BAR_READ:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_bar_read(com-&=
gt;ioc, &amp;msg, &amp;local_err);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SYNC_SYSMEM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_sysmem_reconfig(&amp=
;msg, &amp;local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_=
err,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Unknown command (%d) received for device %s (pid=
=3D%d)&quot;,<br>
&gt; diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c<br>
&gt; index 039347d..0f2d1aa 100644<br>
&gt; --- a/hw/remote/proxy.c<br>
&gt; +++ b/hw/remote/proxy.c<br>
&gt; @@ -18,6 +18,8 @@<br>
&gt;=C2=A0 #include &quot;migration/blocker.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/remote/mpqemu-link.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;hw/remote/memory-sync.h&quot;<br>
&gt; +#include &quot;qom/object.h&quot;<br>
&gt; <br>
&gt;=C2=A0 static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **=
errp)<br>
&gt;=C2=A0 {<br>
&gt; @@ -58,6 +60,8 @@ static void pci_proxy_dev_realize(PCIDevice *device,=
 Error **errp)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_mutex_init(&amp;dev-&gt;io_mutex);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qio_channel_set_blocking(dev-&gt;ioc, true, NULL);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 configure_memory_sync(&amp;dev-&gt;sync, dev-&gt;ioc);<=
br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
&gt; @@ -69,6 +73,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 migrate_del_blocker(dev-&gt;migration_blocker);<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 error_free(dev-&gt;migration_blocker);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 deconfigure_memory_sync(&amp;dev-&gt;sync);<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint=
32_t *val,<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index ebd1d1d..5d78b78 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -3150,6 +3150,8 @@ F: include/hw/remote/memory.h<br>
&gt;=C2=A0 F: hw/remote/memory.c<br>
&gt;=C2=A0 F: hw/remote/proxy.c<br>
&gt;=C2=A0 F: include/hw/remote/proxy.h<br>
&gt; +F: hw/remote/memory-sync.c<br>
&gt; +F: include/hw/remote/memory-sync.h<br>
&gt; <br>
&gt;=C2=A0 Build and test automation<br>
&gt;=C2=A0 -------------------------<br>
&gt; diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
&gt; index 569cd20..7d434a5 100644<br>
&gt; --- a/hw/remote/meson.build<br>
&gt; +++ b/hw/remote/meson.build<br>
&gt; @@ -7,5 +7,6 @@ remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_=
true: files(&#39;remote-obj.c&#39;))<br>
&gt;=C2=A0 remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: file=
s(&#39;proxy.c&#39;))<br>
&gt; <br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: fi=
les(&#39;memory.c&#39;))<br>
&gt; +specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&=
#39;memory-sync.c&#39;))<br>
&gt; <br>
&gt;=C2=A0 softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true:=
 remote_ss)<br>
&gt; -- <br>
&gt; 1.8.3.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000027715805b60ebf31--

