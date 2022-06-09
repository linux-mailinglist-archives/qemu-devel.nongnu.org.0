Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A86545401
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:20:42 +0200 (CEST)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMls-000189-6G
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLV7-000547-FH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:59:17 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLV3-00083R-9m
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:59:17 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3137316bb69so52912697b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ln3yeJpbJrr+PjP5Mf5aZfpBgUI4DB42NDXbK8OOgUQ=;
 b=ofbOzhGl4MqeT6FRpT+ShvPLDCLO3srzRDR+m+wRdLORxxFYGWe1OzhaOkQoKNiLEv
 IriLd4DAVfN21YcWLV0BTFSkNCPcVpVX/NnG5dB3kXVvEAYLbhxoST5gh19SyOrmspvP
 nP6XjGwGfgxsMcUWdyCLnVqAQKWsBVE22i1soUmiQtcgZd0TBPoF3tQfSFJMtVgGSBV3
 80DcOB6gM3nAe5gTh+FcNaL3Uzwbn229XVZkyxfBbTmq4vp+qwvYONGgmj3w+1Tnd1jv
 efS8cEFqGGGaCjVt715PdKjES5SRwOQTBkeG+qU6LHt479x0Pw9h/TTuSRqwekm5wIaM
 NUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ln3yeJpbJrr+PjP5Mf5aZfpBgUI4DB42NDXbK8OOgUQ=;
 b=tbvdPChz/wxYn2ymnksnCYg4pgPR1M0f3h4kmkg7cV25Bx+uE7/zQ+TeY+9FbekZC2
 oQ7S7/tXC+hhNcabJGl6AetWKjtKXr+r3VtqUrHMr7KCUDT3o+1LWPLGVSbEaA52VZr3
 oC5Ni6jU/CevJUz80dwa/UuIeF9FBZIyQ8oxcotIKLrbEurYmGedC1Q3NwrS6vN0a4U/
 94/cV2o2SAghx52vFXSa0+icouQqaJP1zbC1Be11E94OUTq/rep5iyS8yzwmWswCAt4K
 m/vM1J8adS4GOjnFplrltkWdxKWmFkHQtEzgP9RcLc16FPyE0a/DWM7JyiToYdxeOSUE
 AD/g==
X-Gm-Message-State: AOAM5320u+NtpBAUpsNx1Zi+RrktHID9EQip7wzKtotYKAk5URpfbp0r
 xpJVIAvp3nNe7NdrRymvhiRMl21rSAJpRULwJyNaJ4VKrRk=
X-Google-Smtp-Source: ABdhPJzjoRWqR9srp5fEVjC8dpxf6Wo6MKLqRlgqBhedIvYDHR98ktT9+Kyi9Qyysl75ov0MMICBH8cXa3n+sZ7TxmM=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45626571ywd.469.1654793952019; Thu, 09
 Jun 2022 09:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-23-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:59:01 +0100
Message-ID: <CAFEAcA8onLGq1bpvkFZqAx-KrTneMvVSJvvzpo34EQsziZPzMA@mail.gmail.com>
Subject: Re: [PATCH v2 22/25] target/arm: Create raise_exception_debug
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 7 Jun 2022 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle the debug vs current el exception test in one place.
> Leave EXCP_BKPT alone, since that treats debug < current differently.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 44 +++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

