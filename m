Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A81859060A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:43:32 +0200 (CEST)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCDT-00070g-62
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBwr-0001dR-CF
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:26:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBwp-0002YL-Vr
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:26:21 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-324ec5a9e97so179453337b3.7
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=m5hafQZhWqwKswUWjWDDb0unhg0fAft7hPrBVTQuvu0=;
 b=ZPeTXA6S5Pj/1T30QyKvGSki5fUbZJXr3pmV8m+e3/ljREjvNUoYth8T1Aso9ySvAU
 p8bNwAz1FcARlhNYHeIj/HirY3/wU4abOq7J9EY8pkUYzuiVCCiUDGi9RLqeZw5DolpT
 nlBH/G3Klll4QaKPJaDq1pmr62Gl1NsBn9kHKZ7upQX6ST39HaBpwWkzYpb1ZIe7AKUR
 7GODCL33PB9jjhC8tEC7yxROkYJ7ilat7V+UHVdm9h0mDmu7WVHpvWUoM+681kSLrUjZ
 pAVotpzceql7Ve0N1rFBGJBT0Ov6fgXHdR1bGgI80A8GQxuXbt6t7YvfZEEtpBi37cIY
 p4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=m5hafQZhWqwKswUWjWDDb0unhg0fAft7hPrBVTQuvu0=;
 b=sqFsBEYfUadhROD9/iAOn6zQd3szl9r2hbk3DSvfEpU7CoS0+RZ+IEYmh0ny5rOLcy
 w+xx+tdIZACTXTEBNweztZaaPXFh1Rd99zo85NbT2S4zjKyd8LrohsjHvakGcgRnhRsr
 LPqlIwoJ8Nu8pChyiksW19yrJcPW0QB3d2Wm+Npwju+OtXIv1URkC0iwVENppJMFa1od
 3XisZg2LMxvxLDyh4vI2wkpJmgH/xfzsWjZJ6Qpv78q7s90Jq0cxNvrB4uC4aFTGLiVb
 aj7ogj2HCLcx4yNMoCwXIagLEs0blT69Js4C4zTtDRfFwIN0FFzWxKP6vVed1BamuZBg
 JI7Q==
X-Gm-Message-State: ACgBeo1Yw9sSTwsheYqRCCDDI3Fz0H+XrdvD93iXUxDgs1kpfbG//HZ/
 6YfT7SYYGixboNnoycY2h6bPNzJeKlV/kYQ+q9J4d8QrWiQ=
X-Google-Smtp-Source: AA6agR7FMePgHJLyQbNwyET08xMWLpKrFqzWy2BL5jra7YOIN3HpLFJcn595NxzxMJG60Tz6mB8kte16WmaGxSDev54=
X-Received: by 2002:a81:9942:0:b0:326:5dab:8915 with SMTP id
 q63-20020a819942000000b003265dab8915mr280918ywg.10.1660238777663; Thu, 11 Aug
 2022 10:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-11-peter.maydell@linaro.org>
In-Reply-To: <20220811171619.1154755-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 18:26:06 +0100
Message-ID: <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 11 Aug 2022 at 18:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
> compliant PMU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Oops, forgot the docs update:

--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)


thanks
-- PMM

