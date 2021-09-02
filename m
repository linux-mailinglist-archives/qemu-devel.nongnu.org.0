Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDC3FEA39
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:51:08 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhV5-0000lM-5K
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhTG-0007eS-SN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:49:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhTF-0006PX-6t
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:49:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id b10so1440291wru.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fctFsWp36xU8pFL6FZT0jm4ra6C9NBXZLolhAO7Eki8=;
 b=VYWf4A2+nwufi2+rfLKCCJF++8ddSlNfTv1y/DEYJnR43R6aTnL9GoeP33au2kP01X
 4+BpEO+RZeg3DBNiBIPK8qQtcsvd7zjfA4rdul6boe/2QDO2oy2jUn51qkaB/Gq8lZuw
 3Z1PjT8m75jWS0WbhjXghGug8xtC6rVEQB+HJ+TS+VWQ2u8vGDdjGeL1yhvQm9cIsluc
 OUv8mqbEDZs3WMK5QNs3bTA7vOlOmOEMOgIe9tLnEMl3qokE2Ywc1Yes4vpZ7qoal0q3
 Raecj1palzOv804jOvhhE6iZ5t4hab2/EH+w2bf9x5lc2JWZ6s6xG9NRUDU0GDLgwgu0
 /YJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fctFsWp36xU8pFL6FZT0jm4ra6C9NBXZLolhAO7Eki8=;
 b=Ylihb/QdFuiKzeVV7m72/zeWfDFjvmQwRqJkFzb9PwP9Kg/68TWNXhJaZ6NWWE5D1J
 j+3pXOEKLQU6lDS8rBEqV8O/XS2vp9WjW2i3eOfcFOjmFyLPjDGHg5CJLqrmCbQS6ad2
 mK7m+pvZSZherDq8W2zePHhfFG+cLb/TsSNPGcm/+7N/canLxEIXCncbQrPgYnveZXxP
 ssxud5ozDp9cnee9+q5GXSh+ILnEy/b3rn59L8wXFzNeEtlMacgktJQG1XoljkoiAury
 qwT20rZYAqT8K8OQHmpWyUNHXy58DLfmCkVPCoSSC67goF33Jn4ok9iRIA3poQwK+vCM
 pYSg==
X-Gm-Message-State: AOAM532ToBinSOcfZFm9RhCwXxnLVj+nmTsdUhxLGuZc6YWFzLDB/3Qo
 LW1nWwUAtUgar9QPku2FnmdsqfAitxZ+ZFgX5xu0Z8QuAjA=
X-Google-Smtp-Source: ABdhPJzyglCR3K91/cThb/okMuX9LnSMPeuw7GKVT6UVMhXNWaMlUyQ4jU7xVhtNdHzvYRqOdOQKMlp88lqtreorTnE=
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr1303040wrs.271.1630568951442; 
 Thu, 02 Sep 2021 00:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210901103653.13435-1-peter.maydell@linaro.org>
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 08:48:23 +0100
Message-ID: <CAFEAcA_Ht3f5e+h5GeFGEL-Juggp0bvxAYEUZmBPomo+U+BwBQ@mail.gmail.com>
Subject: Re: [PULL 00/51] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

On Wed, 1 Sept 2021 at 11:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit ec397e90d21269037280633b6058d1f280e27667:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210901
>
> for you to fetch changes up to 683754c7b61f9e2ff098720ec80c9ab86c54663d:
>
>   arm: Remove system_clock_scale global (2021-09-01 11:08:21 +0100)
>
> ----------------------------------------------------------------
>  * Refactor M-profile systick to use Clocks instead of system_clock_scale global
>  * clock: Provide builtin multiplier/divider
>  * Add A64FX processor model
>  * Enable MVE emulation in Cortex-M55
>  * hw: Add compat machines for 6.2
>  * hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans
>  * hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

