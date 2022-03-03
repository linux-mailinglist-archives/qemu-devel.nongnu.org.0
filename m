Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C54CC6CA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:06:32 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPriZ-0001h9-GG
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPra4-0005Xj-Vq
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:57:45 -0500
Received: from [2607:f8b0:4864:20::b35] (port=40852
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPra3-0007iY-3W
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:57:44 -0500
Received: by mail-yb1-xb35.google.com with SMTP id e186so12476559ybc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aFpluOq9ViNp2dkRu3kPBu4O3tMjeq+Z6pW2RNElppA=;
 b=M9GOrCWEzqwZ8cJpOpr/bPy6Q1JxrCkarfm3c2RKhvdf4jIfYNPPhjJtXoXWE7pKSp
 LpFIdkxlykhWZeArDw0yUsMMmDQAjD7Xg5lN5qKB6zL6VLFC33WDnlsDbGvl+PovMY2m
 BEXjG12i/M7a4R+1f7qqjS1/M8bPJW9Ye14ZnuJ6D3EGzlgcSut0jfVbSgDsuF+lRUYF
 CNEZukXqfuTJtDYJVHCQX4LYxTdnG1am0dTMe5MvD5iOJFVAU5hs/NYTjT3G7AmCyyjO
 z9xuYRtgsi/T8yAMWsmINeyrx4BD4pRLKZD9hvaW/fSAlIhm1uon+CMFo9xQdMfz8qli
 PIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aFpluOq9ViNp2dkRu3kPBu4O3tMjeq+Z6pW2RNElppA=;
 b=SjRwpYulB1Q62VwgWab6+/YryfAZ+XRK9+ltJfh54DC5zsxfdNvsbWZIvs6DW+QQ03
 30ectZDsGVUsxLvUO511RYgyXVmchj5D+LxAm3Qr+z3BAMOH0eB8SFWT6in3rCpG6vkY
 GxwmSqdHFdiVmBSZ7Ro7F2JrwjNtBOOdNiJNkh/wmvP4q6JBdruDcNA2PDCME84AC0nn
 yjQ2VhECEvxWQBGkQL/P9u1RwBqaohd3ssiy++57RceIMA/29TyWveEciGlZ8Wa3IO/5
 4hp7qczezgvqIDw5W1E0wX21rQdQegQI6hgqY0sHsHi+pMGtDZNkEhxGxcP+t5xMflr1
 NbZA==
X-Gm-Message-State: AOAM53143HXD5D7wo55eOqtZE+eXdP79QBEuNEt3qg8YlBnh+IdXLpVJ
 F09mgVu78TeXzOKOF0zzb8BAXBwCLG99PnpyHZwSjCdrzQrdaA==
X-Google-Smtp-Source: ABdhPJx4aknd9h2sUHT+VA0d6Hl6J4Mcr7+Nv7bnb9IYyq+e9QDgvK/S2t1unbPJOdbFF/hyhd49mdZvQBVrNPk+ElE=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr11106174ybc.288.1646337462077; Thu, 03
 Mar 2022 11:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 19:57:31 +0000
Message-ID: <CAFEAcA84six-Z_vDGEe61DdOGWQrm7h_J6O_CTJ57LcCx3h0Ow@mail.gmail.com>
Subject: Re: [PULL 00/26] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 20:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220302
>
> for you to fetch changes up to 268c11984e67867c22f53beb3c7f8b98900d66b2:
>
>   ui/cocoa.m: Remove unnecessary NSAutoreleasePools (2022-03-02 19:27:37 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * mps3-an547: Add missing user ahb interfaces
>  * hw/arm/mps2-tz.c: Update AN547 documentation URL
>  * hw/input/tsc210x: Don't abort on bad SPI word widths
>  * hw/i2c: flatten pca954x mux device
>  * target/arm: Support PSCI 1.1 and SMCCC 1.0
>  * target/arm: Fix early free of TCG temp in handle_simd_shift_fpint_conv()
>  * tests/qtest: add qtests for npcm7xx sdhci
>  * Implement FEAT_LVA
>  * Implement FEAT_LPA
>  * Implement FEAT_LPA2 (but do not enable it yet)
>  * Report KVM's actual PSCI version to guest in dtb
>  * ui/cocoa.m: Fix updateUIInfo threading issues
>  * ui/cocoa.m: Remove unnecessary NSAutoreleasePools
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

