Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EA574F5F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:39:55 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz4M-000836-Bt
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByr8-0005Rl-Gb
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:26:24 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByr5-0000m2-LH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:26:14 -0400
Received: by mail-yb1-xb33.google.com with SMTP id h62so3135087ybb.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5lbDwxBUXYygIewke9gr8MOQqhUjospuco4s+g/eJzM=;
 b=nMrR3ARB0+S+dncE1xTlSNO+HZnlZQ305f6sPN2u1CgXiraDu7jmJq4x/iDpSMcLky
 8cl1PDdV/TynFkCSSmGAR8Dcz7X1aG1OknEtea5Acf5DrBTRGDbAJetIMU1eiKoQZR3Z
 A+4uBPjO4/SP1RZaKIXBQLVPcppZtimOyGk44nuaRhTn5wdmwZfhcx6d7RlCms0aNOPM
 Sex+zfBqlOgYy3rlIbEMVhajNO1liGv/hADtHtmEIr6XOJn6HO9nlKiB3FU7zzmfWC18
 /Cfp0JhumwfIKgSq4otOVBIRJA/ZtwZg1OkAgqq5jELlEqiSxTxUzPNb79PgKfOQ+jyp
 thPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5lbDwxBUXYygIewke9gr8MOQqhUjospuco4s+g/eJzM=;
 b=o5LEXfYL/ZYhatciL0ylFtiXSsF4AZe6+NmCxVZ7kHO7nfUawD9XPDn0UPG94N5z1w
 MvKa5psrQ5bwEQqp3o1qCzJeaeqiawG9eTAiYVtW03ROeDwzi7LPM86hieSpyXFLMIBW
 t/3Aa9BCaM67SlwPWfZaEoSu1rddIG4Lzp5qPDQomuylPnpyTTVJvIpxwlx2ZB7HSh+6
 z6hhXpEoLo7cFhEQz6Z+KoKdbb5BmS0HwpBKL9FspNJnRLCsht+QPgCLy0obv4bqBjoD
 NutPhlGaUYq21luRJCu/2+p5sxvaoaXphApwHrgx1bMjCUQYbmCl42BzV1d2AYMoMuq1
 bQTQ==
X-Gm-Message-State: AJIora8RbTnC6YFnSjDhm4K3wzcanvKVnHn5wFE5iOuEtbLZcvjtDn8j
 8ZrLzI/NiRTTxvz8AlYPTctNLEPILPIPgMxrsxDkdw==
X-Google-Smtp-Source: AGRyM1vaNOUUU3fruXG6NaRS1SeUBz3AVZDsJkogsxHUVWXB1gNECM+ohb6R5MMXvpsT+etYJNB82zDOBLVOaxGoVmM=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr8670241ybg.140.1657805169008; Thu, 14
 Jul 2022 06:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220712221607.9933-1-f4bug@amsat.org>
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 14:25:29 +0100
Message-ID: <CAFEAcA_eOVtCgbhbBSqcGe_kaZxk1H3jv4m0y0RxmCkrPvmbPA@mail.gmail.com>
Subject: Re: [PULL 0/5] Darwin patches for 2022-07-12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Tue, 12 Jul 2022 at 23:45, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f=
82:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2022-07-12 14:12:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/darwin-20220712
>
> for you to fetch changes up to 50b13d31f4cc6c70330cc3a92561a581fc176ec9:
>
>   avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR (2022-07-13 00:06:02=
 +0200)
>
> ----------------------------------------------------------------
> Darwin patches:
>
> - Enable RDTSCP support on HVF
> - ui/cocoa: Take refresh rate into account
>
> Few buildsys fixes:
>
> - Restrict TCG to emulation
> - Remove a unused-but-set-variable warning
> - Allow running Avocado from pseudo-"in source tree" builds
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

