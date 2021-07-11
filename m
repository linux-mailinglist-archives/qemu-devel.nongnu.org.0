Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905803C3CD9
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 15:33:15 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Za6-0006Va-F2
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 09:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2ZZ1-0005S1-N0
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 09:32:09 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2ZYz-0004CA-Jz
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 09:32:07 -0400
Received: by mail-ej1-x635.google.com with SMTP id v20so27767418eji.10
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=V0i+55y8QedoSYYbR09hqhnjhgEgaAsy5aXsbzT2hHc=;
 b=LO97eTUUvkwz9QKrQ/gP9PyEoFGVqhj8aiqFvTzPz5vAO7iOayoxHlXeo+57vl3kzj
 V8tSUTM9NlNhzeV9+iVFE416Pf6wBMW3Uzu2kDXz1NtDkPoXXyn3rTH02Hw9Up+LXsID
 FR6n+CMs/h5A2Tmz2VKip0AosRhLVrW9N7j+xpuICsUImwyEH35y0AXQJ4JMK/6CGNOf
 I3A9VINStrQnpe4M7XxzcYyQYGDs+nZDGmZ+0lR37QLK1wY2CQIY5QX0+fAjvBmaHW/x
 WtpA9lukAdE96O7RirGw0pe49+HGspWZuE23OoHFAlDBSZ31x9RWK282yrIXQLnMXIlK
 k/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=V0i+55y8QedoSYYbR09hqhnjhgEgaAsy5aXsbzT2hHc=;
 b=h/n5ncmE/2fqgNc0LALaSQzfsl6xGHDRTM9JzHGxi5AytpGXEqstU8dB6/3Lb46ruL
 DCYIJE+SkVCJczCuMJ35iXUtuO9Bp2+hkoJ+PI0fFBsbZlKJu5BnxeGQoorISo5GOWH9
 /dAbIBjMmWztul6K1pnWyhOj0cm+2pDC/NtuP63oFdWnikjyVHT7NnOGW8u0xn4xzTxK
 BcebY5PDZQF6J90Bmiks4tFBMUEkNKTC8Mxj8q0ss84ECVwOEJwUeUTzTYTzbLZ74kuM
 X0sXsvdQx/xf62BLUDOJLU+7kThFXaXYreMMU8HM0wosX5NP4gXd6tk6PO0GQ9dTtYx4
 5W6g==
X-Gm-Message-State: AOAM531d9CcEpPwyvRWW3Gc2r+pm8psYO9TuhklVm9G9q/BI/YcWk4JA
 n18j6UBH1Yvgj5rvvTPX4jMXfZgRMmg6c2z+olqZqTS/BqKwDg==
X-Google-Smtp-Source: ABdhPJxrp9PhM8xGKCkE/EUvSAF31E0kT+1yL64OihPCN5QdskszCGVUji7QLKWz/ZqCo5N/NKh9Xm3ohaAMWTlhJPE=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr27769185ejd.250.1626010322641; 
 Sun, 11 Jul 2021 06:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210709161003.25874-1-peter.maydell@linaro.org>
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 14:31:23 +0100
Message-ID: <CAFEAcA8=DHZji=gNZm2QA9U_DOtvW8GY0HZ=6+GoZmfb9Fz5fw@mail.gmail.com>
Subject: Re: [PULL 00/17] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Fri, 9 Jul 2021 at 17:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Arm changes for before softfreeze: mostly my PL061/GPIO patches,
> but also a new M-profile board and various other things.
>
> thanks
> -- PMM
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210709
>
> for you to fetch changes up to 05449abb1d4c5f0c69ceb3d8d03cbc75de39b646:
>
>   hw/intc: Improve formatting of MEMTX_ERROR guest error message (2021-07-09 16:09:12 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * New machine type: stm32vldiscovery
>  * hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in icv_[dir|eoir]_write
>  * hw/gpio/pl061: Honour Luminary PL061 PUR and PDR registers
>  * virt: Fix implementation of GPIO-based powerdown/shutdown mechanism
>  * Correct the encoding of MDCCSR_EL0 and DBGDSCRint
>  * hw/intc: Improve formatting of MEMTX_ERROR guest error message
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

