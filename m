Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84BD65D202
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2UC-00070c-Q1; Wed, 04 Jan 2023 07:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD2TT-0006wZ-6R
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:02:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD2TD-0007eY-VV
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672833728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8KxwTyaXbrN6sMcj/YnKX+S50NX5oIvZGNArFROsxg=;
 b=SGPPGDVqHMwjr0NKzb/y4m/2RClSkahnab8jDrOoCZ/JbNKyXFKo4MhysX1l7dAjh8CYIL
 47SHtRqsg0+soqvvgDdXVT5Ngj8dVYeIMcY4fmIzH0Lj3uC6UesysHQ8Rf7B7O7Buw+Qo3
 Xy0THsJb4xIiFzEQvLkgH1X26uVO+A0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-CX6iqpfMN9q5Bzf8uOQ1_g-1; Wed, 04 Jan 2023 07:02:04 -0500
X-MC-Unique: CX6iqpfMN9q5Bzf8uOQ1_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 t18-20020adfa2d2000000b00277e6c6f275so3111474wra.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8KxwTyaXbrN6sMcj/YnKX+S50NX5oIvZGNArFROsxg=;
 b=KjVw7xlOj9ZzI+660SKJxuqWUyoCZwAVHmMfv/jfSMdS2fDe3s9wMarmxTjaRir/Df
 SuTpKArwhU4sPQ4MJoVT38uTCmxvCOO0R7p5Bn41Ua0EJJignWLTFlOjAecSfuf6VFa8
 fEmSJA7tNryLICfG5YUeTImAB0X5SZQobddaHhgwfKUpacD9mONhYlStWADBLbJw77j/
 vmbRpwsNPoMylysuo4OujBWHswaAh1S8T6gx1lF4NxG0TbBA9pzFVRbrFJtAQQp3hdhm
 CaBqBQ6QYej73gRe+4vUWjnhhoGyiskV5aM0OL/9c2cG43PT4lJbE8+i7VLZTXl1JGbB
 5iOw==
X-Gm-Message-State: AFqh2kr+5Kaga28UXP8KNejPSGx1w+Gfj/MQoIRCnARqcfBsCazrJw3l
 2w3oHKSr+HOM67CsjsQI2geCVqym5ScJ6jKXSMfHnqPjpzMpu2A8z98VUX224XkXmtELEQ/WAWQ
 qfhBWpfHi6YLxz6Q=
X-Received: by 2002:a05:600c:a10:b0:3d2:2904:dfe9 with SMTP id
 z16-20020a05600c0a1000b003d22904dfe9mr37703353wmp.21.1672833717085; 
 Wed, 04 Jan 2023 04:01:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxD4KMEOv5WzRHscVxzNBUMl/BmeJpvf8zQZqk+ovwP2Dc+02tMvxhyNgpkN8PzAhc9mI2tg==
X-Received: by 2002:a05:600c:a10:b0:3d2:2904:dfe9 with SMTP id
 z16-20020a05600c0a1000b003d22904dfe9mr37703324wmp.21.1672833716663; 
 Wed, 04 Jan 2023 04:01:56 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c13c800b003cfd58409desm48381731wmg.13.2023.01.04.04.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 04:01:56 -0800 (PST)
Date: Wed, 4 Jan 2023 12:01:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v5 51/52] hw/xen: Add xen_xenstore device for
 xenstore emulation
