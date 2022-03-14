Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15814D9002
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 00:03:58 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtjJ-0003as-Bw
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 19:03:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTtho-0002Qz-6A
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:02:24 -0400
Received: from [2607:f8b0:4864:20::112a] (port=42071
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTthj-0005rG-Iw
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:02:23 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso182396417b3.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbnWUgH4U1ENaAHWadJ20u9ilbK2onlSEP8uGmkcBtU=;
 b=HEv6EAeY/LADqpCVVVAgxrEip6zXZusqt5zZHYNmXi8Dlrd5w4ppjTfRF6x+G4YBgY
 rgS4tbY269A2NivjsgtEKbDUNqRzseUgXHAZjEIQD8QpEXOtD70KqIqNuqC9Wc3PaUtU
 wCUYVRhk/RoOLgjqp6MJrXJKElP4xc3MJxnlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbnWUgH4U1ENaAHWadJ20u9ilbK2onlSEP8uGmkcBtU=;
 b=0jB57GDIi1wG0TlUSD6lpHSNgZlvXyS/YdC7cGSgWI+kckZFiYPnJ+lVA2OfBKVRQt
 X+FP2Bgc1sw0eKiNE8h96++SQppBAeGR+x+vmrx/AEpqW5A10eM0zYEsLSGbHorRHF/r
 Nyl55GJyAIGma8G852wyU9NBxlC3N2YSJ1xi6bFB3RHAwQHBvGnqx+eQK1jlphe9uMdE
 28s56AU0+TELMKgnq9jRjvJ3fteRtWsaH2iXDSddL8+AxaAAcbBk+48AERvkxIlyALyM
 C0IBaCdsPHvOZ1ZM3asnINVBI0ELyBp6/AsPlN4G/KBq7OrD39tQJwi+zlcvpEakIq50
 iYng==
X-Gm-Message-State: AOAM532mJxt6tD1ZHWQkLN+TnjSsQZJzhoAH0JihhwS0Ol4UAbB5mDpg
 4m5hjkL2ocFIdZ3WCCnf61QIx4kAfNoxkiHmmeF0bA==
X-Google-Smtp-Source: ABdhPJxFVwqCuo5umDBegI1Eu9XIXOjtLLYCJlZBzbsBGsRQnE7p8pc/sA9gmqRyus6BBn2s7x1qe69lx9grJDBiWWc=
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr21451422ywb.256.1647298938201; Mon, 14
 Mar 2022 16:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220314191545.81861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <f050ce26-4cff-82c9-33f6-8532ecb8b6dc@gmail.com>
 <CAGmdLqT5Ka4=_P-tKHquimfYd_f4S7XeajUieKjyQ8sFqX33ig@mail.gmail.com>
 <55e7af6a-ca93-9c4f-2c1e-2f9f87a64e53@gmail.com>
In-Reply-To: <55e7af6a-ca93-9c4f-2c1e-2f9f87a64e53@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 15 Mar 2022 02:02:05 +0300
Message-ID: <CAGmdLqR7vCuxfKOnDb-mQ1cEkih2C+pci50OtxNDzUAVXhszSA@mail.gmail.com>
Subject: Re: [PATCH v16 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Markus Armbruster <armbru@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000000d01de05da35ace0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d01de05da35ace0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 15 =D0=BC=D0=B0=D1=80. 2022 =D0=B3., 1:34 AM Akihiko Odaki <a=
kihiko.odaki@gmail.com>:

> On 2022/03/15 6:50, Vladislav Yaroshchuk wrote:
> > Thank you, Akihiko
> >
> > On Mon, Mar 14, 2022 at 10:46 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:
> >      > vmnet.framework supports iov, but writing more than
> >      > one iov into vmnet interface fails with
> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      > one and passing it to vmnet works fine. That's the
> >      > reason why receive_iov() left unimplemented. But it still
> >      > works with good enough performance having .receive()
> >      > implemented only.
> >      >
> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >     <mailto:phillip@axleos.com>>
> >      > Signed-off-by: Vladislav Yaroshchuk
> >     <Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>
> >      > ---
> >      >   net/vmnet-common.m | 298
> >     +++++++++++++++++++++++++++++++++++++++++++++
> >      >   net/vmnet-shared.c |  95 ++++++++++++++-
> >      >   net/vmnet_int.h    |  41 ++++++-
> >      >   3 files changed, 429 insertions(+), 5 deletions(-)
> >      >
> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >      > index 56612c72ce..20a33d2591 100644
> >      > --- a/net/vmnet-common.m
> >      > +++ b/net/vmnet-common.m
> >      > @@ -10,6 +10,8 @@
> >      >    */
> >      >
> >      >   #include "qemu/osdep.h"
> >      > +#include "qemu/main-loop.h"
> >      > +#include "qemu/log.h"
> >      >   #include "qapi/qapi-types-net.h"
> >      >   #include "vmnet_int.h"
> >      >   #include "clients.h"
> >      > @@ -17,4 +19,300 @@
> >      >   #include "qapi/error.h"
> >      >
> >      >   #include <vmnet/vmnet.h>
> >      > +#include <dispatch/dispatch.h>
> >      >
> >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s);
> >
> >     The names of vmnet_qemu_send_wrapper and vmnet_send_bh does not tel=
l
> >     them apart well. Since only vmnet_send_bh does reading, its name ma=
y
> >     include "read" to clarify that. "wrapper" in vmnet_qemu_send_wrappe=
r
> >     may
> >     be also misleading as it does more than just calling the underlying
> >     QEMU
> >     facility, but it also updates VmnetCommonState.
> >
> >
> > Ok, I'll think about how to name them better.
> >
> >      > +
> >      > +
> >      > +static void vmnet_send_completed(NetClientState *nc, ssize_t le=
n)
> >      > +{
> >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc)=
;
> >      > +    /* Complete sending packets left in VmnetCommonState buffer=
s
> */
> >      > +    s->send_enabled =3D vmnet_qemu_send_wrapper(s);
> >
> >     It must qemu_bh_schedule(s->send_bh) after vmnet_qemu_send_wrapper.
> >
> >
> > Agree with you, thanks.
> >
> >     Also, send_enabled flag can be removed as explained in:
> >     https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html
> >     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html>
> >
> >
> > Not sure about this. Values of packets_send_current_pos
> > and packets_send_end_pos may be equal, but QEMU may be
> > not ready to receive new packets - the explanation:
> > 1. We are sending packets to QEMU with qemu_send_packet_async:
> >      packets_send_current_pos =3D 0
> >      packets_send_end_pos =3D 5
> > 2. All five packets (0, 1, 2, 3, 4) have been successfully sent to QEMU=
,
> >      but qemu_send_packet_async returned 0 "no more packets" after
> >      the last invocation
> > 3. In spite of this, all five packets are sent and
> >      packets_send_current_pos =3D=3D packets_send_end_pos =3D=3D 5
> > 4. It seems that "pointers are equal ->  QEMU is ready", but actually
> >      it is not.
> >
> > Also, hiding QEMU "ready"/"not ready" state behind pointers is a
> > bad choice I think. Having a concrete flag makes this more clear.
> > It provides understandability, not complexity (imho).
>
> packets_send_current_pos must not be incremented if
> qemu_send_packet_async returned 0. It must tell the position of the
> packet currently being sent.
>
>
>
> must be incremented
It cannot.

If qemu_send_packet_async returns 0,
it still consumes (!) (queues internally) the packet.
So the packets_send_current_pos must be
incremented
to prevent sending same packet multiple times.

The idea is simple:
1. We've sent the packet - increment
2. Packed is not send - not increment

qemu_send_packet_async with 0 returned meets
the 1st case, because it still queues the packet.

While the increment action is not depends on the
returned value, we cannot use position pointers as a
criteria to send more packets or not. Another state
storage (flag) is required.


If You are not against, I'll cover this with proper
documentation (comments) to simplify future support
and make it more clear.


Best regards,

Vladislav Yaroshchuk


>
> It would not hide the state, but it would rather make it clear that the
> condition vmnet_send_bh can execute. If you see the current
> implementation of vmnet_send_bh, you'll find the send_enabled flag, but
> it does not tell the exact condition it requires to be enabled. You have
> to then jump to all assignments for the flag to know it becomes true iff
> every packets in the buffer are sent. It is obvious if vmnet_send_bh
> directly states `if (packets_send_current_pos < packets_send_end_pos)`.
>
> Eliminating the flag would also remove the possiblity of forgetting to
> maintain the separate state.
>
>
> >
> >       > send_enabled can be eliminated. When it is enabled,
> packets_send_pos
> >       > and packets_batch_size must be equal. They must not be equal
> >       > otherwise. packets_send_pos must represent the position of the
> >     packet
> >       > which is not sent yet, possibly in the process of sending.
> >       > vmnet_send_completed must call qemu_send_wrapper before
> scheduling
> >       > send_bh. bh_send should do nothing if s->packets_send_pos <
> >       > s->packets_batch_size.
> >
> >      > +}
> >      > +
> >      > +
> >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s) {
> >      > +    ssize_t size;
> >      > +
> >      > +    /*
> >      > +     * Packets to send lay in [current_pos..end_pos)
> >      > +     * (including current_pos, excluding end_pos)
> >      > +     */
> >      > +    while (s->packets_send_current_pos <
> s->packets_send_end_pos) {
> >      > +        size =3D qemu_send_packet_async(&s->nc,
> >      > +
> >     s->iov_buf[s->packets_send_current_pos].iov_base,
> >      > +
> >     s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
> >      > +                                      vmnet_send_completed);
> >      > +        ++s->packets_send_current_pos;
> >      > +        if (size =3D=3D 0) {
> >      > +            /* QEMU is not ready - wait for completion callback
> >     call */
> >      > +            return false;
> >      > +        }
> >      > +    }
> >      > +    return true;
> >      > +}
> >      > +
> >      > +
> >      > +static void vmnet_send_bh(void *opaque)
> >      > +{
> >      > +    NetClientState *nc =3D (NetClientState *) opaque;
> >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc)=
;
> >      > +    struct vmpktdesc *packets =3D s->packets_buf;
> >      > +    vmnet_return_t status;
> >      > +    int i;
> >      > +
> >      > +    /*
> >      > +     * Do nothing if QEMU is not ready - wait
> >      > +     * for completion callback invocation
> >      > +     */
> >      > +    if (!s->send_enabled) {
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    /* Read as many packets as present */
> >      > +    s->packets_send_current_pos =3D 0;
> >      > +    s->packets_send_end_pos =3D VMNET_PACKETS_LIMIT;
> >      > +    for (i =3D 0; i < s->packets_send_end_pos; ++i) {
> >      > +        packets[i].vm_pkt_size =3D s->max_packet_size;
> >      > +        packets[i].vm_pkt_iovcnt =3D 1;
> >      > +        packets[i].vm_flags =3D 0;
> >      > +    }
> >      > +
> >      > +    status =3D vmnet_read(s->vmnet_if, packets,
> >     &s->packets_send_end_pos);
> >      > +    if (status !=3D VMNET_SUCCESS) {
> >      > +        error_printf("vmnet: read failed: %s\n",
> >      > +                     vmnet_status_map_str(status));
> >      > +        s->packets_send_current_pos =3D 0;
> >      > +        s->packets_send_end_pos =3D 0;
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    /* Send packets to QEMU */
> >      > +    s->send_enabled =3D vmnet_qemu_send_wrapper(s);
> >      > +}
> >      > +
> >      > +
> >      > +static void vmnet_bufs_init(VmnetCommonState *s)
> >      > +{
> >      > +    struct vmpktdesc *packets =3D s->packets_buf;
> >      > +    struct iovec *iov =3D s->iov_buf;
> >      > +    int i;
> >      > +
> >      > +    for (i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      > +        iov[i].iov_len =3D s->max_packet_size;
> >      > +        iov[i].iov_base =3D g_malloc0(iov[i].iov_len);
> >      > +        packets[i].vm_pkt_iov =3D iov + i;
> >      > +    }
> >      > +}
> >      > +
> >      > +
> >      > +const char *vmnet_status_map_str(vmnet_return_t status)
> >      > +{
> >      > +    switch (status) {
> >      > +    case VMNET_SUCCESS:
> >      > +        return "success";
> >      > +    case VMNET_FAILURE:
> >      > +        return "general failure (possibly not enough
> privileges)";
> >      > +    case VMNET_MEM_FAILURE:
> >      > +        return "memory allocation failure";
> >      > +    case VMNET_INVALID_ARGUMENT:
> >      > +        return "invalid argument specified";
> >      > +    case VMNET_SETUP_INCOMPLETE:
> >      > +        return "interface setup is not complete";
> >      > +    case VMNET_INVALID_ACCESS:
> >      > +        return "invalid access, permission denied";
> >      > +    case VMNET_PACKET_TOO_BIG:
> >      > +        return "packet size is larger than MTU";
> >      > +    case VMNET_BUFFER_EXHAUSTED:
> >      > +        return "buffers exhausted in kernel";
> >      > +    case VMNET_TOO_MANY_PACKETS:
> >      > +        return "packet count exceeds limit";
> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
> >      > +    case VMNET_SHARING_SERVICE_BUSY:
> >      > +        return "conflict, sharing service is in use";
> >      > +#endif
> >      > +    default:
> >      > +        return "unknown vmnet error";
> >      > +    }
> >      > +}
> >      > +
> >      > +
> >      > +int vmnet_if_create(NetClientState *nc,
> >      > +                    xpc_object_t if_desc,
> >      > +                    Error **errp)
> >      > +{
> >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc)=
;
> >      > +    dispatch_semaphore_t if_created_sem =3D
> >     dispatch_semaphore_create(0);
> >      > +    __block vmnet_return_t if_status;
> >      > +
> >      > +    s->if_queue =3D dispatch_queue_create(
> >      > +        "org.qemu.vmnet.if_queue",
> >      > +        DISPATCH_QUEUE_SERIAL
> >      > +    );
> >      > +
> >      > +    xpc_dictionary_set_bool(
> >      > +        if_desc,
> >      > +        vmnet_allocate_mac_address_key,
> >      > +        false
> >      > +    );
> >      > +
> >      > +#ifdef DEBUG
> >      > +    qemu_log("vmnet.start.interface_desc:\n");
> >      > +    xpc_dictionary_apply(if_desc,
> >      > +                         ^bool(const char *k, xpc_object_t v) {
> >      > +                             char *desc =3D
> xpc_copy_description(v);
> >      > +                             qemu_log("  %s=3D%s\n", k, desc);
> >      > +                             free(desc);
> >      > +                             return true;
> >      > +                         });
> >      > +#endif /* DEBUG */
> >      > +
> >      > +    s->vmnet_if =3D vmnet_start_interface(
> >      > +        if_desc,
> >      > +        s->if_queue,
> >      > +        ^(vmnet_return_t status, xpc_object_t interface_param) =
{
> >      > +            if_status =3D status;
> >      > +            if (status !=3D VMNET_SUCCESS || !interface_param) =
{
> >      > +                dispatch_semaphore_signal(if_created_sem);
> >      > +                return;
> >      > +            }
> >      > +
> >      > +#ifdef DEBUG
> >      > +            qemu_log("vmnet.start.interface_param:\n");
> >      > +            xpc_dictionary_apply(interface_param,
> >      > +                                 ^bool(const char *k,
> >     xpc_object_t v) {
> >      > +                                     char *desc =3D
> >     xpc_copy_description(v);
> >      > +                                     qemu_log("  %s=3D%s\n", k,
> desc);
> >      > +                                     free(desc);
> >      > +                                     return true;
> >      > +                                 });
> >      > +#endif /* DEBUG */
> >      > +
> >      > +            s->mtu =3D xpc_dictionary_get_uint64(
> >      > +                interface_param,
> >      > +                vmnet_mtu_key);
> >      > +            s->max_packet_size =3D xpc_dictionary_get_uint64(
> >      > +                interface_param,
> >      > +                vmnet_max_packet_size_key);
> >      > +
> >      > +            dispatch_semaphore_signal(if_created_sem);
> >      > +        });
> >      > +
> >      > +    if (s->vmnet_if =3D=3D NULL) {
> >      > +        dispatch_release(s->if_queue);
> >      > +        dispatch_release(if_created_sem);
> >      > +        error_setg(errp,
> >      > +                   "unable to create interface with requested
> >     params");
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    dispatch_semaphore_wait(if_created_sem,
> DISPATCH_TIME_FOREVER);
> >      > +    dispatch_release(if_created_sem);
> >      > +
> >      > +    if (if_status !=3D VMNET_SUCCESS) {
> >      > +        dispatch_release(s->if_queue);
> >      > +        error_setg(errp,
> >      > +                   "cannot create vmnet interface: %s",
> >      > +                   vmnet_status_map_str(if_status));
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    s->send_bh =3D aio_bh_new(qemu_get_aio_context(),
> >     vmnet_send_bh, nc);
> >      > +    s->send_enabled =3D true;
> >      > +    vmnet_bufs_init(s);
> >      > +
> >      > +    vmnet_interface_set_event_callback(
> >      > +        s->vmnet_if,
> >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +        s->if_queue,
> >      > +        ^(interface_event_t event_id, xpc_object_t event) {
> >      > +            assert(event_id =3D=3D
> VMNET_INTERFACE_PACKETS_AVAILABLE);
> >      > +            /*
> >      > +             * This function is being called from a non qemu
> >     thread, so
> >      > +             * we only schedule a BH, and do the rest of the io
> >     completion
> >      > +             * handling from vmnet_send_bh() which runs in a
> >     qemu context.
> >      > +             */
> >      > +            qemu_bh_schedule(s->send_bh);
> >      > +        });
> >      > +
> >      > +    return 0;
> >      > +}
> >      > +
> >      > +
> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      > +                             const uint8_t *buf,
> >      > +                             size_t size)
> >      > +{
> >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc)=
;
> >      > +    struct vmpktdesc packet;
> >      > +    struct iovec iov;
> >      > +    int pkt_cnt;
> >      > +    vmnet_return_t if_status;
> >      > +
> >      > +    if (size > s->max_packet_size) {
> >      > +        warn_report("vmnet: packet is too big, %zu > %" PRIu64,
> >      > +        packet.vm_pkt_size,
> >      > +        s->max_packet_size);
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    iov.iov_base =3D (char *) buf;
> >      > +    iov.iov_len =3D size;
> >      > +
> >      > +    packet.vm_pkt_iovcnt =3D 1;
> >      > +    packet.vm_flags =3D 0;
> >      > +    packet.vm_pkt_size =3D size;
> >      > +    packet.vm_pkt_iov =3D &iov;
> >      > +    pkt_cnt =3D 1;
> >      > +
> >      > +    if_status =3D vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> >      > +    if (if_status !=3D VMNET_SUCCESS) {
> >      > +        error_report("vmnet: write error: %s\n",
> >      > +                     vmnet_status_map_str(if_status));
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    if (if_status =3D=3D VMNET_SUCCESS && pkt_cnt) {
> >
> >     `if_status =3D=3D VMNET_SUCCESS` is redundant.
> >
> >
> > Missed this, thanks.
> >
> >     Regards,
> >     Akihiko Odaki
> >
> >      > +        return size;
> >      > +    }
> >      > +    return 0;
> >      > +}
> >      > +
> >      > +
> >      > +void vmnet_cleanup_common(NetClientState *nc)
> >      > +{
> >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc, nc)=
;
> >      > +    dispatch_semaphore_t if_stopped_sem;
> >      > +
> >      > +    if (s->vmnet_if =3D=3D NULL) {
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    vmnet_interface_set_event_callback(
> >      > +        s->vmnet_if,
> >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +        NULL,
> >      > +        NULL);
> >
> >     I don't think this vmnet_interface_set_event_callback call is
> necessary.
> >
> >
> > I kept in mind that vmnet processing lives in a separate thread
> > and while cleanup it may continue receiving packets. While the
> > queue is not empty, vmnet_stop_interface hangs. Unregistering
> > callback ensures that this queue will be emptied asap.
> >
> > It will work without vmnet_interface_set_event_callback here,
> > but I think it's better to be respectful to vmnet and clean everything
> > we can :)
>
> You may put qemu_purge_queued_packets after vmnet_stop_interface if you
> think about the case it keeps receving packets while cleaning up since
> it is the only thing it does before calling vmnet_stop_interface.
> vmnet_stop_interface would then stop things in the proper order. It may
> decide to stop event callbacks first. Otherwise, it may decide to stop
> some internal heavy functionality first. It is up to vmnet.framework.
>
> Regards,
> Akihiko Odaki
>
> > Thank you!
> >
> > Best Regards,
> >
> > Vladislav
> >
> >      > +
> >      > +    qemu_purge_queued_packets(nc);
> >      > +
> >      > +    if_stopped_sem =3D dispatch_semaphore_create(0);
> >      > +    vmnet_stop_interface(
> >      > +        s->vmnet_if,
> >      > +        s->if_queue,
> >      > +        ^(vmnet_return_t status) {
> >      > +            assert(status =3D=3D VMNET_SUCCESS);
> >      > +            dispatch_semaphore_signal(if_stopped_sem);
> >      > +        });
> >      > +    dispatch_semaphore_wait(if_stopped_sem,
> DISPATCH_TIME_FOREVER);
> >      > +
> >      > +    qemu_bh_delete(s->send_bh);
> >      > +    dispatch_release(if_stopped_sem);
> >      > +    dispatch_release(s->if_queue);
> >      > +
> >      > +    for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      > +        g_free(s->iov_buf[i].iov_base);
> >      > +    }
> >      > +}
> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >      > index f07afaaf21..2f4eb1db2d 100644
> >      > --- a/net/vmnet-shared.c
> >      > +++ b/net/vmnet-shared.c
> >      > @@ -10,16 +10,103 @@
> >      >
> >      >   #include "qemu/osdep.h"
> >      >   #include "qapi/qapi-types-net.h"
> >      > +#include "qapi/error.h"
> >      >   #include "vmnet_int.h"
> >      >   #include "clients.h"
> >      > -#include "qemu/error-report.h"
> >      > -#include "qapi/error.h"
> >      >
> >      >   #include <vmnet/vmnet.h>
> >      >
> >      > +typedef struct VmnetSharedState {
> >      > +    VmnetCommonState cs;
> >      > +} VmnetSharedState;
> >      > +
> >      > +
> >      > +static bool validate_options(const Netdev *netdev, Error **errp=
)
> >      > +{
> >      > +    const NetdevVmnetSharedOptions *options =3D
> >     &(netdev->u.vmnet_shared);
> >      > +
> >      > +#if !defined(MAC_OS_VERSION_11_0) || \
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> >      > +    if (options->has_isolated) {
> >      > +        error_setg(errp,
> >      > +                   "vmnet-shared.isolated feature is "
> >      > +                   "unavailable: outdated vmnet.framework API")=
;
> >      > +        return false;
> >      > +    }
> >      > +#endif
> >      > +
> >      > +    if ((options->has_start_address ||
> >      > +         options->has_end_address ||
> >      > +         options->has_subnet_mask) &&
> >      > +        !(options->has_start_address &&
> >      > +          options->has_end_address &&
> >      > +          options->has_subnet_mask)) {
> >      > +        error_setg(errp,
> >      > +                   "'start-address', 'end-address',
> 'subnet-mask' "
> >      > +                   "should be provided together"
> >      > +        );
> >      > +        return false;
> >      > +    }
> >      > +
> >      > +    return true;
> >      > +}
> >      > +
> >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
> >      > +{
> >      > +    const NetdevVmnetSharedOptions *options =3D
> >     &(netdev->u.vmnet_shared);
> >      > +    xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NULL, =
0);
> >      > +
> >      > +    xpc_dictionary_set_uint64(
> >      > +        if_desc,
> >      > +        vmnet_operation_mode_key,
> >      > +        VMNET_SHARED_MODE
> >      > +    );
> >      > +
> >      > +    if (options->has_nat66_prefix) {
> >      > +        xpc_dictionary_set_string(if_desc,
> >      > +                                  vmnet_nat66_prefix_key,
> >      > +                                  options->nat66_prefix);
> >      > +    }
> >      > +
> >      > +    if (options->has_start_address) {
> >      > +        xpc_dictionary_set_string(if_desc,
> >      > +                                  vmnet_start_address_key,
> >      > +                                  options->start_address);
> >      > +        xpc_dictionary_set_string(if_desc,
> >      > +                                  vmnet_end_address_key,
> >      > +                                  options->end_address);
> >      > +        xpc_dictionary_set_string(if_desc,
> >      > +                                  vmnet_subnet_mask_key,
> >      > +                                  options->subnet_mask);
> >      > +    }
> >      > +
> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
> >      > +    xpc_dictionary_set_bool(
> >      > +        if_desc,
> >      > +        vmnet_enable_isolation_key,
> >      > +        options->isolated
> >      > +    );
> >      > +#endif
> >      > +
> >      > +    return if_desc;
> >      > +}
> >      > +
> >      > +static NetClientInfo net_vmnet_shared_info =3D {
> >      > +    .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,
> >      > +    .size =3D sizeof(VmnetSharedState),
> >      > +    .receive =3D vmnet_receive_common,
> >      > +    .cleanup =3D vmnet_cleanup_common,
> >      > +};
> >      > +
> >      >   int net_init_vmnet_shared(const Netdev *netdev, const char
> *name,
> >      >                             NetClientState *peer, Error **errp)
> >      >   {
> >      > -  error_setg(errp, "vmnet-shared is not implemented yet");
> >      > -  return -1;
> >      > +    NetClientState *nc =3D
> qemu_new_net_client(&net_vmnet_shared_info,
> >      > +                                             peer,
> >     "vmnet-shared", name);
> >      > +    if (!validate_options(netdev, errp)) {
> >      > +        g_assert_not_reached();
> >      > +        return -1;
> >      > +    }
> >      > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >      >   }
> >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >      > index aac4d5af64..8f3321ef3e 100644
> >      > --- a/net/vmnet_int.h
> >      > +++ b/net/vmnet_int.h
> >      > @@ -15,11 +15,50 @@
> >      >   #include "clients.h"
> >      >
> >      >   #include <vmnet/vmnet.h>
> >      > +#include <dispatch/dispatch.h>
> >      > +
> >      > +/**
> >      > + *  From vmnet.framework documentation
> >      > + *
> >      > + *  Each read/write call allows up to 200 packets to be
> >      > + *  read or written for a maximum of 256KB.
> >      > + *
> >      > + *  Each packet written should be a complete
> >      > + *  ethernet frame.
> >      > + *
> >      > + * https://developer.apple.com/documentation/vmnet
> >     <https://developer.apple.com/documentation/vmnet>
> >      > + */
> >      > +#define VMNET_PACKETS_LIMIT 200
> >      >
> >      >   typedef struct VmnetCommonState {
> >      > -  NetClientState nc;
> >      > +    NetClientState nc;
> >      > +    interface_ref vmnet_if;
> >      > +
> >      > +    uint64_t mtu;
> >      > +    uint64_t max_packet_size;
> >      >
> >      > +    dispatch_queue_t if_queue;
> >      > +
> >      > +    QEMUBH *send_bh;
> >      > +    bool send_enabled;
> >      > +
> >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >      > +    int packets_send_current_pos;
> >      > +    int packets_send_end_pos;
> >      > +
> >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >      >   } VmnetCommonState;
> >      >
> >      > +const char *vmnet_status_map_str(vmnet_return_t status);
> >      > +
> >      > +int vmnet_if_create(NetClientState *nc,
> >      > +                    xpc_object_t if_desc,
> >      > +                    Error **errp);
> >      > +
> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      > +                             const uint8_t *buf,
> >      > +                             size_t size);
> >      > +
> >      > +void vmnet_cleanup_common(NetClientState *nc);
> >      >
> >      >   #endif /* VMNET_INT_H */
> >
>
>

