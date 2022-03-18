Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A123B4DDA30
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:11:43 +0100 (CET)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCOM-0003Vb-Hu
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:11:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCMR-0002jV-E3
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:09:43 -0400
Received: from [2607:f8b0:4864:20::1130] (port=34887
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCMP-00086q-NM
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:09:43 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so90449057b3.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d28JjyRvulvxE8OOu5TylSi+K19pJb3wy6NFRhzG9KA=;
 b=O6W7XUcxPkDCMMVx7Vs9t45T8u0S3EWHy8axyyJE/4K1nR0XwMOJipljE9Tjw8jihy
 BzsrxwD3IM0asZjTGuRFLucphORece4zNXcZGeoEstPFZHNN/2jDJG1N7xSaWotXTusW
 5stZHfmH7OZhyzO6GwP2l3Z5E5MkT4/64A+lUwiV6XmQ5O8t8GVxLJIZP2N1gsR6xa9y
 bLzyiS2DUSpbS/MxLniVD/Wo0hC0Egid8SENgLomSaMpoFNyDKCVeK9/TnLtx5NmH/O0
 G20wC1JRISm5i0zBOs2VPbZYqgwqNzQdd9RpEKKiZYFjqVPoRYj1b+zyiN/3rgBt5ZVs
 vB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d28JjyRvulvxE8OOu5TylSi+K19pJb3wy6NFRhzG9KA=;
 b=vYuu10NuyNVKR6clpP/U3dXfoiiTI9BWEGwh4JcP+nMb/oJyOedNyZqtacaM6yc7C9
 xlG1btZDJ80YUtdAvPzfVYa1tM5uIHh8Mdkw2jDKF/0QpWj4lsO+Td61RK2zFLhIccnD
 wsmw7vuG8YnenMogKXsB6UvUDiRkHFft8TJ3eZP7cbYqDNcdF7UEXqy8QvFVNn1vFwEF
 9UJuDBPpC+8C0EW4mCmiFjVQ2w0eH9i5dHP/tuRSX+CzmOQSRAiiOQvNUlyFLuUL5nnK
 D0mDLFi9+pYXbNKtKB1U+u8vzRoIzUu2m2rECZkovQ2p/r+A4yfEWUQJ6oeER4UEpllB
 DAIg==
X-Gm-Message-State: AOAM532lX+FjDU60mnhAh2+Kz1EKH9+7Zvoc2GW+vNQg2G2IS6at6F0a
 z/L9p9c96vQ3uLvUEC7DaDCYzSH3pv1NrNaLjBCQHw==
X-Google-Smtp-Source: ABdhPJzQGJ2ctuFU95H28tP5TeRG6UEy2iXKiu/084fAr+4aXsVqqEXIzhY2GpJzGxXYdRI2Tm/nYtNMtqBqDRUhfJ0=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr10643942ywr.64.1647608980600; Fri, 18
 Mar 2022 06:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-6-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-6-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 13:09:28 +0000
Message-ID: <CAFEAcA9gJB=-LA6uK-1Bo6iDkdwToC_hxKOLuD9=UJ2Ou1oW6A@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] hvf: fix memory dirty-tracking
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> Dirty-tracking in HVF is not properly implemented.
>
> On Intel Macs, Ubuntu ISO boot menu does not show properly.
>
> On Apple Silicon, using bochs-display may cause the guest crashes because
> the guest may uses load/store instructions on framebuffer which causes
> vmexits and the exception register does not contain enough information
> (ESR_EL2.ISV = 0) for QEMU to emulate the memory operation.
>
> The strategy to log the dirty pages is to write-protect the memory regions
> that are being dirty-tracked.
>
> When the guest is trapped to the host because of memory write, check whether
> the address being written is being dirty-tracked.
>
> If it is being dirty-tracked, restore the write permission of the page and
> mark the accessed page dirty, and resume the guest without increasing
> program counter, and then the same instruction will be execute again.
>
> This patch fixes the problem and make the dirty-tracking work properly.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1827005
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---
>  accel/hvf/hvf-mem.c      | 62 ++++++++++++++++++++++++++++++++++++----
>  include/sysemu/hvf_int.h | 14 +--------
>  target/arm/hvf/hvf.c     |  5 ++++
>  target/i386/hvf/hvf.c    | 25 ++++------------
>  4 files changed, 68 insertions(+), 38 deletions(-)
>


> +/*
> + * The function is called when the guest is accessing memory causing vmexit.
> + * Check whether the guest can access the memory directly and
> + * also mark the accessed page being written dirty
> + * if the page is being dirty-tracked.
> + *
> + * Return true if the access is within the mapped region,
> + * otherwise return false.
> + */
> +bool hvf_access_memory(hwaddr address, bool write)
> +{
> +    HVFSlot *slot;
> +    hv_return_t ret;
> +    hwaddr start, size;
> +
> +    slot = hvf_find_overlap_slot(address, 1);

What happens if the guest does an unaligned 4 byte access
such that byte 1 is in one slot and bytes 2-4 are in a
different slot, or not covered by a slot at all ?

> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 4d4ddab348..398ad50a29 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1202,6 +1202,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>              break;
>          }
>
> +        if (iswrite &&
> +            hvf_access_memory(hvf_exit->exception.physical_address, 1)) {

hvf_access_memory() can return true even if it has not changed the
protection flags on the memory, in which case we'll go into an
infinite loop of taking the fault again.

> +            break;
> +        }
> +
>          assert(isv);
>
>          if (iswrite)

thanks
-- PMM

