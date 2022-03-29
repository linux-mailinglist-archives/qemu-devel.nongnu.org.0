Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AE4EB0DC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:41:30 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDyK-0002JA-O3
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:41:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZDwA-0001UQ-Qc
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:39:14 -0400
Received: from [2607:f8b0:4864:20::b31] (port=47090
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZDw9-0001eI-6U
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:39:14 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e81so3139752ybf.13
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1/QffdNV3fhaKE/H5pbK/fcZtdoYn8hWe2gHBjxIVoc=;
 b=x/vhjlG9JttJiwAILRej0eml41RiqvuA9GzbmYhBUztrok76cmTy8ZuGSwVdp5QlK1
 PviXoT7EYwdZBv/9hfyx4KZxgCTngY4wTqIuv54tERoCptdQ9Ev69x0r12JxQtwgMCPE
 v0rBit4QYrt0L1dVrYJTqA/DSexEygfNNRHQAlmXEuHEtGruwyEgdwDK1o2VJhMy+cPS
 p21EOS/FaVPHrfyRv0CknDTPlefmxcNEBxc36qeQXlFgVsKeboUvfCfSuHPPvWYFDgAp
 AeVWhx5703QW49XSavNwO9MiE4emSnY5y1Nuc49ChaFUWM7/CcrxWfPBGvgSX24Xn6p2
 lNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1/QffdNV3fhaKE/H5pbK/fcZtdoYn8hWe2gHBjxIVoc=;
 b=neBQg2WTi76GUkE2ELTscCS/GIFwBTe5bYPIY0xbAhAFgonqxg7oQ6Qqg2w1JsvcMm
 xS7ATsplb3ElqimzXynP8svViVwSt0JrsZXzYZWtw/RtV8A7sit3jE3TXuJOnuXuqHV6
 r+6QxGKcCBgzCQqXtwhQH01tUtZuZWoBBtvIBRb7GffrsoofotHJVzVak2MxVsZPz13t
 HZ0Kf470Hy8XIKzFI79Qc1yRs11U4/fJnWBls03SxLeLwTVKFVP/0WaeqEmN4tp/P4Si
 qJJ8pPQ1ir00wFW/hmII8rcecEOkp18rQFs4kPep1/ZvDdjs/FhAfoY4qGX3o8Tmqp/M
 hPFA==
X-Gm-Message-State: AOAM533doPwnTCPs/m6V1PPRqJrv/e2Hm7QlRdmwDrpIaatlQB1Bf55N
 YbBucPc6tZuQRuIGbAqc2zupP77yeF0qoe6GA6UUvQ==
X-Google-Smtp-Source: ABdhPJwE23mQlvAgYX0eU7ugrYCwGhQGM6GyyZXXdgw9I3Z4xql5pA8Rn4YGEp/n0vequRhFheqfRxUhcD5YpRRKDFg=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr28670608ybq.67.1648568351923; Tue, 29
 Mar 2022 08:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 15:38:58 +0000
Message-ID: <CAFEAcA_4ugazLF0_JkAA14kMXJTz1A=DGu_bquJF6G7_phQgTw@mail.gmail.com>
Subject: Re: [PULL 0/4] Darwin patches for 2022-03-29
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 23:40, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 27fc9f365d6f60ff86c2e2be57289bb47a2be8=
82:
>
>   Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu into =
staging (2022-03-28 10:16:33 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/darwin-20220329
>
> for you to fetch changes up to a4fd374364d4e23e0861273aaf7ff2ebddd57a17:
>
>   ui/console: Check console before emitting GL event (2022-03-29 00:19:37=
 +0200)
>
> ----------------------------------------------------------------
> Darwin patches
>
> - UI fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

