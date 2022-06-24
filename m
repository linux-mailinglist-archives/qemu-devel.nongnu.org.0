Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D7559D13
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:12:52 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kzL-00088N-78
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kve-0000h5-KD
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:02 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kvd-0003J3-3z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:02 -0400
Received: by mail-yb1-xb32.google.com with SMTP id x38so4959914ybd.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCr8rQ1Oq/YkG8R3ZLo/zr8hdBL2VHeRNtfoceKcIig=;
 b=Y2pG8SmTS33yZK0chyuMzUj2VHuaVg+UOWr2sfVgMc/yLwltnhF6RxhbeahjCQi3U+
 Vufpx+LN4Z+7oudbpeWuzYAn8JrAZIvE3AmTY/Afp0l0rraARJAGumExwUdzZskfjkdj
 G3XrlfkTwg2geG7pF4aQobGvzSkjiQ9CWatYTky7fdtRZFPHac4goWNBf0CBlE5jArkP
 swL8ENZ23tDeWSHWdixOqI7ll1PqNnV9gnl/NyiL5agn7m9ziSjXCy28WNYgiIEOMoPy
 GzkrGyGZ9lIONcwjtJK13hIGyWdxcDvCrM9S6j7DeInrXxxq7L4q8AOUlSBu3inTK99h
 Cvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCr8rQ1Oq/YkG8R3ZLo/zr8hdBL2VHeRNtfoceKcIig=;
 b=12Yof4Kv/cYz0xAJaaLYJoIQw0Ey+sE+N6cSe80we9eB2BkMWxvx5t6p2/Xx1BIPlF
 iPvveVQzTeiBU76fqacSYW6uZD8gQGfEs6Gf6HS6sDOl0e0AsI3oe5TqL5O+ZPjkhNST
 tFxYERp/tr/ih83jJsYYr+t6op761L2juktLH+IeAoV87RLGItL5lxqubXlTJTa2PDKs
 jlCjVMoEDoTDhiwbAB92hJ0+VGrMCKIC/XvP7Wj29cJZKgQFmODaLmFXgflreJMMwC5m
 uFU25pp+6Jt7O2LnNLiSNKeSaX6+H2sg1awzCzCxC7sUbEoUDWw3Vo2xgC8emM1QEzk7
 U5YQ==
X-Gm-Message-State: AJIora9DaMwRpvw+IHIk9sa4scQqJIwKk1Wicf9UOIuVoUP2+j3ZIY8u
 4lIBF+5xixNglbAqJ/7c0EG9/3H7ONxVn0fNu3K/xQ==
X-Google-Smtp-Source: AGRyM1sdB7Fb6Z29qCKcFxpH+413vNCgwnNC8Ylt7fjE2P1dsxeI6KnqunccctkTW5Bz0FoWlNYajbCKhs8xOvV2Bko=
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr5544626ybc.85.1656083339874; Fri, 24
 Jun 2022 08:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:08:22 +0100
Message-ID: <CAFEAcA9N5dH-PjSkuybhQCfV+CcuZan5DvELTR61N-O4DG9b1g@mail.gmail.com>
Subject: Re: [PATCH v2 36/54] pl050: switch over from update_irq() function to
 PS2 device gpio
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

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Add a new pl050_init() function which initialises a qdev input gpio for handling
> incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
> set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
> to ensure that any accidental attempt to use the legacy update_irq() function will
> cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

