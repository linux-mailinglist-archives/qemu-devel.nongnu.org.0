Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB665451E8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:29:30 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzL2H-0005bI-Bo
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7n-00044S-2V
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:31:08 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7k-0001p2-9F
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:31:05 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso244579867b3.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxCMzOxDZkayrkSFy7hjnTQ2NwE0Zau9TIRgcPxD/Rc=;
 b=Ryw8j0+fm/27vS6IIF09t+YloHjCobqEYjEUxy6u9QKvZ7jQYxTGuRSJ7tmAzCK6tA
 iFM/3UmDiZnNvWlDbTO2lZpW/si7SsJZVHxVNPOWT8IGoSzIlDiO8zNRYlRfH6Qkf2cD
 p7rPshJ0xZM2dVVOLXdnfTlqaBF5s3yapnmtkWXq5M2wwLqSZnjvIn0kGs9G1UyHyNL3
 JSdVEaEt/iQEs1NahiHRrMlrbKySUAPUPIFC0fN/ZEhhfUP4s2oUnhNMrwiHJgMPpEn3
 WomeH0b/0NQdgnO0GUCOz62JjtJUURZNLTksm2iIhknrleF4fXZdgOO+k+QXb17ASN9s
 P9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxCMzOxDZkayrkSFy7hjnTQ2NwE0Zau9TIRgcPxD/Rc=;
 b=MxOrpy/PcAWM7gnXFm0Hb0PNHjyjhMP6OxiqbLuW11AYZ1acqtxNlES5t21G4cDXSe
 RukXWrOY02k9/sxIvxegrQ9QE5YxLrqKPAcx2/gvku5Zdu2eB0nG+Vino4U2JGnPn3cK
 9roojxHCtlQO8E8vL3PesoMHLUGauKSBl/qnDywp6ZoN/qOj1O4zSHPBav+6d8HqdVsw
 BMFII8fZoLN7+9jm5c9Iy9LKnoytvityJMjFqVnAVaaIl5eBwJEZjLNNh5bAJSOv88l/
 Juc0uvO+NlEJ6xCwSRbr1xraB+qBs6c6J0+k/CchcuVZAuaRdI2q3Hfs1QVqKvCO1uQI
 wZCA==
X-Gm-Message-State: AOAM5328dzjItaE+ofxz7MKvAhgFE55aOm7OOh5g1xb08xAizH0k8RSq
 Kc6Kxeo5t/NZD/rYZVeO9xVhEI9OwjPK25s57sZZS0yOKxU=
X-Google-Smtp-Source: ABdhPJyVKdJzU8GmBF7mp3EyXMVoabNlt6uK4y2bYI7sNSecjY2zSQi6bCUtUxDtoZwhjNWOo+YqCw4WylCAcNjlmbA=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42345408ywc.329.1654788663190; Thu, 09
 Jun 2022 08:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-34-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:30:52 +0100
Message-ID: <CAFEAcA-K9tSbkUAOFhHwBxcguaFgBW3K-cFKAa5q_1PZwvX7fw@mail.gmail.com>
Subject: Re: [PATCH v2 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_vq, and take the
> ARMVQMap as the opaque parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

