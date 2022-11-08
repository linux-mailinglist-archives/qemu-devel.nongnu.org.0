Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C95621462
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osP8N-0005oT-0B; Tue, 08 Nov 2022 08:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osP8K-0005oJ-HU
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:59:20 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osP8J-0002Vx-0i
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:59:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so13408974pjd.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrBStef6avJLWkxC356sccLV4pepY5F2vco86+v9j+4=;
 b=hFTQicWcxB3NmbDFRlWsj3IyJg8KJHDUZAwzIIPV6ZhqpoiJXloo1ppi4Lw6vVsnSF
 JHGb6vCGGz1eMzRTG1jgKL3TT43ZlA4jb4GFpDCbVGg+Sl1r7g0V9yl5LgFyTGX8z0ce
 iUyUbhUlE1NxLrMd5HDS446Aw4uIng3eOticP5jWWc1KFrNfj+N/j1La3xh0k5m9WwXE
 azBHwWjU/Z72LO5zknMRX4iPodPdx0sSR4Ex4WzmvDkh5/tnVt/2axFe6DDTvI9eGDqM
 elxQ+9Iq0I51PlxLaNGJRJrD/MdS/Fgidki9z3MVshKGz3ZakEjEC81nWYRxYDlRWiou
 fh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrBStef6avJLWkxC356sccLV4pepY5F2vco86+v9j+4=;
 b=V1CVDKMQpeKdVk0sPGLSxVdZ9heADsXBCLBERYyj1X/bE2A7vc2N6/0vBxncYeEajF
 vS7zc48EgG7VbDG3/taEBlvPpYiMqktaWipeG9kXDwq6fw+906R93QcY7HnztbK5DzdO
 MOB02JhRR5rswMo+dPuMT07Kzr7EPNVFEgkTEtK7ohkwiikqC7r/vpj/sATIJDFgJzDf
 MgfF+/iottyyXGlR9wkvm9i6BTiOFe3dCSnpXc7K0MtJygQGl9tuural2wrg/YwTdgjF
 mRRGf0pkJqGBpEc+GNMz+GU46REIhHlSelmO3TsUVEftRkiG2hMVkZEw+2ZPYUmqdM4l
 9ffQ==
X-Gm-Message-State: ACrzQf1ktLn0G0on9g5euaTfGbu6QkgOvZ8ujfXZy5q2YJPoqtxE42CD
 6hpQep7QosKWeEp6bSX/bZy/v1Z01qfcMM7RY0KFww==
X-Google-Smtp-Source: AMsMyM4dUEkkiO1Qj6bkj4S1qThhWrwxOjMdCLPibxwqrIIJ9DCy0AakzwfEsHCocuh7LOrJcjQ82FyEDFqTaOYbeKQ=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr56112690plb.60.1667915956455; Tue, 08
 Nov 2022 05:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20221030222841.42377-1-philmd@linaro.org>
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 13:59:05 +0000
Message-ID: <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Paul Burton <paulburton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Oct 2022 at 22:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534=
ad:
>
>   Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qe=
mu into staging (2022-10-26 10:53:49 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20221030
>
> for you to fetch changes up to 487099aee951e4966936acd3e9afd24c69de85ea:
>
>   hw/mips/malta: Use bootloader helper to set BAR registers (2022-10-30 2=
3:08:10 +0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Convert nanoMIPS disassembler from C++ to C (Milica Lazarevic)

Was this the last use of C++ in the tree, or am I forgetting
some other part that still needs the C++ compiler?

If it is the last thing, we should put in the "Build Dependencies"
part of the release notes that a C++ compiler is no longer required
and mention that the configure options to specify it will go away in
a future release.

thanks
-- PMM

