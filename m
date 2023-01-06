Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E536603FA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 17:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDpFe-0002e3-T5; Fri, 06 Jan 2023 11:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpFd-0002dg-Kt
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpFa-0002sp-2h
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o21so1927663pjw.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 08:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RgmtWPPr1d7crRdwnC6Mc08eBHGHpiQuFlj7p4O4+0E=;
 b=X1LNwI/6MuSYf6wnbBZFx9LFJ0vm1J+7WR9MvpPRzW1P3ttayhnhkp4QkTMX8Vjdpe
 lUOP6gq7L6atlNdeBr158qk3EVvXTX1INH+dpVFhZFljazZ+71Wb+Fs5+aZ1hFlSc9SH
 sDUvj7Qefcp/S+6IS6pm2rXjwc70MAzYC6lUuoRwCmuUKTxx3qwZERXqSCpyFySSTLOl
 n+BF+Huc1iZ0mklWlTiiwZWYwrp2pupAMvGqRU+7taYlerrdvKCd41OoiyYSN4pek8Kp
 OiN/y0ynMoRo5ooV9CQ+2GNkwUwFtAqFAgxqUYyuFJHjNPRy+Ow2gRfh2AhsDh2echgE
 Pb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgmtWPPr1d7crRdwnC6Mc08eBHGHpiQuFlj7p4O4+0E=;
 b=ck2SJ8ta4BjBno12CZQcCYWST5ePZ8GGKmlyYrKvVCUcpn9fAJvGyEK4POOfBSfU7C
 iyuCP9M4mVj35mhtNYcLgP/TK0vmvarWfyPaS8xNytOgye9xFPKDjRh/NxwL6mBgm4NE
 Op6QRsHrIs9dfdW/B0aKYIng1UDbxlKgYeqphgTUeXrDpmtkunmJJ7DIqGXpjZIRQk6Y
 p5YzGA8OVMS4KcZfqd9CJKMpkYKXmAndtAs2sVT1nhFHB45CX1jydDzKStO9Hdwn7rOq
 Q0wzQfJ5jxbWXBNUr+kClLzHPGQ/gP1Sx0Nz6U+2FsZZ5VMkO8jijPpm/b62b5mNdI7g
 D+yQ==
X-Gm-Message-State: AFqh2krVKz7uVIzVt7smUFXE2KK8Ur0G5/OAlT4urxjlivgdTQ6OaOVF
 2EqRFU7OUMIsMYyPOj12gFHS4yHNLkSWgVWRYSoelA==
X-Google-Smtp-Source: AMrXdXtGyK/G86kOBsRz+gsitV2loP0UlcSZcJRVh6bKyOd+as9eJ4MmgXF/i0WCJ3dp/ONFdMAL/hVGWAOOrPZ6K+I=
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr712951pjq.215.1673021240416; Fri, 06
 Jan 2023 08:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:07:09 +0000
Message-ID: <CAFEAcA_a=B=BGdCgJL-owidGT1m8fpLJ1aw5wK1aBiXK4ZV4-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Enable Cubieboard A10 boot SPL from SD card
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 26 Dec 2022 at 22:03, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch series adds missing Allwinner A10 modules needed for
> successful SPL boot:
> - Clock controller module
> - DRAM controller
> - I2C0 controller (added also for Allwinner H3 since it is the same)
> - AXP-209 connected to I2C0 bus
>
> It also updates Allwinner A10 emulation so SPL is copied from attached
> SD card if `-kernel` parameter is not passed when starting QEMU
> (approach adapted from Allwinner H3 implementation).
>
> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
> Yocto image built for Cubieboard.
> Example usage for Armbian image:
> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img



Applied to target-arm.next, thanks.

-- PMM

