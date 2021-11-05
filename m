Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38084466C2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:10:51 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1nm-0003c3-3U
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1fI-0003cb-51
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:02:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1fG-00014m-1U
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:02:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso6752080wme.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4/qDHoQKCyIvd3R7/2hpc784YTVyAPhUubyRhh4Bco=;
 b=a/QB+AjsN2rIhp2KCKWXai65eMyoiSA5IyXAjfSyHMTKV5sYVoE5Rx047FhSRY/ZlQ
 FoE7lK51dgJcmon1dGYGSs4el7PjvFyOJ/xLUeIeGHrUyvAcHlQ7c5UuTljZXRa0l6Hf
 lg4+2kjrHspwxXFJUzv9GzwpFbog6J5InJq0SstLRV8GuONU95rqh4dqttH1ykq0xl4i
 ioDaoR0gdMwZ/SQfJwwJkjklWbOZnLTgeg7YG87lauPFlyOHYuEHR84bEF4WKHKIx6l2
 a0Ei2zjexJy9qzK02VeCoNH6LGPsCVA+djF7L1uPDN6Btef88sAtxm1jTkb9yXoIQGz3
 ZPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4/qDHoQKCyIvd3R7/2hpc784YTVyAPhUubyRhh4Bco=;
 b=igIZDkjtijz7YALjyYq6nY+szByoBboI7kx0NGVZB+JvP59tRY0RoI4GUn8oxlUJn1
 0f16EcdrxZjyxha478ZZKUgf3W96QkXq4pvYhkT1OiBOcBou/Kw+QTk/sePjVa9hyAmk
 b3dWtODORt1vwBVCKwtjJN54BkvsyQnC5gJqZcnlSlbE2gXCutwPVHln/YCi/Xe2ih5F
 RNDH/+NSl4FP/TCGZKgJyJVWuNgdx1Er3GgW9xf2+crOGpXa5ZNSKr89ZT/YJOQg09r/
 9AuIL5eO1FvLz2Bcp+gkIU0gDYmwFzEOZObmfcMrf0EXZru3mRN3UBuVM4CxBbde8/tm
 Lrcg==
X-Gm-Message-State: AOAM530jVJDhj8VX9LVvuLQD1unTsCYa0HVb6p+EOOmdUgeGjPHOhDZG
 4bp21yHxBnNdhFF2Lrg2lUzvjkwsxh/7Zg3k6ecJ7A==
X-Google-Smtp-Source: ABdhPJwpl662yCu5NK5cijAieay285WQKo/nDfek3Vbd0Wwq97wejhxoTdW/lXR6GCcTM0Umc8KvUw0cssWLim4dI7c=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr31700673wmh.37.1636128120328; 
 Fri, 05 Nov 2021 09:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211102162619.2760593-1-kraxel@redhat.com>
 <20211102162619.2760593-4-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-4-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 16:01:48 +0000
Message-ID: <CAFEAcA8-m_+cYrvSzcRnQVjG-O2VfAsBLE8-YjSVF6jYpW38gQ@mail.gmail.com>
Subject: Re: [PULL 03/10] microvm: add device tree support.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 16:48, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Allows edk2 detect virtio-mmio devices and pcie ecam.
> See comment in hw/i386/microvm-dt.c for more details.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> Message-Id: <20211014193617.2475578-1-kraxel@redhat.com>


Hi; Coverity points out a couple of issues in this code.

> +static void dt_add_pcie(MicrovmMachineState *mms)
> +{
> +    hwaddr base = PCIE_MMIO_BASE;
> +    int nr_pcie_buses;
> +    char *nodename;
> +
> +    nodename = g_strdup_printf("/pcie@%" PRIx64, base);

Here we allocate 'nodename'...

> +    qemu_fdt_add_subnode(mms->fdt, nodename);
> +    qemu_fdt_setprop_string(mms->fdt, nodename,
> +                            "compatible", "pci-host-ecam-generic");
> +    qemu_fdt_setprop_string(mms->fdt, nodename, "device_type", "pci");
> +    qemu_fdt_setprop_cell(mms->fdt, nodename, "#address-cells", 3);
> +    qemu_fdt_setprop_cell(mms->fdt, nodename, "#size-cells", 2);
> +    qemu_fdt_setprop_cell(mms->fdt, nodename, "linux,pci-domain", 0);
> +    qemu_fdt_setprop(mms->fdt, nodename, "dma-coherent", NULL, 0);
> +
> +    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg",
> +                                 2, PCIE_ECAM_BASE, 2, PCIE_ECAM_SIZE);
> +    if (mms->gpex.mmio64.size) {
> +        qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "ranges",
> +
> +                                     1, FDT_PCI_RANGE_MMIO,
> +                                     2, mms->gpex.mmio32.base,
> +                                     2, mms->gpex.mmio32.base,
> +                                     2, mms->gpex.mmio32.size,
> +
> +                                     1, FDT_PCI_RANGE_MMIO_64BIT,
> +                                     2, mms->gpex.mmio64.base,
> +                                     2, mms->gpex.mmio64.base,
> +                                     2, mms->gpex.mmio64.size);
> +    } else {
> +        qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "ranges",
> +
> +                                     1, FDT_PCI_RANGE_MMIO,
> +                                     2, mms->gpex.mmio32.base,
> +                                     2, mms->gpex.mmio32.base,
> +                                     2, mms->gpex.mmio32.size);
> +    }
> +
> +    nr_pcie_buses = PCIE_ECAM_SIZE / PCIE_MMCFG_SIZE_MIN;
> +    qemu_fdt_setprop_cells(mms->fdt, nodename, "bus-range", 0,
> +                           nr_pcie_buses - 1);

...but unlike other functions in this file we forget to free it.
(CID 1465240)

Might be worth considering use of g_autofree.

> +}

> +void dt_setup_microvm(MicrovmMachineState *mms)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(mms);
> +    int size = 0;
> +
> +    mms->fdt = create_device_tree(&size);
> +
> +    /* root node */
> +    qemu_fdt_setprop_string(mms->fdt, "/", "compatible", "linux,microvm");
> +    qemu_fdt_setprop_cell(mms->fdt, "/", "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(mms->fdt, "/", "#size-cells", 0x2);
> +
> +    qemu_fdt_add_subnode(mms->fdt, "/chosen");
> +    dt_setup_sys_bus(mms);
> +
> +    /* add to fw_cfg */
> +    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
> +    fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
> +
> +    if (debug) {
> +        fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
> +        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);

g_file_set_contents() returns a value to indicate success or
failure; we should check it.
(CID 1465239)

> +        int ret = system("dtc -I dtb -O dts microvm.fdt");
> +        if (ret != 0) {
> +            fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
> +        }
> +    }
> +}

thanks
-- PMM

