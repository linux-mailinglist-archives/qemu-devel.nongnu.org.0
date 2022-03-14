Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A24D900C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 00:07:42 +0100 (CET)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtmv-0006B8-Im
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 19:07:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nTtlg-00051t-4G
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:06:24 -0400
Received: from [2607:f8b0:4864:20::434] (port=34521
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nTtlc-0006UH-JD
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:06:23 -0400
Received: by mail-pf1-x434.google.com with SMTP id l8so6110075pfu.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 16:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FdLVTweH6ZmhYuG8GizCinAeJOuPpm4+JjzRIq41gPg=;
 b=NBq0Tq68IXOTAsWmc+WrZylKJya3Pz825GGQL99EDOdybNMcnMnJgQbgDUUjKTVdEg
 W7+g6Y1ppMcl6z4tIAkbcb7w7HWUXG+m/6hOsspfSdnYY2IXc1c5oRcVwfMc30g56I8M
 yKXZ/K6r28D7tCQgfRJVs1yQB/dl4KmSDObXWkNXrm7PwAbswV6YQqi9UQ57BnJHJMbu
 WD4MtdetjchS6PxlkOeo6Q/98Os57O6fmhrduv1xQCbnIiAEv4J1clk6FqxeuHdLeRye
 VFR+EAIjZgz6mtnd09Y0ZCS29IrrSU07ULDAm61ZZyFpoAOLZG+xjPZ8x6dJ63QWpN5H
 TTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FdLVTweH6ZmhYuG8GizCinAeJOuPpm4+JjzRIq41gPg=;
 b=7JcQvJrglTvrHo/Yr10nrHdXOaIJxcNORUBmGDuBHybHRTakyhjDKWPIZuEJz3GRSV
 BjauizNyUb4eZjDxM/k2U9p1WpygcEOokQUmJtY6BQm1vPx7tT6ucXw26Vx7JnnpwEaU
 cYuaOPMoVdJj9Iw3e58zm4sKgTHV3g931ULZTavhCSMBykb/Nv439WIVkRpJckMwcMqD
 cAn/AepHZ9SRJvteLY98XUQeqWBdv56IUWIYmxqwaDTX2PJPtlrXdO0MSRhwYaK97HAl
 vsxgkUoLKnra/Z1ZpoHcNzUAaYOzNYDUTPWRctoBspyAjtpfOGkm6agPPsHqHjZS3iZ1
 sgqQ==
X-Gm-Message-State: AOAM530aKVzWXB98KdR1VF6HD40DNcHn7V3n+erFEetl18lSUBh8yoTU
 7AEQQBkQQfHH+uWRa/h57bw=
X-Google-Smtp-Source: ABdhPJz/J80QBIUtQRatQwiFO7sA0JGUSck0t/9bgSHjSuiAPjEUq3YFyv2RRT5OTOodMuGduhR0Mw==
X-Received: by 2002:a65:6093:0:b0:373:9c75:19ec with SMTP id
 t19-20020a656093000000b003739c7519ecmr22509527pgu.539.1647299179108; 
 Mon, 14 Mar 2022 16:06:19 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a056a00139800b004f7586bc170sm23653178pfg.95.2022.03.14.16.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 16:06:18 -0700 (PDT)
Message-ID: <a30b634f-0db1-7839-5827-9be48527c802@gmail.com>
Date: Tue, 15 Mar 2022 08:06:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v16 3/7] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220314191545.81861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <f050ce26-4cff-82c9-33f6-8532ecb8b6dc@gmail.com>
 <CAGmdLqT5Ka4=_P-tKHquimfYd_f4S7XeajUieKjyQ8sFqX33ig@mail.gmail.com>
 <55e7af6a-ca93-9c4f-2c1e-2f9f87a64e53@gmail.com>
 <CAGmdLqR7vCuxfKOnDb-mQ1cEkih2C+pci50OtxNDzUAVXhszSA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAGmdLqR7vCuxfKOnDb-mQ1cEkih2C+pci50OtxNDzUAVXhszSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/15 8:02, Vladislav Yaroshchuk wrote:
