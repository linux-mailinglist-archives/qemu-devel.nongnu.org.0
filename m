Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F6456D06
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:12:47 +0100 (CET)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0sw-0004tp-G8
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:12:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mo0qk-0003Ph-FC
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:10:30 -0500
Received: from [2607:f8b0:4864:20::92b] (port=42870
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mo0qW-0002HA-El
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:10:30 -0500
Received: by mail-ua1-x92b.google.com with SMTP id t13so20104779uad.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cf5rEjbE0lYKW0G0YSKlm3cKKh8YuszyS95BMsaTmo0=;
 b=hmiD8X99juO19oK6CrV/akju3xzP64JEkptaeyRPFkfaq33ygLsWF7NiW3AGIXUAXK
 96O/sALNRVMFlxZSFmpdrSCcnnNB+69Wuu+hvz6tMtbTkgKmXRLS/7LiTYUnkB6KpIe8
 EEL9mFeNOy16tF7bF7M1Itr7EHOcBN6TdyHTIMyliIMXOXtY0xWAjHFH7VaguJxmNf1d
 uIPuVZlRYkbgNiDuJOO8RAIHQn0sOQOkx8AbgJ1fltNM1/dgWnvWMgBU1bFjcNmzUvcf
 /dyPRuxZb8p94yEe7XLKMPvwXGs9pfjf1f6tRdEEKeXIOlVv9HXol6RaVXq0fvDPt9NU
 xcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cf5rEjbE0lYKW0G0YSKlm3cKKh8YuszyS95BMsaTmo0=;
 b=AYY34tAg9KqY6JU8ZkDm8nqLvKm8zzo5J0yIWmYa6drLj2pU327V9jq5/7TjeKoR1L
 v92P95avWYa5nHuEu5ZFRP4VnoMtVA2TzTm26Wlic3ZVqz/QnFEFSTkUG9wap3iccjet
 6PdvS3qUqrOm+A7/iFs6VijcOuFNDhLT166FerT8okkmOaXg8l8QMPTI8LtutEbhWZAk
 XjjGGVRd6sQy2ODO7Tu/plj4irDx53qCo9DsKL/oQUONA6o5DsUVEimK+B7JXP5MNKkJ
 14ZUj3MWtwlwWaiUTvENTA5f+Yabn5hoWBnDjnRwTIfquku29PXCgdC6TXiIomTwM0op
 xcdg==
X-Gm-Message-State: AOAM531GoHZgKKxDFTBb/kFEhcibR/ilgRYDLCUg6H9PoeICKCpuRv9e
 9AVsjxdngC1tlCAa9LsJzOhJJheZtCTqcgsJigE=
X-Google-Smtp-Source: ABdhPJzi6opybW8w/LpFln5J01DRlIhbNOqo1a7RBNPdW1+zKlH9z6TkrsiQCDb2vnAvuxVFixRbq3G/RcsBM7mdm9w=
X-Received: by 2002:a05:6102:6c9:: with SMTP id
 m9mr93157854vsg.32.1637316615452; 
 Fri, 19 Nov 2021 02:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <20211112091414.34223-4-yaroshchuk2000@gmail.com>
 <CACGkMEuFGbH0xkp1K344kkgOzKcjn+iKQtgidgFWqmYkrG0KjQ@mail.gmail.com>
 <CADO9X9THeoddu+Uiny-Sj9z1y-eLmdC4SQqAnnan0bo4ZwsF=A@mail.gmail.com>
 <CACGkMEshn1W8dTV=1T2uE9bnZnRxNMFBoFW3qxMBPkApUCeSCg@mail.gmail.com>
In-Reply-To: <CACGkMEshn1W8dTV=1T2uE9bnZnRxNMFBoFW3qxMBPkApUCeSCg@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 19 Nov 2021 13:10:02 +0300
Message-ID: <CADO9X9Q=nVD=AwwP8A6U6qoO=2jGHrkdADmcBUqdoim5HY9J=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] net/vmnet: implement shared mode (vmnet-shared)
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003fbeab05d1217b11"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--0000000000003fbeab05d1217b11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 19 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 05:57, Jason=
 Wang <jasowang@redhat.com>:

> On Fri, Nov 19, 2021 at 1:12 AM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> >
> >
> > =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:47, J=
ason Wang <jasowang@redhat.com>:
> >>
> >> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
> >> <yaroshchuk2000@gmail.com> wrote:
> >> >
> >> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >> > ---
> >>
> >> Commit log please.
> >>
> >>
> >
> > Sorry, I don't understand what you mean here.
> > What is the 'commit log'?
>
> I meant the change log to describe the changes.
>
>
You mean more detailed commit message?
If not, can you please provide a short example

