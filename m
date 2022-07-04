Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399C565888
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:23:10 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Myi-0000Nn-1F
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4p-0002dY-2c
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:23 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4h-0003LS-DO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:19 -0400
Received: by mail-yb1-xb32.google.com with SMTP id g4so16897652ybg.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IwuukI/ohXksY0Pf7JHDfE7vM/eRTalC9oRQff2kz3A=;
 b=mkDhxPZ0ov+Z678Jnwg0vu3VIn2tbA/5/JwL2NMMqGsutuCyFFKfTophWOVKUfi6tf
 +dGsEvBZ99DrFsyM7LJ1tM9eR7A9peBajySeNlyY5hmPBZysj+qK6yOqMGzKIFROdJMV
 tLQzp224lfATOX6uyIIWyoNgg5H4TFIQeUOPr8Vozyptx6KHwoScsw8DFzP5ZQBTZm+1
 A3ZEiikjBDPISDKEfb8bxTc8+rJUwtkn3dP5+ag0NGwFHZKf81uP6JifJE/Qb9Llf+gA
 S7Q0hFgUlRRlMA8Gs3As3Gg4X8xNhXDk6AZ1jeDeE7Zm2wHgErMPdS8qaHm0PYP/PzBe
 X5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwuukI/ohXksY0Pf7JHDfE7vM/eRTalC9oRQff2kz3A=;
 b=zMuqaoVL74HmLRQDtGF2KE3gf62cH9+oCKLSd8bBpRe/Rnha3M48f4LEjZ1Pz57G8g
 kjHVY0Y4FDWcYzGi6jUhrFU1YOU027LBa9au70bSbcgoIBNQPDJDOE8yYBUOs0vhwn9E
 EuXwdPmYSqSx9AMmFqAVgumYY0UQUrg6BAtal337KDjzNhqcGt2iwVOz6Z9Q8pZYhTea
 23LvZl83qfBpJpbB5+Zc3zfMFnpzPN8yEkhH99EdR2f0+hEG3SYO7BC58OrYxJ7V1af8
 R4teU0QzKrs9QvUdkkCi27QaAMtmsGQgEyugbL57ZHB0WaCQIL5chGqrLQ/V02GWP+mG
 oEvw==
X-Gm-Message-State: AJIora94M8Misj2Uid58K3tXAi84qKL3ODFDwJHTFSUSxvMTWSned9gS
 MGiPoMbQh7gjWdG0+2Z79UXQreLnR7mpTGktt4VMBQ==
X-Google-Smtp-Source: AGRyM1twgJK1PXmd9Mm9He1tjEEe4RZvb/gbClPxwN24Ux8s54XYP+LhA49rArj35FejT2ip++bD8DghJIeZi4AdT9U=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6181627ybu.479.1656941113644; Mon, 04
 Jul 2022 06:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-21-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-21-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:02 +0100
Message-ID: <CAFEAcA90ZJ5JXSDynqcnox=tpYb-kotghcjbOgo0YvDcNQWGwA@mail.gmail.com>
Subject: Re: [PATCH 20/40] lasips2: move mouse port initialisation to new
 lasips2_mouse_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the mouse port from lasips2_init() to
> a new lasips2_mouse_port_init() function which will be invoked using
> object_initialize_child() during the LASIPS2 device init.
>
> Update LASIPS2State so that it now holds the new LASIPS2MousePort child object and
> ensure that it is realised in lasips2_realize().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

