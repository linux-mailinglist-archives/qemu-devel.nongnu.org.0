Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33F4DA1B5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:57:28 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBQF-0005gG-Ph
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:57:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUBNT-0003LA-2p
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:54:35 -0400
Received: from [2607:f8b0:4864:20::432] (port=42907
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUBNQ-0006Zz-7V
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:54:34 -0400
Received: by mail-pf1-x432.google.com with SMTP id g19so158606pfc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c+bT/bNMTdU5k9gRiaZI3x92kc3KPbGnGCnu2+D4nmU=;
 b=X4WCAwOgEABs1oprVyc6utygE9Uwa+p9Se5hqMwe8czIov5cAsyTyCoQ87yhWcNuxr
 0CYLzpJYipu76SLM/F+femeTXdJmmWmFgIf9yHchNIZYFKhXkw8+ZhrUBugcugDQBzEG
 9g2IEd6Iv+cLjcyCYiBSj4FT801aTevVR77nSauUmYlMya+pvYtmModAyWhUKaRRpGC6
 p1/YWH8jq3n/bjYuzoJ4uLLpjSzERHLZs+/hdAaY4AkR+q5pBW7rXFTaPRUpe6rs8d+9
 CVkwkloUGcrN/BxIOhzN5BBqzioUpTLyPKTG1x2sy5XeA/FesPddPVwnEP6DrVCrdCx5
 NjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c+bT/bNMTdU5k9gRiaZI3x92kc3KPbGnGCnu2+D4nmU=;
 b=23/hRajtpd3sRN8Rcluhfq09MRT2+VHF/ObFs1NdAiBwWMRJo1vnjs9BU7zSZ9i59f
 wbPfw2dGnskb1a2d0nR2mbpPSvE9bvPMjco6mwZZZY9NCazVSsxkEPxPKhgcmemDKit3
 XNgZleiFwftRBEmhJYsFhdXzqZFCUlSYEUrV14dFqW/9S6qxS0dFou58kdx9UvQzklEP
 cwnITBlIXS2PAI+4wDN7o2LMiZyykVYPl85POkjDl7e38vLbwm5W1hd+uME5edPjvukd
 eDd6rFm73UXObehEJbrxZ/32dZrw3E7WxsQzABHNiWgRHC66mpSK8S3ekwi4vG+f0KyW
 avgw==
X-Gm-Message-State: AOAM531afheUtDqtuVpPKIhEQgMyWgPXCvut0DTGp34XS58uPdeuh+LS
 jdyKuo27/zrthUtbYxlpZtE=
X-Google-Smtp-Source: ABdhPJx1jVL50QV+Yp/UVgAT3WqZ/8gQqV0vrfLoBHgBnLvSx/y0ybiNq8079qtJdQKi4GozHTvBVg==
X-Received: by 2002:a62:de82:0:b0:4f7:86e1:869c with SMTP id
 h124-20020a62de82000000b004f786e1869cmr24743889pfg.13.1647366870419; 
 Tue, 15 Mar 2022 10:54:30 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 d27-20020a63735b000000b003813c1e4a52sm6852412pgn.33.2022.03.15.10.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:54:30 -0700 (PDT)
Message-ID: <4b421da4-c5a7-b391-be14-8f38cb866256@gmail.com>
Date: Wed, 16 Mar 2022 02:54:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v17 3/7] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
References: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315100239.2914-4-Vladislav.Yaroshchuk@jetbrains.com>
 <475cb18d-7c99-dea9-5a7b-59f72d7ed590@gmail.com>
 <CAGmdLqTCDocwbYAV1cScz6cuCOrFZ0PxpToFkxGhfkaXaCdF0Q@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAGmdLqTCDocwbYAV1cScz6cuCOrFZ0PxpToFkxGhfkaXaCdF0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
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

