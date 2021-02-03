Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867FE30DC46
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:10:17 +0100 (CET)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IrI-0007E8-FA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7IpV-00062y-Fo
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:25 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7IpP-00015g-Uc
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:24 -0500
Received: by mail-ed1-x533.google.com with SMTP id df22so11057625edb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=f+CPGwyOawuJ95Gwn/9VlgWE2U66ELzRwvlKznmKsEY=;
 b=NQPwI2iYj0gg2Eg66TJGkB+PJEg3j8WZgj1fVMPQIx6Byk12HymHziis2S7yl5k1m3
 L90Lq2/0aEn95vIBBVWJJQYsI8nOJRUA8JvefbGXkUXHPdHBV/5HJap5+Elsqbs8Ne1L
 vkKAA8DJeyiZnwPqpzz6+0GN4sIpgKqkCnESLU6TGilzYGebgU4i5cX3C+b85uc4e85Y
 +s+PICuWWgtQYNvYKbPSZMakWohVVrE/SJu+rn5dCPE/WwrLm/gBBvCsQa9gkb3sVCC5
 EFwOJsGUYLkUrnWD5n8Pt6lKfSrk0+GZGiSiPO1Cy+VynPtaMXykIvjyLZ9TaUEQCr+f
 WFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=f+CPGwyOawuJ95Gwn/9VlgWE2U66ELzRwvlKznmKsEY=;
 b=oLfPuFTsDNF0DrUS8FEUzKQwSXd/U3gVmazs3k3BqM9RTTBte5AOYrz/eBq5BGyU81
 6ycuGtuJ+New3JU0+DJh6wOWIQYySH7jxbrCJ1saLdpU/O3PaIP8w6iKR91bO3WPxGJI
 3iaxS5R2KadNCZOJJIysX45CR//Ich1h2HGz8kogE6T+1b4ZG631FK/3QDuJ+nhHHnbv
 /j6xpE/vOLbEspfBPHeDbNhuAV1Y+nj3seYJ5J5aX0BZZaoLzK2hH+4qnMfTTv3qk9Gx
 Y6TCBy2ddihmofZ7OxNAh1tm1DCg2+1bu1OPs7T2iqj6AWC8WGfjhy0aHelvg8U94STo
 7Qyg==
X-Gm-Message-State: AOAM533tqLu90j3aALFCiRP/SVoDLlWxvsO6QbtAo44KtdBRQ95TQule
 796s925PuVenNM4gJoEfnAQU5NOfFefTNGWaNEJPM1AmaKI=
X-Google-Smtp-Source: ABdhPJyhr+OmjCh2NmsdUlITcippNam1ks6E2P9ch7TLTug7bUfzItx6P709NP42spSrNKlwMvpz9NRSCY8SRiY9tlM=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr3045295edn.251.1612361297693; 
 Wed, 03 Feb 2021 06:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20210203101715.9229-1-peter.maydell@linaro.org>
In-Reply-To: <20210203101715.9229-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 14:08:06 +0000
Message-ID: <CAFEAcA-tyMyrO4Xe-bWr8T5SmwZn2Pcq8-OLKTpmM5fh51RNuw@mail.gmail.com>
Subject: Re: [PULL v2 00/21] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 10:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> no changes to v1, except adding the CVE identifier to one of the commit
> messages.
>
> -- PMM
>
> The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210203
>
> for you to fetch changes up to fd8f71b95da86f530aae3d02a14b0ccd9e024772:
>
>   hw/arm: Display CPU type in machine description (2021-02-03 10:15:51 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gic: Allow to use QTest without crashing
>  * hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
>  * hw/char/exynos4210_uart: Fix missing call to report ready for input
>  * hw/arm/smmuv3: Fix addr_mask for range-based invalidation
>  * hw/ssi/imx_spi: Fix various minor bugs
>  * hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
>  * hw/arm: Add missing Kconfig dependencies
>  * hw/arm: Display CPU type in machine description
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