--0000000000000d01de05da35ace0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 15 =D0=BC=D0=B0=D1=80. 2022 =D0=
=B3., 1:34 AM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">=
akihiko.odaki@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 2022/03/15 6:50, Vladislav Yaroshchuk wrote:<br>
&gt; Thank you, Akihiko<br>
&gt; <br>
&gt; On Mon, Mar 14, 2022 at 10:46 PM Akihiko Odaki &lt;<a href=3D"mailto:a=
kihiko.odaki@gmail.com" target=3D"_blank" rel=3D"noreferrer">akihiko.odaki@=
gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; vmnet.framework supports iov, but writing mor=
e than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; one iov into vmnet interface fails with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Collecting =
provided iovs into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; one and passing it to vmnet works fine. That&=
#39;s the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; reason why receive_iov() left unimplemented. =
But it still<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; works with good enough performance having .re=
ceive()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; implemented only.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"=
mailto:phillip@axleos.com" target=3D"_blank" rel=3D"noreferrer">phillip@axl=
eos.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:phillip@axleos.com" ta=
rget=3D"_blank" rel=3D"noreferrer">phillip@axleos.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Vladislav Yaroshchuk<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:Vladislav.Yaroshchuk@jetbrain=
s.com" target=3D"_blank" rel=3D"noreferrer">Vladislav.Yaroshchuk@jetbrains.=
com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Vladislav.Yaroshchuk@j=
etbrains.com" target=3D"_blank" rel=3D"noreferrer">Vladislav.Yaroshchuk@jet=
brains.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-common.m | 298<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=A0 95 +++=
+++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =C2=A0 |=C2=
=A0 41 ++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A03 files changed, 429 insertions(+=
), 5 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet-common.m b/net/vmnet-c=
ommon.m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 56612c72ce..20a33d2591 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet-common.m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet-common.m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,6 +10,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/qapi-types-ne=
t.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;vmnet_int.h&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -17,4 +19,300 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static bool vmnet_qemu_send_wrapper(VmnetCom=
monState *s);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The names of vmnet_qemu_send_wrapper and vmnet_send=
_bh does not tell<br>
&gt;=C2=A0 =C2=A0 =C2=A0them apart well. Since only vmnet_send_bh does read=
ing, its name may<br>
&gt;=C2=A0 =C2=A0 =C2=A0include &quot;read&quot; to clarify that. &quot;wra=
pper&quot; in vmnet_qemu_send_wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0may<br>
&gt;=C2=A0 =C2=A0 =C2=A0be also misleading as it does more than just callin=
g the underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0facility, but it also updates VmnetCommonState.<br>
&gt; <br>
&gt; <br>
&gt; Ok, I&#39;ll think about how to name them better.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_completed(NetClientSt=
ate *nc, ssize_t len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* Complete sending packets le=
ft in VmnetCommonState buffers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D vmnet_q=
emu_send_wrapper(s);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It must qemu_bh_schedule(s-&gt;send_bh) after vmnet=
_qemu_send_wrapper.<br>
&gt; <br>
&gt; <br>
&gt; Agree with you, thanks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, send_enabled flag can be removed as explained=
 in:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.mail-archive.com/qemu-devel@=
