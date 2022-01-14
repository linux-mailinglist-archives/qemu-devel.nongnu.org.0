Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D6948E6DC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:50:17 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IHo-0001Qd-1M
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBL-0007Pu-KQ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:36 -0500
Received: from [2607:f8b0:4864:20::102c] (port=45817
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBJ-00078R-5R
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso13487193pjg.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=DojlegPMnwzIRku5ToqUcRlNQyr5JGDpeLidxXdRiCU=;
 b=cuOuOSqCMJ+WQlFfadJ0SetlSDdUNLSsudcqlWMoqwrzphAsBolug55eShKqQBScn1
 jjQt8+Noy/bMyvjTmnY9wXuZ4Xb25rEwxAyfEbT7+bANp00Ln8lnnACjlYqc0c50EQmj
 ypEKFQDSxShqOh5Ic0a2QLUCvwDb2cCYHkBuQgT7FI+xvDLqIVQk8WPDC5gaLYzGhSQQ
 O1oEkrglNtjSvecu5W1AWX8/OXdQ8uaWKtoKPF71ikQRTyFK2WEpa9p0CB4+HUCQssXp
 efl5Yp1dDhiO+Ho2yAqrkj1/uLgtBzFzPCN+Q/pGiRou1IVHE4xZiB+g5HJqdB/NNfV0
 zrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=DojlegPMnwzIRku5ToqUcRlNQyr5JGDpeLidxXdRiCU=;
 b=n2Oyn0o4rol9zS+EA9borAyfDt2/eETeLSkEnlZjO5xcDCCmGZUzvXs95XE9GxYFSr
 3LUDpqeMWKFc1zPWNm3gjGM5VdDuzTc3cmAa+zW4Yj/Tr49eT/AL8haZaGxXN/qVh5Xe
 P48FNryNlIcjbZa4uIji3qHncz5K4lj/EKFHKo4ZjkdYFL93VjNGDWQ0ADm6h6PXjBzx
 TBuYFqFFVhNcpYWgggEdo+1wRYaDcVbXEwbio8X6VUEtk55ItHIucLGRnfKk0Nk7xp/X
 aHjv3DhEl71qMErjH/GYoZWtOtS+mcw+Dee078URm61DO4bPtZu+mppgTeT0CktOR0GN
 DPxA==
X-Gm-Message-State: AOAM531EOX6PtKy6sdR+g6TgPiiBF5t0dOM7o2Tylxj0WkdX6/0zxrQ7
 b0vKO9Er1I/XuC6BuV/2aeY=
X-Google-Smtp-Source: ABdhPJxclYjwLF/3QscSFLY5ElkBw+fiadUCu1KepjQ+SxmInX6H87kbIHs3l0lrAW768XFwdboAiA==
X-Received: by 2002:a17:90a:748e:: with SMTP id
 p14mr9553029pjk.231.1642149811708; 
 Fri, 14 Jan 2022 00:43:31 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 a23sm4493665pjo.57.2022.01.14.00.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:43:31 -0800 (PST)
Message-ID: <bb15428f-f4ca-65dc-914f-5a8cf7bc1322@gmail.com>
Date: Fri, 14 Jan 2022 17:43:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v13 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-4-yaroshchuk2000@gmail.com>
Content-Language: en-US
In-Reply-To: <20220113172219.66372-4-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/14 2:22, Vladislav Yaroshchuk wrote:
> Interaction with vmnet.framework in different modes
> differs only on configuration stage, so we can create
> common `send`, `receive`, etc. procedures and reuse them.
> 
> vmnet.framework supports iov, but writing more than
> one iov into vmnet interface fails with
> 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> one and passing it to vmnet works fine. That's the
> reason why receive_iov() left unimplemented. But it still
> works with good enough performance having .receive()
> implemented only.
> 
> Also, there is no way to unsubscribe from vmnet packages
> receiving except registering and unregistering event
> callback or simply drop packages just ignoring and
> not processing them when related flag is set. Here we do
> using the second way.
> 
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   net/vmnet-common.m | 313 +++++++++++++++++++++++++++++++++++++++++++++
>   net/vmnet-shared.c |  83 +++++++++++-
>   net/vmnet_int.h    |  23 ++++
>   3 files changed, 415 insertions(+), 4 deletions(-)
> 
> diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> index 532d152840..e780985891 100644
> --- a/net/vmnet-common.m
> +++ b/net/vmnet-common.m
> @@ -10,6 +10,8 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/log.h"
>   #include "qapi/qapi-types-net.h"
>   #include "vmnet_int.h"
>   #include "clients.h"
> @@ -17,4 +19,315 @@
>   #include "qapi/error.h"
>   
>   #include <vmnet/vmnet.h>
> +#include <dispatch/dispatch.h>
>   
> +#ifdef DEBUG
> +#define D(x) x
> +#define D_LOG(...) qemu_log(__VA_ARGS__)
> +#else
> +#define D(x) do { } while (0)
> +#define D_LOG(...) do { } while (0)
> +#endif
> +
> +typedef struct vmpktdesc vmpktdesc_t;
> +typedef struct iovec iovec_t;

The uses of these typedefs are inconsistent and some use struct 
vmpktdesc and struct iovec and the other use vmpktdesc_t and iovec_t. 
They should be at least consistent, and I also don't think adding 
typedefs for types provided by an external library is a good idea in 
general.

> +
> +static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable)
> +{
> +    s->send_enabled = enable;
> +}
> +
> +
> +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> +{
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> +    vmnet_set_send_enabled(s, true);
> +}
> +
> +
> +static void vmnet_send(NetClientState *nc,
> +                       interface_event_t event_id,
> +                       xpc_object_t event)
> +{
> +    assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> +
> +    VmnetCommonState *s;
> +    uint64_t packets_available;
> +
> +    struct iovec *iov;
> +    struct vmpktdesc *packets;
> +    int pkt_cnt;
> +    int i;
> +
> +    vmnet_return_t if_status;
> +    ssize_t size;
> +
> +    s = DO_UPCAST(VmnetCommonState, nc, nc);
> +
> +    packets_available = xpc_dictionary_get_uint64(
> +        event,
> +        vmnet_estimated_packets_available_key
> +    );
> +
> +    pkt_cnt = (packets_available < VMNET_PACKETS_LIMIT) ?
> +              packets_available :
> +              VMNET_PACKETS_LIMIT;
> +
> +
> +    iov = s->iov_buf;
> +    packets = s->packets_buf;
> +
> +    for (i = 0; i < pkt_cnt; ++i) {
> +        packets[i].vm_pkt_size = s->max_packet_size;
> +        packets[i].vm_pkt_iovcnt = 1;
> +        packets[i].vm_flags = 0;
> +    }
> +
> +    if_status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> +    if (if_status != VMNET_SUCCESS) {
> +        error_printf("vmnet: read failed: %s\n",
> +                     vmnet_status_map_str(if_status));
> +    }
> +    qemu_mutex_lock_iothread();
> +    for (i = 0; i < pkt_cnt; ++i) {
> +        size = qemu_send_packet_async(nc,
> +                                      iov[i].iov_base,
> +                                      packets[i].vm_pkt_size,
> +                                      vmnet_send_completed);
> +        if (size == 0) {
> +            vmnet_set_send_enabled(s, false);
> +        } else if (size < 0) {
> +            break;
> +        }
> +    }
> +    qemu_mutex_unlock_iothread();
> +
> +}
> +
> +
> +static void vmnet_register_event_callback(VmnetCommonState *s)
> +{
> +    dispatch_queue_t avail_pkt_q = dispatch_queue_create(
> +        "org.qemu.vmnet.if_queue",
> +        DISPATCH_QUEUE_SERIAL
> +    );
> +
> +    vmnet_interface_set_event_callback(
> +        s->vmnet_if,
> +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> +        avail_pkt_q,
> +        ^(interface_event_t event_id, xpc_object_t event) {
> +          if (s->send_enabled) {
> +              vmnet_send(&s->nc, event_id, event);
> +          }
> +        });
> +}

