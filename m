Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A5310E75
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:19:47 +0100 (CET)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84lm-00015D-Mj
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Q2-0002j2-7c
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:57:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Pz-0002Vy-Ns
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:57:17 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so13037505ejc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VB5Kf98FpP8ZF5XUrekMLVMmf43dYnX6DKjfwXpRkfI=;
 b=cHOaNBSywnZnFhfO5zcf7ogY3PjdP3o3aHtREI7SUzgE10FBLElUuYAi5u7+6S3eSe
 eIjdP1ZYcOof/oL2aKirXYQAzEOgk1SgNRoLHDR6kTlXOJteAzmPEIIms/CmKdJ+9FSX
 BrNsyBNQ/0EnCiFnv0cDFH45SAAowiQ1IHluqBYdxpk1VhfafbtSomq1IK2mz5NU2Uex
 kK9UtNaWl5YJldO1FdJnLKUFgcGJnwtRMlsEsHLAuFb/S2XhwaBfDlCeJy0NnXOB3qnB
 0aRc/VDoafuS2Sv9qRaRTWMNzDE0B+RGTyUvd2BgL985nBrIFMxN84z17CTe59H5lxvO
 hOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VB5Kf98FpP8ZF5XUrekMLVMmf43dYnX6DKjfwXpRkfI=;
 b=W0Gd8a8EsjjD64O5xtLDXYCl2oTzF9SC5WnfYGZcJcRj30+ya8vc6FbJMCOawBTmjY
 5T+Auf/E5Ze9TRdbJZ6duOotlNtxhm+q6sdjI9iEU++a9BMmgn+BoxGI7r5RZ1Y2ZeI1
 rS3EeVuE1waGw9ahpXBolxtPXRSusKbxzI4jQlAcKSBITn7OHp3JZO8dVGjuhHANKliC
 mpHyj9wy21KFnJANDQValxz3h29FAcBxXwWpH2NmseA2UtZwMG0LSH65Uah+PGzRcaMb
 Ek1RLPxjOyDiOjhj0VpgV5tPGkBK78TuZGf8t1OEhbinCZMzQKSVmkUKLqKOcvBCMg0w
 cCLQ==
X-Gm-Message-State: AOAM531Y+3BMSQsr7MeavNpjk7BaQfMRmQpmJF7E9witYjwX61DZIo9n
 brYEXuk7PKYJ0m9WNvLacXJL2UjSn7aC9Lp0k/NSSA==
X-Google-Smtp-Source: ABdhPJxCewhp/jGPn+etEicbjEX7rHSml4SlTg1sdUjUWJVdlFGYRECDJUUIa+m+oAQ6ykQsrMhBJ8xVHCXZ18liCTs=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr4926020ejc.482.1612544234074; 
 Fri, 05 Feb 2021 08:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-3-f4bug@amsat.org>
In-Reply-To: <20210205144345.2068758-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 16:57:03 +0000
Message-ID: <CAFEAcA99NTiq+a7ZLiVVEbvpe0mgOcmrKrQLTHZeQ9ndNLOb8A@mail.gmail.com>
Subject: Re: [PATCH 2/9] tests/qtest: Restrict xlnx-can-test to TCG builds
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Qemu-block <qemu-block@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Andrew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 14:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The Xilinx CAN controller test is uses the ZCU102 board which is
> based on a ZynqMP SoC. In the default configuration - used by this
> test - this SoC creates 2 Cortex R5F cores. Such cores are not
> v8A archicture, thus can not be run under KVM. Therefore restrict
> this test to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

The implementation in hw/net/can/meson.build is conditioned on
CONFIG_XLNX_ZYNQMP -- does it work to use that here too?

thanks
-- PMM

