Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107F2F6229
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:40:50 +0100 (CET)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02ro-0004mN-Og
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l02Rb-0004Q9-50
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:13:45 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l02RY-00049l-S6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:13:42 -0500
Received: by mail-ej1-x62a.google.com with SMTP id t16so8023038ejf.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MDJJKJ0lC4BIDC+VcEKXtJ3IjRcvJz2yXkVa5/8v89Y=;
 b=gt7sdCX+HNGZgXc+JWFDcgliTtLEfukYMAF787vpDVcqUCFD3G228NC2cHJtVisZ8I
 85Ez7kWna3zcrzxzEA2cWY8j937koK9O5CJG4B2dNDcuNAB8SKrskZTI5TqOB+FVnAG4
 w1Opcqu2VclaYo6lvVy/pMpm+DXK5IyM0Ta9o6LTxMCU/EQ7e3N1m6V8TatqY4y5kJiL
 iPsuRn5S0j/biL/wqlvKxxJ3D0VgQ+XwTpEnAKYXobHAeVGNdqVLxg6LAfr1A1maHjF4
 GaqhSNPWLJxINEh3b56ZfT+umMYFY7GxqpmxGXBLmvZyYMIJrMUHu47O/rkvAtkZk5LV
 H08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MDJJKJ0lC4BIDC+VcEKXtJ3IjRcvJz2yXkVa5/8v89Y=;
 b=Wye6HbT57qYsrnc1Aq5l4qPdaOi3hBPqihFYuaBPHCr18Xv1k4oGzfBs7grqxBp6u1
 8/xPqOkJccRb0+0vyydIArCBopYw3rhsclgQuROyQeFp7SeUeESplBjcxT0S03U5Xfb/
 ZcSxTwH6xj1C8Ep5G3u38Iwuph6uW4mVHLSt3wE6JP5X5l7TQKy1MQsrHc8vok21Hzgb
 FoAP312ipcXNNk2aAMYabzXrb0bH1+TunDaU40Pnfc+Ry0qsPLTomxKjC3/3KN5R0vyJ
 0RcfpIEx0HK5U/YCmHEWxicvcMnHStSVwswzsiBLMoBBIn8DO/LPisT/wFlVZ5VMRoNz
 dSjw==
X-Gm-Message-State: AOAM5317MGR5qpSjlAxa8eycN4UIR2ci4D12KTMETXUACJeYwrujpfIc
 DSwfEDx6zH4bBQFErzX2A7yfNlimEY5XA/zRNT44zg==
X-Google-Smtp-Source: ABdhPJxh7/nZ3eBlhdsSklnQRJZEcGCTLM+r6PCxWdEySo0hIBdSiU/+bv9gsRl7M7Oa6FK2Jo/z4NG2OCk0nfsQzQ4=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr1842039ejt.56.1610630018822; 
 Thu, 14 Jan 2021 05:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20210114021654.647242-1-richard.henderson@linaro.org>
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 13:13:27 +0000
Message-ID: <CAFEAcA-tzqu16mSjxAwXf-PoiXJhSqrZ=rOodPLvBJ94-s6+FA@mail.gmail.com>
Subject: Re: [PULL 00/24] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 02:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' into staging (2021-01-13 14:19:24 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210113
>
> for you to fetch changes up to 4cacecaaa2bbf8af0967bd3eee43297fada475a9:
>
>   decodetree: Open files with encoding='utf-8' (2021-01-13 08:39:08 -1000)
>
> ----------------------------------------------------------------
> Improvements to tcg constant handling.
> Force utf8 for decodetree.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

