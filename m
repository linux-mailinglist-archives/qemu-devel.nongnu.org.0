Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CE33181E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:09:12 +0100 (CET)
Received: from localhost ([::1]:43206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMBi-0005fh-PB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJMA4-0004cH-88
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:07:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:32896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJMA2-0006Ik-AT
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:07:27 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x9so16575031edd.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 12:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IzslHPta900NewYQsY2CATYHRQob8whbEGBG42cRE6k=;
 b=lBxGXYCJpKkvDbMI+QrnKkvcr8OByuEIj0oSY8Znf8MyVb54I+uLwazm86u1nbZFuL
 CKkCgq3kE3WfEMwVvh5kav2YfhQ63MXVZ7QJ+Yoq+2Xxuz0boKrTTwqpG+b/gUoBuNTY
 u0Sq+BNXpwDoZANU7NkvzBy5uJ1W4Qofp9DfRJQ3Ep2AzbOSEu83n0WfrcJPlE2ZEzXj
 p2XMIIjpe3Fto1fJ0GXYw/3px1J8sM5vXFyOcsdE/O+mFNTFDTbPNYA3rPoNMdUgXZtZ
 7TUK9YtdztMvJWJ+QQ2ZryQeCW5WHBIkodwJ3jESVKNjtOmMIctbLTaSNq8Ql3EdZs3T
 FSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IzslHPta900NewYQsY2CATYHRQob8whbEGBG42cRE6k=;
 b=ieo8yhwK5Fb10LjPIydUXUg/iTa1vIAf0OcCUOhiqG0D1WuLC8eqJnaAOfXKLiqw24
 5YH4B7SCrTS84mJTdytlz8mAMmyqU0olJfp2XreWJAdTDdeLc+w8x/2ZhrpIX3LUbLNr
 Qy26yWByvojY7hFhVzj+BGVPMBgNZA30j7D1PPk0rIjztDHMGd3iWJLlPk/p/tQoa6rR
 TcBnCpPlT5CJIqelTY5/bRCT+38EQuX9z/czXV3Os8uRxwhA4K1otXRAoUNz0lQBzAmX
 I77/zSQEjNCWkJ268RhaDabS/Ta3drVUJSBPZWvNzVwvQJD3oN9dHCWbbfebfM807jIP
 T33A==
X-Gm-Message-State: AOAM532ciwrMrbtxreTlO3qOnQGpSQFLlOl0uqUHR3eI5T62Tltw2c18
 csUUYtEYKQamsvN5yXx40zEmHs3UZchPgm0pUn76gQ==
X-Google-Smtp-Source: ABdhPJwHsTsBrIGXqZjA47MNIpNWhxZKtIAw/YTRLpFJVdErKoRQ8ivIPrNn0+r1jwzXEN4SDJHDdhkacEplNzYOgiE=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr322691edv.44.1615234044378; 
 Mon, 08 Mar 2021 12:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20210306153621.2393879-1-f4bug@amsat.org>
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 20:07:07 +0000
Message-ID: <CAFEAcA8mLJGV-qeRb2chGUm7vrdiT=3NDqmSEEL7nJim9Pu=4g@mail.gmail.com>
Subject: Re: [PULL 00/14] Renesas patches for 2021-03-06
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Mar 2021 at 15:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> As SH-4 is not very active, I'm here covering up with this trivial patch =
queue.
>
> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9=
e1:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305=
' into staging (2021-03-05 19:04:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/renesas-20210306
>
> for you to fetch changes up to ef95ca038295bdf6749cbce426b281c21a08971e:
>
>   hw/sh4/sh7750_regs: Replace link to license by its full content (2021-0=
3-06 16:19:03 +0100)
>
> ----------------------------------------------------------------
> Renesas patches queue
>
> - MMU prototype cleanups
> - Clarify licenses
> - Fine-grained Kconfig entries for SH-4 devices


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

