Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD04DE765
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 11:11:03 +0100 (CET)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVW31-0002kg-1G
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 06:10:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVW1f-0001zG-Iy
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 06:09:35 -0400
Received: from [2607:f8b0:4864:20::1133] (port=47026
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVW1d-0004ZM-Qj
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 06:09:35 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e5e176e1b6so35410427b3.13
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+m37atjnmPoxsLM4dqFpnun4PqsP8CNWe7c8Y89J32U=;
 b=CUDZ2HwMM7SnMCbozvaZQtzGlndHPKDxUW42dJWfgeV2/0as7QPTWEKaug8+ncfZEQ
 eY3wmLq1jNehk7fcwNOKBQ01uMKmzvjiU+tWOZA23qoKawXPP6SNQX99AIvUV7uYJ8wn
 QQ888pZtfZGDpQmgu14TGdSbmTgBJ15/2lsn4SFWGpl+YMXpMCxV6Z1rqdg9Mo9GyFYw
 Fne1oC73mZ0xA/VoOokpgxTGXdhUYHQh6/B/AmRBfIYovZWDLUb1PKh8sJyeo20WbuDL
 BtFCqX+j/Tz8dQ0ogCwtQeGTo1orxE/+VfcJWXG23L4BROYaNzYRSOW7BIrRjgBI9cui
 u40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+m37atjnmPoxsLM4dqFpnun4PqsP8CNWe7c8Y89J32U=;
 b=Tt0EceEhPF9QiWDho70j+1zyA5poZLT+Qz9NCRSg17RMm7454Hv0FHlqiXru8jesJM
 OEJNSmh0RKUVliNyidyM9Va+X7cpys/lOTcpbHjZ381iAiWgBEHzh0yhkvEuJksM9HaR
 epgJ7odmCg2uACaF75iMeKm69Pr4HIylfIqQFFRIDeJSmpaQaX0Ki+kaAHFyTRlKKrjw
 w5LSOTC12ONA0CjrYrjZzYZxecvFdvqYswwJAtGriisFz4Iv34H1g8rbnJidhNowSsm6
 45I3x/jQAWNLIKVp1yQgIkQeXEdws1AlQP9v/NEu5cnVi0STK1iet8YzEgLXc9uDes4L
 +XcQ==
X-Gm-Message-State: AOAM530YaKsl2tmGc+5TI7mtaLnVekgnUBJg+zp6NbIkLJzzeQqSt2OY
 9eg8u6qOOdKKBXbnm6+ppbbQkutkllrSfn/vgJOGGEAjXb+CcQ==
X-Google-Smtp-Source: ABdhPJzA0P9eO9pWXNWcIOormZmnqO+qSi2Esynw+ZTBtzDTMIJCjoHEDlN+WYwm8D/20Zq0pIdFVIjT1jYk7vf0nTg=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr15727023ywf.469.1647684572399; Sat, 19
 Mar 2022 03:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Mar 2022 10:09:20 +0000
Message-ID: <CAFEAcA9YE7cw4eUT5hWj576wRFPn+mb3Dp8z=tWigUoV93xmMA@mail.gmail.com>
Subject: Re: [PULL 00/21] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 13:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Mostly straightforward bugfixes. The new Xilinx devices are
> arguably 'new feature', but they're fixing a regression where
> our changes to PSCI in commit 3f37979bf mean that EL3 guest
> code now needs to talk to a proper emulated power-controller
> device to turn on secondary CPUs; and it's not yet rc1 and
> they only affect the Xilinx board, so it seems OK to me.
>
> thanks
> -- PMM
>
> The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
>
>   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220318
>
> for you to fetch changes up to 79d54c9eac04c554e3c081589542f801ace71797:
>
>   util/osdep: Remove some early cruft (2022-03-18 11:32:13 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Fix sve2 ldnt1 and stnt1
>  * Fix pauth_check_trap vs SEL2
>  * Fix handling of LPAE block descriptors
>  * hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
>  * hw/misc/npcm7xx_clk: Don't leak string in npcm7xx_clk_sel_init()
>  * nsis installer: List emulators in alphabetical order
>  * nsis installer: Suppress "ANSI targets are deprecated" warning
>  * nsis installer: Fix mouse-over descriptions for emulators
>  * hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GICV3_TCG is unset
>  * Improve M-profile vector table access logging
>  * Xilinx ZynqMP: model CRF and APU control
>  * Fix compile issues on modern Solaris
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

