Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FC2A92FF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 10:42:37 +0100 (CET)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kayGS-0002r0-O7
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 04:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kayEC-0000gF-TO
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:40:16 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kayEA-00087Q-LN
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:40:16 -0500
Received: by mail-ed1-x536.google.com with SMTP id o20so608165eds.3
 for <qemu-devel@nongnu.org>; Fri, 06 Nov 2020 01:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=clcCohQ/GxUfe/kHlcO26RH6tRO/FpNUCb86+lq8Tsk=;
 b=QRLb/wyS6mEeCT72nMJ4cSzcFcJup5aocjNdeBAqrzS2i9XeJ2Fq2Z6dvsjCHNava2
 606ETQOIIJZJMG3YjfMgpzWYZU7VLti+UXAvnw/65HeRGwsR+Hn8XoT250k2JYo1K1Iv
 2OR1Y/DkXgGL+0AJ3sx4+lug3gdoevydwvaBSXInRPHSK9egbHJ+Jhuv6pl3QfXMiSzi
 nBek5jmhbB0i5dC9P2QQNkoqAOdE2Lo3mH80cOjehhGMo49KcM9HhJHE0ciuaD9f1iiI
 VpWanQx54ZLVVA3676oCkVZEvEmhpYbo9WnXTopz+thcO5PqqOuZdZqg7gy4lt91GPYS
 swFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clcCohQ/GxUfe/kHlcO26RH6tRO/FpNUCb86+lq8Tsk=;
 b=IDKqKGqj3XBhqkmbSobwz/jz9R5yCbumd/H5eHTuyRBZ70JUDT5Qfvh1fDI77XCugt
 5kn5x05H7a+T/DmrehUDpNYOOGeq22oNeEW8O29G25L2vsaB5y34jFxv5iyNoZmJfq0y
 7d1Of4RPyjyOaxRz4l9cwxHhWUTocnjjD4gwpoms9QKurhuewU1sQRK6Qp+vC4EBQQ/Z
 0auuUsWHlT3KM/az1hI94tLvVFfnpOf8IMKm8fEVsLBZosNuqAyS/V0j8dFkm9mcbRgc
 i/AZLeG2ilVIeSzzcl6gXW51SyEJVtOX1KyZuroVeiANTL+KtDICgAf7UrHTX0jwLEUM
 Pkyg==
X-Gm-Message-State: AOAM533UNmEzbvueEHUGHa6uK3QTi8fwh+zTVMp7fBMzyq62cYZtRj5k
 B3aFMeogvbW7iJiQFI88nzIArEgtueqKe6Of4K2JSQ==
X-Google-Smtp-Source: ABdhPJx8FXRRGkS/XcVIjb4KLA0OdslM2EJE6CYUpZlzQJjK5US8r6rwymmWS1IkV0Wmu/URTTTZw6PND58KssaO9Eo=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr1095921edb.146.1604655612943; 
 Fri, 06 Nov 2020 01:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20201105070837.558332-1-laurent@vivier.eu>
In-Reply-To: <20201105070837.558332-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2020 09:40:01 +0000
Message-ID: <CAFEAcA_DxaA175DeX=de-SzpvQb8-JFt03b384ee++HfQ4jzVw@mail.gmail.com>
Subject: Re: [PULL 0/4] Linux user for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Thu, 5 Nov 2020 at 07:10, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 8680d6e36468f1ca00e2fe749bef50585d632401:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/pull-nvme-20201102' into st=
> aging (2020-11-02 17:17:29 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request
>
> for you to fetch changes up to 022625a8ade3005addb42700a145bae6a1653240:
>
>   linux-user: Check copy_from_user() return value in vma_dump_size() (2020-11=
> -04 22:28:05 +0100)
>
> ----------------------------------------------------------------
> Coverity and compiler warning fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

