Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB95544CF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:19:09 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wVv-0002Bo-BZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3wSp-00007z-Bf
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:15:55 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3wSn-0007If-QP
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:15:55 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3177f4ce3e2so132742737b3.5
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uQ5zfGdTrFOhNfJvVxotBgvgnn4dUizGnle0mdPdDKM=;
 b=AUShKS8Vffi5TgNGJNJdG6C8RBqOssb7wIONqKZjZezMuKpdkG6UsvY+a+rmgdiPqS
 LWcH/k5uASeqELEmNg/bocxPZ491bBWsgtQz/p2HfyEqMc17seHu0S8Vr1b9OYedcfM5
 uETXhLPLcG4aVfLSFWB7ievhDLXKYGYyHAC0xT4mGIBAtreb+LnepIqEWJaFB1wBImcS
 /LPSNvLoJKXXaSjhxPyeg2Z4MLup4eSUGBYLFWQSkdVgig1rtBNoC0+w4yxxUNL1+G5N
 9DT2lsyAdegrkqJo4wx4kekyic8ck8D/OoQyHgKrz2pHvgu0n0Y7RIMZ/ubyBAcd+XQ7
 tLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uQ5zfGdTrFOhNfJvVxotBgvgnn4dUizGnle0mdPdDKM=;
 b=CCjbpCCSbteRN+GeJvdNHrzbmF2QktMu+EdO3TSU0KuBpgDOiePLea4W/3iH5Sow/C
 eZWD2se4MzlN17h8Yj+RQj2BWMaD0w1nWMcHnomApEAA6oiM706Q8Thz6QnTUhjGOTDr
 HbKeiA+6V3PgUmmYInVsefmsHYvygkdF1SuILlU6usryLRa8fgcp+m2LJuZozYjw+DSB
 re1v2AwsgGU6f933vpDIwM1HUj3klnZrrr4MaoUnp2UAXYvOXnu71s/D6SLOirqaJf8C
 gXCbiyibXAP3qq705H35HdqP7g5AD5lXAdkF0DdvEwTDBd0DuEcB/FscOWVaAbKvDgdp
 QSxQ==
X-Gm-Message-State: AJIora+GtDgrhXweyq2nfzSPmfu+lt5bvHTQquKtpQku+GbvnzQamJ/R
 02Br1pc7Kzjkovmv/RztH2jv76CtMDnBut4XlqIEjQ==
X-Google-Smtp-Source: AGRyM1ttM6DcGzM8cYlZhAZnbMumZnOGO9GifogVnn8UE2U2yYbprkuCqErB9qFMfhpC/L5Lj4dOS/powWtmP0F0tmo=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr2930083ywf.455.1655889352515; Wed, 22
 Jun 2022 02:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <dbf7e57b-a57e-8ed8-67b9-6d43c534a317@linaro.org>
 <87tu8dqod9.fsf@linaro.org>
In-Reply-To: <87tu8dqod9.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2022 10:15:15 +0100
Message-ID: <CAFEAcA83oO8-Dc=RXzFfdFwQZZrh3Mjf-+eqGbQ_Pv0dbhXSyw@mail.gmail.com>
Subject: Re: [RESOLVED] aarch64 edk2 + linux kernel crash with gicv4
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Machado <luis.machado@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Wed, 22 Jun 2022 at 06:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Richard Henderson <richard.henderson@linaro.org> writes:
> > The symptom is an early-ish crash booting the linux kernel -- without
> > earlycon there is no output at all.  Reproducing it requires both
> > -bios QEMU_EFI.fd and -kernel Image.gz. Using only one of the two
> > options works.
>
> What should the combination of the two options mean? Usually the
> firmware loads the kernel and -kernel is a shortcut hack to avoid the
> firmware setup. If you specify both does the firmware still run but
> somehow find the kernel mapped in memory?

It's like x86 -- it means "load the BIOS image, and provide the
kernel/initrd via the fw_cfg device, so that a QEMU-aware BIOS
can read the supplied kernel/initrd from fw_cfg and boot them".

thanks
-- PMM

