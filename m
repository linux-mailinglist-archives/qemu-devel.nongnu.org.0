Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6842E344AB6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:10:55 +0100 (CET)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON8o-0008Ce-DE
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lON0A-00079g-Rj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:01:58 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lON08-00008k-Qt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:01:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hq27so22154512ejc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dT7P1pLKa4dZxqYQ01EA9JcaJW4A1zlSi/94idF4wYc=;
 b=gx0BW1XmKAtI22vKjXIb1TQKmN3DRx4GVWKozm+2AHH9DTMhTlPKvhrCLWd5VmSGtC
 RDeEoDKVovjWWglYuNgt100TmDcr3MfK44vVG+9elWtT+FDqnXj0r7VHdtr5ighWuGy3
 AyvdzQvf1uqcKYC5nJbpj0ZShm+7ipL+C+8klp5FPMEIE0QfZ47yglgY5hbX4tZ3vVHU
 uS+H0XO1PBeQkcFG70Bp4Abdy/g1Az2VtRkzUz1h279+rN0Ga0VQLddoc/UFIrB4a29t
 dhtiRS6bOi1U3ZFqvd5QkDVCR8igmL3ViBjdO8tD/zDEKsb+qQDLkZFMVEGDzpCDWBpe
 wa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dT7P1pLKa4dZxqYQ01EA9JcaJW4A1zlSi/94idF4wYc=;
 b=VgkCHLtO1OhlBC7LGf4DBIwjcAaLQX1SXXdSgkpUENn/vowGaUzi/rZPwqXYJ88lQC
 n1DurRP3DzV+3XS2JlMhNH7sA6T+YyfyXRmMkiCtWDKPQeicaWxCyp2SpffvhWI1QmYB
 CovGyqdgApkG08ozinjaLxZE9fwKrMcSGBrnfmo9lwI9+G6xJDt8Bf/nHSYu+n5pQeWv
 fZ92/LKnUZM3rYfehMnWtwsdHsyyMiMPX6X8q7iQhSfwaKEzoEBCvUh/venjcQx/Dw7g
 0dMrKTTArwe7WedPNa5CEEJIWCEWTDsH1naCS294wZwoc2ZChpeH7jIp1IZBeRTw4CUg
 DHLQ==
X-Gm-Message-State: AOAM531peGvBVTe/M7as0xzx4zEOCnGShl2mZjFaDwlUoPq+c2CzX/FS
 kw9Bqiu5M46WNpd276vnV9X5EgrjO+qp3dgmUARjY0RQPyOw/g==
X-Google-Smtp-Source: ABdhPJzviK6KmXp+KeUVnc0fNBLVg6Ix1bod6tkPS/3Kd9DH1IwHRWaXvRD9XZMoQIi+iOpCB2lZlMVn/UJrqZSs8MU=
X-Received: by 2002:a17:906:1ecc:: with SMTP id m12mr513911ejj.4.1616428915230; 
 Mon, 22 Mar 2021 09:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210322135957.4108728-1-f4bug@amsat.org>
In-Reply-To: <20210322135957.4108728-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 16:01:27 +0000
Message-ID: <CAFEAcA8D8URLTGXuB59xG55tJB1JRt2_t8D+KpsCur0zPuwKcQ@mail.gmail.com>
Subject: Re: [PULL 0/2] MIPS patches for 2021-03-22
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Libvirt <libvir-list@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 14:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit bdee969c0e65d4d509932b1d70e3a3b2ffbff6=
d5:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-03-19 18:01:17 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-fixes-20210322
>
> for you to fetch changes up to 83bbc537a151730741c04e40d23711067330dab9:
>
>   target/mips: Deprecate Trap-and-Emul KVM support (2021-03-22 11:28:04 +=
0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Fix array overrun (Coverity CID 1450831)
> - Deprecate KVM TE (Trap-and-Emul)
> ----------------------------------------------------------------
>
> Jiaxun Yang (1):
>   target/mips: Deprecate Trap-and-Emul KVM support
>
> Peter Maydell (1):
>   target/mips/mxu_translate.c: Fix array overrun for D16MIN/D16MAX

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

