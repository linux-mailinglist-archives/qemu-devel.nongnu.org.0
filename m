Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC9565786
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:39:02 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MI1-0005rh-Qx
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lxo-0002Lz-C4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:13 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lxi-0002K1-3a
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:07 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31c8340a6f7so41018947b3.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpzUtMUX89uySI+KtJ+DC8nc5q6z0iQJ3DtHUJsSC4A=;
 b=qNRWI0dtTMkdhih55lrlvahhavcQPG7EGrUeW9/RnTu07idJTr/rMofFwIinZQ/So8
 GXGIUPDc0qy5EbsPqOyRi/7l9QZs8XUvNkef5lBpzA9pkKEspUr2Deefs92vMACB29x0
 1nlJb1M9SehQ8joRjQJdKLsLJkJ5shy4YgysvWDL115KI02QWkXQQQOaFL76vBW/RKjD
 GoJ3lPRM5/pcCer4mcUdhWZDwR/Sk1Mh56EWrq4KT6tAffQW+M8Wgz3NcDtWhMozJddm
 PX1NZ+ZSfThTbyXFzKNTZRXAJD3Y2NNaKl4pmYBYKUWjuCkeJe4rB3ALFo4WnYSIPeif
 b0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpzUtMUX89uySI+KtJ+DC8nc5q6z0iQJ3DtHUJsSC4A=;
 b=s+csR4Fgb4v1FW823Q+Crh5/H9kbcFD2395m4i/gMjo9HSlklIxfjO9P+SBIwqkX89
 DIyFFZvIUZrdM7Py3kABDQEsmvXIN0M0HsRR4L27IB07xJDatLQG2z1PDZZIYqtcNviz
 18O4XGFr4H8zSp5HIdnX1+1oY/Peid1lhTCPrDlPpNK8TKr8al7dUjHG4QFT1qjCLqYQ
 siM6hHMVjGexxZOive5mDWYlyrfUKOvnHuZBZ897O+jsedezgKqGnji3eFDGt4VBmIMe
 FKS2c8XVH5RQemD/qobXIaDnTx9QXbylWzySrF+IBnuKRrHDWEMUk2KuAdPtjJrmgPGL
 AfMw==
X-Gm-Message-State: AJIora/Op7LvV2mZQvLbCa9EHqv5VMfc09u03f7XR2idFWFY+fkSlg4w
 JtQRJI4hzdkjhrlY1LSCR7UOZCO01abx3eyAJdYaEQ==
X-Google-Smtp-Source: AGRyM1vn4czfJykGheVZ8+7UYFxy3sLkeZPym/DTz4xOu+AVayhdltcv2V6d7p3kQHIK8qxSRXCzr+zqhl73IQNDbho=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr33798284ywb.257.1656940681097; Mon, 04
 Jul 2022 06:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-9-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-9-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:17:50 +0100
Message-ID: <CAFEAcA8_t670b+-DUL56gATbBgKJOyxKFEahC-2MuZ5dahkKfA@mail.gmail.com>
Subject: Re: [PATCH 08/40] pl050: introduce pl050_kbd_class_init() and
 pl050_kbd_realize()
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
> Introduce a new pl050_kbd_class_init() function containing a call to
> device_class_set_parent_realize() which calls a new pl050_kbd_realize()
> function to initialise the PS2 keyboard device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