avail_pkt_q leaks even after vmnet_cleanup_common. Note:
- that you can dynamically add and delete interfaces with HMP and QMP.
- that vmnet_interface_set_event_callback somehow does not manage the 
reference counter by itself so you cannot just call dispatch_release 
immediately after vmnet_interface_set_event_callback and you have to 
call it after making sure everything is done.

> +
> +
> +static void vmnet_bufs_init(VmnetCommonState *s)
> +{
> +    int i;
> +    struct vmpktdesc *packets;
> +    struct iovec *iov;
> +
> +    packets = s->packets_buf;
> +    iov = s->iov_buf;
> +
> +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> +        iov[i].iov_len = s->max_packet_size;
> +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> +        packets[i].vm_pkt_iov = iov + i;
> +    }
> +}
> +
> +
> +const char *vmnet_status_map_str(vmnet_return_t status)
> +{
> +    switch (status) {
> +    case VMNET_SUCCESS:
> +        return "success";
> +    case VMNET_FAILURE:
> +        return "general failure";
> +    case VMNET_MEM_FAILURE:
> +        return "memory allocation failure";
> +    case VMNET_INVALID_ARGUMENT:
> +        return "invalid argument specified";
> +    case VMNET_SETUP_INCOMPLETE:
> +        return "interface setup is not complete";
> +    case VMNET_INVALID_ACCESS:
> +        return "invalid access, permission denied";
> +    case VMNET_PACKET_TOO_BIG:
> +        return "packet size is larger than MTU";
> +    case VMNET_BUFFER_EXHAUSTED:
> +        return "buffers exhausted in kernel";
> +    case VMNET_TOO_MANY_PACKETS:
> +        return "packet count exceeds limit";
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    case VMNET_SHARING_SERVICE_BUSY:
> +        return "conflict, sharing service is in use";
> +#endif
> +    default:
> +        return "unknown vmnet error";
> +    }
> +}
> +
> +
> +int vmnet_if_create(NetClientState *nc,
> +                    xpc_object_t if_desc,
> +                    Error **errp,
> +                    void (*completion_callback)(xpc_object_t interface_param))

