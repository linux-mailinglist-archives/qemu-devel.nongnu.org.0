Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384B3D66A2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 20:20:27 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m85DF-0004au-KX
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 14:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m85CS-0003rp-Qp
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:19:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m85CR-0000pc-4q
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:19:36 -0400
Received: by mail-ed1-x531.google.com with SMTP id x90so5457474ede.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnJp3aaVaig1Od4w1Z6CYJ2zhBnWuX+rNjauKfjOZoM=;
 b=ijArk/blQGYN3w6D9/zY0fthrTqX1q4Be3vhDLlu5MyysEXOvGWwoVPI/flfLFkqiZ
 hvWk19UtZNh8tj1r8FRgVjyPQz+im8mABhAo8B+qXaUYPrlltOxDMnBNLHO2n7mgYH85
 8hJ4ixOWNFtR5F9nAF/v+9/wMG/YZLqExZodqj4n6/9UMw9vpOBlC0lUNTMvGAnrhP4R
 thbv2xj5EGYL0Vr5InUORjMePagCDk6kg3jLN0sUn9ho7cf3QOPaEJB6tgrl3OuH9Ikg
 a99dM0pszMoFHBbBXL4vunvHrNoCV96aVc8h2qIA0OdYvU1qequfA1YjBcpQUfaJ02By
 3AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnJp3aaVaig1Od4w1Z6CYJ2zhBnWuX+rNjauKfjOZoM=;
 b=WQXzAgx2y/01MdRuAd5EPwcbUTCUgJQmCoi2Gku9qJFdrZQPHI/t7xaB8aoa2tLta7
 j3f6RGzbzpNZ7YySH+1dLvpB/F9/t5AxzdIdoRCO9GoEmQvOMqvGVm12aYDEQou1Otj5
 eS0xEMmJmYSNt+SzzXUsIM94nTQwWs6aVNcdSSjVinnbI6o3ypYIRDzfi2M3W27UAGhM
 UtgxUdz2UyOxYkDXKvPMDf1BbA8gKgCpof1bNJVs2swltkMqXSP79g+XGVeUDmItPckN
 894iOEs9tGKpR5zudctCFTAF+3Av5ZgYK9rMFrdORcOe29un4RiX/P2Y2ecY6xIOrabB
 F5tw==
X-Gm-Message-State: AOAM530+5UxsH5PXaTob5+UxTnKrRJ6Cn2owjT4g/4rn0qI9Eodw40ep
 SXPzI1zwBHur2Ros7M6VaEOLhaAppGEoKGt2fYhhLg==
X-Google-Smtp-Source: ABdhPJy3EK5/NXm3wVNspmJH7d/AEEcchgubbBLbJXiLSVecJMKnfn2ZFQBlmHHtT7fOzm40Inqr+80oIryu+11djjc=
X-Received: by 2002:a50:f615:: with SMTP id c21mr6624625edn.146.1627323573058; 
 Mon, 26 Jul 2021 11:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1627249368-8366-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 19:18:50 +0100
Message-ID: <CAFEAcA83BodA1N63fVQg1bJCGQL4wr8Xv=4RaWg-UBgL=f6xnw@mail.gmail.com>
Subject: Re: [PULL v2 0/2] Hexagon (target/hexagon) remove
 put_user_*/get_user_*
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 25 Jul 2021 at 22:42, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fccf8:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-07-19' into staging (2021-07-19 11:34:08 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210725
>
> for you to fetch changes up to 25fc9b79cd057e394f35d7afc18493becd515797:
>
>   target/hexagon: Drop include of qemu.h (2021-07-21 15:54:02 -0500)
>
> ----------------------------------------------------------------
> The Hexagon target was silently failing the SIGSEGV test because
> the signal handler was not called.
>
> Patch 1/2 fixes the Hexagon target
> Patch 2/2 drops include qemu.h from target/hexagon/op_helper.c
>
> **** Changes in v2 ****
> Drop changes to linux-test.c due to intermittent failures on riscv
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

