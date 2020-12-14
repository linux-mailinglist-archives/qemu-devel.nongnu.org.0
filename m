Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897442DA1A0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:34:59 +0100 (CET)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouYc-0000yK-Di
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouWN-00071V-Bp
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:32:39 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouWL-0007nZ-Jd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:32:39 -0500
Received: by mail-ed1-x535.google.com with SMTP id v22so18590082edt.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dL+FX27CWyxfNf4jnRkDrpoSvi4kN+gTOTXY6v/WGZQ=;
 b=d+70UQQK/FEZRFZ4aziyun4uSX+TiC6SLwNxk8yUPoYb9iKvPcNTL+NVTFsIJHtQtH
 MMiJr0wYvYjEcfrEJ4SUkphD2x8h+T170+OoCETDedJrdehdbKWLFUwAQa4+J3/NDQZu
 HLzAfPNNWiebzE26zll4Opdalrt2WZyM8J/NBBAKLqcKL1HxwLHU4sT4kkgIFBfmxSCk
 e3H3PwIhEfoNAymiV0vR5anral/1ljwNdDFGMuNvUNqRDJzo0YEtgQBNWQYUJt/cGuH5
 PRz5//Z1iqDKwAuvqSN9JHPyXkYNik131NRc9GPzyJj9OF+5ezawsldM2CXg1qRT3kAl
 SYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dL+FX27CWyxfNf4jnRkDrpoSvi4kN+gTOTXY6v/WGZQ=;
 b=ZRFG+ioVqCWfvNBBwXAGZoqzWtBLzTmz1A0LllCiMg2Bb6WYntDMkt6yta4JpuVfsN
 mfbuyyvsBZkX1sIpCM4slEifDa8fthWMQ36Aic7wHVMWYAFwLZheYkux8vZwB4Gofzmq
 RWdnFODRoJiX8tfrwIktTPBMZ29RcKUQE0sIK/NnF5yFjfuWTHUgIsmz3skKw0gTVQkB
 rFou7J+2fUELSU7j5iPq6qvYTNpA5C7bA6TRxI30rNHkow+WAYuZl/iCewT/AyBTUlza
 M6m2kX7vKZVyAuUlnuAPfzrwiY7I0CTZcIRqYbc3+uyDlun4YJmBUCWcZFSRUe11djzk
 vD7A==
X-Gm-Message-State: AOAM532OUGOl+8usM7REIhXB+blqHhl1nEBMQrLTPF4nPr9XttUxE+yo
 j47BPWRGAOAkFairupqENjRj2A2agao9MIWXws6xsw==
X-Google-Smtp-Source: ABdhPJx2mkqZe7+/+KxctWS4qfpsXWuGuqgYUad4xPvBbhJHCxRUWKv3FIkgQHhzSsNIqvC2g1QwKAY8fN1sdBUJjig=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr11781440edv.100.1607977956133; 
 Mon, 14 Dec 2020 12:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20201213201946.236123-1-f4bug@amsat.org>
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 20:32:25 +0000
Message-ID: <CAFEAcA-88QL4o6V2k8c+rQspYHWtpzwBFTtY-288h1LSNd3cuA@mail.gmail.com>
Subject: Re: [PULL 00/26] MIPS patches for 2020-12-13
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Dec 2020 at 20:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit ad717e6da3852b5729217d7938eecdb81c5461=
14:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2020-12-12 00:20:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/mips-20201213
>
> for you to fetch changes up to 3533ee301c46620fd5699cb97f2d4bd194fe0c24:
>
>   target/mips: Use FloatRoundMode enum for FCR31 modes conversion (2020-1=
2-13 20:27:11 +0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> . Allow executing MSA instructions on Loongson-3A4000
> . Update Huacai Chen email address
> . Various cleanups:
>   - unused headers removal
>   - use definitions instead of magic values
>   - remove dead code
>   - avoid calling unused code
> . Various code movements
>
> CI jobs results:
>   https://gitlab.com/philmd/qemu/-/pipelines/229120169
>   https://cirrus-ci.com/build/4857731557359616



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

