Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E154543A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:36:42 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzN1M-0008W8-Q3
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAE-00019G-F1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:37:42 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAC-0004hd-49
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:37:41 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30ce6492a60so247090237b3.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXMjwHzdV5pap4XQ71dk+04GLmzD9yvLftnUp4Icep8=;
 b=shYgQO3rQfDDaaO68LMt/N0Ff9dDVD1gwJH5DNVRK2gLf3CcCkuZbOy4HGANg0j8T4
 D2VyhPPbsdn2vzHJIoexH6trns+u2Ld3FW9+as58tfLTLZ/QyYobusBVvP5jfvWSCn+U
 cOMxx/THGDic0yM3N7qZa88YdopLfJtn37ICFGUYDr9Vwp7LJej4nCHbP1tQJi8VrbQi
 JLQCCctlTafUUIuJRBgo9HJHmbAl1YrSbkBO7Pl2wZzf6bVDLMfDPs0qX69IPtbuS7O+
 hfiWqMqSCB+ErIulf89oexyLPYarkcW8vOiSBJn7onB0qdr8QnzkafEGDDp0qlwLikZq
 r6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXMjwHzdV5pap4XQ71dk+04GLmzD9yvLftnUp4Icep8=;
 b=6CK7okjkBb5XodLm48TXoVaohcc8oR7mNWY7oXN8SPB722UsLEQv/wyd7ZK/MrDlzy
 ACpqj4fHDQ1B/dRBdzVGK9KKSC88LkOWQM7ewaSqDG9Ca4f4R/FYt9++RDDZ1OyOnalm
 MiYKvmr4QLLo9zEEZwsvY8TDHCd55ffqH1FeIjQLzPuaB8G7x3LsG5c+dcTOL4zhT/3I
 4zg3h6DR6IHRTCivAmgi8FLut7aCqbdNmHl890CeeOw9r+X+15Z8rx6QuFjWcKJySpjm
 eQFwlFy3AZ7Wg3Irp2H2/2X7mu2PRH3q/n9Nv8qrETav00CZ3ICce+srnxE+B6mA+dNx
 eqUg==
X-Gm-Message-State: AOAM5323TWW01wqxZ5ZUWntfkJQTZWbARq91f7l8IyF/MsHuv7d09YcK
 b2yFqxgn18+iqfc4fBiMTJo0Pn6ME39NHQb0DFdRTTz28Nw=
X-Google-Smtp-Source: ABdhPJxQMt2HckLK6aN31QVq3ZfQGTMe6ooZVYTvROp9DSZl19eGJbrLnUv+ZVV4rwkf8Fhy/vDXqKcEmifkzA5xdng=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42507056ywa.455.1654792659131; Thu, 09
 Jun 2022 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-17-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:37:29 +0100
Message-ID: <CAFEAcA_fv3TfoWo4__Ar=RaAVR_h7U8=vzrWjaTSWT77=Z1MMA@mail.gmail.com>
Subject: Re: [PATCH v2 16/25] target/arm: Move gen_exception to translate.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 7 Jun 2022 at 04:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is not required by any other translation file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