>
> >>
> >> >  net/vmnet-common.m | 305
> +++++++++++++++++++++++++++++++++++++++++++++
> >> >  net/vmnet-shared.c |  75 ++++++++++-
> >> >  net/vmnet_int.h    |  23 ++++
> >> >  3 files changed, 399 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >> > index 532d152840..b058e1b846 100644
> >> > --- a/net/vmnet-common.m
> >> > +++ b/net/vmnet-common.m
> >> > @@ -10,6 +10,8 @@
> >> >   */
> >> >
> >> >  #include "qemu/osdep.h"
> >> > +#include "qemu/main-loop.h"
> >> > +#include "qemu/log.h"
> >> >  #include "qapi/qapi-types-net.h"
> >> >  #include "vmnet_int.h"
> >> >  #include "clients.h"
> >> > @@ -17,4 +19,307 @@
> >> >  #include "qapi/error.h"
> >> >
> >> >  #include <vmnet/vmnet.h>
> >> > +#include <dispatch/dispatch.h>
> >> >
> >> > +#ifdef DEBUG
> >> > +#define D(x) x
> >> > +#define D_LOG(...) qemu_log(__VA_ARGS__)
> >> > +#else
> >> > +#define D(x) do { } while (0)
> >> > +#define D_LOG(...) do { } while (0)
> >> > +#endif
> >> > +
> >> > +typedef struct vmpktdesc vmpktdesc_t;
> >> > +typedef struct iovec iovec_t;
> >> > +
> >> > +static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable=
)
> >> > +{
> >> > +    s->send_enabled =3D enable;
> >>
> >> Is there a way to disable the event when enable is false?
> >>
> >
> > It seems there's no way except setting/unsetting
> > the callback via `vmnet_interface_set_event_callback`.
> > I decided to drop packages using `s->send_enabled`
> > without dealing with the callback.
>
> ok.
>
> >
> >> > +}
> >> > +
> >> > +
> >> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> >> > +{
> >> > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> >> > +    vmnet_set_send_enabled(s, true);
> >> > +}
> >> > +
> >> > +
> >> > +static void vmnet_send(NetClientState *nc,
> >> > +                       interface_event_t event_id,
> >> > +                       xpc_object_t event)
> >> > +{
> >> > +    assert(event_id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABLE);
> >> > +
> >> > +    VmnetCommonState *s;
> >> > +    uint64_t packets_available;
> >> > +
> >> > +    struct iovec *iov;
> >> > +    struct vmpktdesc *packets;
> >> > +    int pkt_cnt;
> >> > +    int i;
> >> > +
> >> > +    vmnet_return_t if_status;
> >> > +    ssize_t size;
> >> > +
> >> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> >> > +
> >> > +    packets_available =3D xpc_dictionary_get_uint64(
> >> > +        event,
> >> > +        vmnet_estimated_packets_available_key
> >> > +    );
> >> > +
> >> > +    pkt_cnt =3D (packets_available < VMNET_PACKETS_LIMIT) ?
> >> > +              packets_available :
> >> > +              VMNET_PACKETS_LIMIT;
> >> > +
> >> > +
> >> > +    iov =3D s->iov_buf;
> >> > +    packets =3D s->packets_buf;
> >> > +
> >> > +    for (i =3D 0; i < pkt_cnt; ++i) {
> >> > +        packets[i].vm_pkt_size =3D s->max_packet_size;
> >> > +        packets[i].vm_pkt_iovcnt =3D 1;
> >> > +        packets[i].vm_flags =3D 0;
> >> > +    }
> >> > +
> >> > +    if_status =3D vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> >> > +    if (if_status !=3D VMNET_SUCCESS) {
> >> > +        error_printf("vmnet: read failed: %s\n",
> >> > +                     vmnet_status_map_str(if_status));
> >> > +    }
> >> > +    qemu_mutex_lock_iothread();
> >> > +    for (i =3D 0; i < pkt_cnt; ++i) {
> >> > +        size =3D qemu_send_packet_async(nc,
> >> > +                                      iov[i].iov_base,
> >> > +                                      packets[i].vm_pkt_size,
> >> > +                                      vmnet_send_completed);
> >> > +        if (size =3D=3D 0) {
> >> > +            vmnet_set_send_enabled(s, false);
> >> > +        } else if (size < 0) {
> >> > +            break;
> >> > +        }
> >> > +    }
> >> > +    qemu_mutex_unlock_iothread();
> >> > +
> >> > +}
> >> > +
> >> > +
> >> > +static void vmnet_register_event_callback(VmnetCommonState *s)
> >> > +{
> >> > +    dispatch_queue_t avail_pkt_q =3D dispatch_queue_create(
> >> > +        "org.qemu.vmnet.if_queue",
> >> > +        DISPATCH_QUEUE_SERIAL
> >> > +    );
> >> > +
> >> > +    vmnet_interface_set_event_callback(
> >> > +        s->vmnet_if,
> >> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >> > +        avail_pkt_q,
> >> > +        ^(interface_event_t event_id, xpc_object_t event) {
> >> > +          if (s->send_enabled) {
> >> > +              vmnet_send(&s->nc, event_id, event);
> >> > +          }
> >> > +        });
> >> > +}
> >> > +
> >> > +
> >> > +static void vmnet_bufs_init(VmnetCommonState *s)
> >> > +{
> >> > +    int i;
> >> > +    struct vmpktdesc *packets;
> >> > +    struct iovec *iov;
> >> > +
> >> > +    packets =3D s->packets_buf;
> >> > +    iov =3D s->iov_buf;
> >> > +
> >> > +    for (i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >> > +        iov[i].iov_len =3D s->max_packet_size;
> >> > +        iov[i].iov_base =3D g_malloc0(iov[i].iov_len);
> >> > +        packets[i].vm_pkt_iov =3D iov + i;
> >> > +    }
> >> > +}
> >> > +
> >> > +
> >> > +const char *vmnet_status_map_str(vmnet_return_t status)
> >> > +{
> >> > +    switch (status) {
> >> > +    case VMNET_SUCCESS:
> >> > +        return "success";
> >> > +    case VMNET_FAILURE:
> >> > +        return "general failure";
> >> > +    case VMNET_MEM_FAILURE:
> >> > +        return "memory allocation failure";
> >> > +    case VMNET_INVALID_ARGUMENT:
> >> > +        return "invalid argument specified";
> >> > +    case VMNET_SETUP_INCOMPLETE:
> >> > +        return "interface setup is not complete";
> >> > +    case VMNET_INVALID_ACCESS:
> >> > +        return "invalid access, permission denied";
> >> > +    case VMNET_PACKET_TOO_BIG:
> >> > +        return "packet size is larger than MTU";
> >> > +    case VMNET_BUFFER_EXHAUSTED:
> >> > +        return "buffers exhausted in kernel";
> >> > +    case VMNET_TOO_MANY_PACKETS:
> >> > +        return "packet count exceeds limit";
> >> > +    case VMNET_SHARING_SERVICE_BUSY:
> >> > +        return "conflict, sharing service is in use";
> >> > +    default:
> >> > +        return "unknown vmnet error";
> >> > +    }
> >> > +}
> >> > +
> >> > +
> >> > +int vmnet_if_create(NetClientState *nc,
> >> > +                    xpc_object_t if_desc,
> >> > +                    Error **errp,
> >> > +                    void (*completion_callback)(xpc_object_t
> interface_param))
> >> > +{
> >> > +    VmnetCommonState *s;
> >> > +
> >> > +    dispatch_queue_t if_create_q;
> >> > +    dispatch_semaphore_t if_created_sem;
> >> > +
> >> > +    __block vmnet_return_t if_status;
> >> > +
> >> > +    if_create_q =3D dispatch_queue_create("org.qemu.vmnet.create",
> >> > +                                        DISPATCH_QUEUE_SERIAL);
> >> > +    if_created_sem =3D dispatch_semaphore_create(0);
> >> > +
> >> > +    xpc_dictionary_set_bool(
> >> > +        if_desc,
> >> > +        vmnet_allocate_mac_address_key,
> >> > +        false
> >> > +    );
> >> > +
> >> > +    D(D_LOG("vmnet.start.interface_desc:\n");
> >> > +    xpc_dictionary_apply(if_desc,
> >> > +                         ^bool(const char *k, xpc_object_t v) {
> >> > +                           char *desc =3D xpc_copy_description(v);
> >> > +                           D_LOG("  %s=3D%s\n", k, desc);
> >> > +                           free(desc);
> >> > +                           return true;
> >> > +                         }));
> >> > +
> >> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> >> > +    s->vmnet_if =3D vmnet_start_interface(
> >> > +        if_desc,
> >> > +        if_create_q,
> >> > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> >> > +          if_status =3D status;
> >> > +          if (status !=3D VMNET_SUCCESS || !interface_param) {
> >> > +              dispatch_semaphore_signal(if_created_sem);
> >> > +              return;
> >> > +          }
> >> > +
> >> > +          s->mtu =3D xpc_dictionary_get_uint64(
> >> > +              interface_param,
> >> > +              vmnet_mtu_key);
> >> > +          s->max_packet_size =3D xpc_dictionary_get_uint64(
> >> > +              interface_param,
> >> > +              vmnet_max_packet_size_key);
> >> > +          D(D_LOG("vmnet.start.interface_param:\n");
> >> > +          xpc_dictionary_apply(interface_param,
> >> > +                               ^bool(const char *k, xpc_object_t v)=
 {
> >> > +                                 char *desc =3D
> xpc_copy_description(v);
> >> > +                                 D_LOG("  %s=3D%s\n", k, desc);
> >> > +                                 free(desc);
> >> > +                                 return true;
> >> > +                               }));
> >> > +          dispatch_semaphore_signal(if_created_sem);
> >> > +        });
> >> > +
> >> > +    if (s->vmnet_if =3D=3D NULL) {
> >> > +        error_setg(errp, "unable to create interface with requested
> params");
> >> > +        return -1;
> >> > +    }
> >> > +
> >> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> >> > +    dispatch_release(if_create_q);
> >> > +
> >> > +    if (if_status !=3D VMNET_SUCCESS) {
> >> > +        error_setg(errp,
> >> > +                   "cannot create vmnet interface: %s",
> >> > +                   vmnet_status_map_str(if_status));
> >> > +        return -1;
> >> > +    }
> >> > +
> >> > +    vmnet_register_event_callback(s);
> >> > +    vmnet_bufs_init(s);
> >> > +    vmnet_set_send_enabled(s, true);
> >> > +
> >> > +    return 0;
> >> > +}
> >> > +
> >> > +
> >> > +ssize_t vmnet_receive_common(NetClientState *nc,
> >> > +                             const uint8_t *buf,
> >> > +                             size_t size)
> >> > +{
> >> > +    VmnetCommonState *s;
> >> > +    vmpktdesc_t packet;
> >> > +    iovec_t iov;
> >> > +    int pkt_cnt;
> >> > +    vmnet_return_t if_status;
> >> > +
> >> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> >> > +
> >> > +    if (size > s->max_packet_size) {
> >> > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
> >> > +                    packet.vm_pkt_size,
> >> > +                    s->max_packet_size);
> >> > +        return -1;
> >> > +    }
> >> > +
> >> > +    iov.iov_base =3D (char *) buf;
> >> > +    iov.iov_len =3D size;
> >> > +
> >> > +    packet.vm_pkt_iovcnt =3D 1;
> >> > +    packet.vm_flags =3D 0;
> >> > +    packet.vm_pkt_size =3D size;
> >> > +    packet.vm_pkt_iov =3D &iov;
> >>
> >> It looks to me vmnet framework supports iov so I wonder if a
> >> .receive_iov() is better because of its performance.
> >>
> >
> > I've just tried to implement this call, and because of some
> > reason `vmnet_write` fails with `VMNET_INVALID_ARGUMENT`
> > when iovcnt > 1. Tested with `vmxnet3`. Collecting all the iovs
> > into a big one and passing it to vmnet works fine (the default
> > behaviour when only the .receive() but not the .receive_iov()
> > is implemented).
> >
> > This should be investigated, but currently I don't understand
> > what exactly causes this error. The fact that vmnet.framework
> > is a 'blackbox' makes the situation much worse.
> >
> > Phillip's version is also broken:
> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> > Looks like this wasn't noticed before.
> >
> > If it's applicable, we can use the .receive() only, and put
> > .receive_iov() implementation to the backlog.
>
> Ok, we can go with receive() first.
>
> Thanks
>
> >
> >> > +
> >> > +    pkt_cnt =3D 1;
> >> > +    if_status =3D vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> >> > +
> >> > +    if (if_status !=3D VMNET_SUCCESS) {
> >> > +        error_report("vmnet: write error: %s\n",
> >> > +                     vmnet_status_map_str(if_status));
> >> > +    }
> >> > +
> >> > +    if (if_status =3D=3D VMNET_SUCCESS && pkt_cnt) {
> >> > +        return size;
> >> > +    }
> >> > +    return 0;
> >> > +}
> >> > +
> >> > +
> >> > +void vmnet_cleanup_common(NetClientState *nc)
> >> > +{
> >> > +    VmnetCommonState *s;
> >> > +    dispatch_queue_t if_destroy_q;
> >> > +
> >> > +    s =3D DO_UPCAST(VmnetCommonState, nc, nc);
> >> > +
> >> > +    qemu_purge_queued_packets(nc);
> >> > +    vmnet_set_send_enabled(s, false);
> >> > +
> >> > +    if (s->vmnet_if =3D=3D NULL) {
> >> > +        return;
> >> > +    }
> >> > +
> >> > +    if_destroy_q =3D dispatch_queue_create(
> >> > +        "org.qemu.vmnet.destroy",
> >> > +        DISPATCH_QUEUE_SERIAL
> >> > +    );
> >> > +
> >> > +    vmnet_stop_interface(
> >> > +        s->vmnet_if,
> >> > +        if_destroy_q,
> >> > +        ^(vmnet_return_t status) {
> >> > +        });
> >> > +
> >> > +    for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >> > +        g_free(s->iov_buf[i].iov_base);
> >> > +    }
> >> > +}
> >> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >> > index f8c4a4f3b8..b27ada3219 100644
> >> > --- a/net/vmnet-shared.c
> >> > +++ b/net/vmnet-shared.c
> >> > @@ -10,16 +10,83 @@
> >> >
> >> >  #include "qemu/osdep.h"
> >> >  #include "qapi/qapi-types-net.h"
> >> > +#include "qapi/error.h"
> >> >  #include "vmnet_int.h"
> >> >  #include "clients.h"
> >> > -#include "qemu/error-report.h"
> >> > -#include "qapi/error.h"
> >> >
> >> >  #include <vmnet/vmnet.h>
> >> >
> >> > +typedef struct VmnetSharedState {
> >> > +  VmnetCommonState cs;
> >> > +} VmnetSharedState;
> >> > +
> >> > +
> >> > +static xpc_object_t create_if_desc(const Netdev *netdev, Error
> **errp)
> >> > +{
> >> > +    const NetdevVmnetSharedOptions *options =3D
> &(netdev->u.vmnet_shared);
> >> > +    xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NULL, 0);
> >> > +
> >> > +    xpc_dictionary_set_uint64(
> >> > +        if_desc,
> >> > +        vmnet_operation_mode_key,
> >> > +        VMNET_SHARED_MODE
> >> > +    );
> >> > +
> >> > +    xpc_dictionary_set_bool(
> >> > +        if_desc,
> >> > +        vmnet_enable_isolation_key,
> >> > +        options->isolated
> >> > +    );
> >> > +
> >> > +    if (options->has_nat66_prefix) {
> >> > +        xpc_dictionary_set_string(if_desc,
> >> > +                                  vmnet_nat66_prefix_key,
> >> > +                                  options->nat66_prefix);
> >> > +    }
> >> > +
> >> > +    if (options->has_dhcpstart ||
> >> > +        options->has_dhcpend ||
> >> > +        options->has_subnet_mask) {
> >> > +
> >> > +        if (options->has_dhcpstart &&
> >> > +            options->has_dhcpend &&
> >> > +            options->has_subnet_mask) {
> >> > +
> >> > +            xpc_dictionary_set_string(if_desc,
> >> > +                                      vmnet_start_address_key,
> >> > +                                      options->dhcpstart);
> >> > +            xpc_dictionary_set_string(if_desc,
> >> > +                                      vmnet_end_address_key,
> >> > +                                      options->dhcpend);
> >> > +            xpc_dictionary_set_string(if_desc,
> >> > +                                      vmnet_subnet_mask_key,
> >> > +                                      options->subnet_mask);
> >> > +        } else {
> >> > +            error_setg(
> >> > +                errp,
> >> > +                "'dhcpstart', 'dhcpend', 'subnet_mask' "
> >> > +                "should be provided together"
> >> > +            );
> >> > +        }
> >> > +    }
> >> > +
> >> > +    return if_desc;
> >> > +}
> >> > +
> >> > +static NetClientInfo net_vmnet_shared_info =3D {
> >> > +    .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,
> >> > +    .size =3D sizeof(VmnetSharedState),
> >> > +    .receive =3D vmnet_receive_common,
> >> > +    .cleanup =3D vmnet_cleanup_common,
> >> > +};
> >> > +
> >> >  int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> >> >                            NetClientState *peer, Error **errp)
> >> >  {
> >> > -  error_setg(errp, "vmnet-shared is not implemented yet");
> >> > -  return -1;
> >> > +    NetClientState *nc =3D qemu_new_net_client(&net_vmnet_shared_in=
fo,
> >> > +                                             peer, "vmnet-shared",
> name);
> >> > +    xpc_object_t if_desc =3D create_if_desc(netdev, errp);
> >> > +
> >> > +    return vmnet_if_create(nc, if_desc, errp, NULL);
> >> >  }
> >> > +
> >> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >> > index c5982259a4..3979fe4678 100644
> >> > --- a/net/vmnet_int.h
> >> > +++ b/net/vmnet_int.h
> >> > @@ -16,10 +16,33 @@
> >> >
> >> >  #include <vmnet/vmnet.h>
> >> >
> >> > +#define VMNET_PACKETS_LIMIT 50
> >> > +
> >> >  typedef struct VmnetCommonState {
> >> >    NetClientState nc;
> >> > +  interface_ref vmnet_if;
> >> > +
> >> > +  bool send_enabled;
> >> > +
> >> > +  uint64_t mtu;
> >> > +  uint64_t max_packet_size;
> >> > +
> >> > +  struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >> > +  struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >> >
> >> >  } VmnetCommonState;
> >> >
> >> > +const char *vmnet_status_map_str(vmnet_return_t status);
> >> > +
> >> > +int vmnet_if_create(NetClientState *nc,
> >> > +                    xpc_object_t if_desc,
> >> > +                    Error **errp,
> >> > +                    void (*completion_callback)(xpc_object_t
> interface_param));
> >> > +
> >> > +ssize_t vmnet_receive_common(NetClientState *nc,
> >> > +                             const uint8_t *buf,
> >> > +                             size_t size);
> >> > +
> >> > +void vmnet_cleanup_common(NetClientState *nc);
> >> >
> >> >  #endif /* VMNET_INT_H */
> >> > --
> >> > 2.23.0
> >> >
> >
> >
> > --
> > Best Regards,
> >
> > Vladislav Yaroshchuk
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000003fbeab05d1217b11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 19 =D0=BD=D0=BE=D1=8F=
=D0=B1. 2021 =D0=B3. =D0=B2 05:57, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com">jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Fri, Nov 19, 2021 at 1:12 AM Vladislav Yarosh=
chuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:47, =
Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jas=
owang@redhat.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk<br>
&gt;&gt; &lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">=
yaroshchuk2000@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@a=
xleos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<b=
r>
&gt;&gt; &gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Commit log please.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sorry, I don&#39;t understand what you mean here.<br>
&gt; What is the &#39;commit log&#39;?<br>
<br>
I meant the change log to describe the changes.<br>
<br></blockquote><div><br></div><div>You mean more detailed commit message?=
</div><div>If not, can you please provide a short example</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-common.m | 305 ++++++++++++++++++++++++++++++=
+++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-shared.c |=C2=A0 75 ++++++++++-<br>
&gt;&gt; &gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 |=C2=A0 23 ++++<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 399 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt;&gt; &gt; index 532d152840..b058e1b846 100644<br>
&gt;&gt; &gt; --- a/net/vmnet-common.m<br>
&gt;&gt; &gt; +++ b/net/vmnet-common.m<br>
&gt;&gt; &gt; @@ -10,6 +10,8 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/log.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;clients.h&quot;<br>
&gt;&gt; &gt; @@ -17,4 +19,307 @@<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +#ifdef DEBUG<br>
&gt;&gt; &gt; +#define D(x) x<br>
&gt;&gt; &gt; +#define D_LOG(...) qemu_log(__VA_ARGS__)<br>
&gt;&gt; &gt; +#else<br>
&gt;&gt; &gt; +#define D(x) do { } while (0)<br>
&gt;&gt; &gt; +#define D_LOG(...) do { } while (0)<br>
&gt;&gt; &gt; +#endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +typedef struct vmpktdesc vmpktdesc_t;<br>
&gt;&gt; &gt; +typedef struct iovec iovec_t;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void vmnet_set_send_enabled(VmnetCommonState *s, bool=
 enable)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D enable;<br>
