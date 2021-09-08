Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF204039ED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:32:34 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwkj-000360-E6
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNweY-0005JN-L2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:26:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNweU-00021f-6r
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:26:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1382041wms.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qODqC4F8JSWJ3pZmXOGjpDEl0r2T+ckxRh/YJcx6lpY=;
 b=ily5Hh04vM/9rSmhalQb0RfCf4iNZBDVQEyDad23IptWmOroA6Excb5Yvt4HkmqZVe
 P4XeijPFPBt41RxvUzKLAbsWbpSgXcnhjyItwIG/E6tG5pkqEnUBY5LANJmbPLfODPLH
 Ri8E6aGqThKSdk+khNS465Xou7zJQ7j67rINrsIv4itpMZT5Cxd6cv34vGN3piSjJY9e
 M7hZhKt7Y6zaivIOJx/7FFPsmuDaiYky+I6zns/Ncahov9k2cdus/Y0mtMJ+iwjvFwnD
 Whj4TiM6PKSvOwfCkOCpJB2lSzqpTKc5jMKZDMtt7vwcqf6pMsp48s5e594WNdCp/l2l
 88tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qODqC4F8JSWJ3pZmXOGjpDEl0r2T+ckxRh/YJcx6lpY=;
 b=lVeqGz5F3mbQYMpoONf5kdFw+eOCBQDCDBBz6N9UctjXgXdmcDUCCuQU9ubiZekrTz
 0LScxDXNu0fy3sAa3xC3Db/XicLpWxd8bgGujyFHdw1f3t4ydJoG5TMhpcxRDdNXvWa7
 kxOt6bYrRikKhkzKgKjQc/A4dj/QYMHOlVDidse9yKWkHhQf2Jg8nxmggwRovzCeNdKa
 UzBnGSsG/mMsDYLP64AypKmIxtu2Ph6/nFuFc6p6iao/6BSiEl4/Rv/RZZCYJGLLaUnZ
 nzzPB1n14c5q0wJaEf2wyOekHM9WEuJAvombstmSld4vMVkvonehPszLU5QNdcnnWYGa
 umwA==
X-Gm-Message-State: AOAM533JDEI/sfUvWcWNMXzW6d/sUaAJp1kUvzs6MI15S94S4Cn45BAm
 JyS93Vz68IXD0AZWpKQvSa1b7VrdfBVZqaSIZfQQmQ==
X-Google-Smtp-Source: ABdhPJwSg7D5CAkxvWhFAuBP06H164r6p9imh2xFlufLZs7MxWCDIc98VZ+Pf8P4Xqj/cSHHSfRnv4SeJkZ6UGroXK0=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr3363376wmj.37.1631103964137;
 Wed, 08 Sep 2021 05:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210908093718.31069-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210908093718.31069-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Sep 2021 13:25:14 +0100
Message-ID: <CAFEAcA8duu7wQ_sxxWdwqxpbJy57w1eR=68m=i+6FJ1kJ=9+dw@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20210908
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Wed, 8 Sept 2021 at 10:37, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-openbios-20210908
>
> for you to fetch changes up to bac97d80cee950a1f68af27dc153c96d701c5d5a:
>
>   Update OpenBIOS images to d657b653 built from submodule. (2021-09-08 10:30:10 +0100)
>
> ----------------------------------------------------------------
> qemu-openbios queue
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