completion_callback parameter is apparently unused in this series and 
can be removed.

> +{
> +    VmnetCommonState *s;
> +
> +    dispatch_queue_t if_create_q;
> +    dispatch_semaphore_t if_created_sem
> +
> +    __block vmnet_return_t if_status;
> +
> +    if_create_q = dispatch_queue_create("org.qemu.vmnet.create",
> +                                        DISPATCH_QUEUE_SERIAL);
> +    if_created_sem = dispatch_semaphore_create(0);

if_created_sem leaks. Add dispatch_release(if_created_sem); later.

> +
> +    xpc_dictionary_set_bool(
> +        if_desc,
> +        vmnet_allocate_mac_address_key,
> +        false
> +    );
> +
> +    D(D_LOG("vmnet.start.interface_desc:\n");
> +    xpc_dictionary_apply(if_desc,
> +                         ^bool(const char *k, xpc_object_t v) {
> +                           char *desc = xpc_copy_description(v);
> +                           D_LOG("  %s=%s\n", k, desc);
> +                           free(desc);
> +                           return true;
> +                         }));
> +
> +    s = DO_UPCAST(VmnetCommonState, nc, nc);
> +    s->vmnet_if = vmnet_start_interface(
> +        if_desc,
> +        if_create_q,
> +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> +          if_status = status;
> +          if (status != VMNET_SUCCESS || !interface_param) {
> +              dispatch_semaphore_signal(if_created_sem);
> +              return;
> +          }
> +
> +          D(D_LOG("vmnet.start.interface_param:\n");
> +                xpc_dictionary_apply(interface_param,
> +                                     ^bool(const char *k, xpc_object_t v) {
> +                                       char *desc = xpc_copy_description(v);
> +                                       D_LOG("  %s=%s\n", k, desc);
> +                                       free(desc);
> +                                       return true;
> +                                     }));

The indents in `D()` in this function is inconsistent. In my opinion, 
having a few statements in `()` is inherently confusing and just using 
`#ifdef DEBUG` is preferred.

Using a normal `if` instead of #ifdef would be even better, but you 
don't have to do that because apparently QEMU doesn't have a common 
infrastructure for this. c.f. 
https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation

> +
> +          s->mtu = xpc_dictionary_get_uint64(
> +              interface_param,
> +              vmnet_mtu_key);
> +          s->max_packet_size = xpc_dictionary_get_uint64(
> +              interface_param,
> +              vmnet_max_packet_size_key);
> +
> +          if (completion_callback) {
> +              completion_callback(interface_param);
> +          }
> +          dispatch_semaphore_signal(if_created_sem);
> +        });
> +
> +    if (s->vmnet_if == NULL) {
> +        error_setg(errp, "unable to create interface with requested params");
> +        return -1;

if_create_q leaks here. You may just use a global queue here to entirely 
eliminate the need of calling dispatch_release(if_create_q).

> +    }
> +
> +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> +    dispatch_release(if_create_q);
> +
> +    if (if_status != VMNET_SUCCESS) {
> +        error_setg(errp,
> +                   "cannot create vmnet interface: %s",
> +                   vmnet_status_map_str(if_status));
> +        return -1;
> +    }
> +
> +    vmnet_register_event_callback(s);
> +    vmnet_bufs_init(s);
> +    vmnet_set_send_enabled(s, true);
> +
> +    return 0;
> +}
> +
> +
> +ssize_t vmnet_receive_common(NetClientState *nc,
> +                             const uint8_t *buf,
> +                             size_t size)
> +{
> +    VmnetCommonState *s;
> +    vmpktdesc_t packet;
> +    iovec_t iov;
> +    int pkt_cnt;
> +    vmnet_return_t if_status;
> +
> +    s = DO_UPCAST(VmnetCommonState, nc, nc);
> +
> +    if (size > s->max_packet_size) {
> +        warn_report("vmnet: packet is too big, %zu > %llu\n",
> +                    packet.vm_pkt_size,
> +                    s->max_packet_size);
> +        return -1;
> +    }
> +
> +    iov.iov_base = (char *) buf;
> +    iov.iov_len = size;
> +
> +    packet.vm_pkt_iovcnt = 1;
> +    packet.vm_flags = 0;
> +    packet.vm_pkt_size = size;
> +    packet.vm_pkt_iov = &iov;
> +
> +    pkt_cnt = 1;
> +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> +
> +    if (if_status != VMNET_SUCCESS) {
> +        error_report("vmnet: write error: %s\n",
> +                     vmnet_status_map_str(if_status));
> +    }
> +
> +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> +        return size;
> +    }
> +    return 0;
> +}
> +
> +
> +void vmnet_cleanup_common(NetClientState *nc)
> +{
> +    VmnetCommonState *s;
> +    dispatch_queue_t if_destroy_q;
> +
> +    s = DO_UPCAST(VmnetCommonState, nc, nc);
> +
> +    qemu_purge_queued_packets(nc);
> +    vmnet_set_send_enabled(s, false);
> +
> +    if (s->vmnet_if == NULL) {
> +        return;
> +    }
> +
> +    if_destroy_q = dispatch_queue_create(
> +        "org.qemu.vmnet.destroy",
> +        DISPATCH_QUEUE_SERIAL
> +    );
> +
> +    vmnet_stop_interface(
> +        s->vmnet_if,
> +        if_destroy_q,
> +        ^(vmnet_return_t status) {
> +        });
> +
> +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> +        g_free(s->iov_buf[i].iov_base);
> +    }

