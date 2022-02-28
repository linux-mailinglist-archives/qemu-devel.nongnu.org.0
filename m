Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD74C6BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:16:35 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOex5-0006iw-N5
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOegm-0006wI-Ao
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:59:40 -0500
Received: from [2607:f8b0:4864:20::b36] (port=35775
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOege-0002nv-5C
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:59:39 -0500
Received: by mail-yb1-xb36.google.com with SMTP id bt13so19996405ybb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Skoj7vludfgofcK2FFrXYjNki8r5N9YQJWBMA7ZWGw=;
 b=TN86CmCKVWU9zeNblwIcOtIyfAD1XQnCnpdtF35/ApLoUd4FbERjoqud89/HC7KCK6
 4Hl5tpcMfbdG/50tpySvIBifRf2FgUkahUuw9WHNt9ixVZp5qeDAqG7UA/G9KrI2WRhB
 anRI2M/O9bRuTvMQw3Vt99xEn2IDmd/OhMVuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Skoj7vludfgofcK2FFrXYjNki8r5N9YQJWBMA7ZWGw=;
 b=AkbvLs8kuZNh6KNjC6Povu7d+UEiT4OKZKrHE5Aq/LWsW30fOlEhORIrqwEXGE1Kfi
 I6bVllrEThJGtX6s8neihNMaif6UDiSsYlvP0WkpgIaMySiEau/ISCDGuvFar194JoFV
 wBu5ejF9pb22AXV265ZTHVm3UduCHZJ/iEAEkKI9rElTdAW6RkCkvtcY4qUz0vN48tTJ
 w6ifkoZgh21QdheLL0PLNwlHTMTSiJILLk7r0dQKJJtsPv8htmfZADkeoIF0EFNu/4XY
 c2Y5SJjq7iYYQI6mdUnL8DZbkxSqgpoJno5srquZ+YhXSDZBCZPGO+gz+Ex6WAp8RW5+
 OTog==
X-Gm-Message-State: AOAM530QsLAM1V1j0ex5KSzgAeA1q2KT8jdX4slzeWxeR/vo955LvGJq
 ZEaBNvupwn6Whxb9qvdjdXQKqTcViI2zIclrX11u1A==
X-Google-Smtp-Source: ABdhPJwbYkducHOHsXVz/EU3Pak2GsbnKN27NsXqAG6CD4XA0Yr3nM5Qngj2u2oXJdpF44QNeVVsTzC8JdvuDRSHYGA=
X-Received: by 2002:a25:54:0:b0:628:64d2:5e81 with SMTP id
 81-20020a250054000000b0062864d25e81mr314451yba.286.1646049569887; 
 Mon, 28 Feb 2022 03:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
In-Reply-To: <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Mon, 28 Feb 2022 14:59:18 +0300
Message-ID: <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
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
Content-Type: multipart/alternative; boundary="000000000000e5775b05d912c7a7"
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

--000000000000e5775b05d912c7a7
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 26, 2022 at 3:27 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Sat, Feb 26, 2022 at 8:33 PM Vladislav Yaroshchuk
> <vladislav.yaroshchuk@jetbrains.com> wrote:
> >
> >
> >
> > On Sat, Feb 26, 2022 at 12:16 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
> >>
> >> On 2022/02/26 17:37, Vladislav Yaroshchuk wrote:
> >> >
> >> > Hi Akihiko,
> >> >
> >> > On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki <
> akihiko.odaki@gmail.com
> >> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >> >
> >> >     On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> >> >      > Interaction with vmnet.framework in different modes
> >> >      > differs only on configuration stage, so we can create
> >> >      > common `send`, `receive`, etc. procedures and reuse them.
> >> >      >
> >> >      > vmnet.framework supports iov, but writing more than
> >> >      > one iov into vmnet interface fails with
> >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >> >      > one and passing it to vmnet works fine. That's the
> >> >      > reason why receive_iov() left unimplemented. But it still
> >> >      > works with good enough performance having .receive()
> >> >      > net/vmnet: implement shared mode (vmnet-shared)
> >> >      >
> >> >      > Interaction with vmnet.framework in different modes
> >> >      > differs only on configuration stage, so we can create
> >> >      > common `send`, `receive`, etc. procedures and reuse them.
> >> >      >
> >> >      > vmnet.framework supports iov, but writing more than
> >> >      > one iov into vmnet interface fails with
> >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >> >      > one and passing it to vmnet works fine. That's the
> >> >      > reason why receive_iov() left unimplemented. But it still
> >> >      > works with good enough performance having .receive()
> >> >      > implemented only.
> >> >      >
> >> >      > Also, there is no way to unsubscribe from vmnet packages
> >> >      > receiving except registering and unregistering event
> >> >      > callback or simply drop packages just ignoring and
> >> >      > not processing them when related flag is set. Here we do
> >> >      > using the second way.
> >> >      >
> >> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >> >     <mailto:phillip@axleos.com>>
> >> >      > Signed-off-by: Vladislav Yaroshchuk
> >> >     <Vladislav.Yaroshchuk@jetbrains.com
> >> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>
> >> >
> >> >     Thank you for persistently working on this.
> >> >
> >> >      > ---
> >> >      >   net/vmnet-common.m | 302
> >> >     +++++++++++++++++++++++++++++++++++++++++++++
> >> >      >   net/vmnet-shared.c |  94 +++++++++++++-
> >> >      >   net/vmnet_int.h    |  39 +++++-
> >> >      >   3 files changed, 430 insertions(+), 5 deletions(-)
> >> >      >
> >> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >> >      > index 56612c72ce..2f70921cae 100644
> >> >      > --- a/net/vmnet-common.m
> >> >      > +++ b/net/vmnet-common.m
> >> >      > @@ -10,6 +10,8 @@
> >> >      >    */
> >> >      >
> >> >      >   #include "qemu/osdep.h"
> >> >      > +#include "qemu/main-loop.h"
> >> >      > +#include "qemu/log.h"
> >> >      >   #include "qapi/qapi-types-net.h"
> >> >      >   #include "vmnet_int.h"
> >> >      >   #include "clients.h"
> >> >      > @@ -17,4 +19,304 @@
> >> >      >   #include "qapi/error.h"
> >> >      >
> >> >      >   #include <vmnet/vmnet.h>
> >> >      > +#include <dispatch/dispatch.h>
> >> >      >
> >> >      > +
> >> >      > +static inline void
> vmnet_set_send_bh_scheduled(VmnetCommonState *s,
> >> >      > +                                               bool enable)
> >> >      > +{
> >> >      > +    qatomic_set(&s->send_scheduled, enable);
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +static inline bool
> vmnet_is_send_bh_scheduled(VmnetCommonState *s)
> >> >      > +{
> >> >      > +    return qatomic_load_acquire(&s->send_scheduled);
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +static inline void vmnet_set_send_enabled(VmnetCommonState *s,
> >> >      > +                                          bool enable)
> >> >      > +{
> >> >      > +    if (enable) {
> >> >      > +        vmnet_interface_set_event_callback(
> >> >      > +            s->vmnet_if,
> >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >> >      > +            s->if_queue,
> >> >      > +            ^(interface_event_t event_id, xpc_object_t event)
> {
> >> >      > +                assert(event_id ==
> >> >     VMNET_INTERFACE_PACKETS_AVAILABLE);
> >> >      > +                /*
> >> >      > +                 * This function is being called from a non
> qemu
> >> >     thread, so
> >> >      > +                 * we only schedule a BH, and do the rest of
> the
> >> >     io completion
> >> >      > +                 * handling from vmnet_send_bh() which runs
> in a
> >> >     qemu context.
> >> >      > +                 *
> >> >      > +                 * Avoid scheduling multiple bottom halves
> >> >      > +                 */
> >> >      > +                if (!vmnet_is_send_bh_scheduled(s)) {
> >> >      > +                    vmnet_set_send_bh_scheduled(s, true);
> >> >
> >> >     It can be interrupted between vmnet_is_send_bh_scheduled and
> >> >     vmnet_set_send_bh_scheduled, which leads to data race.
> >> >
> >> >
> >> > Sorry, I did not clearly understand what you meant. Since this
> >> > callback (block) is submitted on DISPATCH_QUEUE_SERIAL,
> >> > only one instance of the callback will be executed at any
> >> > moment of time.
> >> >
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
> >> > <
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>
> >> >
> >> > Also this is the only place where we schedule a bottom half.
> >> >
> >> > After we set the 'send_scheduled' flag, all the other
> >> > callback  blocks will do nothing (skip the if block) until
> >> > the bottom half is executed and reset 'send_scheduled'.
> >> > I don't see any races here :(
> >> >
> >> > Correct me if I'm wrong please.
> >>
> >> My explanation that the interruption between vmnet_is_send_bh_scheduled
> >> and vmnet_set_send_bh_scheduled is problematic was actually misleading.
> >>
> >> The problem is that vmnet_send_bh resets 'send_scheduled' after calling
> >> vmnet_read. If we got another packet after vmnet_read, it would be
> >> silently ignored.
> >>
> >> By the way, I forgot to mention another problem: vmnet_send_completed
> >> calls vmnet_set_send_enabled, but the other packets in the buffer may
> >> not be sent yet. Also, unregistering callbacks in vmnet_set_send_enabled
> >> is probably not enough to stop the callback being fired since some
> >> dispatch blocks are already in the dispatch queue.
> >>
> >
> > Now I understand what you mean, thanks.
> > What do you think about the workaround? For me
> > it is quite difficult question how to synchronize qemu with
> > vmnet thread, especially with completion callback.
>
> You may add a new field to represent the number of packets being sent
> in the buffer. The field must be maintained by vmnet_send_bh and
> vmnet_send_completed, which are on the iothread. vmnet_send_bh should
> do nothing if the field is greater than 0 at the beginning of the
> function. vmnet_send_completed should call
> qemu_bh_schedule(s->send_bh).
>
>
Thank you for the idea! Sounds meaningful to
schedule a bottom half in vmnet thread and do the
rest of things in iothread with no concurrency.

Not sure that only one field is enough, cause
we may have two states on bh execution start:
1. There are packets in vmnet buffer s->packets_buf
    that were rejected by qemu_send_async and waiting
    to be sent. If this happens, we should complete sending
    these waiting packets with qemu_send_async firstly,
    and after that we should call vmnet_read to get
    new ones and send them to QEMU;
2. There are no packets in s->packets_buf to be sent to
    qemu, we only need to get new packets from vmnet
    with vmnet_read and send them to QEMU

It can be done kinda this way:
```
struct s:
    send_bh:                    bh
    packets_buf:              array[packet]
    ## Three new fields
    send_enabled:           bool
    packets_send_pos:    int
    packets_batch_size:  int

fun bh_send(s):
    ## Send disabled - do nothing
    if not s->send_enabled:
        return

    ## If some packets are waiting to be sent in
    ## s->packets_buf - send them
    if s->packets_send_pos < s->packets_batch_size:
        if not qemu_send_wrapper(s):
            return

    ## Try to read new packets from vmnet
    s->packets_send_pos = 0
    s->packets_batch_size = 0
    s->packets_buf = vmnet_read(&s->packets_batch_size)
    if s->packets_batch_size > 0:
        # If something received - process them
        qemu_send_wrapper(s)

fun qemu_send_wrapper(s):
    for i in s->packets_send_pos to s->packets_batch_size:
        size = qemu_send_async(s->packets_buf[i],
                                                  vmnet_send_completed)
        if size == 0:
            ## Disable packets processing until vmnet_send_completed
            ## Save the state: packets to be sent now in s->packets_buf
            ## in range s->packets_send_pos..s->packets_batch_size
            s->send_enabled = false
            s->packets_send_pos = i + 1
            break

        if size < 0:
            ## On error just drop the packets
            s->packets_send_pos = 0
            s->packets_batch_size = 0
            break

     return s->send_enabled


fun vmnet_send_completed(s):
    ## Complete sending packets from s->packets_buf
    s->send_enabled = true
    qemu_bh_schedule(s->send_bh)

## From callback we only scheduling the bh
vmnet.set_callback(callback = s: qemu_bh_schedule(s->send_bh))
```

I think a simpler implementation may exist, but currently
I see only this approach with the send_enabled flag and
two more fields to save packets sending state.

vmnet_set_send_enabled and send_scheduled can be simply removed.
> qemu_bh_schedule ensures there is no duplicate scheduling.
>
>
Yep, my mistake. Previously I used schedule_oneshot which
creates a new bh for each call which causes duplicate scheduling.


Regards,
> Akihiko Odaki
>
>
> >
> >>
> >> Regards,
> >> Akihiko Odaki
> >>
> >> >
> >> >      > +                    qemu_bh_schedule(s->send_bh);
> >> >      > +                }
> >> >      > +            });
> >> >      > +    } else {
> >> >      > +        vmnet_interface_set_event_callback(
> >> >      > +            s->vmnet_if,
> >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >> >      > +            NULL,
> >> >      > +            NULL);
> >> >      > +    }
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +static void vmnet_send_completed(NetClientState *nc, ssize_t
> len)
> >> >      > +{
> >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >> >      > +    vmnet_set_send_enabled(s, true);
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +static void vmnet_send_bh(void *opaque)
> >> >      > +{
> >> >      > +    NetClientState *nc = (NetClientState *) opaque;
> >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >> >      > +
> >> >      > +    struct iovec *iov = s->iov_buf;
> >> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >> >      > +    int pkt_cnt;
> >> >      > +    int i;
> >> >      > +
> >> >      > +    vmnet_return_t status;
> >> >      > +    ssize_t size;
> >> >      > +
> >> >      > +    /* read as many packets as present */
> >> >      > +    pkt_cnt = VMNET_PACKETS_LIMIT;
> >> >
> >> >     There could be more than VMNET_PACKETS_LIMIT. You may call
> >> >     vmnet_read in
> >> >     a loop.
> >> >
> >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >> >      > +        packets[i].vm_pkt_size = s->max_packet_size;
> >> >      > +        packets[i].vm_pkt_iovcnt = 1;
> >> >      > +        packets[i].vm_flags = 0;
> >> >      > +    }
> >> >      > +
> >> >      > +    status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> >> >      > +    if (status != VMNET_SUCCESS) {
> >> >      > +        error_printf("vmnet: read failed: %s\n",
> >> >      > +                     vmnet_status_map_str(status));
> >> >      > +        goto done;
> >> >      > +    }
> >> >      > +
> >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >> >      > +        size = qemu_send_packet_async(nc,
> >> >      > +                                      iov[i].iov_base,
> >> >      > +                                      packets[i].vm_pkt_size,
> >> >      > +                                      vmnet_send_completed);
> >> >      > +        if (size == 0) {
> >> >      > +            vmnet_set_send_enabled(s, false);
> >> >      > +            goto done;
> >> >      > +        } else if (size < 0) {
> >> >      > +            break;
> >> >      > +        }
> >> >
> >> >     goto is not needed here. "break" when size <= 0.
> >> >
> >> >      > +    }
> >> >      > +
> >> >      > +done:
> >> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +static void vmnet_bufs_init(VmnetCommonState *s)
> >> >      > +{
> >> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >> >      > +    struct iovec *iov = s->iov_buf;
> >> >      > +    int i;
> >> >      > +
> >> >      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >> >      > +        iov[i].iov_len = s->max_packet_size;
> >> >      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> >> >      > +        packets[i].vm_pkt_iov = iov + i;
> >> >      > +    }
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +const char *vmnet_status_map_str(vmnet_return_t status)
> >> >      > +{
> >> >      > +    switch (status) {
> >> >      > +    case VMNET_SUCCESS:
> >> >      > +        return "success";
> >> >      > +    case VMNET_FAILURE:
> >> >      > +        return "general failure (possibly not enough
> privileges)";
> >> >      > +    case VMNET_MEM_FAILURE:
> >> >      > +        return "memory allocation failure";
> >> >      > +    case VMNET_INVALID_ARGUMENT:
> >> >      > +        return "invalid argument specified";
> >> >      > +    case VMNET_SETUP_INCOMPLETE:
> >> >      > +        return "interface setup is not complete";
> >> >      > +    case VMNET_INVALID_ACCESS:
> >> >      > +        return "invalid access, permission denied";
> >> >      > +    case VMNET_PACKET_TOO_BIG:
> >> >      > +        return "packet size is larger than MTU";
> >> >      > +    case VMNET_BUFFER_EXHAUSTED:
> >> >      > +        return "buffers exhausted in kernel";
> >> >      > +    case VMNET_TOO_MANY_PACKETS:
> >> >      > +        return "packet count exceeds limit";
> >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> >> >      > +    case VMNET_SHARING_SERVICE_BUSY:
> >> >      > +        return "conflict, sharing service is in use";
> >> >      > +#endif
> >> >      > +    default:
> >> >      > +        return "unknown vmnet error";
> >> >      > +    }
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +int vmnet_if_create(NetClientState *nc,
> >> >      > +                    xpc_object_t if_desc,
> >> >      > +                    Error **errp)
> >> >      > +{
> >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
> nc);;
> >> >
> >> >     Duplicate semicolons.
> >> >
> >> >      > +    dispatch_semaphore_t if_created_sem =
> >> >     dispatch_semaphore_create(0);
> >> >
> >> >     if_created_sem leaks.
> >> >
> >> >      > +    __block vmnet_return_t if_status;
> >> >      > +
> >> >      > +    s->if_queue = dispatch_queue_create(
> >> >      > +        "org.qemu.vmnet.if_queue",
> >> >      > +        DISPATCH_QUEUE_SERIAL
> >> >      > +    );
> >> >      > +
> >> >      > +    xpc_dictionary_set_bool(
> >> >      > +        if_desc,
> >> >      > +        vmnet_allocate_mac_address_key,
> >> >      > +        false
> >> >      > +    );
> >> >      > +#ifdef DEBUG
> >> >      > +    qemu_log("vmnet.start.interface_desc:\n");
> >> >      > +    xpc_dictionary_apply(if_desc,
> >> >      > +                         ^bool(const char *k, xpc_object_t v)
> {
> >> >      > +                             char *desc =
> xpc_copy_description(v);
> >> >      > +                             qemu_log("  %s=%s\n", k, desc);
> >> >      > +                             free(desc);
> >> >      > +                             return true;
> >> >      > +                         });
> >> >      > +#endif /* DEBUG */
> >> >      > +
> >> >      > +    s->vmnet_if = vmnet_start_interface(
> >> >      > +        if_desc,
> >> >      > +        s->if_queue,
> >> >      > +        ^(vmnet_return_t status, xpc_object_t
> interface_param) {
> >> >      > +            if_status = status;
> >> >      > +            if (status != VMNET_SUCCESS || !interface_param) {
> >> >      > +                dispatch_semaphore_signal(if_created_sem);
> >> >      > +                return;
> >> >      > +            }
> >> >      > +
> >> >      > +#ifdef DEBUG
> >> >      > +            qemu_log("vmnet.start.interface_param:\n");
> >> >      > +            xpc_dictionary_apply(interface_param,
> >> >      > +                                 ^bool(const char *k,
> >> >     xpc_object_t v) {
> >> >      > +                                     char *desc =
> >> >     xpc_copy_description(v);
> >> >      > +                                     qemu_log("  %s=%s\n", k,
> desc);
> >> >      > +                                     free(desc);
> >> >      > +                                     return true;
> >> >      > +                                 });
> >> >      > +#endif /* DEBUG */
> >> >      > +
> >> >      > +            s->mtu = xpc_dictionary_get_uint64(
> >> >      > +                interface_param,
> >> >      > +                vmnet_mtu_key);
> >> >      > +            s->max_packet_size = xpc_dictionary_get_uint64(
> >> >      > +                interface_param,
> >> >      > +                vmnet_max_packet_size_key);
> >> >      > +
> >> >      > +            dispatch_semaphore_signal(if_created_sem);
> >> >      > +        });
> >> >      > +
> >> >      > +    if (s->vmnet_if == NULL) {
> >> >      > +        error_setg(errp,
> >> >      > +                   "unable to create interface "
> >> >      > +                   "with requested params");
> >> >
> >> >     You don't need line breaks here. Breaking a string into a few
> would
> >> >     also
> >> >     makes it a bit hard to grep.
> >> >
> >> >      > +        return -1;
> >> >
> >> >     s->if_queue leaks.
> >> >
> >> >      > +    }
> >> >      > +
> >> >      > +    dispatch_semaphore_wait(if_created_sem,
> DISPATCH_TIME_FOREVER);
> >> >      > +
> >> >      > +    if (if_status != VMNET_SUCCESS) {
> >> >      > +        error_setg(errp,
> >> >      > +                   "cannot create vmnet interface: %s",
> >> >      > +                   vmnet_status_map_str(if_status));
> >> >      > +        return -1;
> >> >      > +    }
> >> >      > +
> >> >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
> >> >     vmnet_send_bh, nc);
> >> >      > +    vmnet_bufs_init(s);
> >> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >> >      > +    vmnet_set_send_enabled(s, true);
> >> >      > +    return 0;
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >> >      > +                             const uint8_t *buf,
> >> >      > +                             size_t size)
> >> >      > +{
> >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >> >      > +    struct vmpktdesc packet;
> >> >      > +    struct iovec iov;
> >> >      > +    int pkt_cnt;
> >> >      > +    vmnet_return_t if_status;
> >> >      > +
> >> >      > +    if (size > s->max_packet_size) {
> >> >      > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
> >> >
> >> >     Use PRIu64.
> >> >
> >> >      > +                    packet.vm_pkt_size,
> >> >      > +                    s->max_packet_size);
> >> >      > +        return -1;
> >> >      > +    }
> >> >      > +
> >> >      > +    iov.iov_base = (char *) buf;
> >> >      > +    iov.iov_len = size;
> >> >      > +
> >> >      > +    packet.vm_pkt_iovcnt = 1;
> >> >      > +    packet.vm_flags = 0;
> >> >      > +    packet.vm_pkt_size = size;
> >> >      > +    packet.vm_pkt_iov = &iov;
> >> >      > +    pkt_cnt = 1;
> >> >      > +
> >> >      > +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> >> >      > +    if (if_status != VMNET_SUCCESS) {
> >> >      > +        error_report("vmnet: write error: %s\n",
> >> >      > +                     vmnet_status_map_str(if_status));
> >> >
> >> >     Why don't return -1?
> >> >
> >> >      > +    }
> >> >      > +
> >> >      > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> >> >      > +        return size;
> >> >      > +    }
> >> >      > +    return 0;
> >> >      > +}
> >> >      > +
> >> >      > +
> >> >      > +void vmnet_cleanup_common(NetClientState *nc)
> >> >      > +{
> >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
> nc);;
> >> >
> >> >     Duplicate semicolons.
> >> >
> >> >      > +    dispatch_semaphore_t if_created_sem;
> >> >      > +
> >> >      > +    qemu_purge_queued_packets(nc); > +
> >> >     vmnet_set_send_bh_scheduled(s, true);
> >> >      > +    vmnet_set_send_enabled(s, false);
> >> >      > +
> >> >      > +    if (s->vmnet_if == NULL) {
> >> >      > +        return;
> >> >      > +    }
> >> >      > +
> >> >      > +    if_created_sem = dispatch_semaphore_create(0);
> >> >      > +    vmnet_stop_interface(
> >> >      > +        s->vmnet_if,
> >> >      > +        s->if_queue,
> >> >      > +        ^(vmnet_return_t status) {
> >> >      > +            assert(status == VMNET_SUCCESS);
> >> >      > +            dispatch_semaphore_signal(if_created_sem);
> >> >      > +        });
> >> >      > +    dispatch_semaphore_wait(if_created_sem,
> DISPATCH_TIME_FOREVER);
> >> >      > +
> >> >      > +    qemu_bh_delete(s->send_bh);
> >> >      > +    dispatch_release(if_created_sem);
> >> >      > +    dispatch_release(s->if_queue);
> >> >      > +
> >> >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >> >      > +        g_free(s->iov_buf[i].iov_base);
> >> >      > +    }
> >> >      > +}
> >> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >> >      > index f07afaaf21..66f66c034b 100644
> >> >      > --- a/net/vmnet-shared.c
> >> >      > +++ b/net/vmnet-shared.c
> >> >      > @@ -10,16 +10,102 @@
> >> >      >
> >> >      >   #include "qemu/osdep.h"
> >> >      >   #include "qapi/qapi-types-net.h"
> >> >      > +#include "qapi/error.h"
> >> >      >   #include "vmnet_int.h"
> >> >      >   #include "clients.h"
> >> >      > -#include "qemu/error-report.h"
> >> >      > -#include "qapi/error.h"
> >> >      >
> >> >      >   #include <vmnet/vmnet.h>
> >> >      >
> >> >      > +typedef struct VmnetSharedState {
> >> >      > +    VmnetCommonState cs;
> >> >      > +} VmnetSharedState;
> >> >      > +
> >> >      > +
> >> >      > +static bool validate_options(const Netdev *netdev, Error
> **errp)
> >> >      > +{
> >> >      > +    const NetdevVmnetSharedOptions *options =
> >> >     &(netdev->u.vmnet_shared);
> >> >      > +
> >> >      > +#if !defined(MAC_OS_VERSION_11_0) || \
> >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> >> >      > +    if (options->has_isolated) {
> >> >      > +        error_setg(errp,
> >> >      > +                   "vmnet-shared.isolated feature is "
> >> >      > +                   "unavailable: outdated vmnet.framework
> API");
> >> >      > +        return false;
> >> >      > +    }
> >> >      > +#endif
> >> >      > +
> >> >      > +    if ((options->has_start_address ||
> >> >      > +         options->has_end_address ||
> >> >      > +         options->has_subnet_mask) &&
> >> >      > +        !(options->has_start_address &&
> >> >      > +          options->has_end_address &&
> >> >      > +          options->has_subnet_mask)) {
> >> >      > +        error_setg(errp,
> >> >      > +                   "'start-address', 'end-address',
> 'subnet-mask' "
> >> >      > +                   "should be provided together"
> >> >      > +        );
> >> >      > +        return false;
> >> >      > +    }
> >> >      > +
> >> >      > +    return true;
> >> >      > +}
> >> >      > +
> >> >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
> >> >      > +{
> >> >      > +    const NetdevVmnetSharedOptions *options =
> >> >     &(netdev->u.vmnet_shared);
> >> >      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL,
> 0);
> >> >      > +
> >> >      > +    xpc_dictionary_set_uint64(
> >> >      > +        if_desc,
> >> >      > +        vmnet_operation_mode_key,
> >> >      > +        VMNET_SHARED_MODE
> >> >      > +    );
> >> >      > +
> >> >      > +    if (options->has_nat66_prefix) {
> >> >      > +        xpc_dictionary_set_string(if_desc,
> >> >      > +                                  vmnet_nat66_prefix_key,
> >> >      > +                                  options->nat66_prefix);
> >> >      > +    }
> >> >      > +
> >> >      > +    if (options->has_start_address) {
> >> >      > +        xpc_dictionary_set_string(if_desc,
> >> >      > +                                  vmnet_start_address_key,
> >> >      > +                                  options->start_address);
> >> >      > +        xpc_dictionary_set_string(if_desc,
> >> >      > +                                  vmnet_end_address_key,
> >> >      > +                                  options->end_address);
> >> >      > +        xpc_dictionary_set_string(if_desc,
> >> >      > +                                  vmnet_subnet_mask_key,
> >> >      > +                                  options->subnet_mask);
> >> >      > +    }
> >> >      > +
> >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> >> >      > +    xpc_dictionary_set_bool(
> >> >      > +        if_desc,
> >> >      > +        vmnet_enable_isolation_key,
> >> >      > +        options->isolated
> >> >      > +    );
> >> >      > +#endif
> >> >      > +
> >> >      > +    return if_desc;
> >> >      > +}
> >> >      > +
> >> >      > +static NetClientInfo net_vmnet_shared_info = {
> >> >      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> >> >      > +    .size = sizeof(VmnetSharedState),
> >> >      > +    .receive = vmnet_receive_common,
> >> >      > +    .cleanup = vmnet_cleanup_common,
> >> >      > +};
> >> >      > +
> >> >      >   int net_init_vmnet_shared(const Netdev *netdev, const char
> *name,
> >> >      >                             NetClientState *peer, Error **errp)
> >> >      >   {
> >> >      > -  error_setg(errp, "vmnet-shared is not implemented yet");
> >> >      > -  return -1;
> >> >      > +    NetClientState *nc =
> qemu_new_net_client(&net_vmnet_shared_info,
> >> >      > +                                             peer,
> >> >     "vmnet-shared", name);
> >> >      > +    if (!validate_options(netdev, errp)) {
> >> >      > +        g_assert_not_reached();
> >> >
> >> >     g_assert_not_reached is for debugging purpose and may be dropped
> >> >     depending on the build option.
> >> >
> >> >      > +    }
> >> >      > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >> >      >   }
> >> >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >> >      > index aac4d5af64..acfe3a88c0 100644
> >> >      > --- a/net/vmnet_int.h
> >> >      > +++ b/net/vmnet_int.h
> >> >      > @@ -15,11 +15,48 @@
> >> >      >   #include "clients.h"
> >> >      >
> >> >      >   #include <vmnet/vmnet.h>
> >> >      > +#include <dispatch/dispatch.h>
> >> >      > +
> >> >      > +/**
> >> >      > + *  From vmnet.framework documentation
> >> >      > + *
> >> >      > + *  Each read/write call allows up to 200 packets to be
> >> >      > + *  read or written for a maximum of 256KB.
> >> >      > + *
> >> >      > + *  Each packet written should be a complete
> >> >      > + *  ethernet frame.
> >> >      > + *
> >> >      > + * https://developer.apple.com/documentation/vmnet
> >> >     <https://developer.apple.com/documentation/vmnet>
> >> >      > + */
> >> >      > +#define VMNET_PACKETS_LIMIT 200
> >> >      >
> >> >      >   typedef struct VmnetCommonState {
> >> >      > -  NetClientState nc;
> >> >      > +    NetClientState nc;
> >> >      > +    interface_ref vmnet_if;
> >> >      > +
> >> >      > +    bool send_scheduled;
> >> >      >
> >> >      > +    uint64_t mtu;
> >> >      > +    uint64_t max_packet_size;
> >> >      > +
> >> >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >> >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >> >      > +
> >> >      > +    dispatch_queue_t if_queue;
> >> >      > +
> >> >      > +    QEMUBH *send_bh;
> >> >      >   } VmnetCommonState;
> >> >      >
> >> >      > +const char *vmnet_status_map_str(vmnet_return_t status);
> >> >      > +
> >> >      > +int vmnet_if_create(NetClientState *nc,
> >> >      > +                    xpc_object_t if_desc,
> >> >      > +                    Error **errp);
> >> >      > +
> >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >> >      > +                             const uint8_t *buf,
> >> >      > +                             size_t size);
> >> >      > +
> >> >      > +void vmnet_cleanup_common(NetClientState *nc);
> >> >      >
> >> >      >   #endif /* VMNET_INT_H */
> >> >
> >> >
> >> > Other issues will be fixed and submitted later,
> >> > thank you!
> >> >
> >> > Regards,
> >> > Vladislav Yaroshchuk
> >>
> >
> > Regards,
> > Vladislav Yaroshchuk
>

