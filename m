Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A839C4DA344
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 20:28:15 +0100 (CET)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCq6-0000a6-Pe
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 15:28:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUCli-0004Oj-5e
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:23:43 -0400
Received: from [2607:f8b0:4864:20::b34] (port=42972
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUCld-0004EQ-GK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:23:41 -0400
Received: by mail-yb1-xb34.google.com with SMTP id u103so419437ybi.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6w3OQ9Yunyn+/ZF3TpVdG4ppP/vXR60YkFJ1HjpwNkM=;
 b=QNBRmCPSBfrgyyu4B/3p6Z+GsE1AjO9FGgM4Qo5veVFWK3RVQz7rzQDu+3kKhNzWk9
 ONEZigxCTAMm/v3l93FgHZQ5c8BnZnrq6WOzizCp4dvLSRI/bOJUk74rf3anNtzQNdRM
 AdRcYtGn02lOkwdszuU33FPzzJhg4f5CnRJfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6w3OQ9Yunyn+/ZF3TpVdG4ppP/vXR60YkFJ1HjpwNkM=;
 b=Y45vRQ+SisiYDAea+FtVoIUw6BX7m5AiqQWjUNMTp4HvUB0y81I22IUHZKs5h0m9b5
 cuFoIQPLzKyeYXOVbmZBZWdvRY0sNY9xd6zEBC2f0HUcqon7rnhm7AOvjiOlw40X5st2
 gl24DXR/QVAxkEVshlOD1fjWEJ+AIc6tZwjFwtCaGweRGtH5kTBvWlKd4/l0CZ6CBam3
 lf9XXQp2JQiCExZv6l6O6TX0/5y1uuaiJxQ3I+KQwFCjWCurDpxwT7ZFvqyiPfJZlujX
 Rj+FFapKtmRwsEHrS/MajLondRdTX9TgkxW65+PHBISs6vjnSm9rvq2wAVCI2sL6EyfG
 hPyw==
X-Gm-Message-State: AOAM530k4cjrSuZxp/ja34tWnvMQvmL4Ughc+04G4VYHnR5kjikiwlKu
 IbtGz6Lve6tR8OveqYUvEteCO26BUyT5dtrJUMrsjQ==
X-Google-Smtp-Source: ABdhPJzhxnDPJAWUklikR7kMSirXP2C34GiU+ZSo/jmFPsywvPFvrj9wsu+5AbDgjVWRaVYywuNMC3OjyhscPxD5FAY=
X-Received: by 2002:a25:2609:0:b0:633:6b8f:84b9 with SMTP id
 m9-20020a252609000000b006336b8f84b9mr7649563ybm.114.1647372214611; Tue, 15
 Mar 2022 12:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315100239.2914-4-Vladislav.Yaroshchuk@jetbrains.com>
 <475cb18d-7c99-dea9-5a7b-59f72d7ed590@gmail.com>
 <CAGmdLqTCDocwbYAV1cScz6cuCOrFZ0PxpToFkxGhfkaXaCdF0Q@mail.gmail.com>
 <4b421da4-c5a7-b391-be14-8f38cb866256@gmail.com>
In-Reply-To: <4b421da4-c5a7-b391-be14-8f38cb866256@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 15 Mar 2022 22:23:23 +0300
Message-ID: <CAGmdLqT9rhCFPfD7gByY2+T6iEhP_hMBPidtrhkdm=WqO3uQHQ@mail.gmail.com>
Subject: Re: [PATCH v17 3/7] net/vmnet: implement shared mode (vmnet-shared)
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
Content-Type: multipart/alternative; boundary="000000000000aa4d2f05da46bb72"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb34.google.com
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

--000000000000aa4d2f05da46bb72
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 15, 2022 at 8:54 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/16 2:45, Vladislav Yaroshchuk wrote:
> >
> >
> > On Tue, Mar 15, 2022 at 1:18 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/15 19:02, Vladislav Yaroshchuk wrote:
> >      > Interaction with vmnet.framework in different modes
> >      > differs only on configuration stage, so we can create
> >      > common `send`, `receive`, etc. procedures and reuse them.
> >      >
> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >     <mailto:phillip@axleos.com>>
> >      > Signed-off-by: Vladislav Yaroshchuk
> >     <Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>
> >      > ---
> >      >   net/vmnet-common.m | 359
> >     +++++++++++++++++++++++++++++++++++++++++++++
> >      >   net/vmnet-shared.c |  94 +++++++++++-
> >      >   net/vmnet_int.h    |  41 +++++-
> >      >   3 files changed, 489 insertions(+), 5 deletions(-)
> >      >
> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >      > index 56612c72ce..6af042406b 100644
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
> >      > @@ -17,4 +19,361 @@
> >      >   #include "qapi/error.h"
> >      >
> >      >   #include <vmnet/vmnet.h>
> >      > +#include <dispatch/dispatch.h>
> >      >
> >      > +
> >      > +static void vmnet_send_completed(NetClientState *nc, ssize_t
> len);
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
> >      > +        case VMNET_SHARING_SERVICE_BUSY:
> >      > +        return "conflict, sharing service is in use";
> >      > +#endif
> >      > +    default:
> >      > +        return "unknown vmnet error";
> >      > +    }
> >      > +}
> >      > +
> >      > +/**
> >      > + * Write packets from QEMU to vmnet interface.
> >      > + *
> >      > + * vmnet.framework supports iov, but writing more than
> >      > + * one iov into vmnet interface fails with
> >      > + * 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      > + * one and passing it to vmnet works fine. That's the
> >      > + * reason why receive_iov() left unimplemented. But it still
> >      > + * works with good performance having .receive() only.
> >      > + */
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
> >      > +        warn_report("vmnet: packet is too big, %zu > %" PRIu64,
> >      > +            packet.vm_pkt_size,
> >      > +            s->max_packet_size);
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
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    if (pkt_cnt) {
> >      > +        return size;
> >      > +    }
> >      > +    return 0;
> >      > +}
> >      > +
> >      > +/**
> >      > + * Read packets from vmnet interface and write them
> >      > + * to temporary buffers in VmnetCommonState.
> >      > + *
> >      > + * Returns read packets number (may be 0) if read
> >      > + * is successful, -1 on error
> >      > + */
> >      > +static int vmnet_read_packets(VmnetCommonState *s) {
> >      > +    assert(s->packets_send_current_pos ==
> s->packets_send_end_pos);
> >      > +
> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >      > +    vmnet_return_t status;
> >      > +    int i;
> >      > +
> >      > +    /* Read as many packets as present */
> >      > +    s->packets_send_current_pos = 0;
> >      > +    s->packets_send_end_pos = VMNET_PACKETS_LIMIT;
> >      > +    for (i = 0; i < s->packets_send_end_pos; ++i) {
> >      > +        packets[i].vm_pkt_size = s->max_packet_size;
> >      > +        packets[i].vm_pkt_iovcnt = 1;
> >      > +        packets[i].vm_flags = 0;
> >      > +    }
> >      > +
> >      > +    status = vmnet_read(s->vmnet_if, packets,
> >     &s->packets_send_end_pos);
> >      > +    if (status != VMNET_SUCCESS) {
> >      > +        error_printf("vmnet: read failed: %s\n",
> >      > +                     vmnet_status_map_str(status));
> >      > +        s->packets_send_current_pos = 0;
> >      > +        s->packets_send_end_pos = 0;
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    return s->packets_send_end_pos;
> >      > +}
> >      > +
> >      > +/**
> >      > + * Write packets from temporary buffers in VmnetCommonState
> >      > + * to QEMU.
> >      > + */
> >      > +static void vmnet_write_packets_to_qemu(VmnetCommonState *s) {
> >      > +    ssize_t size;
> >      > +
> >      > +    /*
> >      > +     * Packets to send lay in [current_pos..end_pos)
> >      > +     * (including current_pos, excluding end_pos)
> >      > +     */
> >      > +    while (s->packets_send_current_pos <
> s->packets_send_end_pos) {
> >      > +        size = qemu_send_packet_async(&s->nc,
> >      > +
> >     s->iov_buf[s->packets_send_current_pos].iov_base,
> >      > +
> >     s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
> >      > +                                      vmnet_send_completed);
> >      > +        ++s->packets_send_current_pos;
> >      > +        if (size == 0) {
> >      > +            /* QEMU is not ready to consume more packets -
> >      > +             * stop and wait for completion callback call */
> >      > +            s->send_enabled = false;
> >      > +            return;
> >      > +        }
> >      > +    }
> >      > +    s->send_enabled = true;
> >      > +}
> >      > +
> >      > +
> >      > +/**
> >      > + * Bottom half callback that transfers packets from vmnet
> interface
> >      > + * to QEMU.
> >      > + *
> >      > + * The process of transferring packets is three-staged:
> >      > + * 1. Handle vmnet event;
> >      > + * 2. Read packets from vmnet interface into temporary buffer;
> >      > + * 3. Write packets from temporary buffer to QEMU.
> >      > + *
> >      > + * QEMU may suspend this process on the last stage, returning 0
> from
> >      > + * qemu_send_packet_async function. If this happens, we should
> >      > + * respectfully wait until it is ready to consume more packets,
> >      > + * write left ones in temporary buffer and only after this
> >      > + * continue reading more packets from vmnet interface.
> >      > + *
> >      > + * If QEMU is not ready, send_enabled is set to false.
> >      > + *
> >      > + * Packets to be transferred are stored into packets_buf,
> >      > + * in the window [packets_send_current_pos..packets_send_end_pos)
> >      > + * including current_pos, excluding end_pos.
> >      > + */
> >      > +static void vmnet_send_bh(void *opaque)
> >      > +{
> >      > +    NetClientState *nc = (NetClientState *) opaque;
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +
> >      > +    /*
> >      > +     * Do nothing if QEMU is not ready - wait
> >      > +     * for completion callback invocation
> >      > +     */
> >      > +    if (!s->send_enabled) {
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    /* Read packets from vmnet interface */
> >      > +    if (vmnet_read_packets(s) > 0) {
> >      > +        /* Send them to QEMU */
> >      > +        vmnet_write_packets_to_qemu(s);
> >      > +    }
> >      > +}
> >      > +
> >      > +/**
> >      > + * Completion callback to be invoked by QEMU when it becomes
> >      > + * ready to consume more packets.
> >      > + */
> >      > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +
> >      > +    /* Complete sending packets left in VmnetCommonState buffers
> */
> >      > +    vmnet_write_packets_to_qemu(s);
> >      > +
> >      > +    /* And read new ones from vmnet interface */
> >      > +    if (s->send_enabled) {
> >      > +        qemu_bh_schedule(s->send_bh);
> >      > +    }
> >      > +}
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
> >      > +int vmnet_if_create(NetClientState *nc,
> >      > +                    xpc_object_t if_desc,
> >      > +                    Error **errp)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +    dispatch_semaphore_t if_created_sem =
> >     dispatch_semaphore_create(0);
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
> >      > +
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
> >      > +    if (if_status != VMNET_SUCCESS) {
> >      > +        dispatch_release(s->if_queue);
> >      > +        error_setg(errp,
> >      > +                   "cannot create vmnet interface: %s",
> >      > +                   vmnet_status_map_str(if_status));
> >      > +        return -1;
> >      > +    }
> >      > +
> >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
> >     vmnet_send_bh, nc);
> >      > +    s->send_enabled = true;
> >      > +    vmnet_bufs_init(s);
> >      > +
> >      > +    vmnet_interface_set_event_callback(
> >      > +        s->vmnet_if,
> >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +        s->if_queue,
> >      > +        ^(interface_event_t event_id, xpc_object_t event) {
> >      > +            assert(event_id ==
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
> >      > +void vmnet_cleanup_common(NetClientState *nc)
> >      > +{
> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> >      > +    dispatch_semaphore_t if_stopped_sem;
> >      > +
> >      > +    if (s->vmnet_if == NULL) {
> >      > +        return;
> >      > +    }
> >      > +
> >      > +    vmnet_interface_set_event_callback(
> >      > +        s->vmnet_if,
> >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      > +        NULL,
> >      > +        NULL);
> >
> >     As I stated in an earlier comment, it should not call
> >     vmnet_interface_set_event_callback and instead let vmnet.framework
> >     decide the proper order of deinitialization as it should know the
> >     internals. If you are concerned with the case it receives packets
> while
> >     calling qemu_purge_queued_packets(nc), the call can be moved after
> >     vmnet_stop_interface.
> >
> >
> > Ok, I will update this part.
> >
> >      > +
> >      > +    qemu_purge_queued_packets(nc);
> >      > +
> >      > +    if_stopped_sem = dispatch_semaphore_create(0);
> >      > +    vmnet_stop_interface(
> >      > +        s->vmnet_if,
> >      > +        s->if_queue,
> >      > +        ^(vmnet_return_t status) {
> >      > +            assert(status == VMNET_SUCCESS);
> >      > +            dispatch_semaphore_signal(if_stopped_sem);
> >      > +        });
> >      > +    dispatch_semaphore_wait(if_stopped_sem,
> DISPATCH_TIME_FOREVER);
> >      > +
> >      > +    qemu_bh_delete(s->send_bh);
> >      > +    dispatch_release(if_stopped_sem);
> >      > +    dispatch_release(s->if_queue);
> >      > +
> >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      > +        g_free(s->iov_buf[i].iov_base);
> >      > +    }
> >      > +}
> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >      > index f07afaaf21..e1a7e30acb 100644
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
> >
> >     I'm still not convinced it is preferred to have send_enabled and
> >     packets_send_current_pos not to point to the packet currently being
> >     sent
> >     when qemu_send_packet_async returns 0 either.
> >     By incrementing packets_send_current_pos in vmnet_send_completed
> >     instead
> >     of immediately after calling qemu_send_packet_async, it can always
> >     represent the position of the packet currently being sent. It would
> >     also
> >     allow to directly state the condition to enable sending in
> >     vmnet_send_bh
> >     without involving indirection with send_enabled.
> >
> >
> >  > incrementing packets_send_current_pos in vmnet_send_completed
> >
> > It is a wrong idea I think. QEMU calls callback only if previously
> > qemu_send_packet_async returned 0. If the packet was sent
> > immediately (returned value > 0), the callback won't be invoked.
> > If not (0 is returned), the callback is expected to be called when
> > QEMU is ready. So, the callback is not about "packet sent", but it is
> > about "QEMU is ready now"
>
> Let me properly describe the whole picture of the idea. (Sorry, I should
> already have done that.)
> To always represent the position of the packet currently being sent, if
> qemu_send_packet_async returns 0, vmnet_send_bh will not increment
> packets_send_current_pos and vmnet_send_completed will instead.
> Otherwise, vmnet_send_bh will increment packets_send_current_pos. So it
> should be like:
>
> vmnet_write_packets_to_qemu:
>      while packets_send_current_pos < packets_end_current_pos:
>          if qemu_send_packet_async() == 0:
>              // The packet pointed by packets_send_current_pos is indeed
>              // currently being sent. Don't increment it yet.
>              break
>           // Move the current source to the next packet.
>           ++packets_send_current_pos
>
> vmnet_send_completed:
>      // Move the current source to the next packet.
>      ++packets_send_current_pos
>
>      vmnet_write_packets_to_qemu()
>      qemu_bh_schedule(s->send_bh)
>
>
Now I understand what you mean, thank you!
Sending fixes within v17.

Best Regards,
Vladislav Yaroshchul.


> Regards,
> Akihiko Odaki
>
> >
> > A simple proof with some debug printing:
> >
> > static void vmnet_write_packets_to_qemu(VmnetState *s) {
> >      ssize_t size;
> >      while (s->packets_send_current_pos < s->packets_send_end_pos) {
> >          size = qemu_send_packet_async(&s->nc,
> >
> > s->iov_buf[s->packets_send_current_pos].iov_base,
> >
> > s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
> >                                        vmnet_send_completed);
> >          ++s->packets_send_current_pos;
> >          if (size == 0) {
> >              fprintf(stderr, "stop\n"); // (!)
> >              s->send_enabled = false;
> >              return;
> >          }
> >          fprintf(stderr, "ok\n"); // (!)
> >      }
> >      s->send_enabled = true;
> > }
> >
> > static void vmnet_send_completed(NetClientState *nc, ssize_t len) {
> >      fprintf(stderr, "continue\n"); // (!)
> >      VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
> >      vmnet_write_packets_to_qemu(s);
> >      if (s->send_enabled) {
> >          qemu_bh_schedule(s->send_bh);
> >      }
> > }
> >
> > And the result (while both iperf3 + ping flood):
> > ok
> > ok
> > ok
> > ok
> > ok
> > ok
> > ok
> > stop
> > continue
> > ok
> > ok
> > ok
> > stop
> > continue
> > stop
> > continue
> > stop
> > continue
> > ok
> > ok
> > ok
> > stop
> > continue
> >
> > As you can see, if the packet is sent immediately (ok),
> > the callback is not invoked. If 0 is returned (stop),
> > the callback is invoked (continue) when QEMU is ready.
> >
> > Taking this into account, I don't see any way to get rid
> > of the send_enabled flag without making implementation
> > more complex.
> >
> > Best regards,
> > Vladislav Yaroshchuk
> >
> >     Regards,
> >     Akihiko Odaki
> >
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

--000000000000aa4d2f05da46bb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 15, 2022 at 8:54 PM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">a=
kihiko.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 2022/03/16 2:45, Vladislav Yaroshchuk wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Mar 15, 2022 at 1:18 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/15 19:02, Vladislav Yaroshchuk wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Interaction with vmnet.framework in different=
 modes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; differs only on configuration stage, so we ca=
n create<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; common `send`, `receive`, etc. procedures and=
 reuse them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"=
mailto:phillip@axleos.com" target=3D"_blank">phillip@axleos.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:phillip@axleos.com" ta=
rget=3D"_blank">phillip@axleos.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Vladislav Yaroshchuk<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:Vladislav.Yaroshchuk@jetbrain=
s.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Vladislav.Yaroshchuk@j=
etbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.com</a>&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-common.m | 359<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=A0 94 +++=
++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =C2=A0 |=C2=
=A0 41 +++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A03 files changed, 489 insertions(+=
), 5 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/net/vmnet-common.m b/net/vmnet-c=
ommon.m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 56612c72ce..6af042406b 100644<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -17,4 +19,361 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_completed(NetClientSt=
ate *nc, ssize_t len);<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VMNET_SHARI=
NG_SERVICE_BUSY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;con=
flict, sharing service is in use&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unk=
nown vmnet error&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Write packets from QEMU to vmnet interfac=
e.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * vmnet.framework supports iov, but writing=
 more than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * one iov into vmnet interface fails with<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * &#39;VMNET_INVALID_ARGUMENT&#39;. Collect=
ing provided iovs into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * one and passing it to vmnet works fine. T=
hat&#39;s the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * reason why receive_iov() left unimplement=
ed. But it still<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * works with good performance having .recei=
ve() only.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa=
cket.vm_pkt_size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-=
&gt;max_packet_size);<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (pkt_cnt) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Read packets from vmnet interface and wri=
te them<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * to temporary buffers in VmnetCommonState.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Returns read packets number (may be 0) if=
 read<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * is successful, -1 on error<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static int vmnet_read_packets(VmnetCommonSta=
te *s) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 assert(s-&gt;packets_send_curr=
ent_pos =3D=3D s-&gt;packets_send_end_pos);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D =
s-&gt;packets_buf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_return_t status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 int i;<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return s-&gt;packets_send_end_=
pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Write packets from temporary buffers in V=
mnetCommonState<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * to QEMU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_write_packets_to_qemu(Vmne=
tCommonState *s) {<br>
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
 QEMU is not ready to consume more packets -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* stop and wait for completion callback call */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-=
&gt;send_enabled =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D true;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Bottom half callback that transfers packe=
ts from vmnet interface<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * to QEMU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * The process of transferring packets is th=
ree-staged:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * 1. Handle vmnet event;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * 2. Read packets from vmnet interface into=
 temporary buffer;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * 3. Write packets from temporary buffer to=
 QEMU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * QEMU may suspend this process on the last=
 stage, returning 0 from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * qemu_send_packet_async function. If this =
happens, we should<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * respectfully wait until it is ready to co=
nsume more packets,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * write left ones in temporary buffer and o=
nly after this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * continue reading more packets from vmnet =
interface.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * If QEMU is not ready, send_enabled is set=
 to false.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Packets to be transferred are stored into=
 packets_buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * in the window [packets_send_current_pos..=
packets_send_end_pos)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * including current_pos, excluding end_pos.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_bh(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 NetClientState *nc =3D (NetCli=
entState *) opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* Read packets from vmnet int=
erface */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (vmnet_read_packets(s) &gt;=
 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Send them to =
QEMU */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_write_pack=
ets_to_qemu(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * Completion callback to be invoked by QEMU=
 when it becomes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + * ready to consume more packets.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void vmnet_send_completed(NetClientSt=
ate *nc, ssize_t len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPC=
AST(VmnetCommonState, nc, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* Complete sending packets le=
ft in VmnetCommonState buffers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 vmnet_write_packets_to_qemu(s)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 /* And read new ones from vmne=
t interface */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (s-&gt;send_enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bh_schedule=
(s-&gt;send_bh);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0As I stated in an earlier comment, it should not ca=
ll<br>
&gt;=C2=A0 =C2=A0 =C2=A0vmnet_interface_set_event_callback and instead let =
vmnet.framework<br>
&gt;=C2=A0 =C2=A0 =C2=A0decide the proper order of deinitialization as it s=
hould know the<br>
&gt;=C2=A0 =C2=A0 =C2=A0internals. If you are concerned with the case it re=
ceives packets while<br>
&gt;=C2=A0 =C2=A0 =C2=A0calling qemu_purge_queued_packets(nc), the call can=
 be moved after<br>
&gt;=C2=A0 =C2=A0 =C2=A0vmnet_stop_interface.<br>
&gt; <br>
&gt; <br>
&gt; Ok, I will update this part.<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index f07afaaf21..e1a7e30acb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/net/vmnet-shared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/net/vmnet-shared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,16 +10,102 @@<br>
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
cumentation/vmnet" rel=3D"noreferrer" target=3D"_blank">https://developer.a=
pple.com/documentation/vmnet</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://developer.apple.com/document=
ation/vmnet" rel=3D"noreferrer" target=3D"_blank">https://developer.apple.c=
om/documentation/vmnet</a>&gt;<br>
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
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m still not convinced it is preferred to have=
 send_enabled and<br>
&gt;=C2=A0 =C2=A0 =C2=A0packets_send_current_pos not to point to the packet=
 currently being<br>
&gt;=C2=A0 =C2=A0 =C2=A0sent<br>
&gt;=C2=A0 =C2=A0 =C2=A0when qemu_send_packet_async returns 0 either.<br>
&gt;=C2=A0 =C2=A0 =C2=A0By incrementing packets_send_current_pos in vmnet_s=
end_completed<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0of immediately after calling qemu_send_packet_async=
, it can always<br>
&gt;=C2=A0 =C2=A0 =C2=A0represent the position of the packet currently bein=
g sent. It would<br>
&gt;=C2=A0 =C2=A0 =C2=A0also<br>
&gt;=C2=A0 =C2=A0 =C2=A0allow to directly state the condition to enable sen=
ding in<br>
&gt;=C2=A0 =C2=A0 =C2=A0vmnet_send_bh<br>
&gt;=C2=A0 =C2=A0 =C2=A0without involving indirection with send_enabled.<br=
>
&gt; <br>
&gt; <br>
&gt;=C2=A0 &gt; incrementing packets_send_current_pos in vmnet_send_complet=
ed<br>
&gt; <br>
&gt; It is a wrong idea I think. QEMU calls callback only if previously<br>
&gt; qemu_send_packet_async returned 0. If the packet was sent<br>
&gt; immediately=C2=A0(returned value &gt; 0), the callback won&#39;t be in=
voked.<br>
&gt; If not (0 is returned), the callback is expected to be called when<br>
&gt; QEMU is ready. So, the callback is not about &quot;packet sent&quot;, =
but it is<br>
&gt; about &quot;QEMU is ready now&quot;<br>
<br>
Let me properly describe the whole picture of the idea. (Sorry, I should <b=
r>
already have done that.)<br>
To always represent the position of the packet currently being sent, if <br=
>
qemu_send_packet_async returns 0, vmnet_send_bh will not increment <br>
packets_send_current_pos and vmnet_send_completed will instead. <br>
Otherwise, vmnet_send_bh will increment packets_send_current_pos. So it <br=
>
should be like:<br>
<br>
vmnet_write_packets_to_qemu:<br>
=C2=A0 =C2=A0 =C2=A0while packets_send_current_pos &lt; packets_end_current=
_pos:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if qemu_send_packet_async() =3D=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// The packet pointed by pa=
ckets_send_current_pos is indeed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// currently being sent. Do=
n&#39;t increment it yet.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Move the current source to the next p=
acket.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++packets_send_current_pos<br>
<br>
vmnet_send_completed:<br>
=C2=A0 =C2=A0 =C2=A0// Move the current source to the next packet.<br>
=C2=A0 =C2=A0 =C2=A0++packets_send_current_pos<br>
<br>
=C2=A0 =C2=A0 =C2=A0vmnet_write_packets_to_qemu()<br>
=C2=A0 =C2=A0 =C2=A0qemu_bh_schedule(s-&gt;send_bh)<br>
<br></blockquote><div><br></div><div>Now I understand what you mean, thank =
you!</div><div>Sending fixes within v17.</div><div><br></div><div>Best Rega=
rds,</div><div>Vladislav Yaroshchul.<br>=C2=A0=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; <br>
&gt; A simple proof with some debug printing:<br>
&gt; <br>
&gt; static void vmnet_write_packets_to_qemu(VmnetState *s) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 while (s-&gt;packets_send_current_pos &lt; s-&gt;p=
ackets_send_end_pos) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_send_packet_async(&amp=
;s-&gt;nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; s-&gt;iov_buf[s-&gt;packets_send_current_pos].iov_base,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; s-&gt;packets_buf[s-&gt;packets_send_current_pos].vm_pkt_size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet=
_send_completed);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++s-&gt;packets_send_current_pos;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=
stop\n&quot;); // (!)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;send_enabled =3D=
 false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;ok\n&quot;);=
=C2=A0// (!)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;send_enabled =3D true;<br>
&gt; }<br>
&gt; <br>
&gt; static void vmnet_send_completed(NetClientState *nc, ssize_t len) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;continue\n&quot;); // (!)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 VmnetState *s =3D DO_UPCAST(VmnetState, nc, nc);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 vmnet_write_packets_to_qemu(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (s-&gt;send_enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bh_schedule(s-&gt;send_bh);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; }<br>
&gt; <br>
&gt; And the result (while both iperf3 + ping flood):<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; stop<br>
&gt; continue<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; stop<br>
&gt; continue<br>
&gt; stop<br>
&gt; continue<br>
&gt; stop<br>
&gt; continue<br>
&gt; ok<br>
&gt; ok<br>
&gt; ok<br>
&gt; stop<br>
&gt; continue<br>
&gt; <br>
&gt; As you can see, if the packet is sent immediately (ok),<br>
&gt; the callback is not invoked. If 0 is returned (stop),<br>
&gt; the callback is invoked (continue) when QEMU is ready.<br>
&gt; <br>
&gt; Taking this into account, I don&#39;t see any way to get rid<br>
&gt; of the send_enabled flag without making implementation<br>
&gt; more complex.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Vladislav Yaroshchuk<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Akihiko Odaki<br>
&gt; <br>
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

--000000000000aa4d2f05da46bb72--

