Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CC54EB71
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1wOt-0007CQ-Ku
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 16:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1wNc-0006UT-OB
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 16:46:17 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1wNY-0003bv-SO
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 16:46:15 -0400
Received: by mail-pg1-x52d.google.com with SMTP id w29so2261131pgl.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GrLsfvP0ImCuYhUzQjuHa+L0rAcU+ciUkruVc5Ongw0=;
 b=vtwMd5meM2gqMLXD+D/JfgG5xjD5CUfRENUm2OgCILDTRojaCXmRsFowKYSDbRaTWF
 DALWIOCOmyHg3oTHnz+k0EKonmiBIGYGRlqwRBqQnkkHBI+fCj7lRLoCGRfLIMnnbita
 d+KrRoIzHbAN0rdJTQt/WgohpkdIWYrfxRN8FtCTDaHK5tGojyk6noVXhE/L8SE0dc9v
 85qj8v08no6CPzjvzmEKhTJvcnoj+9Dz6o0iv+InVeP8BfIFiW80pcrRM6EJyH8fFZ44
 BQ/siko92Dzju1jSBnFQfPBaw/XJ6QuzpK1HL95inT2K/Pv0mVRvT0RdJxMIXpgkUoE+
 RfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GrLsfvP0ImCuYhUzQjuHa+L0rAcU+ciUkruVc5Ongw0=;
 b=cykMwbwbsaXseqGSKo5jb8u7ASR/hmQYtPA98B5LJekRYNzoIdv8518uXna3aVAzxP
 s0UwrFCunLuv4pWrdr/o9KJHJv9yBCpdMzMht5pZPQJN0Ch5cUf09Dw+jmHXK2OH2jhk
 O3gIpUuyJY2Yi9FQhHeUMX8xC5ZK6Ns+Lxx5k5mCHNcAA0OcMf7zia9GgWb3JI9XSJOe
 G9/yQzX4JaT8qRVTuVEh72qCilSJsoxFjqv/Yj87hIvLOdz1uYYxl6Tu170W+J65HF78
 f/y5icbH1M7z2XqBxk7L1X+MelUp/H7JbV7WWjhLUQ6IgvIO1yrqU8MjQByuZeLCcdi8
 4mwQ==
X-Gm-Message-State: AJIora+eybbIw/S5TlbpkZxj5WPWbdNXKb19VqjQ+JfapuuQsz9S/OOG
 0sIRVjTG/kVLOLdeUxqMNBzPww==
X-Google-Smtp-Source: AGRyM1uIiGuOYDN4g0KPseELn9fWRc5Me/XikuCNfZj3m8RSvGyNEcx1nzBYv6oh01PD3slDgXSeTg==
X-Received: by 2002:a05:6a00:a8f:b0:51b:5ca1:47f1 with SMTP id
 b15-20020a056a000a8f00b0051b5ca147f1mr6501103pfl.50.1655412370891; 
 Thu, 16 Jun 2022 13:46:10 -0700 (PDT)
Received: from [172.22.33.109] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a17090b069200b001e2ff3a1221sm1923587pjz.33.2022.06.16.13.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 13:46:10 -0700 (PDT)
Message-ID: <dd67d7c2-d4d0-0f51-64cd-16ca99b33e78@linaro.org>
Date: Thu, 16 Jun 2022 13:46:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/10] virtio,pc,pci: fixes,cleanups,features
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220616165703.42226-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/22 09:57, Michael S. Tsirkin wrote:
> The following changes since commit def6fd6c9ce9e00a30cdd0066e0fde206b3f3d2f:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-06-16 07:13:04 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 8c97e4deeca9ad791ab369d3879ebfb0267b24ca:
> 
>    acpi/erst: fix fallthrough code upon validation failure (2022-06-16 12:54:58 -0400)
> 
> ----------------------------------------------------------------
> virtio,pc,pci: fixes,cleanups,features
> 
> more CXL patches
> RSA support for crypto
> fixes, cleanups all over the place

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Ani Sinha (1):
>        acpi/erst: fix fallthrough code upon validation failure
> 
> Jonathan Cameron (3):
>        pci-bridge/cxl_upstream: Add a CXL switch upstream port
>        pci-bridge/cxl_downstream: Add a CXL switch downstream port
>        docs/cxl: Add switch documentation
> 
> Ni Xun (1):
>        vhost: also check queue state in the vhost_dev_set_log error routine
> 
> Yajun Wu (1):
>        virtio/vhost-user: Fix wrong vhost notifier GPtrArray size
> 
> Zhenwei Pi (1):
>        crypto: Introduce RSA algorithm
> 
> Zhenzhong Duan (3):
>        virtio-iommu: Add bypass mode support to assigned device
>        virtio-iommu: Use recursive lock to avoid deadlock
>        virtio-iommu: Add an assert check in translate routine
> 
>   include/hw/cxl/cxl.h              |   5 +
>   include/hw/virtio/virtio-crypto.h |   5 +-
>   include/hw/virtio/virtio-iommu.h  |   4 +-
>   include/sysemu/cryptodev.h        |  83 ++++++++--
>   backends/cryptodev-builtin.c      | 276 ++++++++++++++++++++++++++++-----
>   backends/cryptodev-vhost-user.c   |  34 +++-
>   backends/cryptodev.c              |  32 ++--
>   hw/acpi/erst.c                    |   3 +
>   hw/cxl/cxl-host.c                 |  43 ++++-
>   hw/pci-bridge/cxl_downstream.c    | 249 +++++++++++++++++++++++++++++
>   hw/pci-bridge/cxl_upstream.c      | 216 ++++++++++++++++++++++++++
>   hw/virtio/vhost-user.c            |   2 +-
>   hw/virtio/vhost.c                 |   4 +
>   hw/virtio/virtio-crypto.c         | 319 ++++++++++++++++++++++++++++++--------
>   hw/virtio/virtio-iommu.c          | 135 ++++++++++++++--
>   docs/system/devices/cxl.rst       |  88 ++++++++++-
>   hw/pci-bridge/meson.build         |   2 +-
>   hw/virtio/trace-events            |   1 +
>   18 files changed, 1343 insertions(+), 158 deletions(-)
>   create mode 100644 hw/pci-bridge/cxl_downstream.c
>   create mode 100644 hw/pci-bridge/cxl_upstream.c
> 
> 


