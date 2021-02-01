Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A630A722
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:05:52 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Xxn-0000Ui-Ix
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xvr-0008FB-Bh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:03:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xvm-0000Gu-JE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:03:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so16288943wro.12
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JbijrrjIsxI0FtBLQgt/HqlzrHVAIYuje4lGh0ee/Kc=;
 b=UWHb1SnqiFGfltFRxyQgi9NB8OLETu/GZSa3DXM5djsuxl+L0aNyXW4I7DqedRzpV4
 YdJLgh+PVi6qQv6JiXtAiD23FbVAiGPfM2t8Wdl+4d8Y3A90yjFdVqErlZNsMcizyTHn
 XsyaFrcf8WvzlcxEalyynpHrRKEa0ol20ulceUZFPov2VpM19f1oLoe9pZ9Mc0O8pXiy
 uC3lGTqffnDWTXQSYgW7jj7O+ru5qDZOLMt1isJygo3+9vbOHcx3p5nu3xsThmM7IX6e
 au4sFy4+kOWzlbYvFO/ty38/NfKYJlQZRFuw4vAhe+lY2Dwi7vW6Jw60jYZwddzIgLsf
 ubXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JbijrrjIsxI0FtBLQgt/HqlzrHVAIYuje4lGh0ee/Kc=;
 b=o06rXUo+J9qSi/vcYLlbIsvpOmeRvqYG1o0vZcU5aBoywCsAcSAwK2jG7h/GCK1e8t
 akdag3Mzy/ZGGrSxX+H+fh4VVC+LG+4qFsqY/6P6ddEOc6WPvYz742uHHvr1cGizzK0+
 q5htATVUNs4S0A+APxfK+mVl9XPSFHd3x0fHGNARcc8omKrDb8ecCZcgfQmApAWp0FXP
 LWCuDvdN63J4NGB/VC902CEJot/qAwGAiEIq2o57jI5Rn/uHr9NTUXViEX1wOXSjTap1
 hGsWEBVJOdWO5+5Y+9KB0yleA0pAwVUHmrCHdGX8FJeY3ApN4l4uwI9hPxSDGwOGbxnC
 nRkg==
X-Gm-Message-State: AOAM530LXWDZHhfduOL++36nYAb58sQ5N8PSErzj8ejjY8/JeWyqANLF
 Lb5g+pmW2CfXzYMNWLNkim2wiA==
X-Google-Smtp-Source: ABdhPJyumFm6pBoV739J+Ph1BdCAmVgW59aXbQlxnONm8CV8by3BLTZkIpgNdrgAtQ/hu26vUbTkXQ==
X-Received: by 2002:adf:e610:: with SMTP id p16mr17600871wrm.169.1612181023529; 
 Mon, 01 Feb 2021 04:03:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm20398490wmc.15.2021.02.01.04.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:03:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 718201FF7E;
 Mon,  1 Feb 2021 12:03:41 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-11-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 10/10] target: Move SEMIHOSTING feature to target Kconfig
Date: Mon, 01 Feb 2021 11:56:08 +0000
In-reply-to: <20210131111316.232778-11-f4bug@amsat.org>
Message-ID: <8735ygvvtu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> SEMIHOSTING is an architecture feature, move its declaration to
> each target/ARCH/.

