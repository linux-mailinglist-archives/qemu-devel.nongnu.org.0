Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21833101B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:56:40 +0100 (CET)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGND-0004DI-OK
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGF9-0004Bx-7K
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:48:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGF3-00089e-V4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:48:19 -0500
Received: by mail-ed1-x52c.google.com with SMTP id w9so14752208edt.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=jAaJuggh3W4/P5yBEsJvNJ8KxLLjgg4gEWxzuz0C74I=;
 b=Rty85UgRYzVRHGD1XoV4TTAus83IM13rqn1cLwpoZTystbSp0UbIGUrCFFEl3ggBJK
 yrPdNapgXtsYFQ9rJ/Vi2dltmGix6TF2TqeA92kKoNGFtKwZ5Di7Rnp93OnPmrD6E0N5
 HCc92eAsbIA977IGE/7Oswrgfzk1sbsxvMpUn7yY5jE+o+3DL1lw7xWYuyeD7v/B4h7v
 RNnPr1xM4BNnLblBQoX6ClOWlXXFN5QIIxP5TWVqqbZfVZpbxuoWYLbAiedVyajmn0QY
 1ehHrY053UU+Az0fLsDuC+meruI9WsBk0s9hP/Z9EeWTaCb2Zq0wdMNXPiE3HUPCCY1w
 CV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jAaJuggh3W4/P5yBEsJvNJ8KxLLjgg4gEWxzuz0C74I=;
 b=hend4Ek60OXDfWbgEmqThMv9MlSEUAlRglra6eIe2VdXHSv9DHCYazVPtGmNSMttgc
 ctZk4DBEhJXBQ1u4y/f8iorL4NfMYd9A7PM7kUuLL7g5SYaRAcVeKKq08KD1+lfrt5DZ
 2D9UTF+ZVE4H+Lgjxg//wEXk+tLdSDb2qUU5CQYjVL1hn5MZrJqHvzgkGf9WhKlWrfrB
 Z3Jf7dC/AN/aOrsM2HLae31Q3DOTXYwBlE9ctWXRUl6AkXWWtNppPloTGvTVGXmScJ3T
 sEci63LiBIq/K3EUFOW3xiMFSNXQfD7GBxIKpXL6mhj4kgVO+Ad4SnljkjCdAo2wkReh
 uBIg==
X-Gm-Message-State: AOAM533u4p2ctYdaff1WiqaGa6e19aU8/NBAglE208Ax79Rd20tNjvCT
 +V70UWNSzDRW5X4HNbOOsc63pmyzkIeMKoa2iekaDm368KE=
X-Google-Smtp-Source: ABdhPJyF1d/rAJ2Q0QJh9UysETDPMFRQcJuGpJyHRoyxlLOpRCAE89ZyVS3Uqygumgz9ZN1UUAMwdQxx6DzW1cbzvf0=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr21953855edr.52.1615211292220; 
 Mon, 08 Mar 2021 05:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20210308115709.8226-1-peter.maydell@linaro.org>
In-Reply-To: <20210308115709.8226-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 13:47:55 +0000
Message-ID: <CAFEAcA880udP6TppxFB7peOJp2iNtMo4HRqquHubrkCDNgjTBg@mail.gmail.com>
Subject: Re: [PULL v3 00/49] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Mon, 8 Mar 2021 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v3: fix test failure on 32-bit hosts due to new board defaulting to 2GB RAM.
>
> -- PMM
>
> The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210308
>
> for you to fetch changes up to 50b52b18cdb9294ce83dd49bb60b8e55a6526ea0:
>
>   hw/arm/mps2: Update old infocenter.arm.com URLs (2021-03-08 11:54:16 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * sbsa-ref: remove cortex-a53 from list of supported cpus
>  * sbsa-ref: add 'max' to list of allowed cpus
>  * target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
>  * npcm7xx: add EMC model
>  * xlnx-zynqmp: Remove obsolete 'has_rpu' property
>  * target/arm: Speed up aarch64 TBL/TBX
>  * virtio-mmio: improve virtio-mmio get_dev_path alog
>  * target/arm: Use TCF0 and TFSRE0 for unprivileged tag checks
>  * target/arm: Restrict v8M IDAU to TCG
>  * target/arm/cpu: Update coding style to make checkpatch.pl happy
>  * musicpal, tc6393xb, omap_lcdc, tcx: drop dead code for non-32-bit-RGB surfaces
>  * Add new board: mps3-an524


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

