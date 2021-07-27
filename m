Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608353D726A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:56:36 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JpD-0003Vs-Eh
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JoR-0002pa-H8
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:55:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JoP-0002lK-S2
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:55:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id u12so14588496eds.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLcLVMFfKV70lAAHWGz2K50FtOOAzFb5ONjrp4/aE9w=;
 b=T8aZxumnSRkn3iFcL8FzVbsXr+sNaUUjOsbD6SPNsVEpn8l8uq437EUbdhXrWMG3pZ
 6Nso+6Tiv4YbL7h4mULTN2q/+4sMIv1icaQgYs+wLJ0GSuzFXGEtVH2qMJN7Cp9EOEkm
 K83iXdE9GEwb8DsbL102RqeU9gJiRRl21d3y7PViRSxmEvqiUraZjNUZwJIdCE8nNlO+
 63RMRA6UutJPWF7V0bq9wGujPcxCH2xwZ/pikM2NfnAzKtmfMp+wnCBkY2tKBgLHZ1+i
 FICTOqSu/a1xQr0ab9fX14GQKkYGnaWF63vKAEIbRjkga3H6jDrw1CTzr6tofdoAi2LC
 ElVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLcLVMFfKV70lAAHWGz2K50FtOOAzFb5ONjrp4/aE9w=;
 b=NKuYA4BOdGSo7Br6zYwP7bXgtdXC1abJD1WKJ6YQqYib5y52bT20njX3Akrh1Aotxq
 ixMc/zu6ix3Dtd+02T9uz/fmedWp71YV5qfGEvZjsfUse5EoRnXqFeeG5KQYL2NT/IIT
 FUlAcDzUEeHd0Ck2Gq6vU8+wBt9HHIpTWjqLHrsbsm6cOlZ4s4NRj9ltqHBgBzG4BlEu
 NRe1imO07kOJrdZ0b+KeuTUU+OZ7B2D8Ywx2Pzqw4TcJVdLSQgSUlxOlp6SUDJzW6SEL
 29MTHxaTqRfXwhcauwbljmHlBm8GszVr6leTslzBmLwROULLokDnfLLowEdZ29ExApv7
 j3/w==
X-Gm-Message-State: AOAM531/+U49e2SN50/Yh1wPpq9Rr7+V0zOMgSrWp3UuGf3H884ROptv
 A8tGnhTyIzrqTdoBvJlf4wwaxs4kwr5ID6D2vdUS8w==
X-Google-Smtp-Source: ABdhPJw1jzhRlVlUtlyqxymnIkU9saWQJtyFiCmX9c94JXRJ4E1L3xOPP4/W41wOzQWZclD3T5NS9SN7eIAiTmajnOQ=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr17119714eds.251.1627379743992; 
 Tue, 27 Jul 2021 02:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:55:01 +0100
Message-ID: <CAFEAcA_5hECqDe=4ak63S9=j7-3hCLxnmZZR0NM_38K9B5==EQ@mail.gmail.com>
Subject: Re: [PULL for-6.1 00/12] tcg and misc patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 34fd92ab4142bde5b54adacd16e6682f4ea83da1:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.1-rc1-230721-1' into staging (2021-07-26 11:00:15 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210726
>
> for you to fetch changes up to 2bf07e788eb69bee843be274386fb20f4ab6b0f6:
>
>   tests/unit: Remove unused variable from test_io (2021-07-26 07:07:28 -1000)
>
> ----------------------------------------------------------------
> Fix icount accounting.
> Replace bitrev8 with revbit8.
> Fixes for set but not used warnings.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

