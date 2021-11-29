Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73456461C11
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:46:37 +0100 (CET)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrjnY-0007sr-Aa
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrjmZ-0007Ax-Uu
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:45:35 -0500
Received: from [2a00:1450:4864:20::329] (port=52840
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrjmY-0005qh-GR
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:45:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id o29so15207839wms.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 08:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LWvSX5FTVUOQIQxj8w5AE9zhQl8WqMmBSnLYQ67d1RI=;
 b=qeKJyPBu6T928+YGbhnQnuPrrRpGG3zwcHOx7O39UgDKFt5/eG5f/3azrZufrRzksN
 Ey38tiWazDEGJjpVrfBLKwqNJN6piRlf1CfWw5GJblv155Ce1NWR82KEmhdZmhIuBmRh
 zxkO77eMm4LTZNHBE+EqcVvbPSlPkYLFGm6ypz9tZOv3h74v5Yv8k+cAFD0Ebg13ZVfX
 Ar7YDKk6Hl77ZQ0VmMJ8FbCQj6mOgLnOQC7iQ3uIxRw9lEkJFqVny7MItXhASmCqtnpj
 Q5RJsZXwNz7qSYl+PTEr+GRSj2LlFbfpgpyHfud4DtPbQaXAsybnIuM6fynnV8nnbJtV
 P7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWvSX5FTVUOQIQxj8w5AE9zhQl8WqMmBSnLYQ67d1RI=;
 b=eicC/vww/zWbqUm7cIogSObtwuA/RdfsEE95vUttqLdYqdeTnQHDMT9kwig7aKW7hD
 RPnu54xABNDuyyhSOSIFxzc3ybwwR52a/DtnQKwwQgIwtbVMVddIjVrUJIDwLufPt5h1
 IkjQ9JsNxxPkfsZDxy3IuSy1YgOXh3VF5kvBiWPuXBbAacJUKT4TyVuTlOSikrCHV7uL
 1dQQ8qXlIXoF0uDXbAWIVqI/zoxXv8PaxQkUvoHqSdrUQid0Tl0ZZEo3VMOfei3/T1Sh
 jFNVpDaYsWyH6Zog7KW484mp+eNluFeaDW4MY/PDT6ZdjdBq1W4gxHLLOwKy1kQKLTSj
 MBCg==
X-Gm-Message-State: AOAM532io1LuKMmIGm1iW/o8U35x0xo5wdUOrCZpi5oTd5M6OKr5RVbT
 FVGctXIF4bMTUdGeniYE75rKQw==
X-Google-Smtp-Source: ABdhPJxK+kk6O6eyKD5PwBk/vMDAOliJ04MeQzLEgKGgsbGxQHAAmz1eY7qwpv/Q5SqUwBwaQkekCg==
X-Received: by 2002:a1c:98ca:: with SMTP id
 a193mr38158391wme.162.1638204333099; 
 Mon, 29 Nov 2021 08:45:33 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id p14sm19041107wms.29.2021.11.29.08.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 08:45:32 -0800 (PST)
Subject: Re: [PULL 0/7] virtio,pci,pc: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211129135053.560225-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd44d601-7082-5c70-a73a-c28b82f04715@linaro.org>
Date: Mon, 29 Nov 2021 17:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/29/21 2:51 PM, Michael S. Tsirkin wrote:
> The following changes since commit dd4b0de45965538f19bb40c7ddaaba384a8c613a:
> 
>    Fix version for v6.2.0-rc2 release (2021-11-26 11:58:54 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to bacf58ca18f06f0b464466bf8c19945f19791feb:
> 
>    Fix bad overflow check in hw/pci/pcie.c (2021-11-29 08:49:36 -0500)
> 
> ----------------------------------------------------------------
> virtio,pci,pc: bugfixes
> 
> Lots of small fixes all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Cindy Lu (1):
>        virtio-mmio : fix the crash in the vm shutdown
> 
> Daniella Lee (1):
>        Fix bad overflow check in hw/pci/pcie.c
> 
> Eugenio Pérez (1):
>        vdpa: Add dummy receive callback
> 
> Jason Wang (3):
>        virtio-balloon: process all in sgs for free_page_vq
>        virtio-balloon: correct used length
>        intel-iommu: ignore leaf SNP bit in scalable mode
> 
> Laurent Vivier (1):
>        failover: fix unplug pending detection
> 
>   hw/i386/intel_iommu_internal.h |  2 ++
>   hw/acpi/pcihp.c                | 30 +++++++++++++++++++++++++++---
>   hw/i386/intel_iommu.c          |  6 ++++++
>   hw/pci/pcie.c                  |  4 ++--
>   hw/virtio/virtio-balloon.c     | 13 ++++++++-----
>   hw/virtio/virtio-mmio.c        | 12 ++++++++++++
>   net/vhost-vdpa.c               |  8 ++++++++
>   7 files changed, 65 insertions(+), 10 deletions(-)

Applied, thanks.

r~

