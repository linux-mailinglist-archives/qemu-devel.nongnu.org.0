Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C41156C1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:50:13 +0100 (CET)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idHk4-0000YX-BH
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFyl-0006P4-Go
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:57:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFyk-0000ir-Gu
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:57:15 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFyk-0000ga-82
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:57:14 -0500
Received: by mail-oi1-x242.google.com with SMTP id b8so183414oiy.5
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g42y1xdNTGbwMgFf8iqh+p4XHfktr+cR3cfNR6JRJdo=;
 b=y+FvN7RT6lUSWta2MvoN/MLXzz8YZrZPW0ChJFsVYtq53oZT2f6I4xxMoSYXlU0smk
 pAyBDzivAOoCACZ6bDCcbGp+Nn4Lf96bGtgZ2wAyej8+6W4xbzrjPUcUeUhqLOR9Auc0
 ZDthYUM9/e8/WgrIzPXLr7u6BbT6+6g5ULGDPkykYC6VAAUTE9x3QfwmUrooAVpyfwaJ
 1qjY0gLDBTdHwaGwh2i9JskdHS1yLay8vtgqn2/000fSgmsL4Qbs3wFnwCNLx8wY7aYC
 b30UqmvX/uUHq8UpF15Py7KRvhATwOxZW+U3K/mHbLVdCfknM2b5XN9Ve3UlyNu+ZaAq
 K2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g42y1xdNTGbwMgFf8iqh+p4XHfktr+cR3cfNR6JRJdo=;
 b=HjHh53oRRdBZoSfQbYx/mL0HmnL2+kyL+xQY+iaVtCV8xYVkGMuBO//T6M3AFEh9Wk
 e1CXd5+LaVCvp0clycb5VrqSJWKE6vaFqDF9B41FnUKQ1QQAY3/dqU3L1/qhBcPumDbZ
 lFMWoHp4CGhLx7jwshWVFy9X7jLYjVtr7oyk2/JcgTd3T50RO3e2iB15ePFDw1AAz7Dz
 TozpDLSn0uRDOaE2p8harPYvbI7DTNl6mK/k/UghmvwAm1FLkQJCNtuyAJTn7TWY2MA+
 A9T2V+E+5yMljo/ATEVO0CVXg/+2emoYn+DOdTYHA3W+jHL9wNZohZIn4LDiapD45maC
 4+3Q==
X-Gm-Message-State: APjAAAVYy8jSYOyjKaK3uKYOjQbLhPXHzDBKprjuak2scpUS/w17iV1T
 12sDvnaLaEVtERYRhOFM45SmRZpQyGvpNGUj3xZXgw==
X-Google-Smtp-Source: APXvYqx4IW/HPd+6r7c52DGFJJlvNXCKOKkeHklkVBJcXffxgHvKqFY1FAc/c/lYOqwos3pka18yH8C5/LBdBIzuDGQ=
X-Received: by 2002:aca:edd5:: with SMTP id l204mr13174595oih.98.1575647833534; 
 Fri, 06 Dec 2019 07:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-41-richard.henderson@linaro.org>
In-Reply-To: <20191203022937.1474-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:57:02 +0000
Message-ID: <CAFEAcA8iMOrUdNc5onHHR8_mvqcOC1M17QYXBr5bn_g_DF8e+A@mail.gmail.com>
Subject: Re: [PATCH v4 40/40] target/arm: Raise only one interrupt in
 arm_cpu_exec_interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Dec 2019 at 02:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The fall through organization of this function meant that we
> would raise an interrupt, then might overwrite that with another.
> Since interrupt prioritization is IMPLEMENTATION DEFINED, we
> can recognize these in any order we choose.
>
> Unify the code to raise the interrupt in a block at the end.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

