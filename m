Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78786A9917
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:07:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY63d-0007CS-Jc; Fri, 03 Mar 2023 09:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY63b-0007C2-Op
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:06:47 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY63Z-0000X5-TK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:06:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id h8so2733797plf.10
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677852404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FdfEb4YRCyEREZ+0oyMFBEC3j+X9bzIDyBDU7myJYSs=;
 b=u5zWsLYhqLtfXfUsruhS7Rymc15vG5QTirovxVOiKR7YcR7vVdyD5RavMNCPIHzpbl
 Tm+E0rVHYBLrtp7enJlLMsxeRxz1rn/O2vz6LucDzHq/6rbuTUfyZ4WxHPytby196jPo
 yEO9aNxal+3ZKI11h2HvLHFmYsZshxGanCLf/wHgXJ0uEdVyrpYI6PDMm8CdAYHJoBzB
 lTkTgURX9js2BRRnebvrrdG4jjka6RQhlggdAySCL3QzOBLkkY0XyHIkWxvyRgV4h4xn
 79DVMOncnSZGDuwi9vBxVHQObU/iRcevO/TSUut9XcxxZIkU9A8z2sPVxZw1nqRbfs4g
 hsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677852404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdfEb4YRCyEREZ+0oyMFBEC3j+X9bzIDyBDU7myJYSs=;
 b=4Y64QY2pBd4J3Zhnyn9r8+f/ReetX4+2gBzILEpeVA6mFkIzxG1trOXnySkm+U6l60
 EIDoVl9w+rEiE4r6+TyH0SHiqp0nO+0VTnE1lV1vZsBQft1vpaeXZgV3QHU9yN7WZw5p
 pLEDP/MZ0rImGAP4IIkNFqLvr5fwX9vZCCQOjvYeINcJvVyVZhB0Ppdrwk9fbs8BLSqH
 Vo6jHXkOCjeS53BW/zJv60R8UdEp1Cbm3xHdEujJQsoz/DYJb6TxCeV92PD0r4aNPn3G
 y/L2MJbouaq53trtGeSbDCGKY6YeeAj2J8uiY5EZjYmvu5meJvTEVamOaiYvD+FQH5bf
 GdTw==
X-Gm-Message-State: AO0yUKX8fnvsMTO0z+8E1et+siA1F4u/o3vHAKNV6++w5N13SkGvWi6h
 1MmyGSHkvrAOjQh5VnPTXBaUJniJG+iqv+SonEJyyWnxq2qUDw==
X-Google-Smtp-Source: AK7set/dEMP99bKUCGUdwMe7WCSanTbV7ma1PSKHKjLuhmTmrroz80fqprWv1VIQSlShBSZLj7OPTHMgyE7tOTAUuuw=
X-Received: by 2002:a17:90a:d18a:b0:234:c035:7749 with SMTP id
 fu10-20020a17090ad18a00b00234c0357749mr627655pjb.0.1677852404261; Fri, 03 Mar
 2023 06:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227225832.816605-1-richard.henderson@linaro.org>
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:06:33 +0000
Message-ID: <CAFEAcA-PcckkLvL3iyoXopkggxwqr3OJOR0AKk4EV+m2DDDhbw@mail.gmail.com>
Subject: Re: [PATCH for-8.0 v4 0/4] target/arm: pre-FEAT_RME fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Mon, 27 Feb 2023 at 23:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These were part of the v3 RME patch set, but are bug fixes
> that should not be deferred until all of RME is ready.
>
> r~
>
> Richard Henderson (4):
>   target/arm: Handle m-profile in arm_is_secure
>   target/arm: Stub arm_hcr_el2_eff for m-profile
>   target/arm: Diagnose incorrect usage of arm_is_secure subroutines
>   target/arm: Rewrite check_s2_mmu_setup



Applied to target-arm.next, thanks.

-- PMM

