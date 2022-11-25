Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561A638BE8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:13:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZRP-0005WT-G1; Fri, 25 Nov 2022 09:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZRM-0005WG-Q3
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:12:28 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZRL-00021h-7n
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:12:28 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q12so173245pfn.10
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ap/aIReWUVCz14Ftny2cxl802V0KYFE9927YRlpIprg=;
 b=j0OVX9wz/6cKImVbyu+ExmEVJ/vf35LfVbqCrn0OILlEBtu/qBjU3u+Zx+WlvFnio0
 3M7EV50q+d28kNli3478xlAQpYwQyiXPkWItcfiRdltSaT8TsKnfatvElcFG7a19aM3z
 /wqDmtK1fkygVf8eTAuMpJ+LwciVU1HNQusIsStUEAkNq2F2B5KiTA17M21ZYWul/l9a
 Ea1fzJF+x4IuWdYxfZIntY9Cu2Kyp5g0uX+TYQXZk3XJkHTgskbCfigAjWbPJG+OosbW
 GXINT2D+yE64FfwlsTVodLmUucF+gSg29mMHbeJTBHkK45XPmKuikuTpH7n6jsCcAkmM
 5IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ap/aIReWUVCz14Ftny2cxl802V0KYFE9927YRlpIprg=;
 b=hIoZa/668sMFHWc7AQP/CR5gLQpjI0vV2/OxrW885EdlA71JEquUDO3pSpi7dVojZJ
 oB6qQOBiOCvsmzgWLn7++D6dxy3+TVavNNF3xUVXuXpWm17pgSgxsXxyb16zmHGnX1ZY
 mb0ep9ixHIlyf1XRHtAx2EbRCQ43LQphClpkiG+Ii8s13At8QuCKAjPW0dmOmHG/Zd3m
 whcfQZZOnH8C0bRP/bR94AKSVyUJA4JEfVHLjXLgl5BU5JdRUViK4b6i53CYcSxuSxf8
 3CT4Tecj2vEaw0z8rmuraeYntjGOOdqt20lrIsrDVd3awiFOfnGlonlBfKa8iOQnR9lB
 v7MA==
X-Gm-Message-State: ANoB5plcIJ1VfkLt7vNyq1kougxIvIg/WYMqN66D4hbbY0bkSg/sy/5Y
 9aewUg4VtHuUYh5Ln6dmgxkHe9srGBRDJRBDNCQLqg==
X-Google-Smtp-Source: AA0mqf5tD6XVJgKgiMItkJtux7jXDjDxcPwUUe/rFko7T8orb6rYLqw16sp/PniMrUB9Rk8FvpBilrzCcve6ChPniIg=
X-Received: by 2002:a62:1ad6:0:b0:574:b2f1:2fbc with SMTP id
 a205-20020a621ad6000000b00574b2f12fbcmr4000703pfa.26.1669385542962; Fri, 25
 Nov 2022 06:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20221125140645.56490-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221125140645.56490-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 14:12:11 +0000
Message-ID: <CAFEAcA_P_Z8F4AfU1vyX1S59JEh22qMjcKC2RmH1g=8VLLvGrw@mail.gmail.com>
Subject: Re: [PATCH] docs/devel/reset.rst: Correct function names
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 25 Nov 2022 at 14:06, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> resettable_class_set_parent_phases() was mistakenly called
> resettable_class_set_parent_reset_phases() in some places.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  docs/devel/reset.rst | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Good catch; I think we renamed the function at some point
during code review of the resettable functionality, but
missed a few instances in the docs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

