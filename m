Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7755355937
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:31:45 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTocB-00044G-9G
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lToZi-0003T0-Sq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:29:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lToZg-0005Pf-Jq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:29:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e7so17298584edu.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vCMDR2bFaR2Hv1NPRXTRi7hl0fBqOUZdK1WNjy7RHks=;
 b=mL0SE6elI9Fl/WIou9+ck1A+lD5uBzsQCRrtfoJocOP9SfKmWc9Zvk1iGpc/dvzU/g
 hy2TPa0ONBfwmUWXSNXLL8NAXO5DF9KhdhIiPtEQeVAZNx9b21aVEUvTtu2A5ITH5ieh
 gh+g7IuHoZ4Lhesvk7iKnfb2LBcimThSb9EmWdldvfHnSe07e0J7b+T0jVXUMm0qmSVL
 nlWcyZW2oQnk7UcaK4uug9ZyvcYFgMDNyAXdRijDDG0LtOF6zEwXGR+pxZx9U6kDmZr4
 DTOBzC4dpfFhOxuMYsna/aY38udKYG9nw8Sp3AIei6JWepBm5Odu0Npm10HApguSgntB
 ffug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vCMDR2bFaR2Hv1NPRXTRi7hl0fBqOUZdK1WNjy7RHks=;
 b=aqn91oC/LUxdtGySMTbiQEgoYfo61+XH7Unf3oTA3IQ+yY3OXFBfZrnqoYGLxqq+cD
 g0TAiY1B5ncep8njJkHBjraSzv6OtkJs41IojW8pl2TfkJGOAT2+LFQWUtaBsOy/yRjY
 mWc56j6Pblwl8OoxjsEnoz5H1JHuQ7zJzh6Pj0UY0HPnR3FZbsRTKP4YeQpjrTzcKwT2
 za99k/+fBve9f5k35H9KidTIsdkFWGUUr61qV70Panmiii5JasZzTzuOMHZayKh5+uTY
 j+TwbBmBPTy4+Isk9xpUlNA2ZXn4F5qKFNbf+2vzTghTPNl3nQW6Fl9CG/7VX3CUUM77
 1H8g==
X-Gm-Message-State: AOAM533DGR0tLdiyiPWC4DX4DZ40A/lrVw0jdgaorfoZXKyxjpH2XgLX
 qEO6EnQiP9r22DXHOTZ+uF7WQ6L7Ox5ssSGbM6dau04tR6vtDA==
X-Google-Smtp-Source: ABdhPJwVL5we5n5eXbELrLzuIaG8L89JW7aADNm5fngngY87BMglLg4WO1kNjGfHMwEohRYwseP4JudmJA00wTi/mxw=
X-Received: by 2002:aa7:da86:: with SMTP id q6mr2864941eds.52.1617726547005;
 Tue, 06 Apr 2021 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210406122635.28268-1-peter.maydell@linaro.org>
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 16:28:28 +0000
Message-ID: <CAFEAcA_V1XPY+D2huFe6iiVCiA9YZovGFfmiPFx2afosRGU0YA@mail.gmail.com>
Subject: Re: [PULL 0/6] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 13:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> A few patches for the rc today...
>
> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be443c138:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull-request' into staging (2021-04-05 22:15:38 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210406
>
> for you to fetch changes up to 49bc76550c37f4a2b92a05cb3e6989a739d56ac9:
>
>   Remove myself as i.mx31 maintainer (2021-04-06 11:49:15 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * ppc/e500 and arm/virt: only add valid dynamic sysbus devices to the
>    platform bus
>  * update i.mx31 maintainer list
>  * Revert "target/arm: Make number of counters in PMCR follow the CPU"
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

