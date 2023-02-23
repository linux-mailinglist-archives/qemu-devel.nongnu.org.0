Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B26A0CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDIl-0003hc-VI; Thu, 23 Feb 2023 10:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDIi-0003gR-R7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:14:29 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDIf-0006WA-QY
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:14:28 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l15so14420673pls.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IlfosX10H75Fz0MxH8DjYMloZoMUbmny9+yf0k2mNRM=;
 b=TggfeCKHDibr+xhYVZfVWHCxyeL9DgiLN1qZOuFVYGLW+JBY6YkIkC31tspMWDc79D
 SE0s0vJ1LaAI5jHPeXCY3aKNL/Jdx2bfsfHMTeIkk4mkaNRiU3d3Vs7xVzLM5erpzPNH
 7meQrwrBszQrt+/inAT+BNk+/DAXbDXMVPXEDEoTm6BjN8uQ6l+C1WLhzp4P5yvgsPO6
 u0gZZchghuxvUY8aU3IGeFrYp4biUCErS0fb7PDz2bPdKLG7d3KB65T7CN7sY5qV7aX2
 uSppHWgczmXDludhxwSiliD44I7cGAFFp5fBwwNJu1qaEqwa2xivqHTWwkJPys40ouFO
 TxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IlfosX10H75Fz0MxH8DjYMloZoMUbmny9+yf0k2mNRM=;
 b=MYGlku62dfx4Y+L7MYDFLbRPk++MYZu2KVIx3SrJwz1VOXP+Z1zAH+Xv3l469fsr00
 vqBmZAAd1sF1JooO9/jF4g4Q7RTrHFiTdvN+Ch8MOma5MgBDuCznFpiub/V+bd8F7XkW
 U6W540R+efjaR8K0k9vlR8APDci7p71gomff/wTxD2B+/hG4YT+mgEuamcXla6TTnXeq
 u7LlOTmm2jFjlX9MHiRULQD9rIcQ5lLCeQCy2QFa2o2T6dmzPJC3ciT9tx4u5tZ/t6up
 BYCw3qnXN0IRuacNb5OnvwXkHHiNhWSVsR2yTttcE/Ksfr6NJRMN/TRvptb2lx6OHdRB
 uDZA==
X-Gm-Message-State: AO0yUKW0rJPCMjGmICqfn8AAw0Vvr7WCSZQA+N9d6UGFJWbCHiRfjQ31
 Oe9uYwrkYjFb9QGfZhZzWNQp4F/sx/Cxw1La+3Xv8A==
X-Google-Smtp-Source: AK7set/TsdI2SwrMZ2/dlB6hXM97w9SxOusxhU8dm9AsjhZ8JUI8B/jfHr12WX5RTrDkLtU21YfBAa9LR/FKX2mC9as=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1195006pjb.137.1677165264224; Thu, 23
 Feb 2023 07:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:14:12 +0000
Message-ID: <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We currently treat cpu_exclusive_high as containing the
> second word of LDXP, even though that word is not "high"
> in big-endian mode.  Swap things around so that it is.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 25 deletions(-)

This code change looks OK as far as it goes, but the bad
news is that we migrate the env.exclusive_val and
env.exclusive_high values in the machine state. So a
migration from a QEMU before this change to a QEMU with
this change on a BE host will get confused...

thanks
-- PMM

