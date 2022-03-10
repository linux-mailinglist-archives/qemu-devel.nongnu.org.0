Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599A4D5132
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:09:37 +0100 (CET)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNEF-0007s6-KC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSNDR-0007DM-8T
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:08:45 -0500
Received: from [2607:f8b0:4864:20::b30] (port=45008
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSNDP-0002xj-NE
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:08:44 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u61so12453288ybi.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 10:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9lC5Y5eTdQrxdIz59y3bqipjmTkeomcCrvGbQ8N1bY=;
 b=TxbYHNSswuAiVBvP7amAHfE2MeKlvh9whEgfnxYVtnO6ID86OmPv0qwZPFBHa0q7Ba
 v2Vrbpnd5xlbY5NAFu90hBe2WozIkkdmMbm1OBfli3+v2iBq3i/aQ9CktheKeggldTWl
 B0V3MXf7yL2AhsPKt2fmATBn/qBocq1l5YwznTVxNc2Uh2/OReEyHxrIlVgm4jJuSQXc
 eD9lICeiWllA8DM6XSVyG0MioxGpznm6a+ibciWdHGpLCDarYQtXtgMZzgy2ACAgTSqF
 ieRQU8XPTZJfIUuS+DoR1AHUPHqGNiYNHO2pnPZ/nbeSucbpcrA0cgjqp0qN9pe+3NdP
 K3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9lC5Y5eTdQrxdIz59y3bqipjmTkeomcCrvGbQ8N1bY=;
 b=Mt5e3VxUZw2D4djrcjNp5WKo6bdNLAdqvLrrd3AfKC8yOCX7tjVSjjHimKOmIErpd/
 aJsF0T+VqjH7fRoIdgE5fnCz3TfoP5Fo7VssMwCAlWJq/qPixkDrdyqejAZaWSqQkcpw
 DCBQpdAwWsNv+SiL8BoH4xv7m6YARZxnUDi2ojlC9JJaAOWxlo/IBcFOtLJJUrRnsGoB
 mAncoa8ueMDoJa29phYBcgeGhkIbqDdUqB6l9yxViUJnFRoyESCiO4L+zJPHQyfrRXPi
 gqc5JF/Hwq0Is74RLRKWlzf09iJ2eVmeyMLngwuc3nYfjlrvCjKaU0mQVE3U7xdfjciE
 R7qA==
X-Gm-Message-State: AOAM533ThlnzdAgHwRp7y4nH2JRhE3/emNwHhixUAwMoS6UPCA8IcxDQ
 htE8KadUODnJ7jOaWX8trsvh118wVgau8g7j8AGeHg==
X-Google-Smtp-Source: ABdhPJymbdNfPuSy1CEyD8y+f/NlUtlGgJEQr1u8lCmtTN9m1+p4GQNF+CTSy1FLGdf3yCwJrgsuopeXu2EP4Oa3+o4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr4762856ybs.140.1646935722225; Thu, 10
 Mar 2022 10:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20220308031655.240710-1-richard.henderson@linaro.org>
 <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
In-Reply-To: <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 18:08:30 +0000
Message-ID: <CAFEAcA-8=M+AtmHKH-Th5xLryxE=p+rC9c393GsjK8H-T17Xcw@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Fix sve2 ldnt1 and stnt1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 11:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...and applied to target-arm.next.

-- PMM

