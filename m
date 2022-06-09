Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8782544D2A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:10:38 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHvp-0001aR-N9
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvV-0005Wo-Eo
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:02:09 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvQ-0008LV-OG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:02:09 -0400
Received: by mail-yb1-xb33.google.com with SMTP id v22so41161676ybd.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zWIFrDKOa+Ef7ln0i+dutzVbl5VCBjs9DqjfOaVDvGc=;
 b=Th4NB7zERZ/5gqkfAZyapwtzxV+G4wVfXN9II50vkQYL4fEfoUopEgJXYNZ34E/hu8
 rXr62bjvNAApLYGC1Osy1p5kLE/maRNgYBAYRanwual+yrMyzmMzxLREZJ7QPh8efHBt
 0/C4PxFx9BFA0axncwt8urGIPHLtGMkxBYFb47j3FxImpjiweZOe53esAK1oYdEvlcIa
 rPUDQikydfW0QjDFil4RJ+unYwUzqIr+he8o/WLuwJD+eoB2aXSZvq5kzs1SCxR79ckL
 JSXbQ9G+8Soik/jREvXm6LHplqKSb1TC6oKXghfMjN6/E4ElBzvpSsRg+XI5jUG5HI1+
 95aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWIFrDKOa+Ef7ln0i+dutzVbl5VCBjs9DqjfOaVDvGc=;
 b=ZrQJ8JtVm3rtJe+zkTuz0SjRKSG/GQ9RJRNNHNs8833d4jPga8QbMgj4bA/lZbqwJ8
 +uK2KCokeNg4xdZOi5EeDHoomj0kssLFQOHPnb8ekuaX5z4Zxp5bt7q5GohjZLwlZWRh
 bwK0fOKZMJJKxlOCQYSiiLiVqzy7L+RBVqXk0mwbwIoNHTQ7D102/4EKHG8iMcaXzyGZ
 Wic9ocuajROIGT1Xy5wZy3tYZVNCZWpBI+PPeONW9KC6LlzE/G4VlPdfJ+hLvGr6BKqR
 boOXBVXO3ir2vXEl1q+jDhsblc6EPOJfcSy+zGvrQckq7fFerK1KzgAqXQltpcvsrY2w
 HOdg==
X-Gm-Message-State: AOAM533BeKByEXCa5kz1KI12x7Q7VY7JJCoiMiyBeKr7YU23ne/KUZCH
 +NcgK2AQGO8r+2mbGfU0oy1vqpyNg5SxbQ//WRK98A==
X-Google-Smtp-Source: ABdhPJxzbWsv3q1uBPnm5N0UQ+3xyAX1t5U5CHEdsbxqNaZT5nPLB/AMG0fGy1WY0cRcuKmiHXobkNPhq9BXt3uv1b4=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr38932828ybr.193.1654772523744; 
 Thu, 09 Jun 2022 04:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-34-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-34-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:01:53 +0100
Message-ID: <CAFEAcA9-XFK5N7AnVXnnOUPO3_i3xPgNiKbfft01e7HMs4gQ8Q@mail.gmail.com>
Subject: Re: [PATCH 33/50] ps2: introduce ps2_lower_irq() instead of calling
 update_irq() directly
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
> This consolidates the logic of lowering the PS2 IRQ into one single function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

