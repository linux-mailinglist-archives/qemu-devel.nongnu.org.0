Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B425D4EEE7F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:51:22 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHgP-0005M2-RB
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:51:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHdv-0003s7-Ob
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:48:48 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=46031
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHdu-0002ne-An
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:48:47 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e203so5058726ybc.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xY1xGm80aJbSBaS0XbOtElHY+m3ap2nfUKxTCqD4rCw=;
 b=PRVVd8rBixLcZgqr5rwbIt6+9QrPJl67LAozUwZg/PrGet/XWnh2zBnf9X0n7aX2yV
 yBcC7JTMS4jRPAW37zyKgKi5ZdGTdQmd5qCQv6QCrMUHsCsoaLJhE0f532XUSz7JTDtj
 X/IQF+upkEx/mSpUkMzr4EK+a1mIow62BjX6/huMr9S2+Fcax0v3/T0xKCr3cljtBYx0
 AO318VCSpUtYmDitwQF8KF0hWzgRGHeXW/aKihMoeBO6Cv7ixdXHS+tKOPMyWXybHG/9
 K087U7qi/o5q3ZTalvldIlS/uVZgsUmzzwbzY72+UO0F6ufEUOv1eNuwV5YcLZW6qsdv
 Fh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xY1xGm80aJbSBaS0XbOtElHY+m3ap2nfUKxTCqD4rCw=;
 b=6rYCXzH0ICkzZc6jZjR5nv0zsiE8QBSLMBf3qjR6GO6iuvCDSxOsWJ8bk1A9v2pEA2
 qv3j/SQwfJtOV1ms2y7XqJTjaJwAcgtg4L09mPhnZORrgQvgh0NVwunEadAW2HLPPC66
 6hw4t9xcIdI3iD3TMqaFnje+1rfZ4c5SvleFxEzIgYEOYs+4LW3oNg+2AjKtmho1s0rS
 M8e4mbaynawqrXCCemk5x0niKhYdV+qFB0RqAw+JQqJRv/1rP9LXdd+yxNxyqLp/OCY0
 8M5kjoX9XzUlL6Z7BO7v3DAQmLnoehM2xH/trb6svp6REVlRQ9M6BNOKLPHHKB6RJX8E
 erCA==
X-Gm-Message-State: AOAM532Tl3K7gOyQQvDY479iGB/Y+iXTovOy6RA9okWZH5kiJHQNJoXC
 II77I2aFZ8bYQY+d/qbZflYsR4BpENWGWOl4Ut7ElQ==
X-Google-Smtp-Source: ABdhPJzZEq/A/lee9gX0aPxsksqNNbeLN7QSC11TK5NXP1v14/N2mDoTmzWKV0kMuezMRAdXUMLRYPJzvECNjoF/N5Y=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr8777494ybt.479.1648820924659; Fri, 01
 Apr 2022 06:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-2-richard.henderson@linaro.org>
In-Reply-To: <20220401132240.79730-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 14:48:33 +0100
Message-ID: <CAFEAcA87XD+LO9rKsgV+CmFwvnsZx+HrW_u_MYavdb-NRffouA@mail.gmail.com>
Subject: Re: [PATCH 1/3] softfloat: Fix declaration of partsN_compare
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 14:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The declaration used 'int', while the definition used 'FloatRelation'.
> This should have resulted in a compiler error, but mysteriously didn't.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

