Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C124A3066
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 16:57:42 +0100 (CET)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDq6f-00060m-1u
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 10:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDq4o-0004tt-Jq
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 10:55:46 -0500
Received: from [2a00:1450:4864:20::32f] (port=34445
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDq4m-0005dn-LM
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 10:55:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so5865541wmb.1
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Kkdglc0MZhg7hVk4bfsjoiJ4mHFBApiUuCg5nx6qccA=;
 b=Jflv8U/7pg2cSI/qZFke3ppbvDs+W849Y8zAw/8oH/GrZHcgho2YQjRBKu+99yAqV7
 5UGsSUms+eUJYhKLEMJFjm8gbzDiJd/HZE1ZyrjMetCeYl7skBKGDoJW9h/Z9s5+JGzs
 reaJ6tWFz+7OYRSPzIl1/DyVbJySR5CFxzb9Zo3KMpMmrJpepxjfvkjDiA2W6HmsVEyi
 RhW5jmT7CwEjTokytV2jFl6LhOM/HG2/2ev7zNTSx5sHRmlOIudcXLB8TqoQBussl7V1
 7eImS8v0ij1t9+Bur0MC5XtbtmpJSHq+C8c8yy7KNqY+m7yUeCwKJrKR2I5AKujmnFsD
 GITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Kkdglc0MZhg7hVk4bfsjoiJ4mHFBApiUuCg5nx6qccA=;
 b=3dJzmmh1R5I8njaFSmfT/Lxf/SNynePIWlRnC0s3NudKG1X4Zx3kUdkhfkbtkps+Kh
 TeKB25PQK/DGya+0wDLiCFC7GladBUgxNq9+M2ZbTHh7ni6o53acPD1W9AkrA3CzCeZc
 tAw0Z7nKQUJuu/nqQP3CItznVTrPRA9LayBSXSac6Stt/rZVqNnPOAg0y+xRh5p7i8MP
 mODXyN8Tv5aTMHN05OpLpGBK7cz0Xp9T0g7GtkTwIkGX9bfSGHECkv4Q1ZWsN8Y55iH3
 RXW21XQnYIYkUcK+xWshu+zl1tJQEvNzJHx70xmy3T6LF/mVj4qbd5TBPQCabCuyTB0S
 sOhA==
X-Gm-Message-State: AOAM532kVoniy0u80/jJ1rSdUlFxdF0/aTTW46hTKwEIN6kelgi3mMJb
 ohpvU5Lwu4/X9iybh6MUE2L1Yx5ys2nVZxSpzXsTK5yqRJ0=
X-Google-Smtp-Source: ABdhPJzUG+YA8H0yl+EPXaAINlFqVMc5Suu0kX5bxbP8V5xMJfCkXZxIO3EX8P87NBeswMhe1CHrXJYFLvQ1IdoGBag=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr20403341wmi.37.1643471743034; 
 Sat, 29 Jan 2022 07:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Jan 2022 15:55:32 +0000
Message-ID: <CAFEAcA8brexcTJQVkvTeiokNNxjfjCp9OrE4uD2NzWe1Cs=CrA@mail.gmail.com>
Subject: Re: [PULL 00/32] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 15:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit b367db48126d4ee14579af6cf5cdbffeb9496627:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20220127' into staging (2022-01-28 11:05:29 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220128
>
> for you to fetch changes up to 2c023d3675a3ffb54fc30504dcd715bc6f6e234f:
>
>   target/arm: Use correct entrypoint for SVC taken from Hyp to Hyp (2022-01-28 14:30:36 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Update copyright dates to 2022
>  * hw/armv7m: Fix broken VMStateDescription
>  * hw/char/exynos4210_uart: Fix crash on trying to load VM state
>  * rtc: Move RTC function prototypes to their own header
>  * xlnx-versal-virt: Support PMC SLCR
>  * xlnx-versal-virt: Support OSPI flash memory controller
>  * scripts: Explain the difference between linux-headers and standard-headers
>  * target/arm: Log CPU index in 'Taking exception' log
>  * arm_gicv3_its: Various bugfixes and cleanups
>  * arm_gicv3_its: Implement the missing MOVI and MOVALL commands
>  * ast2600: Fix address mapping of second SPI controller
>  * target/arm: Use correct entrypoint for SVC taken from Hyp to Hyp


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

