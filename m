Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7B653E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IyE-00077v-9o; Thu, 22 Dec 2022 05:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8Iy9-00075H-Rs
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:38:36 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8Iy7-0004wr-P4
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:38:33 -0500
Received: by mail-ej1-x62c.google.com with SMTP id m18so3936794eji.5
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 02:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBwdz3SWAosWofQZRcTOH5to9x1zR5sjSx1X2R8ons0=;
 b=auVDAXnWoFSbgEGOC/SRJhxQkrvERKK8DCYvOclsiXSjH0MSbjc+FUjnnxoilCfjL0
 Moybig+oRmKMeigNZyHTa5o5GnGojePjkAmi2SDEUeOucDZW/jHspylY353Y7S46LzM4
 pU5xxakgszQrkNTtckgGqfgmutW/b0P9XsduVUgrFK1tIlDuEK2FIRTEa+iXMe5fdQbs
 llEXGJ8Se5uIPGRps+ooDN95+28pAUqxCL4A7bK3POf354zbpGo44eQN/iEMXX2viIXo
 iVYHmvgSMypGUPPUK8X6Qab+mOYRkmhK/F5SfCpXgxEUbxkHmZuE2EWmD3jEp3ry7i4E
 s4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBwdz3SWAosWofQZRcTOH5to9x1zR5sjSx1X2R8ons0=;
 b=66a8VK9oS39f2yT0upDaWb+RlE2J0LQ2edbaNYqRL7tWh4wpUEzghRNkiHqyLrf+Q4
 nmdYxLUyv2DUC2+e/dd5nrtBSvP/rzP1GL1O8EGV2WbVPm25KWJU2WcKXC/03Dj7gvHD
 6BHX7Fg6AcCXIQ4iSEbDLQus10uo+8+RU7xa/hG7ihvHxPii1+ya9qi/2bbaqTsea5LF
 ufclP893GbjI6Dt8DRXRzymFYgXVWe5FRaxkavC4/ahVGFWliUZNvpRx2Wwji1Z78GIB
 i6W2O2D+Fb/egwSRUv/qpVb1lPI4rnjEWgETs7Nu67HVaQqay/H9ZgNcjicV8UxMD2Ps
 6sZg==
X-Gm-Message-State: AFqh2koek7h9+vzPmX9UQeCKfr0xVTxys3pq5gcmGTvX21knslyGvm9w
 FTnSBbyLTiKulHz5zyGD1JVsXYf+AKk=
X-Google-Smtp-Source: AMrXdXttzRIlGfF5m+zvrYi+TpoTrI6bTi/y3nTpJL2Cb98ReahNDdNF2yszbncWQT/UWwKep3cQ6A==
X-Received: by 2002:a17:907:cbc7:b0:821:8a4c:a3d4 with SMTP id
 vk7-20020a170907cbc700b008218a4ca3d4mr4941006ejc.14.1671705509938; 
 Thu, 22 Dec 2022 02:38:29 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-161-124.92.224.pool.telefonica.de.
 [92.224.161.124]) by smtp.gmail.com with ESMTPSA id
 kv3-20020a17090778c300b007c00323cc23sm112386ejc.27.2022.12.22.02.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:38:29 -0800 (PST)
Date: Thu, 22 Dec 2022 10:38:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: mst@redhat.com, marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
In-Reply-To: <20221222100330.380143-1-armbru@redhat.com>
References: <20221222100330.380143-1-armbru@redhat.com>
Message-ID: <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 22=2E Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redh=
at=2Ecom>:
>Back in 2016, we discussed[1] rules for headers, and these were
>generally liked:
>
>1=2E Have a carefully curated header that's included everywhere first=2E =
 We
>   got that already thanks to Peter: osdep=2Eh=2E
>
>2=2E Headers should normally include everything they need beyond osdep=2E=
h=2E
>   If exceptions are needed for some reason, they must be documented in
>   the header=2E  If all that's needed from a header is typedefs, put
>   those into qemu/typedefs=2Eh instead of including the header=2E
>
>3=2E Cyclic inclusion is forbidden=2E

Sounds like these -- useful and sane -- rules belong in QEMU's coding styl=
e=2E What about putting them there for easy reference?

Best regards,
Bernhard

