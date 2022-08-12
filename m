Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15656591286
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:54:58 +0200 (CEST)
Received: from localhost ([::1]:40780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMW3t-0005LA-0f
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVxB-0000ZF-PW
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:48:08 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVx9-0000mT-Kw
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:48:00 -0400
Received: by mail-yb1-xb36.google.com with SMTP id y127so1811935yby.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=19RFNd6sBDrj7Sw2BOXLmmSP2TCYMH9MJGabpElKT/w=;
 b=hmrK8gzMWXR+r9aHakM2MnRV8mY6dysncI4yjZvrk32zN9jeURziY0yu9RoMIK12jk
 JlEpTPfPzVVDI9uiwMRvKSnr959SZtELPo88jH0beTCCua/OjefwcMV+52C4Pa/wFJSL
 EGaB6Gwk1rUtMLvnz6/nRMCiQVZN2HV0vU44ICvaR3+tXPFIuJQ/i4nPbab6xYAYo7Mn
 jxuqN8306xnDxLJaPhxU4/WfEIa0jzCrW1TUUAcfdX9iKpgH7NJkX/Q8r8As4OQFLZym
 FRZ+A+6GA7tdWG5R3n9Qr8MCkb1EyuLC1jiLoslDOOZQcY+NjD4x5u3ksXprM+/cHN0E
 fcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=19RFNd6sBDrj7Sw2BOXLmmSP2TCYMH9MJGabpElKT/w=;
 b=8Endgk3H5FMaZoyKo04rZbeNU/sYzGn+sPW0d7HH5ziPjyPiTe+Jb9jKcEZqW9KKK7
 9gWERJ1dF7oKzFXkjUbl8fqGR3D8pUGQHNoTbSpK6FbvaIBICmSZdAT6btRk6HT/aXD4
 ZC++j2UUgBDFXOsruOfu6nHwkDhrROfVEUBmlZh3R49dNSVGlJqMIFXFXYOazC+drfD1
 OMtJO05DPGiqCJRF4HEXL1uX4gl8TRfBgFwzY4VmqkdBQnQ986W7USID4vnqPwmCtc/h
 wekeDqee4uBI22XdFhSp12agjqJ37auvZGnCFpK1ll0nbXEJJndFUGBtvTec8A89M8CJ
 WRqQ==
X-Gm-Message-State: ACgBeo2SHUAftimhe6lyMyyhoIiDuBM7p49s/3sJh0QCdIYh8eO8Y3az
 fU8q7Owd9pKTpL1/wIr7bOwLpfBG0opCnOwyuE/hA1+ltgU=
X-Google-Smtp-Source: AA6agR5S341v8Mc3fdS/+Kiv21IjRkRtleJo3nQGnAsQegvHQjRr6/Bk7zabVVPXS7QDPG9ClOA2Jp3FThCCIKNrV/k=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr3743564ybn.479.1660315678615; Fri, 12
 Aug 2022 07:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
 <20220610160738.2230762-3-peter.maydell@linaro.org>
In-Reply-To: <20220610160738.2230762-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 15:47:47 +0100
Message-ID: <CAFEAcA_zOq5EbxJF5DNH8u6E2Ovta5jXxi_5D6Wwm1DsQjXojw@mail.gmail.com>
Subject: Re: [PULL 02/28] target/arm: Add coproc parameter to
 syn_fp_access_trap
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
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

On Fri, 10 Jun 2022 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> With ARMv8, this field is always RES0.
> With ARMv7, targeting EL2 and TA=0, it is always 0xA.

I was just looking at this change again because we still
have the loose end of syn_simd_access_trap() not being used,
and I realized that the claim in this commit message and the
comment isn't right. The "RES0 or fill in TA/copro fields"
test is not v8 vs v7, but "are we reporting this syndrome
to AArch64 in ESR_ELx or to AArch32 in HSR?".

I filed https://gitlab.com/qemu-project/qemu/-/issues/1153
to make a note of this since we might not get around to
fixing this for a while, given it's not very important.

thanks
-- PMM

