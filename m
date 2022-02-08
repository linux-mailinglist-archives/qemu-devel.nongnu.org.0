Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A414AE212
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:17:43 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVzi-0004p9-Aw
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU5C-00028x-WF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:15:25 -0500
Received: from [2a00:1450:4864:20::42d] (port=36419
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU5A-00028M-Af
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:15:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i15so9610625wrb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjQT5QUlaqgWmBJx4Zpu/33cQPGzD4D1n8LGvCvoWME=;
 b=LrQ3xm3fpS9k44PBlEQnh4VpbCUAaDSOxK2CQ7S/srvtz6qSI4bZzONjZWG/E4l8E1
 ZebQkVGzfnn04h6tXOo9BB8mLsxfnhPLlQ5K8Mg5wWk+BHYiRmGvCB/CoX3w/1DZ0MTI
 cHHZKbmSz/yYF808BOQiw6wNZo8eduomCmF7HkoUVqBHnYQVmP4p4Sa8aKlcF7OHkuC2
 J7O97d/U6XjohXR5PtixzJU2Rf632Jj8ZffMiHZakvQTtvnjY99rXqwrMklGI/z2GuEO
 nuDa6G/Wgc7Sp0iSefMH52OAKpmKOBLZltt60DuqTmEyw9nrE14yxvM4AuNf+Yc+jvhw
 K5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjQT5QUlaqgWmBJx4Zpu/33cQPGzD4D1n8LGvCvoWME=;
 b=o+X+VDBukgIZzQbse7aqfcpVbhcH7wc1HKUTWRk8q7OOVfaA6v/s4EF/AxiCOy47cq
 8W6GP5Rh17HoQDPDaG7jqFXHZRvnd+IGhsBuwzbc0/dhu1N5EyDwmRiCN27AXhGGifeV
 4YrPXRz3eAiIMpr6sYq0VG9FN6MG98icc6SpRV3aRLbH5XR3kvgFFjNcNOIQs0ksZTnd
 HIl35c/WYGKCiFr8gnAYhSGCHfjuISHqV5pIkiBYTOw4RaCqQWPbg0qsvY+WIaxG0NyG
 vk2Q0FMvK25t0MW1rfq4hldM27g9Y4ggiSqHjDTDlwqGwClGCxD0T6d6ihfE8sLw6iMW
 DMrQ==
X-Gm-Message-State: AOAM533GYy7FHyWc1zvm0Pgh48zU7dun+VIrSL9Zp24iUfeBjj9hFA4D
 k4FDfVio19ZwCtOoBE+LARV0KsAkyhltkCIyNcp2Rg==
X-Google-Smtp-Source: ABdhPJyIbTtSEqURQSyRe9d47kQt4mDeBU4QhPzRM6oBEJyMzjLsP3yCiVKFTif5UiEectF9kTpugxpAOvkANYXD94I=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4528986wrz.2.1644340509950; 
 Tue, 08 Feb 2022 09:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
 <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
 <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
 <20220208093640.1b8a54f8.alex.williamson@redhat.com>
In-Reply-To: <20220208093640.1b8a54f8.alex.williamson@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 17:14:58 +0000
Message-ID: <CAFEAcA-CkDJ+sdmWv6DRc+v_9XnD0TgeRco6iUWUYLSoChgRsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: quintela@redhat.com, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, eric.auger@redhat.com,
 imammedo@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 16:36, Alex Williamson <alex.williamson@redhat.com> wrote:
>
> On Tue, 8 Feb 2022 16:01:48 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Well, it can if it likes, but "this is a RAM-backed MemoryRegion"
> > doesn't imply "this is really guest actual RAM RAM", so if it's
> > using that as its discriminator it should probably use something else.
> > What is it actually trying to do here ?
>
> VFIO is device agnostic, we don't understand the device programming
> model, we can't know how the device is programmed to perform DMA.  The
> only way we can provide transparent assignment of arbitrary PCI devices
> is to install DMA mappings for everything in the device AddressSpace
> through the system IOMMU.  If we were to get a sub-page RAM mapping
> through the MemoryListener and that mapping had the possibility of
> being a DMA target, then we have a problem, because we cannot represent
> that through the IOMMU.  If the device were to use that address for DMA,
> we'd likely have data loss/corruption in the VM.

This is true whether that small MR is RAM-backed or MMIO-backed
or RAM-backed and marked as being a "ram device", though,
isn't it ?

> AFAIK, and I thought we had some general agreement on this, declaring
> device memory as ram_device is the only means we have to differentiate
> MemoryRegion segments generated by a device from actual system RAM.

What do you mean by "generated by a device" here? Devices within
QEMU create MemoryRegions of all kinds; some of them are RAM-backed,
some of them are not.

memory_region_init_ram_device_ptr() is (per the documentation)
for when the backing device is a real host device that vfio is
wrapping to turn into a QEMU device.

tpm_crb is not a real host device, though -- it's an actually
emulated-by-QEMU device.

> For device memory, we can lean on the fact that peer-to-peer DMA is
> much more rare and likely involves some degree of validation by the
> drivers since it can be blocked on physical hardware due to various
> topology and chipset related issues.  Therefore we can consider
> failures to map device memory at a lower risk than failures to map
> ranges we think are actual system RAM.

Well, if it's not page aligned and at least page sized it's
a pretty reasonable guess that it's not system RAM...

thanks
-- PMM