Best Regards,

Vladislav Yaroshchuk

--000000000000e5775b05d912c7a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 26, 2022 at 3:27 PM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, Feb 26, 2022 at 8:33 PM Vladislav Yaroshchuk<br>
&lt;<a href=3D"mailto:vladislav.yaroshchuk@jetbrains.com" target=3D"_blank"=
>vladislav.yaroshchuk@jetbrains.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Feb 26, 2022 at 12:16 PM Akihiko Odaki &lt;<a href=3D"mailto:a=
kihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On 2022/02/26 17:37, Vladislav Yaroshchuk wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Akihiko,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki &lt;<a href=3D"=
mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</=
a><br>
&gt;&gt; &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=
=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 2022/02/26 2:13, Vladislav Yaroshchuk w=
rote:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Interaction with vmnet.framework in =
different modes<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; differs only on configuration stage,=
 so we can create<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; common `send`, `receive`, etc. proce=
dures and reuse them.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; vmnet.framework supports iov, but wr=
iting more than<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; one iov into vmnet interface fails w=
ith<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Co=
llecting provided iovs into<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; one and passing it to vmnet works fi=
ne. That&#39;s the<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; reason why receive_iov() left unimpl=
emented. But it still<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; works with good enough performance h=
aving .receive()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; net/vmnet: implement shared mode (vm=
net-shared)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Interaction with vmnet.framework in =
different modes<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; differs only on configuration stage,=
 so we can create<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; common `send`, `receive`, etc. proce=
