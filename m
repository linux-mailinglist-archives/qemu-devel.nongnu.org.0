Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D13D776E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:48:11 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8NRK-0007uy-2a
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8NQb-0007FJ-0B
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:47:25 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8NQZ-0001Sw-Fy
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:47:24 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x90so9049936ede.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XU4InaJWOJ5VADzWRzMtfMqBGo0Ld1RaVDZvpFv6mcw=;
 b=y3waN348wqLPJ1GV+MhrrpXxQQi+yH8vo1Y/udUL9K55k1GiIUwBH/5bBkz2obddI/
 EBdnxlFhm5wfdwjZGQ5VSdtw/BM8vSGjBoKszZ/LVA/ivjgN85SMjMLSkyb1d2HLP7Qw
 ilmWQNvSKjSbTCeK9dgFHKyxHbqgauDQlVpx2DWM2lYzfI1tIR2FC2BeW1M+RdsRsXc8
 wVWlQIhS4V89Zg4w5kdk0bDLCeOmP3AOIrNN8qljZR4waw3sb+xZcFx7/zora4XlZi7H
 +EA8oisnaaUQuQRNbNfeJNWf4w/qogdwPXt+C8ANNKdaNbMmQ7iwiVwfXWaCA+4UGuZN
 hlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XU4InaJWOJ5VADzWRzMtfMqBGo0Ld1RaVDZvpFv6mcw=;
 b=FPsLQfM0UfkhTQmQSLQNuzE6oywwkiQbYUhz+12a2sy+dIGgiNqmGu6vUvm0l05na9
 HEvxkH7qltBlfgVOGmHRkzdxSXi0V0qKcCyuLFWsKE5H5LLiz9ozZuDx9z3h89u8j116
 mSzAL3BXoBvoye/hFzkrFzmVQmakxDmX0F0bpVU2AtjUiITdJ2lrf5gxbt0uYNaPxmSe
 RQM63if4XUb1v2B5A0rUU7S2K8hPno5wWn0cfDzbTtoYDsgsPgmwR2qGECAapAP+awZg
 h5U9cM3Ns9wLey9jm71Rnr7414/wFeO0qV2oC8Wg/ZFDbtHV4wEET4bF1A9/E1S5IbOp
 oulQ==
X-Gm-Message-State: AOAM531PMPrKMqLv9IJx95WgXIi5WRkIjI4VILjtucEGR6K0pKILoEKP
 DKDJDuv/YeNkJSku/XhHp40SKruOpxpWT8VI5ZvWIw==
X-Google-Smtp-Source: ABdhPJy4RpdiVPDXZgQej1TXvf+UXh70aF7T7nvgFsYrAe9OT8Pti6XdultxE6aE+Mavft7K2iYQBjbJqZDjQDJQ35w=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr8958785edq.204.1627393641799; 
 Tue, 27 Jul 2021 06:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
 <CAFEAcA-UZMGK3azd5fHGhk8vivzv4agY=GXLAdWJfsErDkORPg@mail.gmail.com>
 <CA+bd_6K1QWbi17sCBNcBqZgTWcrgtJ3trKJ7v2ZRTnXHO9G=bg@mail.gmail.com>
In-Reply-To: <CA+bd_6K1QWbi17sCBNcBqZgTWcrgtJ3trKJ7v2ZRTnXHO9G=bg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 14:46:39 +0100
Message-ID: <CAFEAcA8omDvvyMN02rFBhXF0LkpX1B9ERr95Aq-onU2NRrwmtg@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Cleber Rosa <crosa@redhat.com>
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 14:18, Cleber Rosa <crosa@redhat.com> wrote:
>
> On Tue, Jul 27, 2021 at 3:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > This is probably fixed by
> > https://patchew.org/QEMU/20210725174405.24568-1-peter.maydell@linaro.org/
> > (which is in RTH's pullreq currently on list).

> Actually, it is already fixed by df3a2de51a07089a4a729fe1f792f658df9dade4.

That is the patchset I linked to above, which has now reached master :-)

-- PMM