nongnu.org/msg873923.html" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg873923.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html</a>&g=
t;<br>
&gt; <br>
&gt; <br>
&gt; Not sure about this. Values of packets_send_current_pos<br>
&gt; and packets_send_end_pos may be equal, but QEMU may be<br>
&gt; not ready to receive new packets - the explanation:<br>
&gt; 1. We are sending packets to QEMU with qemu_send_packet_async:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 packets_send_current_pos =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 packets_send_end_pos =3D 5<br>
&gt; 2. All five packets (0, 1, 2, 3, 4) have been successfully sent to QEM=
U,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 but qemu_send_packet_async returned 0 &quot;no mor=
e packets&quot; after<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the last invocation<br>
&gt; 3. In spite of this, all five packets are sent and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 packets_send_current_pos =3D=3D packets_send_end_p=
os =3D=3D 5<br>
&gt; 4. It seems that &quot;pointers are equal -&gt;=C2=A0 QEMU is ready&qu=
ot;, but actually<br>
&gt;=C2=A0 =C2=A0 =C2=A0 it is not.<br>
&gt; <br>
&gt; Also, hiding QEMU &quot;ready&quot;/&quot;not ready&quot;=C2=A0state b=
ehind pointers is a<br>
&gt; bad choice I think. Having a concrete flag makes this more clear.<br>
&gt; It provides=C2=A0understandability, not complexity=C2=A0(imho).<br>
<br>
packets_send_current_pos must not be incremented if <br>
qemu_send_packet_async returned 0. It must tell the position of the <br>
packet currently being sent.<br><br></blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"></blockquote></div><div class=3D"gmail_quote" dir=3D"auto"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"></blockquote></div><div class=3D"gmail_quote" dir=3D"au=
to"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br></blockquote></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">&gt; must be incremented=C2=A0</div><div dir=
=3D"auto">It cannot.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If qemu_send_packet_async returns 0,</div><div dir=3D"auto">it still con=
sumes (!) (queues internally) the packet.=C2=A0</div><div dir=3D"auto">So t=
he packets_send_current_pos must be</div><div dir=3D"auto">incremented=C2=
=A0</div><div dir=3D"auto">to prevent sending same packet multiple times.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">The idea is simple:</div>=
<div dir=3D"auto">1. We&#39;ve sent the packet - increment</div><div dir=3D=
"auto">2. Packed is not send - not increment</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">qemu_send_packet_async with 0 returned meets</div><div=
 dir=3D"auto">the 1st case, because it still queues the packet.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">While the increment action is not d=
