Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56D544DBD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:33:17 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIHk-0008Os-WE
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvG-0004tg-0H
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:01:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvE-0008KT-Eg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:01:53 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y188so11668787ybe.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMRFURrrQxTa/wPA2d9gKTuLfzdKlF9ihL/79CT5nvY=;
 b=F2b6BzN+Hc0JIU2WbnuA87XsyjrKPFNJZDdFtPM4AUuYZ2HY5SzaoKR8HCFeEV20ka
 BFHI7eoiCmMmh7WMmIOBANZubbDkyRkW7XP+eIaRqC0Fi4QdMmIwVLiuk62aQq9eBBlP
 aJQg5Twg4U/y3OxCq7mNLfYA7T+hGZWVNxen1h7swm3oOzSygZ8MBgcNuavWiSyu15PB
 dbPVnkh9PgwtJDpgW0Cyc9u+31vl4vEEfssEbXSBUlA9C1GWnFI8m27FB1ovAYacFtl5
 XbrsD/YXjD8sbMSRCNcboMwHBp5ZSBDh0bE2h/hr9vIpYnCxkPbmPbTXdZLtDfwcZP44
 /h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMRFURrrQxTa/wPA2d9gKTuLfzdKlF9ihL/79CT5nvY=;
 b=VEnCvaweb+38KA1CQzFJUvI5lkJUROSzoEERldROkHjj5p076z0aVnpJYgoeeSP4RH
 xNtQlfTdLeHbTz4Ggbne4Pa0KPTweijfQvzI0RCvvzTD2kDW1MMXYTZsCVCBR7RsUmgy
 Tp1p8rTlPWGQQbgM5W9B3G8Q9zOt3mXFRSUA41/HrnKNuV9exRpfq5NwutpvmNl7UxZx
 rbi/LRHQT6lQ858m93GAZsKXy/DRWg8ss/5VAygyUY/vqPEjlglKi9vcweGmBLCiEFvQ
 aRXVF0LnjCEATNKYIJ98nxoV6LiMG1Oeof5xDYt7HWYVJLaQwvxcN23cg51irg0dBRSO
 5XQQ==
X-Gm-Message-State: AOAM532hhOuBgmAQzJxAnO6CeOH6h3Wo/a/9d/tZyyia7Wv6u9BgO+/m
 RmG2W3rBnykyJynQkCrwd86yOgobjdjm0RYaOkb42A==
X-Google-Smtp-Source: ABdhPJzb1F9zrs6up5BgllV2vAHLlsW5BQg5r2VIyHVwsir8grnLtVnLv5rhEDZi+6FauihvJuIuONVlJ+5garf8ZT4=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24920150ybt.288.1654772501175; Thu, 09
 Jun 2022 04:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-33-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-33-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:01:30 +0100
Message-ID: <CAFEAcA_v5cGxL1gKMa+o53a5HgENgqO9c=2AejHuZ=MocM1A8w@mail.gmail.com>
Subject: Re: [PATCH 32/50] ps2: use ps2_raise_irq() instead of calling
 update_irq() directly
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This consolidates the logic of raising the PS2 IRQ into one single function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

