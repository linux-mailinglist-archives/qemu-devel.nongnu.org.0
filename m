Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4B443AB0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:06:12 +0100 (CET)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi4jD-0004L4-4B
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi4hU-0003f0-P0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:04:24 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi4hS-0001FV-BW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:04:24 -0400
Received: by mail-qk1-x735.google.com with SMTP id bq14so840649qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XriK0b8XCdP641AIVKpOgdY6OB4DQfc2E1hwwM0GhuY=;
 b=jysEYEC1XrsF9VECkPyhpPwCvjy8TppsIXsMo9nI67yngH+0B5ZvOVgV7w4Bz+zBN8
 U5U0nOrL2D69WpJ62jo5XOH7xMnCNgEjrA4LF+gMHXY1605yMG8X1CSmo21rbrtuxuFG
 ehkAFhFYsH1E2yx22vwbhXOX6k0fsPxZebOX++1D6+Qd6z0a9RVHlI4qTnJHhuWZNdAH
 uzB0OHSSdMrk+JOMrWRWllPOXEv4Cp4l/T9zCxIv/AKBiIXD0ZBssFD8V2PpFSXrtVHC
 VDWU44lLCmlvT7HkHiGlsgbKgSO7FHW7RYqRVvKaQRo06yOyZoi5s/G3Rnr2rhNlLZx7
 hofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XriK0b8XCdP641AIVKpOgdY6OB4DQfc2E1hwwM0GhuY=;
 b=b5kBqBPWn139qPl1A1y2dB5SUrbZFhjO6NRz/xWb5Y8ifJH4ZYoqJYxXZh7O1L8aMr
 A/Klyk6l5pJUqQ/8U7x4f7VwJA+Hdqus6y+KQTCLOMI2gU658w3AyQ59s1Yun0WN7WqP
 7l71hVH2O2svGZB030WDb8yeo9xHMqlZ04GtK+bNlO6Nh7dtIdArgL1Hah83MJRcEaqg
 1wZefgMIV1CPumo/3qvjVZb0lhuJoLFl4UxKSliH2bSmr7LxPsJX7vXd5qvflZGT7w7N
 3sfMBHKqeNdAR1W0UCRxcTfuYiiHU0rjbHrlMZUi9kGR8XQslo/A35hQAN5Z41HMdEXU
 nxTg==
X-Gm-Message-State: AOAM533I8IJt9F4eO/0OwZO4s+JiWZeQ/Ad508raGmGzR59WIyPDT2H/
 AYPXT603KREamEf15jPXdAdHrg==
X-Google-Smtp-Source: ABdhPJwkTWYiT8LnwlOwLODBH2NkXawC7p57fu0YWGGpbUd/wG8XVtumwL9EusZpea1RnKTaaifR9Q==
X-Received: by 2002:a05:620a:2808:: with SMTP id
 f8mr10735244qkp.434.1635901461295; 
 Tue, 02 Nov 2021 18:04:21 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id e14sm504958qty.59.2021.11.02.18.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 18:04:20 -0700 (PDT)
Subject: Re: [PULL 0/9] pc,pci,virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211101234358.582487-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42306e21-1eac-adec-ef9f-074b27a31786@linaro.org>
Date: Tue, 2 Nov 2021 21:04:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 7:44 PM, Michael S. Tsirkin wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to d99e8b5fcb138b19f751c027ed5599224f9b5036:
> 
>    hw/i386: fix vmmouse registration (2021-11-01 19:36:11 -0400)
> 
> ----------------------------------------------------------------
> pc,pci,virtio: features, fixes
> 
> virtio-iommu support for x86/ACPI.
> Fixes, cleanups all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> David Hildenbrand (1):
>        vhost-vdpa: Set discarding of RAM broken when initializing the backend
> 
> Igor Mammedov (1):
>        qtest: fix 'expression is always false' build failure in qtest_has_accel()
> 
> Jean-Philippe Brucker (4):
>        hw/acpi: Add VIOT table
>        hw/i386/pc: Remove x86_iommu_get_type()
>        hw/i386/pc: Move IOMMU singleton into PCMachineState
>        hw/i386/pc: Allow instantiating a virtio-iommu device
> 
> Pavel Dovgalyuk (1):
>        hw/i386: fix vmmouse registration
> 
> Peter Xu (2):
>        pci: Define pci_bus_dev_fn/pci_bus_fn/pci_bus_ret_fn
>        pci: Export pci_for_each_device_under_bus*()
> 
>   hw/acpi/viot.h              |  13 +++++
>   include/hw/i386/pc.h        |   1 +
>   include/hw/i386/x86-iommu.h |  12 -----
>   include/hw/pci/pci.h        |  24 ++++++----
>   hw/acpi/viot.c              | 114 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/i386/acpi-build.c        |  33 +++++++------
>   hw/i386/amd_iommu.c         |   2 -
>   hw/i386/intel_iommu.c       |   3 --
>   hw/i386/pc.c                |  26 +++++++++-
>   hw/i386/vmmouse.c           |   1 +
>   hw/i386/x86-iommu-stub.c    |   5 --
>   hw/i386/x86-iommu.c         |  31 ++++--------
>   hw/pci/pci.c                |  26 ++++------
>   hw/pci/pcie.c               |   4 +-
>   hw/ppc/spapr_pci.c          |  12 ++---
>   hw/ppc/spapr_pci_nvlink2.c  |   7 ++-
>   hw/ppc/spapr_pci_vfio.c     |   4 +-
>   hw/s390x/s390-pci-bus.c     |   5 +-
>   hw/virtio/vhost-vdpa.c      |  13 +++++
>   hw/xen/xen_pt.c             |   4 +-
>   hw/acpi/Kconfig             |   4 ++
>   hw/acpi/meson.build         |   1 +
>   hw/i386/Kconfig             |   1 +
>   meson.build                 |   2 +-
>   24 files changed, 239 insertions(+), 109 deletions(-)
>   create mode 100644 hw/acpi/viot.h
>   create mode 100644 hw/acpi/viot.c

Applied, thanks.

r~


