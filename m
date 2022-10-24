Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7360A2FC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:49:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omuwn-0003e1-Pk; Mon, 24 Oct 2022 06:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuwU-0003L2-Rx
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:44:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuwT-0000Wv-2g
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:44:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id j12so8111636plj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 03:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFHNi702xiOrQEjdRWPTxj18nMDBBuWCBv38SKJyZp0=;
 b=eJjkj7JiP/12adO7fj4YTxW0srxpSiJkKYycfIBPdQDHELf/ErH3aWL4t8s0RPqCbd
 edwN7Cv0D3C+Xw9x42iA86Bj3iXD19RyFESZNXB5QYYq7KH29b69mN3Vcl37CP61xmvn
 e43ZbUieJi67WKj5sA6u3LVtu13/uwcVpaW/kn+e7BQ/KxVpn06Psq94dD6DimNw7UUG
 aYVHn0dRKAKrzoiXqrfvvwa1XyUj8cT5OOxOn/iiFTHLnaNGC0N2i6eSh9WeuNxFJLdS
 ydswoZj/aRFch9iVRfben/9NRzvtwU5qCJa6UqyBJOmWB2e+pxAR4ZXSXVf5EL0KQvGu
 2I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFHNi702xiOrQEjdRWPTxj18nMDBBuWCBv38SKJyZp0=;
 b=p3Bz0953NNHS0f13xRNmAVaSo0ev4PzoaR7nV9tmjEAMffSg3PXNBuUsmePBwdxYx4
 +jryBhCyfdOoE954/kcBjboDZpSk+nFRd8Q0J/jQCg76OkD379D8YuicO1Ce2qZznJfR
 wksmvnYuwRZG5DptJJarRCPcrjmcVYytm6k0UFxMzGWmWtKUwrAWnvY7xJGQRUfB1CQO
 R4Xnro+bRBSRj87gs/vGWYDeFafYy+8Aq9NJ18IbrG5WDzxh0gCH2pZ5enJV5PDFNAkw
 +SeE5g5DiNdsiUQHoVzeMtQWMM+YmZkqgjLuUciAdeEo7kVhjGGXzCsrmvaeqcFPCSAp
 3uSQ==
X-Gm-Message-State: ACrzQf36mNrURSJeh///+TBcrYTiNyzXialUe7GQEW54Gl6zdbHR9nT8
 soy6uGiqkiIxMgQTlLFCl0IWVXiLc9AYuIJPjCwB8w==
X-Google-Smtp-Source: AMsMyM52aNAgnUyXKPL3Xsin7v8C1KUhKax8EvRsv98I0lT8wLnwyXPvq/kDT4GvIU7F7v7ZWGryNsmjCfoxffGZrTs=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr33131206plr.168.1666608263357; Mon, 24
 Oct 2022 03:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-8-jean-philippe@linaro.org>
 <CAFEAcA8_mLVgvorF12qBMAW5NoZT2mXAzjfavCbDtcZjzcprow@mail.gmail.com>
 <5641321a-4bec-2ca9-bb14-d5ed883a9ded@redhat.com> <Y1Kts+K0WiHs7b8A@myrica>
In-Reply-To: <Y1Kts+K0WiHs7b8A@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 11:44:11 +0100
Message-ID: <CAFEAcA8t0BRyXvdEVqmj0v8jQsVAN_gVTD5qcRJ1Rn3UGg_kxg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Oct 2022 at 15:33, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Tue, Sep 27, 2022 at 04:35:25PM +0200, Eric Auger wrote:
> > >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > >> index 2de16f6324..5e16d54bbb 100644
> > >> --- a/hw/arm/virt.c
> > >> +++ b/hw/arm/virt.c
> > >> @@ -1372,14 +1372,15 @@ static void create_smmu(const VirtMachineState *vms,
> > >>
> > >>  static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
> > >>  {
> > >> -    const char compat[] = "virtio,pci-iommu";
> > >> +    const char compat[] = "virtio,pci-iommu\0pci1af4,1057";
> > >>      uint16_t bdf = vms->virtio_iommu_bdf;
> > >
> > > PCI_DEVICE_ID_VIRTIO_IOMMU is listed in include/hw/pci/pci.h
> > > as 0x1014, so where does 1057 come from? (This is a hex value,
> > > right?)
> > the virtio spec states:
> > The PCI Device ID is calculated by adding 0x1040 to the Virtio Device ID
> > (this IOMMU device ID is 0d23 = 0x17 for the virtio-iommu device, also
> > found in include/uapi/linux/virtio_ids.h) so 0x1057 above looks correct
> >
> > note that in docs/specs/pci-ids.txt there are a bunch of other device
> > ids not documented (virtio-mem, pmem)
> >
> > What I don't get anymore is the device id in qemu include/hw/pci/pci.h
>
> Yes 0x1057 is the right device ID, and it matches what the
> virtio-iommu-pci device gets in hw/virtio/virtio-pci.c:1691.
> The wrong 0x1014 value set by hw/virtio/virtio-iommu-pci.c:78 gets
> overwritten since virtio-iommu is modern only. I can send a patch to
> remove it.
>
> Peter, do you mind taking this patch as well, or should I resend it?

Sure, I've applied this one to target-arm.next.

-- PMM

