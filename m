Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673E310EB1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:31:18 +0100 (CET)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84wu-00044s-Lk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l84NG-0008HM-E6; Fri, 05 Feb 2021 11:54:26 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l84NE-0001D5-8h; Fri, 05 Feb 2021 11:54:26 -0500
Received: by mail-io1-xd2d.google.com with SMTP id e133so7754957iof.8;
 Fri, 05 Feb 2021 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fykdNop3uESec+WCXet06I7Y4Bpbbgk1KcvF6oshlgI=;
 b=pTBJD5C+sl0W1da7UkekTVHjp8oeBka07B6Z8xuwYl7S+q8v+EyEzoSic7ahazvzsn
 QAM0e4JtqDIJYK/sG/J1TBk/UIBn0FkImkxaubW5Q8o1eKIsXfhyMGVHovOtKJqmecE9
 INuY2ya4yusl0k3lQ+qt+YqnVXGWfV8WxpLexttLyjNB4Lmh8RfaSn9bsqsEefFdMJ4Z
 0qlODekX9lwWmuoAM6vZ+mBy5vXxndkILyZvi6a98a7XJjHYyTwiqigWW2Bas5p/myeH
 dFiuoSEjEzdbtJE0doPYn6lPkCBy66KAK15xtlUCYH0sX8VxYhGCsFVmvd9Ql+PbpJ3N
 uf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fykdNop3uESec+WCXet06I7Y4Bpbbgk1KcvF6oshlgI=;
 b=BHUZcTLIvYP+QL/2LCP0Dh1E26lqk9DVCj+V3p/cD7+NipPv4eOitGIBmr41akDuVl
 dQkuw6UumjLzQpNCKJXHuJ/KpU9/nO/Th5bMmRs2YMseCfuYdYpH2eRhgWqkPMgp1jAr
 EYyQKKsZpaPvGnkvjlXNDoeCsg1D0J1eRv6ABwY1a99u0l10jAFEvYXbbV19ncfLMbn6
 UtVhyKDWRuqoB6qRZOnQK4fvLLSjtbxLFYc6ixVwbHvZJCqPMfRCT1ZoHEa63PVwv4kU
 kar769ptSnB9c6xYZA1FvPde6oelnkGrWJj1InQnnOXXh/UMxTtK9clg1DPoZnlTze5K
 Mucw==
X-Gm-Message-State: AOAM533+Y9H9X68eT1Ps7sfrmAnIMshP818ofClIBKy+Uy7tuXgtHo7p
 hCN+jX+symAlNGW7n0jO1+uj31Vj8p9mC/qEwEs=
X-Google-Smtp-Source: ABdhPJzSGc4zbMJzzZFkmvsxOQdfbB/MdXrgf3UEEGjFnh8+pXGqcUQX4pKUO3XJCMcUp8jyNHmRKU67VdNEt4VcVlk=
X-Received: by 2002:a6b:d207:: with SMTP id q7mr4954380iob.42.1612544062116;
 Fri, 05 Feb 2021 08:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-3-f4bug@amsat.org>
In-Reply-To: <20210205144345.2068758-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Feb 2021 08:53:53 -0800
Message-ID: <CAKmqyKOmJB5peo9Xqf3tRW2ATQYmK4JQg-DZpj3Yy12-BnsrVA@mail.gmail.com>
Subject: Re: [PATCH 2/9] tests/qtest: Restrict xlnx-can-test to TCG builds
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Andrew Jones <drjones@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 6:45 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The Xilinx CAN controller test is uses the ZCU102 board which is
> based on a ZynqMP SoC. In the default configuration - used by this
> test - this SoC creates 2 Cortex R5F cores. Such cores are not
> v8A archicture, thus can not be run under KVM. Therefore restrict
> this test to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tests/qtest/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c83bc211b6a..d8ebd5bf98e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -159,10 +159,10 @@
>    (cpu !=3D 'arm' ? ['bios-tables-test'] : []) +                        =
                          \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-swtpm-test'] : []) +  \
> +  (config_all.has_key('CONFIG_TCG') ? ['xlnx-can-test'] : []) +  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> -   'xlnx-can-test',
>     'migration-test']
>
>  qtests_s390x =3D \
> --
> 2.26.2
>
>

