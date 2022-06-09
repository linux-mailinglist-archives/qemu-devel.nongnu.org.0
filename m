Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FF544D3D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:13:37 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHyi-00078M-GI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFm9-0004PX-LR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:52:33 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFlv-0006p6-Ke
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:52:27 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v22so41121929ybd.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6n6dovJPObm+H3LW5naAheIKSyAqd5cIE43RLXimY0=;
 b=Kvmo4Lb94YhThUT8/U6NUrS50t1M1O7/2T81pCGxsJnxggzrT9qmF1eXxpfTBhouuf
 hhMWB7mIrx3Qd3ANFKJxIkl66OZGjQweZL2ycR4/5ujYBLlzCIQPO+BzVeUgjlp5PRCJ
 ccEVKvZeEIPccPdaaN2tUTI0/FMkf2nK5TV8HllQP5n9P5bPiAjGtA9qR02bOeSeuRzJ
 FJuTqf6hNupiZs6I24+8qLUzPY+y0CSn4qQovyHSmCSjQw2YajveIsAf0tU9KI79Lj52
 T3xl9EAqH8yFHwE3HIv6awFnW3H2YRQvuOWo7PUJu8UtqShg54nGgzOf+P80nZAUC8rr
 2T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6n6dovJPObm+H3LW5naAheIKSyAqd5cIE43RLXimY0=;
 b=u7yd6bWEa7sdXd+hBM7C+ksG8jjwTG8V3DgnFId+WWSjc/KJnaGD/DzLXvW3HxyiQL
 H50bSElIKlXMsuTkkF8ttfCzOF6O1zHTj7FUQdwFO7ao/COqSpZpSiBlpczi/lr/QV3C
 zZWRrmxt3LeXd/XHQktrOM9rWsTMvLr1GaDthJXg+/ogi4qKNmiQQgjh26xArIXnpk+T
 jJYxWWukiMDJR/KIJoPMnXTOtdPgldv+CjXDRzOoYgwuMr/jzxI93O/2noWYdlb9El4S
 Wkt0m2kd97GkXo0f4B1TkZAW8XCL9ZCARebcluH86OnvWjKVsEeYooqEzfiH8qn1hWw5
 PuyA==
X-Gm-Message-State: AOAM532WzxrTXSWRGz0Np8HrV4R8VnX48aDjhMDM0rAJYp5P9Nz6HadZ
 tzOUrTBLPcGAFrrICNWgNhCN/1eUWd0raLs9y9FY2w==
X-Google-Smtp-Source: ABdhPJx7JZdH3FDSKj+TNgjwDSWY16HqJ1oCQXFWmLTNfRf5oJuiJaIsLHm5knev7kqWFeHX3hX3wM3omGsgTnaBIlc=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24884038ybt.288.1654771933462; Thu, 09
 Jun 2022 03:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-26-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-26-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:52:03 +0100
Message-ID: <CAFEAcA8GEEZktiQzbMvRKaAiEa-PZcEGQ5vVinPw4ukEOOLM=A@mail.gmail.com>
Subject: Re: [PATCH 25/50] pckbd: implement i8042_mmio_realize() function
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the register memory region to the I8042_MMIO device
> realize function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c         | 12 +++++++++++-
>  include/hw/input/i8042.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

