Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AF4ABCE5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:54:09 +0100 (CET)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2au-00017K-Mh
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2W0-0005uj-TU; Mon, 07 Feb 2022 06:49:04 -0500
Received: from [2607:f8b0:4864:20::c30] (port=38800
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2Vy-000428-ND; Mon, 07 Feb 2022 06:49:04 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso13312106oon.5; 
 Mon, 07 Feb 2022 03:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1T+9r8JiQTlFktwP5lYbVIIc3wa4xrqW1uuaEzSajmU=;
 b=CmVZeMxwIn+w7e3Thy9pcxxl8RsGs3mNcgSkhJrRaYid6U6NKHg22coq/8dYGSaTiR
 JBotA3f/8yZurex16PUBgjTg8AoPxa9nCvs1JFXlnkLoi+LXCNNSu8WRAJWcVHKRxLaW
 2S5c8+0MRBdEdPV1mgN7wxtcbYpjNOQ/fTtU49fFgkFj0qFl7xS89u3ZY5W1pXOfNzUx
 G7bmtpVrLMZeYyM3g1CL02/zgxAIjlqgHXRfdvgXqtaVr5L2egT5QX9MywhHfjY/YpGI
 fZPdOmVTAXKgzU8eFvl+eWc+mlgDMb88LrsoQmvFjds52h/cwPNZVH1L2yfD8RkCMKvq
 IhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1T+9r8JiQTlFktwP5lYbVIIc3wa4xrqW1uuaEzSajmU=;
 b=UJQCpfq/R0k3UmO3vbcdoasnhBFEbfex88p4YfpLjdlME+Ao3OYMh7Npd4kSJv49d5
 BSFaPq77VKsiK5avpgTFnNaY3PuMrmYUfkeX2m5pI04+dZ739K8UbTjGpFWxE8M/M5Pq
 vHMcimTlRg36ocb8og9219jRR0Z46Fhw43qBJTRxVrwDxEniu4BrvOKiMEIhk/eR3Fb4
 RCwXZ63dZQCu35QmzSIRJ93KXtz6ks57EC+VRbU9DJPGK2vi02VRyP2eCW4ZcCvKkZ9U
 UNTwxQNo1VWLYy9p1ygdloo3CmjFv2unQuwuhfsya8COBPJEuVj/pfXAHKhG7Sv0JSif
 sShg==
X-Gm-Message-State: AOAM532gGgkBqBwcEkm4/Fc6X/Z/mq+p+7Soz4N+sLpozdnRQQT7fZu7
 3F6pEjdiHJT6BMV6CKcK7bk=
X-Google-Smtp-Source: ABdhPJxB1cKvN/s7eEDV/dpdtLy+jK4FcTb2qwzwZhDnYEMzZHIJqxjk/lHFXBgMKwOJNhHTaumwuw==
X-Received: by 2002:a05:6870:b303:: with SMTP id
 a3mr4088359oao.280.1644234541125; 
 Mon, 07 Feb 2022 03:49:01 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id o144sm3883869ooo.25.2022.02.07.03.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:49:00 -0800 (PST)
Message-ID: <649a176e-63ed-885b-9f70-b28ed858dd27@gmail.com>
Date: Mon, 7 Feb 2022 08:48:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 ani@anisinha.ca, david@gibson.dropbear.id.au, groug@kaod.org,
 imammedo@redhat.com, xiaoguangrong.eric@gmail.com, qemu-ppc@nongnu.org
References: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
 <164396254862.109112.16675611182159105748.stgit@ltczzess4.aus.stglabs.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <164396254862.109112.16675611182159105748.stgit@ltczzess4.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/4/22 05:15, Shivaprasad G Bhat wrote:
> The patch adds support for the SCM flush hcall for the nvdimm devices.
> To be available for exploitation by guest through the next patch. The
> hcall is applicable only for new SPAPR specific device class which is
> also introduced in this patch.
> 
> The hcall expects the semantics such that the flush to return with
> H_LONG_BUSY_ORDER_10_MSEC when the operation is expected to take longer
> time along with a continue_token. The hcall to be called again by providing
> the continue_token to get the status. So, all fresh requests are put into
> a 'pending' list and flush worker is submitted to the thread pool. The
> thread pool completion callbacks move the requests to 'completed' list,
> which are cleaned up after collecting the return status for the guest
> in subsequent hcall from the guest.
> 
> The semantics makes it necessary to preserve the continue_tokens and
> their return status across migrations. So, the completed flush states
> are forwarded to the destination and the pending ones are restarted
> at the destination in post_load. The necessary nvdimm flush specific
> vmstate structures are also introduced in this patch which are to be
> saved in the new SPAPR specific nvdimm device to be introduced in the
> following patch.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr.c                |    2
>   hw/ppc/spapr_nvdimm.c         |  260 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/spapr.h        |    4 -
>   include/hw/ppc/spapr_nvdimm.h |    1
>   4 files changed, 266 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3d6ec309dd..9263985663 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1634,6 +1634,8 @@ static void spapr_machine_reset(MachineState *machine)
>           spapr->ov5_cas = spapr_ovec_clone(spapr->ov5);
>       }
>   
> +    spapr_nvdimm_finish_flushes();
> +
>       /* DRC reset may cause a device to be unplugged. This will cause troubles
>        * if this device is used by another device (eg, a running vhost backend
>        * will crash QEMU if the DIMM holding the vring goes away). To avoid such
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 91de1052f2..ac44e00153 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -22,6 +22,7 @@
>    * THE SOFTWARE.
>    */
>   #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>   #include "qapi/error.h"
>   #include "hw/ppc/spapr_drc.h"
>   #include "hw/ppc/spapr_nvdimm.h"
> @@ -30,6 +31,9 @@
>   #include "hw/ppc/fdt.h"
>   #include "qemu/range.h"
>   #include "hw/ppc/spapr_numa.h"
> +#include "block/thread-pool.h"
> +#include "migration/vmstate.h"
> +#include "qemu/pmem.h"
>   
>   /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c */
>   /* SCM device is unable to persist memory contents */
> @@ -47,6 +51,14 @@
>   /* Have an explicit check for alignment */
>   QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
>   
> +#define TYPE_SPAPR_NVDIMM "spapr-nvdimm"
> +OBJECT_DECLARE_TYPE(SpaprNVDIMMDevice, SPAPRNVDIMMClass, SPAPR_NVDIMM)
> +
> +struct SPAPRNVDIMMClass {
> +    /* private */
> +    NVDIMMClass parent_class;
> +};
> +
>   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>                              uint64_t size, Error **errp)
>   {
> @@ -375,6 +387,253 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
>       return H_SUCCESS;
>   }
>   
> +typedef struct SpaprNVDIMMDeviceFlushState {
> +    uint64_t continue_token;
> +    int64_t hcall_ret;
> +    uint32_t drcidx;
> +
> +    QLIST_ENTRY(SpaprNVDIMMDeviceFlushState) node;
> +} SpaprNVDIMMDeviceFlushState;
> +
> +typedef struct SpaprNVDIMMDevice SpaprNVDIMMDevice;
> +struct SpaprNVDIMMDevice {
> +    NVDIMMDevice parent_obj;
> +
> +    uint64_t nvdimm_flush_token;
> +    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_nvdimm_flush_states;
> +    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_nvdimm_flush_states;
> +};
> +
> +static int flush_worker_cb(void *opaque)
> +{
> +    SpaprNVDIMMDeviceFlushState *state = opaque;
> +    SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
> +    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
> +    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
> +    int backend_fd = memory_region_get_fd(&backend->mr);
> +
> +    if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
> +        MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
> +        void *ptr = memory_region_get_ram_ptr(mr);
> +        size_t size = object_property_get_uint(OBJECT(dimm), PC_DIMM_SIZE_PROP,
> +                                               NULL);
> +
> +        /* flush pmem backend */
> +        pmem_persist(ptr, size);
> +    } else {
> +        /* flush raw backing image */
> +        if (qemu_fdatasync(backend_fd) < 0) {
> +            error_report("papr_scm: Could not sync nvdimm to backend file: %s",
> +                         strerror(errno));
> +            return H_HARDWARE;
> +        }
> +    }
> +
> +    return H_SUCCESS;
> +}
> +
> +static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
> +{
> +    SpaprNVDIMMDeviceFlushState *state = opaque;
> +    SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
> +    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
> +
> +    state->hcall_ret = hcall_ret;
> +    QLIST_REMOVE(state, node);
> +    QLIST_INSERT_HEAD(&s_nvdimm->completed_nvdimm_flush_states, state, node);
> +}
> +
> +static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
> +{
> +    SpaprNVDIMMDevice *s_nvdimm = (SpaprNVDIMMDevice *)opaque;
> +    SpaprNVDIMMDeviceFlushState *state;
> +    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> +
> +    QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
> +        thread_pool_submit_aio(pool, flush_worker_cb, state,
> +                               spapr_nvdimm_flush_completion_cb, state);
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_spapr_nvdimm_flush_state = {
> +     .name = "spapr_nvdimm_flush_state",
> +     .version_id = 1,
> +     .minimum_version_id = 1,
> +     .fields = (VMStateField[]) {
> +         VMSTATE_UINT64(continue_token, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_INT64(hcall_ret, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_UINT32(drcidx, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_END_OF_LIST()
> +     },
> +};
> +
> +const VMStateDescription vmstate_spapr_nvdimm_states = {
> +    .name = "spapr_nvdimm_states",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .post_load = spapr_nvdimm_flush_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(nvdimm_flush_token, SpaprNVDIMMDevice),
> +        VMSTATE_QLIST_V(completed_nvdimm_flush_states, SpaprNVDIMMDevice, 1,
> +                        vmstate_spapr_nvdimm_flush_state,
> +                        SpaprNVDIMMDeviceFlushState, node),
> +        VMSTATE_QLIST_V(pending_nvdimm_flush_states, SpaprNVDIMMDevice, 1,
> +                        vmstate_spapr_nvdimm_flush_state,
> +                        SpaprNVDIMMDeviceFlushState, node),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +/*
> + * Assign a token and reserve it for the new flush state.
> + */
> +static SpaprNVDIMMDeviceFlushState *spapr_nvdimm_init_new_flush_state(
> +                                                SpaprNVDIMMDevice *spapr_nvdimm)
> +{
> +    SpaprNVDIMMDeviceFlushState *state;
> +
> +    state = g_malloc0(sizeof(*state));
> +
> +    spapr_nvdimm->nvdimm_flush_token++;
> +    /* Token zero is presumed as no job pending. Assert on overflow to zero */
> +    g_assert(spapr_nvdimm->nvdimm_flush_token != 0);
> +
> +    state->continue_token = spapr_nvdimm->nvdimm_flush_token;
> +
> +    QLIST_INSERT_HEAD(&spapr_nvdimm->pending_nvdimm_flush_states, state, node);
> +
> +    return state;
> +}
> +
> +/*
> + * spapr_nvdimm_finish_flushes
> + *      Waits for all pending flush requests to complete
> + *      their execution and free the states
> + */
> +void spapr_nvdimm_finish_flushes(void)
> +{
> +    SpaprNVDIMMDeviceFlushState *state, *next;
> +    GSList *list, *nvdimms;
> +
> +    /*
> +     * Called on reset path, the main loop thread which calls
> +     * the pending BHs has gotten out running in the reset path,
> +     * finally reaching here. Other code path being guest
> +     * h_client_architecture_support, thats early boot up.
> +     */
> +    nvdimms = nvdimm_get_device_list();
> +    for (list = nvdimms; list; list = list->next) {
> +        NVDIMMDevice *nvdimm = list->data;
> +        if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
> +            SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(nvdimm);
> +            while (!QLIST_EMPTY(&s_nvdimm->pending_nvdimm_flush_states)) {
> +                aio_poll(qemu_get_aio_context(), true);
> +            }
> +
> +            QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_states,
> +                               node, next) {
> +                QLIST_REMOVE(state, node);
> +                g_free(state);
> +            }
> +        }
> +    }
> +    g_slist_free(nvdimms);
> +}
> +
> +/*
> + * spapr_nvdimm_get_flush_status
> + *      Fetches the status of the hcall worker and returns
> + *      H_LONG_BUSY_ORDER_10_MSEC if the worker is still running.
> + */
> +static int spapr_nvdimm_get_flush_status(SpaprNVDIMMDevice *s_nvdimm,
> +                                         uint64_t token)
> +{
> +    SpaprNVDIMMDeviceFlushState *state, *node;
> +
> +    QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
> +        if (state->continue_token == token) {
> +            return H_LONG_BUSY_ORDER_10_MSEC;
> +        }
> +    }
> +
> +    QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_states,
> +                       node, node) {
> +        if (state->continue_token == token) {
> +            int ret = state->hcall_ret;
> +            QLIST_REMOVE(state, node);
> +            g_free(state);
> +            return ret;
> +        }
> +    }
> +
> +    /* If not found in complete list too, invalid token */
> +    return H_P2;
> +}
> +
> +/*
> + * H_SCM_FLUSH
> + * Input: drc_index, continue-token
> + * Out: continue-token
> + * Return Value: H_SUCCESS, H_Parameter, H_P2, H_LONG_BUSY_ORDER_10_MSEC,
> + *               H_UNSUPPORTED
> + *
> + * Given a DRC Index Flush the data to backend NVDIMM device. The hcall returns
> + * H_LONG_BUSY_ORDER_10_MSEC when the flush takes longer time and the hcall
> + * needs to be issued multiple times in order to be completely serviced. The
> + * continue-token from the output to be passed in the argument list of
> + * subsequent hcalls until the hcall is completely serviced at which point
> + * H_SUCCESS or other error is returned.
> + */
> +static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                target_ulong opcode, target_ulong *args)
> +{
> +    int ret;
> +    uint32_t drc_index = args[0];
> +    uint64_t continue_token = args[1];
> +    SpaprDrc *drc = spapr_drc_by_index(drc_index);
> +    PCDIMMDevice *dimm;
> +    HostMemoryBackend *backend = NULL;
> +    SpaprNVDIMMDeviceFlushState *state;
> +    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> +    int fd;
> +
> +    if (!drc || !drc->dev ||
> +        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
> +        return H_PARAMETER;
> +    }
> +
> +    dimm = PC_DIMM(drc->dev);
> +    if (continue_token == 0) {
> +        backend = MEMORY_BACKEND(dimm->hostmem);
> +        fd = memory_region_get_fd(&backend->mr);
> +
> +        if (fd < 0) {
> +            return H_UNSUPPORTED;
> +        }
> +
> +        state = spapr_nvdimm_init_new_flush_state(SPAPR_NVDIMM(dimm));
> +        if (!state) {
> +            return H_HARDWARE;
> +        }
> +
> +        state->drcidx = drc_index;
> +
> +        thread_pool_submit_aio(pool, flush_worker_cb, state,
> +                               spapr_nvdimm_flush_completion_cb, state);
> +
> +        continue_token = state->continue_token;
> +    }
> +
> +    ret = spapr_nvdimm_get_flush_status(SPAPR_NVDIMM(dimm), continue_token);
> +    if (H_IS_LONG_BUSY(ret)) {
> +        args[0] = continue_token;
> +    }
> +
> +    return ret;
> +}
> +
>   static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                        target_ulong opcode, target_ulong *args)
>   {
> @@ -523,6 +782,7 @@ static void spapr_scm_register_types(void)
>       spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
>       spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
>       spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
> +    spapr_register_hypercall(H_SCM_FLUSH, h_scm_flush);
>   }
>   
>   type_init(spapr_scm_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ee7504b976..727b2a0e7f 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -341,6 +341,7 @@ struct SpaprMachineState {
>   #define H_P7              -60
>   #define H_P8              -61
>   #define H_P9              -62
> +#define H_UNSUPPORTED     -67
>   #define H_OVERLAP         -68
>   #define H_UNSUPPORTED_FLAG -256
>   #define H_MULTI_THREADS_ACTIVE -9005
> @@ -559,8 +560,9 @@ struct SpaprMachineState {
>   #define H_SCM_UNBIND_ALL        0x3FC
>   #define H_SCM_HEALTH            0x400
>   #define H_RPT_INVALIDATE        0x448
> +#define H_SCM_FLUSH             0x44C
>   
> -#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
> +#define MAX_HCALL_OPCODE        H_SCM_FLUSH
>   
>   /* The hcalls above are standardized in PAPR and implemented by pHyp
>    * as well.
> diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
> index 764f999f54..e9436cb6ef 100644
> --- a/include/hw/ppc/spapr_nvdimm.h
> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -21,5 +21,6 @@ void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
>   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>                              uint64_t size, Error **errp);
>   void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
> +void spapr_nvdimm_finish_flushes(void);
>   
>   #endif
> 
> 

