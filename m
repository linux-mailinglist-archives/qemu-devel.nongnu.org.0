Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED596DD7E3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:27:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBD6-0001pW-0y; Tue, 11 Apr 2023 06:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBCt-0001mD-Af
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBCn-000764-8T
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:31 -0400
Received: by mail-ej1-x635.google.com with SMTP id dm2so19140791ejc.8
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681208787; x=1683800787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WAXeslH+vCSlXptMwhCYKmiNeP/Uh6OGXpLOx53BLwY=;
 b=hM6mksx4TLJTwLUKOtrM4BuD6xwyKrQBLggBGr+/UAccX52mHj5bhEzDNkABjKbnGq
 9/YrRFdR01sEkrswt7kxsuyl5ZE2OLUOQxTekfmpBVLKSaEXcu+lfsIo9IOXmCwGlKac
 /xuwibJqzVimYMtRYEg5GuXJmrvGnLkvpXflrn1t9xtnyNagV41MIQx6kGLhTT3leUsR
 MEKoV07HaLyYuayuOVRyehxFOyvGUYQDCMuNwj8bqNtPBPih8qgf+8Sml6pb6rrdu6GQ
 cCY67Hbj9iVaoYrxeHmDinp2dilsvzd2eh0Lln36iZapHcr0YIXqEl4TGSljfmnMys9d
 l1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208787; x=1683800787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WAXeslH+vCSlXptMwhCYKmiNeP/Uh6OGXpLOx53BLwY=;
 b=3RaGA8+wvwzuMpJAL60XMkWOZbv/VAD+7EYFBItUgsTfkvqO66osZPx9tXt5bTMhMV
 vHvsBGPlo6dAgGOAUCSrAu4fVWqBYomzOo16vHK3TdKGQr0N84V4ozjwD+SH5Ycw/O2n
 zmI/odFkzEtuv/PS+Ge2mPCaQnrPUy01QYhjv02alC2VrNrCpsJRD7AeD/9vV7oJVkpE
 qJuX31Le76ZhzRM03BFk7KAVlAg0D8oMX59JvA5XFj8c8gzrmI/w32C19+Uz+EG0V/oG
 4zC8sZ9j2Yb2Z/xOKmxpWJ0xkQ7az8O34UObx25WzjD7RoRWjDRGjZlrx4SuMEI5coCC
 tu5w==
X-Gm-Message-State: AAQBX9feOEA+eWImoQ9FpzNTNjHPar4xdbPIKOV11aPqsfIIukwnRzqb
 TMP+fQWPoDZ9aIsL6iDXgqF7HK9/KjCMOGkfGCU4cg==
X-Google-Smtp-Source: AKy350Y3lF2/nuUj07ymzrXPiGZl+H3PfkzCHiU0MYaf9HL8cTyDYc03mVv94kNClXq8Y4J4mddQMFmbgCDkQKZUZPo=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5222662eje.6.1681208787456; Tue, 11 Apr
 2023 03:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
In-Reply-To: <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 11:26:16 +0100
Message-ID: <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Mar 2023 at 01:14, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> The CXL r3.0 specification allows for there to be no HDM decoders on CXL
> Host Bridges if they have only a single root port. Instead, all accesses
> directed to the host bridge (as specified in CXL Fixed Memory Windows)
> are assumed to be routed to the single root port.

Hi; in issue https://gitlab.com/qemu-project/qemu/-/issues/1586
it's been pointed out that this commit causes an assertion
failure during 'make check' if you configure with
--enable-qom-cast-debug. You can repro by doing that and running:

 qemu-system-i386 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0

