Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D2F5658D7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:41:14 +0200 (CEST)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NGD-0001iz-HD
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MFJ-000354-7h
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:36:13 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MF6-0005bq-HF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:36:12 -0400
Received: by mail-yb1-xb32.google.com with SMTP id o2so11675245yba.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFY0/kdVOjuBkxJkwbIHQ75iU2Ojd0GlIFJ81aJjpJA=;
 b=Iv2sQin9X4BIJ54nVJBFSGvt9475NDqRla6e80BW/3lwyeJA87aPjtfTYbgUKhB/kW
 O8dRy2BeI0MwDsJN5pwlKjknWlLz44JZPnq8rx11nwJWzcnFiEBNYyrxVPlA6mrlirpM
 g3UZhgdf0NZXHeR6IztT1ZuOEkN436l2SCtMSDeQlmFVn2ovTGuPELhRtojnwS+Aodqg
 dyh8DDn+Sf6v+Jyz0eaBoSm7iPgLnl1V4Rj25H8ygoFbpmZnunmlLoqIeacn+ZsyZNk5
 WoG69yxOAo6OePEyBzSkVHUCGrud0f8Tt3pevUJiRIIhqG5Rk3ZJ175MbjMNp0ExlQqC
 TA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFY0/kdVOjuBkxJkwbIHQ75iU2Ojd0GlIFJ81aJjpJA=;
 b=oC4Dc5mjcam9Kyha/lhIh/ok45K7t7SJViP9gB2AY2bouEoKMEk5KkqFdUyUHsJTYt
 qj6TrZs/zKf+ySx6/Tj8lzUfSPRbe9p9iuO+XNs65gXlbgJAsSZF2A0gmg5FddzYWFij
 Mf2JW6s8zi5ll1FxC4NC43Oeb8mOUgnu2rbYkRSvAWTBYzpR29i562tq0FpWc5wgls3c
 UQHATWGH5dGoEbNMgaNiU7OkUjpte7LhSCooWH2b8PIg0V14qSTAogPWUXOTNmfJiHzN
 g2MnzRFot2tDpwLd2nc2uxvpuN6bcopUlThL6Kx7P4rQh93wMfI1X+gYs/0r2Zx/0luM
 4lmg==
X-Gm-Message-State: AJIora9pFBNMsUiCVA231f5QCnr9Iok9JPa/1Pqh68Xl10uNsuORMFjL
 EiWBwxyWAwGqAynQPOwAzEEtVU6EzFPf/UpZejOckw==
X-Google-Smtp-Source: AGRyM1uNnSpQBdWWeerkI6nCshFP2R7ERAXMONk4rnk0zKtxUOmT3RTUyRjQ5q//18d9oysbMiKzUSWs3QORaW/DDJw=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6096412ybg.140.1656941759409; Mon, 04
 Jul 2022 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-36-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-36-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:35:48 +0100
Message-ID: <CAFEAcA-MCuByDxQzz9G5kV_Yrot4bPyBnvOJYg2Qav9CHVUXdg@mail.gmail.com>
Subject: Re: [PATCH 35/40] pckbd: introduce new vmstate_kbd_mmio
 VMStateDescription for the I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
> This enables us to register the VMStateDescription using the DeviceClass vmsd
> property rather than having to call vmstate_register() from i8042_mmio_realize().
>
> Note that this is a migration break for the MIPS jazz machine which is the only
> user of the I8042_MMIO device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

