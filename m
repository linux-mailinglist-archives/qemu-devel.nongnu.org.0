Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AB4D3BED
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 22:17:31 +0100 (CET)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS3gY-0007KF-AJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 16:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS3fa-0006aq-4p
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 16:16:30 -0500
Received: from [2607:f8b0:4864:20::b35] (port=42983
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS3fY-0007BO-Ie
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 16:16:29 -0500
Received: by mail-yb1-xb35.google.com with SMTP id u10so7005999ybd.9
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PiapKg5pjUVQaFKRe6jZpdRsebDpo1bs8FBlybEdyBk=;
 b=vTa7OI2oWXuTB82FBie32F7A0JoHZZxP0OICAbOGKAXQRg7BQqqY0/p4ev8qpl5OM7
 5pz/Ev8XdUTbxOgSBX7Y+b8fNL54BEDxthYXEKcBg3k5fUXpQvlEqnCHFgmFpBjTK4rr
 Is60G9q1DeSkLUgq1zJ/Tv+VzEZbaQpHZb3kh0UzmKYTtdYVaP5glrKvcR9jfpAiPM4i
 xt7lTIoOLhw5IsOpDId0gcuqKXppMuk4cT0rXtuE6WX6Dti8laM7N/Kkk3OvJAdZq64J
 IV84B6b8Wy2o+sPHmokp6K+hEi7VaHvfAHIaMl1HfEttZOesxOqaFVbHeaILDh1mP8kM
 CghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiapKg5pjUVQaFKRe6jZpdRsebDpo1bs8FBlybEdyBk=;
 b=5IyUzEo0gnEveFCZBP8jVduzNoSXuEiKQXn+uo2nGzHsCjZv+wckmahxdhGsxwViXb
 BXddg0Uj38LtpAmwwNuKwrL1gUPrD0fKk2Q8zHZ0oAr/lHrHsL3BIVcuzL+G92wW4BUS
 1tfnUjKXleb883dFxOJShDgQMau3Dk9JZtkowkN2HrZcjahJbToimLXWd4C7SKwWJCby
 OALdtBgRIyVfegFnixVEBy/bE5a1i4NorR4RPhWWTCE7wwtb4Sao1YLpNG3B+KmLYCfQ
 ZAZ/2bc8N/0hTviZSfauS6ZQEp5Bf4MCIEjRZY3ase4cE98cCZUHQ4HusVsBg2Zoqk9s
 +gIw==
X-Gm-Message-State: AOAM533p7BEXLrnvQuWXY5xfLV38LGBLaY7+ilcvxAZ90Bt4m3vCqf7S
 4nqKEJjj7ke808OkAfKsvKfzL/EfVBen05Xvbc6FPW+aGi1PpA==
X-Google-Smtp-Source: ABdhPJzcoHXuTHAQCM8a2R2CHE9rebGCIlgEz35uLyfiqPRk/OTUSo7GB0FqbrqJyFfJprPhbRgC2gOZunq53IUU6Ks=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr1482694ybp.39.1646860587432; Wed, 09
 Mar 2022 13:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20220308150228.1616561-1-laurent@vivier.eu>
In-Reply-To: <20220308150228.1616561-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 21:16:16 +0000
Message-ID: <CAFEAcA9y=eSHZaoh0ziO0KNEoZY+JBTBpi0VoE_464MoB7i2rA@mail.gmail.com>
Subject: Re: [PULL 0/3] Linux user for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 15:14, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit f45cc81911adc7726e8a2801986b6998b91b816e:
>
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20220307' into staging (2022-03-08 09:06:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-request
>
> for you to fetch changes up to 62089c849d49f92823c68624720cdac8fa4b43e0:
>
>   tests/tcg/ppc64le: change signal_save_restore_xer to use SIGTRAP (2022-03-08 16:01:08 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20220308
>
> deliver SIGTRAP on POWERPC_EXCP_TRAP
> remove stale "not threadsafe" comments
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

