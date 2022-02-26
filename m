Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5734C55AE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:36:33 +0100 (CET)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvNI-0005Vs-5W
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:36:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNvKK-0003u0-3S
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:33:29 -0500
Received: from [2607:f8b0:4864:20::b36] (port=40808
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNvKF-0003K9-Dm
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:33:27 -0500
Received: by mail-yb1-xb36.google.com with SMTP id u12so10868669ybd.7
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uGtlDxRrHQ/ud5wNK0pzZh+tc5Uzb46mpnUnmM9KxU=;
 b=E+IoDD2DTrvhbr0KSXujr7BLjZVCHG2q4Qf2U0fxa0EQIbcx3huG6UtYzxrV/id9Rm
 4bJ5lSn9Kc9ruDQmOn/wouBXj7GbifRk65XidOgYLU+pLH5voeF1HAWWWmHBlyIZo/Mz
 yGQvKBFHc3AzizvOYcbwNozgAqIgDslKaKVYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uGtlDxRrHQ/ud5wNK0pzZh+tc5Uzb46mpnUnmM9KxU=;
 b=hiFBDC8XeJARhQR9z45oS9023hsZ3edhbDWOEiPJrBfnwbY342SDC/U9bOqAUYQIxs
 rVqEIEpsSVZG/M1qJj7sE7bF5in/Qjtqa76f5UqTsC1TielvB7Lr517mof/gRXlz2/R/
 iQBsAc+aX4u/395qGQeAx1obARfBUVyZJZomLxJoKUZGu6EfdQRRhpzZpQJMFr6aQxSt
 89fosnaujh/BUbQkfatUkHInDA0DqdeV/qibDH6yO5gMdDLd7hPBHuD+aySA1SKebWUI
 MTuYMukoYPV5xD7ocBTKT0JIJUssZ61i6uh2cHcv4lKFenQHAq8R7aBJcjiaPA38P/zh
 GbPA==
X-Gm-Message-State: AOAM531FICPmHXHQsY3oUC6idwDJ+/GE3qDgFQwxfzTgigdJAjessxEv
 R+/TEPOnRRJ3M/pa1Pz5P58awP856cKb6WLvUqGOgRjWXnEcAblRlK4=
X-Google-Smtp-Source: ABdhPJyLckorzcY0sLmOHWuvSBaPsx4woXvX9RJPm0KEQSmdi7ZTZwEDkoYpcb7fIc2iOFi+EcJ+TH9v+fNJ+/n/FEs=
X-Received: by 2002:a25:1181:0:b0:624:6c32:e341 with SMTP id
 123-20020a251181000000b006246c32e341mr11205403ybr.437.1645875199833; Sat, 26
 Feb 2022 03:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
In-Reply-To: <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Sat, 26 Feb 2022 14:33:08 +0300
Message-ID: <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, r.bolshakov@yadro.com, 
 eblake@redhat.com, phillip.ennen@gmail.com, phillip@axleos.com, 
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev, 
 Peter Maydell <peter.maydell@linaro.org>, dirty@apple.com, f4bug@amsat.org, 
 agraf@csgraf.de, kraxel@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu_oss@crudebyte.com
Content-Type: multipart/alternative; boundary="000000000000a199c805d8ea2e40"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb36.google.com
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

--000000000000a199c805d8ea2e40
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 26, 2022 at 12:16 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/02/26 17:37, Vladislav Yaroshchuk wrote:
> >
> > Hi Akihiko,
> >
> > On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> >      > Interaction with vmnet.framework in different modes
> >      > differs only on configuration stage, so we can create
> >      > common `send`, `receive`, etc. procedures and reuse them.
> >      >
> >      > vmnet.framework supports iov, but writing more than
> >      > one iov into vmnet interface fails with
> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      > one and passing it to vmnet works fine. That's the
> >      > reason why receive_iov() left unimplemented. But it still
> >      > works with good enough performance having .receive()
> >      > net/vmnet: implement shared mode (vmnet-shared)
> >      >
> >      > Interaction with vmnet.framework in different modes
> >      > differs only on configuration stage, so we can create
> >      > common `send`, `receive`, etc. procedures and reuse them.
> >      >
> >      > vmnet.framework supports iov, but writing more than
> >      > one iov into vmnet interface fails with
> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      > one and passing it to vmnet works fine. That's the
> >      > reason why receive_iov() left unimplemented. But it still
> >      > works with good enough performance having .receive()
> >      > implemented only.
> >      >
> >      > Also, there is no way to unsubscribe from vmnet packages
> >      > receiving except registering and unregistering event
> >      > callback or simply drop packages just ignoring and
> >      > not processing them when related flag is set. Here we do
> >      > using the second way.
> >      >
> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >     <mailto:phillip@axleos.com>>
> >      > Signed-off-by: Vladislav Yaroshchuk
> >     <Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>
> >
> >     Thank you for persistently working on this.
> >
> >      > ---
> >      >   net/vmnet-common.m | 302
> >     +++++++++++++++++++++++++++++++++++++++++++++
> >      >   net/vmnet-shared.c |  94 +++++++++++++-
> >      >   net/vmnet_int.h    |  39 +++++-
> >      >   3 files changed, 430 insertions(+), 5 deletions(-)
> >      >
> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >      > index 56612c72ce..2f70921cae 100644
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
> >      > @@ -17,4 +19,304 @@
> >      >   #include "qapi/error.h"
> >      >
> >      >   #include <vmnet/vmnet.h>
> >      > +#include <dispatch/dispatch.h>
> >      >
> >      > +
> >      > +static inline void vmnet_set_send_bh_scheduled(VmnetCommonState
> *s,
> >      > +                                               bool enable)
> >      > +{
> >      > +    qatomic_set(&s->send_scheduled, enable);
> >      > +}
> >      > +
> >      > +
> >      > +static inline bool vmnet_is_send_bh_scheduled(VmnetCommonState
> *s)
> >      > +{
> >      > +    return qatomic_load_acquire(&s->send_scheduled);
> >      > +}
> >      > +
> >      > +
> >      > +static inline void vmnet_set_send_enabled(VmnetCommonState *s,
> >      > +                                          bool enable)
> >      > +{
> >      > +    if (enable) {
> >      > +        vmnet_interface_set_event_callback(
> >      > +            s->vmnet_if,
> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +            s->if_queue,
> >      > +            ^(interface_event_t event_id, xpc_object_t event) {
> >      > +                assert(event_id ==
> >     VMNET_INTERFACE_PACKETS_AVAILABLE);
> >      > +                /*
> >      > +                 * This function is being called from a non qemu
> >     thread, so
> >      > +                 * we only schedule a BH, and do the rest of the
> >     io completion
> >      > +                 * handling from vmnet_send_bh() which runs in a
> >     qemu context.
> >      > +                 *
> >      > +                 * Avoid scheduling multiple bottom halves
> >      > +                 */
> >      > +                if (!vmnet_is_send_bh_scheduled(s)) {
> >      > +                    vmnet_set_send_bh_scheduled(s, true);
> >
> >     It can be interrupted between vmnet_is_send_bh_scheduled and
> >     vmnet_set_send_bh_scheduled, which leads to data race.
> >
> >
> > Sorry, I did not clearly understand what you meant. Since this
> > callback (block) is submitted on DISPATCH_QUEUE_SERIAL,
> > only one instance of the callback will be executed at any
> > moment of time.
> > https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
> > <
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>
> >
> > Also this is the only place where we schedule a bottom half.
> >
> > After we set the 'send_scheduled' flag, all the other
> > callback  blocks will do nothing (skip the if block) until
> > the bottom half is executed and reset 'send_scheduled'.
> > I don't see any races here :(
> >
> > Correct me if I'm wrong please.
>
> My explanation that the interruption between vmnet_is_send_bh_scheduled
> and vmnet_set_send_bh_scheduled is problematic was actually misleading.
>
> The problem is that vmnet_send_bh resets 'send_scheduled' after calling
> vmnet_read. If we got another packet after vmnet_read, it would be
> silently ignored.
>
> By the way, I forgot to mention another problem: vmnet_send_completed
> calls vmnet_set_send_enabled, but the other packets in the buffer may
> not be sent yet. Also, unregistering callbacks in vmnet_set_send_enabled
> is probably not enough to stop the callback being fired since some
> dispatch blocks are already in the dispatch queue.
>
>
Now I understand what you mean, thanks.
What do you think about the workaround? For me
it is quite difficult question how to synchronize qemu with
vmnet thread, especially with completion callback.



> Regards,
> Akihiko Odaki
>
> >
> >      > +                    qemu_bh_schedule(s->send_bh);
> >      > +                }
> >      > +            });
> >      > +    } else {
> >      > +        vmnet_interface_set_event_callback(
> >      > +            s->vmnet_if,
> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +            NULL,
> >      > +            NULL);
> >      > +    }
> >      > +}
> >      > +
> >      > +
> >      > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +    vmnet_set_send_enabled(s, true);
> >      > +}
> >      > +
> >      > +
> >      > +static void vmnet_send_bh(void *opaque)
> >      > +{
> >      > +    NetClientState *nc = (NetClientState *) opaque;
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +
> >      > +    struct iovec *iov = s->iov_buf;
> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >      > +    int pkt_cnt;
> >      > +    int i;
> >      > +
> >      > +    vmnet_return_t status;
> >      > +    ssize_t size;
> >      > +
> >      > +    /* read as many packets as present */
> >      > +    pkt_cnt = VMNET_PACKETS_LIMIT;
> >
> >     There could be more than VMNET_PACKETS_LIMIT. You may call
> >     vmnet_read in
> >     a loop.
> >
> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >      > +        packets[i].vm_pkt_size = s->max_packet_size;
> >      > +        packets[i].vm_pkt_iovcnt = 1;
> >      > +        packets[i].vm_flags = 0;
> >      > +    }
> >      > +
> >      > +    status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> >      > +    if (status != VMNET_SUCCESS) {
> >      > +        error_printf("vmnet: read failed: %s\n",
> >      > +                     vmnet_status_map_str(status));
> >      > +        goto done;
> >      > +    }
> >      > +
> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >      > +        size = qemu_send_packet_async(nc,
> >      > +                                      iov[i].iov_base,
> >      > +                                      packets[i].vm_pkt_size,
> >      > +                                      vmnet_send_completed);
> >      > +        if (size == 0) {
> >      > +            vmnet_set_send_enabled(s, false);
> >      > +            goto done;
> >      > +        } else if (size < 0) {
> >      > +            break;
> >      > +        }
> >
> >     goto is not needed here. "break" when size <= 0.
> >
> >      > +    }
> >      > +
> >      > +done:
> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >      > +}
> >      > +
> >      > +
> >      > +static void vmnet_bufs_init(VmnetCommonState *s)
> >      > +{
> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >      > +    struct iovec *iov = s->iov_buf;
> >      > +    int i;
> >      > +
> >      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      > +        iov[i].iov_len = s->max_packet_size;
> >      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> >      > +        packets[i].vm_pkt_iov = iov + i;
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
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
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
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;
> >
> >     Duplicate semicolons.
> >
> >      > +    dispatch_semaphore_t if_created_sem =
> >     dispatch_semaphore_create(0);
> >
> >     if_created_sem leaks.
> >
> >      > +    __block vmnet_return_t if_status;
> >      > +
> >      > +    s->if_queue = dispatch_queue_create(
> >      > +        "org.qemu.vmnet.if_queue",
> >      > +        DISPATCH_QUEUE_SERIAL
> >      > +    );
> >      > +
> >      > +    xpc_dictionary_set_bool(
> >      > +        if_desc,
> >      > +        vmnet_allocate_mac_address_key,
> >      > +        false
> >      > +    );
> >      > +#ifdef DEBUG
> >      > +    qemu_log("vmnet.start.interface_desc:\n");
> >      > +    xpc_dictionary_apply(if_desc,
> >      > +                         ^bool(const char *k, xpc_object_t v) {
> >      > +                             char *desc =
> xpc_copy_description(v);
> >      > +                             qemu_log("  %s=%s\n", k, desc);
> >      > +                             free(desc);
> >      > +                             return true;
> >      > +                         });
> >      > +#endif /* DEBUG */
> >      > +
> >      > +    s->vmnet_if = vmnet_start_interface(
> >      > +        if_desc,
> >      > +        s->if_queue,
> >      > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> >      > +            if_status = status;
> >      > +            if (status != VMNET_SUCCESS || !interface_param) {
> >      > +                dispatch_semaphore_signal(if_created_sem);
> >      > +                return;
> >      > +            }
> >      > +
> >      > +#ifdef DEBUG
> >      > +            qemu_log("vmnet.start.interface_param:\n");
> >      > +            xpc_dictionary_apply(interface_param,
> >      > +                                 ^bool(const char *k,
> >     xpc_object_t v) {
> >      > +                                     char *desc =
> >     xpc_copy_description(v);
> >      > +                                     qemu_log("  %s=%s\n", k,
> desc);
> >      > +                                     free(desc);
> >      > +                                     return true;
> >      > +                                 });
> >      > +#endif /* DEBUG */
> >      > +
> >      > +            s->mtu = xpc_dictionary_get_uint64(
> >      > +                interface_param,
> >      > +                vmnet_mtu_key);
> >      > +            s->max_packet_size = xpc_dictionary_get_uint64(
> >      > +                interface_param,
> >      > +                vmnet_max_packet_size_key);
> >      > +
> >      > +            dispatch_semaphore_signal(if_created_sem);
> >      > +        });
> >      > +
> >      > +    if (s->vmnet_if == NULL) {
> >      > +        error_setg(errp,
> >      > +                   "unable to create interface "
> >      > +                   "with requested params");
> >
> >     You don't need line breaks here. Breaking a string into a few would
> >     also
> >     makes it a bit hard to grep.
> >
> >      > +        return -1;
> >
> >     s->if_queue leaks.
> >
> >      > +    }
> >      > +
> >      > +    dispatch_semaphore_wait(if_created_sem,
> DISPATCH_TIME_FOREVER);
> >      > +
> >      > +    if (if_status != VMNET_SUCCESS) {
> >      > +        error_setg(errp,
> >      > +                   "cannot create vmnet interface: %s",
> >      > +                   vmnet_status_map_str(if_status));
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
> >     vmnet_send_bh, nc);
> >      > +    vmnet_bufs_init(s);
> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >      > +    vmnet_set_send_enabled(s, true);
> >      > +    return 0;
> >      > +}
> >      > +
> >      > +
> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      > +                             const uint8_t *buf,
> >      > +                             size_t size)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +    struct vmpktdesc packet;
> >      > +    struct iovec iov;
> >      > +    int pkt_cnt;
> >      > +    vmnet_return_t if_status;
> >      > +
> >      > +    if (size > s->max_packet_size) {
> >      > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
> >
> >     Use PRIu64.
> >
> >      > +                    packet.vm_pkt_size,
> >      > +                    s->max_packet_size);
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    iov.iov_base = (char *) buf;
> >      > +    iov.iov_len = size;
> >      > +
> >      > +    packet.vm_pkt_iovcnt = 1;
> >      > +    packet.vm_flags = 0;
> >      > +    packet.vm_pkt_size = size;
> >      > +    packet.vm_pkt_iov = &iov;
> >      > +    pkt_cnt = 1;
> >      > +
> >      > +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> >      > +    if (if_status != VMNET_SUCCESS) {
> >      > +        error_report("vmnet: write error: %s\n",
> >      > +                     vmnet_status_map_str(if_status));
> >
> >     Why don't return -1?
> >
> >      > +    }
> >      > +
> >      > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> >      > +        return size;
> >      > +    }
> >      > +    return 0;
> >      > +}
> >      > +
> >      > +
> >      > +void vmnet_cleanup_common(NetClientState *nc)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;
> >
> >     Duplicate semicolons.
> >
> >      > +    dispatch_semaphore_t if_created_sem;
> >      > +
> >      > +    qemu_purge_queued_packets(nc); > +
> >     vmnet_set_send_bh_scheduled(s, true);
> >      > +    vmnet_set_send_enabled(s, false);
> >      > +
> >      > +    if (s->vmnet_if == NULL) {
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    if_created_sem = dispatch_semaphore_create(0);
> >      > +    vmnet_stop_interface(
> >      > +        s->vmnet_if,
> >      > +        s->if_queue,
> >      > +        ^(vmnet_return_t status) {
> >      > +            assert(status == VMNET_SUCCESS);
> >      > +            dispatch_semaphore_signal(if_created_sem);
> >      > +        });
> >      > +    dispatch_semaphore_wait(if_created_sem,
> DISPATCH_TIME_FOREVER);
> >      > +
> >      > +    qemu_bh_delete(s->send_bh);
> >      > +    dispatch_release(if_created_sem);
> >      > +    dispatch_release(s->if_queue);
> >      > +
> >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      > +        g_free(s->iov_buf[i].iov_base);
> >      > +    }
> >      > +}
> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >      > index f07afaaf21..66f66c034b 100644
> >      > --- a/net/vmnet-shared.c
> >      > +++ b/net/vmnet-shared.c
> >      > @@ -10,16 +10,102 @@
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
> >      > +static bool validate_options(const Netdev *netdev, Error **errp)
> >      > +{
> >      > +    const NetdevVmnetSharedOptions *options =
> >     &(netdev->u.vmnet_shared);
> >      > +
> >      > +#if !defined(MAC_OS_VERSION_11_0) || \
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> >      > +    if (options->has_isolated) {
> >      > +        error_setg(errp,
> >      > +                   "vmnet-shared.isolated feature is "
> >      > +                   "unavailable: outdated vmnet.framework API");
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
> >      > +    const NetdevVmnetSharedOptions *options =
> >     &(netdev->u.vmnet_shared);
> >      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
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
> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
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
> >      > +static NetClientInfo net_vmnet_shared_info = {
> >      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> >      > +    .size = sizeof(VmnetSharedState),
> >      > +    .receive = vmnet_receive_common,
> >      > +    .cleanup = vmnet_cleanup_common,
> >      > +};
> >      > +
> >      >   int net_init_vmnet_shared(const Netdev *netdev, const char
> *name,
> >      >                             NetClientState *peer, Error **errp)
> >      >   {
> >      > -  error_setg(errp, "vmnet-shared is not implemented yet");
> >      > -  return -1;
> >      > +    NetClientState *nc =
> qemu_new_net_client(&net_vmnet_shared_info,
> >      > +                                             peer,
> >     "vmnet-shared", name);
> >      > +    if (!validate_options(netdev, errp)) {
> >      > +        g_assert_not_reached();
> >
> >     g_assert_not_reached is for debugging purpose and may be dropped
> >     depending on the build option.
> >
> >      > +    }
> >      > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >      >   }
> >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >      > index aac4d5af64..acfe3a88c0 100644
> >      > --- a/net/vmnet_int.h
> >      > +++ b/net/vmnet_int.h
> >      > @@ -15,11 +15,48 @@
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
> >      > +    bool send_scheduled;
> >      >
> >      > +    uint64_t mtu;
> >      > +    uint64_t max_packet_size;
> >      > +
> >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >      > +
> >      > +    dispatch_queue_t if_queue;
> >      > +
> >      > +    QEMUBH *send_bh;
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
> >
> > Other issues will be fixed and submitted later,
> > thank you!
> >
> > Regards,
> > Vladislav Yaroshchuk
>
>
Regards,
Vladislav Yaroshchuk

--000000000000a199c805d8ea2e40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFNhdCwgRmVi
IDI2LCAyMDIyIGF0IDEyOjE2IFBNIEFraWhpa28gT2Rha2kgJmx0OzxhIGhyZWY9Im1haWx0bzph
a2loaWtvLm9kYWtpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFraWhpa28ub2Rha2lAZ21h
aWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiAyMDIyLzAyLzI2IDE3OjM3
LCBWbGFkaXNsYXYgWWFyb3NoY2h1ayB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDsgSGkgQWtp
aGlrbyw8YnI+DQomZ3Q7IDxicj4NCiZndDsgT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgODo0NiBQ
TSBBa2loaWtvIE9kYWtpICZsdDs8YSBocmVmPSJtYWlsdG86YWtpaGlrby5vZGFraUBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5ha2loaWtvLm9kYWtpQGdtYWlsLmNvbTwvYT4gPGJyPg0KJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmFraWhpa28ub2Rha2lAZ21haWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgT24gMjAyMi8wMi8yNiAyOjEzLCBWbGFkaXNsYXYg
WWFyb3NoY2h1ayB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJbnRlcmFjdGlvbiB3aXRo
IHZtbmV0LmZyYW1ld29yayBpbiBkaWZmZXJlbnQgbW9kZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyBkaWZmZXJzIG9ubHkgb24gY29uZmlndXJhdGlvbiBzdGFnZSwgc28gd2UgY2FuIGNyZWF0ZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGNvbW1vbiBgc2VuZGAsIGByZWNlaXZlYCwgZXRjLiBwcm9j
ZWR1cmVzIGFuZCByZXVzZSB0aGVtLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgdm1uZXQuZnJhbWV3b3JrIHN1cHBvcnRzIGlvdiwgYnV0IHdyaXRpbmcgbW9y
ZSB0aGFuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgb25lIGlvdiBpbnRvIHZtbmV0IGludGVyZmFj
ZSBmYWlscyB3aXRoPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgJiMzOTtWTU5FVF9JTlZBTElEX0FS
R1VNRU5UJiMzOTsuIENvbGxlY3RpbmcgcHJvdmlkZWQgaW92cyBpbnRvPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgb25lIGFuZCBwYXNzaW5nIGl0IHRvIHZtbmV0IHdvcmtzIGZpbmUuIFRoYXQmIzM5
O3MgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcmVhc29uIHdoeSByZWNlaXZlX2lvdigpIGxl
ZnQgdW5pbXBsZW1lbnRlZC4gQnV0IGl0IHN0aWxsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgd29y
a3Mgd2l0aCBnb29kIGVub3VnaCBwZXJmb3JtYW5jZSBoYXZpbmcgLnJlY2VpdmUoKTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IG5ldC92bW5ldDogaW1wbGVtZW50IHNoYXJlZCBtb2RlICh2bW5ldC1z
aGFyZWQpPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJbnRl
cmFjdGlvbiB3aXRoIHZtbmV0LmZyYW1ld29yayBpbiBkaWZmZXJlbnQgbW9kZXM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBkaWZmZXJzIG9ubHkgb24gY29uZmlndXJhdGlvbiBzdGFnZSwgc28gd2Ug
Y2FuIGNyZWF0ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGNvbW1vbiBgc2VuZGAsIGByZWNlaXZl
YCwgZXRjLiBwcm9jZWR1cmVzIGFuZCByZXVzZSB0aGVtLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgdm1uZXQuZnJhbWV3b3JrIHN1cHBvcnRzIGlvdiwgYnV0
IHdyaXRpbmcgbW9yZSB0aGFuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgb25lIGlvdiBpbnRvIHZt
bmV0IGludGVyZmFjZSBmYWlscyB3aXRoPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgJiMzOTtWTU5F
VF9JTlZBTElEX0FSR1VNRU5UJiMzOTsuIENvbGxlY3RpbmcgcHJvdmlkZWQgaW92cyBpbnRvPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgb25lIGFuZCBwYXNzaW5nIGl0IHRvIHZtbmV0IHdvcmtzIGZp
bmUuIFRoYXQmIzM5O3MgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgcmVhc29uIHdoeSByZWNl
aXZlX2lvdigpIGxlZnQgdW5pbXBsZW1lbnRlZC4gQnV0IGl0IHN0aWxsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgd29ya3Mgd2l0aCBnb29kIGVub3VnaCBwZXJmb3JtYW5jZSBoYXZpbmcgLnJlY2Vp
dmUoKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGltcGxlbWVudGVkIG9ubHkuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBBbHNvLCB0aGVyZSBpcyBubyB3YXkg
dG8gdW5zdWJzY3JpYmUgZnJvbSB2bW5ldCBwYWNrYWdlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IHJlY2VpdmluZyBleGNlcHQgcmVnaXN0ZXJpbmcgYW5kIHVucmVnaXN0ZXJpbmcgZXZlbnQ8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBjYWxsYmFjayBvciBzaW1wbHkgZHJvcCBwYWNrYWdlcyBqdXN0
IGlnbm9yaW5nIGFuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IG5vdCBwcm9jZXNzaW5nIHRoZW0g
d2hlbiByZWxhdGVkIGZsYWcgaXMgc2V0LiBIZXJlIHdlIGRvPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgdXNpbmcgdGhlIHNlY29uZCB3YXkuPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyBTaWduZWQtb2ZmLWJ5OiBQaGlsbGlwIFRlbm5lbiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOnBoaWxsaXBAYXhsZW9zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnBoaWxsaXBAYXhsZW9z
LmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaGls
bGlwQGF4bGVvcy5jb20iIHRhcmdldD0iX2JsYW5rIj5waGlsbGlwQGF4bGVvcy5jb208L2E+Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBTaWduZWQtb2ZmLWJ5OiBWbGFkaXNsYXYgWWFy
b3NoY2h1azxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86VmxhZGlzbGF2Lllh
cm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlZsYWRpc2xhdi5ZYXJvc2hj
aHVrQGpldGJyYWlucy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86VmxhZGlzbGF2Lllhcm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlucy5jb208L2E+Jmd0OyZndDs8YnI+DQom
Z3Q7IDxicj4NCiZndDvCoCDCoCDCoFRoYW5rIHlvdSBmb3IgcGVyc2lzdGVudGx5IHdvcmtpbmcg
b24gdGhpcy48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tLTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqBuZXQvdm1uZXQtY29tbW9uLm0gfCAzMDI8YnI+DQomZ3Q7wqAgwqAg
wqArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgbmV0L3ZtbmV0LXNoYXJlZC5jIHzCoCA5NCArKysrKysrKysrKysr
LTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqBuZXQvdm1uZXRfaW50LmjCoCDCoCB8wqAgMzkg
KysrKystPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoDMgZmlsZXMgY2hhbmdlZCwgNDMwIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBkaWZmIC0tZ2l0IGEvbmV0L3ZtbmV0LWNvbW1vbi5tIGIvbmV0L3Zt
bmV0LWNvbW1vbi5tPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaW5kZXggNTY2MTJjNzJjZS4uMmY3
MDkyMWNhZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtLS0gYS9uZXQvdm1uZXQtY29t
bW9uLm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArKysgYi9uZXQvdm1uZXQtY29tbW9uLm08YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBAQCAtMTAsNiArMTAsOCBAQDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAjaW5jbHVkZSAmcXVvdDtxZW11L29zZGVwLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArI2luY2x1ZGUgJnF1b3Q7cWVtdS9tYWluLWxvb3AuaCZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICsjaW5jbHVkZSAmcXVvdDtxZW11L2xvZy5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCNpbmNsdWRlICZxdW90O3FhcGkvcWFwaS10eXBlcy1uZXQuaCZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVkZSAmcXVvdDt2bW5ldF9pbnQuaCZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVkZSAmcXVvdDtjbGllbnRzLmgmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBAQCAtMTcsNCArMTksMzA0IEBAPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZxdW90O3FhcGkvZXJyb3IuaCZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZsdDt2
bW5ldC92bW5ldC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZGlz
cGF0Y2gvZGlzcGF0Y2guaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIGlubGluZSB2b2lkIHZt
bmV0X3NldF9zZW5kX2JoX3NjaGVkdWxlZChWbW5ldENvbW1vblN0YXRlICpzLDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb2wgZW5hYmxlKTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHFhdG9taWNfc2V0KCZhbXA7
cy0mZ3Q7c2VuZF9zY2hlZHVsZWQsIGVuYWJsZSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK308
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMgaW5saW5lIGJvb2wgdm1uZXRfaXNfc2VuZF9iaF9zY2hl
ZHVsZWQoVm1uZXRDb21tb25TdGF0ZSAqcyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1cm4gcWF0b21pY19sb2FkX2FjcXVpcmUoJmFt
cDtzLSZndDtzZW5kX3NjaGVkdWxlZCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICtzdGF0aWMgaW5saW5lIHZvaWQgdm1uZXRfc2V0X3NlbmRfZW5hYmxlZChWbW5l
dENvbW1vblN0YXRlICpzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBib29sIGVuYWJs
ZSk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBpZiAoZW5hYmxlKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHZtbmV0
X2ludGVyZmFjZV9zZXRfZXZlbnRfY2FsbGJhY2soPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIHMtJmd0O3ZtbmV0X2lmLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCBWTU5FVF9JTlRFUkZBQ0VfUEFDS0VUU19BVkFJTEFCTEUsPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIHMtJmd0O2lmX3F1ZXVlLDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBeKGludGVyZmFjZV9ldmVudF90
IGV2ZW50X2lkLCB4cGNfb2JqZWN0X3QgZXZlbnQpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXNzZXJ0KGV2ZW50X2lkID09PGJyPg0KJmd0O8KgIMKg
IMKgVk1ORVRfSU5URVJGQUNFX1BBQ0tFVFNfQVZBSUxBQkxFKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIFRoaXMgZnVuY3Rpb24gaXMgYmVpbmcgY2FsbGVk
IGZyb20gYSBub24gcWVtdTxicj4NCiZndDvCoCDCoCDCoHRocmVhZCwgc288YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIHdlIG9ubHkgc2NoZWR1bGUg
YSBCSCwgYW5kIGRvIHRoZSByZXN0IG9mIHRoZTxicj4NCiZndDvCoCDCoCDCoGlvIGNvbXBsZXRp
b248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGhh
bmRsaW5nIGZyb20gdm1uZXRfc2VuZF9iaCgpIHdoaWNoIHJ1bnMgaW4gYTxicj4NCiZndDvCoCDC
oCDCoHFlbXUgY29udGV4dC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgKiBBdm9pZCBzY2hlZHVsaW5nIG11bHRpcGxlIGJvdHRvbSBoYWx2ZXM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIXZtbmV0X2lzX3NlbmRfYmhf
c2NoZWR1bGVkKHMpKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHZtbmV0X3NldF9zZW5kX2JoX3NjaGVkdWxlZChzLCB0cnVlKTs8YnI+DQom
Z3Q7IDxicj4NCiZndDvCoCDCoCDCoEl0IGNhbiBiZSBpbnRlcnJ1cHRlZCBiZXR3ZWVuIHZtbmV0
X2lzX3NlbmRfYmhfc2NoZWR1bGVkIGFuZDxicj4NCiZndDvCoCDCoCDCoHZtbmV0X3NldF9zZW5k
X2JoX3NjaGVkdWxlZCwgd2hpY2ggbGVhZHMgdG8gZGF0YSByYWNlLjxicj4NCiZndDsgPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7IFNvcnJ5LCBJIGRpZCBub3QgY2xlYXJseSB1bmRlcnN0YW5kIHdoYXQg
eW91IG1lYW50LiBTaW5jZSB0aGlzPGJyPg0KJmd0OyBjYWxsYmFjayAoYmxvY2spIGlzIHN1Ym1p
dHRlZCBvbsKgRElTUEFUQ0hfUVVFVUVfU0VSSUFMLDxicj4NCiZndDsgb25seSBvbmUgaW5zdGFu
Y2Ugb2YgdGhlIGNhbGxiYWNrIHdpbGwgYmUgZXhlY3V0ZWQgYXQgYW55PGJyPg0KJmd0OyBtb21l
bnQgb2YgdGltZS48YnI+DQomZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNv
bS9kb2N1bWVudGF0aW9uL2Rpc3BhdGNoL2Rpc3BhdGNoX3F1ZXVlX3NlcmlhbCIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3Vt
ZW50YXRpb24vZGlzcGF0Y2gvZGlzcGF0Y2hfcXVldWVfc2VyaWFsPC9hPiA8YnI+DQomZ3Q7ICZs
dDs8YSBocmVmPSJodHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi9kaXNw
YXRjaC9kaXNwYXRjaF9xdWV1ZV9zZXJpYWwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1bWVudGF0aW9uL2Rpc3BhdGNoL2Rp
c3BhdGNoX3F1ZXVlX3NlcmlhbDwvYT4mZ3Q7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEFsc28gdGhp
cyBpcyB0aGUgb25seSBwbGFjZSB3aGVyZSB3ZSBzY2hlZHVsZSBhIGJvdHRvbSBoYWxmLjxicj4N
CiZndDsgPGJyPg0KJmd0OyBBZnRlciB3ZSBzZXQgdGhlICYjMzk7c2VuZF9zY2hlZHVsZWQmIzM5
OyBmbGFnLCBhbGwgdGhlIG90aGVyPGJyPg0KJmd0OyBjYWxsYmFja8KgIGJsb2NrcyB3aWxsIGRv
IG5vdGhpbmcgKHNraXAgdGhlIGlmIGJsb2NrKSB1bnRpbDxicj4NCiZndDsgdGhlIGJvdHRvbSBo
YWxmIGlzIGV4ZWN1dGVkIGFuZCByZXNldCAmIzM5O3NlbmRfc2NoZWR1bGVkJiMzOTsuPGJyPg0K
Jmd0OyBJIGRvbiYjMzk7dCBzZWUgYW55IHJhY2VzIGhlcmUgOig8YnI+DQomZ3Q7IDxicj4NCiZn
dDsgQ29ycmVjdCBtZSBpZiBJJiMzOTttIHdyb25nIHBsZWFzZS48YnI+DQo8YnI+DQpNeSBleHBs
YW5hdGlvbiB0aGF0IHRoZSBpbnRlcnJ1cHRpb24gYmV0d2VlbiB2bW5ldF9pc19zZW5kX2JoX3Nj
aGVkdWxlZCA8YnI+DQphbmQgdm1uZXRfc2V0X3NlbmRfYmhfc2NoZWR1bGVkIGlzIHByb2JsZW1h
dGljIHdhcyBhY3R1YWxseSBtaXNsZWFkaW5nLjxicj4NCjxicj4NClRoZSBwcm9ibGVtIGlzIHRo
YXQgdm1uZXRfc2VuZF9iaCByZXNldHMgJiMzOTtzZW5kX3NjaGVkdWxlZCYjMzk7IGFmdGVyIGNh
bGxpbmcgPGJyPg0Kdm1uZXRfcmVhZC4gSWYgd2UgZ290IGFub3RoZXIgcGFja2V0IGFmdGVyIHZt
bmV0X3JlYWQsIGl0IHdvdWxkIGJlIDxicj4NCnNpbGVudGx5IGlnbm9yZWQuPGJyPg0KPGJyPg0K
QnkgdGhlIHdheSwgSSBmb3Jnb3QgdG8gbWVudGlvbiBhbm90aGVyIHByb2JsZW06IHZtbmV0X3Nl
bmRfY29tcGxldGVkIDxicj4NCmNhbGxzIHZtbmV0X3NldF9zZW5kX2VuYWJsZWQsIGJ1dCB0aGUg
b3RoZXIgcGFja2V0cyBpbiB0aGUgYnVmZmVyIG1heSA8YnI+DQpub3QgYmUgc2VudCB5ZXQuIEFs
c28sIHVucmVnaXN0ZXJpbmcgY2FsbGJhY2tzIGluIHZtbmV0X3NldF9zZW5kX2VuYWJsZWQgPGJy
Pg0KaXMgcHJvYmFibHkgbm90IGVub3VnaCB0byBzdG9wIHRoZSBjYWxsYmFjayBiZWluZyBmaXJl
ZCBzaW5jZSBzb21lIDxicj4NCmRpc3BhdGNoIGJsb2NrcyBhcmUgYWxyZWFkeSBpbiB0aGUgZGlz
cGF0Y2ggcXVldWUuwqA8YnI+DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
Tm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLCB0aGFua3MuPGJyPldoYXQgZG8geW91IHRo
aW5rIGFib3V0IHRoZSB3b3JrYXJvdW5kPyBGb3IgbWU8YnI+aXQgaXMgcXVpdGUgZGlmZmljdWx0
IHF1ZXN0aW9uIGhvdyB0byBzeW5jaHJvbml6ZSBxZW11IHdpdGg8YnI+dm1uZXQgdGhyZWFkLMKg
ZXNwZWNpYWxsecKgd2l0aCBjb21wbGV0aW9uIGNhbGxiYWNrLjxicj48YnI+PC9kaXY+PGRpdj7C
oDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRk
aW5nLWxlZnQ6MWV4Ij4NClJlZ2FyZHMsPGJyPg0KQWtpaGlrbyBPZGFraTxicj4NCjxicj4NCiZn
dDsgPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHFlbXVfYmhfc2NoZWR1bGUocy0mZ3Q7c2VuZF9iaCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgfSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH0gZWxzZSB7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHZtbmV0X2ludGVyZmFjZV9zZXRfZXZl
bnRfY2FsbGJhY2soPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIHMt
Jmd0O3ZtbmV0X2lmLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBW
TU5FVF9JTlRFUkZBQ0VfUEFDS0VUU19BVkFJTEFCTEUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIE5VTEwsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIE5VTEwpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMgdm9pZCB2bW5ldF9zZW5k
X2NvbXBsZXRlZChOZXRDbGllbnRTdGF0ZSAqbmMsIHNzaXplX3QgbGVuKTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3Rh
dGUgKnMgPSBET19VUENBU1QoVm1uZXRDb21tb25TdGF0ZSwgbmMsIG5jKTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfc2V0X3NlbmRfZW5hYmxlZChzLCB0cnVlKTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK3N0YXRpYyB2b2lkIHZtbmV0X3Nl
bmRfYmgodm9pZCAqb3BhcXVlKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIE5ldENsaWVudFN0YXRlICpuYyA9IChOZXRDbGllbnRTdGF0ZSAq
KSBvcGFxdWU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3RhdGUg
KnMgPSBET19VUENBU1QoVm1uZXRDb21tb25TdGF0ZSwgbmMsIG5jKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCBpb3ZlYyAqaW92
ID0gcy0mZ3Q7aW92X2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3RydWN0IHZt
cGt0ZGVzYyAqcGFja2V0cyA9IHMtJmd0O3BhY2tldHNfYnVmOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBpbnQgcGt0X2NudDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW50
IGk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCB2bW5ldF9yZXR1cm5fdCBzdGF0dXM7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHNz
aXplX3Qgc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIC8qIHJlYWQgYXMgbWFueSBwYWNrZXRzIGFzIHByZXNlbnQgKi88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgcGt0X2NudCA9IFZNTkVUX1BBQ0tFVFNfTElNSVQ7PGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBUaGVyZSBjb3VsZCBiZSBtb3JlIHRoYW4gVk1ORVRfUEFD
S0VUU19MSU1JVC4gWW91IG1heSBjYWxsPGJyPg0KJmd0O8KgIMKgIMKgdm1uZXRfcmVhZCBpbjxi
cj4NCiZndDvCoCDCoCDCoGEgbG9vcC48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBmb3IgKGkgPSAwOyBpICZsdDsgcGt0X2NudDsgKytpKSB7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIHBhY2tldHNbaV0udm1fcGt0X3NpemUgPSBzLSZndDttYXhf
cGFja2V0X3NpemU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHBhY2tldHNb
aV0udm1fcGt0X2lvdmNudCA9IDE7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IHBhY2tldHNbaV0udm1fZmxhZ3MgPSAwOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBz
dGF0dXMgPSB2bW5ldF9yZWFkKHMtJmd0O3ZtbmV0X2lmLCBwYWNrZXRzLCAmYW1wO3BrdF9jbnQp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoc3RhdHVzICE9IFZNTkVUX1NVQ0NF
U1MpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3JfcHJpbnRmKCZx
dW90O3ZtbmV0OiByZWFkIGZhaWxlZDogJXNcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bW5ldF9zdGF0dXNfbWFwX3N0cihz
dGF0dXMpKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZ290byBkb25lOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBmb3IgKGkgPSAwOyBpICZsdDsgcGt0X2NudDsg
KytpKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHNpemUgPSBxZW11X3Nl
bmRfcGFja2V0X2FzeW5jKG5jLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpb3ZbaV0uaW92X2Jh
c2UsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhY2tldHNbaV0udm1fcGt0X3NpemUsPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0X3NlbmRfY29tcGxldGVkKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgaWYgKHNpemUgPT0gMCkgezxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB2bW5ldF9zZXRfc2VuZF9lbmFibGVkKHMsIGZhbHNlKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgZ290byBkb25lOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB9IGVsc2UgaWYgKHNpemUgJmx0OyAwKSB7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB9PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAg
wqBnb3RvIGlzIG5vdCBuZWVkZWQgaGVyZS4gJnF1b3Q7YnJlYWsmcXVvdDsgd2hlbiBzaXplICZs
dDs9IDAuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArZG9uZTo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfc2V0X3NlbmRfYmhfc2NoZWR1bGVkKHMsIGZhbHNl
KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK3N0YXRpYyB2b2lk
IHZtbmV0X2J1ZnNfaW5pdChWbW5ldENvbW1vblN0YXRlICpzKTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCB2bXBrdGRlc2MgKnBh
Y2tldHMgPSBzLSZndDtwYWNrZXRzX2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
c3RydWN0IGlvdmVjICppb3YgPSBzLSZndDtpb3ZfYnVmOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBpbnQgaTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIGZvciAoaSA9IDA7IGkgJmx0OyBWTU5FVF9QQUNLRVRTX0xJTUlUOyArK2kp
IHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgaW92W2ldLmlvdl9sZW4gPSBz
LSZndDttYXhfcGFja2V0X3NpemU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IGlvdltpXS5pb3ZfYmFzZSA9IGdfbWFsbG9jMChpb3ZbaV0uaW92X2xlbik7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHBhY2tldHNbaV0udm1fcGt0X2lvdiA9IGlvdiArIGk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
fTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK2NvbnN0IGNoYXIgKnZtbmV0X3N0YXR1c19tYXBfc3RyKHZtbmV0
X3JldHVybl90IHN0YXR1cyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBzd2l0Y2ggKHN0YXR1cykgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBjYXNlIFZNTkVUX1NVQ0NFU1M6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIHJldHVybiAmcXVvdDtzdWNjZXNzJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBjYXNlIFZNTkVUX0ZBSUxVUkU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIHJldHVybiAmcXVvdDtnZW5lcmFsIGZhaWx1cmUgKHBvc3NpYmx5IG5vdCBlbm91Z2gg
cHJpdmlsZWdlcykmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1O
RVRfTUVNX0ZBSUxVUkU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVy
biAmcXVvdDttZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCBjYXNlIFZNTkVUX0lOVkFMSURfQVJHVU1FTlQ6PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiAmcXVvdDtpbnZhbGlkIGFyZ3VtZW50IHNwZWNp
ZmllZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY2FzZSBWTU5FVF9TRVRV
UF9JTkNPTVBMRVRFOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4g
JnF1b3Q7aW50ZXJmYWNlIHNldHVwIGlzIG5vdCBjb21wbGV0ZSZxdW90Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgY2FzZSBWTU5FVF9JTlZBTElEX0FDQ0VTUzo8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuICZxdW90O2ludmFsaWQgYWNjZXNzLCBwZXJt
aXNzaW9uIGRlbmllZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY2FzZSBW
TU5FVF9QQUNLRVRfVE9PX0JJRzo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
cmV0dXJuICZxdW90O3BhY2tldCBzaXplIGlzIGxhcmdlciB0aGFuIE1UVSZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY2FzZSBWTU5FVF9CVUZGRVJfRVhIQVVTVEVEOjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7YnVmZmVycyBleGhh
dXN0ZWQgaW4ga2VybmVsJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBjYXNl
IFZNTkVUX1RPT19NQU5ZX1BBQ0tFVFM6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIHJldHVybiAmcXVvdDtwYWNrZXQgY291bnQgZXhjZWVkcyBsaW1pdCZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArI2lmIGRlZmluZWQoTUFDX09TX1ZFUlNJT05fMTFfMCkgJmFtcDsm
YW1wOyBcPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIE1BQ19PU19YX1ZFUlNJT05fTUlO
X1JFUVVJUkVEICZndDs9IE1BQ19PU19WRVJTSU9OXzExXzA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgY2FzZSBWTU5FVF9TSEFSSU5HX1NFUlZJQ0VfQlVTWTo8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuICZxdW90O2NvbmZsaWN0LCBzaGFyaW5nIHNlcnZp
Y2UgaXMgaW4gdXNlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjZW5kaWY8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZGVmYXVsdDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgcmV0dXJuICZxdW90O3Vua25vd24gdm1uZXQgZXJyb3ImcXVvdDs7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK2ludCB2bW5ldF9pZl9jcmVhdGUoTmV0Q2xpZW50U3RhdGUgKm5jLDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4cGNfb2Jq
ZWN0X3QgaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3RhdGUgKnMgPSBET19VUENBU1Qo
Vm1uZXRDb21tb25TdGF0ZSwgbmMsIG5jKTs7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBE
dXBsaWNhdGUgc2VtaWNvbG9ucy48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCBkaXNwYXRjaF9zZW1hcGhvcmVfdCBpZl9jcmVhdGVkX3NlbSA9PGJyPg0KJmd0O8KgIMKg
IMKgZGlzcGF0Y2hfc2VtYXBob3JlX2NyZWF0ZSgwKTs8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoGlmX2NyZWF0ZWRfc2VtIGxlYWtzLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIF9fYmxvY2sgdm1uZXRfcmV0dXJuX3QgaWZfc3RhdHVzOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcy0mZ3Q7aWZfcXVldWUg
PSBkaXNwYXRjaF9xdWV1ZV9jcmVhdGUoPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgICZxdW90O29yZy5xZW11LnZtbmV0LmlmX3F1ZXVlJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCBESVNQQVRDSF9RVUVVRV9TRVJJQUw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIHhwY19kaWN0aW9uYXJ5X3NldF9ib29sKDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCBpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCB2bW5ldF9hbGxvY2F0ZV9tYWNfYWRkcmVzc19rZXksPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIGZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgICk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKyNpZmRlZiBERUJVRzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBxZW11X2xvZygmcXVvdDt2bW5ldC5zdGFydC5pbnRlcmZhY2VfZGVzYzpcbiZx
dW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHhwY19kaWN0aW9uYXJ5X2FwcGx5
KGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgXmJvb2woY29uc3QgY2hhciAqaywgeHBjX29iamVjdF90IHYpIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjaGFyICpkZXNjID0geHBjX2NvcHlfZGVzY3JpcHRpb24odik7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cWVtdV9sb2coJnF1b3Q7wqAgJXM9JXNcbiZxdW90OywgaywgZGVzYyk7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJl
ZShkZXNjKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9KTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArI2VuZGlmIC8qIERFQlVHICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBzLSZndDt2bW5ldF9pZiA9IHZtbmV0X3N0YXJ0X2lu
dGVyZmFjZSg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgaWZfZGVzYyw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcy0mZ3Q7aWZfcXVldWUsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIF4odm1uZXRfcmV0dXJuX3Qgc3RhdHVzLCB4cGNf
b2JqZWN0X3QgaW50ZXJmYWNlX3BhcmFtKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIGlmX3N0YXR1cyA9IHN0YXR1czs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKHN0YXR1cyAhPSBWTU5FVF9TVUNDRVNTIHx8ICFpbnRlcmZh
Y2VfcGFyYW0pIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgZGlzcGF0Y2hfc2VtYXBob3JlX3NpZ25hbChpZl9jcmVhdGVkX3NlbSk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybjs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArI2lmZGVmIERFQlVHPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIHFlbXVfbG9nKCZxdW90O3ZtbmV0LnN0YXJ0LmludGVyZmFj
ZV9wYXJhbTpcbiZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIHhwY19kaWN0aW9uYXJ5X2FwcGx5KGludGVyZmFjZV9wYXJhbSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBeYm9vbChjb25zdCBjaGFyICprLDxicj4NCiZndDvCoCDCoCDCoHhwY19vYmplY3RfdCB2KSB7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hhciAqZGVzYyA9PGJyPg0KJmd0O8KgIMKgIMKgeHBj
X2NvcHlfZGVzY3JpcHRpb24odik7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcWVtdV9sb2coJnF1
b3Q7wqAgJXM9JXNcbiZxdW90OywgaywgZGVzYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJl
ZShkZXNjKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArI2VuZGlmIC8qIERFQlVHICovPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCBzLSZndDttdHUgPSB4cGNfZGljdGlvbmFyeV9nZXRfdWludDY0KDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcmZhY2VfcGFyYW0sPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0X210dV9rZXkp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBzLSZndDttYXhfcGFj
a2V0X3NpemUgPSB4cGNfZGljdGlvbmFyeV9nZXRfdWludDY0KDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcmZhY2VfcGFyYW0sPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0X21heF9wYWNrZXRfc2l6
ZV9rZXkpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgZGlzcGF0Y2hfc2VtYXBob3JlX3NpZ25hbChpZl9jcmVhdGVkX3Nl
bSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIH0pOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKHMtJmd0O3ZtbmV0
X2lmID09IE5VTEwpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3Jf
c2V0ZyhlcnJwLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZxdW90O3VuYWJsZSB0byBjcmVhdGUgaW50ZXJmYWNlICZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3dpdGggcmVx
dWVzdGVkIHBhcmFtcyZxdW90Oyk7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBZb3UgZG9u
JiMzOTt0IG5lZWQgbGluZSBicmVha3MgaGVyZS4gQnJlYWtpbmcgYSBzdHJpbmcgaW50byBhIGZl
dyB3b3VsZDxicj4NCiZndDvCoCDCoCDCoGFsc288YnI+DQomZ3Q7wqAgwqAgwqBtYWtlcyBpdCBh
IGJpdCBoYXJkIHRvIGdyZXAuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgcy0mZ3Q7aWZf
cXVldWUgbGVha3MuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZGlz
cGF0Y2hfc2VtYXBob3JlX3dhaXQoaWZfY3JlYXRlZF9zZW0sIERJU1BBVENIX1RJTUVfRk9SRVZF
Uik7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBpZiAoaWZfc3RhdHVzICE9IFZNTkVUX1NVQ0NFU1MpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgZXJyb3Jfc2V0ZyhlcnJwLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2Nhbm5vdCBjcmVhdGUgdm1uZXQgaW50
ZXJmYWNlOiAlcyZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB2bW5ldF9zdGF0dXNfbWFwX3N0cihpZl9zdGF0dXMpKTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBzLSZndDtzZW5kX2JoID0gYWlvX2JoX25ldyhxZW11X2dldF9haW9fY29udGV4
dCgpLDxicj4NCiZndDvCoCDCoCDCoHZtbmV0X3NlbmRfYmgsIG5jKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgdm1uZXRfYnVmc19pbml0KHMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB2bW5ldF9zZXRfc2VuZF9iaF9zY2hlZHVsZWQocywgZmFsc2UpOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCB2bW5ldF9zZXRfc2VuZF9lbmFibGVkKHMsIHRydWUpOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK3NzaXplX3Qgdm1uZXRfcmVjZWl2ZV9jb21tb24oTmV0Q2xp
ZW50U3RhdGUgKm5jLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0IHVpbnQ4X3QgKmJ1Ziw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
aXplX3Qgc2l6ZSk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBWbW5ldENvbW1vblN0YXRlICpzID0gRE9fVVBDQVNUKFZtbmV0Q29tbW9uU3Rh
dGUsIG5jLCBuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCB2bXBrdGRl
c2MgcGFja2V0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBzdHJ1Y3QgaW92ZWMgaW92
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpbnQgcGt0X2NudDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfcmV0dXJuX3QgaWZfc3RhdHVzOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKHNpemUgJmd0OyBz
LSZndDttYXhfcGFja2V0X3NpemUpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgd2Fybl9yZXBvcnQoJnF1b3Q7dm1uZXQ6IHBhY2tldCBpcyB0b28gYmlnLCAlenUgJmd0OyAl
bGx1XG4mcXVvdDssPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBVc2UgUFJJdTY0Ljxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHBhY2tldC52bV9wa3Rfc2l6ZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcy0mZ3Q7bWF4X3BhY2tldF9zaXplKTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBpb3YuaW92X2Jhc2UgPSAoY2hhciAqKSBidWY7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIGlvdi5pb3ZfbGVuID0gc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHBhY2tldC52bV9wa3RfaW92Y250ID0gMTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcGFja2V0LnZtX2ZsYWdzID0gMDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgcGFja2V0LnZtX3BrdF9zaXplID0gc2l6ZTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgcGFja2V0LnZtX3BrdF9pb3YgPSAmYW1wO2lvdjs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcGt0X2NudCA9IDE7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZl9zdGF0dXMgPSB2bW5ldF93cml0
ZShzLSZndDt2bW5ldF9pZiwgJmFtcDtwYWNrZXQsICZhbXA7cGt0X2NudCk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIGlmIChpZl9zdGF0dXMgIT0gVk1ORVRfU1VDQ0VTUykgezxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBlcnJvcl9yZXBvcnQoJnF1b3Q7dm1uZXQ6
IHdyaXRlIGVycm9yOiAlc1xuJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZtbmV0X3N0YXR1c19tYXBfc3RyKGlmX3N0YXR1cykp
Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgV2h5IGRvbiYjMzk7dCByZXR1cm4gLTE/PGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKGlmX3N0YXR1cyA9PSBW
TU5FVF9TVUNDRVNTICZhbXA7JmFtcDsgcGt0X2NudCkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCByZXR1cm4gc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
fTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK3ZvaWQgdm1uZXRfY2xlYW51cF9jb21tb24oTmV0
Q2xpZW50U3RhdGUgKm5jKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3RhdGUgKnMgPSBET19VUENBU1QoVm1uZXRDb21t
b25TdGF0ZSwgbmMsIG5jKTs7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBEdXBsaWNhdGUg
c2VtaWNvbG9ucy48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNw
YXRjaF9zZW1hcGhvcmVfdCBpZl9jcmVhdGVkX3NlbTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHFlbXVfcHVyZ2VfcXVldWVkX3BhY2tldHMo
bmMpOyAmZ3Q7ICvCoCDCoDxicj4NCiZndDvCoCDCoCDCoHZtbmV0X3NldF9zZW5kX2JoX3NjaGVk
dWxlZChzLCB0cnVlKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfc2V0X3Nl
bmRfZW5hYmxlZChzLCBmYWxzZSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAocy0mZ3Q7dm1uZXRfaWYgPT0gTlVMTCkgezxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIGlmX2NyZWF0ZWRfc2VtID0gZGlzcGF0Y2hfc2VtYXBob3JlX2NyZWF0ZSgwKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfc3RvcF9pbnRlcmZhY2UoPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHMtJmd0O3ZtbmV0X2lmLDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzLSZndDtpZl9xdWV1ZSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgXih2bW5ldF9yZXR1cm5fdCBzdGF0dXMpIHs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYXNzZXJ0KHN0YXR1cyA9PSBWTU5FVF9T
VUNDRVNTKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgZGlzcGF0
Y2hfc2VtYXBob3JlX3NpZ25hbChpZl9jcmVhdGVkX3NlbSk7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIH0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRj
aF9zZW1hcGhvcmVfd2FpdChpZl9jcmVhdGVkX3NlbSwgRElTUEFUQ0hfVElNRV9GT1JFVkVSKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHFl
bXVfYmhfZGVsZXRlKHMtJmd0O3NlbmRfYmgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBkaXNwYXRjaF9yZWxlYXNlKGlmX2NyZWF0ZWRfc2VtKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgZGlzcGF0Y2hfcmVsZWFzZShzLSZndDtpZl9xdWV1ZSk7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBmb3IgKGludCBpID0gMDsg
aSAmbHQ7IFZNTkVUX1BBQ0tFVFNfTElNSVQ7ICsraSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCBnX2ZyZWUocy0mZ3Q7aW92X2J1ZltpXS5pb3ZfYmFzZSk7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQgYS9uZXQvdm1uZXQtc2hhcmVkLmMgYi9uZXQvdm1u
ZXQtc2hhcmVkLmM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCBmMDdhZmFhZjIxLi42NmY2
NmMwMzRiIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tLSBhL25ldC92bW5ldC1zaGFy
ZWQuYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsrKyBiL25ldC92bW5ldC1zaGFyZWQuYzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IEBAIC0xMCwxNiArMTAsMTAyIEBAPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7cWVtdS9vc2Rl
cC5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZxdW90O3FhcGkv
cWFwaS10eXBlcy1uZXQuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjaW5jbHVkZSAm
cXVvdDtxYXBpL2Vycm9yLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1
ZGUgJnF1b3Q7dm1uZXRfaW50LmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2lu
Y2x1ZGUgJnF1b3Q7Y2xpZW50cy5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgLSNpbmNs
dWRlICZxdW90O3FlbXUvZXJyb3ItcmVwb3J0LmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyAtI2luY2x1ZGUgJnF1b3Q7cWFwaS9lcnJvci5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJmx0O3ZtbmV0L3ZtbmV0Lmgm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArdHlwZWRl
ZiBzdHJ1Y3QgVm1uZXRTaGFyZWRTdGF0ZSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IFZtbmV0Q29tbW9uU3RhdGUgY3M7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK30gVm1uZXRTaGFy
ZWRTdGF0ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMgYm9vbCB2YWxpZGF0ZV9vcHRpb25zKGNv
bnN0IE5ldGRldiAqbmV0ZGV2LCBFcnJvciAqKmVycnApPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K3s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY29uc3QgTmV0ZGV2Vm1uZXRTaGFyZWRP
cHRpb25zICpvcHRpb25zID08YnI+DQomZ3Q7wqAgwqAgwqAmYW1wOyhuZXRkZXYtJmd0O3Uudm1u
ZXRfc2hhcmVkKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgKyNpZiAhZGVmaW5lZChNQUNfT1NfVkVSU0lPTl8xMV8wKSB8fCBcPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIE1BQ19PU19YX1ZFUlNJT05fTUlOX1JFUVVJUkVEICZsdDsgTUFDX09T
X1ZFUlNJT05fMTFfMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAob3B0aW9ucy0m
Z3Q7aGFzX2lzb2xhdGVkKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGVy
cm9yX3NldGcoZXJycCw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmcXVvdDt2bW5ldC1zaGFyZWQuaXNvbGF0ZWQgZmVhdHVyZSBpcyAmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDt1bmF2YWlsYWJsZTogb3V0ZGF0ZWQgdm1uZXQuZnJhbWV3b3JrIEFQSSZxdW90Oyk7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiBmYWxzZTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjZW5kaWY8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmICgob3B0
aW9ucy0mZ3Q7aGFzX3N0YXJ0X2FkZHJlc3MgfHw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqAgwqAgwqBvcHRpb25zLSZndDtoYXNfZW5kX2FkZHJlc3MgfHw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqBvcHRpb25zLSZndDtoYXNfc3VibmV0X21hc2spICZhbXA7
JmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgIShvcHRpb25zLSZndDto
YXNfc3RhcnRfYWRkcmVzcyAmYW1wOyZhbXA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIMKgIG9wdGlvbnMtJmd0O2hhc19lbmRfYWRkcmVzcyAmYW1wOyZhbXA7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIG9wdGlvbnMtJmd0O2hhc19zdWJuZXRfbWFz
aykpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3Jfc2V0ZyhlcnJw
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZx
dW90OyYjMzk7c3RhcnQtYWRkcmVzcyYjMzk7LCAmIzM5O2VuZC1hZGRyZXNzJiMzOTssICYjMzk7
c3VibmV0LW1hc2smIzM5OyAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtzaG91bGQgYmUgcHJvdmlkZWQgdG9nZXRoZXImcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIGZhbHNlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCByZXR1cm4gdHJ1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIHhwY19vYmplY3Rf
dCBidWlsZF9pZl9kZXNjKGNvbnN0IE5ldGRldiAqbmV0ZGV2KTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNvbnN0IE5ldGRldlZtbmV0U2hh
cmVkT3B0aW9ucyAqb3B0aW9ucyA9PGJyPg0KJmd0O8KgIMKgIMKgJmFtcDsobmV0ZGV2LSZndDt1
LnZtbmV0X3NoYXJlZCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHhwY19vYmplY3Rf
dCBpZl9kZXNjID0geHBjX2RpY3Rpb25hcnlfY3JlYXRlKE5VTEwsIE5VTEwsIDApOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX2RpY3Rp
b25hcnlfc2V0X3VpbnQ2NCg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgaWZf
ZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgdm1uZXRfb3BlcmF0aW9u
X21vZGVfa2V5LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBWTU5FVF9TSEFS
RURfTU9ERTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCApOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKG9wdGlvbnMtJmd0O2hh
c19uYXQ2Nl9wcmVmaXgpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgeHBj
X2RpY3Rpb25hcnlfc2V0X3N0cmluZyhpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2bW5ldF9u
YXQ2Nl9wcmVmaXhfa2V5LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcHRpb25zLSZndDtuYXQ2Nl9wcmVm
aXgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAob3B0aW9ucy0mZ3Q7aGFzX3N0
YXJ0X2FkZHJlc3MpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgeHBjX2Rp
Y3Rpb25hcnlfc2V0X3N0cmluZyhpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2bW5ldF9zdGFy
dF9hZGRyZXNzX2tleSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3B0aW9ucy0mZ3Q7c3RhcnRfYWRkcmVz
cyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5X3Nl
dF9zdHJpbmcoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1uZXRfZW5kX2FkZHJlc3Nfa2V5
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBvcHRpb25zLSZndDtlbmRfYWRkcmVzcyk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5X3NldF9zdHJpbmcoaWZfZGVz
Yyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1uZXRfc3VibmV0X21hc2tfa2V5LDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBvcHRpb25zLSZndDtzdWJuZXRfbWFzayk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKyNp
ZiBkZWZpbmVkKE1BQ19PU19WRVJTSU9OXzExXzApICZhbXA7JmFtcDsgXDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBNQUNfT1NfWF9WRVJTSU9OX01JTl9SRVFVSVJFRCAmZ3Q7PSBNQUNf
T1NfVkVSU0lPTl8xMV8wPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHhwY19kaWN0aW9u
YXJ5X3NldF9ib29sKDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBpZl9kZXNj
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB2bW5ldF9lbmFibGVfaXNvbGF0
aW9uX2tleSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgb3B0aW9ucy0mZ3Q7
aXNvbGF0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArI2VuZGlmPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCByZXR1cm4gaWZfZGVzYzs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIE5l
dENsaWVudEluZm8gbmV0X3ZtbmV0X3NoYXJlZF9pbmZvID0gezxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCAudHlwZSA9IE5FVF9DTElFTlRfRFJJVkVSX1ZNTkVUX1NIQVJFRCw8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLnNpemUgPSBzaXplb2YoVm1uZXRTaGFyZWRTdGF0ZSks
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC5yZWNlaXZlID0gdm1uZXRfcmVjZWl2ZV9j
b21tb24sPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC5jbGVhbnVwID0gdm1uZXRfY2xl
YW51cF9jb21tb24sPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqBpbnQgbmV0X2luaXRfdm1uZXRfc2hh
cmVkKGNvbnN0IE5ldGRldiAqbmV0ZGV2LCBjb25zdCBjaGFyICpuYW1lLDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOZXRD
bGllbnRTdGF0ZSAqcGVlciwgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgLcKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7dm1u
ZXQtc2hhcmVkIGlzIG5vdCBpbXBsZW1lbnRlZCB5ZXQmcXVvdDspOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IC3CoCByZXR1cm4gLTE7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIE5ldENs
aWVudFN0YXRlICpuYyA9IHFlbXVfbmV3X25ldF9jbGllbnQoJmFtcDtuZXRfdm1uZXRfc2hhcmVk
X2luZm8sPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGVlciw8YnI+DQomZ3Q7
wqAgwqAgwqAmcXVvdDt2bW5ldC1zaGFyZWQmcXVvdDssIG5hbWUpOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCBpZiAoIXZhbGlkYXRlX29wdGlvbnMobmV0ZGV2LCBlcnJwKSkgezxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOzxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgZ19hc3NlcnRfbm90X3JlYWNoZWQgaXMgZm9yIGRl
YnVnZ2luZyBwdXJwb3NlIGFuZCBtYXkgYmUgZHJvcHBlZDxicj4NCiZndDvCoCDCoCDCoGRlcGVu
ZGluZyBvbiB0aGUgYnVpbGQgb3B0aW9uLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcmV0dXJuIHZtbmV0X2lm
X2NyZWF0ZShuYywgYnVpbGRfaWZfZGVzYyhuZXRkZXYpLCBlcnJwKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQgYS9uZXQvdm1u
ZXRfaW50LmggYi9uZXQvdm1uZXRfaW50Lmg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCBh
YWM0ZDVhZjY0Li5hY2ZlM2E4OGMwIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tLSBh
L25ldC92bW5ldF9pbnQuaDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsrKyBiL25ldC92bW5ldF9p
bnQuaDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEBAIC0xNSwxMSArMTUsNDggQEA8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7Y2xpZW50cy5oJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJmx0O3Zt
bmV0L3ZtbmV0LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKyNpbmNsdWRlICZsdDtkaXNw
YXRjaC9kaXNwYXRjaC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArLyoqPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKyAqwqAgRnJvbSB2bW5ldC5m
cmFtZXdvcmsgZG9jdW1lbnRhdGlvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsgKjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEVhY2ggcmVhZC93cml0ZSBjYWxsIGFsbG93cyB1cCB0byAy
MDAgcGFja2V0cyB0byBiZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIHJlYWQgb3Igd3Jp
dHRlbiBmb3IgYSBtYXhpbXVtIG9mIDI1NktCLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsgKjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEVhY2ggcGFja2V0IHdyaXR0ZW4gc2hvdWxkIGJl
IGEgY29tcGxldGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArICrCoCBldGhlcm5ldCBmcmFtZS48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArICo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArICogPGEg
aHJlZj0iaHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRpb24vdm1uZXQiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNv
bS9kb2N1bWVudGF0aW9uL3ZtbmV0PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi92bW5ldCIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3Vt
ZW50YXRpb24vdm1uZXQ8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsgKi88YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArI2RlZmluZSBWTU5FVF9QQUNLRVRTX0xJTUlUIDIwMDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoHR5cGVkZWYgc3RydWN0
IFZtbmV0Q29tbW9uU3RhdGUgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC3CoCBOZXRDbGllbnRT
dGF0ZSBuYzs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgTmV0Q2xpZW50U3RhdGUgbmM7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGludGVyZmFjZV9yZWYgdm1uZXRfaWY7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBib29s
IHNlbmRfc2NoZWR1bGVkOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIHVpbnQ2NF90IG10dTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
dWludDY0X3QgbWF4X3BhY2tldF9zaXplOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3RydWN0IHZtcGt0ZGVzYyBwYWNrZXRzX2J1ZltWTU5F
VF9QQUNLRVRTX0xJTUlUXTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3RydWN0IGlv
dmVjIGlvdl9idWZbVk1ORVRfUEFDS0VUU19MSU1JVF07PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRjaF9xdWV1ZV90IGlmX3F1ZXVl
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
UUVNVUJIICpzZW5kX2JoOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqB9IFZtbmV0Q29tbW9u
U3RhdGU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArY29u
c3QgY2hhciAqdm1uZXRfc3RhdHVzX21hcF9zdHIodm1uZXRfcmV0dXJuX3Qgc3RhdHVzKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK2ludCB2bW5ldF9p
Zl9jcmVhdGUoTmV0Q2xpZW50U3RhdGUgKm5jLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4cGNfb2JqZWN0X3QgaWZfZGVzYyw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgRXJyb3IgKiplcnJw
KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK3NzaXpl
X3Qgdm1uZXRfcmVjZWl2ZV9jb21tb24oTmV0Q2xpZW50U3RhdGUgKm5jLDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bnN0IHVpbnQ4X3QgKmJ1Ziw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplX3Qgc2l6ZSk7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt2b2lkIHZtbmV0X2NsZWFudXBfY29t
bW9uKE5ldENsaWVudFN0YXRlICpuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgI2VuZGlmIC8qIFZNTkVUX0lOVF9IICovPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7IDxicj4NCiZndDsgT3RoZXIgaXNzdWVzIHdpbGwgYmUgZml4ZWQgYW5kIHN1Ym1pdHRl
ZCBsYXRlciw8YnI+DQomZ3Q7IHRoYW5rIHlvdSE8YnI+DQomZ3Q7IDxicj4NCiZndDsgUmVnYXJk
cyw8YnI+DQomZ3Q7IFZsYWRpc2xhdiBZYXJvc2hjaHVrPGJyPg0KPGJyPjwvYmxvY2txdW90ZT48
ZGl2Pjxicj48L2Rpdj5SZWdhcmRzLDxicj48ZGl2PlZsYWRpc2xhdiBZYXJvc2hjaHVrwqA8L2Rp
dj48L2Rpdj48L2Rpdj4NCg==
--000000000000a199c805d8ea2e40--