Not sure it is safe to free things without waiting the callback of 
vmnet_stop_interface. I think a semaphore should be added as it is in 
vmnet_if_create.

> +}
> diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> index f8c4a4f3b8..61f3e9201f 100644
> --- a/net/vmnet-shared.c
> +++ b/net/vmnet-shared.c
> @@ -10,16 +10,91 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-types-net.h"
> +#include "qapi/error.h"
>   #include "vmnet_int.h"
>   #include "clients.h"
> -#include "qemu/error-report.h"
> -#include "qapi/error.h"
>   
>   #include <vmnet/vmnet.h>
>   
> +typedef struct VmnetSharedState {
> +  VmnetCommonState cs;
> +} VmnetSharedState;
> +
> +
> +static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
> +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> +
> +    xpc_dictionary_set_uint64(
> +        if_desc,
> +        vmnet_operation_mode_key,
> +        VMNET_SHARED_MODE
> +    );
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    xpc_dictionary_set_bool(
> +        if_desc,
> +        vmnet_enable_isolation_key,
> +        options->isolated
> +    );
> +#else
> +    if (options->has_isolated) {
> +        error_setg(errp,
> +                   "vmnet-shared.isolated feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +    }
> +#endif
> +
> +    if (options->has_nat66_prefix) {
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_nat66_prefix_key,
> +                                  options->nat66_prefix);
> +    }
> +
> +    if (options->has_start_address ||
> +        options->has_end_address ||
> +        options->has_subnet_mask) {
> +
> +        if (options->has_start_address &&
> +            options->has_end_address &&
> +            options->has_subnet_mask) {
> +
> +            xpc_dictionary_set_string(if_desc,
> +                                      vmnet_start_address_key,
> +                                      options->start_address);
> +            xpc_dictionary_set_string(if_desc,
> +                                      vmnet_end_address_key,
> +                                      options->end_address);
> +            xpc_dictionary_set_string(if_desc,
> +                                      vmnet_subnet_mask_key,
> +                                      options->subnet_mask);
> +        } else {
> +            error_setg(
> +                errp,
> +                "'start-address', 'end-address', 'subnet-mask' "
> +                "should be provided together"
> +            );
> +        }
> +    }

I think the following is simpler and the intention is still clear:
// if you have all the options...
if (options->has_start_address &&
     options->has_end_address &&
     options->has_subnet_mask) {
   // ... set relevant entries in the dictionary
// otherwise, if you still have some of the options...
} else if (options->has_start_address ||
            options->has_end_address ||
            options->has_subnet_mask) {
   // error
}

> +
> +    return if_desc;
> +}
> +
> +static NetClientInfo net_vmnet_shared_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> +    .size = sizeof(VmnetSharedState),
> +    .receive = vmnet_receive_common,
> +    .cleanup = vmnet_cleanup_common,
> +};
> +
>   int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>                             NetClientState *peer, Error **errp)
>   {
> -  error_setg(errp, "vmnet-shared is not implemented yet");
> -  return -1;
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_shared_info,
> +                                             peer, "vmnet-shared", name);
> +    xpc_object_t if_desc = create_if_desc(netdev, errp);
> +
> +    return vmnet_if_create(nc, if_desc, errp, NULL);

