Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D455657DB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:53:13 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MVk-0005P4-6W
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0M-0003vt-IC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:47 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0E-0002Xf-6W
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:39 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317a66d62dfso81981237b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PI9t+iywl3nuVIeDg3V6gRTNgARB3lnWAOFF3Wk9dmw=;
 b=IetAa/n4cb/fsBcdxxN7WFvjOahlprF7rEdNYjxMxJNVL00ppONfHfwptEhUKgh3Bm
 NIdIhuRbI2cACqTj2CuegleTuV8jvryqm55cuXwUDdK2wZWZ8GmEYKYZR98jrSFq/Plg
 DPHAJyCsGbcVESnIgwAWAMqWq+tnDrVUTsT9SP2rjwOFdQkxqgY3NEvZg5GYddFjNGsN
 J5TnbUDpvKcvjSIVxHAMONX2RQK3S1u2teMKAX5v92FgiYNpljsrq7wV0qk4E6obql64
 lT6debtg4Sr8SrAEEkyN4ft/pvvDYRAr4QTEFkbd+FeDAtmyEb0J1SjMtgInKLxPv00K
 515g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PI9t+iywl3nuVIeDg3V6gRTNgARB3lnWAOFF3Wk9dmw=;
 b=sHwLY5XDxsVKgxC2R683kbxNz78oKC7gFvrjAPq4xYt//zdlxc3JL1OWjnWiR6EkCl
 cncoXjlKgAWjwf8ud2xn+UFxis176VlgGwFgtJ0Nz7zA1p7Gew9vVG2JTaM6vfUqLH2Q
 rgRm81FPxKEMHDJT37fhn+s157s0+P/pUbzqp3mAiyRbKytPwO9zRHERJYi/xAXulrio
 Gm9Wu+ByKfFEiJnwoW4TmYgevh1/dNUn93//mXM3Ggp5w2GEeDTKhJTlWT2owSvxR/wh
 26ksyqtKdQjiSZpJmwkA2X1jmj02MTel0zPO07iu9cKL8IF4W8Cnn2BGJvW50A9dQjx+
 bO4w==
X-Gm-Message-State: AJIora8q2sv8xVoRWJFtsTiQxjScjJ0dKn8sw+7YKh+mitHfJGTRQYoW
 G4TUczu8sexptMbDJOmB/m1hzfGLFkF07uOU1piZ8g==
X-Google-Smtp-Source: AGRyM1sjGvSrpMiafIpHhA+k8TcchWYoDVB9aw9TDpLOUOTcbwJuN2m2hWoqyXpfxeYp2aEu/9/lbutCzv1ewg44mbY=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32404413ywg.329.1656940836456; Mon, 04
 Jul 2022 06:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-12-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-12-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:20:25 +0100
Message-ID: <CAFEAcA9_2bYw2g49buzw+ZNjymu4eC6i6hZUuOxgoVAubRv4xA@mail.gmail.com>
Subject: Re: [PATCH 11/40] pl050: don't use legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 mouse device within PL050MouseState using
> object_initialize_child() in pl050_mouse_init() and realize it in
> pl050_mouse_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

