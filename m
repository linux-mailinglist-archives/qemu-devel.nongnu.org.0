Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD072568FBF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:53:36 +0200 (CEST)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98HP-0004oZ-Oj
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98FP-0002R8-F8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:51:31 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98FO-00043Z-1m
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:51:31 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-317a66d62dfso146263337b3.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LnY95ebbEKOL3mSLCMi2yyHc/+ogQ4/kJ58kxpMkYr0=;
 b=cx26fcEqJdWkYI7I75yK9m+rwBrZ3CRvuaQMKrwnkhwwnqPoBjLxdMjXm99qwheYqZ
 uWf1zlVJftMbw4IGhZRUFuLpb2qzrbfyn3QebiCo5+FFWo2YjFzXL1fIRN2wOtANdLDi
 dkJap1qO11ahbRRHiozMABsrY/ZJJCtj8S6WDqARg6h/QWzaP7eYmQNctODOoVEXWsD5
 R02WkYBlptxCqi7GVty2+ohG9q1ubJ2Bd/SsNJvczJ7Ol5eHDJ6N35gRoEQxdtTWcJKe
 qRoRljdCtNySB9TWmXmsUtZHW6aD4pJ+0IllQ3F4sYihqISYx06MpXVTJtu/9pYIYn5d
 ZIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LnY95ebbEKOL3mSLCMi2yyHc/+ogQ4/kJ58kxpMkYr0=;
 b=1RffvRc0j4Pkzxgwg6wayHCOxUcFlbngiXCSEBJzbHb0G0uzQBxjxf7BS+pky8eSug
 ZBXsVzot1TG8IFhzcw/eNHKFC02bTR+u9lfYEbSkVmQ8Faq7Ve/dzJ86xUWd/5Xgyhv2
 n7yuomAD0X+RrTfaVUk0ZBqVj49772zHV1EGMkU6NZlVBD5OcAEiB1FGGVgEt1tOzj/w
 /QtZv5VQ+Vapm6XNe8QDFMO2SgbE/PiYbArMM/f6RdfdpiNeN0eIZ44JmmI8ma92E/Uf
 uqZWiBy56+wEHiFSCjBkI5yZI0bPO65JL/dQTocwPujbXDhuX0wUYXDH9Cn7fnsj8JlV
 6a9g==
X-Gm-Message-State: AJIora8Ors22XWKT/LkvlDZggIWhNZu0/S8pIThcHd9KW2KDf9Bj/2jX
 SM7MjCepbOzvt8oSXrrrJR2fj5GtwCoVHgsKIxQfBw==
X-Google-Smtp-Source: AGRyM1uv8v4iv9b9W4o9OhEWCjXRW8ZNQU6d7htulYNCnl55F9BRzoCCk9rqyfd4BomIhUl5IVeJQug74Mh9hvKbtcY=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr14771488ywb.469.1657126288951; Wed, 06
 Jul 2022 09:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-21-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:50:51 +0100
Message-ID: <CAFEAcA-dAC=9de3xrTRLZ8eigFGLraKcvHcfUgkQBpqa+PUMFw@mail.gmail.com>
Subject: Re: [PATCH v5 20/45] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Wed, 6 Jul 2022 at 10:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
> because those functions accept only a Zreg register number.
> For SME, we want to pass a pointer into ZA storage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

