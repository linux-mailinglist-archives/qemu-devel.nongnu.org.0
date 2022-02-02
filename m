Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D354A7912
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:58:03 +0100 (CET)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLlT-0005Fq-0x
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:58:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFKpK-0002AQ-OM; Wed, 02 Feb 2022 13:57:58 -0500
Received: from [2607:f8b0:4864:20::22d] (port=38490
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFKpI-0007ux-Bu; Wed, 02 Feb 2022 13:57:58 -0500
Received: by mail-oi1-x22d.google.com with SMTP id u13so118563oie.5;
 Wed, 02 Feb 2022 10:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bmPKXKYzPy1kA7KW4d7u/vuxxsqjR+u4nCn+G+mUQts=;
 b=gs+LRMQosD/9IF3FxlH7sFU+DULvgxN0Gbg+gmae5GeYk8CBiTTgSOB//w7RPxo7gs
 RQI+Q3ZqVFXsrHZfiUh1OS6IN17l2Kf51/g2TGju5yuySZ30m/dtgotalDRgMPJL5G5o
 U3jlIAAL1X3L0fDRdpPnlQGlcb6GpX2zCkJ8N4fMfIO6YLnWvxNe/ZZH4My3SHKkcGog
 a+mV/fmRXtp0dDcnuQLDKUdug0c/4ugsp3TRGGBfsu5P2Z5M90rSBGsO2PuLxCh8XIp9
 oEie7HlARFsuHlLkV4G0hCU99PnqcxeQu7cDzp6X0tZHnUQQ0rjGc6l6NZjA/BrN+hob
 lb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bmPKXKYzPy1kA7KW4d7u/vuxxsqjR+u4nCn+G+mUQts=;
 b=SOu+CNySI7/cJ5uy9t8Qzfjtezzd0aQ7lFRdQhItcReNaNsArwW1+bpKYhIsgGmKTW
 UL7pyJnt99rpnvz8FdhIUejBLyzJ81bgWr1W9uXOaR2/UCGL6CTd45rX8H/Ed0txW3N5
 g0m6NnJOl0rTlFA7Ntx1k+JBUZ3HtZH3kctGWOEua4s1po5hFZrq3J50fG0CLw9Vl2x5
 ET4uH3Y6+21+/xSAsVt3Dz+AeJcu+l7WlDFqILXoW5C6PvRpHE+QEV41EEY2mPbnXvbJ
 vugwEAfNXAp/IIlK/P/2cK53D4rQRFvIP/BY/fR+BWprdoe3rZ5vpWi+mdZz0A8tvoXW
 dYZg==
X-Gm-Message-State: AOAM531iYgTYJWMXRU+15Iq7Wdwme3cU3PpBBlhUxLngGWSQNnmNbihx
 eJFgqN2YxQoHubgmGZ1esJE=
X-Google-Smtp-Source: ABdhPJws4EXYOoyK07bOw2kLZKiVhvSxSvWxk1Si4Y/eLm2oCN53EYbI/58wNNh+AEdCSy8nnNj9ww==
X-Received: by 2002:a05:6808:168e:: with SMTP id
 bb14mr5395070oib.106.1643828274797; 
 Wed, 02 Feb 2022 10:57:54 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id d65sm12956442otb.17.2022.02.02.10.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 10:57:54 -0800 (PST)
Message-ID: <01c25b65-cd6f-ded9-fa46-aa5f5a82d05a@gmail.com>
Date: Wed, 2 Feb 2022 15:57:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/3] spapr: nvdimm: Introduce spapr-nvdimm device
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 ani@anisinha.ca, david@gibson.dropbear.id.au, groug@kaod.org,
 imammedo@redhat.com, xiaoguangrong.eric@gmail.com, qemu-ppc@nongnu.org
References: <164375265242.118489.1350738893986283213.stgit@82dbe1ffb256>
 <164375268492.118489.6662873828073732668.stgit@82dbe1ffb256>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <164375268492.118489.6662873828073732668.stgit@82dbe1ffb256>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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



