Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C0544CDB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:01:37 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHn6-0005i6-6f
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFsW-0002Kb-54
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:04 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFsU-0007kf-R7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:03 -0400
Received: by mail-yb1-xb35.google.com with SMTP id i39so13118186ybj.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ESFf9voAPZtHIlO+QZWAu4a6Moh9naVz0ascyeJcyA=;
 b=dLPC1SI4/E/ltgO8vBGgrTndrpU67xzT/8j/stNycXGVgJPfzDKi02IjvYufrUci7j
 WyS3WpemEb79kQdYofdfh748caNWW30W/tstFyZZZPmrpjCeB4GRsglMX14f3yGQiUkQ
 u5P2qfuLuzInBJfxWGgdM8a+4lpxAK7dMAS7QXYTCkXg3wd/BPm0EyNKeS6zSqWug/uT
 nLZ5Kryv5Jaztbp/e0RnDULADGsAkNVF9S/aILA9ajtKOGdKoWp9evhFSnhlPnexu8M1
 zvm/jCgq4qhREUD9DU2/WDE4Oe9Vhnj0/HYTTWu3sv275/OQgTA0jeJrqsSSKwsiQNYW
 8XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ESFf9voAPZtHIlO+QZWAu4a6Moh9naVz0ascyeJcyA=;
 b=aOnfxoLHOm2MHaBt1+W/GY2yrSefVMQ4MwA+dQe8Vz9fc5sGvF3jZ1DZHAdTUGdVd0
 1FXd04fqa0hIFfUakujlxwkTGfGlnYwUmq9L7LwhI4+yaa0GS12+njaEzZQwU+gG1Phh
 t3JCkB4otxADwLHmN77LeOxLUuDX47SAbtgDmvm87IX2QauEgF6Op1L9zO+eMx/6kmAN
 pdLXocPV0q9lzXh+EuPJugkjO672LIImPatw3I3hxBtot8XmZGOY5sHQ+Xt4edJBqk5R
 K/VJscFXB1f5Sj4Ffu19h1XHNee08TtRYBDvOObg++iYGOIFdgB5TYRm5g6FqxRy/POn
 xcuQ==
X-Gm-Message-State: AOAM533t1PGLCiYSmhbMf45QyPyzIa+jq4N+R8V/NsHq/c4hNqmlH8P3
 C56/Vl3fW4zU6NYVCyXfB7bfjYVczGoMBioKi0oJ3w==
X-Google-Smtp-Source: ABdhPJzb8X+mdFvO1COzlByq2gcFs3aomaKHuuYp92IgZFshNkhMVUYKK+6oEIu1S9jbXjNHrPX0njWXeLG1CMB8hTs=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr37407194ybb.140.1654772341905; Thu, 09
 Jun 2022 03:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-28-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-28-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:58:51 +0100
Message-ID: <CAFEAcA8Rp9ta7zvcpxeg7YrgYD_EDp+t1CMU67pHDQHr2JeQXw@mail.gmail.com>
Subject: Re: [PATCH 27/50] pckbd: alter i8042_mm_init() to return a I8042_MMIO
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This exposes the I8042_MMIO device to the caller to allow the register memory
> region to be mapped outside of i8042_mm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'm not sure where best to put this review comment in the patchseries,
so I'll just note it here: I see that at the end of the series we end
up with an i8042_mm_init() which is just "create a device with qdev_new,
set properties, realize it, and connect its gpio lines". Since that
function has exactly one callsite (in hw/mips/jazz.c) I think we should
add a patch on the end that gets rid of i8042_mm_init() entirely in
favour of the board doing all the "create and wire up device" code inline.

thanks
-- PMM