dures and reuse them.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; vmnet.framework supports iov, but wr=
iting more than<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; one iov into vmnet interface fails w=
ith<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Co=
llecting provided iovs into<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; one and passing it to vmnet works fi=
ne. That&#39;s the<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; reason why receive_iov() left unimpl=
emented. But it still<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; works with good enough performance h=
aving .receive()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; implemented only.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Also, there is no way to unsubscribe=
 from vmnet packages<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; receiving except registering and unr=
egistering event<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; callback or simply drop packages jus=
t ignoring and<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; not processing them when related fla=
g is set. Here we do<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; using the second way.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Phillip Tennen &lt;<a=
 href=3D"mailto:phillip@axleos.com" target=3D"_blank">phillip@axleos.com</a=
><br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:phillip@axleo=
s.com" target=3D"_blank">phillip@axleos.com</a>&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Vladislav Yaroshchuk<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:Vladislav.Yaroshchuk=
@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.com</a><br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Vladislav.Yar=
oshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.com=
</a>&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Thank you for persistently working on this=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-common.m | 302=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++++++++++++++=
+++<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=
=A0 94 +++++++++++++-<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =
=C2=A0 |=C2=A0 39 +++++-<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A03 files changed, 430 ins=
ertions(+), 5 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet-common.m b/ne=
t/vmnet-common.m<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 56612c72ce..2f70921cae 100644<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet-common.m<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet-common.m<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,6 +10,8 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qemu/osde=
p.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qemu/main-loop.h&quo=
t;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qemu/log.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/qapi=
-types-net.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;vmnet_int=
.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h=
&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -17,4 +19,304 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/erro=
r.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet=
.h&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;dispatch/dispatch.h&gt=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static inline void vmnet_set_send_b=
h_scheduled(VmnetCommonState *s,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool enable)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qatomic_set(&amp;s-&g=
t;send_scheduled, enable);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static inline bool vmnet_is_send_bh=
_scheduled(VmnetCommonState *s)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return qatomic_load_a=
cquire(&amp;s-&gt;send_scheduled);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static inline void vmnet_set_send_e=
nabled(VmnetCommonState *s,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool enable)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (enable) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_i=
nterface_set_event_callback(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;vmnet_if,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;if_queue,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^(interface_event_t event_id, xpc_object_t event) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 assert(event_id =3D=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VMNET_INTERFACE_PACKETS_AVAILABLE);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* This function is being called from a non qemu<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0thread, so<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* we only schedule a BH, and do the rest of the<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0io completion<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* handling from vmnet_send_bh() which runs in a<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0qemu context.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Avoid scheduling multiple bottom halves<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (!vmnet_is_send_bh_scheduled(s)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_set_send_bh_scheduled(s, true);<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0It can be interrupted between vmnet_is_sen=
d_bh_scheduled and<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0vmnet_set_send_bh_scheduled, which leads t=
o data race.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sorry, I did not clearly understand what you meant. Since thi=
s<br>
&gt;&gt; &gt; callback (block) is submitted on DISPATCH_QUEUE_SERIAL,<br>
&gt;&gt; &gt; only one instance of the callback will be executed at any<br>
&gt;&gt; &gt; moment of time.<br>
&gt;&gt; &gt; <a href=3D"https://developer.apple.com/documentation/dispatch=
/dispatch_queue_serial" rel=3D"noreferrer" target=3D"_blank">https://develo=
per.apple.com/documentation/dispatch/dispatch_queue_serial</a><br>
&gt;&gt; &gt; &lt;<a href=3D"https://developer.apple.com/documentation/disp=
atch/dispatch_queue_serial" rel=3D"noreferrer" target=3D"_blank">https://de=
veloper.apple.com/documentation/dispatch/dispatch_queue_serial</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also this is the only place where we schedule a bottom half.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; After we set the &#39;send_scheduled&#39; flag, all the other=
<br>
&gt;&gt; &gt; callback=C2=A0 blocks will do nothing (skip the if block) unt=
il<br>
&gt;&gt; &gt; the bottom half is executed and reset &#39;send_scheduled&#39=
;.<br>
&gt;&gt; &gt; I don&#39;t see any races here :(<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Correct me if I&#39;m wrong please.<br>
&gt;&gt;<br>
&gt;&gt; My explanation that the interruption between vmnet_is_send_bh_sche=
duled<br>
&gt;&gt; and vmnet_set_send_bh_scheduled is problematic was actually mislea=
ding.<br>
&gt;&gt;<br>
&gt;&gt; The problem is that vmnet_send_bh resets &#39;send_scheduled&#39; =
after calling<br>
&gt;&gt; vmnet_read. If we got another packet after vmnet_read, it would be=
<br>
&gt;&gt; silently ignored.<br>
&gt;&gt;<br>
&gt;&gt; By the way, I forgot to mention another problem: vmnet_send_comple=
ted<br>
&gt;&gt; calls vmnet_set_send_enabled, but the other packets in the buffer =
may<br>
&gt;&gt; not be sent yet. Also, unregistering callbacks in vmnet_set_send_e=
nabled<br>
&gt;&gt; is probably not enough to stop the callback being fired since some=
<br>
&gt;&gt; dispatch blocks are already in the dispatch queue.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Now I understand what you mean, thanks.<br>
&gt; What do you think about the workaround? For me<br>
&gt; it is quite difficult question how to synchronize qemu with<br>
&gt; vmnet thread, especially with completion callback.<br>
<br>
You may add a new field to represent the number of packets being sent<br>
in the buffer. The field must be maintained by vmnet_send_bh and<br>
vmnet_send_completed, which are on the iothread. vmnet_send_bh should<br>
do nothing if the field is greater than 0 at the beginning of the<br>
function. vmnet_send_completed should call<br>
qemu_bh_schedule(s-&gt;send_bh).<br>
<br></blockquote><div><br></div><div>Thank you for the idea! Sounds meaning=
ful to</div><div>schedule a bottom half in vmnet thread and do the</div><di=
v>rest of things in iothread with no concurrency.<br><br></div><div>Not sur=
e that only one field is enough, cause=C2=A0</div><div>we may have two stat=
es on bh execution start:<br>1. There are packets in vmnet buffer s-&gt;pac=
kets_buf</div><div>=C2=A0 =C2=A0 that were rejected by qemu_send_async and =
waiting</div><div>=C2=A0 =C2=A0 to be sent. If this happens, we should comp=
lete sending</div><div>=C2=A0 =C2=A0 these waiting packets with qemu_send_a=
sync firstly,</div><div>=C2=A0 =C2=A0 and after that we should call vmnet_r=
ead to get=C2=A0</div><div>=C2=A0 =C2=A0 new ones and send them to QEMU;</d=
iv><div>2. There are no packets in s-&gt;packets_buf to be sent to</div><di=
v>=C2=A0 =C2=A0 qemu, we only need to get new packets from vmnet</div><div>=
=C2=A0 =C2=A0 with vmnet_read and send them to QEMU</div><div><br></div><di=
v>It can be done kinda this way:</div><div>```<br>struct s:</div><div>=C2=
=A0 =C2=A0 send_bh:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bh</div><div>=C2=A0 =C2=A0 packets_buf:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 array[packet]</div><div>=C2=A0 =C2=A0 ## Three =
new fields</div><div>=C2=A0 =C2=A0 send_enabled:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bool</div><div>=C2=A0 =C2=A0 packets_send_pos:=C2=A0 =C2=A0 i=
nt</div><div>=C2=A0 =C2=A0 packets_batch_size:=C2=A0 int</div><div><br></di=
v><div>fun bh_send(s):</div><div>=C2=A0 =C2=A0 ## Send disabled - do nothin=
g</div><div>=C2=A0 =C2=A0 if not s-&gt;send_enabled:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=
=A0 ## If some packets are waiting to be sent in=C2=A0</div><div>=C2=A0 =C2=
=A0 ## s-&gt;packets_buf - send them</div><div>=C2=A0 =C2=A0 if s-&gt;packe=
ts_send_pos=C2=A0&lt; s-&gt;packets_batch_size:</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if not qemu_send_wrapper(s):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return</div><div><br></div><div>=C2=A0 =C2=A0 ## Try to r=
ead new packets from vmnet</div><div>=C2=A0 =C2=A0 s-&gt;packets_send_pos=
=C2=A0=3D 0</div><div>=C2=A0 =C2=A0 s-&gt;packets_batch_size =3D 0<br></div=
><div>=C2=A0 =C2=A0 s-&gt;packets_buf=C2=A0=3D vmnet_read(&amp;s-&gt;packet=
s_batch_size)</div><div>=C2=A0 =C2=A0 if s-&gt;packets_batch_size &gt; 0:</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If something received - process them=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_send_wrapper(s)</div><div>=C2=
=A0</div><div>fun qemu_send_wrapper(s):<br>=C2=A0 =C2=A0 for i in s-&gt;pac=
kets_send_pos=C2=A0to s-&gt;packets_batch_size:</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size =3D qemu_send_async(s-&gt;packets_buf[i],=C2=A0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send_completed)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if size =3D=3D 0:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ## Disable packets processing until vmnet_send_completed</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ## Save the state: packets to be sen=
t now in s-&gt;packets_buf<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ## =
in range s-&gt;packets_send_pos..s-&gt;packets_batch_size</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;send_enabled =3D false</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_send_pos=C2=A0=3D i=
=C2=A0+ 1</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if=C2=A0size &lt; 0:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##=
 On error just drop the packets</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;packets_send_pos=C2=A0=3D 0<br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_batch_size =3D 0</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break</div><div><br>=C2=A0 =C2=A0 =C2=
=A0return s-&gt;send_enabled</div><div><br></div><div><br></div><div>fun vm=
net_send_completed(s):</div><div>=C2=A0 =C2=A0 ## Complete sending packets =
from s-&gt;packets_buf</div><div>=C2=A0 =C2=A0 s-&gt;send_enabled =3D true<=
/div><div>=C2=A0 =C2=A0 qemu_bh_schedule(s-&gt;send_bh)<br><br></div><div>#=
# From callback we only scheduling the bh</div><div>vmnet.set_callback(call=
back =3D s: qemu_bh_schedule(s-&gt;send_bh))</div><div>```<br><br></div><di=
v>I think a simpler=C2=A0implementation may exist, but currently</div><div>=
I see only this approach with the send_enabled flag and</div><div>two more =
fields to save packets sending state.<br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
vmnet_set_send_enabled and send_scheduled can be simply removed.<br>
qemu_bh_schedule ensures there is no duplicate scheduling.<br>
<br></blockquote><div>=C2=A0</div><div>Yep, my mistake. Previously I used s=
chedule_oneshot which</div><div>creates a new bh for each call which causes=
 duplicate scheduling.</div><div><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Akihiko Odaki<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bh_schedule(s-&gt;send_bh);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 });<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_i=
