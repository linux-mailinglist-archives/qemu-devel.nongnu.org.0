Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD845686C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 03:58:40 +0100 (CET)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnu6p-0002Sv-QE
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 21:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnu5T-0001Hz-ER
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 21:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnu5P-0000tN-Vh
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 21:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637290631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2HBkBfW7dwBePX3Lsybi27YoS+GApcfORVT9RNgXUU=;
 b=OiLusoqjiR3ntCWgRAivz1jQALMUqDFg1zzC1nChTX/HJexKvBVwnpvTmDbS69cbaya+jg
 T6HZFTwrSvBhBoLUx1MIT5qluU0EKnppGlZu0OAbdhrhzkZOMrGQwk6/k47ozyYYBt3CP5
 9RGBG0mQzEOlWulg5OIFAhDZ8w7oV4M=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-FPm7iIehOGu-DFwtZJR0OQ-1; Thu, 18 Nov 2021 21:57:10 -0500
X-MC-Unique: FPm7iIehOGu-DFwtZJR0OQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 m2-20020a056512014200b0041042b64791so5563520lfo.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 18:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n2HBkBfW7dwBePX3Lsybi27YoS+GApcfORVT9RNgXUU=;
 b=XP93heLiWtRqoOyGl+4kj/5zp8VOYvBRgZy6BdbVeMWE3JD3nzyqaD0XFlsp5lfEr7
 Rw/nbWbZxrj8wslGih8iD8v+a1QpctM68ghdHSBsN9vIiHPO3rhE7V9910hNYUWf7nrB
 rMpU9kR7YjsoFnfhQPqrvF+QqI1w3RxIGMPsxa1GVzKJqPJpxO9W+5unoHsoF7FFIGyo
 sdXl3LGYRT3hVd7U5b7qU69WJJpaUM9Tn4u8FYORMxH3SU4iBP7A2lRSbALT/SrYV5Vy
 Bm3i2MZ6nc295z6T7lpUT/iOEZ4V03n5NV1WqP3KoBioNvLqDw9358lhk8C63fGZlrD1
 86Tg==
X-Gm-Message-State: AOAM530rOPc1PDaJaWPWiAikvztxm/5rmRJdbUwYze6RZDqW2nGQgW4d
 VZGFBsfMHCKOoqFKjAkLo147KokgcyfKIIV8RchWpB4BycUDnMpattsn745w6QxzT+v4SHekvri
 h66m2cFmTyW31UR7iJ5Pl1q31QVKU+ew=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr29990728lfv.481.1637290628493; 
 Thu, 18 Nov 2021 18:57:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPqQqASGgbBmoFeG7DEVH9f9Xsfkd0dopoBGEzMOUVc2gvI17OsIKgaewvZxXlhiSu9zCUpu5Tl0kFoeAQs1A=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr29990689lfv.481.1637290628213; 
 Thu, 18 Nov 2021 18:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <20211112091414.34223-4-yaroshchuk2000@gmail.com>
 <CACGkMEuFGbH0xkp1K344kkgOzKcjn+iKQtgidgFWqmYkrG0KjQ@mail.gmail.com>
 <CADO9X9THeoddu+Uiny-Sj9z1y-eLmdC4SQqAnnan0bo4ZwsF=A@mail.gmail.com>
In-Reply-To: <CADO9X9THeoddu+Uiny-Sj9z1y-eLmdC4SQqAnnan0bo4ZwsF=A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Nov 2021 10:56:56 +0800
Message-ID: <CACGkMEshn1W8dTV=1T2uE9bnZnRxNMFBoFW3qxMBPkApUCeSCg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] net/vmnet: implement shared mode (vmnet-shared)
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: phillip.ennen@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 1:12 AM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:47, Jas=
on Wang <jasowang@redhat.com>:
>>
>> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
>> <yaroshchuk2000@gmail.com> wrote:
>> >
>> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
>> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > ---
>>
>> Commit log please.
>>
>>
>
> Sorry, I don't understand what you mean here.
> What is the 'commit log'?

I meant the change log to describe the changes.

