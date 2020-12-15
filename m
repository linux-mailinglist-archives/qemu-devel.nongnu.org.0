Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE42DAE2B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:42:20 +0100 (CET)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAap-0005q4-LP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAZN-0005KN-Q0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:40:49 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAZL-0004aQ-L4
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:40:49 -0500
Received: by mail-ej1-x641.google.com with SMTP id ga15so27720378ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 05:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpbaGrqcA8Y6KuYxAD6qmqSBlOl+XWHiyjR39TmHpsw=;
 b=ROekeqzDcUwRBjN87DoPqT6ulZWwzk5YmhM3fWUtGAG5yPYBxpSJGlGkJzIucEzqb/
 Z+HkzuVvyuuq5yIJAK5fHZcWi/nidAOMyM9d2MLnCEUL7Ybpj4pVfYZZDWB8LyQDSyjm
 uBWFczek1zkwpi4pxunHVTgqg7Rc3pIixMilR/IX+PI/sfXnfPviR7K1f6sxukn5cOGa
 ZhO6bmavvC8YNnw6Fmu5r4z4EUmbPaaM9IrG4jJ50zTcvgn1nVDVCkUFO2rH90tJ20gm
 zwuIfdpu4F6uZUv0pdptvpyq5VLTj6HR51XIKqFgbOtN8iXFxuVhZx+nSIzOhK9Cyuqd
 1M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpbaGrqcA8Y6KuYxAD6qmqSBlOl+XWHiyjR39TmHpsw=;
 b=qXYNVNtSm5gQatVyp47vDijFToxl23YWd0mTTmqI9drrGKuZGWoZ3fEvLC5ZYruQNU
 9Ttw3XkAhTbxPEVMPkDoaqLcsqv1rXQwMnEIYQBVN5Wu328Zz+5MpUcgbIqkqusMTyMT
 vTVbJ0zcyWtJvM2gJ7ROO3NRiQGWBzZ4jwH/GXBe5RYvChdSWhYLpcIbmpu45HxGmY3x
 DmI1BBLuAqICwTsFKf35rQjs9nEBNxHXQ+VsQXLgHsLRrNBleFDuuFHBHgvW3JScPQAl
 8lZX8DXxOq6sbyjnOG7NXWlk1+m78s08mZQiX7j6ZcVv6ThaKsowoA8itEeW0fiCnMZl
 LSQw==
X-Gm-Message-State: AOAM5336CtT7RvbcshwyeOfUVruH9O3TzzKT78hcVMcpc5xYJNxVKZhb
 hBOy9/MuwvJaRkpHcTVIFhXnmcb2KITi6FHRffshBg==
X-Google-Smtp-Source: ABdhPJxANqkXXCJNHajzKJIV4N/MepecsvUGuAyiJwCJC5GLaFM8wIAX2z6PfgUKnn6A1GaUKnSP2PkC6ITTAA+t1ic=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr27129584ejr.482.1608039645950; 
 Tue, 15 Dec 2020 05:40:45 -0800 (PST)
MIME-Version: 1.0
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 13:40:34 +0000
Message-ID: <CAFEAcA9zAb3Uwgi_evqEKv2P_H_5-uq2JMKgk4D4RH90yBhDAg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and
 check for SPI mode on cmds
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 23:13, Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> Changelog:
> v4 -> v5
>  - 3/4: Simplify logic when changing state and checking mode.
>  - 3/4: numonyx_get_mode -> numonyx_mode
>  - 4/4: Reword commit message to include QIO mode.
>
> v3 -> v4
>  - 1/4: Patch changed to change names of register fields to be more accurate.
>  - 1/4: Revert polarity change from v3.
>  - 2/4: Added, fixes polarity of VCFG XIP mode when copied from NVCFG.
>  - 3/4: Removed check_cmd_mode function, each command check is done in decode_new_cmd instead.
>  - 3/4: Add guest error print if JEDEC read is executed in QIO or DIO mode.
>  - 3/4: Don't check PP and PP4, they work regardless of mode. PP4_4 is left as is.
>  - 3/4: Simplify get_mode function.
>  - 4/4: Simplify extract_cfg_num_dummies function.
>  - 4/4: Use switch statement instead of table for cycle retrieving.
>
> v2 -> v3
>  - 1/3: Added, Fixes NVCFG polarity for DIO/QIO.
>  - 2/3: Added, Checks if we can execute the current command in standard/DIO/QIO mode.
>  - 3/3: Was 1/1 in v2.  Added cycle counts for DIO/QIO mode.
>
> v1 -> v2
>  - 1/2: Change function name to be more accurate
>  - 2/2: Dropped
>
> Hi all,
>
> The series fixes the behavior of the dummy cycle register for Numonyx flashes so
> it's closer to how hardware behaves.
> It also checks if a command can be executed in the current SPI mode
> (standard, DIO, or QIO) before extracting dummy cycles for the command.
>
> On hardware, the dummy cycles for fast read commands are set to a specific value
> (8 or 10) if the register is all 0s or 1s.
> If the register value isn't all 0s or 1s, then the flash expects the amount of
> cycles sent to be equal to the count in the register.



Applied to target-arm.next, thanks.

-- PMM

