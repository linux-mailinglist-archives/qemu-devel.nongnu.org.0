Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17F426D78
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:27:48 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrml-00008B-2y
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrkL-0007Q5-W0
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:25:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrkJ-0005Ec-GI
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:25:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id r7so30888380wrc.10
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VNabXKhYcjV6fLHI6e8xkRNQIZAKA0eLj8zphGSrurc=;
 b=Rn4i3PVocIZ3oR/exvO4kdZRtTy4hXBMWkKGMR/6noeQxRH4+bu4MEC2+rx0rtXskI
 bHXBjjkZBk4LDQgM+fJg3kcuWWe2vo4KzpbTH9QEYQKTuoVaAo6v5P5d8HurWIZPSvMc
 WSmzfOsvYJi2Yq2yeoSpuLt+KobWRpnLvTjz9O9ba+fT/VKu8aavpcE8bpejtheqcUDM
 gmVG/dPzon5lxGywkdpUP2Wzb2Nsvshvd8W6JqSOJBYhgG4entmkFzgq0jv5GDNGBGao
 /sZY12BGzEZa+/P2NxVcqgkbUfwJnD83ZuUAQeJo3u8HOBXQYdqQbjgPuyg7m+KlbGVR
 yCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VNabXKhYcjV6fLHI6e8xkRNQIZAKA0eLj8zphGSrurc=;
 b=bciy1bm6SAVKuW99nTJNDM2fePX/M1aqKGChOc9BmWO1t1V5G0HMPNgcH+77vCUKP3
 Hb1KeG5pB7FMwbxEiArpMLnPETEvUxOexrlH4tZPLmLeSkeMNsRuilEOe45rRFmpNBtS
 IWUSXqZE07BkhqGT6GjDXnV+tq+nFqcNz3TSGYF4sXmjPZoaTWcTSA86oLxL2Nl36Lal
 hHpFwO5nfBb7njAWOZFUfqBf8pg4G2D3kBe4gui2cQX2irfTQ8/iPwy5HfW53W+p2iUs
 pLDdz0dlqKNYeicN2fDwExflXQjkb1spdT/c1Y77m3Vh49wkvU7unxAjwAY2iBrls8Q0
 bhBw==
X-Gm-Message-State: AOAM531mGOcQq6q1UfgGEADgonB6x7eaqScbA660P02g76oP9Ina94Lr
 2xkhcDDmwLv/MaH5So9mKrPfPw==
X-Google-Smtp-Source: ABdhPJz09qSyllhY/6pbiuBe7KZeNknPIHUyHOi8v6etg9z2LLagMtQF7OsAakaEyPi69lTaIl4/wQ==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr4926818wrc.201.1633706713581; 
 Fri, 08 Oct 2021 08:25:13 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id g188sm2880849wmg.46.2021.10.08.08.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:25:13 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:24:50 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Message-ID: <YWBiwiyrLfDYiZNC@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-8-jean-philippe@linaro.org>
 <20211006091954.79fd0a8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006091954.79fd0a8d@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 09:19:54AM +0200, Igor Mammedov wrote:
> > @@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
> >  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >                                            DeviceState *dev, Error **errp)
> >  {
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> > -        x86_iommu_get_default()) {
> > +    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> > +
> > +    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
> > +         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
> > +        (x86_iommu_get_default() || pcms->virtio_iommu)) {
> 
> this check is getting uglier,
> may be instead of introducing pcms->virtio_iommu boolean, better approach
> would be adding 'Device* PCMachineState::iommu' and setting it to IOMMU
> so the check would reduce to:
>       if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
>            object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)))
>       {
>           if (pcms->iommu)
>             err
>           else set pcms->iommu in plug handler or here
>       }
>       
> that also will let to cleanup/get rid of x86_iommu_[s|g]et_default()
> and x86_iommu_default 'global'.
> Maybe replace previous patch with one that would remove
> x86_iommu_[s|g]et_default().

Ok, I can't figure out a nice way to do this at the moment, will think
more about it. Callers of x86_iommu_get_default() still need a helper, and
most but not all assume that the returned object is for IRQ remapping. At
least adding Device *iommu to pcms should be nicer, but not sure about
removing the x86_iommu_get/set_default helpers.

Thanks,
Jean


