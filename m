Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79769C649
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:34:26 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i209Z-0000Mc-Up
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i208a-0008G7-36
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i208Z-0006hV-1L
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:33:24 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36923)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i208Y-0006h6-TA
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:33:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id f17so13449885otq.4
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wWhvyYwynS+P4F/wWvOseRqOVfRw6DTIe5vx2xn6tdA=;
 b=IIKN/5GdeHklZLQyG5wFMa9X3R4kzmxM4dZRdmI4aGKL4H8ACak4eznzf97k4g0IeK
 70shrL7YHCvQJCqYALKN9/6z98FwMsbOlW0JFGq7ZCEMWuLHCxW/ZscZ47tssXwReywt
 L/FkAG2+hFKg+FAW8/CFvSRQWC3reCGKTwvvr9n9BQqjza8cmXWhqHDX8yDUNbWMqN6e
 VkysbbN68yNKyOJ0Mfld957006y1aET5PklArB3QTPde9NvCTw2FjKdfCXIRcXoIgvsF
 lD62T1MCxGnJp1yICfWx4ChkDrVhLiugSUSSNxT8OQ7WLh9qMuCzXYzzgbHcVM1tMjd2
 b9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wWhvyYwynS+P4F/wWvOseRqOVfRw6DTIe5vx2xn6tdA=;
 b=LdzUdZIvsfzCnLCAsWbaM8MDnzLOYSpA67kkOPH1aU7QkfJWMzXKpHJU/4UHPM2Ak8
 2V8QAGqBtaHxsrGwaf0Sn7xj8VYzfiGI5qTR2OoYqE+gsWUw21yVEdzCwCmMT2n2Twz7
 c9a2ieNVCz2jmnPoJReSoE/pptuP6BlauJafZY0owEVKMnZYYriAjNLEvvtJOPO09k0M
 kbjeBabOD1dKwf9nZIITY3lYZFvI/idFSkxE63chyQP4xv1BGYyrKAPLRz1SUvD3aNaE
 IunS93C39elLtX+cVM+T2qwHfQCqNZ1JB6O608EvHvp7DwI+NLuwnh/9S2tDyZfLuMDC
 +8JA==
X-Gm-Message-State: APjAAAUK1CbMCoSxYHr87gdAGmOY+8ATGYdLTyvvKXOS4JVMbEoZh/Ha
 fx33MT2Fiu1vx9Vn/IOR9Df+/aCu2rE8M0nfLH+NOA==
X-Google-Smtp-Source: APXvYqw96VXIyWQ14oadNZi+dfMeF0pONwJ/OMjR+in+xVlBTkSgdFxA3LjHkP/R9HSIlbQ3WbpX4DgPlEyJmR+EGxY=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr1701801oti.135.1566768802331; 
 Sun, 25 Aug 2019 14:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-51-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:33:10 +0100
Message-ID: <CAFEAcA-ECSXb=FufY1haKDAVBqE92WaOOO6spKTWNMXEedzLNA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 50/68] target/arm: Convert T16 add/sub
 (3 low, 2 low and imm)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 26 ++------------------------
>  target/arm/t16.decode  | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

