Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32ED544CBB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:57:13 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHir-0007WF-0l
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFlV-00048X-R9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:51:51 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFkn-0006Go-3q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:51:49 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3135519f95fso66553077b3.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhiTJ6emla+dj7pCGXl+CkibsRJSmRN7Mhy+ne/JKYk=;
 b=dQTwchoC3lyNdHd/b8ovsln3ZlEOJ+DlpZkVmhLu+TwOhmQ+0B1wp6Qpg8NmAb8WY+
 0ERpyFXP6X1cSO7ABfdikV+ii0fE8rmm2muwHfw3jOlmC0eqiKSz/2xljlEoLLsKhWYx
 aIQstKCHGQ7yQO+E+hkCSJ15WmFQOE8m89K23UHAdYBHiFADaEzT7BvpxE41qyM23GaV
 UbxvgDZahgntO7Pvew3K3Gx56U+u3ohoMUPiTw/J03SvLy3aNy0SkNeuRqZy7dj9/pVC
 HWNq+YKTkXk26n9x+DBZpshHhVu5M5n6odF/VSL8T7d1znbLCJkJurdENA57wlxU3Ms7
 ubHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhiTJ6emla+dj7pCGXl+CkibsRJSmRN7Mhy+ne/JKYk=;
 b=ctlEfixDnobe1Pc0DqJifNHgQV2EE58Ke3D1fPdlZTU0h4SSvcBeFdFvCKOCIOgqFL
 oYGJKniT6h4SDtgVqEmEEQsVMcbIi/c1t0yXSpSfVEOb+AQHxYbw8TAPdmw2zemikjVi
 fzndflwzcr+U12BPxszFB35IiT/qL7OpPNQUK2BCwN5v7N2slrYMDpeWulMsdu2ESr32
 nPYESEvtgH59qolBm9UYj3dsx9qsollolAK9SUGLLrdbN10Q6du2gmgpJVDEqdmTYUWn
 SXUqzjWYBkENj1BOZs1h3c5gFhk+eSnwrq5Ds01FHX7sRSR8FOjzdh7VveXwgc2rqOsk
 myNg==
X-Gm-Message-State: AOAM530hCfl6SGAC1Zind+7EIY0YoYEFfUhAR3YlRSsD79o+da+SMf9N
 gHmseWQfJW4E1Oz4K5kRAgIsHgHDzxD6KXADoEK63Q==
X-Google-Smtp-Source: ABdhPJyTsx6crYCdzk6gYe7j1Z322Ebn5I7s3I6V7FpFi9blX/2Q5yCXFR+cBZzbKZXpy8OU/6OOGEUj0feZI3ELBDI=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr40886384ywa.455.1654771863428; Thu, 09
 Jun 2022 03:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-25-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-25-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:50:53 +0100
Message-ID: <CAFEAcA-64EaQbu205_jyYGyta+0e7edQYQPGJT_HCQZ5JgTzsg@mail.gmail.com>
Subject: Re: [PATCH 24/50] pckbd: add size qdev property to I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
> This will soon be used to set the size of the register memory region using a
> qdev property.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c         | 2 ++
>  include/hw/input/i8042.h | 1 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

