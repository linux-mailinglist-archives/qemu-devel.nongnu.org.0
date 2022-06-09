Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F039544F11
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:31:04 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJBf-0007pG-8V
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcw-0002u3-Sr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:51:06 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcv-0003L6-7Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:51:06 -0400
Received: by mail-pg1-x531.google.com with SMTP id s135so6115054pgs.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqJh9ldDOdnw1d8r4xxmGvYmKoHHf1z2/a0A31HRdCA=;
 b=JACOnmbSvjmwvbxzgetA37SehZjkghbMFLqDgQT22ugEu+Ilrg10CxnLmK4/+ZwPKe
 qlJuqA2Q9tuVRJFJiPeY4Y08QXO4+Tc+51N0M7PO5wjUVnGQdfEQnTuXh1cWIeZ4opej
 tfU7wNffSnVY5SmzJh9f8GuBxpk+OokjqMs7cekjqwq1+OkvEhuTG0B4BpGfY3nkF/Uo
 zomrxkqZCZl2CZF8F+NYaqkLFaRXjzF7HPGa4aKr4pF00SC+vwrIC+aYsotnql9hwThz
 CNY1awRGZg3qMCUfBcGPX0LvNeGWP8QID5cYqVI+gkFi6m1xdgs90oJb8w3eDFX+Vnv/
 O/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqJh9ldDOdnw1d8r4xxmGvYmKoHHf1z2/a0A31HRdCA=;
 b=a23tTL7Wzi8H13iT24sdjZ/7QBRdbWn2bjxNg+akHQ17cpMV6uWINw83J/Hjhj+lEd
 ADPA8TlfT5pB1dxxtdBOZkmcN1jjOtV2MFKM/KGtnVW+8HSL3mus+5XNLym9HoFOfWpu
 IhKUeTsmeIuq2Ilg6fUpvhZHm/oIFEiJNyZxLhr1uvsOSY8Owxo/wtb+UBHeKgf68tUr
 JAT8L1VV+pW3B3DypbwADqVcB5y2TVfI5X8EYF0CK5kGSNldlVvxAAkMgfJlxI2XkuU2
 aHHlbRokWvntcN1A2+U6zn2WfV4z+yGDsxXLciiAp5ERh4WEyZ5pCIUgliHW1zvOjvbr
 rskw==
X-Gm-Message-State: AOAM532ABdlfwNyKbc6nKtZ1HUQ4RfzwL5tS3IHO50xcw6tZfsafIe39
 D5Lw0qsl5marzKDGKKbp7syhJpkVSc/l35IVxLSACg==
X-Google-Smtp-Source: ABdhPJwoVimUIrxJhKjmpL+veWb5qE2xhJspM5I9z7cOK/rZ6tJrj98rlFDH/HaXYRPQfuFsOwCE3QfK1NvBzJZ/oz0=
X-Received: by 2002:a05:6a00:1f1a:b0:51b:fac8:e00c with SMTP id
 be26-20020a056a001f1a00b0051bfac8e00cmr26903077pfb.26.1654779063893; Thu, 09
 Jun 2022 05:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-51-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-51-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:50:53 +0100
Message-ID: <CAFEAcA8-2NAvWPE5qtedPmfwAY+TBu-pWLhNo4R1njEoKUHSyg@mail.gmail.com>
Subject: Re: [PATCH 50/50] ps2: remove update_irq() function and update_arg
 parameter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 22 May 2022 at 19:23, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that all the PS2 devices have been converted to use GPIOs the update_irq()
> callback function and the update_arg parameter can be removed.
>
> This allows these arguments to be completely removed from ps2_kbd_init() and
> ps2_mouse_init(), along with the transitional logic that was added to
> ps2_raise_irq() and ps2_lower_irq().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