nterface_set_event_callback(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;vmnet_if,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_completed(Ne=
tClientState *nc, ssize_t len)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =
=3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_set_send_enable=
d(s, true);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_bh(void *opa=
que)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState *nc =
=3D (NetClientState *) opaque;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =
=3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec *iov =3D=
 s-&gt;iov_buf;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc *pac=
kets =3D s-&gt;packets_buf;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_return_t status=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* read as many packe=
ts as present */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 pkt_cnt =3D VMNET_PAC=
KETS_LIMIT;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0There could be more than VMNET_PACKETS_LIM=
IT. You may call<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0vmnet_read in<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0a loop.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; =
pkt_cnt; ++i) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets=
[i].vm_pkt_size =3D s-&gt;max_packet_size;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets=
[i].vm_pkt_iovcnt =3D 1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets=
[i].vm_flags =3D 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 status =3D vmnet_read=
(s-&gt;vmnet_if, packets, &amp;pkt_cnt);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (status !=3D VMNET=
_SUCCESS) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_p=
rintf(&quot;vmnet: read failed: %s\n&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(status));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto do=
ne;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; =
pkt_cnt; ++i) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =
=3D qemu_send_packet_async(nc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_base,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_size,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send_completed);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (siz=
e =3D=3D 0) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vmnet_set_send_enabled(s, false);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto done;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else =
if (size &lt; 0) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0goto is not needed here. &quot;break&quot;=
 when size &lt;=3D 0.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +done:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_set_send_bh_sch=
