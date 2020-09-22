Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAA274B27
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:29:25 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpqm-0003HL-62
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKpQE-0002WF-Nv
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:59 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKpQB-0004eA-8y
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:58 -0400
Received: by mail-ed1-x535.google.com with SMTP id n22so17594483edt.4
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/ipl+rogTiPzM94V0fePhfrN6Rn5ekEkWVt2sfv2VQ=;
 b=MWcrrGpLDF0v9wJHSFto0AqVlUuZg3CFNPjrlcg1l9rCMPkDL/iD05yc0R0SJELtjJ
 uKRVxG5KOolCHVFas8B6KG+ur1B7zfZB5p5wBS7TGrD23A6mCWfE+Eo94k4p44byc2Rq
 g4wdWqxATK+wQmTPX5Al/eRkso8EMBByhMsQi0gU62q+lNe/eWnvs/54jHwAIDS23tvt
 0zk7vhiK5DEXsHB66RNQkrNzuuqun/ZZH9mMCYLoRDs5DUskKibB/3ytoKYPKwbCKyJn
 d4zYGpCiV9AzjSd6AUSeUVW4Dp6jd7Xp0YIt2n3fpTmdSUZ3lIGU18O0oPThd7+1E76P
 9erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/ipl+rogTiPzM94V0fePhfrN6Rn5ekEkWVt2sfv2VQ=;
 b=rDLshTEsz3ImJeMcLVYiWMucaAGigE2b6sld2gx18ZfCwKBZhO7RNx+s6hXoz7RM7e
 jYDTg4GyYmEfYnm1587qoqnDIi/YnlxKB3i5egvolYsD8EJhUe7UouUSYgX7DCng/O4c
 hZbpKfxXODvI8BVxeh0gE9Y/WZJ9DOF19Q+SSlFBwpwDB+uGk4msaBoxQwmAttblaGyW
 gEdo/hxIJmR6TUmnNHnt5UWA7y6jgMeozQuMYPT6Ktx0wEdIn91NYkxxo7g4mIin2s5m
 Wh9QNqr5KwpHz3jKrxAFjYWy+0vwKdGN+qT9gE/7MvezqjD3TLDxL7/UnoGHEBeqK1RF
 4Mdg==
X-Gm-Message-State: AOAM533imCxQKmvGTafB+692Y/0bDxHiWUnIyS2OSxVodvH4kUut83r8
 GaMJUa7NtuumEeEh0qqeeNqdTOWCRE7saVv+2VuftQ==
X-Google-Smtp-Source: ABdhPJzSiKifwgCeiPYvuk4NFuChnXL6V5G4QPviTS7/9BeOETcSfsY3TxPzA1sjONDETzJI3ZSfU+2dozds+JBQu30=
X-Received: by 2002:a05:6402:1495:: with SMTP id
 e21mr5930780edv.146.1600808512965; 
 Tue, 22 Sep 2020 14:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200921110929.7410-1-kraxel@redhat.com>
In-Reply-To: <20200921110929.7410-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Sep 2020 22:01:41 +0100
Message-ID: <CAFEAcA--PkErHfgZ_OsxyhdsXtipLvszVBe0UwMmoS3DJM113w@mail.gmail.com>
Subject: Re: [PULL 0/1] Input 20200921 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 at 12:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 053a4177817db307ec854356e95b5b350800a216:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/fw_cfg-20200918' i=
> nto staging (2020-09-18 16:34:26 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/input-20200921-pull-request
>
> for you to fetch changes up to 38b01a997e6678b4ba86ab12a78a39b7d94ee7d0:
>
>   hw/input/tsc2xxx: Reduce MouseTransformInfo structure exposure (2020-09-21 =
> 11:22:34 +0200)
>
> ----------------------------------------------------------------
> input: tsc2xxx fix.
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

