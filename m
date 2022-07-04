Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B30565893
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:27:04 +0200 (CEST)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N2U-00061j-HH
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6B-0004e8-E3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:51 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6A-0003h6-1J
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:47 -0400
Received: by mail-yb1-xb36.google.com with SMTP id c143so8353087ybf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewT06qLuONh+D/+A9mhASiOwZBM/ZxxyBFB421yhg1Q=;
 b=VjXoSybafX5ta5A6icSFr37o8sW3ZHvpfEy4h2rofWTFj9bpGUAXkrXv8fYKo25SMB
 DPCTgfStGN/rzU68t/D+bU61GEhRlXM7A5d6bWkNtf3dU+dCfPt5Nep3JmhK3UPwgwcg
 LRbW7rENf95lCeuDukcU4sn2e+EdIJqHaXUpAk+n1C15FG7yvTiW/FiQ1u2Uw5vl3AzF
 Jw2iFAXl+s/kHa6/ffXyzTYmI5t+4HzovwoLT5lrHj3o5StgYX0sBe70slI9O9v0ZNtf
 eeAUua6YZwA7d/CdmgI+WyVWZfXwho/upKUnfI3sIKNVg3b3BL2rNrBE8SpCldn0kjHj
 09Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewT06qLuONh+D/+A9mhASiOwZBM/ZxxyBFB421yhg1Q=;
 b=qAsJBMc8Gy2Y34TpMQKG5cdPw7gJfUqW/NGwAEZ9zq5QZEbkMiIcZleIsxXJyb2MaU
 1SSxoj8g9yo3B4M/ZKwlzSesEFsoJGdy2QaP7Urw3CsUuYsSnwztXKNaOSWzPledydEg
 8JrojRohoGn345YQmvFaSk1H2dmzDWe5ifRAYlReAyYA244d9TvcWdNU6PCecaja+PGG
 5X7ZZVkRKF6sYKOxXSfR6CNEJ8mYDhafMeZR9EO61vW/m9Q5mNIcs09Az2gSQiSJdR+z
 6hXPTnw+/c1Jy9tDaCmxygUOezXnmZN6YTVRC1szJFOVHrkMsVjRHwS3YEZowuUkbEf1
 kinw==
X-Gm-Message-State: AJIora+2kpiIZYD2gt77tteW15TK/2DXv1VIE4iwH0RhFhucwMRs79fY
 F7WBbkiYYBGLd1qzTt8lCwtO3/S7AdQTyQf+5ILXAQ==
X-Google-Smtp-Source: AGRyM1uRp86Kc9f4fXabg6tfT08P8zssiBrPPR9q+vzmBOrb3BYpPU8PwpAGmfSCAEaSWxtPxD1sN2TucISuUxtAOmE=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6047779ybg.140.1656941205002; Mon, 04
 Jul 2022 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-26-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-26-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:26:34 +0100
Message-ID: <CAFEAcA_-A1CzzrZy8oT69MqgCvb9PF+inQBGYneWZqOffdxJtA@mail.gmail.com>
Subject: Re: [PATCH 25/40] lasips2: introduce LASIPS2PortDeviceClass for the
 LASIPS2_PORT device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will soon be used to store the reference to the LASIPS2_PORT parent device
> for LASIPS2_KBD_PORT and LASIPS2_MOUSE_PORT.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

