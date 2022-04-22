Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AD50B4A2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:04:56 +0200 (CEST)
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhq9n-0002iy-7C
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq2e-0006nm-QA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:57:32 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq2d-0001W0-6g
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:57:32 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id v59so654848ybi.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJPHEgoOJ+ItzhjfRqSr1f4ZwMiieNqr+Co9gMeqiUE=;
 b=P/8Q1M5rrJglX6EXlIWFS8iWv9Wx2aqq2alrMtDAq0/iHpJSgVC8grH3bnNYV8bERT
 bDpfFN5tAMGRKLHxQfW+h/6LBGCDm8tcdpSY0U/d94KMS5fJM5YokAMaHmcWuRhhg6XD
 lOmndHAh/oTq53bJgaEFehyHe0hhkUUExZWvlJAealei3D6dwc9QOI39Sy196/+x9Jea
 y1hZqsdhmtnI7YfTzMBNkzI8EHy6F5zV7VYTC6keAY3L86O5qM2tqGVPyJ84veVFIqOV
 p2vW+SuaWBDiTyswFErkSzdUKtbLYAsoQl3oHnrGEuytjUOQgSP5+8Nqj+Kgq29MlQUG
 OqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJPHEgoOJ+ItzhjfRqSr1f4ZwMiieNqr+Co9gMeqiUE=;
 b=ueWCG1Tt8b0b0yB9PJpexafH4/950AIoG4+X2DzL2q3PXyGTLlyU2XcBbwTe5CGUIa
 k0ZOBvT5eUsEcX6Jux+m7LhkXxdTwG8EEZw0fcw5ZZ4/GyZUUSLZt/Aj7NcgRLKnynDj
 ooXeTc8XutgHncni9j//eTwV/rxrHxYxL+Q6Z/llibrVzw9cCMlF4d7vPnAxhuwVsbFd
 Zi2OeybBVb/MtveJY3hBZNBpUsKMnUhtt/BnlJv/9h/7x/IH8DrDsPSgzporuZTl3v83
 nT77CP2pwoOYH6eVf70E9N36/WSZpWEiRy0fhtVnbmlKAmtf+n9XMkEPODe386MWGxZf
 cwPg==
X-Gm-Message-State: AOAM533zgpnxksmbmnWsrsyKgI1iYpa+wYwtm2p3w90p078VVik9Ywp5
 Owy6eMn+QegmW6z625Uk7NMjR5ACssv4+HjtD4v6Ug==
X-Google-Smtp-Source: ABdhPJwvRb5hiOmwnUKQWlmr5oXwr4pUdMyotoSA4xmYFtNzgumZXKBb3zE86lvoM8TGg3h1zqnpdC09ErGnYfTl3Yg=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr2426202yba.193.1650621450166; Fri, 22
 Apr 2022 02:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-32-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:57:18 +0100
Message-ID: <CAFEAcA_W5euKsWkYCR3sg=WoADa3QFS2uWOh47vRE7S5=t1DQw@mail.gmail.com>
Subject: Re: [PATCH v3 31/60] target/arm: Name CPSecureState type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Give this enum a name and use in ARMCPRegInfo and add_cpreg_to_hashtable.
> Add the enumerator ARM_CP_SECSTATE_BOTH to clarify how 0
> is handled in define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h | 7 ++++---
>  target/arm/helper.c | 3 ++-
>  2 files changed, 6 insertions(+), 4 deletions(-)

Maybe also change the "default" in the switch in
define_one_arm_cp_reg_with_opaque() to "case ARM_CP_SECSTATE_BOTH" ?
Either way,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

