Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F451E3A3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:39:46 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnAMD-0001o5-7R
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnAK5-0000NZ-Vq
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:37:34 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnAK3-0003aV-UV
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:37:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id v10so7486474pgl.11
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 19:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CQVQOkoAvLienzpvLjxYnSsmbMxuuMNBddbCETA9cEM=;
 b=L6htMzpPV/UDtTYzXO4ixtvvWWel42sUFOPxZvk0Mbz10CYSFIKlsBxs16DCeWhjs6
 l1i9F4boLUIfWpDtf45klLhGijlhirRnZ1nDtXBK+VwsdJt5RJsOWiWXMWuRFl7e3zyv
 Au0UlksYUdSntlwORL0BQQ6UDb6TViJ5YePl/l9zvY1Tp/lg2fAwanRHe2JeCfQ5Xh/o
 ZwzXdYNga6kxDpZwjrQhTGyjYPy/9zXSnE1NCyF6WsYNKSqzsMwNNmbfs5q5mQmWhPUH
 hFDGDFL9URrGH7Wdy+7W3xbQMNyG3/Y7dKkCcY0ZX5jHU4eBfpaKhsVnYSLaMjm5f1mA
 LwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CQVQOkoAvLienzpvLjxYnSsmbMxuuMNBddbCETA9cEM=;
 b=iPG7DDfE+W1BMOpJlVAD90HvfQKk3pj3fHA1L9My5ULjNQR2p/RdIMVkA/O3AHFu7h
 Dg9/KfUSezehEvUOJtEWFQTCkHtHUUjolar38jqV0JDYCq+qN0nf+Mkc+zAJ+U4dTjm6
 frTpC/BI4HFm5U0GkCx7anu1AQZKvx2/5b4/0bpr4+iAUQIJvHu+DVtkcvuRtqcMJpKr
 OpF6UiZX/agqihic2z7cTwEYWGjrUWFGtDMAQ1miihzPsPm1fr0FEuC5u0nr+pBVd65y
 aWLS0IhSfr63LoQx7lngTLZ2quiZxs6ecyEeBiEW6LGyRIuR8jzICEsc2iOqFtyC+tlc
 x4ow==
X-Gm-Message-State: AOAM531CJJzgZeYyXCa7TM89LiGQeCLiB8cMy9rw/APy9Q5obtCkuRyQ
 S7BDL8Xwn8oGAiDAqEfEHCTGoQ==
X-Google-Smtp-Source: ABdhPJwblC5DjAKoIf9wicyRVnnfIaAWD5eQKeb4XWcBEtDlgYszHcL1t2eWknDJjStHP3fRNa8qHg==
X-Received: by 2002:a63:2215:0:b0:3c1:fd25:b6a1 with SMTP id
 i21-20020a632215000000b003c1fd25b6a1mr5175041pgi.406.1651891050366; 
 Fri, 06 May 2022 19:37:30 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 c20-20020a170902849400b0015e8d4eb281sm2477335plo.203.2022.05.06.19.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 19:37:29 -0700 (PDT)
Message-ID: <a80ed6b3-22e6-c4d1-c99d-ecc929331814@linaro.org>
Date: Fri, 6 May 2022 21:37:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/11] Series short description
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: "Longpeng (Mike)" <longpeng2@huawei.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Stefan Berger <stefanb@linnux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Yi Liu <yi.l.liu@intel.com>,
 Stefan Berger <stefanb@linux.ibm.com>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 5/6/22 15:46, Alex Williamson wrote:
> Switching to gitlab for pull requests to take advantage of the CI.
> Sorry for the delay in some of these.  Thanks,
> 
> Alex
> 
> The following changes since commit 31abf61c4929a91275fe32f1fafe6e6b3e840b2a:
> 
>    Merge tag 'pull-ppc-20220505' of https://gitlab.com/danielhb/qemu into staging (2022-05-05 13:52:22 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20220506.1
> 
> for you to fetch changes up to 44ee6aaae0c937abb631e57a9853c2cdef2bc9bb:
> 
>    vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr (2022-05-06 09:06:51 -0600)
> 
> ----------------------------------------------------------------
> VFIO updates 2022-05-06
> 
>   * Defer IRQ routing commits to improve setup and resume latency (Longpeng)
> 
>   * Fix trace sparse mmap boundary condition (Xiang Chen)
> 
>   * Quiet misalignment warning from TPM device mapping (Eric Auger)
> 
>   * Misc cleanups (Yi Liu, Eric Auger)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Eric Auger (4):
>        sysemu: tpm: Add a stub function for TPM_IS_CRB
>        vfio/common: remove spurious tpm-crb-cmd misalignment warning
>        hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
>        vfio/pci: Use vbasedev local variable in vfio_realize()
> 
> Longpeng (Mike) (5):
>        vfio: simplify the conditional statements in vfio_msi_enable
>        vfio: move re-enabling INTX out of the common helper
>        vfio: simplify the failure path in vfio_msi_enable
>        Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO migration"
>        vfio: defer to commit kvm irq routing when enable msi/msix
> 
> Xiang Chen (1):
>        vfio/common: Fix a small boundary issue of a trace
> 
> Yi Liu (1):
>        vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr
> 
>   hw/vfio/common.c              |  50 ++++++---
>   hw/vfio/pci.c                 | 234 +++++++++++++++++++++++++-----------------
>   hw/vfio/pci.h                 |   2 +
>   hw/vfio/trace-events          |   1 +
>   include/hw/vfio/vfio-common.h |   2 +-
>   include/sysemu/tpm.h          |   6 ++
>   6 files changed, 186 insertions(+), 109 deletions(-)
> 
> 


