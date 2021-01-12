Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EF2F3C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 00:24:03 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzT18-000129-3z
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 18:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzT02-0000bs-FE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:22:54 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzT00-0006cv-Nt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:22:54 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g24so4259499edw.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2MHpdziPm/44noxSPxH/zUkb9Jnsqu6sJ9q/rW3leRY=;
 b=z898KCzpZyxns0pLoJdkZZ82oCZNRudYZJ4NwlO1D/dPByp4dM6ABkyO0Yjwy+N9/E
 bC9sdPRHTeBauxKVRNR+jlRe0VkaN3nQImzdjNTgDQ2wZc7CCIBQ/egOtnUL+cRzVUjO
 ODSbDY5Lmcopj+4fs29NFmRDal1eP2NBjTckxqMne9s2M0UoLlxjkckQfcq2Hx0lPJJq
 WNIP0E6xBB2H+FVkf11aXNhJyOKPQ54l0ks6yUfzqsBSRLb7Opdo0JFvJYeHZlFZhaRC
 UsBYIV4BumwYEEYed5Dxrx2SjQP9pFb4K14lMY5DU8s0kW/mJKuFAy8GxUfLjMLsgVEA
 2otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2MHpdziPm/44noxSPxH/zUkb9Jnsqu6sJ9q/rW3leRY=;
 b=QBPGznh3tfTkvqG2mzVbbJvwagtvudO0nClJ+SHvtoJPe3hriI4PZ5rSnCn/mhpAM+
 BLPSfYaIDBW/QhBbbyJQWQjq33g1HDFs0RBjXkZScgn3e86kUg31n0pB71dfMEVzQSDP
 67RcU8JSDSNbTMZjhlXV7151AAoMsMpZSp5hiWMFo+esiKWQfWCMf+KWPbib/68CqPTt
 7hE8eUfpaSlcBu2Xoy8ybusOB0KcYxSxvS66b+S7zC+ZoCB6d9olvoPEBQ+WX9ukef7Y
 8TF+vOlZHRi7wnkRWM0XQggiMx/2jo4UxKdZHFOd6iuqXyzTaWRv0bpeVr/tpvxAnD+l
 X3PA==
X-Gm-Message-State: AOAM532oUcw0R7vHn1hLA+anaR0jwQ+JDThwkWKD236ICNm4xkUiHCq4
 3g+vkIXpWDv9T+06I/3gLZTcKI09Rg5jUU2aS1e5WRx6aIA=
X-Google-Smtp-Source: ABdhPJz5w7tvZ0p4+KlpjkLIesTlH+D376RTYaAbyrGZcYtZRBhHge7T7XOIt6HW2mQrbR473/EUEBhmU09vd/5gE4A=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr1224938edr.204.1610493770686; 
 Tue, 12 Jan 2021 15:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20210112212306.20899-1-peter.maydell@linaro.org>
In-Reply-To: <20210112212306.20899-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 23:22:39 +0000
Message-ID: <CAFEAcA8c51MHLP8TU_LpOBve8HJtKsAqXZ6naX0a6m_ZsYUsRA@mail.gmail.com>
Subject: Re: [PULL v2 00/20] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, 12 Jan 2021 at 21:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: drop the 'merge the manuals' patch: it breaks the gitlab job which tries
> to publish the docs on gitlab, and I also realised I forgot to update the
> Windows installer scripts.
>
> -- PMM
>
> The following changes since commit b3f846c59d8405bb87c551187721fc92ff2f1b92:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-11v2' into staging (2021-01-11 15:15:35 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210112-1
>
> for you to fetch changes up to 1ff5a063d60c7737de11465516331b8ca8700865:
>
>   ui/cocoa: Fix openFile: deprecation on Big Sur (2021-01-12 21:19:02 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * arm: Support emulation of ARMv8.4-TTST extension
>  * arm: Update cpu.h ID register field definitions
>  * arm: Fix breakage of XScale instruction emulation
>  * hw/net/lan9118: Fix RX Status FIFO PEEK value
>  * npcm7xx: Add ADC and PWM emulation
>  * ui/cocoa: Make "open docs" help menu entry work again when binary
>    is run from the build tree
>  * ui/cocoa: Fix openFile: deprecation on Big Sur
>  * docs: Add qemu-storage-daemon(1) manpage to meson.build


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

