Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597E8544D16
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:07:03 +0200 (CEST)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHsM-0003D0-9n
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFtL-0002uN-AK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:55 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFtJ-0007oL-NM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so6974295ybr.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hCnkYS2x3ui/4354QdNO4nQlKFbTZpM5ktCaEd1vLfU=;
 b=Bvka2LvW9vBThoxwZ8n+orFF3z/WYJBDkKXviJ5iUG+IxHH7QPfm+xVSy0V4xkJ1TK
 a0gzTc740XI3o2bI7FIq9J3KVrM/Rt42T0ptovV7T0K9I9gvQy80zpRqkaqxMBKYOBCm
 tMbthAifZTndIq75fvjvuFOqD66D7JYjwu08wyFnoGh5IVwmUFKbFeFktzKxS8nXAX0H
 vWTahNPrNasXj5FZT9F/Ov5XhMOBS3zii8cucjBuhaMaTiFG9nr1viiksUw1XgENtYi8
 aRV4ymLGPYTbDn2XwFfWiPlZ5ZHxYcBLG/0P9OWDRvvahBKCXs6G5I04BSqJx/gA/Q9e
 2rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hCnkYS2x3ui/4354QdNO4nQlKFbTZpM5ktCaEd1vLfU=;
 b=TN39GCezpHePXnqaej2vdKYSzSv9wJQQk5yNx5hN2iygICoB9omds6UtDZyg4AabZd
 9qyikIMsEqS+seQ6a/u23sKAtzvB0WvNtPPMOdK1cucQxt0ihEmyB8rWKHSLf2twsnoC
 1XO0VNJrHiiXVyI367Oj18moYxfyh/9eBiSsoVmoGWh9U6yGAmVNJBWrmIyPPOIMyS5p
 pKKUrbpCpwe6diQzFsFdjkFEOtzAhewtqyG6t4jVT2pD+jLPfG+tHOmWB/aHd0PmxIOu
 1qNqHaOTaGZuv8SO2U5hy8ut3Z7rTy6cgK3DR7MreIP1ZGarxvwx8vHOr8kQpV86ygjE
 LvGQ==
X-Gm-Message-State: AOAM530R7DZlcL4sBnY7mAXlbeYdKT/H7S5EPmwFIIJjFhLP14FB0E9o
 M/Om1UUq63QJelnUw0krMD5FfjhKHxqKjCQ+frhbhA==
X-Google-Smtp-Source: ABdhPJzDGsYVp/TOEvP+sKvFWIjHVMvhBNgWDqMruTIgbrxqQqqMt5CW/fdUDlFYug4ejDdcCVAQ7tGRyAnYciDJPLE=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr38923207ybr.193.1654772392789; 
 Thu, 09 Jun 2022 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-29-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-29-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:59:42 +0100
Message-ID: <CAFEAcA_TAA2wwpuF_sm3oPTGv17Fz3g1Uxy1HFJzT9oQ-9ab0w@mail.gmail.com>
Subject: Re: [PATCH 28/50] pckbd: move mapping of I8042_MMIO registers to MIPS
 magnum machine
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the register memory region is exposed as a SysBus memory region, move
> the mapping of the I8042_MMIO registers from i8042_mm_init() to the MIPS magnum
> machine (which is its only user).
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

