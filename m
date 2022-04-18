Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2A505EBD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:52:34 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngXQH-00043S-Nj
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngXO7-0002Xk-QD
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:50:19 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngXO4-0000Mj-Qp
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:50:18 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f16645872fso49474847b3.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkhUUCdDltHnpm8m2Oa8T8f5U1vtvNagx2yq1kWNBGs=;
 b=VA99jMsziwZ1cyq862/Xavd5pnphJM5iS/N3J4tOGu10QFsTNDotC1O9WT3EchBuny
 lc9qB+r4atFZ3r7knZeFkVR0AD+7srN5FylVscVuNhtODJ+zxYT7KCVR9OjZEWsthoQZ
 bBi9JwqV7ARh9wpekg9KLPBohjFqW3S4o1MXyARTlpHnVag9GIS/LKlCP535G3Vy7xN8
 1PsZP8Uc/msElELA+ydjsmJUNXyCi/bCLpB0/1gXmOZyUBgOLGMqHC8tfy22GRBHlwAH
 XXH/oIXafegsyTGHK1qgF9fGwlbVb8YX5Dc5GM1PBerllP42ir10Zhd2F+zwWO9yqndP
 SMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkhUUCdDltHnpm8m2Oa8T8f5U1vtvNagx2yq1kWNBGs=;
 b=CYPiq++PBXLJIdLi6VUwDtlQdV3/mJshrYBAn2WYUX3q37/tu22xjpZU3a8CAkh+h6
 RYbLm2misXAipKF0zgvI9vL2ZOB/ivR0oRc+NBtwyll8XUWfjp5TDbLYTIiu09TN9seQ
 zDHxkJB6nn1X9WIT7gddxHPkNcFU1Y4fTne0vbfad1jwJjqa2bJ+loN+YRlDtx9nQqYd
 6Dif2U5JJmepAow2+LKOn3rNWENOXj92ubPlToo+6eUDkooQ+3lXXtb02fNRBAvTvV9x
 Veszp3Fhi61FsQeu7qxyUGQqVRWTmc6mZgYYL0duQqnR+mNzoXEP4zNyH2qfxYzwyz9t
 UrYg==
X-Gm-Message-State: AOAM531KiuqVS0GVrC17xAjbwk6ya5BC+pAqQIMfRp+xCBLEfyfE7mfG
 AYnkiR807FpzngFw0Zg7Op81c1zd6ad2BBw4+f+QvQ==
X-Google-Smtp-Source: ABdhPJzuczm5ZeTCbIWBTonAIQ9/0uNyUrME8l3033PkG/uHGNkd50K9BlTUiXSZPxRsbK48BDWlbsaMP1rfy1BCiKM=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4769352ywj.329.1650311415350; Mon, 18
 Apr 2022 12:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220418173904.3746036-3-paul@nowt.org>
 <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
 <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
In-Reply-To: <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Apr 2022 20:50:04 +0100
Message-ID: <CAFEAcA_2HJMP+RfD6eM0PzCS6f_KprJvck+1Cr+O+wnSKxj-cA@mail.gmail.com>
Subject: Re: [PATCH 2/4] TCG support for AVX
To: Paul Brook <paul@nowt.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 20:45, Paul Brook <paul@nowt.org> wrote:
>
> On Mon, 2022-04-18 at 20:33 +0100, Peter Maydell wrote:
> > On Mon, 18 Apr 2022 at 18:48, Paul Brook <paul@nowt.org> wrote:
> > >
> > > Add TCG translation of guest AVX/AVX2 instructions
> > > This comprises:
> > >
> >
> > Massively too large for a single patch, I'm afraid. This needs
> > to be split, probably into at least twenty patches, which each
> > are a reviewable chunk of code that does one coherent thing.
>
> Hmm, I'mm see what I can do.

Do check with Paolo to make sure we're not accidentally
duplicating work before putting too much time into the split...

thanks
-- PMM

