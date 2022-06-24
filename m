Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CE559D27
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:22:12 +0200 (CEST)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l8N-0006Ly-VP
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyx-0001AP-Kq
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:12:28 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyw-0003ut-8V
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:12:27 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 23so4982316ybe.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKahIQy5cG4/Ex+BBA2D57j+sjQoy3Db0dxHJJCGPxA=;
 b=vne6pl7BU2QZtWwvB511ZbqNyf24cUQ1tpGPyo2TNMzbff3TWEbXGliPcojDTCDqZz
 w6QsBDtIOvrudn5AJPzKG9JpXCewh1AsEhh17tOCKRVN88IU/3PfLnNS0HWWTzLYVVdl
 5uaA6qNqqEzCsPsoa5b6dHmzZoaJqPlRMHAzhN2zWQnAiR0cEO2y8hHqQCIDgVn79kFe
 CkQke+b+vQKN/3MVMhGujBMW8JDSBi+eeAL9l4RrhuYUASVcK4nZzsTk5ZI5pEOwaF73
 gY29tV++slgMS/EOA3E6Prs/Rp+SbMtVZcaBjsele04kf1lzcT1az1G+RrU+kCbjNN9j
 Nm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKahIQy5cG4/Ex+BBA2D57j+sjQoy3Db0dxHJJCGPxA=;
 b=MeGoKHksKhgVOCFrn1Uz/Zx++5ZsguASNxMdW2Vv5wkthgA27dxp37DmUSmLBqWHwY
 EckEaLe7+qfjBOZIklHxnBSfoVWyZoMdPXolDkdzZg5XB+NJz2h3Baaakjv3n/60zsNw
 2PViREuSoOaLmcmADbcPjy8boaOBc/nF9uXdxMW501hb8SoHjrUTBTWk0LDWq1rU3zbn
 KicTJbt3Kg+3pI/b3HbW/98+7SuSn5GZKu8T43jABRn6q49OMcX6ZrIkHRD7xh+qf8hk
 OZ8QZ/ML//1KBoS4xVClvgBBMNlE9qEGEfF9QCyepH+PlIOm9LM5ZYZl818AYx94MXkK
 efSQ==
X-Gm-Message-State: AJIora9pT3FnFYH8g0xshWQYuiJcqL+HiVYmwSgn0sMPEhBkY+ORG2AY
 J6oNxR8Uob/FrAjM9kaGky3JvFS2vyfzGwKD5Z5vfw==
X-Google-Smtp-Source: AGRyM1uPwuIIHxCcsNP1yOixdr+w5+npbTJrr4fXH3k40Z0yj8Et6XpD18Y6sNc/01ivz5y4e5K8o39Oo+yRnkLSnJw=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr12662316ybk.479.1656083545281; Fri, 24
 Jun 2022 08:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:11:47 +0100
Message-ID: <CAFEAcA8fm0GT1JqE_zaOM+sU0KL4qpP3bRTNyt9VVyvvKZradQ@mail.gmail.com>
Subject: Re: [PATCH v2 50/54] pckbd: add QEMU interface comment for I8042_MMIO
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jun 2022 at 14:53, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the I8042_MMIO device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/input/i8042.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