On 2/1/22 18:58, Shivaprasad G Bhat wrote:
> If the device backend is not persistent memory for the nvdimm, there is
> need for explicit IO flushes on the backend to ensure persistence.
> 
> On SPAPR, the issue is addressed by adding a new hcall to request for
> an explicit flush from the guest when the backend is not pmem. So, the
> approach here is to convey when the hcall flush is required in a device
> tree property. The guest once it knows the device backend is not pmem,
> makes the hcall whenever flush is required.
> 
> To set the device tree property, a new PAPR specific device type inheriting
> the nvdimm device is implemented. When the backend doesn't have pmem=on
> the device tree property "ibm,hcall-flush-required" is set, and the guest
> makes hcall H_SCM_FLUSH requesting for an explicit flush. The new device
> has boolean property pmem-override which when "on" advertises the device
> tree property even when pmem=on for the backend. The flush function
> invokes the fdatasync or pmem_persist() based on the type of backend.
> 
> The vmstate structures are made part of the spapr-nvdimm device object.
> The patch attempts to keep the migration compatibility between source and
> destination while rejecting the incompatibles ones with failures.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr_nvdimm.c |  131 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 131 insertions(+)
> 
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index ed6fda2c23..8aa6214d6b 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -34,6 +34,7 @@
>   #include "block/thread-pool.h"
>   #include "migration/vmstate.h"
>   #include "qemu/pmem.h"
> +#include "hw/qdev-properties.h"
>   
>   /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c */
>   /* SCM device is unable to persist memory contents */
> @@ -57,6 +58,10 @@ OBJECT_DECLARE_TYPE(SpaprNVDIMMDevice, SPAPRNVDIMMClass, SPAPR_NVDIMM)
>   struct SPAPRNVDIMMClass {
>       /* private */
>       NVDIMMClass parent_class;
> +
> +    /* public */
> +    void (*realize)(NVDIMMDevice *dimm, Error **errp);
> +    void (*unrealize)(NVDIMMDevice *dimm, Error **errp);
>   };
>   
>   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> @@ -64,6 +69,8 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>   {
>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>       const MachineState *ms = MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm = PC_DIMM(nvdimm);
> +    MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
>       g_autofree char *uuidstr = NULL;
>       QemuUUID uuid;
>       int ret;
> @@ -101,6 +108,14 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>           return false;
>       }
>   
> +    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM) &&
> +        (memory_region_get_fd(mr) < 0)) {
> +        error_setg(errp, "spapr-nvdimm device requires the "
> +                   "memdev %s to be of memory-backend-file type",
> +                   object_get_canonical_path_component(OBJECT(dimm->hostmem)));
> +        return false;
> +    }
> +
>       return true;
>   }
>   
> @@ -172,6 +187,20 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
>                                "operating-system")));
>       _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL, 0));
>   
> +    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
> +        bool is_pmem = false, pmem_override = false;
> +        PCDIMMDevice *dimm = PC_DIMM(nvdimm);
> +        HostMemoryBackend *hostmem = dimm->hostmem;
> +
> +        is_pmem = object_property_get_bool(OBJECT(hostmem), "pmem", NULL);
> +        pmem_override = object_property_get_bool(OBJECT(nvdimm),
> +                                                 "pmem-override", NULL);
> +        if (!is_pmem || pmem_override) {
> +            _FDT(fdt_setprop(fdt, child_offset, "ibm,hcall-flush-required",
> +                             NULL, 0));
> +        }
> +    }
> +
>       return child_offset;
>   }
>   
> @@ -398,11 +427,21 @@ typedef struct SpaprNVDIMMDeviceFlushState {
>   
>   typedef struct SpaprNVDIMMDevice SpaprNVDIMMDevice;
>   struct SpaprNVDIMMDevice {
> +    /* private */
>       NVDIMMDevice parent_obj;
>   
> +    bool hcall_flush_required;
>       uint64_t nvdimm_flush_token;
>       QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_nvdimm_flush_states;
>       QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_nvdimm_flush_states;
> +
> +    /* public */
> +
> +    /*
> +     * The 'on' value for this property forced the qemu to enable the hcall
> +     * flush for the nvdimm device even if the backend is a pmem
> +     */
> +    bool pmem_override;
>   };
>   
>   static int flush_worker_cb(void *opaque)
> @@ -449,6 +488,23 @@ static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
>       SpaprNVDIMMDeviceFlushState *state;
>       HostMemoryBackend *backend = MEMORY_BACKEND(PC_DIMM(s_nvdimm)->hostmem);
>       ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
> +    bool is_pmem = object_property_get_bool(OBJECT(backend), "pmem", NULL);
> +    bool pmem_override = object_property_get_bool(OBJECT(s_nvdimm),
> +                                                  "pmem-override", NULL);
> +    bool dest_hcall_flush_required = pmem_override || !is_pmem;
> +
> +    if (!s_nvdimm->hcall_flush_required && dest_hcall_flush_required) {
> +        error_report("The file backend for the spapr-nvdimm device %s at "
> +                     "source is a pmem, use pmem=on and pmem-override=off to "
> +                     "continue.", DEVICE(s_nvdimm)->id);
> +        return -EINVAL;
> +    }
> +    if (s_nvdimm->hcall_flush_required && !dest_hcall_flush_required) {
> +        error_report("The guest expects hcall-flush support for the "
> +                     "spapr-nvdimm device %s, use pmem_override=on to "
> +                     "continue.", DEVICE(s_nvdimm)->id);
> +        return -EINVAL;
> +    }
>   
>       QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
>           state->backend_fd = memory_region_get_fd(&backend->mr);
> @@ -478,6 +534,7 @@ const VMStateDescription vmstate_spapr_nvdimm_states = {
>       .minimum_version_id = 1,
>       .post_load = spapr_nvdimm_flush_post_load,
>       .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(hcall_flush_required, SpaprNVDIMMDevice),
>           VMSTATE_UINT64(nvdimm_flush_token, SpaprNVDIMMDevice),
>           VMSTATE_QLIST_V(completed_nvdimm_flush_states, SpaprNVDIMMDevice, 1,
>                           vmstate_spapr_nvdimm_flush_state,
> @@ -607,7 +664,11 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
>       }
>   
>       dimm = PC_DIMM(drc->dev);
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_SPAPR_NVDIMM)) {
> +        return H_PARAMETER;
> +    }
>       if (continue_token == 0) {
> +        bool is_pmem = false, pmem_override = false;
>           backend = MEMORY_BACKEND(dimm->hostmem);
>           fd = memory_region_get_fd(&backend->mr);
>   
> @@ -615,6 +676,13 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
>               return H_UNSUPPORTED;
>           }
>   
> +        is_pmem = object_property_get_bool(OBJECT(backend), "pmem", NULL);
> +        pmem_override = object_property_get_bool(OBJECT(dimm),
> +                                                "pmem-override", NULL);
> +        if (is_pmem && !pmem_override) {
> +            return H_UNSUPPORTED;
> +        }
> +
>           state = spapr_nvdimm_init_new_flush_state(SPAPR_NVDIMM(dimm));
>           if (!state) {
>               return H_HARDWARE;
> @@ -789,3 +857,66 @@ static void spapr_scm_register_types(void)
>   }
>   
>   type_init(spapr_scm_register_types)
> +
> +static void spapr_nvdimm_realize(NVDIMMDevice *dimm, Error **errp)
> +{
> +    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(dimm);
> +    HostMemoryBackend *backend = MEMORY_BACKEND(PC_DIMM(dimm)->hostmem);
> +    bool is_pmem = object_property_get_bool(OBJECT(backend),  "pmem", NULL);
> +    bool pmem_override = object_property_get_bool(OBJECT(dimm), "pmem-override",
> +                                             NULL);
> +    if (!is_pmem || pmem_override) {
> +        s_nvdimm->hcall_flush_required = true;
> +    }
> +
> +    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
> +                     &vmstate_spapr_nvdimm_states, dimm);
> +}
> +
> +static void spapr_nvdimm_unrealize(NVDIMMDevice *dimm)
> +{
> +    vmstate_unregister(NULL, &vmstate_spapr_nvdimm_states, dimm);
> +}
> +
> +static Property spapr_nvdimm_properties[] = {
> +#ifdef CONFIG_LIBPMEM
> +    DEFINE_PROP_BOOL("pmem-override", SpaprNVDIMMDevice, pmem_override, false),
> +#endif
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void spapr_nvdimm_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    NVDIMMClass *nvc = NVDIMM_CLASS(oc);
> +
> +    nvc->realize = spapr_nvdimm_realize;
> +    nvc->unrealize = spapr_nvdimm_unrealize;
> +
> +    device_class_set_props(dc, spapr_nvdimm_properties);
> +}
> +
> +static void spapr_nvdimm_init(Object *obj)
> +{
> +    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(obj);
> +
> +    s_nvdimm->hcall_flush_required = false;
> +    QLIST_INIT(&s_nvdimm->pending_nvdimm_flush_states);
> +    QLIST_INIT(&s_nvdimm->completed_nvdimm_flush_states);
> +}
> +
> +static TypeInfo spapr_nvdimm_info = {
> +    .name          = TYPE_SPAPR_NVDIMM,
> +    .parent        = TYPE_NVDIMM,
> +    .class_init    = spapr_nvdimm_class_init,
> +    .class_size    = sizeof(SPAPRNVDIMMClass),
> +    .instance_size = sizeof(SpaprNVDIMMDevice),
> +    .instance_init = spapr_nvdimm_init,
> +};
> +
> +static void spapr_nvdimm_register_types(void)
> +{
> +    type_register_static(&spapr_nvdimm_info);
> +}
> +
> +type_init(spapr_nvdimm_register_types)
> 
> 

