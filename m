Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E666B6A1D69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:29:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZ42-00014K-Gp; Fri, 24 Feb 2023 09:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ40-00013i-6M
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:28:44 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ3y-0003Jy-M9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:28:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id z2so17048055plf.12
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cQ54g35bCuD1w3uyzUPmiOttzPBZuwsyHex1RfuqZ5U=;
 b=M8IunscV6G0Bbf0cYdvshy5ve8T8VU9Y9glTslJXBLCWl0ALDn/sjQqQ3hgXa4m1Le
 DmhPhNclHU67ZPeLJoGE2jFtcTnxRlSS4OZqN7zf+dsngiv+tV7uWWmIJc0euprkfkGP
 hNXs8smYaEmaQj4x7EEN3Z5LalrY/ETSfoZ14QXwsfIguuITV/Zlq5zd5WbYLYDLdypU
 z/QLGKmStgn+Ds6M5jmjk3i+HnZx8XHqxVcCCtigPaAzppsIKT8j/9g78LpIsTisPdhf
 9V15IWpDrDTPgeTtYSbDvCxbuM6VSC37/AYYAb9z/2GZ3bX+fmeLDMu91pyTk58lskhg
 MTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQ54g35bCuD1w3uyzUPmiOttzPBZuwsyHex1RfuqZ5U=;
 b=vLOE7La8wq1iZWf4NuSVmdBn6oSabcbWNUp9lEywg4UZv5PQUrJFujuXS1E6pWM02i
 DeIGtvhXNzOGC8dJQ8U9k+o1ZQAnpP/NEAnni+xt/F40pGPHLKxIQ0MVmto6R1RSg32k
 i/fLLmsyAe2HQxsv+OeSu9GV5rHJHwpSEAcYmXF9Pw/hpuWtYxGuunaz6sUhC56SONe2
 JvCTd5MvHGskFUnYf4sKNaRvbcwyiK4Y6EGi5+UMKkh8EXipxchK49Hkd/D+3KFKVgpC
 IkWCMvbDCBtG1ezl3WC6JY9OGGAS2x2K8vf40nXGKG9QiNclELsozh8TYJwWX7TwiwLx
 UrRg==
X-Gm-Message-State: AO0yUKXPdHYPlm7d/3aJGgcgbJvHAyrlTypT26WPeTkkw/d1AMcebIcZ
 bNaWhMQHoFJM5huQzf2EeQEv1kpfYlhuacVc/z1mGw==
X-Google-Smtp-Source: AK7set8CwngLteQi8/fUmKHQ/zjaTMDheqksM1b0ctsqfFu94yLYW7cKal+HDiucxE+rDWtbSvVR+i26qKirLXkr2to=
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr3163056plb.13.1677248921173; Fri, 24
 Feb 2023 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-16-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:28:29 +0000
Message-ID: <CAFEAcA9AEtb52QHthki4CV7ocBqQvR1j-88PLgxBUrVkysjqiw@mail.gmail.com>
Subject: Re: [PATCH v3 15/25] target/arm: NSTable is RES0 for the RME EL3
 regime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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

On Wed, 22 Feb 2023 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Test in_space instead of in_secure so that we don't switch
> out of Root space.  Handle the output space change immediately,
> rather than try and combine the NSTable and NS bits later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

