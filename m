Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7C2B71F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 00:06:01 +0100 (CET)
Received: from localhost ([::1]:40908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfA2x-0007kM-Uc
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 18:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfA0o-0006nn-Dx
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:03:46 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfA0l-0002H0-Ld
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:03:46 -0500
Received: by mail-ed1-x532.google.com with SMTP id t11so24218519edj.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 15:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Ch1t/rZ/gcL9txv94R2hesXLj5ZJhvLQ04fbWWMBME=;
 b=zpt0SbmyXzQQb6Ow3Th0BznTG9ebj414DwEhlJtAiYnKPxCxs6RErSWOwQlH5Ir+KE
 k/aQxXuK//xr6R74aOLur1MX4u9ojHRPNVcOXm5W+XFJvbLtY+Ye8cLpYWJBX37vi3Hn
 xm+CDhwYkw0fce1EbAOSacoyHms5zgsZZcK/CrwwRHyP/0RBs2o9bSxnM1j6M0gLXb/R
 32HnVwVd1OEG1fGkPmbmvNFbBaLuLlusfJhXf3eXFdWy8yquck0G0llpxqdA8c5j8fVO
 a29PO8XZyLWEJCuhcsMNdLiBpRt0wmSDXrYHB48qIbC4RqkCKcqtuLCogDNIV/T13yfA
 hMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Ch1t/rZ/gcL9txv94R2hesXLj5ZJhvLQ04fbWWMBME=;
 b=AafRXDWyGmePuX1DfPkVeavaNQ6PmGyM+rLmc5vm9PCMPRieh7suo6yXFu4SP1V89S
 qCTatKhQUqn83JtGRl46F8Xiah/bAqgMX9J785aMPM72yOK//01s9HnovoLPfHqzFUVt
 nEh9wk1l16OaHllmyEFAWqC9FtQLJ398oKJduVuCAsLVwczStAGSfSl+xbY11vLn+37L
 9rmd+aGQ+nMz5FRWL/2Li7tL+tKKZXYueVJybEmC+DPDegVIAEcoJKs21RvUQKKOCawk
 cwXDcwO2IKbfLA5dG3DsNd9Mu78O/FORDZ7dkEnmwqgTDtg/BCF7x7Yu4+Jdtm0SRaea
 6ECQ==
X-Gm-Message-State: AOAM530d+6JvhkXD2/9NuN8UO8JjnetPAn8xsjhLOjg5fCqVlEcwsL3v
 K0adcr9JuvVDUFpwbe9QjyFDWYrODJzkRM6xxTiggg==
X-Google-Smtp-Source: ABdhPJzPS++hHH89ARZzw0g1hAFpoBmN+9IuoqQ91+w2QsYvM5U7nSAH0i4m/0p0UKZyhDVNgGG/B45IMZIXAYyHSqw=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr23767822edb.100.1605654221998; 
 Tue, 17 Nov 2020 15:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20201117151650.867836-1-laurent@vivier.eu>
In-Reply-To: <20201117151650.867836-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 23:03:31 +0000
Message-ID: <CAFEAcA9h8wx4SyWsUW4gSHzXvbgJgDAdB9SK7jPdhsnnQo772g@mail.gmail.com>
Subject: Re: [PULL 0/2] Linux user for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 17 Nov 2020 at 15:18, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-11=
> -15' into staging (2020-11-16 17:00:36 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request
>
> for you to fetch changes up to 5351f4075dc17825df8e0628a93f9baa9b9bda4b:
>
>   linux-user,netlink: add IFLA_BRPORT_MRP_RING_OPEN, IFLA_BRPORT_MRP_IN_OPEN =
> (2020-11-17 15:22:52 +0100)
>
> ----------------------------------------------------------------
> Fix netlink with latest iproute
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

