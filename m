Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071D62A005
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:11:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzS6-0001in-7D; Tue, 15 Nov 2022 12:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouzS4-0001hu-0e
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:10:24 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouzS1-0007hG-Ei
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:10:22 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p21so13741484plr.7
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 09:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwHe2ohijQZ8rCnNbznkizKr7Ph/UqFQzGAowq/nMA0=;
 b=kxzDPckDRm4ObVe05GpphB95GXf4v3fwVouEwmEj37MiLPhP+fhKrGEGMbF9clU8Bk
 ma17M9cl40SuhtmZFfcbKi25gMd4dq/HKDooWDqcMkj/2V8+7bB0ekDBB3yKYhEx2AOJ
 BthSMmv0kBZy7SLpEcKS/J76g8Qw+czyz+qSbkOxx5tfrjSVaowL7AqGMZ7gs/wlXHqW
 +Z6p5ubJiHXOb7s3fnS58EvZPbm9+w/axvjoJR8Iqs9gPt3cJorChKSvyoCWpcTxQvCs
 +Em9CQlzvzx/bTbr/Aqlj8ApGVFfHz44XqOONrPx4ewDjRTBY85aP6HpZA0+2zIg/kym
 8PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwHe2ohijQZ8rCnNbznkizKr7Ph/UqFQzGAowq/nMA0=;
 b=ChA6l670fth9MBtnIrfqAJWdj4SCqCkHOX5TGN99AGsgisbLXqvYfYM80ORYLURkEa
 7O6Lqr0GBMdxdZyjd9ikM+Rmhnb28aueRELQkGUkEU752xE1epfWnNqiNhEeuTd3H5LC
 elzSWY2mm7ZX8/dfiiGxTGXkMwTR3U1Cp7627w4aVCUWRafqUp1URYmmNr9FjO4Xh4+m
 EsmLpnl20+bR0OMoiiRlx6LCrocjLoAvyDdgT+P6xteIVu7YDYSHWqjDe7RXh7YB523p
 MKp+Q2kcP/Q2xcFfKjehN0k6osLk0QfnG3RVfqHBrRgigFkgbrz5TNrzd1tzuHjm9/Qp
 6kWA==
X-Gm-Message-State: ANoB5pmEQ1iLZLxsHKdXVPELHs3WtTR7ylJvfGQkYqFYT4xDo/czZOY1
 rMZtP8SofhKaZ0+asARxIZOZBkm0zH//N+oL9dHMUw==
X-Google-Smtp-Source: AA0mqf7a2ztZDz9fE55D9Ijxe4pH+PCaGGDgFGRjn+CQvkGeVSdlcwBypxnHXwjmmmefEuhfMZCqQBTBUznjAbtM7XA=
X-Received: by 2002:a17:902:9303:b0:188:5240:50ec with SMTP id
 bc3-20020a170902930300b00188524050ecmr4882155plb.168.1668532219946; Tue, 15
 Nov 2022 09:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 17:10:08 +0000
Message-ID: <CAFEAcA9dY-1iCqF3f9ME8dqGEY3o=JFVPOc-zsQcWOMnKezgdQ@mail.gmail.com>
Subject: Re: [PATCH for 7.2? v2 0/2] Arm GICv2 fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 16:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi Peter,
>
> These are the 2 GICv2 patches as you suggested in the last review -
> this time with an updated commit message for the second patch. I don't
> know if they qualify for 7.2 but here they are if you want them.
>
> Alex Benn=C3=A9e (2):
>   hw/intc: clean-up access to GIC multi-byte registers
>   hw/intc: add implementation of GICD_IIDR to Arm GIC


Applied to target-arm.next, thanks.

-- PMM

