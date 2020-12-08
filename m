Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1E2D2CA2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:08:27 +0100 (CET)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdfG-0001zt-CF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmdV8-0005BB-Pf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:57:58 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmdV5-0005OG-DC
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:57:58 -0500
Received: by mail-ed1-x543.google.com with SMTP id p22so5618824edu.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 05:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YVYyzk3Ysqa2dP/7PzaO9QyetrwUkg4ye1LIvGGau1w=;
 b=bCzkr/+DhOYPZAepcCH/MuEIr+pp42o60B8SH6Zn1YPmcg1WZH9P9Vdp3hUvvnfuRu
 rMPgamArtaAo0rNKU+Dhi5n+HBne9EWxuGj2wgFgKXhYIerV4HduvU8RIYoDM2Rjg3SP
 gYiI8m8W6uoMnmuDtJgRMRPkmNI6YweYA5JJ7HjQrOu8CcTZv6jDYbS/mzxVGpZU/6Nt
 3CnkpFhxl3v5shbrPXwx9DtV9d5uRrC8FP/HUroA/3gDbA89pV7zCgw+ktQ1WPrfpFlM
 +9zzD0z96p7TvYl8r2GEWAgOcEMe78hcd43YQ+NLhOckgIQxEhFwoRdJsX5EHsXoO92B
 OnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YVYyzk3Ysqa2dP/7PzaO9QyetrwUkg4ye1LIvGGau1w=;
 b=UfmmhV6BwLCpJjgZpsfW4x81gWoe5fHfWrRYZBQIV/vgriFy4AkhFaPXLOxd1WwwAK
 UYF/iX40nDUAd41go+CtUX+M7RXxYYd59hw3WYL9zp6K2nKoUBjdnIPrKYjOcWOUMrha
 UIib1KjkJ0yLCR5ywS7ZuudmFqWLqFU3Z6JeTG5UQW8VsOxTXE3vo7ofpmDwoEO3eTjO
 VH3C+fP96LlLaBe9/5ramR/YKPoNtRGvy2atFnf3NZswvgRzmapxU3akEH6V4dlXMogd
 d1SlN+HvypOWJuP4iI9VvmggQ+61kldsZoeDP8lXAYzR/l/qZwl4jyoXj2or7/dmcj/j
 s8yw==
X-Gm-Message-State: AOAM530PwM6G2Tbqx7ylcdSmWfW8fhR3a39Zyts2Oy+vvs0qOXZKHMmX
 DI8p/6pwBVPclSLN+AiEea5kxwBnqISwzTV6bps=
X-Google-Smtp-Source: ABdhPJx8KtY4AGQphxfcD8vniSi6NYseyikG2yzNtTq8gNnFy7M7esGVNoL89GWqrru05jnofys0xvmboPQYdVTH1nM=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr25224081edc.30.1607435872925; 
 Tue, 08 Dec 2020 05:57:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <de6b80ac6978fa217588f6e57bb09c28269433f5.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <de6b80ac6978fa217588f6e57bb09c28269433f5.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 17:57:40 +0400
