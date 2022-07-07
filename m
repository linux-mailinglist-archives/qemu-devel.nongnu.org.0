Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD88569EEA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:56:23 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9OFC-0004bg-8K
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9OCJ-0002XT-Ao
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:53:23 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:35785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9OCH-0003gq-TD
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:53:23 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cac89d8d6so95174327b3.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8C7guAptAfdK4tEL5pY1utId5SIjk80x5nLUW97Isg=;
 b=a9D574sCn28R6/Jjwld276XPPUxdmIJkQBc2O8zzdRGvVtczw/zGaMUba3A9pCcngt
 kE1SE0hTcuves3PXmW7d7QWH05YoG3GdsxOUmg3TTnn1K/VlZDahRGubB+K0NDk49g2Q
 z3prEdWNMmWmbIeQ0uNNNQGTEA527yhuay8/JXKJB3Bu4crHWSEcB4vMeXeNEt9ZYwDP
 9QQzUcYl6Rr81A9US1ZRTvjFmyue9IWhE2dzfdcuP9olKX87Ls72tUV5tUF0idgsmM0Z
 dHp5vj/6kjyhfKuT1yixDzCbVuPA3L/GHGQvd49mdBelDXW07oT/A1u/Hvpu96nfls+i
 ND7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8C7guAptAfdK4tEL5pY1utId5SIjk80x5nLUW97Isg=;
 b=K35gyv+YGn8z8cDksOKD6JM4qFfyh8A+g5T60/Df9rTyLi1raVLVzNeEJLXYmzB3m2
 g7br/f899VFCEvxUaV0pkj0HWMZW5OIOCeniIPXQ80PfKBu8Fkp8jz/pPfd/C9b5eMhR
 d638dJMTsOR5wvuPwKWK98yJww50g4EHAT1Mc4B4CrRE74c6OV11IIwgG8u9qd1+6w7H
 auWScFGyD7ilQMYta2d6gOzCOJZD37gV6Y2NMOjF3FAQDlv9PN1NJeAkdd5qKfIZwd2T
 7PzfWRSW85GJtSI2OTLgaQtqu0xvnvRstpN5mvaSGWsRIKURU/9ZtI6Z5U6fWFAGkcMl
 1D6Q==
X-Gm-Message-State: AJIora9iS0OnTlGhlkQ0LgEPllglzLKOiBJbJSyq5KBiafecdy20+f/L
 wWZbrUiQQHqrxXWbohvyGV7Z9q1ZdUi4mQGZt6Shcouqk/I=
X-Google-Smtp-Source: AGRyM1vCDBrSbLHP899+/4Ne7yPV+Cfv/9GrI22zPDCQ2wkRR4d06BRdJqwzjNdv5MXpBTTBeh7IJW9VYHw8j08CB1Q=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr51833722ywb.257.1657187600699; Thu, 07
 Jul 2022 02:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:52:42 +0100
Message-ID: <CAFEAcA9nfCaH4hYjdQqWMDMYc59SXAdNdMZ=WhfzZCVQZgu1ug@mail.gmail.com>
Subject: Re: [PATCH v5 00/45] target/arm: Scalable Matrix Extension
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

On Wed, 6 Jul 2022 at 09:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Use macros for vertical tile slice addressing.
>   * Other misc adjustments per review.
>
> Patches without r-b:
>   03-target-arm-Trap-non-streaming-usage-when-Streamin.patch
>   07-target-arm-Mark-PMULL-FMMLA-as-non-streaming.patch
>   19-target-arm-Implement-SME-MOVA.patch
>   20-target-arm-Implement-SME-LD1-ST1.patch
>   23-target-arm-Implement-SME-ADDHA-ADDVA.patch
>   24-target-arm-Implement-FMOPA-FMOPS-non-widening.patch
>   25-target-arm-Implement-BFMOPA-BFMOPS.patch
>   26-target-arm-Implement-FMOPA-FMOPS-widening.patch
>   35-linux-user-aarch64-Add-SM-bit-to-SVE-signal-conte.patch
>   37-linux-user-aarch64-Do-not-allow-duplicate-or-shor.patch

Now all reviewed. There were just enough fixes needed that
I don't quite feel comfortable doing them at my end, so if you
could roll a v6 I think that would be better.

thanks
-- PMM