> 
> 
> вт, 15 мар. 2022 г., 1:34 AM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>>:
> 
>     On 2022/03/15 6:50, Vladislav Yaroshchuk wrote:
>      > Thank you, Akihiko
>      >
>      > On Mon, Mar 14, 2022 at 10:46 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >
>      >     On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:
>      >      > vmnet.framework supports iov, but writing more than
>      >      > one iov into vmnet interface fails with
>      >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
>      >      > one and passing it to vmnet works fine. That's the
>      >      > reason why receive_iov() left unimplemented. But it still
>      >      > works with good enough performance having .receive()
>      >      > implemented only.
>      >      >
>      >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
>     <mailto:phillip@axleos.com>
>      >     <mailto:phillip@axleos.com <mailto:phillip@axleos.com>>>
>      >      > Signed-off-by: Vladislav Yaroshchuk
>      >     <Vladislav.Yaroshchuk@jetbrains.com
>     <mailto:Vladislav.Yaroshchuk@jetbrains.com>
>      >     <mailto:Vladislav.Yaroshchuk@jetbrains.com
>     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>>
>      >      > ---
>      >      >   net/vmnet-common.m | 298
>      >     +++++++++++++++++++++++++++++++++++++++++++++
>      >      >   net/vmnet-shared.c |  95 ++++++++++++++-
>      >      >   net/vmnet_int.h    |  41 ++++++-
>      >      >   3 files changed, 429 insertions(+), 5 deletions(-)
>      >      >
>      >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>      >      > index 56612c72ce..20a33d2591 100644
>      >      > --- a/net/vmnet-common.m
>      >      > +++ b/net/vmnet-common.m
>      >      > @@ -10,6 +10,8 @@
>      >      >    */
>      >      >
>      >      >   #include "qemu/osdep.h"
>      >      > +#include "qemu/main-loop.h"
>      >      > +#include "qemu/log.h"
>      >      >   #include "qapi/qapi-types-net.h"
>      >      >   #include "vmnet_int.h"
>      >      >   #include "clients.h"
>      >      > @@ -17,4 +19,300 @@
>      >      >   #include "qapi/error.h"
>      >      >
>      >      >   #include <vmnet/vmnet.h>
>      >      > +#include <dispatch/dispatch.h>
>      >      >
>      >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s);
>      >
>      >     The names of vmnet_qemu_send_wrapper and vmnet_send_bh does
>     not tell
>      >     them apart well. Since only vmnet_send_bh does reading, its
>     name may
>      >     include "read" to clarify that. "wrapper" in
>     vmnet_qemu_send_wrapper
>      >     may
>      >     be also misleading as it does more than just calling the
>     underlying
>      >     QEMU
>      >     facility, but it also updates VmnetCommonState.
>      >
>      >
>      > Ok, I'll think about how to name them better.
>      >
>      >      > +
>      >      > +
>      >      > +static void vmnet_send_completed(NetClientState *nc,
>     ssize_t len)
>      >      > +{
>      >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
>     nc);
>      >      > +    /* Complete sending packets left in VmnetCommonState
>     buffers */
>      >      > +    s->send_enabled = vmnet_qemu_send_wrapper(s);
>      >
>      >     It must qemu_bh_schedule(s->send_bh) after
>     vmnet_qemu_send_wrapper.
>      >
>      >
>      > Agree with you, thanks.
>      >
>      >     Also, send_enabled flag can be removed as explained in:
>      > https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html
>     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html>
>      >   
>       <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html
>     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html>>
>      >
>      >
>      > Not sure about this. Values of packets_send_current_pos
>      > and packets_send_end_pos may be equal, but QEMU may be
>      > not ready to receive new packets - the explanation:
>      > 1. We are sending packets to QEMU with qemu_send_packet_async:
>      >      packets_send_current_pos = 0
>      >      packets_send_end_pos = 5
>      > 2. All five packets (0, 1, 2, 3, 4) have been successfully sent
>     to QEMU,
>      >      but qemu_send_packet_async returned 0 "no more packets" after
>      >      the last invocation
>      > 3. In spite of this, all five packets are sent and
>      >      packets_send_current_pos == packets_send_end_pos == 5
>      > 4. It seems that "pointers are equal ->  QEMU is ready", but actually
>      >      it is not.
>      >
>      > Also, hiding QEMU "ready"/"not ready" state behind pointers is a
>      > bad choice I think. Having a concrete flag makes this more clear.
>      > It provides understandability, not complexity (imho).
> 
>     packets_send_current_pos must not be incremented if
>     qemu_send_packet_async returned 0. It must tell the position of the
>     packet currently being sent.
> 
> 
> 
>  > must be incremented
> It cannot.
> 
> If qemu_send_packet_async returns 0,
> it still consumes (!) (queues internally) the packet.
> So the packets_send_current_pos must be
> incremented
> to prevent sending same packet multiple times.
> 
> The idea is simple:
> 1. We've sent the packet - increment
> 2. Packed is not send - not increment
> 
> qemu_send_packet_async with 0 returned meets
> the 1st case, because it still queues the packet.
> 
> While the increment action is not depends on the
> returned value, we cannot use position pointers as a
> criteria to send more packets or not. Another state
> storage (flag) is required.
> 
> 
> If You are not against, I'll cover this with proper
> documentation (comments) to simplify future support
> and make it more clear.