>After this series, include/hw/pci and include/hw/cxl conform to these
>rules=2E
>
>It is based on
>
>    [PATCH v2 0/3] block: Clean up includes
>    [PATCH v3 0/5] coroutine: Clean up includes
>
>v2:
>* Rebased
>* PATCH 1: Actually breaks an inclusion loop; commit message rephrased
>  accordingly
>* PATCH 2: New [Jonathan]
>* PATCH 5: tests/qtest/fuzz/generic_fuzz=2Ec fixed [Michael]
>* PATCH 6: Inclusion of cxl_pci=2Eh into cxl_cdat_h kept, commit message
>  adjusted [Jonathan]
>
>[1] Message-ID: <87h9g8j57d=2Efsf@blackfin=2Epond=2Esub=2Eorg>
>    https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2016-03/msg03345=
=2Ehtml
>
>Based-on: <20221221133551=2E3967339-1-armbru@redhat=2Ecom>
>
>Markus Armbruster (7):
>  include/hw/pci: Break inclusion loop pci_bridge=2Eh and cxl=2Eh
>  include/hw/cxl: Move typedef PXBDev to cxl=2Eh, and put it to use
>  include/hw/cxl: Include hw/cxl/*=2Eh where needed
>  include/hw/pci: Clean up a few things checkpatch=2Epl would flag
>  include/hw/pci: Split pci_device=2Eh off pci=2Eh
>  include/hw/pci: Include hw/pci/pci=2Eh where needed
>  include/hw/cxl: Break inclusion loop cxl_pci=2Eh and cxl_cdat_h
>
> hw/alpha/alpha_sys=2Eh                |   1 -
> hw/display/ati_int=2Eh                |   2 +-
> hw/display/qxl=2Eh                    |   3 +-
> hw/ide/ahci_internal=2Eh              |   2 +-
> hw/net/vmxnet3_defs=2Eh               |   2 +-
> hw/nvme/nvme=2Eh                      |   2 +-
> hw/rdma/rdma_utils=2Eh                |   1 -
> hw/rdma/vmw/pvrdma=2Eh                |   2 +-
> hw/scsi/mptsas=2Eh                    |   2 +-
> hw/usb/hcd-ehci=2Eh                   |   3 +-
> hw/usb/hcd-uhci=2Eh                   |   2 +-
> hw/usb/hcd-xhci-pci=2Eh               |   1 +
> hw/vfio/pci=2Eh                       |   2 +-
> hw/xen/xen_pt=2Eh                     |   1 -
> include/hw/acpi/piix4=2Eh             |   2 +-
> include/hw/arm/allwinner-a10=2Eh      |   1 +
> include/hw/cxl/cxl=2Eh                |   5 +-
> include/hw/cxl/cxl_cdat=2Eh           |   1 +
> include/hw/cxl/cxl_component=2Eh      |   1 +
> include/hw/cxl/cxl_device=2Eh         |   2 +
> include/hw/cxl/cxl_pci=2Eh            |   3 -
> include/hw/i386/ich9=2Eh              |   4 -
> include/hw/i386/x86-iommu=2Eh         |   1 -
> include/hw/ide/pci=2Eh                |   2 +-
> include/hw/isa/vt82c686=2Eh           |   1 -
> include/hw/misc/macio/macio=2Eh       |   2 +-
> include/hw/pci-host/designware=2Eh    |   3 -
> include/hw/pci-host/gpex=2Eh          |   2 +-
> include/hw/pci-host/i440fx=2Eh        |   2 +-
> include/hw/pci-host/ls7a=2Eh          |   2 -
> include/hw/pci-host/pnv_phb3=2Eh      |   2 -
> include/hw/pci-host/pnv_phb4=2Eh      |   3 +-
> include/hw/pci-host/q35=2Eh           |   2 +-
> include/hw/pci-host/sabre=2Eh         |   2 +-
> include/hw/pci-host/xilinx-pcie=2Eh   |   1 -
> include/hw/pci/msi=2Eh                |   2 +-
> include/hw/pci/pci=2Eh                | 341 ---------------------------
> include/hw/pci/pci_bridge=2Eh         |   3 +-
> include/hw/pci/pci_device=2Eh         | 350 ++++++++++++++++++++++++++++
> include/hw/pci/pcie=2Eh               |   1 -
> include/hw/pci/pcie_port=2Eh          |   1 +
> include/hw/pci/pcie_sriov=2Eh         |   2 +
> include/hw/pci/shpc=2Eh               |   2 +-
> include/hw/remote/iohub=2Eh           |   2 +-
> include/hw/remote/proxy=2Eh           |   2 +-
> include/hw/sd/sdhci=2Eh               |   2 +-
> include/hw/southbridge/piix=2Eh       |   3 +-
> include/hw/virtio/virtio-scsi=2Eh     |   1 -
> include/hw/xen/xen_common=2Eh         |   2 +-
> hw/acpi/erst=2Ec                      |   2 +-
> hw/alpha/pci=2Ec                      |   1 +
> hw/alpha/typhoon=2Ec                  |   2 +-
> hw/audio/ac97=2Ec                     |   2 +-
> hw/audio/es1370=2Ec                   |   2 +-
> hw/audio/via-ac97=2Ec                 |   2 +-
> hw/char/serial-pci-multi=2Ec          |   2 +-
> hw/char/serial-pci=2Ec                |   2 +-
> hw/core/qdev-properties-system=2Ec    |   1 +
> hw/display/bochs-display=2Ec          |   2 +-
> hw/display/cirrus_vga=2Ec             |   2 +-
> hw/display/sm501=2Ec                  |   2 +-
> hw/display/vga-pci=2Ec                |   2 +-
> hw/display/vmware_vga=2Ec             |   2 +-
> hw/i386/acpi-build=2Ec                |   2 +-
> hw/i386/xen/xen_pvdevice=2Ec          |   2 +-
> hw/ipack/tpci200=2Ec                  |   2 +-
> hw/ipmi/pci_ipmi_bt=2Ec               |   2 +-
> hw/ipmi/pci_ipmi_kcs=2Ec              |   2 +-
> hw/isa/i82378=2Ec                     |   2 +-
> hw/mips/gt64xxx_pci=2Ec               |   2 +-
> hw/misc/pci-testdev=2Ec               |   2 +-
> hw/misc/pvpanic-pci=2Ec               |   2 +-
> hw/net/can/can_kvaser_pci=2Ec         |   2 +-
> hw/net/can/can_mioe3680_pci=2Ec       |   2 +-
> hw/net/can/can_pcm3680_pci=2Ec        |   2 +-
> hw/net/can/ctucan_pci=2Ec             |   2 +-
> hw/net/e1000=2Ec                      |   2 +-
> hw/net/e1000x_common=2Ec              |   2 +-
> hw/net/eepro100=2Ec                   |   2 +-
> hw/net/ne2000-pci=2Ec                 |   2 +-
> hw/net/net_tx_pkt=2Ec                 |   2 +-
> hw/net/pcnet-pci=2Ec                  |   2 +-
> hw/net/rocker/rocker=2Ec              |   2 +-
> hw/net/rocker/rocker_desc=2Ec         |   2 +-
> hw/net/rtl8139=2Ec                    |   2 +-
> hw/net/sungem=2Ec                     |   2 +-
> hw/net/sunhme=2Ec                     |   2 +-
> hw/net/tulip=2Ec                      |   2 +-
> hw/net/virtio-net=2Ec                 |   2 +-
> hw/pci-bridge/i82801b11=2Ec           |   2 +-
> hw/pci-bridge/pci_expander_bridge=2Ec |   1 -
> hw/pci-host/bonito=2Ec                |   2 +-
> hw/pci-host/dino=2Ec                  |   2 +-
> hw/pci-host/grackle=2Ec               |   2 +-
> hw/pci-host/mv64361=2Ec               |   2 +-
> hw/pci-host/ppce500=2Ec               |   2 +-
> hw/pci-host/raven=2Ec                 |   2 +-
> hw/pci-host/sh_pci=2Ec                |   2 +-
> hw/pci-host/uninorth=2Ec              |   2 +-
> hw/pci-host/versatile=2Ec             |   2 +-
> hw/pci/pci-hmp-cmds=2Ec               |   1 +
> hw/pci/pcie_host=2Ec                  |   2 +-
> hw/pci/pcie_sriov=2Ec                 |   2 +-
> hw/pci/slotid_cap=2Ec                 |   2 +-
> hw/ppc/ppc440_pcix=2Ec                |   2 +-
> hw/ppc/ppc4xx_pci=2Ec                 |   2 +-
> hw/ppc/spapr_pci_vfio=2Ec             |   1 +
> hw/rdma/rdma_utils=2Ec                |   1 +
> hw/s390x/s390-pci-inst=2Ec            |   1 +
> hw/scsi/esp-pci=2Ec                   |   2 +-
> hw/scsi/lsi53c895a=2Ec                |   2 +-
> hw/scsi/virtio-scsi=2Ec               |   1 +
> hw/smbios/smbios=2Ec                  |   1 +
> hw/usb/hcd-ohci-pci=2Ec               |   2 +-
> hw/watchdog/wdt_i6300esb=2Ec          |   2 +-
> tests/qtest/fuzz/generic_fuzz=2Ec     |   1 +
> ui/util=2Ec                           |   2 +-
> 117 files changed, 455 insertions(+), 455 deletions(-)
> create mode 100644 include/hw/pci/pci_device=2Eh
>

