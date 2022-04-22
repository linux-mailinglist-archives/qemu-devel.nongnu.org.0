Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A612D50B70A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:12:21 +0200 (CEST)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs96-0001dB-GG
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9L-0000Gv-I5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:08:36 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9C-00057b-Sw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:08:28 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i20so13834624ybj.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2hD+lRJ8kqNJdKjKRHtgESEYeoTaS4cvGosPA3HIyI=;
 b=TOetFUU8HJvOCh/P5gbPfnw3ZtG7FoJC9/SjMJzwEjDwbmDGrdmGxWOT9VQ3XDjuk7
 5IdlPx02zuOnbsGzCvYMduE9Y8jIPxJHd0cLTkgyLhhojYsJhUXpY8Tyw1YyBHEWmr4f
 62DaW7mHYANRTOGesObfaMDvfWnIX+vZP8sc8AXlVSTJVMkEynR/6pvLCZoLWt0/ImHH
 OvvQdiKpt47alNoVGigxBaLwBw1XFvWV2az343Qap930cqAPWtgnn89VdPpwGfVjSWTz
 mNQ/pI0JRWPWeTGIDAfYpYnKksERf94ClFCdc+IruC0KYUwx9/EllTUqAiGqN2SX6ywu
 NSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2hD+lRJ8kqNJdKjKRHtgESEYeoTaS4cvGosPA3HIyI=;
 b=z/3QJfS5fb6euVkIOKEytVnUAyAUoD30YqrkUBOR8NpqfYJeNbCyYXfOVPwcjQEpHn
 WS7oXCHg5xI/qf311ZJQoNpUsSZTvq74xoZfRsmbO+NSfoTMJOAxB3DxWMBNwrJVmHvv
 pi2wrccZTT2JbeT3fAxNtahnB/Mxx4P6R5QVG3timgOwouyvG0qmjzlIRf3jizRg7RVe
 tmad6kK4dzruJUVcsjPfrRxL6YccwyejYbU3V8li5gmO2DCztZ2Dt+2dG19bU0nZzR/Q
 QLLbIw+g4tIbeZzPY/IBe2yHmarybFosxSdzgJ24JH77Xz/DuXnKxmOpSUbdl86H0+rS
 iwtg==
X-Gm-Message-State: AOAM530LXPffIV63/fXlW6dopdjSANGg6JGEqRMLsx5LH2gExh4cqUfE
 2rj45blCkvlK+P1PX7O4iMiNiskEYCj0fJGA+pdt1WiGjaE=
X-Google-Smtp-Source: ABdhPJyK6bsMcQSDiRzAoo78EfGlPWC+v6EKc8HtOx9ejQwCt7chS3mqg55Elz1V7bRtJq9boDZXM9fmOE20ANIc2jY=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr3752709ybs.39.1650625701205; Fri, 22
 Apr 2022 04:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-60-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:08:10 +0100
Message-ID: <CAFEAcA-77AcEoeVd+mq+Wq64_Mi_9jGwc+mUVS8G963QD1Z6qQ@mail.gmail.com>
Subject: Re: [PATCH v3 59/60] target/arm: Define cortex-a76
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Sun, 17 Apr 2022 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the a76 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

