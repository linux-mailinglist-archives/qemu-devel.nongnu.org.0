Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA383341970
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:04:42 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBzm-0003Fn-0e
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNByK-0002mz-Tv
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:03:12 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNByI-0002Jl-78
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:03:12 -0400
Received: by mail-ej1-x631.google.com with SMTP id hq27so8718945ejc.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rYN32JnTg+8oresjd1OmiXJFw2Per28SxLFKm7Xyntk=;
 b=DDklLqTTluiqASnfkgW8s7A/ODlC1Y7U1GbJYUsjGQQI6BeKjMUhtD0N8BVNTPTfOu
 /mbLvAR5u+bIvx5dsgsam8dUYyWJadHiqbWYnwJlaCce5x5MCn4IuyAnMj3rDvxDnfoR
 oN6Z40CxIg81gAtB3ea9d3E/DoV4qxwqhocbW7JWihSvsE+VJctrdBe6KcdmcIbqBb1j
 lTty9rebfptk3Va9l+Bn0vhsxwdavG92jm3GcK4WRyBNR9TV11Ti4mQBmkYDnzGxXpJR
 jY7DtFrb1BvwIpmI14XV669NcEjfdZP8uOzF0vP/EBnOWj0CW9v0JagVEZtbu1TeXdfG
 cGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rYN32JnTg+8oresjd1OmiXJFw2Per28SxLFKm7Xyntk=;
 b=WdXG/mKOd5i3DxIjv8lsKogOkONRk9y62pLok8cYSudB0PHQAjTInlZ+bfufhnZN7a
 30KSnEQ20fP2fjwkOoitbKBpEnemUgLa8TI+I1rXkTE39wmVjiWPSvSpjWnMTnmwyqPy
 fP9Z623aZW3BWg2ovUqNggEs8j+ZS2v4yW6Rga7D8JrKwPZ0GsnWw2laeLMZHwGSAuNx
 S62PeWqKGlcs8YRbVGjw9mXvdDMw5dziMfc37EO/7hhgPKo4RzqfIPOi5iTkKuOD+9Lb
 Ph6Pk4FMOqCQC147rEikp+3rRekJk6sDEImQ1y4Vava4ak02A/983bpXl3NYLoshqwqt
 Cv5Q==
X-Gm-Message-State: AOAM533uOQU/eiATsO39WRReI9T5CTQHsU7PHNPiL/FpV2M+RvVNaBUq
 /PSreY0HlkgfriMyYkMxR06OHubeTyoPTIK9tzlBUQ==
X-Google-Smtp-Source: ABdhPJz2T9Bc4p4Bdt50vuIA0iLMF7NikUhvkv9cDgZEeSjFBqj56gL3l868b6joDwB66O6LuLHfCvCS+UltBmuOCas=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr3326580ejc.407.1616148188513; 
 Fri, 19 Mar 2021 03:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210318154854.3671458-1-philmd@redhat.com>
In-Reply-To: <20210318154854.3671458-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:02:43 +0000
Message-ID: <CAFEAcA9p=YrkYA-3AYdpDVW6mm8jFOd4JAOvqyGOuyznX1daiQ@mail.gmail.com>
Subject: Re: [PULL v2 00/11] pflash patches for 2021-03-18
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 15:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Since v1:
> - Fixed trace format string on 32-bit hosts (Peter)
>
> The following changes since commit 56b89f455894e4628ad7994fe5dd348145d1a9=
c5:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-03-17 22:18:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/pflash-20210318
>
> for you to fetch changes up to 91316cbb3830bb845c42da2d6eab06de56b889b0:
>
>   hw/block/pflash_cfi: Replace DPRINTF with trace events (2021-03-18 11:1=
6:31 +0100)
>
> ----------------------------------------------------------------
> Parallel NOR Flash patches queue
>
> - Code movement to ease maintainability
> - Tracing improvements
> ----------------------------------------------------------------
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

