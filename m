Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49D48DCC4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:19:46 +0100 (CET)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83lJ-0002Ro-1Y
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:19:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83YG-0005RV-PJ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:06:18 -0500
Received: from [2607:f8b0:4864:20::629] (port=43667
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83YC-0006gq-Ge
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:06:15 -0500
Received: by mail-pl1-x629.google.com with SMTP id e19so10691659plc.10;
 Thu, 13 Jan 2022 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0g7as0Oz9kbFxnb80G4KbJfypGNayTQUejWDvd14G0w=;
 b=efBWcyaneqt6287OUGQuV0SFzsqRWi6oZ/8lLzGExTez7NKaFj8WuEFVNXDtVWZDOz
 BhB22sjCQO7+AIoBOcTSHE/m+aqXZDAKqrXTiXAKcGRT9BBg34FI/dkVL5NTpaC41Shq
 dRJWEBAzbjRASN+gZBLNkVMW3yeVKayEpq/I0HXNv8D2yA2p1ub7ce+mB0BxcMeOXLkp
 LOwkcnHDsOdtndYREdNKud5OFl7E5CDXApyYG2Hjk0L8hyFdBQOh4QIUbfHhNq2vZNuw
 I6Fz1B5bsZg605L8WWvOPPajxvVOHP9WNQ0MlHi0R0o2+moisDk3fZHMpyFSEv+qd8eU
 oTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0g7as0Oz9kbFxnb80G4KbJfypGNayTQUejWDvd14G0w=;
 b=w5WqRnuQM4b9hLd8fyekWAYP3kXJs3KsR69lX1HW9E0Fwq6Mf4Z6HorU6F+2KeAI9u
 jbpyv7ELIed+0lxhT1jKms/zX5e9t44omkVrCkGQa8qEwHcybSyFSjvRog+EFKGHpFDt
 xzPi9N+cbDiAjWi+4YvUsk40q2AF2iXvRZTLGBt5eeM52mvJe8UhH7/CkQ0pxSBoKgex
 PyrEbGwnE0R5okdHrkmCPCZKGeuRyIOE1M76VSek1vH2YmTinXD/VHDDNECaITibpf6B
 V8LXDZDrjrCQQzhFwM8auisQN9/B9VBaI5YrnM2MTPRAHIncffYMw4l11c9DTnPS32nd
 yTsw==
X-Gm-Message-State: AOAM533qM49bLdsYfjAiAAzTt2/FqRJAeAcr7b2Eiajx2epkSXZ8ELNG
 gqzHRZlmPhRl6RcSQg/GAsg38malRVhf8KqNCcw=
X-Google-Smtp-Source: ABdhPJxSu6q0VO1inlxILLLFE6NuJd8umuHtsTj+ghnZrWcrrsK5esuSv3cEapY2WVFQzH9ukZgPHeJWoQw5Cv9RW+U=
X-Received: by 2002:a17:902:d883:b0:14a:4ba5:6e72 with SMTP id
 b3-20020a170902d88300b0014a4ba56e72mr5462905plz.27.1642093570621; Thu, 13 Jan
 2022 09:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
 <20220113150113.58437-4-yaroshchuk2000@gmail.com>
 <CAMVc7JWVqG4TMJj_KeqRa-SJe7FqCPbcyP523bWHO4CPmQJ3iw@mail.gmail.com>
In-Reply-To: <CAMVc7JWVqG4TMJj_KeqRa-SJe7FqCPbcyP523bWHO4CPmQJ3iw@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Thu, 13 Jan 2022 20:05:58 +0300
Message-ID: <CADO9X9QXFri2VjVojsJc-mQNXJ=uy7xbZ66=OHPwmZbXMvG5zw@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f7079805d579b313"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7079805d579b313
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will fix it, thank you!

Actually this (wrong) check:

#if defined(MAC_OS_VERSION_11_0) && \
    MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0

worked fine on Catalina 10.15 for me cause the
MAC_OS_VERSION_11_0 was not introduced there and it
stopped on the 1st defined(MAC_OS_VERSION_11_0) check.
I should have tested this more thoroughly, my fault.

Now submitting v13 with MAC_OS_X_VERSION_MIN_REQUIRED.

--
Best Regards,

Vladislav Yaroshchuk


=D1=87=D1=82, 13 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 19:11, Akihiko Oda=
ki <akihiko.odaki@gmail.com>:

> On Fri, Jan 14, 2022 at 12:01 AM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> > Interaction with vmnet.framework in different modes
> > differs only on configuration stage, so we can create
> > common `send`, `receive`, etc. procedures and reuse them.
> >
> > vmnet.framework supports iov, but writing more than
> > one iov into vmnet interface fails with
> > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> > one and passing it to vmnet works fine. That's the
> > reason why receive_iov() left unimplemented. But it still
> > works with good enough performance having .receive()
> > implemented only.
> >
> > Also, there is no way to unsubscribe from vmnet packages
> > receiving except registering and unregistering event
> > callback or simply drop packages just ignoring and
> > not processing them when related flag is set. Here we do
> > using the second way.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >  net/vmnet-common.m | 313 +++++++++++++++++++++++++++++++++++++++++++++
> >  net/vmnet-shared.c |  83 +++++++++++-
> >  net/vmnet_int.h    |  23 ++++
> >  3 files changed, 415 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> > index 532d152840..45c983ac7f 100644
> > --- a/net/vmnet-common.m
> > +++ b/net/vmnet-common.m
> > @@ -10,6 +10,8 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/log.h"
> >  #include "qapi/qapi-types-net.h"
> >  #include "vmnet_int.h"
> >  #include "clients.h"
> > @@ -17,4 +19,315 @@
> >  #include "qapi/error.h"
> >
> >  #include <vmnet/vmnet.h>
> > +#include <dispatch/dispatch.h>
> >
> > +#ifdef DEBUG
> > +#define D(x) x
> > +#define D_LOG(...) qemu_log(__VA_ARGS__)
> > +#else
> > +#define D(x) do { } while (0)
> > +#define D_LOG(...) do { } while (0)
> > +#endif
> > +
> > +typedef struct vmpktdesc vmpktdesc_t;
> > +typedef struct iovec iovec_t;
> > +
> > +static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable)
> > +{
> > +    s->send_enabled =3D enable;
> > +}
> > +
> > +
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> > +    vmnet_set_send_enabled(s, true);
> > +}
> > +
> > +
> > +static void vmnet_send(NetClientState *nc,
> > +                       interface_event_t event_id,
> > +                       xpc_object_t event)
> > +{
> > +    assert(event_id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABLE);
> > +
> > +    VmnetCommonState *s;
> > +    uint64_t packets_available;
> > +
> > +    struct iovec *iov;
> > +    struct vmpktdesc *packets;
> > +    int pkt_cnt;
> > +    int i;
> > +
> > +    vmnet_return_t if_status;
> > +    ssize_t size;
> > +
> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> > +
> > +    packets_available =3D xpc_dictionary_get_uint64(
> > +        event,
> > +        vmnet_estimated_packets_available_key
> > +    );
> > +
> > +    pkt_cnt =3D (packets_available < VMNET_PACKETS_LIMIT) ?
> > +              packets_available :
> > +              VMNET_PACKETS_LIMIT;
> > +
> > +
> > +    iov =3D s->iov_buf;
> > +    packets =3D s->packets_buf;
> > +
> > +    for (i =3D 0; i < pkt_cnt; ++i) {
> > +        packets[i].vm_pkt_size =3D s->max_packet_size;
> > +        packets[i].vm_pkt_iovcnt =3D 1;
> > +        packets[i].vm_flags =3D 0;
> > +    }
> > +
> > +    if_status =3D vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> > +    if (if_status !=3D VMNET_SUCCESS) {
> > +        error_printf("vmnet: read failed: %s\n",
> > +                     vmnet_status_map_str(if_status));
> > +    }
> > +    qemu_mutex_lock_iothread();
> > +    for (i =3D 0; i < pkt_cnt; ++i) {
> > +        size =3D qemu_send_packet_async(nc,
> > +                                      iov[i].iov_base,
> > +                                      packets[i].vm_pkt_size,
> > +                                      vmnet_send_completed);
> > +        if (size =3D=3D 0) {
> > +            vmnet_set_send_enabled(s, false);
> > +        } else if (size < 0) {
> > +            break;
> > +        }
> > +    }
> > +    qemu_mutex_unlock_iothread();
> > +
> > +}
> > +
> > +
> > +static void vmnet_register_event_callback(VmnetCommonState *s)
> > +{
> > +    dispatch_queue_t avail_pkt_q =3D dispatch_queue_create(
> > +        "org.qemu.vmnet.if_queue",
> > +        DISPATCH_QUEUE_SERIAL
> > +    );
> > +
> > +    vmnet_interface_set_event_callback(
> > +        s->vmnet_if,
> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +        avail_pkt_q,
> > +        ^(interface_event_t event_id, xpc_object_t event) {
> > +          if (s->send_enabled) {
> > +              vmnet_send(&s->nc, event_id, event);
> > +          }
> > +        });
> > +}
> > +
> > +
> > +static void vmnet_bufs_init(VmnetCommonState *s)
> > +{
> > +    int i;
> > +    struct vmpktdesc *packets;
> > +    struct iovec *iov;
> > +
> > +    packets =3D s->packets_buf;
> > +    iov =3D s->iov_buf;
> > +
> > +    for (i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> > +        iov[i].iov_len =3D s->max_packet_size;
> > +        iov[i].iov_base =3D g_malloc0(iov[i].iov_len);
> > +        packets[i].vm_pkt_iov =3D iov + i;
> > +    }
> > +}
> > +
> > +
> > +const char *vmnet_status_map_str(vmnet_return_t status)
> > +{
> > +    switch (status) {
> > +    case VMNET_SUCCESS:
> > +        return "success";
> > +    case VMNET_FAILURE:
> > +        return "general failure";
> > +    case VMNET_MEM_FAILURE:
> > +        return "memory allocation failure";
> > +    case VMNET_INVALID_ARGUMENT:
> > +        return "invalid argument specified";
> > +    case VMNET_SETUP_INCOMPLETE:
> > +        return "interface setup is not complete";
> > +    case VMNET_INVALID_ACCESS:
> > +        return "invalid access, permission denied";
> > +    case VMNET_PACKET_TOO_BIG:
> > +        return "packet size is larger than MTU";
> > +    case VMNET_BUFFER_EXHAUSTED:
> > +        return "buffers exhausted in kernel";
> > +    case VMNET_TOO_MANY_PACKETS:
> > +        return "packet count exceeds limit";
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0
> > +    case VMNET_SHARING_SERVICE_BUSY:
> > +        return "conflict, sharing service is in use";
> > +#endif
> > +    default:
> > +        return "unknown vmnet error";
> > +    }
> > +}
> > +
> > +
> > +int vmnet_if_create(NetClientState *nc,
> > +                    xpc_object_t if_desc,
> > +                    Error **errp,
> > +                    void (*completion_callback)(xpc_object_t
> interface_param))
> > +{
> > +    VmnetCommonState *s;
> > +
> > +    dispatch_queue_t if_create_q;
> > +    dispatch_semaphore_t if_created_sem;
> > +
> > +    __block vmnet_return_t if_status;
> > +
> > +    if_create_q =3D dispatch_queue_create("org.qemu.vmnet.create",
> > +                                        DISPATCH_QUEUE_SERIAL);
> > +    if_created_sem =3D dispatch_semaphore_create(0);
> > +
> > +    xpc_dictionary_set_bool(
> > +        if_desc,
> > +        vmnet_allocate_mac_address_key,
> > +        false
> > +    );
> > +
> > +    D(D_LOG("vmnet.start.interface_desc:\n");
> > +    xpc_dictionary_apply(if_desc,
> > +                         ^bool(const char *k, xpc_object_t v) {
> > +                           char *desc =3D xpc_copy_description(v);
> > +                           D_LOG("  %s=3D%s\n", k, desc);
> > +                           free(desc);
> > +                           return true;
> > +                         }));
> > +
> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> > +    s->vmnet_if =3D vmnet_start_interface(
> > +        if_desc,
> > +        if_create_q,
> > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> > +          if_status =3D status;
> > +          if (status !=3D VMNET_SUCCESS || !interface_param) {
> > +              dispatch_semaphore_signal(if_created_sem);
> > +              return;
> > +          }
> > +
> > +          D(D_LOG("vmnet.start.interface_param:\n");
> > +                xpc_dictionary_apply(interface_param,
> > +                                     ^bool(const char *k, xpc_object_t
> v) {
> > +                                       char *desc =3D
> xpc_copy_description(v);
> > +                                       D_LOG("  %s=3D%s\n", k, desc);
> > +                                       free(desc);
> > +                                       return true;
> > +                                     }));
> > +
> > +          s->mtu =3D xpc_dictionary_get_uint64(
> > +              interface_param,
> > +              vmnet_mtu_key);
> > +          s->max_packet_size =3D xpc_dictionary_get_uint64(
> > +              interface_param,
> > +              vmnet_max_packet_size_key);
> > +
> > +          if (completion_callback) {
> > +              completion_callback(interface_param);
> > +          }
> > +          dispatch_semaphore_signal(if_created_sem);
> > +        });
> > +
> > +    if (s->vmnet_if =3D=3D NULL) {
> > +        error_setg(errp, "unable to create interface with requested
> params");
> > +        return -1;
> > +    }
> > +
> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> > +    dispatch_release(if_create_q);
> > +
> > +    if (if_status !=3D VMNET_SUCCESS) {
> > +        error_setg(errp,
> > +                   "cannot create vmnet interface: %s",
> > +                   vmnet_status_map_str(if_status));
> > +        return -1;
> > +    }
> > +
> > +    vmnet_register_event_callback(s);
> > +    vmnet_bufs_init(s);
> > +    vmnet_set_send_enabled(s, true);
> > +
> > +    return 0;
> > +}
> > +
> > +
> > +ssize_t vmnet_receive_common(NetClientState *nc,
> > +                             const uint8_t *buf,
> > +                             size_t size)
> > +{
> > +    VmnetCommonState *s;
> > +    vmpktdesc_t packet;
> > +    iovec_t iov;
> > +    int pkt_cnt;
> > +    vmnet_return_t if_status;
> > +
> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> > +
> > +    if (size > s->max_packet_size) {
> > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
> > +                    packet.vm_pkt_size,
> > +                    s->max_packet_size);
> > +        return -1;
> > +    }
> > +
> > +    iov.iov_base =3D (char *) buf;
> > +    iov.iov_len =3D size;
> > +
> > +    packet.vm_pkt_iovcnt =3D 1;
> > +    packet.vm_flags =3D 0;
> > +    packet.vm_pkt_size =3D size;
> > +    packet.vm_pkt_iov =3D &iov;
> > +
> > +    pkt_cnt =3D 1;
> > +    if_status =3D vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> > +
> > +    if (if_status !=3D VMNET_SUCCESS) {
> > +        error_report("vmnet: write error: %s\n",
> > +                     vmnet_status_map_str(if_status));
> > +    }
> > +
> > +    if (if_status =3D=3D VMNET_SUCCESS && pkt_cnt) {
> > +        return size;
> > +    }
> > +    return 0;
> > +}
> > +
> > +
> > +void vmnet_cleanup_common(NetClientState *nc)
> > +{
> > +    VmnetCommonState *s;
> > +    dispatch_queue_t if_destroy_q;
> > +
> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> > +
> > +    qemu_purge_queued_packets(nc);
> > +    vmnet_set_send_enabled(s, false);
> > +
> > +    if (s->vmnet_if =3D=3D NULL) {
> > +        return;
> > +    }
> > +
> > +    if_destroy_q =3D dispatch_queue_create(
> > +        "org.qemu.vmnet.destroy",
> > +        DISPATCH_QUEUE_SERIAL
> > +    );
> > +
> > +    vmnet_stop_interface(
> > +        s->vmnet_if,
> > +        if_destroy_q,
> > +        ^(vmnet_return_t status) {
> > +        });
> > +
> > +    for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> > +        g_free(s->iov_buf[i].iov_base);
> > +    }
> > +}
> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> > index f8c4a4f3b8..0896a41d1a 100644
> > --- a/net/vmnet-shared.c
> > +++ b/net/vmnet-shared.c
> > @@ -10,16 +10,91 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "qapi/qapi-types-net.h"
> > +#include "qapi/error.h"
> >  #include "vmnet_int.h"
> >  #include "clients.h"
> > -#include "qemu/error-report.h"
> > -#include "qapi/error.h"
> >
> >  #include <vmnet/vmnet.h>
> >
> > +typedef struct VmnetSharedState {
> > +  VmnetCommonState cs;
> > +} VmnetSharedState;
> > +
> > +
> > +static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
> > +{
> > +    const NetdevVmnetSharedOptions *options =3D &(netdev->u.vmnet_shar=
ed);
> > +    xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NULL, 0);
> > +
> > +    xpc_dictionary_set_uint64(
> > +        if_desc,
> > +        vmnet_operation_mode_key,
> > +        VMNET_SHARED_MODE
> > +    );
> > +
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0
> > +    xpc_dictionary_set_bool(
> > +        if_desc,
> > +        vmnet_enable_isolation_key,
> > +        options->isolated
> > +    );
> > +#else
> > +    if (options->has_isolated) {
> > +        error_setg(errp,
> > +                   "vmnet-shared.isolated feature is "
> > +                   "unavailable: outdated vmnet.framework API");
> > +    }
> > +#endif
>
> Instead of MAC_OS_X_VERSION_MAX_ALLOWED, MAC_OS_X_VERSION_MIN_REQUIRED
> should be used here. MAC_OS_X_VERSION_MIN_REQUIRED defines the lower
> bound of the version range supported by the build while
> MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound. Since the build
> referencing vmnet_enable_isolation_key would not properly work on
> macOS <11.0, the lower bound must be checked.
> MacOSX.sdk/usr/include/AvailabilityMacros.h has a more detailed
> explanation.
>
> I'm CCing people receiving macOS 12 support patch series since we had
> similar discussions there too.
> https://lore.kernel.org/all/20220109170612.574104-1-f4bug@amsat.org/
>
> Regards,
> Akihiko Odaki
>
> > +
> > +    if (options->has_nat66_prefix) {
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_nat66_prefix_key,
> > +                                  options->nat66_prefix);
> > +    }
> > +
> > +    if (options->has_start_address ||
> > +        options->has_end_address ||
> > +        options->has_subnet_mask) {
> > +
> > +        if (options->has_start_address &&
> > +            options->has_end_address &&
> > +            options->has_subnet_mask) {
> > +
> > +            xpc_dictionary_set_string(if_desc,
> > +                                      vmnet_start_address_key,
> > +                                      options->start_address);
> > +            xpc_dictionary_set_string(if_desc,
> > +                                      vmnet_end_address_key,
> > +                                      options->end_address);
> > +            xpc_dictionary_set_string(if_desc,
> > +                                      vmnet_subnet_mask_key,
> > +                                      options->subnet_mask);
> > +        } else {
> > +            error_setg(
> > +                errp,
> > +                "'start-address', 'end-address', 'subnet-mask' "
> > +                "should be provided together"
> > +            );
> > +        }
> > +    }
> > +
> > +    return if_desc;
> > +}
> > +
> > +static NetClientInfo net_vmnet_shared_info =3D {
> > +    .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,
> > +    .size =3D sizeof(VmnetSharedState),
> > +    .receive =3D vmnet_receive_common,
> > +    .cleanup =3D vmnet_cleanup_common,
> > +};
> > +
> >  int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> >                            NetClientState *peer, Error **errp)
> >  {
> > -  error_setg(errp, "vmnet-shared is not implemented yet");
> > -  return -1;
> > +    NetClientState *nc =3D qemu_new_net_client(&net_vmnet_shared_info,
> > +                                             peer, "vmnet-shared",
> name);
> > +    xpc_object_t if_desc =3D create_if_desc(netdev, errp);
> > +
> > +    return vmnet_if_create(nc, if_desc, errp, NULL);
> >  }
> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> > index c5982259a4..3979fe4678 100644
> > --- a/net/vmnet_int.h
> > +++ b/net/vmnet_int.h
> > @@ -16,10 +16,33 @@
> >
> >  #include <vmnet/vmnet.h>
> >
> > +#define VMNET_PACKETS_LIMIT 50
> > +
> >  typedef struct VmnetCommonState {
> >    NetClientState nc;
> > +  interface_ref vmnet_if;
> > +
> > +  bool send_enabled;
> > +
> > +  uint64_t mtu;
> > +  uint64_t max_packet_size;
> > +
> > +  struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> > +  struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >
> >  } VmnetCommonState;
> >
> > +const char *vmnet_status_map_str(vmnet_return_t status);
> > +
> > +int vmnet_if_create(NetClientState *nc,
> > +                    xpc_object_t if_desc,
> > +                    Error **errp,
> > +                    void (*completion_callback)(xpc_object_t
> interface_param));
> > +
> > +ssize_t vmnet_receive_common(NetClientState *nc,
> > +                             const uint8_t *buf,
> > +                             size_t size);
> > +
> > +void vmnet_cleanup_common(NetClientState *nc);
> >
> >  #endif /* VMNET_INT_H */
> > --
> > 2.23.0
> >
>

