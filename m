Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FD2EBD1C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:24:02 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx6v3-0000pf-PA
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kx6tN-00006F-Dy
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:22:17 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kx6tK-0006gI-Sm
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:22:16 -0500
Received: by mail-ej1-x630.google.com with SMTP id w1so4452735ejf.11
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 03:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZGtbaTHB7ws4w1nnf5jGISRowGIq34RYWd0ncbq03l0=;
 b=lxQGv+sSFvaLtpBCwlFQPpm+ACI9DvbtqYaasj75pc2p4k1sztfCfiuN9hYXgXQRZ9
 KueJam0kL5nTcTIQhiX1dST6zEaQpcNKlI0xZ//9ud7obixue+l/ACx1XszzG8rsYdLU
 +107LL+sQ7fDJj2mBxeOUwzkjQMsW53vgb6tIJXyDqv8u7ve8HYeJcCbpIh5iV7t2Fy2
 0N6YvYOAowx/pheybUOqQtXvJnLOZdnysOep5VDRx/f4mvLy6MzI4CwvubeyIemzv7lH
 wMf6aN4TiaF3MPdk3i7LxYUndZbN/85OMqLUjz/pMoMudKiWIwCJxaTHx/Zlcx6+ewjy
 GRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZGtbaTHB7ws4w1nnf5jGISRowGIq34RYWd0ncbq03l0=;
 b=dAQkKNlq5Z0IHQ2zpkDJYFC/D6zoacAKlEFcgOmOrVN9G0V0JUO6gqLrjB6osTPA1G
 Jx9VHPYjp/jZy3/ufVdzjFCtE9FTBT4mMqIcKjQ9LMqsYs/oASqdT4HSk/lIuYDWEa4f
 HOSCkOd2pjXLWGDfT6lt7T0O5/jM9Jq9UR9oCpKQ1Fr36t7QA2soTg99mSONthpcuwLB
 FWC8B7pa76kE58xPV0e06oN6I8Mkfqyhc950/iJzzDolNNZgJ7Ie6AINpuT4IKn78JDh
 HcJIuiZhy+XN7dMouoLSvOM5xP912Kc3VwUbLNExrVw2v52HR1YLf0v/yXe0q5pQfwIw
 UquA==
X-Gm-Message-State: AOAM532qtzfnKjnVUn1khCHbMOm271ygC9f09wvQIQIwWVpRGaxA0mo+
 W64OaLqid4d66Qkz/TIh6+g3D9HgsI3vwYZHG3QSPQ==
X-Google-Smtp-Source: ABdhPJxm0d2Mi1CIzDX37mEUUAVfb6M4bZY1RT2j0gp3dD/MG4oH7vU5fVH4sMDpqpnTlev8cX27va518yqyvPAbSUI=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr2629238eja.250.1609932132830; 
 Wed, 06 Jan 2021 03:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20210105094109.3303949-1-f4bug@amsat.org>
In-Reply-To: <20210105094109.3303949-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jan 2021 11:22:01 +0000
Message-ID: <CAFEAcA-sbGBfXNrbV4VTWAF=e6ioFb9HYbviSxeQOeNtJ0YHkg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQVUxMIHYyIDAwLzM1XSBNSVBTIHBhdGNoZXMgZm9yIDIwMjEtMDEtMDTigIs=?=
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 at 09:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit e551455f1e7a3d7eee9e11e2903e4050bc5511=
ae:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2021-01-04 15:02:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/mips-20210104
>
> for you to fetch changes up to 457027298749333047bf81a856ce95ea5f9dccd9:
>
>   tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-04 23:=
36:03 +0100)
>
> Since v1:
> - Fixed memory leak reported by Peter
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Use PCI macros (Philippe Mathieu-Daud=C3=A9)
> - Clean up VT82C686B south bridge (BALATON Zoltan)
> - Introduce clock_ticks_to_ns() (Peter Maydell)
> - Add Loongson-3 machine (Huacai Chen)
> - Make addresses used by bootloader unsigned (Jiaxun Yang)
> - Clean fuloong2e PROM environment (Jiaxun Yang)
> - Add integration test of fuloong2e booting Linux (Jiaxun Yang)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

