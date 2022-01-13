Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3748DE92
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:03:56 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86KB-0005KY-Aw
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85rX-0001q1-Iy
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:34:19 -0500
Received: from [2a00:1450:4864:20::32a] (port=40643
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85rD-0005c5-Kb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:34:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so6033621wmo.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yts5wuS/bOc/CF0wGbIgjIuVI/JxIdpW+wh3i7846jQ=;
 b=ozgoavF2D/CvAItT9iEibBYS5RBxYthjz+9X3bEAFeYWziEnDtPfG0Z5xEEF6k6ync
 gpBR5FhfOIwahtk3rjZoXGOg75WhEiDqYFDHCpMAxG4I/d6fDm5oU/Bg6nzfApXINWg/
 lTmuFJY1Y/v+707FZOBwRoyjU+vFZJRS7/1e8LeTywBUVGWqNScqhFty4iTe2CEo4GVb
 kQW91a1JD4Ao6qDX31dr/WWLWHB+RJx2tL7OHOHMEecmkX0CXc40TAA+w0DG/SIAk2W5
 vOBhU07zjV4zNTik8bv6gLJ2H9ko1CtuOama8z/1sGSZ6/bWWNf7VPZEoc+rUTOzS2cj
 MczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yts5wuS/bOc/CF0wGbIgjIuVI/JxIdpW+wh3i7846jQ=;
 b=dJnOOoskgm74euMgyuC+5O6X0q5y9TaABRcTK+si9rG66fa0vOrhSUST0Eqw3yl49z
 4dbR85QwabM7EXNZCsNjxbxDDsgsNa7Pj1JkOgG7Ysp9ICaiNLJi2kfH2R5ed1llrUTH
 3xGhLC0VZbvdHyKc7WWP/DQ7whpBMX2rypgAdsRVqNXn4hPPjb+m+4eA8ainIXNWg4fA
 ClgQu8vJ96LnXAT4O5KYjk07oI6nFgDeKpJO1qBxXUFFwf1igxuXMHtNoI31JBxYaG5t
 iZrCviXt254nHALik5BlOwR0EnFS2i0NlahT5dXQUlUlaf0ZCbwySCEuMAX8AHIPuYTz
 qT4A==
X-Gm-Message-State: AOAM530FgWVBmXZILH/+DuyQTpmFsuLt1t+4xFnymdkC0UYRX78wmQlF
 W0nGnC+IInEcKMclPGj9ECpi20/V1g6Hjth2yDMZZw==
X-Google-Smtp-Source: ABdhPJz+PijVz6zVcHNyfYzyJ6YLg6gKSrvPgK03D070I2I/5QTWKhkkTTyThBCWDBgj/W32pgq9nfeAhBB/fICdeFo=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr8632354wmg.126.1642102437595; 
 Thu, 13 Jan 2022 11:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-14-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-14-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:33:46 +0000
Message-ID: <CAFEAcA_L8po++_Qe2d1FXQrEPDcm1Umu3Gz8T4RN2PwNq8PJ4g@mail.gmail.com>
Subject: Re: [PATCH 13/30] bsd-user/host/x86_64/host-signal.h: Implement
 host_signal_*
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:37, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> x86_64.
>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

