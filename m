Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE95657E8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:56:06 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MYX-00028Q-4z
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5G-0002kv-Pb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:51 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5F-0003LS-8d
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:50 -0400
Received: by mail-yb1-xb32.google.com with SMTP id g4so16900416ybg.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBK3Zgxt24yhhFTqzB4RfQ98zvYPshzpy0HdVp7SwLc=;
 b=dlvn4jPuW72Mxhv9+XzRMqFKXIuvBiPdzhg0w2nOix8Imr/jKsyrHzvoc4xRJqE7Q8
 0hqTMF+PaV8rjok5rfxEKJWg3zCSklsfGr3xKDz2RD7URoZPt3DOhLU1pRo11XTj/6pL
 4/Q3odLSev8/erHUVTm9/SngvGz2PBUBJ2DMTQLo6NceEDJRngpyNnpr4F2C5tq9LAws
 iBQHBdoXqvqerxg6WDX8cvS+lEVrBaWv4a39wF85I9RpE2wyTJMXJTHMVL/lBSsgdvcs
 XN+H0lYKP981GOLrrwleRQmPGL2Ob1l6MIQ/dJD6RU8qlFJeLLEXBWc/PHrf0pjLi8NL
 l+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBK3Zgxt24yhhFTqzB4RfQ98zvYPshzpy0HdVp7SwLc=;
 b=ve2FA6yzBAP1PuI2yDoaIdZY+dfO/ixXWM+u9X0qQX+VR685WeXiexFM/73Q5k5DIh
 SfFVT/KP9DgusQJ5D09IReGFWAFUmU2r7JG0XqN4Eh6tD3dYsxNMaY6vfHv1HVYvX/sa
 fUboDOOe5x2EYMBdBRebt6wkJ+MxXGZmGHq45n8sui2AKHcScRqAAfpXaivlcJCcyc4L
 WOsTafH4egGPCDWbmKA4XD07J8Poi4vpypVOFc0QyBfIRSFN1aDBkZKheLxFJgwCheGe
 yzobPBybMUmbouEB4+cXEWkS2muB2Hs8QKBcYJIoRGrFILMm5QFopIYNtPErQPcyDRb8
 yDhg==
X-Gm-Message-State: AJIora+Y5RqS/EIy3ofsuxUBVCoxzTjdoyJ5szj06pZRs7OGN5B1Gj3G
 8Uo9i2mytxlORp00rxHpbmavthcPqeWgO5FzOoafVw==
X-Google-Smtp-Source: AGRyM1sUOEGWRuEw+lmn5rG+qYAnF1tGZSYCJjgSPncjl6dmq3FHkQ9j6HtPWJDN4K468Ex4rtuLzBNpp5xAZnZOJew=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr12241251ybf.67.1656941148083; Mon, 04
 Jul 2022 06:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-23-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-23-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:37 +0100
Message-ID: <CAFEAcA9i8nGOoxk82eEE55NycwoQxFonH+Dj1X-VUtcF=3riKQ@mail.gmail.com>
Subject: Re: [PATCH 22/40] lasips2: introduce lasips2_mouse_port_class_init()
 and lasips2_mouse_port_realize()
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
> Introduce a new lasips2_mouse_port_class_init() function which uses a new
> lasips2_mouse_port_realize() function to initialise the PS2 mouse device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

