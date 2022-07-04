Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBE5657E7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:55:45 +0200 (CEST)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MYC-0001jZ-EI
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGG-0005UE-8r
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:12 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGD-0005qT-K0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:11 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ef5380669cso82324067b3.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAiJLAa4r4qIMcsDU+5OqGDWQ6OmPMz3dgbHS+wx4R8=;
 b=Ios3Y9ww1BPLVxSPmiwezsVTKnx/7ch03Ir8uNVyhf/9ExQURH3EtvcU4jIlZJTrcr
 wZ6ugglyTLYV2WYnyyhH7KJHGLp0S0zwmI1T0sldP4RkTyPhgstisLAYVyp3t59Wk1p0
 xEvhwq9B6IEjYcGrOe/ydR+7U9R53NHgDovuiuP1Lk2BceColM0hEor4NqO+4xoPcjyG
 yd3rvyhwE/bY1fxZqakFDML7Z3b/3W7xVTmyeCP7NJILEYIP6VaEwb3HHVxsP6SD50oI
 Z/WIKJvfaGGpf+f+K9c6K0dPPBtjyjO1bJiQ4WAOw98ZKl/pckTHlmUKHZckcVLLLD8C
 F93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAiJLAa4r4qIMcsDU+5OqGDWQ6OmPMz3dgbHS+wx4R8=;
 b=mDK9PEkKF+ORE/zQWzwV1pCKdsg7MWeOJ98aaK6NUzgUQS3hEftX3KUKpjD3zYrLWo
 LQNveQVM7rA7M2fpBFx7mZUGe8zbRDnh3JVSIs7vYRzYnfuucHirYDojSTV10Gre76mN
 usQGB/vK+GYanTZHK0JJvXsZSoDqXKsY9iV89qSOjWcvNpyaBmLYqQYewGZHnX0Ti/ee
 cjUUaN2D2UtzULu239T/Jle8Jnv/YQwxfktXhht1OgEcxIwTXnI8Q6qQdYC7FEm5vMw+
 NVZ9ibNaQLGcNRhwOKK42EZZu5AvbO77oif+lbm3pnlE4cbm6oCE9k0tMB2FxOzauwmh
 7IKQ==
X-Gm-Message-State: AJIora/ywuRniQ24pVeV53Tpg2gJlAVV54ApvM1ePFb+VWupkBlodE0Q
 cHItSlGNyoHLTVCcNVr3cPFYIdDx6sT/LUU83EEVBQ==
X-Google-Smtp-Source: AGRyM1tDE23ZYhkCqhVJ8ylL1pGo3hNZe3Y5RDvxgQW3ziX37+lBqRYo9QsGFbyRqUhRg+C6GpHfvxpWhwAMk7Uffok=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr907720ywb.469.1656941828515; Mon, 04
 Jul 2022 06:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:36:57 +0100
Message-ID: <CAFEAcA-XSMuxQa4ENTNOsJqu9rdnLtqdcOSHVK3jbAnNK8sQKA@mail.gmail.com>
Subject: Re: [PATCH 36/40] pckbd: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
> Instantiate the PS2 keyboard device within KBDState using
> object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
> it in i8042_realizefn() and i8042_mmio_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

