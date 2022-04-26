Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA650F9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:13:17 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIC3-00023m-Dt
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHkt-0005oj-DF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:45:11 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHkr-0008SU-Az
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:45:10 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ebf4b91212so175844647b3.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OA6BlGU55E2+vK2JNWRG4p+wx1v4lMZJQ5nZBDPbFr4=;
 b=ywUkLjKOFjJKpy0USgGn9gFtqyIiHaNZsuhOMhT3t/FFBOCGaayoEULDc5ELD4FlXU
 HqRmaukpxqxI7SZkEhLCH/VpVsJi6LPVD+8WpOn41+lgyy8rfE+kVkUf++khB0EJO7Iz
 qBWAzZ9BAtrJpwHHr/r1hKQ+Fdi0/dKR0kM0yC0l9ocbetFDXrlOJzZ4jML5rGoAdiw+
 HPLWG6tyg4HRIDEGIk27e2qWS8bvD6D6WYLb4Cwnw0VKnUvGK9BsWAfSPz0zbjnk4VnN
 Y0X9SbaKieImoxTHjiFc1bLLGR9q9W6ZeZQ0wlbUGVXA6F0ZaZQfO46qDWi684w5H3SL
 5IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OA6BlGU55E2+vK2JNWRG4p+wx1v4lMZJQ5nZBDPbFr4=;
 b=QXuRSC1zXg7CBpXCrxlqRW5ogxhYsKolRQZRFudL0qjXg1LZkBzoL6/VCf4+Mof1cX
 QypENEyzbAfK156nDNNhdhA7VFHBUAH4IxVXSgjPsjGonHBIWi4OdyijxG3TRjrgNrkz
 LxaGVX6WPWSrePKrnvZZNDjcrb/jEZe1C9yhfnDVnc925kSDuDezVQO9LdJku2pyaQjh
 r5aVngn3F17IxNbrUcxIrPhR8V2b3Ic5cp2A2k9eEw192H+WCJdiBomexI6yKhHImgC9
 4kWClTW9OowrJ/TPF4COR15vuVOInhG/aI9b3wpnystf/LwEyf4Gp3/m+jqeRXw1dFNq
 4EDA==
X-Gm-Message-State: AOAM5321vDLoRYBtYlBloRop3TuxtEhhajZDjaRo5wDKvpVuXbHsI2sl
 KHwhEDsXET4PHcxbcOVZepABLnG/8XlKwyT3dUeA4A==
X-Google-Smtp-Source: ABdhPJyaGV7gLy9j4simU71ZYZeBk1m5hLVx3coWdTY9uSC3I8f7FQT/XkDlWHI6LP3smLazdHD36bxALj4RGI3qBHY=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr21169184ywt.10.1650966298602; Tue, 26
 Apr 2022 02:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-45-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:44:47 +0100
Message-ID: <CAFEAcA_UUEgr61H+r05yt4mDEggSUoY8h7xcC4Tqn5XY8OGTkw@mail.gmail.com>
Subject: Re: [PATCH v8 44/68] target/nios2: Split out helpers for gen_i_cmpxx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 18:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do as little work as possible within the macro.
> Split out helper functions and pass in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

