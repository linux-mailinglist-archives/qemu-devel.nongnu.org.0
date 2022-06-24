Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29EA559D09
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ky3-0004QE-Nv
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kw5-0001GV-1V
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:29 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kw3-0003Mo-91
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:28 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso27562387b3.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Fszd1S2MM2MRIFysaVmxB7J/fcffczfV1LizDmSfq0=;
 b=mbdHZXVbqSCoE6oy7KcZj6jAEYmBy2TC1LqNB5UD9a9F66fxeup4ewSK8EpShLiStb
 vCGk3NPWVZeHFWOKdpIyIAn7Kx11QwHu8pLhBrmQ7dXt451dQHpPtThQ1411FALzW+St
 DmPR2qhgqa4xjZlQAwFe/Y0EAiAK/P9U0v9kx79foSltZ6nT+6gROVraV2gjZTYg16gD
 NWi2HFkA5OqT/+zaRmX18H8rPdqVruW6kCE8j1p/Dw2DjWobk/9OPMUtlKjhtB3YqPQ4
 KdXzWTWyocllQ4n0hpA9ILwfM8P/iGliP+UZVspPx8GtWjJXpy+s2g65VkOIUfGrUBcz
 mzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Fszd1S2MM2MRIFysaVmxB7J/fcffczfV1LizDmSfq0=;
 b=LTqDXQ0JAWF7Qc0S7yPRjY6ZF9Mybgr9DwvGP2fgj23qoET5Zj6YoLZxW04hIOh5ie
 W/8Z0+B6lhB7NZ6X5nkU5leh7uR2/rGKavZb4xw17QKufLOFz8DjxYnoqlfCPecbWatr
 CXj9t3Z8hwfuJAbfki+mIKbCESo+rdn/Yq64yLrqr+xlpiDT50LgYnoXQQ4qKj8vPcj1
 vy1pszVkeRfwKr62BWOpSQDJgp6sh/ssuk8OnYTim6Qpvgec/YAL7YguLschA3wXriOo
 YvjeJsDub70NiUV5vXfoZonw0xG++Afn93j6CbsXbPPbQ35XXEHShARcgvmZ1Py0M7U9
 W7tA==
X-Gm-Message-State: AJIora+js5e8A3e3wvsPNjX2o3Ozfkjx6ms99uz2QyPj05SNKPVXw+Vq
 nNUkSEG8L7TmUkrwjLmoH1NiusHitMSKZxxJCfakSg==
X-Google-Smtp-Source: AGRyM1v5k5+feDVpBJeePnG8jK39ZM6jXKGYLu8SS2MYO9w0anAI/8k8lYpzQnggE7cJl73OGFjqunBv5/B/sYhpvXw=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr18066349ywd.347.1656083366295; Fri, 24
 Jun 2022 08:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-38-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-38-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:08:48 +0100
Message-ID: <CAFEAcA9TdeNgdjjfS5kHsykjN-Hz9pKL1o4AAxqcqt0ffp3nYg@mail.gmail.com>
Subject: Re: [PATCH v2 37/54] pl050: add QEMU interface comment
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the PL050 device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c | 8 ++++++++
>  1 file changed, 8 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

