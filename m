Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F573C795D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:02:32 +0200 (CEST)
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QU3-0007az-AV
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3QSZ-00069x-A0
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:01:00 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3QSU-0001n6-HU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:00:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id gb6so44190934ejc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9lX+E3zqNz3HxWt7ikr6b7m//HBWVu3PC//hwVYl/c=;
 b=yMQmC6/v0d9VFv6n9MOslP/O3HI3SNYE7LEZxYdlKQ58OYZP8P/G87VDuHDOr49VPL
 978aif9pZII2l7KQN56YDsiP/Ah5DwzsiOviHrh0I1+Vcx6zIeqwSx6KxzliY+jhHrSq
 9KiANNDNXFUrjZkBXBJ5nmDxrdC3E8E8HSFE62ZcQC1Lzs3IXUshrwuS8wCpcnsuzpiJ
 bvgt+f5dCOD9aiwmYBHxfbNu3eXEOeppZPrIQnJ9m1vxVQ9d+6R5+DRczMRjPdOXwfCF
 AwsOfV2RaUKAra2K2Q9+fR5PnYiZRz47Y0M+9Z5PmAYmSUsVyQvGxiKg5r7Chngr9XGy
 l5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9lX+E3zqNz3HxWt7ikr6b7m//HBWVu3PC//hwVYl/c=;
 b=ZVRjo181TG0sPL4dx49S8Znt3mc5nd+pSqpgCZEsd3dVEnUMUZFD8ASQKuYdFHy9wi
 NG2Gh8a3E8RU49Mih41XNkhf4wA2RKj4UcETormdf+Uik8hp50jsk9wDiOzd8RCioj3Z
 6n7bIg2pRLl7S/esNpdpctMiZiuFrR9gTwqhH8PJmn7MFcKlFJTE2hST9GT8s3R0y/Dm
 T8RapXEymsDeI3xvlFWKsD2op9JWBbsf+Nyu/6WPM9HpFUeUw3fTM89kZRIeGq2CDGYa
 4m175bg3aK+K6CspyABaYHCGzOLGtv/8IonSyr0mulycLf/e0AJVv3ZR+PmVsyFTG7R9
 RdOw==
X-Gm-Message-State: AOAM5328XAyUU++QiZ0TKi5n7dMf3jcrPBrgMORyXcUuexe8EWpn0Fnx
 GFrN3HPxYjT8Vqfcqi7erIeia97tzfuneM5mVAoV6A==
X-Google-Smtp-Source: ABdhPJxenM4N7/PSNnoPxJw7OcdTDT/IeB1nmj7urd8KOoBj/Ry4UiL0ZmTZtBtUBPh2hsaWRsqXW7wfvfnYLRoiuPU=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr8081068ejy.407.1626213652434; 
 Tue, 13 Jul 2021 15:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210713134152.288423-1-laurent@vivier.eu>
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 23:00:12 +0100
Message-ID: <CAFEAcA854EKKSB7tJidY2UkAQD7s9Gzoz6rzddD=YPEHVwZ4KQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 15:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
>
> for you to fetch changes up to 2fa4ad3f9000c385f71237984fdd1eefe2a91900:
>
>   linux-user: update syscall.tbl to Linux v5.13 (2021-07-13 13:59:59 +0200)
>
> ----------------------------------------------------------------
> Linux-user pull request 20210713
>
> Update headers to linux v5.13
> cleanup errno target headers
> Fix race condition on fd translation table
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