eduled(s, false);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_bufs_init(VmnetCo=
mmonState *s)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc *pac=
kets =3D s-&gt;packets_buf;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec *iov =3D=
 s-&gt;iov_buf;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; =
VMNET_PACKETS_LIMIT; ++i) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].=
iov_len =3D s-&gt;max_packet_size;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].=
iov_base =3D g_malloc0(iov[i].iov_len);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets=
[i].vm_pkt_iov =3D iov + i;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +const char *vmnet_status_map_str(vm=
net_return_t status)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;success&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;general failure (possibly not enough privileges)&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILUR=
E:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;memory allocation failure&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_AR=
GUMENT:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;invalid argument specified&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCO=
MPLETE:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;interface setup is not complete&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_INVALID_AC=
CESS:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;invalid access, permission denied&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO=
_BIG:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;packet size is larger than MTU&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXH=
AUSTED:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;buffers exhausted in kernel&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_P=
ACKETS:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;packet count exceeds limit&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if defined(MAC_OS_VERSION_11_0) &a=
mp;&amp; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_=
REQUIRED &gt;=3D MAC_OS_VERSION_11_0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SE=
RVICE_BUSY:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;conflict, sharing service is in use&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;unknown vmnet error&quot;;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +int vmnet_if_create(NetClientState =
*nc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =
=3D DO_UPCAST(VmnetCommonState, nc, nc);;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Duplicate semicolons.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_t =
if_created_sem =3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0dispatch_semaphore_create(0);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0if_created_sem leaks.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 __block vmnet_return_=
t if_status;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;if_queue =3D di=
spatch_queue_create(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;o=
rg.qemu.vmnet.if_queue&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATC=
H_QUEUE_SERIAL<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bo=
ol(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc=
,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_a=
llocate_mac_address_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 false<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#ifdef DEBUG<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_log(&quot;vmnet.=
start.interface_desc:\n&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_apply(=
if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const char *k,=
 xpc_object_t v) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *=
desc =3D xpc_copy_description(v);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_l=
og(&quot;=C2=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(d=
esc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 true;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif /* DEBUG */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;vmnet_if =3D vm=
net_start_interface(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc=
,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;i=
f_queue,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet=
_return_t status, xpc_object_t interface_param) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if_status =3D status;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (status !=3D VMNET_SUCCESS || !interface_param) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(if_created_sem);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#ifdef DEBUG<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 qemu_log(&quot;vmnet.start.interface_param:\n&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 xpc_dictionary_apply(interface_param,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^bool(const char *k,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0xpc_object_t v) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0char *desc =3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0xpc_copy_description(v);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;=C2=A0 %s=3D%s\n&quot;, k, desc);<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0});<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif /* DEBUG */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;mtu =3D xpc_dictionary_get_uint64(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vmnet_mtu_key);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;max_packet_size =3D xpc_dictionary_get_uint64(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vmnet_max_packet_size_key);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dispatch_semaphore_signal(if_created_sem);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =
=3D=3D NULL) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_s=
etg(errp,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unable to create interface &quot;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;with requested params&quot;);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0You don&#39;t need line breaks here. Break=
ing a string into a few would<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0also<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0makes it a bit hard to grep.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
-1;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0s-&gt;if_queue leaks.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_wa=
it(if_created_sem, DISPATCH_TIME_FOREVER);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status !=3D VM=
NET_SUCCESS) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_s=
etg(errp,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cannot create vmnet interface: %s&q=
uot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
-1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_bh =3D aio=
_bh_new(qemu_get_aio_context(),<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0vmnet_send_bh, nc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_set_send_bh_sch=
eduled(s, false);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_set_send_enable=
d(s, true);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ssize_t vmnet_receive_common(NetCli=
entState *nc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
uint8_t *buf,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=
 size)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =
=3D DO_UPCAST(VmnetCommonState, nc, nc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc pack=
et;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec iov;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_return_t if_sta=
tus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (size &gt; s-&gt;m=
ax_packet_size) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_re=
port(&quot;vmnet: packet is too big, %zu &gt; %llu\n&quot;,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Use PRIu64.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packet.vm_pkt_size,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet_size);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
-1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 iov.iov_base =3D (cha=
r *) buf;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 iov.iov_len =3D size;=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iovcnt =
=3D 1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_flags =3D 0=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_size =
=3D size;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 packet.vm_pkt_iov =3D=
 &amp;iov;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 pkt_cnt =3D 1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if_status =3D vmnet_w=
rite(s-&gt;vmnet_if, &amp;packet, &amp;pkt_cnt);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status !=3D VM=
NET_SUCCESS) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_r=
eport(&quot;vmnet: write error: %s\n&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_status_map_str(if_status));<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Why don&#39;t return -1?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (if_status =3D=3D =
VMNET_SUCCESS &amp;&amp; pkt_cnt) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
size;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +void vmnet_cleanup_common(NetClient=
State *nc)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =
=3D DO_UPCAST(VmnetCommonState, nc, nc);;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Duplicate semicolons.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_t =
if_created_sem;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_purge_queued_pac=
kets(nc); &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0vmnet_set_send_bh_scheduled(s, true);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_set_send_enable=
d(s, false);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =
=3D=3D NULL) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if_created_sem =3D di=
spatch_semaphore_create(0);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_stop_interface(=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;v=
mnet_if,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;i=
f_queue,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet=
_return_t status) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 assert(status =3D=3D VMNET_SUCCESS);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dispatch_semaphore_signal(if_created_sem);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_semaphore_wa=
it(if_created_sem, DISPATCH_TIME_FOREVER);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 qemu_bh_delete(s-&gt;=
send_bh);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_release(if_c=
reated_sem);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_release(s-&g=
t;if_queue);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &=
lt; VMNET_PACKETS_LIMIT; ++i) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(=
s-&gt;iov_buf[i].iov_base);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet-shared.c b/ne=
t/vmnet-shared.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index f07afaaf21..66f66c034b 100644<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet-shared.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet-shared.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,16 +10,102 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qemu/osde=
p.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/qapi=
-types-net.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;qapi/error.h&quot;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;vmnet_int=
.h&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h=
&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#include &quot;qemu/error-report.h&=
quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#include &quot;qapi/error.h&quot;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet=
.h&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +typedef struct VmnetSharedState {<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState cs;<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +} VmnetSharedState;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static bool validate_options(const =
Netdev *netdev, Error **errp)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 const NetdevVmnetShar=
edOptions *options =3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&amp;(netdev-&gt;u.vmnet_shared);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if !defined(MAC_OS_VERSION_11_0) |=
| \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_=
REQUIRED &lt; MAC_OS_VERSION_11_0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_i=
solated) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_s=
etg(errp,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;vmnet-shared.isolated feature is &q=
uot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unavailable: outdated vmnet.framewo=
rk API&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
false;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if ((options-&gt;has_=
start_address ||<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o=
ptions-&gt;has_end_address ||<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o=
ptions-&gt;has_subnet_mask) &amp;&amp;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(optio=
ns-&gt;has_start_address &amp;&amp;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
options-&gt;has_end_address &amp;&amp;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
options-&gt;has_subnet_mask)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_s=
etg(errp,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;start-address&#39;, &#39;end-a=
ddress&#39;, &#39;subnet-mask&#39; &quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;should be provided together&quot;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
false;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return true;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static xpc_object_t build_if_desc(c=
onst Netdev *netdev)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 const NetdevVmnetShar=
edOptions *options =3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&amp;(netdev-&gt;u.vmnet_shared);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =
=3D xpc_dictionary_create(NULL, NULL, 0);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_ui=
nt64(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc=
,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_o=
peration_mode_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_S=
HARED_MODE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_n=
at66_prefix) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dic=
tionary_set_string(if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vmnet_nat66_prefix_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 options-&gt;nat66_prefix);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (options-&gt;has_s=
tart_address) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dic=
tionary_set_string(if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vmnet_start_address_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 options-&gt;start_address);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dic=
tionary_set_string(if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vmnet_end_address_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 options-&gt;end_address);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dic=
tionary_set_string(if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vmnet_subnet_mask_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 options-&gt;subnet_mask);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#if defined(MAC_OS_VERSION_11_0) &a=
mp;&amp; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_=
REQUIRED &gt;=3D MAC_OS_VERSION_11_0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bo=
ol(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc=
,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_e=
nable_isolation_key,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options=
-&gt;isolated<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 );<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static NetClientInfo net_vmnet_shar=
ed_info =3D {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_=
DRIVER_VMNET_SHARED,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .size =3D sizeof(Vmne=
tSharedState),<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .receive =3D vmnet_re=
ceive_common,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cl=
eanup_common,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +};<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0int net_init_vmnet_share=
d(const Netdev *netdev, const char *name,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetCli=
entState *peer, Error **errp)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0{<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 error_setg(errp, &quot;vmnet=
-shared is not implemented yet&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 return -1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState *nc =
=3D qemu_new_net_client(&amp;net_vmnet_shared_info,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0peer,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;vmnet-shared&quot;, name);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (!validate_options=
(netdev, errp)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_asser=
t_not_reached();<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0g_assert_not_reached is for debugging purp=
ose and may be dropped<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0depending on the build option.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return vmnet_if_creat=
e(nc, build_if_desc(netdev), errp);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet_int.h b/net/v=
mnet_int.h<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index aac4d5af64..acfe3a88c0 100644<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet_int.h<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet_int.h<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -15,11 +15,48 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;clients.h=
&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet=
.h&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;dispatch/dispatch.h&gt=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 From vmnet.framework docum=
entation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 Each read/write call allow=
s up to 200 packets to be<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 read or written for a maxi=
mum of 256KB.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 Each packet written should=
 be a complete<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *=C2=A0 ethernet frame.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * <a href=3D"https://developer.app=
le.com/documentation/vmnet" rel=3D"noreferrer" target=3D"_blank">https://de=
veloper.apple.com/documentation/vmnet</a><br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://developer.apple.com=
/documentation/vmnet" rel=3D"noreferrer" target=3D"_blank">https://develope=
r.apple.com/documentation/vmnet</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#define VMNET_PACKETS_LIMIT 200<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0typedef struct VmnetComm=
onState {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 NetClientState nc;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState nc;<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 interface_ref vmnet_i=
f;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 bool send_scheduled;<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 uint64_t mtu;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 uint64_t max_packet_s=
ize;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc pack=
ets_buf[VMNET_PACKETS_LIMIT];<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct iovec iov_buf[=
VMNET_PACKETS_LIMIT];<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 dispatch_queue_t if_q=
ueue;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 QEMUBH *send_bh;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0} VmnetCommonState;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +const char *vmnet_status_map_str(vm=
net_return_t status);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +int vmnet_if_create(NetClientState =
*nc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_object_t if_desc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ssize_t vmnet_receive_common(NetCli=
entState *nc,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
uint8_t *buf,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=
 size);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +void vmnet_cleanup_common(NetClient=
State *nc);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#endif /* VMNET_INT_H */=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Other issues will be fixed and submitted later,<br>
&gt;&gt; &gt; thank you!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Vladislav Yaroshchuk<br>
&gt;&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Vladislav Yaroshchuk<br></blockquote><div><br>Best Regards,<br><br>Vla=
dislav Yaroshchuk=C2=A0</div></div></div>

--000000000000e5775b05d912c7a7--

