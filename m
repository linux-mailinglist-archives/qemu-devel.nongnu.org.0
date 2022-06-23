Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5175580EF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:54:40 +0200 (CEST)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Q6J-00057S-9K
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4Q4N-0003Vm-0r
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4Q4J-0005qS-71
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AWtPdlVA1nj0Hig7sWBw+5nsPke3eKap1rqVL/+rDQ=;
 b=CYws4Z+LwLMffoFitvrCK5uYy3c/bYKgBsjcZYc88KrKC+CDtxdIiC12OmDRuCgP5zEcF9
 8qxa9LOuUbA56hLensP2W1HXpVZ7oKgUNWZouxTU2AkQvCiUvd8a3RUVfFGKXZqX3zJIQB
 +lFBEY3Ly2gnzAz26PSTLdTZeitadaQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-4SlYVo8fOQC5L57NKglflQ-1; Thu, 23 Jun 2022 12:52:31 -0400
X-MC-Unique: 4SlYVo8fOQC5L57NKglflQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 e10-20020a0ce3ca000000b004702b8819beso148607qvl.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3AWtPdlVA1nj0Hig7sWBw+5nsPke3eKap1rqVL/+rDQ=;
 b=kradCE84HhwdH1tLDrAIGWbmlHE5L+Y6LkAsnLTgPK2VLaOTVnJATBxJlyf2d3GJ8H
 Gk9d/ZuKZ195c4DDYfoSypvqkhznZ3/9gh0HltICz3aHQ5osN+r5l6wM3GBa4YzCrMAe
 oe7j31ZIUrGg2rj0qBgE4Rd++o5Rfn7OX52Sm2ljt/+dmO7uQppfPZy5SuoEKBc2p7CU
 orjSZnmRPxT+OD3LrfG+xXP6Fkf65kAFp71LFL+vXqKRIKaiAyx/x2vG3ezXoHJwAtjU
 wZsxvcG2VGUPP2b0AmP2HwkeYxZclhfB/qzY5a+FiKLc42vPF3zX07fipa88dbmCkN4G
 hT8A==
X-Gm-Message-State: AJIora/h1p2H2rV2e+5eTmbosg5wTLAivKU2zYUW6n/f3+j9q+Kh81tA
 LSNsQWEbFgcVAy3qGFFrZCbk4F1Yx1ENEvjU9QZseFjQ9zrFHcCzlgCSNLpmGVpRgk1i5P4ws7N
 uj0GfTrYnoVhyONM=
X-Received: by 2002:ac8:7f94:0:b0:305:19c:f9b9 with SMTP id
 z20-20020ac87f94000000b00305019cf9b9mr8893631qtj.563.1656003151473; 
 Thu, 23 Jun 2022 09:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sH09/elLjA553V56t11bJsDrqwhVPjpcBROfKtUSuPlMkl82ooFfQs25kle4wA9+PdkAfrkw==
X-Received: by 2002:ac8:7f94:0:b0:305:19c:f9b9 with SMTP id
 z20-20020ac87f94000000b00305019cf9b9mr8893604qtj.563.1656003151223; 
 Thu, 23 Jun 2022 09:52:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z23-20020ac87117000000b0031778b5567asm1396686qto.63.2022.06.23.09.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 09:52:30 -0700 (PDT)
Message-ID: <88019eba-fae7-71d4-47ec-6c3084a45b16@redhat.com>
Date: Thu, 23 Jun 2022 18:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/3] Add bypass mode support to assigned device
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Duan,

On 6/13/22 08:10, Zhenzhong Duan wrote:
> Currently virtio-iommu's logic to support bypass mode works only for
> emulated device. For assigned device, no GPA -> HPA mapping is setup
> in IOMMU page table.
>
> Host report below error:
> [3713481.750944] dmar_fault: 191 callbacks suppressed
> [3713481.750953] DMAR: DRHD: handling fault status reg 302
> [3713481.750962] DMAR: [DMA Read NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x06] PTE Read access is not set
> [3713481.751003] DMAR: DRHD: handling fault status reg 402
> [3713481.751007] DMAR: [DMA Read NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x06] PTE Read access is not set
> [3713481.751023] DMAR: DRHD: handling fault status reg 502
> [3713481.751026] DMAR: [DMA Write NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x05] PTE Write access is not set
> [3713481.751072] DMAR: DRHD: handling fault status reg 602
>
> Guest kernel report below error:
> [    3.461716] i40e: Intel(R) Ethernet Connection XL710 Network Driver
> [    3.462605] i40e: Copyright (c) 2013 - 2019 Intel Corporation.
> [    3.464630] i40e 0000:00:04.0: Adding to iommu group 5
> [    3.482093] i40e 0000:00:04.0: fw 0.0.00000 api 0.0 nvm 0.00 0x176953ce 28.50.1 [8086:37d3] [8086:35d0]
> [    3.484295] i40e 0000:00:04.0: eeprom check failed (-62), Tx/Rx traffic disabled
> [    3.487268] i40e 0000:00:04.0: configure_lan_hmc failed: -49
> [    3.489066] i40e: probe of 0000:00:04.0 failed with error -2
>
> Fix it by adding switch beween bypass and iommu address space just like
> the virtual VT-d implementation, so that in bypass mode, vfio mapping
> is setup.
>
> Tested with four combination of qemu's virtio-iommu.boot-bypass=true/false
> with guest kernel's iommu=pt/nopt on x86_64 platform.

I know this has already landed uptream (I was off last week) but I have
few comments/questions related to the series.
>
> Zhenzhong Duan (3):
>   virtio-iommu: Add bypass mode support to assigned device
>   virtio-iommu: Use recursive lock to avoid deadlock
This patch may have been squashed into the previous one, as
"virtio-iommu: Add bypass mode support to assigned device" deadlocks.

Eric
>   virtio-iommu: Add an assert check in translate routine
>
>  hw/virtio/trace-events           |   1 +
>  hw/virtio/virtio-iommu.c         | 135 ++++++++++++++++++++++++++++---
>  include/hw/virtio/virtio-iommu.h |   4 +-
>  3 files changed, 130 insertions(+), 10 deletions(-)
>