&gt;&gt;<br>
&gt;&gt; Is there a way to disable the event when enable is false?<br>
&gt;&gt;<br>
&gt;<br>
&gt; It seems there&#39;s no way except setting/unsetting<br>
&gt; the callback via `vmnet_interface_set_event_callback`.<br>
&gt; I decided to drop packages using `s-&gt;send_enabled`<br>
&gt; without dealing with the callback.<br>
<br>
ok.<br>
<br>
&gt;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t=
 len)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonS=
tate, nc, nc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void vmnet_send(NetClientState *nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0interface_event_t event_id,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0xpc_object_t event)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 assert(event_id =3D=3D VMNET_INTERFACE_PACKETS=
_AVAILABLE);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint64_t packets_available;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 struct iovec *iov;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packets_available =3D xpc_dictionary_get_uint6=
4(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 event,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_estimated_packets_availabl=
e_key<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 pkt_cnt =3D (packets_available &lt; VMNET_PACK=
ETS_LIMIT) ?<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packets_ava=
ilable :<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_PACKE=
TS_LIMIT;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 iov =3D s-&gt;iov_buf;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packets =3D s-&gt;packets_buf;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_size =3D s-&gt=
;max_packet_size;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iovcnt =3D 1;<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_flags =3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if_status =3D vmnet_read(s-&gt;vmnet_if, packe=
ts, &amp;pkt_cnt);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;vmnet: read f=
ailed: %s\n&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_send_packet_async(=
nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
ov[i].iov_base,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
ackets[i].vm_pkt_size,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
mnet_send_completed);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_set_send_ena=
bled(s, false);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (size &lt; 0) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void vmnet_register_event_callback(VmnetCommonState *=
s)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_queue_t avail_pkt_q =3D dispatch_queu=
e_create(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.if_queue&qu=
ot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVAILABL=
E,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail_pkt_q,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_event_t event_id, xp=
c_object_t event) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;send_enabled) {=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send(=
&amp;s-&gt;nc, event_id, event);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void vmnet_bufs_init(VmnetCommonState *s)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 struct iovec *iov;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packets =3D s-&gt;packets_buf;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 iov =3D s-&gt;iov_buf;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i)=
 {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_len =3D s-&gt;max_pac=
ket_size;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_base =3D g_malloc0(io=
v[i].iov_len);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iov =3D iov + =
i;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +const char *vmnet_status_map_str(vmnet_return_t status)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;success&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;general failure&quo=
t;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILURE:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;memory allocation f=
ailure&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ARGUMENT:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid argument sp=
ecified&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCOMPLETE:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;interface setup is =
not complete&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ACCESS:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid access, per=
mission denied&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO_BIG:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet size is larg=
er than MTU&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXHAUSTED:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;buffers exhausted i=
n kernel&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_PACKETS:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet count exceed=
s limit&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUSY:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;conflict, sharing s=
ervice is in use&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unknown vmnet error=
&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Error **errp,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void (*completion_callback)(xpc_object_t interface_param))<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_queue_t if_create_q;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_created_sem;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 __block vmnet_return_t if_status;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if_create_q =3D dispatch_queue_create(&quot;or=
g.qemu.vmnet.create&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 DISPATCH_QUEUE_SERIAL);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if_created_sem =3D dispatch_semaphore_create(0=
);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_allocate_mac_address_key,<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 false<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 D(D_LOG(&quot;vmnet.start.interface_desc:\n&qu=
ot;);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_dictionary_apply(if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xpc_object_t v) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =3D xpc_copy_description(v=
);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D_LOG(&quot;=C2=A0 %s=3D%s\n&quot;, k=
, desc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}));<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;vmnet_if =3D vmnet_start_interface(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_create_q,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status, xpc_obj=
ect_t interface_param) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_status =3D status;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D VMNET_SUC=
CESS || !interface_param) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_se=
maphore_signal(if_created_sem);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mtu =3D xpc_diction=
ary_get_uint64(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_p=
aram,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mtu_k=
ey);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet_size =3D=
 xpc_dictionary_get_uint64(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_p=
aram,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_max_p=
acket_size_key);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 D(D_LOG(&quot;vmnet.start=
.interface_param:\n&quot;);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_apply(inte=
rface_param,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xp=
c_object_t v) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =3D x=
pc_copy_description(v);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D_LOG(&quot;=C2=
=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal=
(if_created_sem);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unable to=
 create interface with requested params&quot;);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_created_sem, DISPAT=
CH_TIME_FOREVER);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_release(if_create_q);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;cannot create vmnet interface: %s&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_register_event_callback(s);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmpktdesc_t packet;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 iovec_t iov;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (size &gt; s-&gt;max_packet_size) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;vmnet: packet =
is too big, %zu &gt; %llu\n&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 packet.vm_pkt_size,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;max_packet_size);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 iov.iov_base =3D (char *) buf;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 iov.iov_len =3D size;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iovcnt =3D 1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packet.vm_flags =3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packet.vm_pkt_size =3D size;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iov =3D &amp;iov;<br>
&gt;&gt;<br>
&gt;&gt; It looks to me vmnet framework supports iov so I wonder if a<br>
&gt;&gt; .receive_iov() is better because of its performance.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I&#39;ve just tried to implement this call, and because of some<br>
&gt; reason `vmnet_write` fails with `VMNET_INVALID_ARGUMENT`<br>
&gt; when iovcnt &gt; 1. Tested with `vmxnet3`. Collecting all the iovs<br>
&gt; into a big one and passing it to vmnet works fine (the default<br>
&gt; behaviour when only the .receive() but not the .receive_iov()<br>
&gt; is implemented).<br>
&gt;<br>
&gt; This should be investigated, but currently I don&#39;t understand<br>
&gt; what exactly causes this error. The fact that vmnet.framework<br>
&gt; is a &#39;blackbox&#39; makes the situation much worse.<br>
&gt;<br>
&gt; Phillip&#39;s version is also broken:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip.enne=
n@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU=
/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt; Looks like this wasn&#39;t noticed before.<br>
&gt;<br>
&gt; If it&#39;s applicable, we can use the .receive() only, and put<br>
&gt; .receive_iov() implementation to the backlog.<br>
<br>
Ok, we can go with receive() first.<br>
<br>
Thanks<br>
<br>
&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 pkt_cnt =3D 1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if_status =3D vmnet_write(s-&gt;vmnet_if, &amp=
;packet, &amp;pkt_cnt);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;vmnet: write =
error: %s\n&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (if_status =3D=3D VMNET_SUCCESS &amp;&amp; =
pkt_cnt) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +void vmnet_cleanup_common(NetClientState *nc)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 VmnetCommonState *s;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 dispatch_queue_t if_destroy_q;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s =3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, false);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if_destroy_q =3D dispatch_queue_create(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.destroy&quo=
t;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmnet_stop_interface(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_destroy_q,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; VMNET_PACKETS_LIMIT; =
++i) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;iov_buf[i].iov_base=
);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt;&gt; &gt; index f8c4a4f3b8..b27ada3219 100644<br>
&gt;&gt; &gt; --- a/net/vmnet-shared.c<br>
&gt;&gt; &gt; +++ b/net/vmnet-shared.c<br>
&gt;&gt; &gt; @@ -10,16 +10,83 @@<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;clients.h&quot;<br>
&gt;&gt; &gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt; -#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +typedef struct VmnetSharedState {<br>
&gt;&gt; &gt; +=C2=A0 VmnetCommonState cs;<br>
&gt;&gt; &gt; +} VmnetSharedState;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static xpc_object_t create_if_desc(const Netdev *netdev, Err=
or **errp)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions *options =3D &a=
mp;(netdev-&gt;u.vmnet_shared);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D xpc_dictionary_create=
(NULL, NULL, 0);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_mode_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_SHARED_MODE<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_isolation_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isolated<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (options-&gt;has_nat66_prefix) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_des=
c,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_nat66_pre=
fix_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;nat=
66_prefix);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (options-&gt;has_dhcpstart ||<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_dhcpend ||<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_subnet_mask) {<b=
r>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (options-&gt;has_dhcpstart &a=
mp;&amp;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_dh=
cpend &amp;&amp;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_su=
bnet_mask) {<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set=
_string(if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
mnet_start_address_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
ptions-&gt;dhcpstart);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set=
_string(if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
mnet_end_address_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
ptions-&gt;dhcpend);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set=
_string(if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
mnet_subnet_mask_key,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
ptions-&gt;subnet_mask);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errp=
,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;&#39;dhcpstart&#39;, &#39;dhcpend&#39;, &#39;subnet_mask&#39; &quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;should be provided together&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static NetClientInfo net_vmnet_shared_info =3D {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetSharedState),<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 .receive =3D vmnet_receive_common,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cleanup_common,<br>
&gt;&gt; &gt; +};<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 int net_init_vmnet_shared(const Netdev *netdev, const c=
har *name,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 error_setg(errp, &quot;vmnet-shared is not implemente=
d yet&quot;);<br>
&gt;&gt; &gt; -=C2=A0 return -1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_new_net_client(&am=
p;net_vmnet_shared_info,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0peer, &quot;vmnet-shared&quot;, name);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D create_if_desc(netdev=
, errp);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, if_desc, errp, NULL=
);<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt;&gt; &gt; index c5982259a4..3979fe4678 100644<br>
&gt;&gt; &gt; --- a/net/vmnet_int.h<br>
&gt;&gt; &gt; +++ b/net/vmnet_int.h<br>
&gt;&gt; &gt; @@ -16,10 +16,33 @@<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +#define VMNET_PACKETS_LIMIT 50<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 typedef struct VmnetCommonState {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 NetClientState nc;<br>
&gt;&gt; &gt; +=C2=A0 interface_ref vmnet_if;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 bool send_enabled;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 uint64_t mtu;<br>
&gt;&gt; &gt; +=C2=A0 uint64_t max_packet_size;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];<br=
>
&gt;&gt; &gt; +=C2=A0 struct iovec iov_buf[VMNET_PACKETS_LIMIT];<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 } VmnetCommonState;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +const char *vmnet_status_map_str(vmnet_return_t status);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Error **errp,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void (*completion_callback)(xpc_object_t interface_param));<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +void vmnet_cleanup_common(NetClientState *nc);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #endif /* VMNET_INT_H */<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.23.0<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Vladislav Yaroshchuk<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--0000000000003fbeab05d1217b11--

