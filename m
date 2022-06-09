Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C123544E04
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:48:32 +0200 (CEST)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIWV-0000jk-Bc
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4d-0004E2-36
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:11:37 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4b-0001uV-Ms
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:11:34 -0400
Received: by mail-yb1-xb32.google.com with SMTP id k2so1822644ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIL/3yyGMb9aqMbSeZ2gELvbPZuXWTrQiXwR/6eJ5OE=;
 b=WkzJlVo2TiLlpVFi14LvuUQMJ/vKPC6ci3S0Kp1DJ+z8/l+6d+dTCnSPmehCEzZUnb
 vkKQU+HoOE1VR1hrRAgj4taPGioakzWB28fxnzrHE7J9ICKd8+D0CrozAnEVmrM4sxGB
 DFP4rbQg2+nsKURLHlMUT/CCYKPT4pwJeK6GmFZZYK+jdhYhMW2JwJxZP5gix6LIIfPc
 aDyW0gDfpy1yfBlXiUSuB9jop1osMZ7oQoNC5n/m0f5LUQy/U7lmIMv/bwn5CuQiz08X
 hvEGzOZXEwoVKGq3tnRaoML3q1XccEeRZjHGgwXiGVn3Sg0b8Ngo/WFSriz9THDLUbbu
 BPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIL/3yyGMb9aqMbSeZ2gELvbPZuXWTrQiXwR/6eJ5OE=;
 b=yV2sx4TGTE/LWTEPRzeE691kGXg8wO/w8B44ZmLr8ZM6TJZ/e6ZIFulphyGb02mTor
 8yg/bIjSuRm7OqvgMNmRymUIS+ffWZg9o9fF3ese1tH0qhDBKkGX6/I9dsRELie0m8bR
 vo0AqblfrtVpXbOFrDpJ6p56O/mE9aeUmUE5ZI/OhuzWW6UlkO7Wk4z3vUf5Tp92n8b5
 WOd0VB7RKrcuDnjwK/tVjfcSSmk9Ei/cdB6XRARyS/fIVezwnf61LZZJOaM09VyMKIrn
 TDMSA+w1OrAKoCBUo08BV8I2Rqu7CosDILfz6lTJkeoeCeC5yNReNoHxbaYJvjTIqM9C
 aiRg==
X-Gm-Message-State: AOAM531LXgfGOERM31QhMIuKhli3i+udYglRb2VRzkxH7soK7gVWfffj
 LgXNGF3zKWFPaUDZz6Q666FnuePIaOqlLdXRxyMC5Q==
X-Google-Smtp-Source: ABdhPJywviNCOZDRbXg5N+ox180SA22lDx2IARlvOmiUqFBd6KhPx1Hy+CXuOhpS8zDZ69LOJhLBnsXHIZtbaqZDWJI=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr39705371ybq.67.1654773092790; Thu, 09
 Jun 2022 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-42-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-42-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:11:22 +0100
Message-ID: <CAFEAcA_pm-Faho=1T=WRcQC-8GwP2PZ_x_u7hZGvq4p3-Ezg4g@mail.gmail.com>
Subject: Re: [PATCH 41/50] lasips2: move mapping of LASIPS2 registers to HPPA
 machine
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the register memory regions are exposed as SysBus memory regions, move
> the mapping of the LASIPS2 registers from lasips2_initfn() to the HPPA machine
> (which is its only user).
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

