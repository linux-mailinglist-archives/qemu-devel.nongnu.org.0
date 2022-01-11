Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F314D48AF7A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:26:06 +0100 (CET)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7I69-0001wO-PS
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7I1A-0007T1-Om
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:20:56 -0500
Received: from [2a00:1450:4864:20::329] (port=56186
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7I0z-0003hs-5t
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:20:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id c66so11131032wma.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1/Cdp6XNIG4fjxBA8ZsrAdaIRmyhqzHNK+yAST/U8sU=;
 b=aw8GKtMjg0/gQw5ELuT7Xg3mJQ0SagI+93Y7uLgPI2z5AEaG1p2YoxoOHUWCkDAM/O
 xWLwqQIa1LcxSWRzywg3IsvF7Oa9yBQXnnyFwSiecLhJsx0aCAAdf7wdl5WT25SI3FFn
 ZeSHBwo2RFGZCJuAzfJgTxAguuDZ/9M/mmYVy5ZraEstLIRVr4lQMP0iVxEC4RZd2BG7
 FL2yWn8Iji7nB4EYDzt63MUkoxqvIflzxrM9HViB7zL7R/m3lQDjtrHQPj/cLYEfNMAe
 fF/iT/7zo8d4sIvv1PG8kJytbiZu3fd/fT02cPPJtckoqenPKu2Rozj5aL4Uku+CPOvJ
 cEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1/Cdp6XNIG4fjxBA8ZsrAdaIRmyhqzHNK+yAST/U8sU=;
 b=KBcedAp0+mCYhAmnnzqaDK2vtO2TsxW8E1afB/Kb1nZtO1gER6T5BkVs0hcSWnZDsq
 5lfXLfOqZvOKvTZ3PkEC+EdJxeVRu68GT0miOBRxF7X8gr4bJXsxJypI36W76qyOa23F
 5NjQTuxVjzhlwu6NCuQqCCVGjMlwIiH0rith+c0KD1IKOtwr850JxlGWUUd8EYzCd9/P
 qH7zy9gktDtobsYJChYDnxeXU46lXPd2qFGzLRODg//7wiWNKC5aoCrc7pWAj++8PJ9U
 eMiDG4KglY4M9be7+JbY3y2H0AhCXfh3bOGcEEOpC9W4cADIrGMz3llWrjhjfFGrKmLM
 fapQ==
X-Gm-Message-State: AOAM531N13Pny+Wd0iVVeJzAZYDiNW160TyMal6g1qq8GIRyoeLvijJK
 xOvIs4jD8+uhwTyetts5izX5+skljaynALHOjkwDWw==
X-Google-Smtp-Source: ABdhPJz2cGCt25zTFCxPqLhP5jzuvn1Vy5VMP0ktlFbe65xu1kCPpsz0uPBs39ZtIGSb+QdNAdLQevvrlX2XLUwP8RU=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr2665323wmh.133.1641910841739; 
 Tue, 11 Jan 2022 06:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20220108215815.551241-1-f4bug@amsat.org>
In-Reply-To: <20220108215815.551241-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 14:20:30 +0000
Message-ID: <CAFEAcA8J0c+0AzA3ywdTsv=iDVdv7DmVa9pBN6G=qhdjC-igsw@mail.gmail.com>
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Richard,
>
> This is the SD/MMC PR that ought to be sent previously.
>
> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf997=
37:
>
>   Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into =
staging (2022-01-03 09:34:41 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/sdmmc-20220108
>
> for you to fetch changes up to b66f73a0cb312c81470433dfd5275d2824bb89de:
>
>   hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:28 +0100=
)
>
> ----------------------------------------------------------------
> SD/MMC patches queue
>
> - Add SDHC support for SD card SPI-mode (Frank Chang)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

