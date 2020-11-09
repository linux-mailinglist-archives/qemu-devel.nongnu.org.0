Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6C2AC732
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 22:24:28 +0100 (CET)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcEeJ-0002yC-IG
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 16:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcEdJ-0002S1-M5
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 16:23:25 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcEdH-00058j-Nz
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 16:23:25 -0500
Received: by mail-ej1-x636.google.com with SMTP id w13so14377479eju.13
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 13:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eb69py+1VtB49iDeziIImU4NeTWuuWDI27RfF1OmVUs=;
 b=QPKo8H8nF64IcAF2VIf0M5e1DDh0X10gGlWm27rWEq4usVul6qcsPV/YQsC/gGKKG4
 Gb7Jszt25g6Zcp8Vj51NUopCgEwcAzJqfngav8rH3xoPYHkYImY8Pr+7APzMzPnFga7u
 24avW4y4ErVpvorHEQmDPI55DAvHm3fHP5udxNKbmQGGleCF9YASXFMhXDKcGeeTu1Mx
 CDu1+JZxF7IEjkZX7JbQnIIz6Wp34BQR424+VBNN58cx1p8IAeLOBI9GFv4ypymfd8nf
 oCeQGy/RAVl2JSGzbPlGYoiTgzp2Zs3uHhvvU7MU1bW8xWztA2FbPQ04DY+rtQKWC/Hy
 nW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eb69py+1VtB49iDeziIImU4NeTWuuWDI27RfF1OmVUs=;
 b=l7ME4UkzQ7vgvG9K/4trD9dKiUxjLUb94t7G9pEz3FWuPya8CSfjl3fbLt3Q9UR1XB
 Da1ReUMsuoNtW0u3ZQ35dGz6w5rgzVFneftGTgEO1TpMRSZyvpV52JvCtDA92A9l6m+z
 r1w27kT8LAbZFQIstP44Nk8zE6/8aoft+tD7rrQoF+Il0uelRBfpcpQo3W9B92Ul6LmR
 TDBweDpt+ZxoZVDJcoPmIAEhk8u0l+iPsu+LUNuL/FhdQtuNINWqZVyyqG37MA5gNtGp
 TKy33c9S8AOwWWpFUv9CfOq4H8nRIeenUDQfcv4aqa98X34Vdd/kFuKUNmB9gImMPbeF
 9X/w==
X-Gm-Message-State: AOAM530ZXhPhYhw1hkNsosizV4+ZhPCpNnU7815ZLBmyji53wgwCLxjJ
 TYjUaXlnTO+eSLYhRvhjrzfVajYgD3cDNFlbWs9Jlg==
X-Google-Smtp-Source: ABdhPJy2+R2/EMUt+riXuc+BsAsKUZ8d80Q9HI2mCgcT7PESMUUQc/hdJXUEQyznAUTmkqMnamCv0Jd0LKXIiMevzwo=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr17814506ejr.56.1604957001788; 
 Mon, 09 Nov 2020 13:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20201109201722.237150-1-michael.roth@amd.com>
In-Reply-To: <20201109201722.237150-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 21:23:08 +0000
Message-ID: <CAFEAcA8D9v8Uk+FfMkdikBSPTMqTjN2FSDuntcD1C0mp9eUamA@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/1] qemu-ga patch queue for hard-freeze
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Mon, 9 Nov 2020 at 20:18, Michael Roth <michael.roth@amd.com> wrote:
>
> The following changes since commit 3493c36f0371777c62d1d72b205b0eb6117e2156:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201106' into staging (2020-11-06 13:43:28 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2020-11-09-tag
>
> for you to fetch changes up to b1b9ab1c04d560f86d8da3dfca4d8b21de75fee6:
>
>   qga: fix missing closedir() in qmp_guest_get_disks() (2020-11-09 14:07:14 -0600)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for hard-freeze
>
> * fix leaked DIR* descriptor in guest-get-disks spotted by coverity
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