--000000000000f7079805d579b313
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Will fix it, thank you!<br><br></div><div=
 dir=3D"ltr">Actually this (wrong) check:<div><br><div>#if defined(MAC_OS_V=
ERSION_11_0) &amp;&amp; \<br>=C2=A0 =C2=A0 MAC_OS_X_VERSION_MAX_ALLOWED &gt=
;=3D MAC_OS_VERSION_11_0<br></div><div><br></div></div><div>worked fine on =
Catalina 10.15 for me cause the=C2=A0</div><div>MAC_OS_VERSION_11_0 was not=
 introduced there and it</div><div>stopped on the 1st defined(MAC_OS_VERSIO=
N_11_0) check.</div><div>I should have tested this more thoroughly,=C2=A0my=
 fault.</div><div><br></div><div>Now submitting v13 with MAC_OS_X_VERSION_M=
IN_REQUIRED.</div></div><div><br class=3D"gmail-Apple-interchange-newline">=
--<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best Rega=
rds,<div><br><div>Vladislav Yaroshchuk</div></div><div><br></div></div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">=D1=87=D1=82, 13 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 19:11, Akihiko O=
daki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail.com=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Jan 14, 2022 at 12:01 AM Vladislav Yaroshchuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Interaction with vmnet.framework in different modes<br>
&gt; differs only on configuration stage, so we can create<br>
&gt; common `send`, `receive`, etc. procedures and reuse them.<br>
&gt;<br>
&gt; vmnet.framework supports iov, but writing more than<br>
&gt; one iov into vmnet interface fails with<br>
&gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Collecting provided iovs into<br>
&gt; one and passing it to vmnet works fine. That&#39;s the<br>
&gt; reason why receive_iov() left unimplemented. But it still<br>
&gt; works with good enough performance having .receive()<br>
&gt; implemented only.<br>
&gt;<br>
&gt; Also, there is no way to unsubscribe from vmnet packages<br>
&gt; receiving except registering and unregistering event<br>
&gt; callback or simply drop packages just ignoring and<br>
&gt; not processing them when related flag is set. Here we do<br>
&gt; using the second way.<br>
&gt;<br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 net/vmnet-common.m | 313 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 net/vmnet-shared.c |=C2=A0 83 +++++++++++-<br>
&gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 |=C2=A0 23 ++++<br>
&gt;=C2=A0 3 files changed, 415 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt; index 532d152840..45c983ac7f 100644<br>
&gt; --- a/net/vmnet-common.m<br>
&gt; +++ b/net/vmnet-common.m<br>
&gt; @@ -10,6 +10,8 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;=C2=A0 #include &quot;vmnet_int.h&quot;<br>
&gt;=C2=A0 #include &quot;clients.h&quot;<br>
&gt; @@ -17,4 +19,315 @@<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;<br>
&gt; +#ifdef DEBUG<br>
&gt; +#define D(x) x<br>
&gt; +#define D_LOG(...) qemu_log(__VA_ARGS__)<br>
&gt; +#else<br>
&gt; +#define D(x) do { } while (0)<br>
&gt; +#define D_LOG(...) do { } while (0)<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +typedef struct vmpktdesc vmpktdesc_t;<br>
&gt; +typedef struct iovec iovec_t;<br>
&gt; +<br>
&gt; +static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D enable;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0interface_event_t event_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0xpc_object_t event)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(event_id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABL=
E);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt; +=C2=A0 =C2=A0 uint64_t packets_available;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct iovec *iov;<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets;<br>
&gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 packets_available =3D xpc_dictionary_get_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 event,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_estimated_packets_available_key<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pkt_cnt =3D (packets_available &lt; VMNET_PACKETS_LIMIT=
) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packets_available :<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_PACKETS_LIMIT;=
<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 iov =3D s-&gt;iov_buf;<br>
&gt; +=C2=A0 =C2=A0 packets =3D s-&gt;packets_buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_size =3D s-&gt;max_pack=
et_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_status =3D vmnet_read(s-&gt;vmnet_if, packets, &amp;=
pkt_cnt);<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;vmnet: read failed: %s=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vmnet_status_map_str(if_status));<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_send_packet_async(nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_=
base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].=
vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send_=
completed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_set_send_enabled(s, f=
alse);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (size &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_register_event_callback(VmnetCommonState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t avail_pkt_q =3D dispatch_queue_create(=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.if_queue&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail_pkt_q,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_event_t event_id, xpc_object_=
t event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;send_enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send(&amp;s-&g=
t;nc, event_id, event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_bufs_init(VmnetCommonState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets;<br>
&gt; +=C2=A0 =C2=A0 struct iovec *iov;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 packets =3D s-&gt;packets_buf;<br>
&gt; +=C2=A0 =C2=A0 iov =3D s-&gt;iov_buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_len =3D s-&gt;max_packet_size;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_base =3D g_malloc0(iov[i].iov_=
len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iov =3D iov + i;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +const char *vmnet_status_map_str(vmnet_return_t status)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;success&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;general failure&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;memory allocation failure&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ARGUMENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid argument specified&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCOMPLETE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;interface setup is not compl=
ete&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ACCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid access, permission d=
enied&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO_BIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet size is larger than M=
TU&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXHAUSTED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;buffers exhausted in kernel&=
quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_PACKETS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet count exceeds limit&q=
uot;;<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MAX_ALLOWED &gt;=3D MAC_OS_VERSION_11_=
0<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUSY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;conflict, sharing service is=
 in use&quot;;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unknown vmnet error&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 xpc_object_t if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Error **errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 void (*completion_callback)(xpc_object_t interface_param))<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t if_create_q;<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_created_sem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 __block vmnet_return_t if_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_create_q =3D dispatch_queue_create(&quot;org.qemu.vm=
net.create&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DISP=
ATCH_QUEUE_SERIAL);<br>
&gt; +=C2=A0 =C2=A0 if_created_sem =3D dispatch_semaphore_create(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_allocate_mac_address_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 false<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 D(D_LOG(&quot;vmnet.start.interface_desc:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_apply(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xpc_object_t v) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =3D xpc_copy_description(v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0D_LOG(&quot;=C2=A0 %s=3D%s\n&quot;, k, desc);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;vmnet_if =3D vmnet_start_interface(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_create_q,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status, xpc_object_t int=
erface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_status =3D status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D VMNET_SUCCESS || !=
interface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_s=
ignal(if_created_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 D(D_LOG(&quot;vmnet.start.interfac=
e_param:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionar=
y_apply(interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const =
char *k, xpc_object_t v) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char =
*desc =3D xpc_copy_description(v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D_LOG=
(&quot;=C2=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(=
desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mtu =3D xpc_dictionary_get_u=
int64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mtu_key);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet_size =3D xpc_dict=
ionary_get_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_max_packet_siz=
e_key);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (completion_callback) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completion_callback(=
interface_param);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(if_creat=
ed_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unable to create i=
nterface with requested params&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_F=
OREVER);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(if_create_q);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;cannot create vmnet interface: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
vmnet_status_map_str(if_status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_register_event_callback(s);<br>
&gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt; +=C2=A0 =C2=A0 vmpktdesc_t packet;<br>
&gt; +=C2=A0 =C2=A0 iovec_t iov;<br>
&gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (size &gt; s-&gt;max_packet_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;vmnet: packet is too bi=
g, %zu &gt; %llu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 packet.vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 s-&gt;max_packet_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 iov.iov_base =3D (char *) buf;<br>
&gt; +=C2=A0 =C2=A0 iov.iov_len =3D size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_size =3D size;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_iov =3D &amp;iov;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pkt_cnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 if_status =3D vmnet_write(s-&gt;vmnet_if, &amp;packet, =
&amp;pkt_cnt);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;vmnet: write error: %s=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vmnet_status_map_str(if_status));<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status =3D=3D VMNET_SUCCESS &amp;&amp; pkt_cnt) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +void vmnet_cleanup_common(NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t if_destroy_q;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, false);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_destroy_q =3D dispatch_queue_create(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.destroy&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_stop_interface(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_destroy_q,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;iov_buf[i].iov_base);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt; index f8c4a4f3b8..0896a41d1a 100644<br>
&gt; --- a/net/vmnet-shared.c<br>
&gt; +++ b/net/vmnet-shared.c<br>
&gt; @@ -10,16 +10,91 @@<br>
&gt;<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;vmnet_int.h&quot;<br>
&gt;=C2=A0 #include &quot;clients.h&quot;<br>
&gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt; -#include &quot;qapi/error.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt;<br>
&gt; +typedef struct VmnetSharedState {<br>
&gt; +=C2=A0 VmnetCommonState cs;<br>
&gt; +} VmnetSharedState;<br>
&gt; +<br>
&gt; +<br>
&gt; +static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions *options =3D &amp;(netde=
v-&gt;u.vmnet_shared);<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NU=
LL, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_mode_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_SHARED_MODE<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MAX_ALLOWED &gt;=3D MAC_OS_VERSION_11_=
0<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_isolation_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isolated<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_isolated) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;vmnet-shared.isolated feature is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unavailable: outdated vmnet.framework API&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
Instead of MAC_OS_X_VERSION_MAX_ALLOWED, MAC_OS_X_VERSION_MIN_REQUIRED<br>
should be used here. MAC_OS_X_VERSION_MIN_REQUIRED defines the lower<br>
bound of the version range supported by the build while<br>
MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound. Since the build<br>
referencing vmnet_enable_isolation_key would not properly work on<br>
macOS &lt;11.0, the lower bound must be checked.<br>
MacOSX.sdk/usr/include/AvailabilityMacros.h has a more detailed<br>
explanation.<br>
<br>
I&#39;m CCing people receiving macOS 12 support patch series since we had<b=
r>
similar discussions there too.<br>
<a href=3D"https://lore.kernel.org/all/20220109170612.574104-1-f4bug@amsat.=
org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/2022=
0109170612.574104-1-f4bug@amsat.org/</a><br>
<br>
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_nat66_prefix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_nat66_prefix_key,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;nat66_prefix)=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_start_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_end_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_subnet_mask) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (options-&gt;has_start_address &amp;&a=
mp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_end_address=
 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_subnet_mask=
) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
f_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start=
_address_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt=
;start_address);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
f_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_end_a=
ddress_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt=
;end_address);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
f_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subne=
t_mask_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt=
;subnet_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;st=
art-address&#39;, &#39;end-address&#39;, &#39;subnet-mask&#39; &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;should =
be provided together&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static NetClientInfo net_vmnet_shared_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,<br>
&gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetSharedState),<br>
&gt; +=C2=A0 =C2=A0 .receive =3D vmnet_receive_common,<br>
&gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cleanup_common,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 int net_init_vmnet_shared(const Netdev *netdev, const char *name=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 error_setg(errp, &quot;vmnet-shared is not implemented yet&quo=
t;);<br>
&gt; -=C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_new_net_client(&amp;net_vmn=
et_shared_info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0peer, &quot;vmnet-shared&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D create_if_desc(netdev, errp);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, if_desc, errp, NULL);<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt; index c5982259a4..3979fe4678 100644<br>
&gt; --- a/net/vmnet_int.h<br>
&gt; +++ b/net/vmnet_int.h<br>
&gt; @@ -16,10 +16,33 @@<br>
&gt;<br>
&gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt;<br>
&gt; +#define VMNET_PACKETS_LIMIT 50<br>
&gt; +<br>
&gt;=C2=A0 typedef struct VmnetCommonState {<br>
&gt;=C2=A0 =C2=A0 NetClientState nc;<br>
&gt; +=C2=A0 interface_ref vmnet_if;<br>
&gt; +<br>
&gt; +=C2=A0 bool send_enabled;<br>
&gt; +<br>
&gt; +=C2=A0 uint64_t mtu;<br>
&gt; +=C2=A0 uint64_t max_packet_size;<br>
&gt; +<br>
&gt; +=C2=A0 struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];<br>
&gt; +=C2=A0 struct iovec iov_buf[VMNET_PACKETS_LIMIT];<br>
&gt;<br>
&gt;=C2=A0 } VmnetCommonState;<br>
&gt;<br>
&gt; +const char *vmnet_status_map_str(vmnet_return_t status);<br>
&gt; +<br>
&gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 xpc_object_t if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Error **errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 void (*completion_callback)(xpc_object_t interface_param));<br>
&gt; +<br>
&gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size);<br>
&gt; +<br>
&gt; +void vmnet_cleanup_common(NetClientState *nc);<br>
&gt;<br>
&gt;=C2=A0 #endif /* VMNET_INT_H */<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div></div>

--000000000000f7079805d579b313--

