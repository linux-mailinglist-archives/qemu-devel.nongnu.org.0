Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0350A8E7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:19:57 +0200 (CEST)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcLN-0004T1-3j
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcFx-0004Aw-OI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:14:21 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcFv-0002sn-Ag
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:14:20 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g14so7133379ybj.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UIbk2iEknwImbrFKa751tmOo233l5Qv0Kice8GI1KKg=;
 b=tKPdidH+ehHvzdWZpPkNOkL//s08JDKlW/G2XImv5LMcbQaJEHK2SvNoaw9lzXROuM
 bN5dFTuRnUCle7WppiYIp5vmuHOSQsg3ZKRhxlQEXXI8ukaqzmxPBPAFdC+RA+KjUA58
 s1oEo2eUv2w7C2Jx467Rk2FqWVk5g/swNl0oJAirwnsJO48ci4pxmLIKivZOmPE/dBkF
 zSg7/yWhO7zUnYY0QTz7BX/31yMg041K9P3VTGDOi+jAB72QCvCGCY3EI1TsdSQjgBUg
 hTqqcilwJ0g87u8ftutv5W1q4klJOJAmtLpgR4EfAm1EPwcTzwjb73KvvKka/WkeI3qo
 ZmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIbk2iEknwImbrFKa751tmOo233l5Qv0Kice8GI1KKg=;
 b=i9SaYdGIXBW3jhszbTSaKSfip44QGIdOE9LHIQzgJOuibvPaDRK6eMC+L9+6uYevwy
 apudnRuI5VB5UbqjFpXU81q3x8NYuWb2UqtrV5e4lrfmV2Ah32GwpbhZAtjAXP2/GQZC
 ymPfy0B4PWkLgcvTLJc0QtW+byWBlBK82nxCg7kXdnPF9cmfVEfKPZOANvzG+5QMgbvF
 ePN1HAQdXsOiQbLrmjJz+n3KMhNVPCU6oUH87shjD2BpSM2iE39xJQQgutvAHP0bn2H/
 cispktWYBzXZjWdAf5icjUiaNkijKHoesf6SM1MfpgaLFSj2r94jF7cI0Ch1RzxfHqgu
 TnUw==
X-Gm-Message-State: AOAM532kPzskRglECw9Bfq+vqqUEDDkixs3m0EJpQIPh6sLfce6DgyD0
 HOyq+EkGbfb2fQiCIxDNnsKmwU72TanjMc6EKGCMsA==
X-Google-Smtp-Source: ABdhPJyBsNCjwoPa5/CnqZ2eu15FqTjX/gzBSMBUfX7/IUP0vWHQTf4I0uXgdoCHUj5Z5orS0N5p6cS0ktb+mN66PgQ=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1225496ybq.67.1650568457414; Thu, 21 Apr
 2022 12:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-25-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:14:06 +0100
Message-ID: <CAFEAcA9B9Rh-VG=yGVVXZOgY3_Lo6yt2MMHv1yPGqofxhwPsgA@mail.gmail.com>
Subject: Re: [PATCH v3 24/60] target/arm: Split out cpregs.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move ARMCPRegInfo and all related declarations to a new
> internal header, out of the public cpu.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +#ifndef TARGET_ARM_CPREGS_H
> +#define TARGET_ARM_CPREGS_H 1

Our usual style doesn't have the "1" on these include-guard defines.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

