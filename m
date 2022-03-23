Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE7B4E5817
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:06:42 +0100 (CET)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5NZ-00030G-HJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:06:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5MF-000266-Fs
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:05:19 -0400
Received: from [2607:f8b0:4864:20::b36] (port=40462
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5MC-0006Gd-CJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:05:17 -0400
Received: by mail-yb1-xb36.google.com with SMTP id z8so4154836ybh.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CPCM3P9mf8AUMWOItVa/QVg0u3tR787OIz3GBhHpk8g=;
 b=YKqvT0mCwy2GC16n2UnKOCDQDXb+dW0nMH3421+/YETjZLW4sBGDACRK82V/7GEmZj
 LhcHL/FjZVk2h7tlOV4ujqZEE4PeY1bO0tBJHqNErvRA8R7CMmDEZkbAr0kN5vonq3TT
 wUEuPPZqEbNsQ0xJZPDiRmFvxUZu0sJqC0fQTouw2aSspVDurqSJj2sEWGgiU2ZTvtj4
 ZzFJJShnifhwK6/lDH+9aL8hyVm6uX3qnhh6XruRYOJUTCpjY27JzdZcgFzPXv/CojOa
 pvx1yxgNqDnYvLH8/OtF/iNRdMUL23t64C21wlxwj9peM+btdbWgbGgTPqLRuSBj5nGI
 NIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CPCM3P9mf8AUMWOItVa/QVg0u3tR787OIz3GBhHpk8g=;
 b=OmG1/iTqBDodVyM/eK1M0hxJXmvK7rI2tyZeHdSd459V7IuZG4DGs3DxQQdUeHhCvN
 uVCEP8KzKMtbltstzSEtH5HG18bld1mWawl+Sf1uFf2VuNaMpRcvq5AM1uJd4D9mlWcF
 dTSGavw0tBEIhIbeCIM3MKeh9yHQl1f+NBkvXTcS6wMvDNb3IWavPvZsRLds2LDvoe8t
 fQpbiTxdXq48+RfNg2Otzssf/UB3N7jfVGg7SMEC5okoD4cKvgztJuHt8b7N1PABIsgm
 sxLyV9Nx1jEkeW7seMrXkWqKG/11lpenpTUBbdXYs4xKDEwnnwY5llcdgs15f58+JiX9
 7dzg==
X-Gm-Message-State: AOAM530VF0YmbKyQLqUXer7faJ2JvHJJcr+vZW37gOvC47GfcgjsYR3W
 MXNtWiJbSK5Fjrkm1ilIrZT93X3ULQvk7kfQUu6JsQ==
X-Google-Smtp-Source: ABdhPJzmY3r6LCJ14HYFmXlXde7wdfebh5x04lN5PkN0pIHrLa0761Ep9sNEZwgaUF3lPZS92eeHzaHwYEQwW1cpKiw=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr535769ybc.39.1648058714778; Wed, 23 Mar
 2022 11:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220323112711.440376-1-alex.bennee@linaro.org>
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:05:01 +0000
Message-ID: <CAFEAcA-Eua8V0L1bKRf1C5F7-cVyfcJ+EEnidaj90L+E86FHJg@mail.gmail.com>
Subject: Re: [PULL for 7.0 0/8] i386, docs, gitlab fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb3=
0b:
>
>   Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.0-230322-1
>
> for you to fetch changes up to 0f37cf2f71f764c5649e149c774172df7ab187c7:
>
>   docs/tcg-plugins: document QEMU_PLUGIN behaviour (2022-03-23 10:38:09 +=
0000)
>
> ----------------------------------------------------------------
> Various fixes for 7.0
>
>   - make clean also cleans tcg tests
>   - fix rounding error in i386 fildl[l]
>   - more clean-ups to gitdm/mailmap metadata
>   - apply some organisation to docs/devel
>   - clean-up semihosting argv handling
>   - add custom runner for aarch32
>   - remove old qemu_logo.pdf
>   - document QEMU_PLUGIN env var
>
> ----------------------------------------------------------------

Is there anything in here that would affect s390 host? The
s390 job seems to be consistently timing out, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/2241445160
but I have a feeling this is a pre-existing intermittent
hang on that host...

-- PMM

