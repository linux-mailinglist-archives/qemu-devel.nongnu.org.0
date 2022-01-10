Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037FD489D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:15:42 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xKe-0002hg-K4
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x6x-0007zI-SO
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:01:32 -0500
Received: from [2a00:1450:4864:20::42f] (port=41716
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x6u-00053H-IJ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:01:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v6so27580499wra.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3YnuFyhPFkkdGgbfwuGiPNauvQt8hzGFlTv0Zezckg=;
 b=d5SiLA1rq76xtMDbKECakz8Rj/dKaOlD8r03OGbCUe2JwXj2I+TlH9Va0BN7YxtL7P
 yRZ7Ocki3HHURJ4bvqPmDn1PV+NrMUTZsfJuwVlF9eY/B4nfV/vQ6jJP5NyZFoy7OS9X
 cyLNTJw4eP7xY0juqTHG3wCgd0NpuauxKGHDCpOSr8pB4uTulnX0ZMWa8dx4H5ERjzP/
 440ySFrUKU2m0lgWM/b/PYvD7B3z3FWX9tSi/xGrADi2jAVAUN0xiIDtR9ToJdcBE/kB
 8za7zRObs+OGspI4jDjKObQi7bgeibBbwmtqJ3iU8kYmXkqkpQW+7QKlaC1qLHmAvG6W
 0lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3YnuFyhPFkkdGgbfwuGiPNauvQt8hzGFlTv0Zezckg=;
 b=N3QUGp/1Z0AJtox6m4ClSJVb3/HGMnPArrF0w7uiAgzj2JxDKpYFHu9z5q3Dci4xe3
 RQUsca72AlvlCZDF9o/L5LNkNNrCTA0wbY/BPbu9Alw5VphrcuS0CDfa3/UIzsJGAlWm
 s2ffn2X1xcycGxHivYaTqtz/wfHt+6NLcJTIIFmH4uK6m0eNXeR9g6dDxqHgG1Fq7I/N
 u3EfgrxXfxtYb8dAiconc1eaUV1IBGMyX4Ea+wdNBYK3lI3qM/DoYYtNXnqWwIUp/JmD
 SSZAbT+ljSejga4leDdaEHlopg80+p3ZDg8iSYcNh1FQ1tXlRLQ899P+gkUuUnHz9MEE
 Tyeg==
X-Gm-Message-State: AOAM5313di7jQFK9xKG541Nl7Z9OusfUFAb0ssfy5yDAnTcq8Nyf7Zxi
 AuuKbDjbDyWPPUBYwzBtwFCrJrgctxnAhNjRCpf//Q==
X-Google-Smtp-Source: ABdhPJzM2GU1F0ElR0ZXNO3S0ZdcCMaKLwnuLnsMXswB3oLvAZ1bIGn8kG7hvy6ojEiMNxK2xvBMmXIzFvr6OOK/vpY=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr223276wri.295.1641830421763;
 Mon, 10 Jan 2022 08:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20220109114149.1275322-1-laurent@vivier.eu>
In-Reply-To: <20220109114149.1275322-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 16:00:10 +0000
Message-ID: <CAFEAcA_EDpqs2PDZwWyjSGs22xFx0X_K=jOxh5w=toHeV7piUg@mail.gmail.com>
Subject: Re: [PULL 0/4] M68k for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 11:44, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:
>
>   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-7.0-pull-request
>
> for you to fetch changes up to 31144eb6393b66b06a13e8a6ad0e730f9e82d4c6:
>
>   target/m68k: don't word align SP in stack frame if M68K_FEATURE_UNALIGNED_DATA feature enabled (2022-01-09 12:05:02 +0100)
>
> ----------------------------------------------------------------
> M68k pull request 20220109
>
> Add virt compat machine type for 7.0
> fix q800 -bios parameter
> fix VRAM refresh
> fix M68K_FEATURE_UNALIGNED_DATA feature
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