epends on the</div><div dir=3D"auto">returned value, we cannot use position=
 pointers as a=C2=A0</div><div dir=3D"auto">criteria to send more packets o=
r not. Another state</div><div dir=3D"auto">storage (flag) is required.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>If You are not against, I&#39;ll cover this with proper</div><div dir=3D"a=
uto">documentation (comments) to simplify future support</div><div dir=3D"a=
uto">and make it more clear.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Vladislav Yaroshchuk</div><div dir=3D"auto"><br></di=
v><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
It would not hide the state, but it would rather make it clear that the <br=
>
condition vmnet_send_bh can execute. If you see the current <br>
implementation of vmnet_send_bh, you&#39;ll find the send_enabled flag, but=
 <br>
it does not tell the exact condition it requires to be enabled. You have <b=
r>
to then jump to all assignments for the flag to know it becomes true iff <b=
r>
every packets in the buffer are sent. It is obvious if vmnet_send_bh <br>
directly states `if (packets_send_current_pos &lt; packets_send_end_pos)`.<=
br>
<br>
Eliminating the flag would also remove the possiblity of forgetting to <br>
maintain the separate state.<br><br></blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; send_enabled can be eliminated. When it=
 is enabled, packets_send_pos<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and packets_batch_size must be equal. T=
hey must not be equal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; otherwise. packets_send_pos must repres=
ent the position of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0packet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; which is not sent yet, possibly in the =
process of sending.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; vmnet_send_completed must call qemu_sen=
d_wrapper before scheduling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; send_bh. bh_send should do nothing if s=
-&gt;packets_send_pos &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; s-&gt;packets_batch_size.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static bool vmnet_qemu_send_wrapper(VmnetCom=
monState *s) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0* Packets to send lay in=
 [current_pos..end_pos)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0* (including current_pos=
, excluding end_pos)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 while (s-&gt;packets_send_curr=
ent_pos &lt; s-&gt;packets_send_end_pos) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_se=
nd_packet_async(&amp;s-&gt;nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0s-&gt;iov_buf[s-&gt;packets_send_current_pos].iov_b=
ase,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0s-&gt;packets_buf[s-&gt;packets_send_current_pos].v=
m_pkt_size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 vmnet_send_completed);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++s-&gt;packets_=
send_current_pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D =
0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 QEMU is not ready - wait for completion callback<br>
&gt;=C2=A0 =C2=A0 =C2=A0call */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_bh(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState *nc =3D (NetCli=
entState *) opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D =
s-&gt;packets_buf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_return_t status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0* Do nothing if QEMU is =
not ready - wait<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0* for completion callbac=
k invocation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (!s-&gt;send_enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* Read as many packets as pre=
sent */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;packets_send_current_pos=
 =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;packets_send_end_pos =3D=
 VMNET_PACKETS_LIMIT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; s-&gt;pac=
kets_send_end_pos; ++i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pk=
t_size =3D s-&gt;max_packet_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pk=
t_iovcnt =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_fl=
ags =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 status =3D vmnet_read(s-&gt;vm=
net_if, packets,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;s-&gt;packets_send_end_pos);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (status !=3D VMNET_SUCCESS)=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&qu=
ot;vmnet: read failed: %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(status));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_se=
nd_current_pos =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_se=
nd_end_pos =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* Send packets to QEMU */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D vmnet_q=
emu_send_wrapper(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_bufs_init(VmnetCommonState=
 *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D =
s-&gt;packets_buf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec *iov =3D s-&gt;io=
v_buf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; VMNET_PAC=
KETS_LIMIT; ++i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_len =
=3D s-&gt;max_packet_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_base =
=3D g_malloc0(iov[i].iov_len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pk=
t_iov =3D iov + i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +const char *vmnet_status_map_str(vmnet_retur=
n_t status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;suc=
cess&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;gen=
eral failure (possibly not enough privileges)&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILURE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;mem=
ory allocation failure&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ARGUMENT:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;inv=
alid argument specified&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCOMPLETE:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;int=
erface setup is not complete&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ACCESS:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;inv=
alid access, permission denied&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO_BIG:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;pac=
ket size is larger than MTU&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXHAUSTED:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;buf=
fers exhausted in kernel&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_PACKETS:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;pac=
ket count exceeds limit&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED =
&gt;=3D MAC_OS_VERSION_11_0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUS=
Y:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;con=
flict, sharing service is in use&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unk=
nown vmnet error&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_create=
d_sem =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0dispatch_semaphore_create(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 __block vmnet_return_t if_stat=
us;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;if_queue =3D dispatch_qu=
eue_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.v=
mnet.if_queue&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_S=
ERIAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_allocate_m=
ac_address_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#ifdef DEBUG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_log(&quot;vmnet.start.int=
erface_desc:\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_apply(if_desc,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xpc_ob=
ject_t v) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =
=3D xpc_copy_description(v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quo=
t;=C2=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif /* DEBUG */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;vmnet_if =3D vmnet_start=
_interface(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t=
 status, xpc_object_t interface_param) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
_status =3D status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (status !=3D VMNET_SUCCESS || !interface_param) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dispatch_semaphore_signal(if_created_sem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#ifdef DEBUG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qe=
mu_log(&quot;vmnet.start.interface_param:\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xp=
c_dictionary_apply(interface_param,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^bool(const char *k,<br>
&gt;=C2=A0 =C2=A0 =C2=A0xpc_object_t v) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char *desc =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0xpc_copy_description(v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qemu_log(&quot;=C2=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0free(desc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0});<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif /* DEBUG */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-=
&gt;mtu =3D xpc_dictionary_get_uint64(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 interface_param,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vmnet_mtu_key);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-=
&gt;max_packet_size =3D xpc_dictionary_get_uint64(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 interface_param,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vmnet_max_packet_size_key);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 di=
spatch_semaphore_signal(if_created_sem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release=
(s-&gt;if_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release=
(if_created_sem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unable to create interface with requested<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0params&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_cre=
ated_sem, DISPATCH_TIME_FOREVER);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_release(if_created_se=
m);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCE=
SS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release=
(s-&gt;if_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cannot create vmnet interface: %s&quot;,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_bh =3D aio_bh_new(q=
emu_get_aio_context(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0vmnet_send_bh, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D true;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_call=
back(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_=
PACKETS_AVAILABLE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_even=
t_t event_id, xpc_object_t event) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 as=
sert(event_id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABLE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* This function is being called from a non qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0thread, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* we only schedule a BH, and do the rest of the io<br>
&gt;=C2=A0 =C2=A0 =C2=A0completion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* handling from vmnet_send_bh() which runs in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu context.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qe=
mu_bh_schedule(s-&gt;send_bh);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ssize_t vmnet_receive_common(NetClientState =
*nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t=
 *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc packet;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec iov;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (size &gt; s-&gt;max_packet=
_size) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quo=
t;vmnet: packet is too big, %zu &gt; %&quot; PRIu64,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packet.vm_pkt_si=
ze,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet=
_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 iov.iov_base =3D (char *) buf;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 iov.iov_len =3D size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iovcnt =3D 1;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_flags =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_size =3D size;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iov =3D &amp;iov=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 pkt_cnt =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if_status =3D vmnet_write(s-&g=
t;vmnet_if, &amp;packet, &amp;pkt_cnt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCE=
SS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&qu=
ot;vmnet: write error: %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status =3D=3D VMNET_SUC=
CESS &amp;&amp; pkt_cnt) {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0`if_status =3D=3D VMNET_SUCCESS` is redundant.<br>
&gt; <br>
&gt; <br>
&gt; Missed this, thanks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Akihiko Odaki<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +void vmnet_cleanup_common(NetClientState *nc=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_stoppe=
d_sem;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_call=
back(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_=
PACKETS_AVAILABLE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t think this vmnet_interface_set_event_ca=
llback call is necessary.<br>
&gt; <br>
&gt; <br>
&gt; I kept in mind that vmnet processing lives in a separate thread<br>
&gt; and while cleanup it may continue receiving packets. While the<br>
&gt; queue is not empty, vmnet_stop_interface hangs. Unregistering<br>
&gt; callback ensures that this queue will be emptied asap.<br>
&gt; <br>
&gt; It will work without vmnet_interface_set_event_callback here,<br>
&gt; but I think it&#39;s better to be respectful to vmnet and clean everyt=
hing<br>
&gt; we can :)<br>
<br>
You may put qemu_purge_queued_packets after vmnet_stop_interface if you <br=
>
think about the case it keeps receving packets while cleaning up since <br>
it is the only thing it does before calling vmnet_stop_interface. <br>
vmnet_stop_interface would then stop things in the proper order. It may <br=
>
decide to stop event callbacks first. Otherwise, it may decide to stop <br>
some internal heavy functionality first. It is up to vmnet.framework.<br>
<br>
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; Thank you!<br>
&gt; <br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Vladislav<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if_stopped_sem =3D dispatch_se=
maphore_create(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_stop_interface(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t=
 status) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 as=
sert(status =3D=3D VMNET_SUCCESS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 di=
spatch_semaphore_signal(if_stopped_sem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_sto=
pped_sem, DISPATCH_TIME_FOREVER);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_bh_delete(s-&gt;send_bh);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_release(if_stopped_se=
m);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_release(s-&gt;if_queu=
e);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; VMNET=
_PACKETS_LIMIT; ++i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;iov=
_buf[i].iov_base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet-shared.c b/net/vmnet-s=
hared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index f07afaaf21..2f4eb1db2d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet-shared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet-shared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,16 +10,103 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/qapi-types-ne=
t.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;vmnet_int.h&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +typedef struct VmnetSharedState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState cs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +} VmnetSharedState;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static bool validate_options(const Netdev *n=
etdev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions=
 *options =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;(netdev-&gt;u.vmnet_shared);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if !defined(MAC_OS_VERSION_11_0) || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED =
&lt; MAC_OS_VERSION_11_0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_isolated) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;vmnet-shared.isolated feature is &quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unavailable: outdated vmnet.framework API&=
quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if ((options-&gt;has_start_add=
ress ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&g=
t;has_end_address ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&g=
t;has_subnet_mask) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(options-&gt;ha=
s_start_address &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&=
gt;has_end_address &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&=
gt;has_subnet_mask)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;start-address&#39;, &#39;end-address&=
#39;, &#39;subnet-mask&#39; &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;should be provided together&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static xpc_object_t build_if_desc(const Netd=
ev *netdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions=
 *options =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;(netdev-&gt;u.vmnet_shared);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D xpc_d=
ictionary_create(NULL, NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_=
mode_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_SHARED_MOD=
E<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_nat66_pref=
ix) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_s=
et_string(if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vmnet_nat66_prefix_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 options-&gt;nat66_prefix);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_start_addr=
ess) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_s=
et_string(if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vmnet_start_address_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 options-&gt;start_address);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_s=
et_string(if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vmnet_end_address_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 options-&gt;end_address);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_s=
et_string(if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vmnet_subnet_mask_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 options-&gt;subnet_mask);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED =
&gt;=3D MAC_OS_VERSION_11_0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_iso=
lation_key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isol=
ated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static NetClientInfo net_vmnet_shared_info =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VM=
NET_SHARED,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetSharedSt=
ate),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .receive =3D vmnet_receive_com=
mon,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cleanup_com=
mon,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0int net_init_vmnet_shared(const N=
etdev *netdev, const char *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetClientState *=
peer, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 error_setg(errp, &quot;vmnet-shared i=
s not implemented yet&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_ne=
w_net_client(&amp;net_vmnet_shared_info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0peer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;vmnet-shared&quot;, name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (!validate_options(netdev, =
errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_rea=
ched();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, bui=
ld_if_desc(netdev), errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index aac4d5af64..8f3321ef3e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet_int.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet_int.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -15,11 +15,50 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 From vmnet.framework documentation<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 Each read/write call allows up to 2=
00 packets to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 read or written for a maximum of 25=
6KB.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 Each packet written should be a com=
plete<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 ethernet frame.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * <a href=3D"https://developer.apple.com/do=
cumentation/vmnet" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
developer.apple.com/documentation/vmnet</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://developer.apple.com/document=
ation/vmnet" rel=3D"noreferrer noreferrer" target=3D"_blank">https://develo=
per.apple.com/documentation/vmnet</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#define VMNET_PACKETS_LIMIT 200<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0typedef struct VmnetCommonState {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 NetClientState nc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState nc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 interface_ref vmnet_if;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 uint64_t mtu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 uint64_t max_packet_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_queue_t if_queue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 QEMUBH *send_bh;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 bool send_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc packets_buf[V=
MNET_PACKETS_LIMIT];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int packets_send_current_pos;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int packets_send_end_pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec iov_buf[VMNET_PAC=
KETS_LIMIT];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0} VmnetCommonState;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +const char *vmnet_status_map_str(vmnet_retur=
n_t status);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ssize_t vmnet_receive_common(NetClientState =
*nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t=
 *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +void vmnet_cleanup_common(NetClientState *nc=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#endif /* VMNET_INT_H */<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000000d01de05da35ace0--

