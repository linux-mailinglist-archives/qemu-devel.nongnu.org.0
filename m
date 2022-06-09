Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E351F544F27
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:32:52 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJDO-0003H7-KN
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHeP-0004x5-RT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:52:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHeO-0003f3-4W
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:52:37 -0400
Received: by mail-pg1-x529.google.com with SMTP id q140so6690225pgq.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wVHq+kadEusxFBNgWN5OPNJH8tRKzmGjwXKWp4S+45Y=;
 b=fiM4g1Exc/o5XVhHBoyMhFQ4e74nrTaOzgAPRqknSL1BgsuGtnk/VC2BaAm9cvxXr6
 8R/KbC+ioVhKJkPHr5oFSU6TBRP6Lge2ehH7LKgyLwa+kOw6XEdLHACLCjXs/Ye/E0Qn
 w8inH9R1iqM5kE9eR6Cmoa99tFw5OyMNZgRx14+Ak9ozFrDK3MrfJRIvY2hVdgzRoRRC
 TLsPzJU7sx2Y4UNdU9cG8OkMITh+shmBm5QBEfQ4XY6S6tq+UK6Kax/s+2vsiDFHlGzq
 O6hMPOz9hVkYvxZlrxuk5+5nwJPJnD4cmCFrznJVyi/58ZGNAFBBpc9SRk0q+7Zyja1P
 U4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wVHq+kadEusxFBNgWN5OPNJH8tRKzmGjwXKWp4S+45Y=;
 b=U7IGJ+0lLf3dH/SAlO4LwUc7nqT6rPMD2iqHiHP8w/QwOHG4OVxfoS/pXx6putT7rP
 AMhr4x8ML3iq8KK9mRwaF6ThzcVTJ0GzQEnx3xw5sWJDOGbNn132pqFOo9EBfQC5GpfJ
 Ek9fLXH2GKWeaZ343j+LPBrRBcqYQAP1qk9K4YtHIcQoEjyE2cvlx6Ntaa5nQhu6DhSP
 xytDILB3VOHd1wduvw358ziAmxGuhvTU/ms9UMLfUKMTA699Wci3g2RoS5uQJgYt3vSE
 BjA7S+tJ36FvzkD/4eMO5Y6wazRHfqXrq82B8eVTJ9G5Vi+WVfQVlsMfse9g5QhWNTGN
 xPaQ==
X-Gm-Message-State: AOAM532+vPuthGyJG1DO46CJkWqOU25qP/YG7ege9HKjFb2gQz1Iq92A
 M0bFesbdSfCHawf2SZv+0Au7NKt18hHKt6eYi648uA==
X-Google-Smtp-Source: ABdhPJyE7n7UKdyldZrpypUHL2yA0bmORHM86ZWTJ0Hpjs84bJ3CEb3ni/tWFHkE9v+YUWwA4kJg9D1M/6fvBkyzCbA=
X-Received: by 2002:a05:6a00:162a:b0:51e:73c4:f895 with SMTP id
 e10-20020a056a00162a00b0051e73c4f895mr887667pfc.82.1654779154884; Thu, 09 Jun
 2022 05:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-48-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-48-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:52:24 +0100
Message-ID: <CAFEAcA_xOznxBzt1PQQgBqkOSesD02N=+UFSi4Khd1mkv6FjdQ@mail.gmail.com>
Subject: Re: [PATCH 47/50] pckbd: switch I8042_MMIO device from update_irq()
 function to PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
> Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
> PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
> update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
> accidental attempt to use the legacy update_irq() function will cause a NULL
> pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)

Same remark about preferring named-gpio for the internal-implementation
irqs, but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

