Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FF565889
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:23:10 +0200 (CEST)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Myj-0000W9-PA
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGW-0006JW-CP
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:28 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGU-0005tH-MP
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:27 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31bf3656517so82142597b3.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Q2P+8E47m3GIlksE1bE4n1doVP2Zf1UDt/MMOS4VhY=;
 b=r88VlDhj91YqS1b1MGPrYzUQuiTVAG1F0iDSE81cvC88j/Kzho8yc+U/pvUpPZ9c8x
 1wuFwMFsQHhb3xY+ht0lzdaPFdzJ4Tlq9FaFB7T3/DhU79XbvubgaaDvJRfMo8rALOkg
 sBG2FVIw5z3I0Gn25h8FzB2SIqGCJX2has0i2x/znN7jsM2va0ig0XlySzrHK5/4Mez9
 7cQoS2aoq2JGxH60s1gWjTRvfxKzEDYQFEC449seqoZAyxNADLxuux4WV1ugclvdp/Cb
 MMrVvbNcD5838bdKEfsnn1zBxxk71zzTsAsQIsQ7DX/OhjMtesWyipPbMhgxqB8PFy/D
 bhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Q2P+8E47m3GIlksE1bE4n1doVP2Zf1UDt/MMOS4VhY=;
 b=fZvJXDvuaaoa5qtv2AdOfN0YSvGH1ax53YGpWncNE1m9aqLqwiELG7XDLh70Ag9dM/
 QKq4IzxosGN+5fjc0RG6sfmGMrQF+nhceQngKI4RCMN4v67VCRzRLWrXcMgGSRgQN7IY
 7cXDvEAsY+QXznsF1F9Hxz8XQlgPin7YNSuuW7ccnlzkhNbQ184KL2i3H6wsu/imCfjC
 ciahzBGCOUf825ZtK+f5Yo0gu5HnNZA0MIQXo1ZuMnD95hgG3Mr9X/JfIDFXSF09aOzI
 mWJRTH+jyB2y8p4053IFl1Jsr5xL2YLveLoz+GX2JRr+MvrT/u/2KAbpPhTN8IM86WXd
 PCNQ==
X-Gm-Message-State: AJIora8Bh2hvhl1XS7qeNsFm5A8RZKF+ImJSf0wcI5Ha9OBkNdldIuHO
 ex7Eybvb2jKWOsAmNrbuTXEIX1gIwCizL0llGMu7kQ==
X-Google-Smtp-Source: AGRyM1sE66wS6O+o509GpVpkW9YKrscKQnNlzI3PySTTEj6GTF0e9TqHPU0N59xYaxMr/o5KGlHJqb0oLKYV5+uW0l8=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32490493ywg.329.1656941845844; Mon, 04
 Jul 2022 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-38-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-38-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:37:15 +0100
Message-ID: <CAFEAcA_9_BwTnMnVwx-NH55TyipcvX6uRbOTDe+Sh=QyesNSWg@mail.gmail.com>
Subject: Re: [PATCH 37/40] ps2: remove unused legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the legacy ps2_kbd_init() function is no longer used, it can be completely
> removed along with its associated trace-event.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