>
>>
>> >  net/vmnet-common.m | 305 ++++++++++++++++++++++++++++++++++++++++++++=
+
>> >  net/vmnet-shared.c |  75 ++++++++++-
>> >  net/vmnet_int.h    |  23 ++++
>> >  3 files changed, 399 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>> > index 532d152840..b058e1b846 100644
>> > --- a/net/vmnet-common.m
>> > +++ b/net/vmnet-common.m
>> > @@ -10,6 +10,8 @@
>> >   */
>> >
>> >  #include "qemu/osdep.h"
>> > +#include "qemu/main-loop.h"
>> > +#include "qemu/log.h"
>> >  #include "qapi/qapi-types-net.h"
>> >  #include "vmnet_int.h"
>> >  #include "clients.h"
>> > @@ -17,4 +19,307 @@
>> >  #include "qapi/error.h"
>> >
>> >  #include <vmnet/vmnet.h>
>> > +#include <dispatch/dispatch.h>
>> >
>> > +#ifdef DEBUG
>> > +#define D(x) x
>> > +#define D_LOG(...) qemu_log(__VA_ARGS__)
>> > +#else
>> > +#define D(x) do { } while (0)
>> > +#define D_LOG(...) do { } while (0)
>> > +#endif
>> > +
>> > +typedef struct vmpktdesc vmpktdesc_t;
>> > +typedef struct iovec iovec_t;
>> > +
>> > +static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable)
>> > +{
>> > +    s->send_enabled =3D enable;
>>
>> Is there a way to disable the event when enable is false?
>>
>
> It seems there's no way except setting/unsetting
> the callback via `vmnet_interface_set_event_callback`.
> I decided to drop packages using `s->send_enabled`
> without dealing with the callback.

ok.

>
>> > +}
>> > +
>> > +
>> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
>> > +{
>> > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc);
>> > +    vmnet_set_send_enabled(s, true);
>> > +}
>> > +
>> > +
>> > +static void vmnet_send(NetClientState *nc,
>> > +                       interface_event_t event_id,
>> > +                       xpc_object_t event)
>> > +{
>> > +    assert(event_id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABLE);
>> > +
>> > +    VmnetCommonState *s;
>> > +    uint64_t packets_available;
>> > +
>> > +    struct iovec *iov;
>> > +    struct vmpktdesc *packets;
>> > +    int pkt_cnt;
>> > +    int i;
>> > +
>> > +    vmnet_return_t if_status;
>> > +    ssize_t size;
>> > +
>> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
>> > +
>> > +    packets_available =3D xpc_dictionary_get_uint64(
>> > +        event,
>> > +        vmnet_estimated_packets_available_key
>> > +    );
>> > +
>> > +    pkt_cnt =3D (packets_available < VMNET_PACKETS_LIMIT) ?
>> > +              packets_available :
>> > +              VMNET_PACKETS_LIMIT;
>> > +
>> > +
>> > +    iov =3D s->iov_buf;
>> > +    packets =3D s->packets_buf;
>> > +
>> > +    for (i =3D 0; i < pkt_cnt; ++i) {
>> > +        packets[i].vm_pkt_size =3D s->max_packet_size;
>> > +        packets[i].vm_pkt_iovcnt =3D 1;
>> > +        packets[i].vm_flags =3D 0;
>> > +    }
>> > +
>> > +    if_status =3D vmnet_read(s->vmnet_if, packets, &pkt_cnt);
>> > +    if (if_status !=3D VMNET_SUCCESS) {
>> > +        error_printf("vmnet: read failed: %s\n",
>> > +                     vmnet_status_map_str(if_status));
>> > +    }
>> > +    qemu_mutex_lock_iothread();
>> > +    for (i =3D 0; i < pkt_cnt; ++i) {
>> > +        size =3D qemu_send_packet_async(nc,
>> > +                                      iov[i].iov_base,
>> > +                                      packets[i].vm_pkt_size,
>> > +                                      vmnet_send_completed);
>> > +        if (size =3D=3D 0) {
>> > +            vmnet_set_send_enabled(s, false);
>> > +        } else if (size < 0) {
>> > +            break;
>> > +        }
>> > +    }
>> > +    qemu_mutex_unlock_iothread();
>> > +
>> > +}
>> > +
>> > +
>> > +static void vmnet_register_event_callback(VmnetCommonState *s)
>> > +{
>> > +    dispatch_queue_t avail_pkt_q =3D dispatch_queue_create(
>> > +        "org.qemu.vmnet.if_queue",
>> > +        DISPATCH_QUEUE_SERIAL
>> > +    );
>> > +
>> > +    vmnet_interface_set_event_callback(
>> > +        s->vmnet_if,
>> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
>> > +        avail_pkt_q,
>> > +        ^(interface_event_t event_id, xpc_object_t event) {
>> > +          if (s->send_enabled) {
>> > +              vmnet_send(&s->nc, event_id, event);
>> > +          }
>> > +        });
>> > +}
>> > +
>> > +
>> > +static void vmnet_bufs_init(VmnetCommonState *s)
>> > +{
>> > +    int i;
>> > +    struct vmpktdesc *packets;
>> > +    struct iovec *iov;
>> > +
>> > +    packets =3D s->packets_buf;
>> > +    iov =3D s->iov_buf;
>> > +
>> > +    for (i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
>> > +        iov[i].iov_len =3D s->max_packet_size;
>> > +        iov[i].iov_base =3D g_malloc0(iov[i].iov_len);
>> > +        packets[i].vm_pkt_iov =3D iov + i;
>> > +    }
>> > +}
>> > +
>> > +
>> > +const char *vmnet_status_map_str(vmnet_return_t status)
>> > +{
>> > +    switch (status) {
>> > +    case VMNET_SUCCESS:
>> > +        return "success";
>> > +    case VMNET_FAILURE:
>> > +        return "general failure";
>> > +    case VMNET_MEM_FAILURE:
>> > +        return "memory allocation failure";
>> > +    case VMNET_INVALID_ARGUMENT:
>> > +        return "invalid argument specified";
>> > +    case VMNET_SETUP_INCOMPLETE:
>> > +        return "interface setup is not complete";
>> > +    case VMNET_INVALID_ACCESS:
>> > +        return "invalid access, permission denied";
>> > +    case VMNET_PACKET_TOO_BIG:
>> > +        return "packet size is larger than MTU";
>> > +    case VMNET_BUFFER_EXHAUSTED:
>> > +        return "buffers exhausted in kernel";
>> > +    case VMNET_TOO_MANY_PACKETS:
>> > +        return "packet count exceeds limit";
>> > +    case VMNET_SHARING_SERVICE_BUSY:
>> > +        return "conflict, sharing service is in use";
>> > +    default:
>> > +        return "unknown vmnet error";
>> > +    }
>> > +}
>> > +
>> > +
>> > +int vmnet_if_create(NetClientState *nc,
>> > +                    xpc_object_t if_desc,
>> > +                    Error **errp,
>> > +                    void (*completion_callback)(xpc_object_t interfac=
e_param))
>> > +{
>> > +    VmnetCommonState *s;
>> > +
>> > +    dispatch_queue_t if_create_q;
>> > +    dispatch_semaphore_t if_created_sem;
>> > +
>> > +    __block vmnet_return_t if_status;
>> > +
>> > +    if_create_q =3D dispatch_queue_create("org.qemu.vmnet.create",
>> > +                                        DISPATCH_QUEUE_SERIAL);
>> > +    if_created_sem =3D dispatch_semaphore_create(0);
>> > +
>> > +    xpc_dictionary_set_bool(
>> > +        if_desc,
>> > +        vmnet_allocate_mac_address_key,
>> > +        false
>> > +    );
>> > +
>> > +    D(D_LOG("vmnet.start.interface_desc:\n");
>> > +    xpc_dictionary_apply(if_desc,
>> > +                         ^bool(const char *k, xpc_object_t v) {
>> > +                           char *desc =3D xpc_copy_description(v);
>> > +                           D_LOG("  %s=3D%s\n", k, desc);
>> > +                           free(desc);
>> > +                           return true;
>> > +                         }));
>> > +
>> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
>> > +    s->vmnet_if =3D vmnet_start_interface(
>> > +        if_desc,
>> > +        if_create_q,
>> > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
>> > +          if_status =3D status;
>> > +          if (status !=3D VMNET_SUCCESS || !interface_param) {
>> > +              dispatch_semaphore_signal(if_created_sem);
>> > +              return;
>> > +          }
>> > +
>> > +          s->mtu =3D xpc_dictionary_get_uint64(
>> > +              interface_param,
>> > +              vmnet_mtu_key);
>> > +          s->max_packet_size =3D xpc_dictionary_get_uint64(
>> > +              interface_param,
>> > +              vmnet_max_packet_size_key);
>> > +          D(D_LOG("vmnet.start.interface_param:\n");
>> > +          xpc_dictionary_apply(interface_param,
>> > +                               ^bool(const char *k, xpc_object_t v) {
>> > +                                 char *desc =3D xpc_copy_description(=
v);
>> > +                                 D_LOG("  %s=3D%s\n", k, desc);
>> > +                                 free(desc);
>> > +                                 return true;
>> > +                               }));
>> > +          dispatch_semaphore_signal(if_created_sem);
>> > +        });
>> > +
>> > +    if (s->vmnet_if =3D=3D NULL) {
>> > +        error_setg(errp, "unable to create interface with requested p=
arams");
>> > +        return -1;
>> > +    }
>> > +
>> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
>> > +    dispatch_release(if_create_q);
>> > +
>> > +    if (if_status !=3D VMNET_SUCCESS) {
>> > +        error_setg(errp,
>> > +                   "cannot create vmnet interface: %s",
>> > +                   vmnet_status_map_str(if_status));
>> > +        return -1;
>> > +    }
>> > +
>> > +    vmnet_register_event_callback(s);
>> > +    vmnet_bufs_init(s);
>> > +    vmnet_set_send_enabled(s, true);
>> > +
>> > +    return 0;
>> > +}
>> > +
>> > +
>> > +ssize_t vmnet_receive_common(NetClientState *nc,
>> > +                             const uint8_t *buf,
>> > +                             size_t size)
>> > +{
>> > +    VmnetCommonState *s;
>> > +    vmpktdesc_t packet;
>> > +    iovec_t iov;
>> > +    int pkt_cnt;
>> > +    vmnet_return_t if_status;
>> > +
>> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
>> > +
>> > +    if (size > s->max_packet_size) {
>> > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
>> > +                    packet.vm_pkt_size,
>> > +                    s->max_packet_size);
>> > +        return -1;
>> > +    }
>> > +
>> > +    iov.iov_base =3D (char *) buf;
>> > +    iov.iov_len =3D size;
>> > +
>> > +    packet.vm_pkt_iovcnt =3D 1;
>> > +    packet.vm_flags =3D 0;
>> > +    packet.vm_pkt_size =3D size;
>> > +    packet.vm_pkt_iov =3D &iov;
>>
>> It looks to me vmnet framework supports iov so I wonder if a
>> .receive_iov() is better because of its performance.
>>
>
> I've just tried to implement this call, and because of some
> reason `vmnet_write` fails with `VMNET_INVALID_ARGUMENT`
> when iovcnt > 1. Tested with `vmxnet3`. Collecting all the iovs
> into a big one and passing it to vmnet works fine (the default
> behaviour when only the .receive() but not the .receive_iov()
> is implemented).
>
> This should be investigated, but currently I don't understand
> what exactly causes this error. The fact that vmnet.framework
> is a 'blackbox' makes the situation much worse.
>
> Phillip's version is also broken:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> Looks like this wasn't noticed before.
>
> If it's applicable, we can use the .receive() only, and put
> .receive_iov() implementation to the backlog.

