Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A658D5F69CD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:40:12 +0200 (CEST)
Received: from localhost ([::1]:48002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogS2k-0001Xh-Og
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRtJ-0007PI-9e
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:30:25 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRtH-0006kT-5F
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:30:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id z20so1855087plb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AR4lyX/wyhqtgbyqoNkHHhtcoFLIClOuWSj8xUdTB3Y=;
 b=vFUXUJkbEYgpHiQK0vuxkcqbLpmov9j9J8qR4yg0b87jdsRZD9UrfW+9PXeKNPOItc
 gBy9D0dtPwvg0rlcUyeB+hFor4fTbcbRgwYiB5RRxC1PeKviXiArquMeuQWvC6c05KgZ
 TFevKIjFfiFGyaAKwoHxRlMfzWJYPMsYkH9SUOlk408ZKuSLwN+8t75l0qRX92gdb+Rq
 Jp50g35krvq7/T6cc2fOyRq2NMPvQyRjSj7dCTwL5XoUpe+JSxSEv7es6KnlU2pwGz+/
 ivS6myr3OFPOIrH368WD/wMe/0w4it330ITKFVprss6aR0J/Gcdh89DJ1UQUVTsYpcKg
 LMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AR4lyX/wyhqtgbyqoNkHHhtcoFLIClOuWSj8xUdTB3Y=;
 b=EcpMguX7z8hL7Viyx9wMis2z3c1Hlc8Zj/753YHA0wVDcd+ZsK2GKahkSBzCDhNwnl
 8J9M6hmtvwsKJpNqmIXuEJV5EJ0feyFA794a0bidr8hbjK9MVTSY6x4WGZA/KzuwYJMV
 Z+8eRSHv/0i7ZBT+dRRgXwJb2anOFMAuwfblp4VNn4HDHVoH3wNqcZeXPNYfrcZT2Q+K
 37qpwdbpB4G0mI2vs8X5SnpV4XtOS97VQLLoVyN589+jjhFSo0f5Js0Nhu6Q4tmuoHgF
 A+DDOe9HeLlFO1umYIsfr+QUP/ZmXlXSB9EnG6aMPNBBf0E9oA4+3Zp1ZK29BxCQunKU
 Z7Cw==
X-Gm-Message-State: ACrzQf3tQQoVcpPLnVz5UCfTZeI6dugnFtbPORRdC+vS7p6745nVOvLu
 Ui3/ZsxViDJ/FR0sMir6lFwV6oszCdV+Ckgu4uXgEA==
X-Google-Smtp-Source: AMsMyM6+ur8/mjgsAEgbyGp73kWuNAYb38YHn+GsTwZspnTKGnMJAnGuAccu2wsULE59wN2c/4Tq8ES9RZvcIUk2fdw=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr207641plr.168.1665066621678; Thu, 06
 Oct 2022 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-16-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:30:10 +0100
Message-ID: <CAFEAcA-UKa+-BycHqY0cLoz3p0vO9+kkuu=g3YTkNt4x+JZAjw@mail.gmail.com>
Subject: Re: [PATCH v3 15/42] target/arm: Remove env argument from
 combined_attrs_fwb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