Message-ID: <CAJ+F1C+oNxe3M1xg8LQJM-sBS4pPYyeYZ3j6wQzRs+pLbp3c+A@mail.gmail.com>
Subject: Re: [PATCH v12 16/19] multi-process: Synchronize remote memory
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000034811f05b5f454e3"
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034811f05b5f454e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> Add memory-listener object which is used to keep the view of the RAM
> in sync between QEMU and remote process.
> A MemoryListener is registered for system-memory AddressSpace. The
> listener sends SYNC_SYSMEM message to the remote process when memory
> listener commits the changes to memory, the remote process receives
> the message and processes it in the handler for SYNC_SYSMEM message.
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/memory-sync.h |  27 ++++++
>  include/hw/remote/proxy.h       |   2 +
>  hw/remote/memory-sync.c         | 210
> ++++++++++++++++++++++++++++++++++++++++
>  hw/remote/message.c             |   5 +
>  hw/remote/proxy.c               |   6 ++
>  MAINTAINERS                     |   2 +
>  hw/remote/meson.build           |   1 +
>  7 files changed, 253 insertions(+)
>  create mode 100644 include/hw/remote/memory-sync.h
>  create mode 100644 hw/remote/memory-sync.c
>
> diff --git a/include/hw/remote/memory-sync.h
> b/include/hw/remote/memory-sync.h
> new file mode 100644
> index 0000000..785f76a
> --- /dev/null
> +++ b/include/hw/remote/memory-sync.h
> @@ -0,0 +1,27 @@
> +/*
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef MEMORY_SYNC_H
> +#define MEMORY_SYNC_H
> +
> +#include "exec/memory.h"
> +#include "io/channel.h"
> +
> +typedef struct RemoteMemSync {
> +    MemoryListener listener;
> +
> +    int n_mr_sections;
> +    MemoryRegionSection *mr_sections;
> +
> +    QIOChannel *ioc;
> +} RemoteMemSync;
> +
> +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc);
> +void deconfigure_memory_sync(RemoteMemSync *sync);
>

RemoteMemSync vs MemorySync, and function with _memory_sync suffixes...
Naming things is hard, but trying to be consistent generally helps.

My understanding is that this is a proxy-dev helper to handle memory
listening and sending SYNC_SYSMEM.

I would thus suggest naming it ProxyMemoryListener. It could eventually be
folded in proxy.c

Please try to be consistent with header naming, structure naming, type,
functions and enum prefixes etc.

proxy_memory_listener isn't that long imho.

+
> +#endif
> diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
> index e29c61b..a687b7d 100644
> --- a/include/hw/remote/proxy.h
> +++ b/include/hw/remote/proxy.h
> @@ -11,6 +11,7 @@
>
>  #include "hw/pci/pci.h"
>  #include "io/channel.h"
> +#include "hw/remote/memory-sync.h"
>
>  #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
>
> @@ -40,6 +41,7 @@ struct PCIProxyDev {
>      QemuMutex io_mutex;
>      QIOChannel *ioc;
>      Error *migration_blocker;
> +    RemoteMemSync sync;
>      ProxyMemoryRegion region[PCI_NUM_REGIONS];
>  };
>
> diff --git a/hw/remote/memory-sync.c b/hw/remote/memory-sync.c
> new file mode 100644
> index 0000000..2365e69
> --- /dev/null
> +++ b/hw/remote/memory-sync.c
> @@ -0,0 +1,210 @@
> +/*
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
> +#include "qemu/compiler.h"
> +#include "qemu/int128.h"
> +#include "qemu/range.h"
> +#include "exec/memory.h"
> +#include "exec/cpu-common.h"
> +#include "cpu.h"
> +#include "exec/ram_addr.h"
> +#include "exec/address-spaces.h"
> +#include "hw/remote/mpqemu-link.h"
> +#include "hw/remote/memory-sync.h"
> +
> +static void proxy_ml_begin(MemoryListener *listener)
>

I suggest to rename begin -> reset

+{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, listen=
er);
> +    int mrs;
> +
> +    for (mrs =3D 0; mrs < sync->n_mr_sections; mrs++) {
> +        memory_region_unref(sync->mr_sections[mrs].mr);
> +    }
> +
> +    g_free(sync->mr_sections);
> +    sync->mr_sections =3D NULL;
> +    sync->n_mr_sections =3D 0;
> +}
> +
> +static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)
>

This function is very similar to vhost_user_get_mr_data(). That suggests we
could factor the code.

Perhaps a new memory_region_from_host_full(), or extend
memory_region_from_host() with an extra optional "int *fd" argument.


> +{
> +    MemoryRegion *mr;
> +    ram_addr_t off;
> +
> +    /**
> +     * Assumes that the host address is a valid address as it's
> +     * coming from the MemoryListener system. In the case host
> +     * address is not valid, the following call would return
> +     * the default subregion of "system_memory" region, and
> +     * not NULL. So it's not possible to check for NULL here.
> +     */
> +    mr =3D memory_region_from_host((void *)(uintptr_t)host, &off);
> +
> +    if (offset) {
> +        *offset =3D off;
> +    }
> +
> +    return memory_region_get_fd(mr);
> +}
> +
> +static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, size_=
t
> size)
> +{
>

This seems similar to vhost_user_can_merge().

+    bool merge;
> +    int fd1, fd2;
> +
> +    fd1 =3D get_fd_from_hostaddr(host, NULL);
> +
> +    fd2 =3D get_fd_from_hostaddr(prev_host, NULL);
> +
> +    merge =3D (fd1 =3D=3D fd2);
>

This could be written in a simpler manner, ex:

if (get_fd_from_hostaddr(host, NULL) !=3D get_fd_from_hostaddr(prev_host,
NULL))
  return false

+
> +    merge &=3D ((prev_host + size) =3D=3D host);
>

That check could be done early on before doing the more expensive
memory_region_from_host() calls

+
> +    return merge;
> +}
> +
> +static bool try_merge(RemoteMemSync *sync, MemoryRegionSection *section)
> +{
> +    uint64_t mrs_size, mrs_gpa, mrs_page;
> +    MemoryRegionSection *prev_sec;
> +    bool merged =3D false;
> +    uintptr_t mrs_host;
> +    RAMBlock *mrs_rb;
> +
> +    if (!sync->n_mr_sections) {
> +        return false;
> +    }
> +
> +    mrs_rb =3D section->mr->ram_block;
> +    mrs_page =3D (uint64_t)qemu_ram_pagesize(mrs_rb);
> +    mrs_size =3D int128_get64(section->size);
> +    mrs_gpa =3D section->offset_within_address_space;
> +    mrs_host =3D (uintptr_t)memory_region_get_ram_ptr(section->mr) +
> +               section->offset_within_region;
> +
> +    if (get_fd_from_hostaddr(mrs_host, NULL) < 0) {
> +        return true;
> +    }
> +
> +    mrs_host =3D mrs_host & ~(mrs_page - 1);
> +    mrs_gpa =3D mrs_gpa & ~(mrs_page - 1);
> +    mrs_size =3D ROUND_UP(mrs_size, mrs_page);
> +
> +    prev_sec =3D sync->mr_sections + (sync->n_mr_sections - 1);
> +    uint64_t prev_gpa_start =3D prev_sec->offset_within_address_space;
> +    uint64_t prev_size =3D int128_get64(prev_sec->size);
> +    uint64_t prev_gpa_end   =3D range_get_last(prev_gpa_start, prev_size=
);
> +    uint64_t prev_host_start =3D
> +        (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr) +
> +        prev_sec->offset_within_region;
> +    uint64_t prev_host_end =3D range_get_last(prev_host_start, prev_size=
);
> +
> +    if (mrs_gpa <=3D (prev_gpa_end + 1)) {
> +        g_assert(mrs_gpa > prev_gpa_start);
> +
> +        if ((section->mr =3D=3D prev_sec->mr) &&
> +            proxy_mrs_can_merge(mrs_host, prev_host_start,
> +                                (mrs_gpa - prev_gpa_start))) {
> +            uint64_t max_end =3D MAX(prev_host_end, mrs_host + mrs_size)=
;
> +            merged =3D true;
> +            prev_sec->offset_within_address_space =3D
> +                MIN(prev_gpa_start, mrs_gpa);
> +            prev_sec->offset_within_region =3D
> +                MIN(prev_host_start, mrs_host) -
> +                (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr);
> +            prev_sec->size =3D int128_make64(max_end - MIN(prev_host_sta=
rt,
> +                                                         mrs_host));
> +        }
> +    }
> +
> +    return merged;
> +}
> +
> +static void proxy_ml_region_addnop(MemoryListener *listener,
> +                                   MemoryRegionSection *section)
> +{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, listen=
er);
> +
> +    if (!(memory_region_is_ram(section->mr) &&
> +          !memory_region_is_rom(section->mr))) {
> +        return;
>

A bit clearer in vhost.c:
if (memory_region_is_ram(mr) && !memory_region_is_rom(mr)) {


> +    }
> +
> +    if (try_merge(sync, section)) {
> +        return;
> +    }
> +
> +    ++sync->n_mr_sections;
> +    sync->mr_sections =3D g_renew(MemoryRegionSection, sync->mr_sections=
,
> +                                sync->n_mr_sections);
> +    sync->mr_sections[sync->n_mr_sections - 1] =3D *section;
> +    sync->mr_sections[sync->n_mr_sections - 1].fv =3D NULL;
> +    memory_region_ref(section->mr);
> +}
> +
> +static void proxy_ml_commit(MemoryListener *listener)
> +{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, listen=
er);
> +    MPQemuMsg msg;
> +    MemoryRegionSection *section;
> +    ram_addr_t offset;
> +    uintptr_t host_addr;
> +    int region;
> +    Error *local_err =3D NULL;
> +
> +    memset(&msg, 0, sizeof(MPQemuMsg));
> +
> +    msg.cmd =3D SYNC_SYSMEM;
> +    msg.num_fds =3D sync->n_mr_sections;
> +    msg.size =3D sizeof(SyncSysmemMsg);
> +    if (msg.num_fds > REMOTE_MAX_FDS) {
> +        error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
> +        return;
> +    }
> +
> +    for (region =3D 0; region < sync->n_mr_sections; region++) {
> +        section =3D &sync->mr_sections[region];
> +        msg.data.sync_sysmem.gpas[region] =3D
> +            section->offset_within_address_space;
> +        msg.data.sync_sysmem.sizes[region] =3D int128_get64(section->siz=
e);
> +        host_addr =3D (uintptr_t)memory_region_get_ram_ptr(section->mr) =
+
> +                    section->offset_within_region;
> +        msg.fds[region] =3D get_fd_from_hostaddr(host_addr, &offset);
> +        msg.data.sync_sysmem.offsets[region] =3D offset;
> +    }
> +    mpqemu_msg_send(&msg, sync->ioc, &local_err);
> +    if (local_err) {
> +        error_report("Error in sending command %d", msg.cmd);
> +    }
> +}
>