if_desc leaks here. Add xpc_release(if_desc);

qemu_del_net_client(nc) should also be called if the interface creation 
failed.

>   }
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index c5982259a4..3979fe4678 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -16,10 +16,33 @@
>   
>   #include <vmnet/vmnet.h>
>   
> +#define VMNET_PACKETS_LIMIT 50 > +

This value has no reasoning. I found this:
https://developer.apple.com/documentation/vmnet
> Each read/write call allows up to 200 packets to be read or written
 > for a maximum of 256KB.

If 200 is the correct value for this, the URI to the page should also 
added as a comment.

>   typedef struct VmnetCommonState {
>     NetClientState nc;
> +  interface_ref vmnet_if;
> +
> +  bool send_enabled;
> +
> +  uint64_t mtu;
> +  uint64_t max_packet_size;
> +
> +  struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> +  struct iovec iov_buf[VMNET_PACKETS_LIMIT];
>   
>   } VmnetCommonState;
>   
> +const char *vmnet_status_map_str(vmnet_return_t status);
> +
> +int vmnet_if_create(NetClientState *nc,
> +                    xpc_object_t if_desc,
> +                    Error **errp,
> +                    void (*completion_callback)(xpc_object_t interface_param));
> +
> +ssize_t vmnet_receive_common(NetClientState *nc,
> +                             const uint8_t *buf,
> +                             size_t size);
> +
> +void vmnet_cleanup_common(NetClientState *nc);
>   
>   #endif /* VMNET_INT_H */

