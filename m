Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA873C1AEE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:19:09 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bQK-0001Vr-PB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1bOm-0000EU-6P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:17:32 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1bOk-000283-KO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:17:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id eb14so10656852edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cE/E7Za1TJ+EqjbBH7uyqCcG1r1+v5Bp32HgG5zzCU=;
 b=ckjWo92DMzruahcx0tP7Fa6LvhK77fcJnhgB46R6DWOUQX9OY1WjwKfwssDO7dsc73
 UmxWWAmc74lLuKi3izTZ+eW/BpuD9mkLrctVyCCbBbz5ZJTIzHPRwMyIF+FUtCRtTp9K
 smr62Nw9vdKwEj3leUSXy/FuweeeX3W9lwmUD+TQ3o7CCJ1lHB1Vn5X/p+FJvouaVa9o
 IfmHdFpJu3PrYxEA/mvlZbdG3jtpbXeRR3odom7iyLApi25SJpY2UL7tsOvjE8r+sASj
 jwRhDGG5KvDqRAws58bM6kYYxrNg9qPVfnuxSO2dY+5y37LLihbk0dP0AYcNhxyLDKro
 zYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cE/E7Za1TJ+EqjbBH7uyqCcG1r1+v5Bp32HgG5zzCU=;
 b=ubWo9vDrqEiF8+n0fUDC8+ltOPSb7GlItd0VEOtM5/DSLbSAwNN4e8jieF3eqFlnaC
 TTdbg30GxtbIVsU7v/1BT5cFqfjBrlk79YewnAYLbhtSLHGJJAd6Zr46nDT2Zl7u8k64
 FYFzN13E9roOkPKYgJcZ/rL+C02ybMGO70cEIouH6+CrFZBzQ62LEP+6IBxGzt7sd/cm
 21Vw2isuUvSAFoL5rDSj73FmtF6ktznIxkAQ/Pj2Pr+AIrzLytwjcQAXhecvoGVCFPPC
 0A9uiRVLMyo6ikdHx5Md3nkc7P61PRCMtqqGObpODtm/vjgcAiwqtrUDxMcfu6XfcvrZ
 DeXQ==
X-Gm-Message-State: AOAM5313giUr85dwWBgWvR+vqrPFbdgpLltKKgG3f33wrdAedaGkemj7
 BgljszJsLXTTC/WOWvK7W8S2mtCSwbexCQS9nVKvyw==
X-Google-Smtp-Source: ABdhPJz2tOBVXP7T7pz+fTVZsSamstx+cNAdMNVXJ1+n1dtx/PwWLzGLl4g1oGsCaEXTFdae0Ps3lRX+js1hFDMHIXE=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr19546351edy.44.1625779048704; 
 Thu, 08 Jul 2021 14:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210708100756.212085-1-laurent@vivier.eu>
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 22:16:50 +0100
Message-ID: <CAFEAcA9v-nwa=PZFi+-RxGMckmt5zXQ5dmxKHZh0G+T3nzCEmg@mail.gmail.com>
Subject: Re: [PULL 0/8] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 11:10, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
>
> for you to fetch changes up to c632ea1dd90313bc360b9de9d5014c2167f4d038:
>
>   linux-user/syscall: Remove hardcoded tabs (code style) (2021-07-07 21:34:21 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 20210708
>
> Code and style cleanup
> Add ppid in self/stat
> ELF_HWCAP for RISC-V
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

