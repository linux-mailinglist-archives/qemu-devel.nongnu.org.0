Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588F15927B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 16:03:01 +0100 (CET)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1X40-0003UN-8I
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 10:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X2I-0002Qa-5K
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X2D-0001NM-0b
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:01:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1X2C-0001LH-Qn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:01:08 -0500
Received: by mail-ot1-x341.google.com with SMTP id r16so10408193otd.2
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dg1ZntJ0odfx180IJjC55r3FJw7O0CbXboN/z9izZtg=;
 b=ZbWY/js4jQMacsZFsWv5G8TNEnWVvuqzuppI+3TcFBeV1KCNpdBuhVAbLu31Ggj4Uo
 5PmODA4bBODolEJgisU3YhsHTMPgl/ri97q4DTDn9nlP1liNT7UpDwTio16Tdh5JNmpU
 Ady9znQl1ukSO+zIe2foezD+PEwZkeHsNbvFZBLcCSmu6mlc0xYHXTcTD8xgbV9vCzyS
 +5JK84rAGqx0/Hu1m2hbJCaPVoS/ijCcdO1K6EnhwabrPy8aZxw5NdlUakaw0XJ0EoIO
 keSN67J5pYE08mpVp3isdYySI6sSBKxR4UviIoTimUA4BATSHUo2HLhGk72lRzRN80Ht
 IRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dg1ZntJ0odfx180IJjC55r3FJw7O0CbXboN/z9izZtg=;
 b=MDE76j4wa63xlf5R6M2fSF51Ng/U4Lxima5He85vzsHCufnMxcfL51JIgoifrStaDp
 qz2LyP9AuOft7QVevP77zyodXSzvA5nG4tSZsIqcP8SiqCj8gLgfkuEkWv0L91UiwAoV
 WrLPInmSWRxboHiOlYeDyX+v6SZgokQih+exUoMbLMBddbtDG5qqXqXquJ7gYZYJWIWD
 3EKTgXIAWXlFlrRl83+mJb+zVB5CL/FjNwTOg7VU37DA/U7yBjYOnXwdBUkVFnGL2I1l
 +12lJI1KrdHNTHtOc9kJeOPdSy6hBffMBc5K9QCMafBMK81Igp1yWEKhhF9EA0XB6Sn6
 eVZw==
X-Gm-Message-State: APjAAAUgFbGldsD3ihwf2aePjkcTaCBiNc/Mdp1OjG6YkmGSYCqT0Cit
 Jg8fYjvzigjOkznWKzUrwLVV9X5yX7mnxjQApuYfLQ==
X-Google-Smtp-Source: APXvYqzeKT77mFKTHJYuy1tMqAp/nRGPgcWAr8uk1Tc6Wpyr3MaMt/pgxlTAz4vNs1gkZ11AGwsiQtXiUAZ22J7KmCc=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr5186494otq.97.1581433267780; 
 Tue, 11 Feb 2020 07:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-9-eric.auger@redhat.com>
In-Reply-To: <20200208120022.1920-9-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 15:00:56 +0000
Message-ID: <CAFEAcA-n97LKaQo9haLdEv+c7k8QkK=LegP_gORr9z4WrBU2Ww@mail.gmail.com>
Subject: Re: [PATCH v15 8/9] hw/arm/virt: Add the virtio-iommu device tree
 mappings
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, "Tian, Kevin" <kevin.tian@intel.com>,
 tnowicki@marvell.com, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Feb 2020 at 12:01, Eric Auger <eric.auger@redhat.com> wrote:
>
> Adds the "virtio,pci-iommu" node in the host bridge node and
> the RID mapping, excluding the IOMMU RID.
>
> This is done in the virtio-iommu-pci hotplug handler which
> gets called only if no firmware is loaded or if -no-acpi is
> passed on the command line. As non DT integration is
> not yet supported by the kernel we must make sure we
> are in DT mode. This limitation will be removed as soon
> as the topology description feature gets supported.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> +static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
> +{
> +    const char compat[] = "virtio,pci-iommu";
> +    uint16_t bdf = vms->virtio_iommu_bdf;
> +    char *node;
> +
> +    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
> +
> +    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
> +    qemu_fdt_add_subnode(vms->fdt, node);
> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
> +                                 1, bdf << 8, 1, 0, 1, 0,
> +                                 1, 0, 1, 0);
> +
> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
> +    g_free(node);
> +
> +    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
> +                           0x0, vms->iommu_phandle, 0x0, bdf,
> +                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
> +}

This function name implies that we're creating the IOMMU device
here (which would be a weird thing to do in a hotplug callback
for some other device), but it looks like we're only adding
device tree nodes ?

Given that we write the FDT blob into the guest RAM on bootup,
how does making changes to it here on hotplug (which I assume
to be 'after boot, whenever the user hot-plugs something') work?

thanks
-- PMM

