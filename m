Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687ED5799D6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:07:27 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm0c-0002Vr-87
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDly9-0008SR-Ha
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:04:53 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDly7-0000Wf-QB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:04:53 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31d85f82f0bso138011677b3.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwewn+ZRRd24EVztWUNch3fQi9cHX52fEm/bvleMzMo=;
 b=la7gGhD5+bEpIIW4Go9whji7ca3gZrw1WirDzH52TwZ3vosmquTFqd3X61AT15hzr0
 8HkSK77Gy6MM/Hu4pMxjMkYUgOAsTAcp2OicK24w5sX445wPnERaBgq2fYy78sHwxLsl
 4SmhLToTJXS/pknnuIixloy3cr9qcYm6YeyvAsSDTGLT7VTAlYerreUABnvWE3lQv+Ra
 BqPoH4F+PiZWoC4Oo02tyjI8T2hQBcKTHPkThjdqSDWzhovCj4EcAHT7qBuICaPQJ9BZ
 iiM/c8/pE3JoCGb140YZGwS5lPY0XVM012qv0Te7jox935zW7PV2SJ1eR/zxS0Qmn8Iv
 JvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwewn+ZRRd24EVztWUNch3fQi9cHX52fEm/bvleMzMo=;
 b=Fof5vof3JlkYUedjsPu8emaikwbqB52TVW8Ep1ztJDPkR4Rkt/+InJoxMazx21oTMG
 HLMXkmUyrmfzdZpePMbckgjspJDXWIuCagM906tMwBbVFl/6M93DfKNUxx8Qs4SfQiwV
 XUXaT5TRKqs9wBFcqCfKZl1rvh5IfvWOwxyvYC+3PYCNF3wIOdoYP6Y5CRfaClC4CA88
 IGfKfdVqBKGAwNclvZSQZyYv6rVvCt7qgIWK9ebSUOHq0xbogYCyZvz5JRh9opwZsmTx
 YKeO3NLJe+f9nZPSngTpE4+Y97EMUueD5PuaHcQ9lRCHZ2db+/xN4yZtPtGOI75yEQSa
 WjZw==
X-Gm-Message-State: AJIora/eqOjOJQxf0rhc/CYBwHg5vpxSwHmG8DTjdraYLNR/PO5nuVzv
 3oU1vMZ10CKmV3Yi5AxTpDbuqThgF7xskq3bTB0DHA==
X-Google-Smtp-Source: AGRyM1uCbDG7VPY7hWRh1vcmNoTmuKsYL4G4Ew4BHF3NVRx8aoTta7jEUrKd+6ShgLVmdKkqV2/Ywa+NtfCEG3abR0w=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr35710889ywg.469.1658232290565; Tue, 19
 Jul 2022 05:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220718224845.19878-1-tsimpson@quicinc.com>
In-Reply-To: <20220718224845.19878-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 13:04:39 +0100
Message-ID: <CAFEAcA_cjB6_QjZ6=X=st+h=YHPm1zYovU8C9Stcf2fy_8oDEw@mail.gmail.com>
Subject: Re: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 at 23:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 24f01d220f56eab3268538ef10655b4fb2453fdf:
>
>   Merge https://github.com/qemu/qemu into tip (2022-07-18 11:16:39 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20220718
>
> for you to fetch changes up to eb9072602617cb49c489aaf058f72695c2eaedc2:

This tag is badly broken as a pull request, because it includes
this commit:

commit 24f01d220f56eab3268538ef10655b4fb2453fdf
Merge: eadad54bf10 78237897312
Author: Taylor Simpson <tsimpson@quicinc.com>
Date:   Mon Jul 18 11:16:39 2022 -0700

    Merge https://github.com/qemu/qemu into tip


Never merge upstream qemu back into a branch you're using
as a pull request, please. Just rebase the patches on
latest master.

Luckily I noticed in this case because it introduces
a whole load of garbage changes and doesn't build.

thanks
-- PMM

