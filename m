Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96B3648E0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:14:16 +0200 (CEST)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXTT-0007DR-V6
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNc-0007ui-NJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:08:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNZ-0005la-E6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:08:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id sd23so45414951ejb.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5uPwcKsAdunKOwcaweoVJ0FF6sGOTcKPCOauwpHWTA=;
 b=E2kXBa2uOrSgWawkDUUpVO6/fJDbEhGG3eoDkid5m0XS+3h3xVfTLMcOwHTw+e86iE
 uPvgXLVzTMQ6ocqnO0e5ulUywF3Efq2YSRF3rQtOIPTvP0qvY/uvO/w/TcC+/QBsIK5A
 AvBfroOBqcJjUd7zPW5VveSFa0bWHSJuX6KmEf/5E6t1OI0HSFzfV4uga3dph8ZngLr2
 PMvhs+eH1669sgE6hosPn2ul3OFzlIUGdXYpnjwlOargqpl0ZvXtS3a5kB6SaHx16hU1
 dfI5qRbXrlNdgYbKofW/88t7F1Rp7qLKhnX80tNtbhx17DAylT6Tyl/soyD/xueJwi/x
 oF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5uPwcKsAdunKOwcaweoVJ0FF6sGOTcKPCOauwpHWTA=;
 b=Sq09gFaw/mZ0URz75h/Y4AZ/L33XTTujdu/afDorW/brOtsRrKak7xZbFg8RUcp7mQ
 5/l1iFJIbl0O3UHEELPpHmZX28kJGjvdZJmC1/7iV2J5sGbCKvirllaGrdGPzWIJJRei
 QD47OXH7KzuJlv51MBgCh7Y+Q/EBa4N+AoGJdN0/WTd9e7JiYdJPrzJ6f4KYOnN3sLAJ
 Rbla5oI/2nPw340xrEoexDfzQVwZoFun3E9RrZ3L/DDmPwSQ2RVlpfHsj+Hs27VeOl+7
 IR8OU/fTyIOGh5lAcElP3UZjfw38wAwoOqS5u7IYWdkAQZx5ijlDiMkGGQgsUo4MbCHg
 5f1Q==
X-Gm-Message-State: AOAM533yeWRjsgqcILFp0cnwtx+5PgK5RavJhdTugRaDnRtee85hmCC2
 FnCHKP2pjni7sefHQKigz5nk6knA0u5GtLPeRYSEfA==
X-Google-Smtp-Source: ABdhPJyvNPbOs0yR0uEpErLqUyUR+qaD/n8YJan9KlZghDP8RvizWeL9Bg81BsauqQKkJ6Pzplq4GazlKniBCEqX3V0=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22942091ejc.407.1618852088017; 
 Mon, 19 Apr 2021 10:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-10-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:07:16 +0100
Message-ID: <CAFEAcA9S4LT1O12p7N4Ry5fWu9tFjoWxcMYRpkguWQO09GWa3w@mail.gmail.com>
Subject: Re: [PATCH v4 09/30] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 20:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to signal when memory access alignment is required.
> This value comes from the CCR register for M-profile, and
> from the SCTLR register for A-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

