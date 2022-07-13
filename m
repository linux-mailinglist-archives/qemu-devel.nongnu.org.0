Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E36572DE5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:09:50 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVZF-00082f-Gv
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBVW3-0006Ck-OB
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:06:31 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBVW2-0006xH-6u
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:06:31 -0400
Received: by mail-il1-f173.google.com with SMTP id a20so6127465ilk.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 23:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=om5RNXH5JqzgpEyovefGk4SCErY51/CzrVnN7YgJMeg=;
 b=mA88VMJk5er+C/fbesSXSOmYFy0XUUvCKKpWjtMtiSU3NaxPM+OKnIv9UZuLOTnHm9
 0NFADdYRsvlc5L/5nGYTxTztIwO1hxOhPGQqzphBe4ie8tY1j1iymd1DFGKDbbN8WDjH
 W18o/A2blrgK9lfF6xmdGhM142zvi+ybXkHQRiqSoFIbF2VRhtwT3GChjtkdzLZDunTv
 cnCn83/DvNtfF2hDIq7ti6ljceGs7PK6Wf+t6uHpOxmygTM5EpPw2xpT/9Q+qI2qvEg0
 6ELRxVCCHGbUZz53Q8zkjkDdlpApYwaEMxlR4I37Vp9ZD87wH0QwAeY5kMVSChE9KYsh
 lJXA==
X-Gm-Message-State: AJIora/VQGzfCcTrGH76HlDxKCiyDjOVPCNsrVCARiL90CfonImBbwCg
 teSd9kRme21uhoFkU++c/JbRpfoLOQRec6utOlAiqRwSf1aB/EC2
X-Google-Smtp-Source: AGRyM1sP/BZHV7qiCQ7QweM6/H3CN377cEGzfhVPPfKgAOHPENQLd0L/l4V+OM+MVTSDkaWvOADKSRNgMHBsyLC0x4g=
X-Received: by 2002:a05:6e02:1c2a:b0:2dc:621e:df15 with SMTP id
 m10-20020a056e021c2a00b002dc621edf15mr995227ilh.151.1657692389084; Tue, 12
 Jul 2022 23:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220713020258.601424-1-gaosong@loongson.cn>
In-Reply-To: <20220713020258.601424-1-gaosong@loongson.cn>
Date: Wed, 13 Jul 2022 08:06:17 +0200
Message-ID: <CAAdtpL6QuMjXecztCELWJbgW_AfUXK+h6Zu7-0Kc8jbFJTP=Bw@mail.gmail.com>
Subject: Re: [PATCH] qtest/machine-none: Add LoongArch support
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, yangxiaojuan@loongson.cn, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.173;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-il1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Wed, Jul 13, 2022 at 4:05 AM Song Gao <gaosong@loongson.cn> wrote:
>
> Update the cpu_maps[] to support the LoongArch target.
>

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  tests/qtest/machine-none-test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-t=
est.c
> index d0f8cd9902..f92fab479f 100644
> --- a/tests/qtest/machine-none-test.c
> +++ b/tests/qtest/machine-none-test.c
> @@ -54,6 +54,7 @@ static struct arch2cpu cpus_map[] =3D {
>      { "riscv64", "rv64" },
>      { "riscv32", "rv32" },
>      { "rx", "rx62n" },
> +    { "loongarch64", "la464"},
>  };
>
>  static const char *get_cpu_model_by_arch(const char *arch)
> --
> 2.31.1
>
>