Message-ID: <Y7VqsgBgK5XYkvzE@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-52-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230121235.1282915-52-dwmw2@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* David Woodhouse (dwmw2@infradead.org) wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The hookup to event channel is a bit of a special case hack right now; as
> we make this work for real PV driver back ends, that will be implemented
> for the general case of Dom0 ports binding to DomU.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/i386/kvm/meson.build    |   1 +
>  hw/i386/kvm/xen_evtchn.c   |   1 +
>  hw/i386/kvm/xen_xenstore.c | 248 +++++++++++++++++++++++++++++++++++++
>  hw/i386/kvm/xen_xenstore.h |  20 +++
>  hw/i386/pc.c               |   2 +
>  target/i386/kvm/xen-emu.c  |  12 ++
>  6 files changed, 284 insertions(+)
>  create mode 100644 hw/i386/kvm/xen_xenstore.c
>  create mode 100644 hw/i386/kvm/xen_xenstore.h
> 
> diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
> index e02449e4d4..6d6981fced 100644
> --- a/hw/i386/kvm/meson.build
> +++ b/hw/i386/kvm/meson.build
> @@ -8,6 +8,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
>    'xen_overlay.c',
>    'xen_evtchn.c',
>    'xen_gnttab.c',
> +  'xen_xenstore.c',
>    ))
>  
>  i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index c0f6ef9dff..0653cad3bb 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -31,6 +31,7 @@
>  
>  #include "xen_evtchn.h"
>  #include "xen_overlay.h"
> +#include "xen_xenstore.h"
>  
>  #include "sysemu/kvm.h"
>  #include "sysemu/kvm_xen.h"
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> new file mode 100644
> index 0000000000..63530059fa
> --- /dev/null
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -0,0 +1,248 @@
> +/*
> + * QEMU Xen emulation: Shared/overlay pages support
> + *
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/host-utils.h"
> +#include "qemu/module.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/cutils.h"
> +#include "qapi/error.h"
> +#include "qom/object.h"
> +#include "migration/vmstate.h"
> +
> +#include "hw/sysbus.h"
> +#include "hw/xen/xen.h"
> +#include "xen_overlay.h"
> +#include "xen_evtchn.h"
> +#include "xen_xenstore.h"
> +
> +#include "sysemu/kvm.h"
> +#include "sysemu/kvm_xen.h"
> +
> +#include "standard-headers/xen/io/xs_wire.h"
> +#include "standard-headers/xen/event_channel.h"
> +
> +#define TYPE_XEN_XENSTORE "xen-xenstore"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
> +
> +#define XEN_PAGE_SHIFT 12
> +#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
> +
> +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
> +
> +#define XENSTORE_HEADER_SIZE ((unsigned int)sizeof(struct xsd_sockmsg))
> +
> +struct XenXenstoreState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +
> +    MemoryRegion xenstore_page;
> +    struct xenstore_domain_interface *xs;
> +    uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
> +    uint8_t rsp_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
> +    uint32_t req_offset;
> +    uint32_t rsp_offset;
> +    bool rsp_pending;
> +    bool fatal_error;
> +
> +    evtchn_port_t guest_port;
> +    evtchn_port_t be_port;
> +    struct xenevtchn_handle *eh;
> +};
> +
> +struct XenXenstoreState *xen_xenstore_singleton;
> +
> +static void xen_xenstore_event(void *opaque);
> +
> +static void xen_xenstore_realize(DeviceState *dev, Error **errp)
> +{
> +    XenXenstoreState *s = XEN_XENSTORE(dev);
> +
> +    if (xen_mode != XEN_EMULATE) {
> +        error_setg(errp, "Xen xenstore support is for Xen emulation");
> +        return;
> +    }
> +    memory_region_init_ram(&s->xenstore_page, OBJECT(dev), "xen:xenstore_page",
> +                           XEN_PAGE_SIZE, &error_abort);
> +    memory_region_set_enabled(&s->xenstore_page, true);
> +    s->xs = memory_region_get_ram_ptr(&s->xenstore_page);
> +    memset(s->xs, 0, XEN_PAGE_SIZE);
> +
> +    /* We can't map it this early as KVM isn't ready */
> +    xen_xenstore_singleton = s;
> +
> +    s->eh = xen_be_evtchn_open(NULL, 0);
> +    if (!s->eh) {
> +        error_setg(errp, "Xenstore evtchn port init failed");
> +        return;
> +    }
> +    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
> +                       xen_xenstore_event, NULL, NULL, NULL, s);
> +}
> +
> +static bool xen_xenstore_is_needed(void *opaque)
> +{
> +    return xen_mode == XEN_EMULATE;
> +}
> +
> +static int xen_xenstore_pre_save(void *opaque)
> +{
> +    XenXenstoreState *s = opaque;
> +
> +    if (s->eh) {
> +        s->guest_port = xen_be_evtchn_get_guest_port(s->eh);
> +    }
> +    return 0;
> +}
> +
> +static int xen_xenstore_post_load(void *opaque, int ver)
> +{
> +    XenXenstoreState *s = opaque;
> +
> +    /*
> +     * As qemu/dom0, rebind to the guest's port. The Windows drivers may
> +     * unbind the XenStore evtchn and rebind to it, having obtained the
> +     * "remote" port through EVTCHNOP_status. In the case that migration
> +     * occurs while it's unbound, the "remote" port needs to be the same
> +     * as before so that the guest can find it, but should remain unbound.
> +     */
> +    if (s->guest_port) {
> +        int be_port = xen_be_evtchn_bind_interdomain(s->eh, xen_domid, s->guest_port);
> +        if (be_port < 0) {
> +            return be_port;
> +        }
> +        s->be_port = be_port;
> +    }
> +    return 0;
> +}
> +
> +static const VMStateDescription xen_xenstore_vmstate = {
> +    .name = "xen_xenstore",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = xen_xenstore_is_needed,
> +    .pre_save = xen_xenstore_pre_save,
> +    .post_load = xen_xenstore_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(req_data, XenXenstoreState, sizeof_field(XenXenstoreState, req_data)),
> +        VMSTATE_UINT8_ARRAY(rsp_data, XenXenstoreState, sizeof_field(XenXenstoreState, rsp_data)),
> +        VMSTATE_UINT32(req_offset, XenXenstoreState),
> +        VMSTATE_UINT32(rsp_offset, XenXenstoreState),
> +        VMSTATE_BOOL(rsp_pending, XenXenstoreState),
> +        VMSTATE_UINT32(guest_port, XenXenstoreState),
> +        VMSTATE_BOOL(fatal_error, XenXenstoreState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void xen_xenstore_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = xen_xenstore_realize;
> +    dc->vmsd = &xen_xenstore_vmstate;
> +}
> +
> +static const TypeInfo xen_xenstore_info = {
> +    .name          = TYPE_XEN_XENSTORE,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XenXenstoreState),
> +    .class_init    = xen_xenstore_class_init,
> +};
> +
> +void xen_xenstore_create(void)
> +{
> +    xen_xenstore_singleton = XEN_XENSTORE(sysbus_create_simple(TYPE_XEN_XENSTORE,
> +                                                           -1, NULL));
> +
> +    /*
> +     * Defer the init (xen_xenstore_reset()) until KVM is set up and the
> +     * overlay page can be mapped.
> +     */
> +}
> +
> +static void xen_xenstore_register_types(void)
> +{
> +    type_register_static(&xen_xenstore_info);
> +}
> +
> +type_init(xen_xenstore_register_types)
> +
> +uint16_t xen_xenstore_get_port(void)
> +{
> +    XenXenstoreState *s = xen_xenstore_singleton;
> +    if (!s) {
> +        return 0;
> +    }
> +    return s->guest_port;
> +}
> +
> +static void xen_xenstore_event(void *opaque)
> +{
> +    XenXenstoreState *s = opaque;
> +    evtchn_port_t port = xen_be_evtchn_pending(s->eh);
> +    if (port != s->be_port) {
> +        return;
> +    }
> +    printf("xenstore event\n");
> +    /* We know this is a no-op. */
> +    xen_be_evtchn_unmask(s->eh, port);
> +    qemu_hexdump(stdout, "", s->xs, sizeof(*s->xs));

debug ?

Dave

> +    xen_be_evtchn_notify(s->eh, s->be_port);
> +}
> +
> +static void alloc_guest_port(XenXenstoreState *s)
> +{
> +    struct evtchn_alloc_unbound alloc = {
> +        .dom = DOMID_SELF,
> +        .remote_dom = DOMID_QEMU,
> +    };
> +
> +    if (!xen_evtchn_alloc_unbound_op(&alloc)) {
> +        s->guest_port = alloc.port;
> +    }
> +}
> +
> +int xen_xenstore_reset(void)
> +{
> +    XenXenstoreState *s = xen_xenstore_singleton;
> +    int err;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    s->req_offset = s->rsp_offset = 0;
> +    s->rsp_pending = false;
> +
> +    if (!memory_region_is_mapped(&s->xenstore_page)) {
> +        xen_overlay_map_page_locked(&s->xenstore_page,
> +                                    XEN_SPECIAL_PFN(XENSTORE) << TARGET_PAGE_BITS);
> +    }
> +
> +    alloc_guest_port(s);
> +
> +    /*
> +     * As qemu/dom0, bind to the guest's port. For incoming migration, this
> +     * will be unbound as the guest's evtchn table is overwritten. We then
> +     * rebind to the correct guest port in xen_xenstore_post_load().
> +     */
> +    err = xen_be_evtchn_bind_interdomain(s->eh, xen_domid, s->guest_port);
> +    if (err < 0) {
> +        return err;
> +    }
> +    s->be_port = err;
> +
> +    return 0;
> +}
> diff --git a/hw/i386/kvm/xen_xenstore.h b/hw/i386/kvm/xen_xenstore.h
> new file mode 100644
> index 0000000000..8c3768e075
> --- /dev/null
> +++ b/hw/i386/kvm/xen_xenstore.h
> @@ -0,0 +1,20 @@
> +/*
> + * QEMU Xen emulation: Xenstore emulation
> + *
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_XEN_XENSTORE_H
> +#define QEMU_XEN_XENSTORE_H
> +
> +void xen_xenstore_create(void);
> +int xen_xenstore_reset(void);
> +
> +uint16_t xen_xenstore_get_port(void);
> +
> +#endif /* QEMU_XEN_XENSTORE_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 4f044bc7da..104f52b119 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -92,6 +92,7 @@
>  #include "hw/i386/kvm/xen_overlay.h"
>  #include "hw/i386/kvm/xen_evtchn.h"
>  #include "hw/i386/kvm/xen_gnttab.h"
> +#include "hw/i386/kvm/xen_xenstore.h"
>  #include "hw/mem/memory-device.h"
>  #include "sysemu/replay.h"
>  #include "target/i386/cpu.h"
> @@ -1858,6 +1859,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
>          xen_overlay_create();
>          xen_evtchn_create();
>          xen_gnttab_create();
> +        xen_xenstore_create();
>      }
>  #endif
>      return 0;
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 08db4c0d9b..cb119f43c0 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -28,6 +28,7 @@
>  #include "hw/i386/kvm/xen_overlay.h"
>  #include "hw/i386/kvm/xen_evtchn.h"
>  #include "hw/i386/kvm/xen_gnttab.h"
> +#include "hw/i386/kvm/xen_xenstore.h"
>  
>  #include "standard-headers/xen/version.h"
>  #include "standard-headers/xen/sched.h"
> @@ -153,6 +154,9 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
>          return ret;
>      }
>  
> +    /* The page couldn't be overlaid until KVM was initialized */
> +    xen_xenstore_reset();
> +
>      return 0;
>  }
>  
> @@ -731,6 +735,9 @@ static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
>      case HVM_PARAM_STORE_PFN:
>          hp.value = XEN_SPECIAL_PFN(XENSTORE);
>          break;
> +    case HVM_PARAM_STORE_EVTCHN:
> +        hp.value = xen_xenstore_get_port();
> +        break;
>      default:
>          return false;
>      }
> @@ -1294,6 +1301,11 @@ static int kvm_xen_soft_reset(void)
>          return err;
>      }
>  
> +    err = xen_xenstore_reset();
> +    if (err) {
> +        return err;
> +    }
> +
>      return 0;
>  }
>  
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


