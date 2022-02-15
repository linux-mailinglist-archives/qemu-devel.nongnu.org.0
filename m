Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93324B68BB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:04:00 +0100 (CET)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJugh-0008Bj-VM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:04:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJuTa-000672-QL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:50:26 -0500
Received: from [2a00:1450:4864:20::42a] (port=42750
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJuTX-0002uL-1o
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:50:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h6so31078539wrb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iM3vI6OmCf8d2ZvpfzvY3zF91IJQs8TF+SJ4rjHl6/A=;
 b=ETplzmVKh+EUIwbXW/XpRhgMN7zMvD24C9B4tB/GRPgij5Ndjj8UybZsZSwh9BG9aM
 b9ISU/W2Dl1psWs1kOlD4PxHTmt0SF72E7HcMDLuYtIWG2/sNmEB+6JjNH2wFVrFrtJg
 tjjmLKgF5Brnc6y4CKrR8cibC2ebPnXKNBQiQc++IOAyfvAOYm9XcDZdDOTOeimiUufP
 rYpIafgTEEGJhD+v6G2mARCjHLdKwwA828a2FwYVwpmqR8QYBbyb5CnSIbFVcCm3XRph
 CM7iRkM2n4pWwIsxc33m5tq6YHYJmTiBGXlT9W61bTRP6+j5P+Fpb4a2OOLQB9tPoTCe
 JKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iM3vI6OmCf8d2ZvpfzvY3zF91IJQs8TF+SJ4rjHl6/A=;
 b=xzl7icCoDrfdnkwh5LtwhUUPzSH4PZRRXwXyFAsEaJF0DibLBPPzMAzTjUpVk+NRS+
 lSSvOKAg1Ll85jStTCyEGTc0icHmpa3tp8Vew7TFaIK9/q8JiQsoYr+/UCYfQKJNxTn5
 IgwcAuupTWUXBsazl/R3q1UBAOw3elk3QlZ9V0Q33KIRsGwdDtLfdJ3C3pyuuH61ZJO+
 E+wQTO1KF7n6GAHEzuxRsO0eJY0Z1DsjIBli9jv0xfIOHOLzLp2Aeq/56ybHvV2VqGw5
 jJK9yoc6T+IAtRDosPNAqhADaLNpOnYtwH2udOFR9us8HzXAcQkZVYVUIu1727At/Wd2
 LykA==
X-Gm-Message-State: AOAM533d2ljeT5CKR9pXVRSL+tI889ZmQdYx9jKEFGHMEeURxCmGbRx/
 dSqxlP6z85bpPBAEpGA2lnOnrKSYF9CSuw==
X-Google-Smtp-Source: ABdhPJytDgHdLJgU5bPIY4NEoUQYlBGplBL/jekJZGhZr8sGVpqrlz/WRXwMfJJipguOSbMgqHg36w==
X-Received: by 2002:a05:6000:1d93:: with SMTP id
 bk19mr2481310wrb.264.1644918616856; 
 Tue, 15 Feb 2022 01:50:16 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id a9sm15450312wrr.20.2022.02.15.01.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:50:16 -0800 (PST)
Date: Tue, 15 Feb 2022 09:49:53 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <Ygt3QcDhRBKZJmf0@myrica>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
 <f70a113d-5762-3b4c-6125-0081a1d5ab63@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70a113d-5762-3b4c-6125-0081a1d5ab63@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 10:25:21AM +0100, Eric Auger wrote:
> Hi Jean,
> 
> On 2/14/22 1:43 PM, Jean-Philippe Brucker wrote:
> > Replace the VIRTIO_IOMMU_F_BYPASS feature with
> > VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> > global bypass on and off.
> >
> > Add a boot-bypass option, which defaults to 'on' to be in line with
> > other vIOMMUs and to allow running firmware/bootloader that are unaware
> > of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
> > anymore.
> >
> > Since v2 [1]:
> > * Added the new bypass bits to the migration stream.
> >   As discussed on the v2 thread, we assume that cross-version
> >   compatibility is not required for live migration at the moment, so we
> >   only increase the version number. Patch 2 says: "We add the bypass
> >   field to the migration stream without introducing subsections, based
> >   on the assumption that this virtio-iommu device isn't being used in
> >   production enough to require cross-version migration at the moment
> >   (all previous version required workarounds since they didn't support
> >   ACPI and boot-bypass)."
> >
> > [1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> I tested both the boot bypass feature with virtio-blk-pci,
> virtio-net-pci and virtio-gpu-pci and migration.

Thanks!

Jean