I'm going to punt on this one and leave it to the arch maintainers to
opine because AIUI in a lot of cases semihosting is more of a "useful
hack" than something mandated by the architecture.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/devices/lm32-softmmu.mak        | 2 --
>  default-configs/devices/m68k-softmmu.mak        | 2 --
>  default-configs/devices/mips-softmmu-common.mak | 3 ---
>  default-configs/devices/nios2-softmmu.mak       | 2 --
>  default-configs/devices/unicore32-softmmu.mak   | 1 -
>  default-configs/devices/xtensa-softmmu.mak      | 2 --
>  target/lm32/Kconfig                             | 1 +
>  target/m68k/Kconfig                             | 1 +
>  target/mips/Kconfig                             | 1 +
>  target/nios2/Kconfig                            | 1 +
>  target/unicore32/Kconfig                        | 1 +
>  target/xtensa/Kconfig                           | 1 +
>  12 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/d=
evices/lm32-softmmu.mak
> index 1bce3f6e8b6..1f69795b749 100644
> --- a/default-configs/devices/lm32-softmmu.mak
> +++ b/default-configs/devices/lm32-softmmu.mak
> @@ -4,8 +4,6 @@
>  #
>  #CONFIG_MILKYMIST_TMU2=3Dn        # disabling it actually causes compile=
-time failures
>=20=20
> -CONFIG_SEMIHOSTING=3Dy
> -
>  # Boards:
>  #
>  CONFIG_LM32_EVR=3Dy
> diff --git a/default-configs/devices/m68k-softmmu.mak b/default-configs/d=
evices/m68k-softmmu.mak
> index 6629fd2aa33..4fef4bd731d 100644
> --- a/default-configs/devices/m68k-softmmu.mak
> +++ b/default-configs/devices/m68k-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for m68k-softmmu
>=20=20
> -CONFIG_SEMIHOSTING=3Dy
> -
>  # Boards:
>  #
>  CONFIG_AN5206=3Dy
> diff --git a/default-configs/devices/mips-softmmu-common.mak b/default-co=
nfigs/devices/mips-softmmu-common.mak
> index ea78fe72759..af652ec7bdd 100644
> --- a/default-configs/devices/mips-softmmu-common.mak
> +++ b/default-configs/devices/mips-softmmu-common.mak
> @@ -1,8 +1,5 @@
>  # Common mips*-softmmu CONFIG defines
>=20=20
> -# CONFIG_SEMIHOSTING is always required on this architecture
> -CONFIG_SEMIHOSTING=3Dy
> -
>  CONFIG_ISA_BUS=3Dy
>  CONFIG_PCI=3Dy
>  CONFIG_PCI_DEVICES=3Dy
> diff --git a/default-configs/devices/nios2-softmmu.mak b/default-configs/=
devices/nios2-softmmu.mak
> index 1bc4082ea99..e130d024e62 100644
> --- a/default-configs/devices/nios2-softmmu.mak
> +++ b/default-configs/devices/nios2-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for nios2-softmmu
>=20=20
> -CONFIG_SEMIHOSTING=3Dy
> -
>  # Boards:
>  #
>  CONFIG_NIOS2_10M50=3Dy
> diff --git a/default-configs/devices/unicore32-softmmu.mak b/default-conf=
igs/devices/unicore32-softmmu.mak
> index 899288e3d71..0bfce48c6da 100644
> --- a/default-configs/devices/unicore32-softmmu.mak
> +++ b/default-configs/devices/unicore32-softmmu.mak
> @@ -3,4 +3,3 @@
>  # Boards:
>  #
>  CONFIG_PUV3=3Dy
> -CONFIG_SEMIHOSTING=3Dy
> diff --git a/default-configs/devices/xtensa-softmmu.mak b/default-configs=
/devices/xtensa-softmmu.mak
> index 4fe1bf00c94..49e4c9da88c 100644
> --- a/default-configs/devices/xtensa-softmmu.mak
> +++ b/default-configs/devices/xtensa-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for Xtensa
>=20=20
> -CONFIG_SEMIHOSTING=3Dy
> -
>  # Boards:
>  #
>  CONFIG_XTENSA_SIM=3Dy
> diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
> index 09de5b703a3..286710fd47b 100644
> --- a/target/lm32/Kconfig
> +++ b/target/lm32/Kconfig
> @@ -1,2 +1,3 @@
>  config LM32
>      bool
> +    select SEMIHOSTING
> diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
> index 23debad519a..9eae71486ff 100644
> --- a/target/m68k/Kconfig
> +++ b/target/m68k/Kconfig
> @@ -1,2 +1,3 @@
>  config M68K
>      bool
> +    select SEMIHOSTING
> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
> index 6adf1453548..eb19c94c7d4 100644
> --- a/target/mips/Kconfig
> +++ b/target/mips/Kconfig
> @@ -1,5 +1,6 @@
>  config MIPS
>      bool
> +    select SEMIHOSTING
>=20=20
>  config MIPS64
>      bool
> diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
> index 1529ab8950d..c65550c861a 100644
> --- a/target/nios2/Kconfig
> +++ b/target/nios2/Kconfig
> @@ -1,2 +1,3 @@
>  config NIOS2
>      bool
> +    select SEMIHOSTING
> diff --git a/target/unicore32/Kconfig b/target/unicore32/Kconfig
> index 62c9d10b38f..c699d5238ea 100644
> --- a/target/unicore32/Kconfig
> +++ b/target/unicore32/Kconfig
> @@ -1,2 +1,3 @@
>  config UNICORE32
>      bool
> +    select SEMIHOSTING
> diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
> index a3c8dc7f6d7..5e46049262d 100644
> --- a/target/xtensa/Kconfig
> +++ b/target/xtensa/Kconfig
> @@ -1,2 +1,3 @@
>  config XTENSA
>      bool
> +    select SEMIHOSTING


--=20
Alex Benn=C3=A9e

