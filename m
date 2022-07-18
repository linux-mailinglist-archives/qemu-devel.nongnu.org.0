Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2D578044
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:53:25 +0200 (CEST)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDONQ-00066u-05
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOH2-0006Hh-K7
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:48 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOH1-0003ZC-6p
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:48 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cf1adbf92so102381627b3.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bf7YmAQv6UI4aD0b0qH8+GjABNuIOUHS5pzZtBPCiz8=;
 b=Qq8DSADGhM+3HtY3CnOt2XCTxHMc9QRZINAMKnM7Cu7NAAGIdUWJ2JIeZ38kGLGZem
 8w2tbjAXGcPN6xF40wYZzPmamD73BSfdw6SfTg1V/RPTfEO9hgVkeE+V6ni+anadCqT8
 qADHHXh/OGdxdzFBk1LazNlZne/Wby4UCGkgCBnyDjRTvVhxeTLKMq4zHZF//4IFaOmd
 vmQUjBR3aQMY0WDvy0BIPSksQs2lJLPqMiezMB74Aa5DIWafaY1yCNVpRqtAsuv1Aqo+
 QcBuhOMvJCQWshfTWAvet2PkOb8q8z0ELSvxpqhjXN0mpXDUIJyBF9G5N+HrBLRT5dIi
 AADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bf7YmAQv6UI4aD0b0qH8+GjABNuIOUHS5pzZtBPCiz8=;
 b=peDq9TyfsjDoWG4r7V6nvr280kWocxRvd23M4qEX0uYSNjP+fosVwiLvArSayz1o1f
 /lH1fUZm1BGg2afjvIgCHFW2EXDmFGlJwdoata/u73S4354XGG4yCw6pcCprbFDKhs6T
 rCJ3P9fZGeaEhCIonHuL3axm+b4cKalp9VshCxiMO7xSBq60T0rNn8T6PfLEuzYWFbF7
 llY9PB6Fjd+SXWLwSh8QlFUQ+fHJ0XFThpUkXuVNxBp2gUzVFNqG+f5KLgpx5dyVt1YY
 P1zhd/u/QjXmk+wj17RadRpFMOzkrZyPQI/8GyYE4+w7h50BubgXLlYmh1Hd9VUr1oSO
 tr6Q==
X-Gm-Message-State: AJIora8x/e/FhUYQNwjfC9rPoFUvDMfkKoqUJ7+bb1F4MGM4GbPqeF6m
 MZLoTqTkIAGMnlX0l4FkgvK/aa9ItR4v8kjBlA+G9g==
X-Google-Smtp-Source: AGRyM1tgZQhjX/YHNTlKAxOcgtIOxBBEUw76F4BOXwZZ4t9QmWRtlNgkoPdfxUf2WWP6cjfTaVkUrTpQb6RjGPo1gBw=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr29025718ywp.347.1658141206197; Mon, 18
 Jul 2022 03:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-16-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:46:35 +0100
Message-ID: <CAFEAcA-TnvruiP2JL2s7u70TYyJSCuFs_CcEgyK704_-vO_EZg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 15/29] Rearrange reginfo and memblock buffers
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

On Fri, 8 Jul 2022 at 17:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For send_register_info from master_sigill, do not keep a
> reginfo buffer on the stack.  At the moment, this struct
> is quite large for aarch64.
>
> Put the two reginfo buffers into an array, for the benefit
> of future dumping.  For recv_and_compare_register_info,
> index this array with constants, so it's a simple rename.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

