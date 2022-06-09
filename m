Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11BA544CFE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:06:20 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHrd-0002Wm-La
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFfS-0006iO-Pj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:45:35 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:34876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFfR-0004tj-32
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:45:34 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31336535373so85726797b3.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwVH0OQgQi5av4+Pt7mZ6nVAs9hTt+KbYuvhsBzXkfY=;
 b=WD9ZA/e3QoEiYluWN2BbIjGP2VefAGxygO9qFwogyK0anW4cJ42TgfCr26As2wX0QT
 vefW912MGraBLzZEOGPGDyXJ8fIzGJGNeLIxIiI7VXeEgpXlnye++2qLlaiVkyMrALY0
 Mc193sLOs/lwpa+WvH9dqG+1kqannl+FohUsfh1b+PMllmzsxZvDcrwWLsPPWwrPRZqO
 uS1E26LlrHYng6P8JVW+mrLw9Dv5MrcmEXR64f88hYNs2Y0OylX03FF9ST+AnVF8b53D
 puGXlhi0YY26aVEJyY2wkzybwcqNutghUC6xE7bKXavemxvzXPKdt/fUQ8xjr3zWYory
 wHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwVH0OQgQi5av4+Pt7mZ6nVAs9hTt+KbYuvhsBzXkfY=;
 b=DCo8C/BzAL6PTASXj7rXUlIPPVdl8/G8JCpRhp70HMa1leXSAk0OJg6mluHIzE8JFT
 GTUCHsTwrjS48izOrVhJf+CvoKQvKdQ81RmDZ/cy/D1Y98WPi/jZ/DWES8WUORGNmUTi
 A8hg2m6UtC9/zEOC2h0yZCubtk/iC4PCZUeq8Vth6bFo24A314BZww7wzrTF0ha/BDQD
 7wFMes9l+X1tmWYGfm6W0z6VlsmrL/ayyel0UeXvjqIuX3cRuNGYiaZfHtUHMrGmP4cx
 Q5mNGs9fK0fHyFXLxRx4VWIGgAAl5YoIOW+OA9Uj3dKOFq+Qc+cVWqc7IqWSbfuQs7J7
 cFnw==
X-Gm-Message-State: AOAM530Iwy1nNf7tSNsKSiv/h15VJXsD9kK3mx+vnzNaRLihDm6JEROn
 lL0C9njX4TPiOhSmdaBzTgMTSxmXzXotZO647GgLkA==
X-Google-Smtp-Source: ABdhPJxNS7YkbAtkscH95b6K/ReQDt/9+hWUzSTCdhuSWES2YlCqX1+qKLnih6fVwfAsVGJRnWv6AUqVuti4J7EKCbY=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr41759097ywb.10.1654771532044; Thu, 09
 Jun 2022 03:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-22-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-22-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:45:21 +0100
Message-ID: <CAFEAcA_G=qWLOO0Rv0oi-7EtZ1RoM9pmhU-WgBs3JgmU2aOXFw@mail.gmail.com>
Subject: Re: [PATCH 21/50] pckbd: introduce new I8042_MMIO QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Currently i8042_mm_init() creates a new KBDState directly which is used by the MIPS
> magnum machine. Introduce a new I8042_MMIO QOM type that will soon be used to
> allow the MIPS magnum machine to be wired up using standard qdev GPIOs.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

