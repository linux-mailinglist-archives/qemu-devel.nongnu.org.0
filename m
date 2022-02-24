Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A904C21E1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 03:53:04 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN4Fa-0003Ox-M1
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 21:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nN4EP-0002jU-Sj
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 21:51:49 -0500
Received: from [2a00:1450:4864:20::52b] (port=43862
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nN4EL-0006Au-8R
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 21:51:48 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m3so936225eda.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 18:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWtvaP7N7i1tFpG34JLV0cicPSWuVrXCIgRbbT85A1g=;
 b=AwN4y/1U9PEIPZD3ir6Zf0uzmq9aso13w5v4R9CdVHL+5PEa172SQxjBnagePf9yq8
 Bs7aJfPW8fORLx4gK9In0Byf87zxHds2Z0Ri4p3HvBJBVLWAJIFwh9iAAyoEBHwRGE+6
 G1xDcw202AxEw0FaSehHjcnLV9zuriu4KYHbwjIylwSJRrzOvQFwYtrQxlIzSnsdNDVk
 Q4Gtz0BZ71kt5pf+DVe2N7tcQtuU9aTNQsXgpeLvIaXiL/sfBlcTd+g8kVRrsjurzrFn
 rCIuSzrnYczyKnYxVo4fI6wvPthJ+GzhxI0vkZr1aToUEDD0PAUVEN3ciypCp3Rk5ptv
 tNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWtvaP7N7i1tFpG34JLV0cicPSWuVrXCIgRbbT85A1g=;
 b=V06qY8gpLmYpszVbrSeGQoTQiDyrg2k3hm8uSptm+3eei6BRap9JRlI0rXARq8H5CQ
 D6fKUlJcoZhgz2o3KIBCbKRyRGuJ4bk9y6QHAvCG6ycouRlzpwQw02gARzARL/h9rvyW
 2+RfquaD0MmcpF3zcI3iuGvduTzPGcV5OR1FNEwZnJtDb2/noN8VaLp3e3yIz1j9KWyu
 UIKTyNAu3SNvY0bLICtl4M1h1uEDdslduG+E4CuK6b6F0O5DDgduReVxYHyxBj6KW1/p
 IPZFg8BD+KEs5I0cuI/oy5+IJkn5KxGpBIHN53Mt87QAnrebWYntXbuCWVCdW4toOaKe
 6mBQ==
X-Gm-Message-State: AOAM531D0WGOOecAOm52ttPuXAsWz55aNZ+BqBzGd1BZQDl0aSal495+
 2ah1CcYBTF9b2nybANNSiGu/CNoBEQy4cMT1HfB9VC/+
X-Google-Smtp-Source: ABdhPJwjXbv1d721fHhxYS0L2ZCAvEuK+kYVI1gm5Qk84MYVF7V5mDS+i0zACXT96o3jzKg0G4OgGk6pCmiTlACpZVY=
X-Received: by 2002:aa7:cb09:0:b0:413:2be4:c9fa with SMTP id
 s9-20020aa7cb09000000b004132be4c9famr423185edt.106.1645671102307; Wed, 23 Feb
 2022 18:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-5-arilou@gmail.com>
In-Reply-To: <20220216102500.692781-5-arilou@gmail.com>
From: Jon Doron <arilou@gmail.com>
Date: Thu, 24 Feb 2022 04:51:31 +0200
Message-ID: <CAP7QCojtCNhMUk1cDYR_D=UhBg-2m9FaE7J_D0s6R-oY5+nKpA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw: hyperv: Initial commit for Synthetic Debugging
 device
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000785ee805d8baa95b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=arilou@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000785ee805d8baa95b
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Feb 16, 2022, 12:25 Jon Doron <arilou@gmail.com> wrote:

> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  hw/hyperv/Kconfig     |   5 +
>  hw/hyperv/meson.build |   1 +
>  hw/hyperv/syndbg.c    | 402 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 408 insertions(+)
>  create mode 100644 hw/hyperv/syndbg.c
>
> diff --git a/hw/hyperv/Kconfig b/hw/hyperv/Kconfig
> index 3fbfe41c9e..fcf65903bd 100644
> --- a/hw/hyperv/Kconfig
> +++ b/hw/hyperv/Kconfig
> @@ -11,3 +11,8 @@ config VMBUS
>      bool
>      default y
>      depends on HYPERV
> +
> +config SYNDBG
> +    bool
> +    default y
> +    depends on VMBUS
> diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
> index 1367e2994f..b43f119ea5 100644
> --- a/hw/hyperv/meson.build
> +++ b/hw/hyperv/meson.build
> @@ -1,3 +1,4 @@
>  specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
>  specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true:
> files('hyperv_testdev.c'))
>  specific_ss.add(when: 'CONFIG_VMBUS', if_true: files('vmbus.c'))
> +specific_ss.add(when: 'CONFIG_SYNDBG', if_true: files('syndbg.c'))
> diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
> new file mode 100644
> index 0000000000..8816bc4082
> --- /dev/null
> +++ b/hw/hyperv/syndbg.c
> @@ -0,0 +1,402 @@
> +/*
> + * QEMU Hyper-V Synthetic Debugging device
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/ctype.h"
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/sockets.h"
> +#include "qemu-common.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/loader.h"
> +#include "cpu.h"
> +#include "hw/hyperv/hyperv.h"
> +#include "hw/hyperv/vmbus-bridge.h"
> +#include "hw/hyperv/hyperv-proto.h"
> +#include "net/net.h"
> +#include "net/eth.h"
> +#include "net/checksum.h"
> +#include "trace.h"
> +
> +#define TYPE_HV_SYNDBG       "hv-syndbg"
> +
> +typedef struct HvSynDbg {
> +    DeviceState parent_obj;
> +
> +    char *host_ip;
> +    uint16_t host_port;
> +    bool use_hcalls;
> +
> +    uint32_t target_ip;
> +    struct sockaddr_in servaddr;
> +    int socket;
> +    bool has_data_pending;
> +    uint64_t pending_page_gpa;
> +} HvSynDbg;
> +
> +#define HVSYNDBG(obj) OBJECT_CHECK(HvSynDbg, (obj), TYPE_HV_SYNDBG)
> +
> +/* returns NULL unless there is exactly one HV Synth debug device */
> +static HvSynDbg *hv_syndbg_find(void)
> +{
> +    /* Returns NULL unless there is exactly one hvsd device */
> +    return HVSYNDBG(object_resolve_path_type("", TYPE_HV_SYNDBG, NULL));
> +}
> +
> +static void set_pending_state(HvSynDbg *syndbg, bool has_pending)
> +{
> +    hwaddr out_len;
> +    void *out_data;
> +
> +    syndbg->has_data_pending = has_pending;
> +
> +    if (!syndbg->pending_page_gpa) {
> +        return;
> +    }
> +
> +    out_len = 1;
> +    out_data = cpu_physical_memory_map(syndbg->pending_page_gpa,
> &out_len, 1);
> +    if (out_data) {
> +        *(uint8_t *)out_data = !!has_pending;
> +        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
> +    }
> +}
> +
> +static bool get_udb_pkt_data(void *p, uint32_t len, uint32_t *data_ofs,
> +                             uint32_t *src_ip)
> +{
> +    uint32_t offset, curr_len = len;
> +
> +    if (curr_len < sizeof(struct eth_header) ||
> +        (be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto) != ETH_P_IP)) {
> +        return false;
> +    }
> +    offset = sizeof(struct eth_header);
> +    curr_len -= sizeof(struct eth_header);
> +
> +    if (curr_len < sizeof(struct ip_header) ||
> +        PKT_GET_IP_HDR(p)->ip_p != IP_PROTO_UDP) {
> +        return false;
> +    }
> +    offset += PKT_GET_IP_HDR_LEN(p);
> +    curr_len -= PKT_GET_IP_HDR_LEN(p);
> +
> +    if (curr_len < sizeof(struct udp_header)) {
> +        return false;
> +    }
> +
> +    offset += sizeof(struct udp_header);
> +    *data_ofs = offset;
> +    *src_ip = PKT_GET_IP_HDR(p)->ip_src;
> +    return true;
> +}
> +
> +static uint16_t handle_send_msg(HvSynDbg *syndbg, uint64_t ingpa,
> +                                uint32_t count, bool is_raw,
> +                                uint32_t *pending_count)
> +{
> +    uint16_t ret;
> +    hwaddr data_len;
> +    void *debug_data = NULL;
> +    uint32_t udp_data_ofs = 0;
> +    const void *pkt_data;
> +    int sent_count;
> +
> +    data_len = count;
> +    debug_data = cpu_physical_memory_map(ingpa, &data_len, 0);
> +    if (!debug_data || data_len < count) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    if (is_raw &&
> +        !get_udb_pkt_data(debug_data, count, &udp_data_ofs,
> +                          &syndbg->target_ip)) {
> +        ret = HV_STATUS_SUCCESS;
> +        goto cleanup;
> +    }
> +
> +    pkt_data = (const void *)((uintptr_t)debug_data + udp_data_ofs);
> +    sent_count = qemu_sendto(syndbg->socket, pkt_data, count -
> udp_data_ofs,
> +                             MSG_NOSIGNAL, NULL, 0);
> +    if (sent_count == -1) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    *pending_count = count - (sent_count + udp_data_ofs);
> +    ret = HV_STATUS_SUCCESS;
> +cleanup:
> +    if (debug_data) {
> +        cpu_physical_memory_unmap(debug_data, count, 0, data_len);
> +    }
> +
> +    return ret;
> +}
> +
> +#define UDP_PKT_HEADER_SIZE \
> +    (sizeof(struct eth_header) + sizeof(struct ip_header) +\
> +     sizeof(struct udp_header))
> +
> +static bool create_udp_pkt(HvSynDbg *syndbg, void *pkt, uint32_t pkt_len,
> +                           void *udp_data, uint32_t udp_data_len)
> +{
> +    struct udp_header *udp_part;
> +
> +    if (pkt_len < (UDP_PKT_HEADER_SIZE + udp_data_len)) {
> +        return false;
> +    }
> +
> +    /* Setup the eth */
> +    memset(&PKT_GET_ETH_HDR(pkt)->h_source, 0, ETH_ALEN);
> +    memset(&PKT_GET_ETH_HDR(pkt)->h_dest, 0, ETH_ALEN);
> +    PKT_GET_ETH_HDR(pkt)->h_proto = cpu_to_be16(ETH_P_IP);
> +
> +    /* Setup the ip */
> +    PKT_GET_IP_HDR(pkt)->ip_ver_len =
> +        (4 << 4) | (sizeof(struct ip_header) >> 2);
> +    PKT_GET_IP_HDR(pkt)->ip_tos = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_id = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_off = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_ttl = 64; /* IPDEFTTL */
> +    PKT_GET_IP_HDR(pkt)->ip_p = IP_PROTO_UDP;
> +    PKT_GET_IP_HDR(pkt)->ip_src = syndbg->servaddr.sin_addr.s_addr;
> +    PKT_GET_IP_HDR(pkt)->ip_dst = syndbg->target_ip;
> +    PKT_GET_IP_HDR(pkt)->ip_len =
> +        cpu_to_be16(sizeof(struct ip_header) + sizeof(struct udp_header) +
> +                    udp_data_len);
> +    eth_fix_ip4_checksum(PKT_GET_IP_HDR(pkt), PKT_GET_IP_HDR_LEN(pkt));
> +
> +    udp_part = (struct udp_header *)((uintptr_t)pkt +
> +                                     sizeof(struct eth_header) +
> +                                     PKT_GET_IP_HDR_LEN(pkt));
> +    udp_part->uh_sport = syndbg->servaddr.sin_port;
> +    udp_part->uh_dport = syndbg->servaddr.sin_port;
> +    udp_part->uh_ulen = cpu_to_be16(sizeof(struct udp_header) +
> udp_data_len);
> +    memcpy(udp_part + 1, udp_data, udp_data_len);
> +    net_checksum_calculate(pkt, UDP_PKT_HEADER_SIZE + udp_data_len,
> CSUM_ALL);
> +    return true;
> +}
> +
> +static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
> +                                uint32_t count, bool is_raw, uint32_t
> options,
> +                                uint64_t timeout, uint32_t
> *retrieved_count)
> +{
> +    uint16_t ret;
> +    uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
> +    hwaddr out_len;
> +    void *out_data;
> +    ssize_t recv_byte_count;
> +
> +    /* TODO: Handle options and timeout */
> +    (void)options;
> +    (void)timeout;
> +
> +    if (!syndbg->has_data_pending) {
> +        recv_byte_count = 0;
> +    } else {
> +        recv_byte_count = qemu_recv(syndbg->socket, data_buf,
> +                                    MIN(sizeof(data_buf), count),
> MSG_WAITALL);
> +        if (recv_byte_count == -1) {
> +            return HV_STATUS_INVALID_PARAMETER;
> +        }
> +    }
> +
> +    if (!recv_byte_count) {
> +        *retrieved_count = 0;
> +        return HV_STATUS_NO_DATA;
> +    }
> +
> +    set_pending_state(syndbg, false);
> +
> +    out_len = recv_byte_count;
> +    if (is_raw) {
> +        out_len += UDP_PKT_HEADER_SIZE;
> +    }
> +    out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
> +    if (!out_data) {
> +        return HV_STATUS_INSUFFICIENT_MEMORY;
> +    }
> +
> +    if (is_raw &&
> +        !create_udp_pkt(syndbg, out_data,
> +                        recv_byte_count + UDP_PKT_HEADER_SIZE,
> +                        data_buf, recv_byte_count)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup_out_data;
> +    } else if (!is_raw) {
> +        memcpy(out_data, data_buf, recv_byte_count);
> +    }
> +
> +    *retrieved_count = recv_byte_count;
> +    if (is_raw) {
> +        *retrieved_count += UDP_PKT_HEADER_SIZE;
> +    }
> +    ret = HV_STATUS_SUCCESS;
> +
> +cleanup_out_data:
> +    cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
> +    return ret;
> +}
> +
> +static uint16_t hv_syndbg_handler(void *context, HvSynDbgMsg *msg)
> +{
> +    HvSynDbg *syndbg = context;
> +    uint16_t ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> +
> +    switch (msg->type) {
> +    case HV_SYNDBG_MSG_CONNECTION_INFO:
> +        msg->u.connection_info.host_ip =
> +            ntohl(syndbg->servaddr.sin_addr.s_addr);
> +        msg->u.connection_info.host_port =
> +            ntohs(syndbg->servaddr.sin_port);
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    case HV_SYNDBG_MSG_SEND:
> +        ret = handle_send_msg(syndbg, msg->u.send.buf_gpa,
> msg->u.send.count,
> +                              msg->u.send.is_raw,
> &msg->u.send.pending_count);
> +        break;
> +    case HV_SYNDBG_MSG_RECV:
> +        ret = handle_recv_msg(syndbg, msg->u.recv.buf_gpa,
> msg->u.recv.count,
> +                              msg->u.recv.is_raw, msg->u.recv.options,
> +                              msg->u.recv.timeout,
> +                              &msg->u.recv.retrieved_count);
> +        break;
> +    case HV_SYNDBG_MSG_SET_PENDING_PAGE:
> +        syndbg->pending_page_gpa = msg->u.pending_page.buf_gpa;
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    case HV_SYNDBG_MSG_QUERY_OPTIONS:
> +        msg->u.query_options.options = 0;
> +        if (syndbg->use_hcalls) {
> +            msg->u.query_options.options =
> HV_X64_SYNDBG_OPTION_USE_HCALLS;
> +        }
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void hv_syndbg_recv_event(void *opaque)
> +{
> +    HvSynDbg *syndbg = opaque;
> +    struct timeval tv;
> +    fd_set rfds;
> +
> +    tv.tv_sec = 0;
> +    tv.tv_usec = 0;
> +    FD_ZERO(&rfds);
> +    FD_SET(syndbg->socket, &rfds);
> +    if (select(syndbg->socket + 1, &rfds, NULL, NULL, &tv) > 0) {
> +        set_pending_state(syndbg, true);
> +    }
> +}
> +
> +static void hv_syndbg_realize(DeviceState *dev, Error **errp)
> +{
> +    HvSynDbg *syndbg = HVSYNDBG(dev);
> +
> +    if (!hv_syndbg_find()) {
> +        error_setg(errp, "at most one %s device is permitted",
> TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    if (!vmbus_bridge_find()) {
> +        error_setg(errp, "%s device requires vmbus-bridge device",
> +                   TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    /* Parse and host_ip */
> +    if (qemu_isdigit(syndbg->host_ip[0])) {
> +        syndbg->servaddr.sin_addr.s_addr = inet_addr(syndbg->host_ip);
> +    } else {
> +        struct hostent *he = gethostbyname(syndbg->host_ip);
> +        if (!he) {
> +            error_setg(errp, "%s failed to resolve host name %s",
> +                       TYPE_HV_SYNDBG, syndbg->host_ip);
> +            return;
> +        }
> +        syndbg->servaddr.sin_addr = *(struct in_addr *)he->h_addr;
> +    }
> +
> +    syndbg->socket = socket(AF_INET, SOCK_DGRAM, 0);
> +    if (syndbg->socket < 0) {
> +        error_setg(errp, "%s failed to create socket", TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    qemu_set_nonblock(syndbg->socket);
> +
> +    syndbg->servaddr.sin_port = htons(syndbg->host_port);
> +    syndbg->servaddr.sin_family = AF_INET;
> +    if (connect(syndbg->socket, (struct sockaddr *)&syndbg->servaddr,
> +                sizeof(syndbg->servaddr)) < 0) {
> +        closesocket(syndbg->socket);
> +        error_setg(errp, "%s failed to connect to socket",
> TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    syndbg->pending_page_gpa = 0;
> +    syndbg->has_data_pending = false;
> +    hyperv_set_syndbg_handler(hv_syndbg_handler, syndbg);
> +    qemu_set_fd_handler(syndbg->socket, hv_syndbg_recv_event, NULL,
> syndbg);
> +}
> +
> +static void hv_syndbg_unrealize(DeviceState *dev)
> +{
> +    HvSynDbg *syndbg = HVSYNDBG(dev);
> +
> +    if (syndbg->socket > 0) {
> +        qemu_set_fd_handler(syndbg->socket, NULL, NULL, NULL);
> +        closesocket(syndbg->socket);
> +    }
> +}
> +
> +static const VMStateDescription vmstate_hv_syndbg = {
> +    .name = TYPE_HV_SYNDBG,
> +    .unmigratable = 1,
> +};
> +
> +static Property hv_syndbg_properties[] = {
> +    DEFINE_PROP_STRING("host_ip", HvSynDbg, host_ip),
> +    DEFINE_PROP_UINT16("host_port", HvSynDbg, host_port, 50000),
> +    DEFINE_PROP_BOOL("use_hcalls", HvSynDbg, use_hcalls, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void hv_syndbg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, hv_syndbg_properties);
> +    dc->fw_name = TYPE_HV_SYNDBG;
> +    dc->vmsd = &vmstate_hv_syndbg;
> +    dc->realize = hv_syndbg_realize;
> +    dc->unrealize = hv_syndbg_unrealize;
> +    dc->user_creatable = true;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo hv_syndbg_type_info = {
> +    .name = TYPE_HV_SYNDBG,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(HvSynDbg),
> +    .class_init = hv_syndbg_class_init,
> +};
> +
> +static void hv_syndbg_register_types(void)
> +{
> +    type_register_static(&hv_syndbg_type_info);
> +}
> +
> +type_init(hv_syndbg_register_types)
> --
> 2.35.1
>
>

--000000000000785ee805d8baa95b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Feb 16, 2022, 12:25 Jon Doron &lt;<a href=3D"=
mailto:arilou@gmail.com">arilou@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Signed-off-by: Jon Doron &lt;<a href=3D"mailto:arilou=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">arilou@gmail.com</a>&gt;<b=
r>
---<br>
=C2=A0hw/hyperv/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0hw/hyperv/meson.build |=C2=A0 =C2=A01 +<br>
=C2=A0hw/hyperv/syndbg.c=C2=A0 =C2=A0 | 402 +++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A03 files changed, 408 insertions(+)<br>
=C2=A0create mode 100644 hw/hyperv/syndbg.c<br>
<br>
diff --git a/hw/hyperv/Kconfig b/hw/hyperv/Kconfig<br>
index 3fbfe41c9e..fcf65903bd 100644<br>
--- a/hw/hyperv/Kconfig<br>
+++ b/hw/hyperv/Kconfig<br>
@@ -11,3 +11,8 @@ config VMBUS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y<br>
=C2=A0 =C2=A0 =C2=A0depends on HYPERV<br>
+<br>
+config SYNDBG<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y<br>
+=C2=A0 =C2=A0 depends on VMBUS<br>
diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build<br>
index 1367e2994f..b43f119ea5 100644<br>
--- a/hw/hyperv/meson.build<br>
+++ b/hw/hyperv/meson.build<br>
@@ -1,3 +1,4 @@<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_HYPERV&#39;, if_true: files(&#39;hy=
perv.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_HYPERV_TESTDEV&#39;, if_true: files=
(&#39;hyperv_testdev.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_VMBUS&#39;, if_true: files(&#39;vmb=
us.c&#39;))<br>
+specific_ss.add(when: &#39;CONFIG_SYNDBG&#39;, if_true: files(&#39;syndbg.=
c&#39;))<br>
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c<br>
new file mode 100644<br>
index 0000000000..8816bc4082<br>
--- /dev/null<br>
+++ b/hw/hyperv/syndbg.c<br>
@@ -0,0 +1,402 @@<br>
+/*<br>
+ * QEMU Hyper-V Synthetic Debugging device<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/ctype.h&quot;<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;qemu/sockets.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/loader.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;hw/hyperv/hyperv.h&quot;<br>
+#include &quot;hw/hyperv/vmbus-bridge.h&quot;<br>
+#include &quot;hw/hyperv/hyperv-proto.h&quot;<br>
+#include &quot;net/net.h&quot;<br>
+#include &quot;net/eth.h&quot;<br>
+#include &quot;net/checksum.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#define TYPE_HV_SYNDBG=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hv-syndbg&quot;<br>
+<br>
+typedef struct HvSynDbg {<br>
+=C2=A0 =C2=A0 DeviceState parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 char *host_ip;<br>
+=C2=A0 =C2=A0 uint16_t host_port;<br>
+=C2=A0 =C2=A0 bool use_hcalls;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t target_ip;<br>
+=C2=A0 =C2=A0 struct sockaddr_in servaddr;<br>
+=C2=A0 =C2=A0 int socket;<br>
+=C2=A0 =C2=A0 bool has_data_pending;<br>
+=C2=A0 =C2=A0 uint64_t pending_page_gpa;<br>
+} HvSynDbg;<br>
+<br>
+#define HVSYNDBG(obj) OBJECT_CHECK(HvSynDbg, (obj), TYPE_HV_SYNDBG)<br>
+<br>
+/* returns NULL unless there is exactly one HV Synth debug device */<br>
+static HvSynDbg *hv_syndbg_find(void)<br>
+{<br>
+=C2=A0 =C2=A0 /* Returns NULL unless there is exactly one hvsd device */<b=
r>
+=C2=A0 =C2=A0 return HVSYNDBG(object_resolve_path_type(&quot;&quot;, TYPE_=
HV_SYNDBG, NULL));<br>
+}<br>
+<br>
+static void set_pending_state(HvSynDbg *syndbg, bool has_pending)<br>
+{<br>
+=C2=A0 =C2=A0 hwaddr out_len;<br>
+=C2=A0 =C2=A0 void *out_data;<br>
+<br>
+=C2=A0 =C2=A0 syndbg-&gt;has_data_pending =3D has_pending;<br>
+<br>
+=C2=A0 =C2=A0 if (!syndbg-&gt;pending_page_gpa) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 out_len =3D 1;<br>
+=C2=A0 =C2=A0 out_data =3D cpu_physical_memory_map(syndbg-&gt;pending_page=
_gpa, &amp;out_len, 1);<br>
+=C2=A0 =C2=A0 if (out_data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint8_t *)out_data =3D !!has_pending;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_physical_memory_unmap(out_data, out_len, 1=
, out_len);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool get_udb_pkt_data(void *p, uint32_t len, uint32_t *data_ofs,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *src_ip)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t offset, curr_len =3D len;<br>
+<br>
+=C2=A0 =C2=A0 if (curr_len &lt; sizeof(struct eth_header) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (be16_to_cpu(PKT_GET_ETH_HDR(p)-&gt;h_proto) !=
=3D ETH_P_IP)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 offset =3D sizeof(struct eth_header);<br>
+=C2=A0 =C2=A0 curr_len -=3D sizeof(struct eth_header);<br>
+<br>
+=C2=A0 =C2=A0 if (curr_len &lt; sizeof(struct ip_header) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKT_GET_IP_HDR(p)-&gt;ip_p !=3D IP_PROTO_UDP) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 offset +=3D PKT_GET_IP_HDR_LEN(p);<br>
+=C2=A0 =C2=A0 curr_len -=3D PKT_GET_IP_HDR_LEN(p);<br>
+<br>
+=C2=A0 =C2=A0 if (curr_len &lt; sizeof(struct udp_header)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 offset +=3D sizeof(struct udp_header);<br>
+=C2=A0 =C2=A0 *data_ofs =3D offset;<br>
+=C2=A0 =C2=A0 *src_ip =3D PKT_GET_IP_HDR(p)-&gt;ip_src;<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static uint16_t handle_send_msg(HvSynDbg *syndbg, uint64_t ingpa,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t count, bool is_raw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *pending_count)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t ret;<br>
+=C2=A0 =C2=A0 hwaddr data_len;<br>
+=C2=A0 =C2=A0 void *debug_data =3D NULL;<br>
+=C2=A0 =C2=A0 uint32_t udp_data_ofs =3D 0;<br>
+=C2=A0 =C2=A0 const void *pkt_data;<br>
+=C2=A0 =C2=A0 int sent_count;<br>
+<br>
+=C2=A0 =C2=A0 data_len =3D count;<br>
+=C2=A0 =C2=A0 debug_data =3D cpu_physical_memory_map(ingpa, &amp;data_len,=
 0);<br>
+=C2=A0 =C2=A0 if (!debug_data || data_len &lt; count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_INSUFFICIENT_MEMORY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (is_raw &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_udb_pkt_data(debug_data, count, &amp;udp_=
data_ofs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;syndbg-&gt;target_ip)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pkt_data =3D (const void *)((uintptr_t)debug_data + udp_data=
_ofs);<br>
+=C2=A0 =C2=A0 sent_count =3D qemu_sendto(syndbg-&gt;socket, pkt_data, coun=
t - udp_data_ofs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSG_NOSIGNAL, NULL, 0);<br>
+=C2=A0 =C2=A0 if (sent_count =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_INSUFFICIENT_MEMORY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *pending_count =3D count - (sent_count + udp_data_ofs);<br>
+=C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+cleanup:<br>
+=C2=A0 =C2=A0 if (debug_data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_physical_memory_unmap(debug_data, count, 0=
, data_len);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+#define UDP_PKT_HEADER_SIZE \<br>
+=C2=A0 =C2=A0 (sizeof(struct eth_header) + sizeof(struct ip_header) +\<br>
+=C2=A0 =C2=A0 =C2=A0sizeof(struct udp_header))<br>
+<br>
+static bool create_udp_pkt(HvSynDbg *syndbg, void *pkt, uint32_t pkt_len,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *udp_data, uint32_t udp_data_len)<br>
+{<br>
+=C2=A0 =C2=A0 struct udp_header *udp_part;<br>
+<br>
+=C2=A0 =C2=A0 if (pkt_len &lt; (UDP_PKT_HEADER_SIZE + udp_data_len)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Setup the eth */<br>
+=C2=A0 =C2=A0 memset(&amp;PKT_GET_ETH_HDR(pkt)-&gt;h_source, 0, ETH_ALEN);=
<br>
+=C2=A0 =C2=A0 memset(&amp;PKT_GET_ETH_HDR(pkt)-&gt;h_dest, 0, ETH_ALEN);<b=
r>
+=C2=A0 =C2=A0 PKT_GET_ETH_HDR(pkt)-&gt;h_proto =3D cpu_to_be16(ETH_P_IP);<=
br>
+<br>
+=C2=A0 =C2=A0 /* Setup the ip */<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_ver_len =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (4 &lt;&lt; 4) | (sizeof(struct ip_header) &gt=
;&gt; 2);<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_tos =3D 0;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_id =3D 0;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_off =3D 0;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_ttl =3D 64; /* IPDEFTTL */<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_p =3D IP_PROTO_UDP;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_src =3D syndbg-&gt;servaddr.sin_a=
ddr.s_addr;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_dst =3D syndbg-&gt;target_ip;<br>
+=C2=A0 =C2=A0 PKT_GET_IP_HDR(pkt)-&gt;ip_len =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_to_be16(sizeof(struct ip_header) + sizeof(=
struct udp_header) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udp_=
data_len);<br>
+=C2=A0 =C2=A0 eth_fix_ip4_checksum(PKT_GET_IP_HDR(pkt), PKT_GET_IP_HDR_LEN=
(pkt));<br>
+<br>
+=C2=A0 =C2=A0 udp_part =3D (struct udp_header *)((uintptr_t)pkt +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct et=
h_header) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKT_GET_IP_HDR_L=
EN(pkt));<br>
+=C2=A0 =C2=A0 udp_part-&gt;uh_sport =3D syndbg-&gt;servaddr.sin_port;<br>
+=C2=A0 =C2=A0 udp_part-&gt;uh_dport =3D syndbg-&gt;servaddr.sin_port;<br>
+=C2=A0 =C2=A0 udp_part-&gt;uh_ulen =3D cpu_to_be16(sizeof(struct udp_heade=
r) + udp_data_len);<br>
+=C2=A0 =C2=A0 memcpy(udp_part + 1, udp_data, udp_data_len);<br>
+=C2=A0 =C2=A0 net_checksum_calculate(pkt, UDP_PKT_HEADER_SIZE + udp_data_l=
en, CSUM_ALL);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t count, bool is_raw, uint32_=
t options,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timeout, uint32_t *retrieve=
d_count)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t ret;<br>
+=C2=A0 =C2=A0 uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];<br=
>
+=C2=A0 =C2=A0 hwaddr out_len;<br>
+=C2=A0 =C2=A0 void *out_data;<br>
+=C2=A0 =C2=A0 ssize_t recv_byte_count;<br>
+<br>
+=C2=A0 =C2=A0 /* TODO: Handle options and timeout */<br>
+=C2=A0 =C2=A0 (void)options;<br>
+=C2=A0 =C2=A0 (void)timeout;<br>
+<br>
+=C2=A0 =C2=A0 if (!syndbg-&gt;has_data_pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recv_byte_count =3D 0;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recv_byte_count =3D qemu_recv(syndbg-&gt;socke=
t, data_buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(sizeof(data_buf), =
count), MSG_WAITALL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (recv_byte_count =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return HV_STATUS_INVALID_PARAMET=
ER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!recv_byte_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *retrieved_count =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HV_STATUS_NO_DATA;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 set_pending_state(syndbg, false);<br>
+<br>
+=C2=A0 =C2=A0 out_len =3D recv_byte_count;<br>
+=C2=A0 =C2=A0 if (is_raw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out_len +=3D UDP_PKT_HEADER_SIZE;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 out_data =3D cpu_physical_memory_map(outgpa, &amp;out_len, 1=
);<br>
+=C2=A0 =C2=A0 if (!out_data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HV_STATUS_INSUFFICIENT_MEMORY;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (is_raw &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !create_udp_pkt(syndbg, out_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 recv_byte_count + UDP_PKT_HEADER_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data_buf, recv_byte_count)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_INSUFFICIENT_MEMORY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_out_data;<br>
+=C2=A0 =C2=A0 } else if (!is_raw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(out_data, data_buf, recv_byte_count);<b=
r>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *retrieved_count =3D recv_byte_count;<br>
+=C2=A0 =C2=A0 if (is_raw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *retrieved_count +=3D UDP_PKT_HEADER_SIZE;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+<br>
+cleanup_out_data:<br>
+=C2=A0 =C2=A0 cpu_physical_memory_unmap(out_data, out_len, 1, out_len);<br=
>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static uint16_t hv_syndbg_handler(void *context, HvSynDbgMsg *msg)<br>
+{<br>
+=C2=A0 =C2=A0 HvSynDbg *syndbg =3D context;<br>
+=C2=A0 =C2=A0 uint16_t ret =3D HV_STATUS_INVALID_HYPERCALL_CODE;<br>
+<br>
+=C2=A0 =C2=A0 switch (msg-&gt;type) {<br>
+=C2=A0 =C2=A0 case HV_SYNDBG_MSG_CONNECTION_INFO:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.connection_info.host_ip =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntohl(syndbg-&gt;servaddr.sin_ad=
dr.s_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.connection_info.host_port =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntohs(syndbg-&gt;servaddr.sin_po=
rt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case HV_SYNDBG_MSG_SEND:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D handle_send_msg(syndbg, msg-&gt;u.send=
.buf_gpa, msg-&gt;u.send.count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.send.is_raw, &amp;msg-&gt;u.send.=
pending_count);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case HV_SYNDBG_MSG_RECV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D handle_recv_msg(syndbg, msg-&gt;u.recv=
.buf_gpa, msg-&gt;u.recv.count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.recv.is_raw, msg-&gt;u.recv.optio=
ns,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.recv.timeout,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;msg-&gt;u.recv.retrieved_count);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case HV_SYNDBG_MSG_SET_PENDING_PAGE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syndbg-&gt;pending_page_gpa =3D msg-&gt;u.pend=
ing_page.buf_gpa;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case HV_SYNDBG_MSG_QUERY_OPTIONS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.query_options.options =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (syndbg-&gt;use_hcalls) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;u.query_options.options =
=3D HV_X64_SYNDBG_OPTION_USE_HCALLS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D HV_STATUS_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void hv_syndbg_recv_event(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 HvSynDbg *syndbg =3D opaque;<br>
+=C2=A0 =C2=A0 struct timeval tv;<br>
+=C2=A0 =C2=A0 fd_set rfds;<br>
+<br>
+=C2=A0 =C2=A0 tv.tv_sec =3D 0;<br>
+=C2=A0 =C2=A0 tv.tv_usec =3D 0;<br>
+=C2=A0 =C2=A0 FD_ZERO(&amp;rfds);<br>
+=C2=A0 =C2=A0 FD_SET(syndbg-&gt;socket, &amp;rfds);<br>
+=C2=A0 =C2=A0 if (select(syndbg-&gt;socket + 1, &amp;rfds, NULL, NULL, &am=
p;tv) &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_pending_state(syndbg, true);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void hv_syndbg_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 HvSynDbg *syndbg =3D HVSYNDBG(dev);<br>
+<br>
+=C2=A0 =C2=A0 if (!hv_syndbg_find()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;at most one %s device i=
s permitted&quot;, TYPE_HV_SYNDBG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!vmbus_bridge_find()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s device requires vmbu=
s-bridge device&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_=
HV_SYNDBG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Parse and host_ip */<br>
+=C2=A0 =C2=A0 if (qemu_isdigit(syndbg-&gt;host_ip[0])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syndbg-&gt;servaddr.sin_addr.s_addr =3D inet_a=
ddr(syndbg-&gt;host_ip);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct hostent *he =3D gethostbyname(syndbg-&g=
t;host_ip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!he) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s failed=
 to resolve host name %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_HV_SYNDBG, syndbg-&gt;host_ip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syndbg-&gt;servaddr.sin_addr =3D *(struct in_a=
ddr *)he-&gt;h_addr;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 syndbg-&gt;socket =3D socket(AF_INET, SOCK_DGRAM, 0);<br>
+=C2=A0 =C2=A0 if (syndbg-&gt;socket &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s failed to create soc=
ket&quot;, TYPE_HV_SYNDBG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_set_nonblock(syndbg-&gt;socket);<br>
+<br>
+=C2=A0 =C2=A0 syndbg-&gt;servaddr.sin_port =3D htons(syndbg-&gt;host_port)=
;<br>
+=C2=A0 =C2=A0 syndbg-&gt;servaddr.sin_family =3D AF_INET;<br>
+=C2=A0 =C2=A0 if (connect(syndbg-&gt;socket, (struct sockaddr *)&amp;syndb=
g-&gt;servaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(syndbg-&gt;=
servaddr)) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(syndbg-&gt;socket);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s failed to connect to=
 socket&quot;, TYPE_HV_SYNDBG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 syndbg-&gt;pending_page_gpa =3D 0;<br>
+=C2=A0 =C2=A0 syndbg-&gt;has_data_pending =3D false;<br>
+=C2=A0 =C2=A0 hyperv_set_syndbg_handler(hv_syndbg_handler, syndbg);<br>
+=C2=A0 =C2=A0 qemu_set_fd_handler(syndbg-&gt;socket, hv_syndbg_recv_event,=
 NULL, syndbg);<br>
+}<br>
+<br>
+static void hv_syndbg_unrealize(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 HvSynDbg *syndbg =3D HVSYNDBG(dev);<br>
+<br>
+=C2=A0 =C2=A0 if (syndbg-&gt;socket &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_fd_handler(syndbg-&gt;socket, NULL, N=
ULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(syndbg-&gt;socket);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_hv_syndbg =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_HV_SYNDBG,<br>
+=C2=A0 =C2=A0 .unmigratable =3D 1,<br>
+};<br>
+<br>
+static Property hv_syndbg_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;host_ip&quot;, HvSynDbg, host_ip),<=
br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;host_port&quot;, HvSynDbg, host_por=
t, 50000),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;use_hcalls&quot;, HvSynDbg, use_hcall=
s, false),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void hv_syndbg_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, hv_syndbg_properties);<br>
+=C2=A0 =C2=A0 dc-&gt;fw_name =3D TYPE_HV_SYNDBG;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_hv_syndbg;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D hv_syndbg_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;unrealize =3D hv_syndbg_unrealize;<br>
+=C2=A0 =C2=A0 dc-&gt;user_creatable =3D true;<br>
+=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<br>
+}<br>
+<br>
+static const TypeInfo hv_syndbg_type_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_HV_SYNDBG,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(HvSynDbg),<br>
+=C2=A0 =C2=A0 .class_init =3D hv_syndbg_class_init,<br>
+};<br>
+<br>
+static void hv_syndbg_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;hv_syndbg_type_info);<br>
+}<br>
+<br>
+type_init(hv_syndbg_register_types)<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div>

--000000000000785ee805d8baa95b--

