Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD4544DEF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:43:29 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIRc-0003Cm-Jy
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4D-0003x7-DF
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:11:09 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4A-0001ph-TS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:11:09 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r1so12603170ybd.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ho3weBZYh1VYUE+rNvqpgx7t8t8BZRnGLuUf9xmBW2s=;
 b=dhP8ZJoLoRKaQAgWYcCsEQztAkF7tKzw2Lc8LK29iv1TWdtV3EPKW0SRRN/OJTlr0h
 Sz8fciWgLVlryIYBF3kg0m9ffp4CWMLjbMpB+83GfoEYa2C/8cWR3OFAspjYZ83+7U+u
 LF9griKC0KM30jm9qqBudecAyfAKd9XvgWHyBLUdI1DQ2h5MEKaJU41ccFFaZ5kX2/Y3
 dsEE9JdvmRd4kliU6loOmN4gG/vYoMivxS3lTg+Kr2vA5LPcTcKOydOJNwTwtMrQb+PR
 vUYZK3MGbF2wVqosHubLcppREZY9SCtAG8tVkGVlgynC8e3oRprh75fbwsInSEViqyEd
 wZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ho3weBZYh1VYUE+rNvqpgx7t8t8BZRnGLuUf9xmBW2s=;
 b=HIkSy+mxdFLwpxCZrF9QVQknG+gsSFjYu075I7LozZB3BbNuTh2GIS3b2gCbylxyLe
 xuKQDfGqLn8GueGD64cupweDrgd4QJXmy+QJew2wAnEyXE5cVcEFZbxKqUTxbaA2+7Wf
 T0J3r07NhKD7BHEAMmrnC+fJXhvmXd2QcTHZKyaI+sQ4uuubrm693MLbuGZRuYY3aR/4
 trABvsrbKwcffK1l08p4/2frs35LxrASapDhaLWdWgdPYeTBhu3chZ/h0xt10UxI/HKA
 QY9bXZaBBaaznqlzx/NvDL/gGEmNilns3samYWaIo+Z/G4kkyRvJHVaoRdNcPcfymhZp
 GsFw==
X-Gm-Message-State: AOAM532W8/BivuTAhMiNr5u1gO5JDQwHzy+VcA0i6vlSzfYu3q+iBDQl
 kogv3CFjP4wvWlSKycHENmk5RTlClLbiUuIjAcdNxw==
X-Google-Smtp-Source: ABdhPJw5n5KEuG0G0Q+6qwRod23Qzei3QDLP7nl1C/p+X3YegHDllz67rAkwSTHAzpHOzn7adoPdspC7pt8KGfjSrfU=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24959908ybt.288.1654773065982; Thu, 09
 Jun 2022 04:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-41-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-41-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:10:55 +0100
Message-ID: <CAFEAcA975etE=ZghScN_afLFxSa3p=Ku2Lva7W_kRO8Pu_0zQw@mail.gmail.com>
Subject: Re: [PATCH 40/50] lasips2: implement lasips2_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the keyboard and mouse memory regions to lasips2_init()
> and expose them as SysBus memory regions.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