Ok, we can go with receive() first.

Thanks

>
>> > +
>> > +    pkt_cnt =3D 1;
>> > +    if_status =3D vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
>> > +
>> > +    if (if_status !=3D VMNET_SUCCESS) {
>> > +        error_report("vmnet: write error: %s\n",
>> > +                     vmnet_status_map_str(if_status));
>> > +    }
>> > +
>> > +    if (if_status =3D=3D VMNET_SUCCESS && pkt_cnt) {
>> > +        return size;
>> > +    }
>> > +    return 0;
>> > +}
>> > +
>> > +
>> > +void vmnet_cleanup_common(NetClientState *nc)
>> > +{
>> > +    VmnetCommonState *s;
>> > +    dispatch_queue_t if_destroy_q;
>> > +
>> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
>> > +
>> > +    qemu_purge_queued_packets(nc);
>> > +    vmnet_set_send_enabled(s, false);
>> > +
>> > +    if (s->vmnet_if =3D=3D NULL) {
>> > +        return;
>> > +    }
>> > +
>> > +    if_destroy_q =3D dispatch_queue_create(
>> > +        "org.qemu.vmnet.destroy",
>> > +        DISPATCH_QUEUE_SERIAL
>> > +    );
>> > +
>> > +    vmnet_stop_interface(
>> > +        s->vmnet_if,
>> > +        if_destroy_q,
>> > +        ^(vmnet_return_t status) {
>> > +        });
>> > +
>> > +    for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
>> > +        g_free(s->iov_buf[i].iov_base);
>> > +    }
>> > +}
>> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>> > index f8c4a4f3b8..b27ada3219 100644
>> > --- a/net/vmnet-shared.c
>> > +++ b/net/vmnet-shared.c
>> > @@ -10,16 +10,83 @@
>> >
>> >  #include "qemu/osdep.h"
>> >  #include "qapi/qapi-types-net.h"
>> > +#include "qapi/error.h"
>> >  #include "vmnet_int.h"
>> >  #include "clients.h"
>> > -#include "qemu/error-report.h"
>> > -#include "qapi/error.h"
>> >
>> >  #include <vmnet/vmnet.h>
>> >
>> > +typedef struct VmnetSharedState {
>> > +  VmnetCommonState cs;
>> > +} VmnetSharedState;
>> > +
>> > +
>> > +static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp=
)
>> > +{
>> > +    const NetdevVmnetSharedOptions *options =3D &(netdev->u.vmnet_sha=
red);
>> > +    xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NULL, 0);
>> > +
>> > +    xpc_dictionary_set_uint64(
>> > +        if_desc,
>> > +        vmnet_operation_mode_key,
>> > +        VMNET_SHARED_MODE
>> > +    );
>> > +
>> > +    xpc_dictionary_set_bool(
>> > +        if_desc,
>> > +        vmnet_enable_isolation_key,
>> > +        options->isolated
>> > +    );
>> > +
>> > +    if (options->has_nat66_prefix) {
>> > +        xpc_dictionary_set_string(if_desc,
>> > +                                  vmnet_nat66_prefix_key,
>> > +                                  options->nat66_prefix);
>> > +    }
>> > +
>> > +    if (options->has_dhcpstart ||
>> > +        options->has_dhcpend ||
>> > +        options->has_subnet_mask) {
>> > +
>> > +        if (options->has_dhcpstart &&
>> > +            options->has_dhcpend &&
>> > +            options->has_subnet_mask) {
>> > +
>> > +            xpc_dictionary_set_string(if_desc,
>> > +                                      vmnet_start_address_key,
>> > +                                      options->dhcpstart);
>> > +            xpc_dictionary_set_string(if_desc,
>> > +                                      vmnet_end_address_key,
>> > +                                      options->dhcpend);
>> > +            xpc_dictionary_set_string(if_desc,
>> > +                                      vmnet_subnet_mask_key,
>> > +                                      options->subnet_mask);
>> > +        } else {
>> > +            error_setg(
>> > +                errp,
>> > +                "'dhcpstart', 'dhcpend', 'subnet_mask' "
>> > +                "should be provided together"
>> > +            );
>> > +        }
>> > +    }
>> > +
>> > +    return if_desc;
>> > +}
>> > +
>> > +static NetClientInfo net_vmnet_shared_info =3D {
>> > +    .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,
>> > +    .size =3D sizeof(VmnetSharedState),
>> > +    .receive =3D vmnet_receive_common,
>> > +    .cleanup =3D vmnet_cleanup_common,
>> > +};
>> > +
>> >  int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>> >                            NetClientState *peer, Error **errp)
>> >  {
>> > -  error_setg(errp, "vmnet-shared is not implemented yet");
>> > -  return -1;
>> > +    NetClientState *nc =3D qemu_new_net_client(&net_vmnet_shared_info=
,
>> > +                                             peer, "vmnet-shared", na=
me);
>> > +    xpc_object_t if_desc =3D create_if_desc(netdev, errp);
>> > +
>> > +    return vmnet_if_create(nc, if_desc, errp, NULL);
>> >  }
>> > +
>> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>> > index c5982259a4..3979fe4678 100644
>> > --- a/net/vmnet_int.h
>> > +++ b/net/vmnet_int.h
>> > @@ -16,10 +16,33 @@
>> >
>> >  #include <vmnet/vmnet.h>
>> >
>> > +#define VMNET_PACKETS_LIMIT 50
>> > +
>> >  typedef struct VmnetCommonState {
>> >    NetClientState nc;
>> > +  interface_ref vmnet_if;
>> > +
>> > +  bool send_enabled;
>> > +
>> > +  uint64_t mtu;
>> > +  uint64_t max_packet_size;
>> > +
>> > +  struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
>> > +  struct iovec iov_buf[VMNET_PACKETS_LIMIT];
>> >
>> >  } VmnetCommonState;
>> >
>> > +const char *vmnet_status_map_str(vmnet_return_t status);
>> > +
>> > +int vmnet_if_create(NetClientState *nc,
>> > +                    xpc_object_t if_desc,
>> > +                    Error **errp,
>> > +                    void (*completion_callback)(xpc_object_t interfac=
e_param));
>> > +
>> > +ssize_t vmnet_receive_common(NetClientState *nc,
>> > +                             const uint8_t *buf,
>> > +                             size_t size);
>> > +
>> > +void vmnet_cleanup_common(NetClientState *nc);
>> >
>> >  #endif /* VMNET_INT_H */
>> > --
>> > 2.23.0
>> >
>
>
> --
> Best Regards,
>
> Vladislav Yaroshchuk