On 2022/03/16 2:45, Vladislav Yaroshchuk wrote:
> 
> 
> On Tue, Mar 15, 2022 at 1:18 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/15 19:02, Vladislav Yaroshchuk wrote:
>      > Interaction with vmnet.framework in different modes
>      > differs only on configuration stage, so we can create
>      > common `send`, `receive`, etc. procedures and reuse them.
>      >
>      > Signed-off-by: Phillip Tennen <phillip@axleos.com
>     <mailto:phillip@axleos.com>>
>      > Signed-off-by: Vladislav Yaroshchuk
>     <Vladislav.Yaroshchuk@jetbrains.com
>     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>
>      > ---
>      >   net/vmnet-common.m | 359
>     +++++++++++++++++++++++++++++++++++++++++++++
>      >   net/vmnet-shared.c |  94 +++++++++++-
>      >   net/vmnet_int.h    |  41 +++++-
>      >   3 files changed, 489 insertions(+), 5 deletions(-)
>      >
>      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>      > index 56612c72ce..6af042406b 100644
>      > --- a/net/vmnet-common.m
>      > +++ b/net/vmnet-common.m
>      > @@ -10,6 +10,8 @@
>      >    */
>      >
>      >   #include "qemu/osdep.h"
>      > +#include "qemu/main-loop.h"
>      > +#include "qemu/log.h"
>      >   #include "qapi/qapi-types-net.h"
>      >   #include "vmnet_int.h"
>      >   #include "clients.h"
>      > @@ -17,4 +19,361 @@
>      >   #include "qapi/error.h"
>      >
>      >   #include <vmnet/vmnet.h>
>      > +#include <dispatch/dispatch.h>
>      >
>      > +
>      > +static void vmnet_send_completed(NetClientState *nc, ssize_t len);
>      > +
>      > +
>      > +const char *vmnet_status_map_str(vmnet_return_t status)
>      > +{
>      > +    switch (status) {
>      > +    case VMNET_SUCCESS:
>      > +        return "success";
>      > +    case VMNET_FAILURE:
>      > +        return "general failure (possibly not enough privileges)";
>      > +    case VMNET_MEM_FAILURE:
>      > +        return "memory allocation failure";
>      > +    case VMNET_INVALID_ARGUMENT:
>      > +        return "invalid argument specified";
>      > +    case VMNET_SETUP_INCOMPLETE:
>      > +        return "interface setup is not complete";
>      > +    case VMNET_INVALID_ACCESS:
>      > +        return "invalid access, permission denied";
>      > +    case VMNET_PACKET_TOO_BIG:
>      > +        return "packet size is larger than MTU";
>      > +    case VMNET_BUFFER_EXHAUSTED:
>      > +        return "buffers exhausted in kernel";
>      > +    case VMNET_TOO_MANY_PACKETS:
>      > +        return "packet count exceeds limit";
>      > +#if defined(MAC_OS_VERSION_11_0) && \
>      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      > +        case VMNET_SHARING_SERVICE_BUSY:
>      > +        return "conflict, sharing service is in use";
>      > +#endif
>      > +    default:
>      > +        return "unknown vmnet error";
>      > +    }
>      > +}
>      > +
>      > +/**
>      > + * Write packets from QEMU to vmnet interface.
>      > + *
>      > + * vmnet.framework supports iov, but writing more than
>      > + * one iov into vmnet interface fails with
>      > + * 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
>      > + * one and passing it to vmnet works fine. That's the
>      > + * reason why receive_iov() left unimplemented. But it still
>      > + * works with good performance having .receive() only.
>      > + */
>      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      > +                             const uint8_t *buf,
>      > +                             size_t size)
>      > +{
>      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
>      > +    struct vmpktdesc packet;
>      > +    struct iovec iov;
>      > +    int pkt_cnt;
>      > +    vmnet_return_t if_status;
>      > +
>      > +    if (size > s->max_packet_size) {
>      > +        warn_report("vmnet: packet is too big, %zu > %" PRIu64,
>      > +            packet.vm_pkt_size,
>      > +            s->max_packet_size);
>      > +        return -1;
>      > +    }
>      > +
>      > +    iov.iov_base = (char *) buf;
>      > +    iov.iov_len = size;
>      > +
>      > +    packet.vm_pkt_iovcnt = 1;
>      > +    packet.vm_flags = 0;
>      > +    packet.vm_pkt_size = size;
>      > +    packet.vm_pkt_iov = &iov;
>      > +    pkt_cnt = 1;
>      > +
>      > +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
>      > +    if (if_status != VMNET_SUCCESS) {
>      > +        error_report("vmnet: write error: %s\n",
>      > +                     vmnet_status_map_str(if_status));
>      > +        return -1;
>      > +    }
>      > +
>      > +    if (pkt_cnt) {
>      > +        return size;
>      > +    }
>      > +    return 0;
>      > +}
>      > +
>      > +/**
>      > + * Read packets from vmnet interface and write them
>      > + * to temporary buffers in VmnetCommonState.
>      > + *
>      > + * Returns read packets number (may be 0) if read
>      > + * is successful, -1 on error
>      > + */
>      > +static int vmnet_read_packets(VmnetCommonState *s) {
>      > +    assert(s->packets_send_current_pos == s->packets_send_end_pos);
>      > +
>      > +    struct vmpktdesc *packets = s->packets_buf;
>      > +    vmnet_return_t status;
>      > +    int i;
>      > +
>      > +    /* Read as many packets as present */
>      > +    s->packets_send_current_pos = 0;
>      > +    s->packets_send_end_pos = VMNET_PACKETS_LIMIT;
>      > +    for (i = 0; i < s->packets_send_end_pos; ++i) {
>      > +        packets[i].vm_pkt_size = s->max_packet_size;
>      > +        packets[i].vm_pkt_iovcnt = 1;
>      > +        packets[i].vm_flags = 0;
>      > +    }
>      > +
>      > +    status = vmnet_read(s->vmnet_if, packets,
>     &s->packets_send_end_pos);
>      > +    if (status != VMNET_SUCCESS) {
>      > +        error_printf("vmnet: read failed: %s\n",
>      > +                     vmnet_status_map_str(status));
>      > +        s->packets_send_current_pos = 0;
>      > +        s->packets_send_end_pos = 0;
>      > +        return -1;
>      > +    }
>      > +
>      > +    return s->packets_send_end_pos;
>      > +}
>      > +
>      > +/**
>      > + * Write packets from temporary buffers in VmnetCommonState
>      > + * to QEMU.
>      > + */
>      > +static void vmnet_write_packets_to_qemu(VmnetCommonState *s) {
>      > +    ssize_t size;
>      > +
>      > +    /*
>      > +     * Packets to send lay in [current_pos..end_pos)
>      > +     * (including current_pos, excluding end_pos)
>      > +     */
>      > +    while (s->packets_send_current_pos < s->packets_send_end_pos) {
>      > +        size = qemu_send_packet_async(&s->nc,
>      > +                                     
>     s->iov_buf[s->packets_send_current_pos].iov_base,
>      > +                                     
>     s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
>      > +                                      vmnet_send_completed);
>      > +        ++s->packets_send_current_pos;
>      > +        if (size == 0) {
>      > +            /* QEMU is not ready to consume more packets -
>      > +             * stop and wait for completion callback call */
>      > +            s->send_enabled = false;
>      > +            return;
>      > +        }
>      > +    }
>      > +    s->send_enabled = true;
>      > +}
>      > +
>      > +
>      > +/**
>      > + * Bottom half callback that transfers packets from vmnet interface
>      > + * to QEMU.
>      > + *
>      > + * The process of transferring packets is three-staged:
>      > + * 1. Handle vmnet event;
>      > + * 2. Read packets from vmnet interface into temporary buffer;
>      > + * 3. Write packets from temporary buffer to QEMU.
>      > + *
>      > + * QEMU may suspend this process on the last stage, returning 0 from
>      > + * qemu_send_packet_async function. If this happens, we should
>      > + * respectfully wait until it is ready to consume more packets,
>      > + * write left ones in temporary buffer and only after this
>      > + * continue reading more packets from vmnet interface.
>      > + *
>      > + * If QEMU is not ready, send_enabled is set to false.
>      > + *
>      > + * Packets to be transferred are stored into packets_buf,
>      > + * in the window [packets_send_current_pos..packets_send_end_pos)
>      > + * including current_pos, excluding end_pos.
>      > + */
>      > +static void vmnet_send_bh(void *opaque)
>      > +{
>      > +    NetClientState *nc = (NetClientState *) opaque;
>      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
>      > +
>      > +    /*
>      > +     * Do nothing if QEMU is not ready - wait
>      > +     * for completion callback invocation
>      > +     */
>      > +    if (!s->send_enabled) {
>      > +        return;
>      > +    }
>      > +
>      > +    /* Read packets from vmnet interface */
>      > +    if (vmnet_read_packets(s) > 0) {
>      > +        /* Send them to QEMU */
>      > +        vmnet_write_packets_to_qemu(s);
>      > +    }
>      > +}
>      > +
>      > +/**
>      > + * Completion callback to be invoked by QEMU when it becomes
>      > + * ready to consume more packets.
>      > + */
>      > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
>      > +{
>      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
>      > +
>      > +    /* Complete sending packets left in VmnetCommonState buffers */
>      > +    vmnet_write_packets_to_qemu(s);
>      > +
>      > +    /* And read new ones from vmnet interface */
>      > +    if (s->send_enabled) {
>      > +        qemu_bh_schedule(s->send_bh);
>      > +    }
>      > +}
>      > +
>      > +static void vmnet_bufs_init(VmnetCommonState *s)
>      > +{
>      > +    struct vmpktdesc *packets = s->packets_buf;
>      > +    struct iovec *iov = s->iov_buf;
>      > +    int i;
>      > +
>      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      > +        iov[i].iov_len = s->max_packet_size;
>      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
>      > +        packets[i].vm_pkt_iov = iov + i;
>      > +    }
>      > +}
>      > +
>      > +
>      > +int vmnet_if_create(NetClientState *nc,
>      > +                    xpc_object_t if_desc,
>      > +                    Error **errp)
>      > +{
>      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
>      > +    dispatch_semaphore_t if_created_sem =
>     dispatch_semaphore_create(0);
>      > +    __block vmnet_return_t if_status;
>      > +
>      > +    s->if_queue = dispatch_queue_create(
>      > +        "org.qemu.vmnet.if_queue",
>      > +        DISPATCH_QUEUE_SERIAL
>      > +    );
>      > +
>      > +    xpc_dictionary_set_bool(
>      > +        if_desc,
>      > +        vmnet_allocate_mac_address_key,
>      > +        false
>      > +    );
>      > +
>      > +#ifdef DEBUG
>      > +    qemu_log("vmnet.start.interface_desc:\n");
>      > +    xpc_dictionary_apply(if_desc,
>      > +                         ^bool(const char *k, xpc_object_t v) {
>      > +                             char *desc = xpc_copy_description(v);
>      > +                             qemu_log("  %s=%s\n", k, desc);
>      > +                             free(desc);
>      > +                             return true;
>      > +                         });
>      > +#endif /* DEBUG */
>      > +
>      > +    s->vmnet_if = vmnet_start_interface(
>      > +        if_desc,
>      > +        s->if_queue,
>      > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
>      > +            if_status = status;
>      > +            if (status != VMNET_SUCCESS || !interface_param) {
>      > +                dispatch_semaphore_signal(if_created_sem);
>      > +                return;
>      > +            }
>      > +
>      > +#ifdef DEBUG
>      > +            qemu_log("vmnet.start.interface_param:\n");
>      > +            xpc_dictionary_apply(interface_param,
>      > +                                 ^bool(const char *k,
>     xpc_object_t v) {
>      > +                                     char *desc =
>     xpc_copy_description(v);
>      > +                                     qemu_log("  %s=%s\n", k, desc);
>      > +                                     free(desc);
>      > +                                     return true;
>      > +                                 });
>      > +#endif /* DEBUG */
>      > +
>      > +            s->mtu = xpc_dictionary_get_uint64(
>      > +                interface_param,
>      > +                vmnet_mtu_key);
>      > +            s->max_packet_size = xpc_dictionary_get_uint64(
>      > +                interface_param,
>      > +                vmnet_max_packet_size_key);
>      > +
>      > +            dispatch_semaphore_signal(if_created_sem);
>      > +        });
>      > +
>      > +    if (s->vmnet_if == NULL) {
>      > +        dispatch_release(s->if_queue);
>      > +        dispatch_release(if_created_sem);
>      > +        error_setg(errp,
>      > +                   "unable to create interface with requested
>     params");
>      > +        return -1;
>      > +    }
>      > +
>      > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
>      > +    dispatch_release(if_created_sem);
>      > +
>      > +    if (if_status != VMNET_SUCCESS) {
>      > +        dispatch_release(s->if_queue);
>      > +        error_setg(errp,
>      > +                   "cannot create vmnet interface: %s",
>      > +                   vmnet_status_map_str(if_status));
>      > +        return -1;
>      > +    }
>      > +
>      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
>     vmnet_send_bh, nc);
>      > +    s->send_enabled = true;
>      > +    vmnet_bufs_init(s);
>      > +
>      > +    vmnet_interface_set_event_callback(
>      > +        s->vmnet_if,
>      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
>      > +        s->if_queue,
>      > +        ^(interface_event_t event_id, xpc_object_t event) {
>      > +            assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
>      > +            /*
>      > +             * This function is being called from a non qemu
>     thread, so
>      > +             * we only schedule a BH, and do the rest of the io
>     completion
>      > +             * handling from vmnet_send_bh() which runs in a
>     qemu context.
>      > +             */
>      > +            qemu_bh_schedule(s->send_bh);
>      > +        });
>      > +
>      > +    return 0;
>      > +}
>      > +
>      > +
>      > +void vmnet_cleanup_common(NetClientState *nc)
>      > +{
>      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
>      > +    dispatch_semaphore_t if_stopped_sem;
>      > +
>      > +    if (s->vmnet_if == NULL) {
>      > +        return;
>      > +    }
>      > +
>      > +    vmnet_interface_set_event_callback(
>      > +        s->vmnet_if,
>      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
>      > +        NULL,
>      > +        NULL);
> 
>     As I stated in an earlier comment, it should not call
>     vmnet_interface_set_event_callback and instead let vmnet.framework
>     decide the proper order of deinitialization as it should know the
>     internals. If you are concerned with the case it receives packets while
>     calling qemu_purge_queued_packets(nc), the call can be moved after
>     vmnet_stop_interface.
> 
> 
> Ok, I will update this part.
> 
>      > +
>      > +    qemu_purge_queued_packets(nc);
>      > +
>      > +    if_stopped_sem = dispatch_semaphore_create(0);
>      > +    vmnet_stop_interface(
>      > +        s->vmnet_if,
>      > +        s->if_queue,
>      > +        ^(vmnet_return_t status) {
>      > +            assert(status == VMNET_SUCCESS);
>      > +            dispatch_semaphore_signal(if_stopped_sem);
>      > +        });
>      > +    dispatch_semaphore_wait(if_stopped_sem, DISPATCH_TIME_FOREVER);
>      > +
>      > +    qemu_bh_delete(s->send_bh);
>      > +    dispatch_release(if_stopped_sem);
>      > +    dispatch_release(s->if_queue);
>      > +
>      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      > +        g_free(s->iov_buf[i].iov_base);
>      > +    }
>      > +}
>      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>      > index f07afaaf21..e1a7e30acb 100644
>      > --- a/net/vmnet-shared.c
>      > +++ b/net/vmnet-shared.c
>      > @@ -10,16 +10,102 @@
>      >
>      >   #include "qemu/osdep.h"
>      >   #include "qapi/qapi-types-net.h"
>      > +#include "qapi/error.h"
>      >   #include "vmnet_int.h"
>      >   #include "clients.h"
>      > -#include "qemu/error-report.h"
>      > -#include "qapi/error.h"
>      >
>      >   #include <vmnet/vmnet.h>
>      >
>      > +typedef struct VmnetSharedState {
>      > +    VmnetCommonState cs;
>      > +} VmnetSharedState;
>      > +
>      > +
>      > +static bool validate_options(const Netdev *netdev, Error **errp)
>      > +{
>      > +    const NetdevVmnetSharedOptions *options =
>     &(netdev->u.vmnet_shared);
>      > +
>      > +#if !defined(MAC_OS_VERSION_11_0) || \
>      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
>      > +    if (options->has_isolated) {
>      > +        error_setg(errp,
>      > +                   "vmnet-shared.isolated feature is "
>      > +                   "unavailable: outdated vmnet.framework API");
>      > +        return false;
>      > +    }
>      > +#endif
>      > +
>      > +    if ((options->has_start_address ||
>      > +         options->has_end_address ||
>      > +         options->has_subnet_mask) &&
>      > +        !(options->has_start_address &&
>      > +          options->has_end_address &&
>      > +          options->has_subnet_mask)) {
>      > +        error_setg(errp,
>      > +                   "'start-address', 'end-address', 'subnet-mask' "
>      > +                   "should be provided together"
>      > +        );
>      > +        return false;
>      > +    }
>      > +
>      > +    return true;
>      > +}
>      > +
>      > +static xpc_object_t build_if_desc(const Netdev *netdev)
>      > +{
>      > +    const NetdevVmnetSharedOptions *options =
>     &(netdev->u.vmnet_shared);
>      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
>      > +
>      > +    xpc_dictionary_set_uint64(
>      > +        if_desc,
>      > +        vmnet_operation_mode_key,
>      > +        VMNET_SHARED_MODE
>      > +    );
>      > +
>      > +    if (options->has_nat66_prefix) {
>      > +        xpc_dictionary_set_string(if_desc,
>      > +                                  vmnet_nat66_prefix_key,
>      > +                                  options->nat66_prefix);
>      > +    }
>      > +
>      > +    if (options->has_start_address) {
>      > +        xpc_dictionary_set_string(if_desc,
>      > +                                  vmnet_start_address_key,
>      > +                                  options->start_address);
>      > +        xpc_dictionary_set_string(if_desc,
>      > +                                  vmnet_end_address_key,
>      > +                                  options->end_address);
>      > +        xpc_dictionary_set_string(if_desc,
>      > +                                  vmnet_subnet_mask_key,
>      > +                                  options->subnet_mask);
>      > +    }
>      > +
>      > +#if defined(MAC_OS_VERSION_11_0) && \
>      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      > +    xpc_dictionary_set_bool(
>      > +        if_desc,
>      > +        vmnet_enable_isolation_key,
>      > +        options->isolated
>      > +    );
>      > +#endif
>      > +
>      > +    return if_desc;
>      > +}
>      > +
>      > +static NetClientInfo net_vmnet_shared_info = {
>      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
>      > +    .size = sizeof(VmnetSharedState),
>      > +    .receive = vmnet_receive_common,
>      > +    .cleanup = vmnet_cleanup_common,
>      > +};
>      > +
>      >   int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>      >                             NetClientState *peer, Error **errp)
>      >   {
>      > -  error_setg(errp, "vmnet-shared is not implemented yet");
>      > -  return -1;
>      > +    NetClientState *nc = qemu_new_net_client(&net_vmnet_shared_info,
>      > +                                             peer,
>     "vmnet-shared", name);
>      > +    if (!validate_options(netdev, errp)) {
>      > +        return -1;
>      > +    }
>      > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
>      >   }
>      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>      > index aac4d5af64..8f3321ef3e 100644
>      > --- a/net/vmnet_int.h
>      > +++ b/net/vmnet_int.h
>      > @@ -15,11 +15,50 @@
>      >   #include "clients.h"
>      >
>      >   #include <vmnet/vmnet.h>
>      > +#include <dispatch/dispatch.h>
>      > +
>      > +/**
>      > + *  From vmnet.framework documentation
>      > + *
>      > + *  Each read/write call allows up to 200 packets to be
>      > + *  read or written for a maximum of 256KB.
>      > + *
>      > + *  Each packet written should be a complete
>      > + *  ethernet frame.
>      > + *
>      > + * https://developer.apple.com/documentation/vmnet
>     <https://developer.apple.com/documentation/vmnet>
>      > + */
>      > +#define VMNET_PACKETS_LIMIT 200
>      >
>      >   typedef struct VmnetCommonState {
>      > -  NetClientState nc;
>      > +    NetClientState nc;
>      > +    interface_ref vmnet_if;
>      > +
>      > +    uint64_t mtu;
>      > +    uint64_t max_packet_size;
>      >
>      > +    dispatch_queue_t if_queue;
>      > +
>      > +    QEMUBH *send_bh;
>      > +    bool send_enabled;
> 
>     I'm still not convinced it is preferred to have send_enabled and
>     packets_send_current_pos not to point to the packet currently being
>     sent
>     when qemu_send_packet_async returns 0 either.
>     By incrementing packets_send_current_pos in vmnet_send_completed
>     instead
>     of immediately after calling qemu_send_packet_async, it can always
>     represent the position of the packet currently being sent. It would
>     also
>     allow to directly state the condition to enable sending in
>     vmnet_send_bh
>     without involving indirection with send_enabled.
> 
> 
>  > incrementing packets_send_current_pos in vmnet_send_completed
> 
> It is a wrong idea I think. QEMU calls callback only if previously
> qemu_send_packet_async returned 0. If the packet was sent
> immediately (returned value > 0), the callback won't be invoked.
> If not (0 is returned), the callback is expected to be called when
> QEMU is ready. So, the callback is not about "packet sent", but it is
> about "QEMU is ready now"

Let me properly describe the whole picture of the idea. (Sorry, I should 
already have done that.)
To always represent the position of the packet currently being sent, if 
qemu_send_packet_async returns 0, vmnet_send_bh will not increment 
packets_send_current_pos and vmnet_send_completed will instead. 
Otherwise, vmnet_send_bh will increment packets_send_current_pos. So it 
should be like:

vmnet_write_packets_to_qemu:
     while packets_send_current_pos < packets_end_current_pos:
         if qemu_send_packet_async() == 0:
             // The packet pointed by packets_send_current_pos is indeed
             // currently being sent. Don't increment it yet.
             break
          // Move the current source to the next packet.
          ++packets_send_current_pos

vmnet_send_completed:
     // Move the current source to the next packet.
     ++packets_send_current_pos

     vmnet_write_packets_to_qemu()
     qemu_bh_schedule(s->send_bh)

Regards,
Akihiko Odaki

> 
> A simple proof with some debug printing:
> 
> static void vmnet_write_packets_to_qemu(VmnetState *s) {
>      ssize_t size;
>      while (s->packets_send_current_pos < s->packets_send_end_pos) {
>          size = qemu_send_packet_async(&s->nc,
>                                        
> s->iov_buf[s->packets_send_current_pos].iov_base,
>                                        
> s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
>                                        vmnet_send_completed);
>          ++s->packets_send_current_pos;
>          if (size == 0) {
>              fprintf(stderr, "stop\n"); // (!)
>              s->send_enabled = false;
>              return;
>          }
>          fprintf(stderr, "ok\n"); // (!)
>      }
>      s->send_enabled = true;
> }
> 
> static void vmnet_send_completed(NetClientState *nc, ssize_t len) {
>      fprintf(stderr, "continue\n"); // (!)
>      VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
>      vmnet_write_packets_to_qemu(s);
>      if (s->send_enabled) {
>          qemu_bh_schedule(s->send_bh);
>      }
> }
> 
> And the result (while both iperf3 + ping flood):
> ok
> ok
> ok
> ok
> ok
> ok
> ok
> stop
> continue
> ok
> ok
> ok
> stop
> continue
> stop
> continue
> stop
> continue
> ok
> ok
> ok
> stop
> continue
> 
> As you can see, if the packet is sent immediately (ok),
> the callback is not invoked. If 0 is returned (stop),
> the callback is invoked (continue) when QEMU is ready.
> 
> Taking this into account, I don't see any way to get rid
> of the send_enabled flag without making implementation
> more complex.
> 
> Best regards,
> Vladislav Yaroshchuk
> 
>     Regards,
>     Akihiko Odaki
> 
>      > +
>      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
>      > +    int packets_send_current_pos;
>      > +    int packets_send_end_pos;
>      > +
>      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
>      >   } VmnetCommonState;
>      >
>      > +const char *vmnet_status_map_str(vmnet_return_t status);
>      > +
>      > +int vmnet_if_create(NetClientState *nc,
>      > +                    xpc_object_t if_desc,
>      > +                    Error **errp);
>      > +
>      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      > +                             const uint8_t *buf,
>      > +                             size_t size);
>      > +
>      > +void vmnet_cleanup_common(NetClientState *nc);
>      >
>      >   #endif /* VMNET_INT_H */
> 


