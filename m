Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B24D1312
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:11:07 +0100 (CET)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVrz-0001NR-7E
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:11:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVnf-0006aw-BH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:06:35 -0500
Received: from [2607:f8b0:4864:20::b34] (port=42588
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVnd-0006E3-9h
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:06:34 -0500
Received: by mail-yb1-xb34.google.com with SMTP id u10so16584532ybd.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UQkTIkOGTYNr1S7Et3ATFxsfZ+FGKqZVSVd+HIw0qRw=;
 b=ey8/AmuJWQsSokrwEIg7gw+LD/WEeEP+aMKRejmEEYBtAsjZRpeDETgD50arG0uToF
 HQvcVPA4odiHbdRpISKSxnbvsQUL7nCEIXjH0MmwYwJzHZDNYoEQyDaNt0qc6dM5+xvX
 MoLwkPHvNdnKNQNWJeIRq9rwdN4p3VpAo79LZ8VYXnxMdi7QXI1Kukj8JVGYQltOOXyW
 AVBdcid5kHlVjORPKsFc8Sg8RTHxqX35MpJOoRwU6ClRrW0Arz+JCUMj4pN807XKMskI
 7IOzTvZ0khQuF/ShGSS66w+6dwO+vcAt9C8b1YgMksJaRVpBWsAnFuiEmA6mNAJvtI3N
 +F8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UQkTIkOGTYNr1S7Et3ATFxsfZ+FGKqZVSVd+HIw0qRw=;
 b=b+czHPGrZFfZbVB4K6mAxspaM9RfR22bAFXbJaKZ3XUS7WoLZHoJ2e9dLsMp4v4WoO
 i1xGhux7M8KK9RNtX/OFLs3pZ229Puk3h3y5eohm7UzW99TvbK72tNqwQETYfEKWT2wn
 a+uGo2ZDLjecFcX20CmlvgPwv9qC8x7b7XVDzirA2VVfXAycNCV6nUdwO34MrrTWMeSn
 Ald0KfySv04ZtWf+8K85RBiOKrXrnDF+Q67cSpJ9otvXPIbrCQZTNx1yhTU7ftilbtqy
 8tRtGFvvl1//Kz/7KyqqtQdV2TC5CWL0oUEQULblHoITKaBxGDdxp7rhmDuHtR5QObIb
 P+8w==
X-Gm-Message-State: AOAM531T2BxccFSicxQFYFch3ZF3zo+tl1VraQLWIXgO1MqNXeD/02dP
 hxnVwjnVWCmriYTmBJ47RzLR3y56hfb/vUNUNZUFDhKKWSlojg==
X-Google-Smtp-Source: ABdhPJyy//4VPTrO+Tm1AtGjjIIABqNiTlJ/Frwte9ox8jI5z7gDDA6LmaL9z5NxX2X2MuCJUGTjLOdcgSTuQHklBW0=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr11022077ybs.140.1646730392290; Tue, 08
 Mar 2022 01:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:06:21 +0000
Message-ID: <CAFEAcA_o9VN1tvqo8oeusr7-ncQ5XCn9XrXiTKiRnRd6mWwK+Q@mail.gmail.com>
Subject: Re: [PULL v2 00/33] Abstract ArchCPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 23:27, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33=
a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' =
into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/abstract-arch-cpu-20220307
>
> for you to fetch changes up to 61deada4bf54fddf1bc36e15c16269c33462aa90:
>
>   accel/tcg: Remove pointless CPUArchState casts (2022-03-06 22:47:52 +01=
00)
>
> Since v1: Fixed Darwin/x86_64 (HVF)
>
> ----------------------------------------------------------------
> - Re-org accel/ and softmmu/ to have more target-agnostic objects.
>
> - Use CPUArchState as an abstract type, defined by each target
>   (CPUState is our interface with generic code, CPUArchState is
>    our interface with target-specific code).
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

