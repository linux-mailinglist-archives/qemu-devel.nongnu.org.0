Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789CB3B7142
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 13:18:22 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyBkz-0000DG-5F
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 07:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyBji-0007xe-SP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:17:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyBjg-0005yy-Vr
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:17:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y3so5939814wrq.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=u3rQV+/zGsTEe5YIH1czQA+gTLjA999jtmWTacDfMwo=;
 b=tKh8/GNeKskow2X3mph34ZF2UGr4/hjJMmVPun13BOD2hhgH8NdceKyEUpV7QebkxT
 0OYO7q9gn+bzFenZQzk9bpPigTR8rm3zsx9hyGm0vZGrwI/vVkvRwFNFN2xq3wqGp1A1
 PpZQ072eah13Z/wtQR79PnUBf1bHgjNNukGDGu5AqVzfyqw5ZVkinOR1JOC6KLpcfrGF
 4cs/kq30XSAixWf5HW1JisaTTzhXk6WiRo6d7lMcEMFkkGQoPo3ts5dajgQQ9qt6d26u
 qegDRuxpV1dFqNtoNkMj9RzPeDD+A/EyfIvxgMeiIAe2070XIuVB8nnManoE+TH1P7J6
 oUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=u3rQV+/zGsTEe5YIH1czQA+gTLjA999jtmWTacDfMwo=;
 b=i2JFAIBonN5aWii3ufU6axQA89pvkCIQ8/grMjDAfZwRHyvNLl86MeTHr/ShH1D6IK
 +R0aD09eHTBHnQCWG2/P4FtzV5u3Swb8UbsCsrMtITNOI1I3WSHVhFjglhuF4lVVm75i
 oehryAwtNayW81AXrMMI3NNpETfN6Src5J06Q9YqR5wDyK6d0jgl50X08YnLF1UrFZwT
 eT73UsvPscEi4XQzhn9+qzU+cBaEVUbrR20TzbBHpV4LSq3cUkLwtLrVhEYzJOL7bGjD
 9eyaa9JE7d+bPqA6GR0WRAGpGn+Gq1oL5OxibrMmOMuq6toWRo7Cj9f7UuVXsCwzaGof
 BGMQ==
X-Gm-Message-State: AOAM532zJASfcXwqdeefem/7ge7A/zSB/HXt8FdL5NdSJ+AYfSNDiM9G
 twkbhaOeKOmC5zuiTcwXlxljAw==
X-Google-Smtp-Source: ABdhPJxANFeMfiAQkUTuXipASCZbi+6mAonIQYM29R2sa2Nn+VdjaVmD/vMrf+Ugh65U353dKf6R1A==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr23433394wrz.36.1624965418460; 
 Tue, 29 Jun 2021 04:16:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm2463679wmj.8.2021.06.29.04.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 04:16:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 753FE1FF7E;
 Tue, 29 Jun 2021 12:16:56 +0100 (BST)
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH 01/20] target/loongarch: Add README
Date: Tue, 29 Jun 2021 12:13:12 +0100
In-reply-to: <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
Message-ID: <877dicrkd3.fsf@linaro.org>
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, qemu-devel@nongnu.org,
 alistair.francis@wdc.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Song Gao <gaosong@loongson.cn> writes:

> This patch give an introduction to the LoongArch target.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  MAINTAINERS             |  5 +++++
>  target/loongarch/README | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 target/loongarch/README
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ff56f5..f207805 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -209,6 +209,11 @@ F: disas/hppa.c
>  F: hw/net/*i82596*
>  F: include/hw/net/lasi_82596.h
>=20=20
> +LoongArch TCG CPUS
> +M: Song Gao <gaosong@loongson.cn>
> +S: Maintained
> +F: target/loongarch/
> +
>  M68K TCG CPUs
>  M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
> diff --git a/target/loongarch/README b/target/loongarch/README
> new file mode 100644
> index 0000000..0addfc7
> --- /dev/null
> +++ b/target/loongarch/README
> @@ -0,0 +1,16 @@
> +LoongArch is the general processor architecture of Loongson.
> +
> +The following versions of the LoongArch core are supported
> +    core: 3A5000
> +
> https://github.com/loongson/LoongArch-Documentation/releases/download/Loo=
ngArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf

This part, perhaps slightly expanded is probably better aimed at
docs/system/target-loongarch.rst so it can be included in the generated
manual. Bonus points for something along the lines of
docs/system/arm/versatile.rst where you give a quick breakdown of the
kernel config and an example command line.

> +
> +There are several code directories
> +
> +    1 qemu/target/loongarch
> +        This is the instruction emulation directory
> +    2 qemu/linux-user/loongarch64
> +        Linux-user simulation
> +    3 qemu/hw/loongarch
> +        System simulation
> +    4 qemu/tests/tcg/loongarch
> +        Linux-user test


--=20
Alex Benn=C3=A9e

