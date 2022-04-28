Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB84513295
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:38:37 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Tk-0004Mb-TN
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1lP-0001s3-Ec
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:52:49 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1lN-0002h3-Np
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:52:46 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7d19cac0bso48094927b3.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoUEj5hr/kf+o2+2r31kzP3jkujXLPflgykWkV0KvNc=;
 b=dIJRRNX0w/XjwiGV/HZx9QlJ3aGNXwHvLakr/lZjtzTClPt6s5hPP1h3rr4soYdbbw
 dQ+GtR2LOzTTASYvJMPkambmRut14jLyQkYpzAiqMR/RbgFP/H4kyDj2oiBndtO/mH1r
 04K+F8hbYKJqnXP3Jr/y1Bor8FOlcA5EdOQJXCeKFCrUcqf/pThN7FbTMAzEbdoVIgL9
 MScNLqlggoH9aJ3g55aX/Ze2AfzaTiUrpQJHOG0vM2Yv8M5H4RiqYT0/jOGqZxLdwAX0
 cA2YDiAoAd80HMC8S4+zOLu8SdU/u4XF5GvF0QggvDkr0EvnNUTVSfJiIHt+Rztt20Kz
 V40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoUEj5hr/kf+o2+2r31kzP3jkujXLPflgykWkV0KvNc=;
 b=mDH7u8unFmXTAtpUMSKJ0gEaj7s86R1ieW6EGz28rWhDXp4UFHvHUxpDiF1Pl/PZ56
 viL45j//LRYtgiftmHz2Cvb6yl1Ps8Fnw2wij9OoHa4DAv4XUPoFjrP9MvEWqC7r4zvx
 G4v0rG3cQQLJdPSyugy5kc+SFcS9kVq75dnUn2cjlx1WBq0RnBOaAGeY/v0/WGYbD2lC
 MWXLQC/tRHkUhbJTM8ynUYNSDF8nzx2GX2SlWX7+lY6uf2hxIcTwQgMuWG6r07NdB+fW
 umyq4HY8UyYaumV9w0nQBSDhwK2GJmnKnI7dD2TOnEmAjd/gvlBvI3iUnF59Yk6wBsG1
 B15g==
X-Gm-Message-State: AOAM532pFfozfSL0m7Crimk++b+r0MPHRdXYECNShPS4zH9X1jCz00Tw
 V8wK8jtNrdSkyoG9jML0Wc2GW1k9ZHDFecQyygvaBA==
X-Google-Smtp-Source: ABdhPJyaqj3yo4lydligHeFUnno4+Yy3UpHxvAmMsnp679YtLQoilb5Pnf6Idm4ejzPylBCWRlLtWI008agFAGN73t0=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr32137937ywt.10.1651143164856; Thu, 28
 Apr 2022 03:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-47-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:52:33 +0100
Message-ID: <CAFEAcA-iLQ2GhgHg3TQc=qXmvcdfSU82pms6GdRG9umqYQm6sQ@mail.gmail.com>
Subject: Re: [PATCH 46/47] target/arm: Use tcg_constant for do_brk{2,3}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 26 Apr 2022 at 18:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In these cases, 't' did double-duty as zero source and
> temporary destination.  Split the two uses and narrow
> the scope of the temp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