I forgot to note that packets_send_current_pos should be incremented in 
vmnet_send_completed instead. It would make packets_send_current_pos 
properly represent case 1.

> 
> 
> Best regards,
> 
> Vladislav Yaroshchuk
> 
> 
> 
>     It would not hide the state, but it would rather make it clear that the
>     condition vmnet_send_bh can execute. If you see the current
>     implementation of vmnet_send_bh, you'll find the send_enabled flag, but
>     it does not tell the exact condition it requires to be enabled. You
>     have
>     to then jump to all assignments for the flag to know it becomes true
>     iff
>     every packets in the buffer are sent. It is obvious if vmnet_send_bh
>     directly states `if (packets_send_current_pos < packets_send_end_pos)`.
> 
>     Eliminating the flag would also remove the possiblity of forgetting to
>     maintain the separate state.
> 
> 
>      >
>      >       > send_enabled can be eliminated. When it is enabled,
>     packets_send_pos
>      >       > and packets_batch_size must be equal. They must not be equal
>      >       > otherwise. packets_send_pos must represent the position
>     of the
>      >     packet
>      >       > which is not sent yet, possibly in the process of sending.
>      >       > vmnet_send_completed must call qemu_send_wrapper before
>     scheduling
>      >       > send_bh. bh_send should do nothing if s->packets_send_pos <
>      >       > s->packets_batch_size.
>      >
>      >      > +}
>      >      > +
>      >      > +
>      >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s) {
>      >      > +    ssize_t size;
>      >      > +
>      >      > +    /*
>      >      > +     * Packets to send lay in [current_pos..end_pos)
>      >      > +     * (including current_pos, excluding end_pos)
>      >      > +     */
>      >      > +    while (s->packets_send_current_pos <
>     s->packets_send_end_pos) {
>      >      > +        size = qemu_send_packet_async(&s->nc,
>      >      > +
>      >     s->iov_buf[s->packets_send_current_pos].iov_base,
>      >      > +
>      >     s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
>      >      > +                                      vmnet_send_completed);
>      >      > +        ++s->packets_send_current_pos;
>      >      > +        if (size == 0) {
>      >      > +            /* QEMU is not ready - wait for completion
>     callback
>      >     call */
>      >      > +            return false;
>      >      > +        }
>      >      > +    }
>      >      > +    return true;
>      >      > +}
>      >      > +
>      >      > +
>      >      > +static void vmnet_send_bh(void *opaque)
>      >      > +{
>      >      > +    NetClientState *nc = (NetClientState *) opaque;
>      >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
>     nc);
>      >      > +    struct vmpktdesc *packets = s->packets_buf;
>      >      > +    vmnet_return_t status;
>      >      > +    int i;
>      >      > +
>      >      > +    /*
>      >      > +     * Do nothing if QEMU is not ready - wait
>      >      > +     * for completion callback invocation
>      >      > +     */
>      >      > +    if (!s->send_enabled) {
>      >      > +        return;
>      >      > +    }
>      >      > +
>      >      > +    /* Read as many packets as present */
>      >      > +    s->packets_send_current_pos = 0;
>      >      > +    s->packets_send_end_pos = VMNET_PACKETS_LIMIT;
>      >      > +    for (i = 0; i < s->packets_send_end_pos; ++i) {
>      >      > +        packets[i].vm_pkt_size = s->max_packet_size;
>      >      > +        packets[i].vm_pkt_iovcnt = 1;
>      >      > +        packets[i].vm_flags = 0;
>      >      > +    }
>      >      > +
>      >      > +    status = vmnet_read(s->vmnet_if, packets,
>      >     &s->packets_send_end_pos);
>      >      > +    if (status != VMNET_SUCCESS) {
>      >      > +        error_printf("vmnet: read failed: %s\n",
>      >      > +                     vmnet_status_map_str(status));
>      >      > +        s->packets_send_current_pos = 0;
>      >      > +        s->packets_send_end_pos = 0;
>      >      > +        return;
>      >      > +    }
>      >      > +
>      >      > +    /* Send packets to QEMU */
>      >      > +    s->send_enabled = vmnet_qemu_send_wrapper(s);
>      >      > +}
>      >      > +
>      >      > +
>      >      > +static void vmnet_bufs_init(VmnetCommonState *s)
>      >      > +{
>      >      > +    struct vmpktdesc *packets = s->packets_buf;
>      >      > +    struct iovec *iov = s->iov_buf;
>      >      > +    int i;
>      >      > +
>      >      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      >      > +        iov[i].iov_len = s->max_packet_size;
>      >      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
>      >      > +        packets[i].vm_pkt_iov = iov + i;
>      >      > +    }
>      >      > +}
>      >      > +
>      >      > +
>      >      > +const char *vmnet_status_map_str(vmnet_return_t status)
>      >      > +{
>      >      > +    switch (status) {
>      >      > +    case VMNET_SUCCESS:
>      >      > +        return "success";
>      >      > +    case VMNET_FAILURE:
>      >      > +        return "general failure (possibly not enough
>     privileges)";
>      >      > +    case VMNET_MEM_FAILURE:
>      >      > +        return "memory allocation failure";
>      >      > +    case VMNET_INVALID_ARGUMENT:
>      >      > +        return "invalid argument specified";
>      >      > +    case VMNET_SETUP_INCOMPLETE:
>      >      > +        return "interface setup is not complete";
>      >      > +    case VMNET_INVALID_ACCESS:
>      >      > +        return "invalid access, permission denied";
>      >      > +    case VMNET_PACKET_TOO_BIG:
>      >      > +        return "packet size is larger than MTU";
>      >      > +    case VMNET_BUFFER_EXHAUSTED:
>      >      > +        return "buffers exhausted in kernel";
>      >      > +    case VMNET_TOO_MANY_PACKETS:
>      >      > +        return "packet count exceeds limit";
>      >      > +#if defined(MAC_OS_VERSION_11_0) && \
>      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      >      > +    case VMNET_SHARING_SERVICE_BUSY:
>      >      > +        return "conflict, sharing service is in use";
>      >      > +#endif
>      >      > +    default:
>      >      > +        return "unknown vmnet error";
>      >      > +    }
>      >      > +}
>      >      > +
>      >      > +
>      >      > +int vmnet_if_create(NetClientState *nc,
>      >      > +                    xpc_object_t if_desc,
>      >      > +                    Error **errp)
>      >      > +{
>      >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
>     nc);
>      >      > +    dispatch_semaphore_t if_created_sem =
>      >     dispatch_semaphore_create(0);
>      >      > +    __block vmnet_return_t if_status;
>      >      > +
>      >      > +    s->if_queue = dispatch_queue_create(
>      >      > +        "org.qemu.vmnet.if_queue",
>      >      > +        DISPATCH_QUEUE_SERIAL
>      >      > +    );
>      >      > +
>      >      > +    xpc_dictionary_set_bool(
>      >      > +        if_desc,
>      >      > +        vmnet_allocate_mac_address_key,
>      >      > +        false
>      >      > +    );
>      >      > +
>      >      > +#ifdef DEBUG
>      >      > +    qemu_log("vmnet.start.interface_desc:\n");
>      >      > +    xpc_dictionary_apply(if_desc,
>      >      > +                         ^bool(const char *k,
>     xpc_object_t v) {
>      >      > +                             char *desc =
>     xpc_copy_description(v);
>      >      > +                             qemu_log("  %s=%s\n", k, desc);
>      >      > +                             free(desc);
>      >      > +                             return true;
>      >      > +                         });
>      >      > +#endif /* DEBUG */
>      >      > +
>      >      > +    s->vmnet_if = vmnet_start_interface(
>      >      > +        if_desc,
>      >      > +        s->if_queue,
>      >      > +        ^(vmnet_return_t status, xpc_object_t
>     interface_param) {
>      >      > +            if_status = status;
>      >      > +            if (status != VMNET_SUCCESS ||
>     !interface_param) {
>      >      > +                dispatch_semaphore_signal(if_created_sem);
>      >      > +                return;
>      >      > +            }
>      >      > +
>      >      > +#ifdef DEBUG
>      >      > +            qemu_log("vmnet.start.interface_param:\n");
>      >      > +            xpc_dictionary_apply(interface_param,
>      >      > +                                 ^bool(const char *k,
>      >     xpc_object_t v) {
>      >      > +                                     char *desc =
>      >     xpc_copy_description(v);
>      >      > +                                     qemu_log(" 
>     %s=%s\n", k, desc);
>      >      > +                                     free(desc);
>      >      > +                                     return true;
>      >      > +                                 });
>      >      > +#endif /* DEBUG */
>      >      > +
>      >      > +            s->mtu = xpc_dictionary_get_uint64(
>      >      > +                interface_param,
>      >      > +                vmnet_mtu_key);
>      >      > +            s->max_packet_size = xpc_dictionary_get_uint64(
>      >      > +                interface_param,
>      >      > +                vmnet_max_packet_size_key);
>      >      > +
>      >      > +            dispatch_semaphore_signal(if_created_sem);
>      >      > +        });
>      >      > +
>      >      > +    if (s->vmnet_if == NULL) {
>      >      > +        dispatch_release(s->if_queue);
>      >      > +        dispatch_release(if_created_sem);
>      >      > +        error_setg(errp,
>      >      > +                   "unable to create interface with requested
>      >     params");
>      >      > +        return -1;
>      >      > +    }
>      >      > +
>      >      > +    dispatch_semaphore_wait(if_created_sem,
>     DISPATCH_TIME_FOREVER);
>      >      > +    dispatch_release(if_created_sem);
>      >      > +
>      >      > +    if (if_status != VMNET_SUCCESS) {
>      >      > +        dispatch_release(s->if_queue);
>      >      > +        error_setg(errp,
>      >      > +                   "cannot create vmnet interface: %s",
>      >      > +                   vmnet_status_map_str(if_status));
>      >      > +        return -1;
>      >      > +    }
>      >      > +
>      >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
>      >     vmnet_send_bh, nc);
>      >      > +    s->send_enabled = true;
>      >      > +    vmnet_bufs_init(s);
>      >      > +
>      >      > +    vmnet_interface_set_event_callback(
>      >      > +        s->vmnet_if,
>      >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
>      >      > +        s->if_queue,
>      >      > +        ^(interface_event_t event_id, xpc_object_t event) {
>      >      > +            assert(event_id ==
>     VMNET_INTERFACE_PACKETS_AVAILABLE);
>      >      > +            /*
>      >      > +             * This function is being called from a non qemu
>      >     thread, so
>      >      > +             * we only schedule a BH, and do the rest of
>     the io
>      >     completion
>      >      > +             * handling from vmnet_send_bh() which runs in a
>      >     qemu context.
>      >      > +             */
>      >      > +            qemu_bh_schedule(s->send_bh);
>      >      > +        });
>      >      > +
>      >      > +    return 0;
>      >      > +}
>      >      > +
>      >      > +
>      >      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      >      > +                             const uint8_t *buf,
>      >      > +                             size_t size)
>      >      > +{
>      >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
>     nc);
>      >      > +    struct vmpktdesc packet;
>      >      > +    struct iovec iov;
>      >      > +    int pkt_cnt;
>      >      > +    vmnet_return_t if_status;
>      >      > +
>      >      > +    if (size > s->max_packet_size) {
>      >      > +        warn_report("vmnet: packet is too big, %zu > %"
>     PRIu64,
>      >      > +        packet.vm_pkt_size,
>      >      > +        s->max_packet_size);
>      >      > +        return -1;
>      >      > +    }
>      >      > +
>      >      > +    iov.iov_base = (char *) buf;
>      >      > +    iov.iov_len = size;
>      >      > +
>      >      > +    packet.vm_pkt_iovcnt = 1;
>      >      > +    packet.vm_flags = 0;
>      >      > +    packet.vm_pkt_size = size;
>      >      > +    packet.vm_pkt_iov = &iov;
>      >      > +    pkt_cnt = 1;
>      >      > +
>      >      > +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
>      >      > +    if (if_status != VMNET_SUCCESS) {
>      >      > +        error_report("vmnet: write error: %s\n",
>      >      > +                     vmnet_status_map_str(if_status));
>      >      > +        return -1;
>      >      > +    }
>      >      > +
>      >      > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
>      >
>      >     `if_status == VMNET_SUCCESS` is redundant.
>      >
>      >
>      > Missed this, thanks.
>      >
>      >     Regards,
>      >     Akihiko Odaki
>      >
>      >      > +        return size;
>      >      > +    }
>      >      > +    return 0;
>      >      > +}
>      >      > +
>      >      > +
>      >      > +void vmnet_cleanup_common(NetClientState *nc)
>      >      > +{
>      >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc,
>     nc);
>      >      > +    dispatch_semaphore_t if_stopped_sem;
>      >      > +
>      >      > +    if (s->vmnet_if == NULL) {
>      >      > +        return;
>      >      > +    }
>      >      > +
>      >      > +    vmnet_interface_set_event_callback(
>      >      > +        s->vmnet_if,
>      >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
>      >      > +        NULL,
>      >      > +        NULL);
>      >
>      >     I don't think this vmnet_interface_set_event_callback call is
>     necessary.
>      >
>      >
>      > I kept in mind that vmnet processing lives in a separate thread
>      > and while cleanup it may continue receiving packets. While the
>      > queue is not empty, vmnet_stop_interface hangs. Unregistering
>      > callback ensures that this queue will be emptied asap.
>      >
>      > It will work without vmnet_interface_set_event_callback here,
>      > but I think it's better to be respectful to vmnet and clean
>     everything
>      > we can :)
> 
>     You may put qemu_purge_queued_packets after vmnet_stop_interface if you
>     think about the case it keeps receving packets while cleaning up since
>     it is the only thing it does before calling vmnet_stop_interface.
>     vmnet_stop_interface would then stop things in the proper order. It may
>     decide to stop event callbacks first. Otherwise, it may decide to stop
>     some internal heavy functionality first. It is up to vmnet.framework.
> 
>     Regards,
>     Akihiko Odaki
> 
>      > Thank you!
>      >
>      > Best Regards,
>      >
>      > Vladislav
>      >
>      >      > +
>      >      > +    qemu_purge_queued_packets(nc);
>      >      > +
>      >      > +    if_stopped_sem = dispatch_semaphore_create(0);
>      >      > +    vmnet_stop_interface(
>      >      > +        s->vmnet_if,
>      >      > +        s->if_queue,
>      >      > +        ^(vmnet_return_t status) {
>      >      > +            assert(status == VMNET_SUCCESS);
>      >      > +            dispatch_semaphore_signal(if_stopped_sem);
>      >      > +        });
>      >      > +    dispatch_semaphore_wait(if_stopped_sem,
>     DISPATCH_TIME_FOREVER);
>      >      > +
>      >      > +    qemu_bh_delete(s->send_bh);
>      >      > +    dispatch_release(if_stopped_sem);
>      >      > +    dispatch_release(s->if_queue);
>      >      > +
>      >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      >      > +        g_free(s->iov_buf[i].iov_base);
>      >      > +    }
>      >      > +}
>      >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>      >      > index f07afaaf21..2f4eb1db2d 100644
>      >      > --- a/net/vmnet-shared.c
>      >      > +++ b/net/vmnet-shared.c
>      >      > @@ -10,16 +10,103 @@
>      >      >
>      >      >   #include "qemu/osdep.h"
>      >      >   #include "qapi/qapi-types-net.h"
>      >      > +#include "qapi/error.h"
>      >      >   #include "vmnet_int.h"
>      >      >   #include "clients.h"
>      >      > -#include "qemu/error-report.h"
>      >      > -#include "qapi/error.h"
>      >      >
>      >      >   #include <vmnet/vmnet.h>
>      >      >
>      >      > +typedef struct VmnetSharedState {
>      >      > +    VmnetCommonState cs;
>      >      > +} VmnetSharedState;
>      >      > +
>      >      > +
>      >      > +static bool validate_options(const Netdev *netdev, Error
>     **errp)
>      >      > +{
>      >      > +    const NetdevVmnetSharedOptions *options =
>      >     &(netdev->u.vmnet_shared);
>      >      > +
>      >      > +#if !defined(MAC_OS_VERSION_11_0) || \
>      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
>      >      > +    if (options->has_isolated) {
>      >      > +        error_setg(errp,
>      >      > +                   "vmnet-shared.isolated feature is "
>      >      > +                   "unavailable: outdated vmnet.framework
>     API");
>      >      > +        return false;
>      >      > +    }
>      >      > +#endif
>      >      > +
>      >      > +    if ((options->has_start_address ||
>      >      > +         options->has_end_address ||
>      >      > +         options->has_subnet_mask) &&
>      >      > +        !(options->has_start_address &&
>      >      > +          options->has_end_address &&
>      >      > +          options->has_subnet_mask)) {
>      >      > +        error_setg(errp,
>      >      > +                   "'start-address', 'end-address',
>     'subnet-mask' "
>      >      > +                   "should be provided together"
>      >      > +        );
>      >      > +        return false;
>      >      > +    }
>      >      > +
>      >      > +    return true;
>      >      > +}
>      >      > +
>      >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
>      >      > +{
>      >      > +    const NetdevVmnetSharedOptions *options =
>      >     &(netdev->u.vmnet_shared);
>      >      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL,
>     NULL, 0);
>      >      > +
>      >      > +    xpc_dictionary_set_uint64(
>      >      > +        if_desc,
>      >      > +        vmnet_operation_mode_key,
>      >      > +        VMNET_SHARED_MODE
>      >      > +    );
>      >      > +
>      >      > +    if (options->has_nat66_prefix) {
>      >      > +        xpc_dictionary_set_string(if_desc,
>      >      > +                                  vmnet_nat66_prefix_key,
>      >      > +                                  options->nat66_prefix);
>      >      > +    }
>      >      > +
>      >      > +    if (options->has_start_address) {
>      >      > +        xpc_dictionary_set_string(if_desc,
>      >      > +                                  vmnet_start_address_key,
>      >      > +                                  options->start_address);
>      >      > +        xpc_dictionary_set_string(if_desc,
>      >      > +                                  vmnet_end_address_key,
>      >      > +                                  options->end_address);
>      >      > +        xpc_dictionary_set_string(if_desc,
>      >      > +                                  vmnet_subnet_mask_key,
>      >      > +                                  options->subnet_mask);
>      >      > +    }
>      >      > +
>      >      > +#if defined(MAC_OS_VERSION_11_0) && \
>      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      >      > +    xpc_dictionary_set_bool(
>      >      > +        if_desc,
>      >      > +        vmnet_enable_isolation_key,
>      >      > +        options->isolated
>      >      > +    );
>      >      > +#endif
>      >      > +
>      >      > +    return if_desc;
>      >      > +}
>      >      > +
>      >      > +static NetClientInfo net_vmnet_shared_info = {
>      >      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
>      >      > +    .size = sizeof(VmnetSharedState),
>      >      > +    .receive = vmnet_receive_common,
>      >      > +    .cleanup = vmnet_cleanup_common,
>      >      > +};
>      >      > +
>      >      >   int net_init_vmnet_shared(const Netdev *netdev, const
>     char *name,
>      >      >                             NetClientState *peer, Error
>     **errp)
>      >      >   {
>      >      > -  error_setg(errp, "vmnet-shared is not implemented yet");
>      >      > -  return -1;
>      >      > +    NetClientState *nc =
>     qemu_new_net_client(&net_vmnet_shared_info,
>      >      > +                                             peer,
>      >     "vmnet-shared", name);
>      >      > +    if (!validate_options(netdev, errp)) {
>      >      > +        g_assert_not_reached();
>      >      > +        return -1;
>      >      > +    }
>      >      > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
>      >      >   }
>      >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>      >      > index aac4d5af64..8f3321ef3e 100644
>      >      > --- a/net/vmnet_int.h
>      >      > +++ b/net/vmnet_int.h
>      >      > @@ -15,11 +15,50 @@
>      >      >   #include "clients.h"
>      >      >
>      >      >   #include <vmnet/vmnet.h>
>      >      > +#include <dispatch/dispatch.h>
>      >      > +
>      >      > +/**
>      >      > + *  From vmnet.framework documentation
>      >      > + *
>      >      > + *  Each read/write call allows up to 200 packets to be
>      >      > + *  read or written for a maximum of 256KB.
>      >      > + *
>      >      > + *  Each packet written should be a complete
>      >      > + *  ethernet frame.
>      >      > + *
>      >      > + * https://developer.apple.com/documentation/vmnet
>     <https://developer.apple.com/documentation/vmnet>
>      >     <https://developer.apple.com/documentation/vmnet
>     <https://developer.apple.com/documentation/vmnet>>
>      >      > + */
>      >      > +#define VMNET_PACKETS_LIMIT 200
>      >      >
>      >      >   typedef struct VmnetCommonState {
>      >      > -  NetClientState nc;
>      >      > +    NetClientState nc;
>      >      > +    interface_ref vmnet_if;
>      >      > +
>      >      > +    uint64_t mtu;
>      >      > +    uint64_t max_packet_size;
>      >      >
>      >      > +    dispatch_queue_t if_queue;
>      >      > +
>      >      > +    QEMUBH *send_bh;
>      >      > +    bool send_enabled;
>      >      > +
>      >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
>      >      > +    int packets_send_current_pos;
>      >      > +    int packets_send_end_pos;
>      >      > +
>      >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
>      >      >   } VmnetCommonState;
>      >      >
>      >      > +const char *vmnet_status_map_str(vmnet_return_t status);
>      >      > +
>      >      > +int vmnet_if_create(NetClientState *nc,
>      >      > +                    xpc_object_t if_desc,
>      >      > +                    Error **errp);
>      >      > +
>      >      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      >      > +                             const uint8_t *buf,
>      >      > +                             size_t size);
>      >      > +
>      >      > +void vmnet_cleanup_common(NetClientState *nc);
>      >      >
>      >      >   #endif /* VMNET_INT_H */
>      >
> 


