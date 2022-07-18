Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B95787C6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:49:54 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTwQ-00079a-0d
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTud-0005E4-6Z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:48:03 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTua-0004fX-MU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:48:02 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l11so21794320ybu.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Qy/98bA+oJCkEOo+yVU2o+cL80RhybFEw0Kuvnxh4O4=;
 b=YDomMA9+eOBTLXPvdK8wHJCyz7ET6GHoAljwVUmBiMAUqm0lwc+Kc4OU22LdD6bAzD
 +UhxGUBcYf8DI1GbsVINo2Q6nC7oqsEVxE7lcYS0WoMTgAyC/Lw13S8vyW8XZPuFpUci
 J+gv8FgpIG45V12EKx4MQTMn6zMncXO1Pad4xgyy+1KqK5F+a++mKq22teLPR3/4dhot
 JPynCOuh2s3FUwn2Wcwtq4pzCUxwTGG+o45NkJ54XWAUFsUYWoCPKizXfes4YJqLzpvk
 ckKfXJQJU2fdYqsT3rAkgW2o06imF6R9u4NwJ9vFSyji7BOm6xu3S1mbYbT640kU28s/
 TmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Qy/98bA+oJCkEOo+yVU2o+cL80RhybFEw0Kuvnxh4O4=;
 b=MffsgLx3eq+IJLGuq3hHiZDr/10YZeEPQYF5lvx+U9AaUfwDSUyQ9CjpYAp5B8mSOE
 sD7NuMeLm8PFxgdxmY7hT+TgGMgsbMxHWPH5M+BYAjGYwOX9XgVxwrz4+DLU+hR1s8Wd
 r2fOgWc79Bib6SQU0AWJJeP9T0fOOzwIwgoOVmUW5KuqCAHqbYEE+y8p2y54YIDHP3UP
 jjG2ly6klRkAmuAKLdmSkxSlnwBAM21IKB8ITXIRgbfvBHlosE9JZ8DMK4beK3LCsIo0
 YNz0WKmSm9sih7yBcAfTEXSu7UcjDnu54z21sFpkh6BekFgTZZU+78J5o08SefaM0zBx
 RKGg==
X-Gm-Message-State: AJIora9ceQQw1f5oqGQ7pokO5fIw9rDVrbtlaLAyhbHA3Hzqo/RGueFo
 Q6Cu1NLIkjnu8S0H5z8pRrDk1janWEendNrhCp512Iqvvp0=
X-Google-Smtp-Source: AGRyM1sH/JhjZe4+ML5bL3i8EzHUCvDx/BsWjYuXIWFoVDC+HCqa6mi4E3PvFJu/WaoSvXeUSFj15cv6ZSnF8N/Iqn8=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr2016395ybq.140.1658162878930; Mon, 18
 Jul 2022 09:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220718135920.13667-1-peter.maydell@linaro.org>
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 17:47:48 +0100
Message-ID: <CAFEAcA8ajBC=O=erD-9GBMXO49b6731ApAZKceMV4mUsfq4G3w@mail.gmail.com>
Subject: Re: [PULL 00/15] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 18 Jul 2022 at 14:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Some arm patches before softfreeze. These are all bug fixes.
>
> -- PMM
>
> The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:
>
>   Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220718
>
> for you to fetch changes up to 004c8a8bc569c8b18fca6fc90ffe3223daaf17b7:
>
>   Align Raspberry Pi DMA interrupts with Linux DTS (2022-07-18 13:25:13 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is being held high
>  * target/arm: Fill in VL for tbflags when SME enabled and SVE disabled
>  * target/arm: Fix aarch64_sve_change_el for SME
>  * linux-user/aarch64: Do not clear PROT_MTE on mprotect
>  * target/arm: Honour VTCR_EL2 bits in Secure EL2
>  * hw/adc: Fix CONV bit in NPCM7XX ADC CON register
>  * hw/adc: Make adci[*] R/W in NPCM7XX ADC
>  * target/arm: Don't set syndrome ISS for loads and stores with writeback
>  * Align Raspberry Pi DMA interrupts with Linux DTS
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

