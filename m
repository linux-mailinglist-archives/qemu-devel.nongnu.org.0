Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F248D964
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:06:24 +0100 (CET)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80kA-0007aw-T3
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n80f7-0004O6-D8
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:01:09 -0500
Received: from [2a00:1450:4864:20::436] (port=37662
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n80f2-0001UI-NS
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:01:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id t20so2794224wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 06:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZveu1hH3Ue/tPGCaUZNDfR5GFQr0C5hy4+ZTVP+8II=;
 b=mtwL1fsvd7voaRoDD6tOYPTfHulUE7DWevegzq5MMc3MMZIDbnx49D9/0EdgdOqbXP
 4m666yVEr+iescI5nHOnqiCn6KMocM2D/3ZP0M8GFLd8K75aeqicB9CmE/Huuu4mJEIM
 +u3SuU5eHJfy7xqWBAZr4VbnmzrSXGQS7zmm39Cg1nXIBb+o2i/5R73SO+byej23/KHV
 xFMdZPWVnNyO5R6LL6ZW/bUNVpzJjUQjomqo6g76bFyeJnKTy48/TRuE57Bj3S8i0PT0
 O+jw2Hu0B308gJaPhUsR5nsVakBhHCfMFpGb02W8ndqPcktCOJAuqv91FfpKKfB411n0
 YtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZveu1hH3Ue/tPGCaUZNDfR5GFQr0C5hy4+ZTVP+8II=;
 b=kiPzwiUmg9HeuwXsDb0eeaVE55NdTlp1eKUm6xFTkHFcICPBmJsuOP8tdwyCuLSSng
 Rkiqs6dMnSCWr6QNzD4T69i5n4LiPtGyzwcyeD9k9J1Rnsk/g9VKiKHXzWZS/uZp/g/C
 YVP6CwwaIRmV70zhgdWbSSi4DPwQww1o1cl7vgCxYMOLIJrXg+s6aG+tPsIikbJDc+xh
 ciTNnbCF1crllExTC/zmgpZvtxf1B5mGD85RMS90Kyvu5hVKAKjnatLXqSW2NhXVRcLr
 Y68EY/oQJfhJn8DQDM6VdInHRANg/StsRysbB52YL5zH4QiXK8nVYuzavqmKcHKHk7ix
 ZPZQ==
X-Gm-Message-State: AOAM533+6UOMlPGwbMmbym/o8TOOSr0a6UHlUzKnnnPdtP6CLP3FVq63
 PYcyhnBR85r6cD/VHVJw2PY2zUpLIxYk/NL9CJt2pA==
X-Google-Smtp-Source: ABdhPJz67AcWx4aIeaOJ0vUpcGInHJAr2VwPa7pPTuIts/0YMD63PZrbXgY4K2WJPB+tb+qAwqaAHymB7IVlyb42Qbw=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr4229377wrv.521.1642082462704; 
 Thu, 13 Jan 2022 06:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20220112083220.51806-1-jasowang@redhat.com>
In-Reply-To: <20220112083220.51806-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 14:00:51 +0000
Message-ID: <CAFEAcA-CLK0nRgQk8nu0iEcKwGg8tNE=gbXOkR4Pc6RSW83CKA@mail.gmail.com>
Subject: Re: [PULL V2 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Wed, 12 Jan 2022 at 08:32, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 64c01c7da449bcafc614b27ecf1325bb08031c84:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' into staging (2022-01-11 11:39:31 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 99420f216cf5cd2e5c09e0d491b9e44d16030aba:
>
>   net/vmnet: update MAINTAINERS list (2022-01-12 16:27:19 +0800)
>
> ----------------------------------------------------------------
>

Let me know if you want me to apply this or if you're going to update
it with Vladislav's v11 vmnet series.


thanks
-- PMM