Here's a backtrace:

Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
__pthread_kill_implementation (no_tid=0, signo=6,
threadid=140737217810816) at ./nptl/pthread_kill.c:44
44      ./nptl/pthread_kill.c: No such file or directory.
(gdb) bt
#0  __pthread_kill_implementation (no_tid=0, signo=6,
threadid=140737217810816) at ./nptl/pthread_kill.c:44
#1  __pthread_kill_internal (signo=6, threadid=140737217810816) at
./nptl/pthread_kill.c:78
#2  __GI___pthread_kill (threadid=140737217810816,
signo=signo@entry=6) at ./nptl/pthread_kill.c:89
#3  0x00007ffff4b1c476 in __GI_raise (sig=sig@entry=6) at
../sysdeps/posix/raise.c:26
#4  0x00007ffff4b027f3 in __GI_abort () at ./stdlib/abort.c:79
#5  0x0000555555cecfab in object_dynamic_cast_assert
    (obj=obj@entry=0x555557a70b60, typename=0x555555f80406 "pxb",
file=0x555555f80357 "../../hw/pci-bridge/pci_expander_bridge.c",
line=line@entry=55, func=0x555555f8040a "PXB_DEV") at
../../qom/object.c:890
#6  0x00005555559c7bbd in PXB_DEV (obj=0x555557a70b60) at
../../hw/pci-bridge/pci_expander_bridge.c:54
#7  pxb_cxl_dev_reset (dev=0x555557a70b60) at
../../hw/pci-bridge/pci_expander_bridge.c:314
#8  0x00005555559bd624 in pci_qdev_realize (qdev=0x555557a70b60,
errp=0x7fffffffdd28) at ../../hw/pci/pci.c:2098
#9  0x0000555555ce8ada in device_set_realized (obj=<optimised out>,
value=true, errp=0x7fffffffdea8) at ../../hw/core/qdev.c:510
#10 0x0000555555cf0219 in property_set_bool
     (obj=obj@entry=0x555557a70b60, v=v@entry=0x555557a727b0,
name=name@entry=0x55555601db04 "realized", opaque=0x55555687b780,
errp=errp@entry=0x7fffffffdea8) at ../../qom/object.c:2285
#11 0x0000555555cee4e5 in object_property_set
     (obj=obj@entry=0x555557a70b60, name=name@entry=0x55555601db04
"realized", v=0x555557a727b0, errp=errp@entry=0x7fffffffdea8) at
../../qom/object.c:1420
#12 0x0000555555cf23cd in object_property_set_qobject
    (obj=obj@entry=0x555557a70b60, name=name@entry=0x55555601db04
"realized", value=<optimised out>, errp=errp@entry=0x7fffffffdea8) at
../../qom/qom-qobject.c:28
#13 0x0000555555cee93b in object_property_set_bool
(obj=0x555557a70b60, name=0x55555601db04 "realized", value=<optimised
out>, errp=0x7fffffffdea8)
    at ../../qom/object.c:1489
#14 0x0000555555a6ae42 in qdev_device_add_from_qdict
(opts=0x555557a6fb40, from_json=false, errp=0x7fffffffdea8,
errp@entry=0x555556765830 <error_fatal>)
    at ../../softmmu/qdev-monitor.c:714
#15 0x0000555555a6b202 in qdev_device_add
(opts=opts@entry=0x5555568776f0, errp=errp@entry=0x555556765830
<error_fatal>) at ../../softmmu/qdev-monitor.c:733
#16 0x0000555555a7367f in device_init_func (opaque=opaque@entry=0x0,
opts=0x3cd16a, opts@entry=0x5555568776f0, errp=0x6,
errp@entry=0x555556765830 <error_fatal>)
    at ../../softmmu/vl.c:1140
#17 0x0000555555e78331 in qemu_opts_foreach
    (list=<optimised out>, func=0x555555a73670 <device_init_func>,
opaque=opaque@entry=0x0, errp=0x555556765830 <error_fatal>) at
../../util/qemu-option.c:1135
#18 0x0000555555a6dd61 in qemu_create_cli_devices () at ../../softmmu/vl.c:2542
#19 qmp_x_exit_preconfig (errp=<optimised out>) at ../../softmmu/vl.c:2610
#20 0x0000555555a7177b in qemu_init (argc=<optimised out>,
argv=<optimised out>) at ../../softmmu/vl.c:3612
#21 0x000055555587b656 in main (argc=3985770, argv=0x3cd16a) at
../../softmmu/main.c:47

The problem is here:

> -static void pxb_dev_reset(DeviceState *dev)
> +static void pxb_cxl_dev_reset(DeviceState *dev)

This function is called from  pxb_cxl_dev_realize(),
which is the realize function for TYPE_PXB_CXL_DEVICE.
That type's parent is TYPE_PCI_DEVICE.

>  {
>      CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
>      CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
> +    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
>      uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
>      uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
> +    int dsp_count = 0;
>
>      cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
> -    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
> +    /*
> +     * The CXL specification allows for host bridges with no HDM decoders
> +     * if they only have a single root port.
> +     */
> +    if (!PXB_DEV(dev)->hdm_for_passthrough) {

However, here we try to cast the device pointer to PXB_DEV.
That is not permitted because dev is not of type TYPE_PXB_DEVICE
(either directly or as a parent class). So if you have the QOM
debugging enabled then the attempt to cast causes an assertion
failure.

> +        dsp_count = pcie_count_ds_ports(hb->bus);
> +    }
> +    /* Initial reset will have 0 dsp so wait until > 0 */
> +    if (dsp_count == 1) {
> +        cxl->passthrough = true;
> +        /* Set Capability ID in header to NONE */
> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
> +    } else {
> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
> +                         8);
> +    }
>  }

What was the intention here with the type hierarchy?
Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
or should the cxl-related functions not be trying to treat
it as a PXB device ?

thanks
-- PMM