That whole complex code above duplicates much of the logic in vhost.c. Can
we try to factorize it instead?

+
> +void deconfigure_memory_sync(RemoteMemSync *sync)
> +{
> +    memory_listener_unregister(&sync->listener);
> +
> +    proxy_ml_begin(&sync->listener);
> +}
> +
> +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc)
> +{
> +    sync->n_mr_sections =3D 0;
> +    sync->mr_sections =3D NULL;
> +
> +    sync->ioc =3D ioc;
> +
> +    sync->listener.begin =3D proxy_ml_begin;
> +    sync->listener.commit =3D proxy_ml_commit;
> +    sync->listener.region_add =3D proxy_ml_region_addnop;
> +    sync->listener.region_nop =3D proxy_ml_region_addnop;
> +    sync->listener.priority =3D 10;
> +
> +    memory_listener_register(&sync->listener, &address_space_memory);
> +}
> diff --git a/hw/remote/message.c b/hw/remote/message.c
> index 0f3e38a..454fd2d 100644
> --- a/hw/remote/message.c
> +++ b/hw/remote/message.c
> @@ -17,6 +17,7 @@
>  #include "sysemu/runstate.h"
>  #include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
> +#include "hw/remote/memory.h"
>
>  static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
>                                   MPQemuMsg *msg);
> @@ -64,6 +65,10 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data=
)
>          case BAR_READ:
>              process_bar_read(com->ioc, &msg, &local_err);
>              break;
> +        case SYNC_SYSMEM:
> +            remote_sysmem_reconfig(&msg, &local_err);
> +            break;
> +
>          default:
>              error_setg(&local_err,
>                         "Unknown command (%d) received for device %s
> (pid=3D%d)",
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 039347d..0f2d1aa 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -18,6 +18,8 @@
>  #include "migration/blocker.h"
>  #include "hw/remote/mpqemu-link.h"
>  #include "qemu/error-report.h"
> +#include "hw/remote/memory-sync.h"
> +#include "qom/object.h"
>
>  static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
>  {
> @@ -58,6 +60,8 @@ static void pci_proxy_dev_realize(PCIDevice *device,
> Error **errp)
>
>      qemu_mutex_init(&dev->io_mutex);
>      qio_channel_set_blocking(dev->ioc, true, NULL);
> +
> +    configure_memory_sync(&dev->sync, dev->ioc);
>  }
>
>  static void pci_proxy_dev_exit(PCIDevice *pdev)
> @@ -69,6 +73,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
>      migrate_del_blocker(dev->migration_blocker);
>
>      error_free(dev->migration_blocker);
> +
> +    deconfigure_memory_sync(&dev->sync);
>  }
>
>  static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *va=
l,
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebd1d1d..5d78b78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3150,6 +3150,8 @@ F: include/hw/remote/memory.h
>  F: hw/remote/memory.c
>  F: hw/remote/proxy.c
>  F: include/hw/remote/proxy.h
> +F: hw/remote/memory-sync.c
> +F: include/hw/remote/memory-sync.h
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 569cd20..7d434a5 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('remote-obj.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
>
>  specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
> +specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('memory-sync.c'))
>
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000034811f05b5f454e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Add memory-listener object which is used to keep the view of the RAM<br=
>
in sync between QEMU and remote process.<br>
A MemoryListener is registered for system-memory AddressSpace. The<br>
listener sends SYNC_SYSMEM message to the remote process when memory<br>
listener commits the changes to memory, the remote process receives<br>
the message and processes it in the handler for SYNC_SYSMEM message.<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/memory-sync.h |=C2=A0 27 ++++++<br>
=C2=A0include/hw/remote/proxy.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +=
<br>
=C2=A0hw/remote/memory-sync.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 210 ++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
=C2=A0hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 ++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A07 files changed, 253 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/memory-sync.h<br>
=C2=A0create mode 100644 hw/remote/memory-sync.c<br>
<br>
diff --git a/include/hw/remote/memory-sync.h b/include/hw/remote/memory-syn=
c.h<br>
new file mode 100644<br>
index 0000000..785f76a<br>
--- /dev/null<br>
+++ b/include/hw/remote/memory-sync.h<br>
@@ -0,0 +1,27 @@<br>
+/*<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef MEMORY_SYNC_H<br>
+#define MEMORY_SYNC_H<br>
+<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+<br>
+typedef struct RemoteMemSync {<br>
+=C2=A0 =C2=A0 MemoryListener listener;<br>
+<br>
+=C2=A0 =C2=A0 int n_mr_sections;<br>
+=C2=A0 =C2=A0 MemoryRegionSection *mr_sections;<br>
+<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+} RemoteMemSync;<br>
+<br>
+void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc);<br>
+void deconfigure_memory_sync(RemoteMemSync *sync);<br></blockquote><div><b=
r></div><div><div>RemoteMemSync vs MemorySync, and function with _memory_sy=
nc suffixes...<br></div>Naming things is hard, but trying to be consistent =
generally helps.</div><div><br></div><div>My understanding is that this is =
a proxy-dev helper to handle memory listening and sending SYNC_SYSMEM.</div=
><div><br></div><div>I would thus suggest naming it ProxyMemoryListener. It=
 could eventually be folded in proxy.c</div><div><br></div><div>Please try =
to be consistent with header naming, structure naming, type, functions and =
enum prefixes etc.</div><div><br></div><div>proxy_memory_listener isn&#39;t=
 that long imho.<br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
+#endif<br>
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h<br>
index e29c61b..a687b7d 100644<br>
--- a/include/hw/remote/proxy.h<br>
+++ b/include/hw/remote/proxy.h<br>
@@ -11,6 +11,7 @@<br>
<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;io/channel.h&quot;<br>
+#include &quot;hw/remote/memory-sync.h&quot;<br>
<br>
=C2=A0#define TYPE_PCI_PROXY_DEV &quot;x-pci-proxy-dev&quot;<br>
<br>
@@ -40,6 +41,7 @@ struct PCIProxyDev {<br>
=C2=A0 =C2=A0 =C2=A0QemuMutex io_mutex;<br>
=C2=A0 =C2=A0 =C2=A0QIOChannel *ioc;<br>
=C2=A0 =C2=A0 =C2=A0Error *migration_blocker;<br>
+=C2=A0 =C2=A0 RemoteMemSync sync;<br>
=C2=A0 =C2=A0 =C2=A0ProxyMemoryRegion region[PCI_NUM_REGIONS];<br>
=C2=A0};<br>
<br>
diff --git a/hw/remote/memory-sync.c b/hw/remote/memory-sync.c<br>
new file mode 100644<br>
index 0000000..2365e69<br>
--- /dev/null<br>
+++ b/hw/remote/memory-sync.c<br>
@@ -0,0 +1,210 @@<br>
+/*<br>
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
+#include &quot;qemu/compiler.h&quot;<br>
+#include &quot;qemu/int128.h&quot;<br>
+#include &quot;qemu/range.h&quot;<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;exec/cpu-common.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;exec/ram_addr.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;hw/remote/mpqemu-link.h&quot;<br>
+#include &quot;hw/remote/memory-sync.h&quot;<br>
+<br>
+static void proxy_ml_begin(MemoryListener *listener)<br></blockquote><div>=
<br></div><div>I suggest to rename begin -&gt; reset <br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMemSync=
, listener);<br>
+=C2=A0 =C2=A0 int mrs;<br>
+<br>
+=C2=A0 =C2=A0 for (mrs =3D 0; mrs &lt; sync-&gt;n_mr_sections; mrs++) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_unref(sync-&gt;mr_sections[mrs].=
mr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(sync-&gt;mr_sections);<br>
+=C2=A0 =C2=A0 sync-&gt;mr_sections =3D NULL;<br>
+=C2=A0 =C2=A0 sync-&gt;n_mr_sections =3D 0;<br>
+}<br>
+<br>
+static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)<br>
</blockquote><div><br></div><div>This function is very similar to vhost_use=
r_get_mr_data(). That suggests we could factor the code.</div><div><br></di=
v><div>Perhaps a new memory_region_from_host_full(), or extend memory_regio=
n_from_host() with an extra optional &quot;int *fd&quot; argument.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+{<br>
+=C2=A0 =C2=A0 MemoryRegion *mr;<br>
+=C2=A0 =C2=A0 ram_addr_t off;<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Assumes that the host address is a valid address as =
it&#39;s<br>
+=C2=A0 =C2=A0 =C2=A0* coming from the MemoryListener system. In the case h=
ost<br>
+=C2=A0 =C2=A0 =C2=A0* address is not valid, the following call would retur=
n<br>
+=C2=A0 =C2=A0 =C2=A0* the default subregion of &quot;system_memory&quot; r=
egion, and<br>
+=C2=A0 =C2=A0 =C2=A0* not NULL. So it&#39;s not possible to check for NULL=
 here.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 mr =3D memory_region_from_host((void *)(uintptr_t)host, &amp=
;off);<br>
+<br>
+=C2=A0 =C2=A0 if (offset) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *offset =3D off;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return memory_region_get_fd(mr);<br>
+}<br>
+<br>
+static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, size_t =
size)<br>
+{<br></blockquote><div><br></div><div>This seems similar to vhost_user_can=
_merge(). <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 bool merge;<br>
+=C2=A0 =C2=A0 int fd1, fd2;<br>
+<br>
+=C2=A0 =C2=A0 fd1 =3D get_fd_from_hostaddr(host, NULL);<br>
+<br>
+=C2=A0 =C2=A0 fd2 =3D get_fd_from_hostaddr(prev_host, NULL);<br>
+<br>
+=C2=A0 =C2=A0 merge =3D (fd1 =3D=3D fd2);<br></blockquote><div><br></div><=
div>This could be written in a simpler manner, ex:<br></div><div><br></div>=
<div>if (get_fd_from_hostaddr(host, NULL) !=3D get_fd_from_hostaddr(prev_ho=
st, NULL))</div><div>=C2=A0 return false<br></div><div> <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 merge &amp;=3D ((prev_host + size) =3D=3D host);<br></blockq=
uote><div><br></div><div>That check could be done early on before doing the=
 more expensive memory_region_from_host() calls</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 return merge;<br>
+}<br>
+<br>
+static bool try_merge(RemoteMemSync *sync, MemoryRegionSection *section)<b=
r>
+{<br>
+=C2=A0 =C2=A0 uint64_t mrs_size, mrs_gpa, mrs_page;<br>
+=C2=A0 =C2=A0 MemoryRegionSection *prev_sec;<br>
+=C2=A0 =C2=A0 bool merged =3D false;<br>
+=C2=A0 =C2=A0 uintptr_t mrs_host;<br>
+=C2=A0 =C2=A0 RAMBlock *mrs_rb;<br>
+<br>
+=C2=A0 =C2=A0 if (!sync-&gt;n_mr_sections) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 mrs_rb =3D section-&gt;mr-&gt;ram_block;<br>
+=C2=A0 =C2=A0 mrs_page =3D (uint64_t)qemu_ram_pagesize(mrs_rb);<br>
+=C2=A0 =C2=A0 mrs_size =3D int128_get64(section-&gt;size);<br>
+=C2=A0 =C2=A0 mrs_gpa =3D section-&gt;offset_within_address_space;<br>
+=C2=A0 =C2=A0 mrs_host =3D (uintptr_t)memory_region_get_ram_ptr(section-&g=
t;mr) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section-&gt;offset_=
within_region;<br>
+<br>
+=C2=A0 =C2=A0 if (get_fd_from_hostaddr(mrs_host, NULL) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 mrs_host =3D mrs_host &amp; ~(mrs_page - 1);<br>
+=C2=A0 =C2=A0 mrs_gpa =3D mrs_gpa &amp; ~(mrs_page - 1);<br>
+=C2=A0 =C2=A0 mrs_size =3D ROUND_UP(mrs_size, mrs_page);<br>
+<br>
+=C2=A0 =C2=A0 prev_sec =3D sync-&gt;mr_sections + (sync-&gt;n_mr_sections =
- 1);<br>
+=C2=A0 =C2=A0 uint64_t prev_gpa_start =3D prev_sec-&gt;offset_within_addre=
ss_space;<br>
+=C2=A0 =C2=A0 uint64_t prev_size =3D int128_get64(prev_sec-&gt;size);<br>
+=C2=A0 =C2=A0 uint64_t prev_gpa_end=C2=A0 =C2=A0=3D range_get_last(prev_gp=
a_start, prev_size);<br>
+=C2=A0 =C2=A0 uint64_t prev_host_start =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintptr_t)memory_region_get_ram_ptr(prev_sec-=
&gt;mr) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_region;<br>
+=C2=A0 =C2=A0 uint64_t prev_host_end =3D range_get_last(prev_host_start, p=
rev_size);<br>
+<br>
+=C2=A0 =C2=A0 if (mrs_gpa &lt;=3D (prev_gpa_end + 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(mrs_gpa &gt; prev_gpa_start);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((section-&gt;mr =3D=3D prev_sec-&gt;mr) &a=
mp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_mrs_can_merge(mrs_host, pr=
ev_host_start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mrs_gpa - prev_gpa_start))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t max_end =3D MAX(prev_ho=
st_end, mrs_host + mrs_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 merged =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_addre=
ss_space =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(prev_gpa_start=
, mrs_gpa);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;offset_within_regio=
n =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(prev_host_star=
t, mrs_host) -<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintptr_t)memory_=
region_get_ram_ptr(prev_sec-&gt;mr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_sec-&gt;size =3D int128_mak=
e64(max_end - MIN(prev_host_start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mrs_host));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return merged;<br>
+}<br>
+<br>
+static void proxy_ml_region_addnop(MemoryListener *listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection *se=
ction)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMemSync=
, listener);<br>
+<br>
+=C2=A0 =C2=A0 if (!(memory_region_is_ram(section-&gt;mr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !memory_region_is_rom(section-&gt;mr)))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br></blockquote><div><br></div><div>A =
bit clearer in vhost.c:<br></div><div>if (memory_region_is_ram(mr) &amp;&am=
p; !memory_region_is_rom(mr)) {</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (try_merge(sync, section)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ++sync-&gt;n_mr_sections;<br>
+=C2=A0 =C2=A0 sync-&gt;mr_sections =3D g_renew(MemoryRegionSection, sync-&=
gt;mr_sections,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync-&gt;n_mr_sections);<br>
+=C2=A0 =C2=A0 sync-&gt;mr_sections[sync-&gt;n_mr_sections - 1] =3D *sectio=
n;<br>
+=C2=A0 =C2=A0 sync-&gt;mr_sections[sync-&gt;n_mr_sections - 1].fv =3D NULL=
;<br>
+=C2=A0 =C2=A0 memory_region_ref(section-&gt;mr);<br>
+}<br>
+<br>
+static void proxy_ml_commit(MemoryListener *listener)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteMemSync *sync =3D container_of(listener, RemoteMemSync=
, listener);<br>
+=C2=A0 =C2=A0 MPQemuMsg msg;<br>
+=C2=A0 =C2=A0 MemoryRegionSection *section;<br>
+=C2=A0 =C2=A0 ram_addr_t offset;<br>
+=C2=A0 =C2=A0 uintptr_t host_addr;<br>
+=C2=A0 =C2=A0 int region;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;msg, 0, sizeof(MPQemuMsg));<br>
+<br>
+=C2=A0 =C2=A0 msg.cmd =3D SYNC_SYSMEM;<br>
+=C2=A0 =C2=A0 msg.num_fds =3D sync-&gt;n_mr_sections;<br>
+=C2=A0 =C2=A0 msg.size =3D sizeof(SyncSysmemMsg);<br>
+=C2=A0 =C2=A0 if (msg.num_fds &gt; REMOTE_MAX_FDS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Number of fds is more than =
%d&quot;, REMOTE_MAX_FDS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (region =3D 0; region &lt; sync-&gt;n_mr_sections; regio=
n++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 section =3D &amp;sync-&gt;mr_sections[region];=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.gpas[region] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&gt;offset_within_addres=
s_space;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.sizes[region] =3D int128_=
get64(section-&gt;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_addr =3D (uintptr_t)memory_region_get_ram=
_ptr(section-&gt;mr) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sect=
ion-&gt;offset_within_region;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.fds[region] =3D get_fd_from_hostaddr(host_=
addr, &amp;offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data.sync_sysmem.offsets[region] =3D offse=
t;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 mpqemu_msg_send(&amp;msg, sync-&gt;ioc, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Error in sending command %d=
&quot;, msg.cmd);<br>
+=C2=A0 =C2=A0 }<br>
+}<br></blockquote><div><br></div><div>That whole complex code above duplic=
ates much of the logic in vhost.c. Can we try to factorize it instead?</div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+void deconfigure_memory_sync(RemoteMemSync *sync)<br>
+{<br>
+=C2=A0 =C2=A0 memory_listener_unregister(&amp;sync-&gt;listener);<br>
+<br>
+=C2=A0 =C2=A0 proxy_ml_begin(&amp;sync-&gt;listener);<br>
+}<br>
+<br>
+void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc)<br>
+{<br>
+=C2=A0 =C2=A0 sync-&gt;n_mr_sections =3D 0;<br>
+=C2=A0 =C2=A0 sync-&gt;mr_sections =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 sync-&gt;ioc =3D ioc;<br>
+<br>
+=C2=A0 =C2=A0 sync-&gt;listener.begin =3D proxy_ml_begin;<br>
+=C2=A0 =C2=A0 sync-&gt;listener.commit =3D proxy_ml_commit;<br>
+=C2=A0 =C2=A0 sync-&gt;listener.region_add =3D proxy_ml_region_addnop;<br>
+=C2=A0 =C2=A0 sync-&gt;listener.region_nop =3D proxy_ml_region_addnop;<br>
+=C2=A0 =C2=A0 sync-&gt;listener.priority =3D 10;<br>
+<br>
+=C2=A0 =C2=A0 memory_listener_register(&amp;sync-&gt;listener, &amp;addres=
s_space_memory);<br>
+}<br>
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
index 0f3e38a..454fd2d 100644<br>
--- a/hw/remote/message.c<br>
+++ b/hw/remote/message.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;exec/memattrs.h&quot;<br>
+#include &quot;hw/remote/memory.h&quot;<br>
<br>
=C2=A0static void process_config_write(QIOChannel *ioc, PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPQemuMsg *msg);<br>
@@ -64,6 +65,10 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case BAR_READ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process_bar_read(com-&gt;io=
c, &amp;msg, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SYNC_SYSMEM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_sysmem_reconfig(&amp;msg,=
 &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(&amp;local_err,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Unknown command (%d) received for device %s (pid=3D%d)&quo=
t;,<br>
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c<br>
index 039347d..0f2d1aa 100644<br>
--- a/hw/remote/proxy.c<br>
+++ b/hw/remote/proxy.c<br>
@@ -18,6 +18,8 @@<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
=C2=A0#include &quot;hw/remote/mpqemu-link.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;hw/remote/memory-sync.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
<br>
=C2=A0static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)=
<br>
=C2=A0{<br>
@@ -58,6 +60,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Erro=
r **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_init(&amp;dev-&gt;io_mutex);<br>
=C2=A0 =C2=A0 =C2=A0qio_channel_set_blocking(dev-&gt;ioc, true, NULL);<br>
+<br>
+=C2=A0 =C2=A0 configure_memory_sync(&amp;dev-&gt;sync, dev-&gt;ioc);<br>
=C2=A0}<br>
<br>
=C2=A0static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
@@ -69,6 +73,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
=C2=A0 =C2=A0 =C2=A0migrate_del_blocker(dev-&gt;migration_blocker);<br>
<br>
=C2=A0 =C2=A0 =C2=A0error_free(dev-&gt;migration_blocker);<br>
+<br>
+=C2=A0 =C2=A0 deconfigure_memory_sync(&amp;dev-&gt;sync);<br>
=C2=A0}<br>
<br>
=C2=A0static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t =
*val,<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index ebd1d1d..5d78b78 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3150,6 +3150,8 @@ F: include/hw/remote/memory.h<br>
=C2=A0F: hw/remote/memory.c<br>
=C2=A0F: hw/remote/proxy.c<br>
=C2=A0F: include/hw/remote/proxy.h<br>
+F: hw/remote/memory-sync.c<br>
+F: include/hw/remote/memory-sync.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index 569cd20..7d434a5 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -7,5 +7,6 @@ remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true:=
 files(&#39;remote-obj.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;proxy.c&#39;))<br>
<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&=
#39;memory.c&#39;))<br>
+specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;m=
emory-sync.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remo=
te_ss)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000034811f05b5f454e3--

