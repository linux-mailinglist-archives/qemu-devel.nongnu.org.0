Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F74394CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:26:45 +0200 (CEST)
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mey7n-0002l1-Jg
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mey5M-0001lv-JR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:24:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mey5K-0005Y1-NX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:24:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p14so6223163wrd.10
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f/BAa9sp94NqKP5B4c9amJsD3bi6NZ608OY5VYA4uqE=;
 b=o1OGSyCJNkg1a7pxKx9kbTn9TVAJuVA8ju/EIaC8BXlVnigqhnzGL7/MJhQWH+EhQN
 2UEPkPVZL4XOdJD3q5HjQSJsJfKcq1qgW9iSqu54Zgvwmx351SEDaXkKUZ+n+7cMfNmu
 45MkKGOtZdciD9pQqcB4d9uPJ3jmXXhhp4+RbpWr8BE5EcjhpCOd95pvvTPxifrxj4Sc
 QaSvNW4e4RvWU08QVo7aP2lRA0VYm4CgQfSx6N4HhSvvEm/NetOMqr3wworBwJ+QEwF2
 ugIrP4VzKTVZyGKgMVBc7xpgJGXhhHmbZVzBBzc/fYHfiIoIccwQnBm+QezxANEFwW9n
 ZftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f/BAa9sp94NqKP5B4c9amJsD3bi6NZ608OY5VYA4uqE=;
 b=XwZxgD1TUFAUa5y0azJumDPv68TrDwR8XbEUQ4gWxU6HqWaQYT3SB6hSTgltMNtAZ2
 79JWY1de9VrKbxGW44B2VP9obdG7Dv3ZZVWje0FXjXmEjHb6fDL0b3qrwVQNydRWqoH2
 zTgSFJztdqH7VYmpSHRMuCKIDu+0LWoSCssMLqR7X7GSBCUoM/Ix8SFx0g2pKXJX1kS5
 ZK2cc3ChjUKWARvBggQpDb/lm3k1IEkRmTp+DSIcjj1Cg6X+FD+ExEg2y8ifE03n2ywk
 e6rZo/ltVLNorOTXpZnoGGNNgPO31B4iPI5M00ic6rQXGanX7wu3c22xe/yh1C4VuHFS
 XBlw==
X-Gm-Message-State: AOAM531S1+56nPZAIUQTVdQwlic+c2cpE6R0ViVsmH1n4THBJgD24ISY
 nKLyWJqj1pZqBKolfc7JWc0kFw==
X-Google-Smtp-Source: ABdhPJy0l61eRh97ngvyTNr8odlt3osqJD660w91tlh0ZcgplYfL8Ni0ULPqkql8KxdN+SSZi8T+Eg==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr16034800wrn.281.1635161048942; 
 Mon, 25 Oct 2021 04:24:08 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n25sm3555479wms.10.2021.10.25.04.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 04:24:08 -0700 (PDT)
Date: Mon, 25 Oct 2021 12:23:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 04/12] hw/i386/pc: Allow instantiating a virtio-iommu
 device
Message-ID: <YXaTwq35j67PlPVh@myrica>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-5-jean-philippe@linaro.org>
 <20211021154709.14da294a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021154709.14da294a@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 03:47:09PM +0200, Igor Mammedov wrote:
> On Wed, 20 Oct 2021 18:27:38 +0100
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
> > Translation table (VIOT), which describes the relation between the
> > virtio-iommu and the endpoints it manages.
> > 
> > Add a hotplug handler for virtio-iommu on x86 and set the necessary
> > reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> > region is reserved for MSIs. DMA transactions to this range either
> > trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> 
> shouldn't above be "IO remapping"?

No it is IRQ remapping: DMA writes to this address range are interrupt
requests and the IOMMU may either perform interrupt remapping or pass it
to the APIC directly

> 
> > Although virtio-iommu does not support IRQ remapping it must be informed
> > of the reserved region so that it can forward DMA transactions targeting
> > this region.
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Tested-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Thanks!
Jean


