Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65702B843C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:59:18 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSfj-0004YT-Qw
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfSbY-0001wb-Vu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:54:57 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfSbW-0006xA-KZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:54:56 -0500
Received: by mail-ed1-x541.google.com with SMTP id ay21so3157647edb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OdiHu4paEj7s9Wayq87CPAJ3UxM+vgbtnA/UxNKnBsQ=;
 b=Rx7RhsYi1WniFSzCfNbMyQ5DkhSvTwl+X83i3iXcQ0cU9d9vNFatCJc6at9yzHZ4yT
 0asSS68k0LTR9EW3pwTsUOejbU5vcqlXP7Bfy8BByjxRY4SfDAftQnoc0guh122tk95o
 cwLxZtG+wVrid2RkhXDZgjWN807vtjXhIokscGH9zWGDwd6QRLwuD/b/1QUysK2cwID3
 ZbCI41n+wbAoJrZoi7NSUJoc1ojWUS7pmylWtXeSVIYPPkrA7XvQ53AXkA7xbvBjpoLr
 fJEZnwMI0adslBpueZLwHmf1swJoEJ6NBZpyPYcLQzqbMyBr78TTP0ZsDSwPtbUmGdv0
 SPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdiHu4paEj7s9Wayq87CPAJ3UxM+vgbtnA/UxNKnBsQ=;
 b=KNka0h6dObpgotomhrqdtfQh5udBF9VXGN84mEqM+OTbvjCEuJSNhO9qxPpPw95kGn
 0+70LIQyTMUWZq2AA+3H1VmFyE3w6D1sf9uylntCK/kdt1Ed1u5ob77gQMeutr5QLlQI
 7BOfkqWrscHvb/fepGHGHZtccabMhFnQz5AhLs8ghJNt6b+JRectSabvoKb/TEIfR9rW
 6nkjAZw5f8M9uxLxb88h97y5MDyZz79GESfFGVEdDOR17IMCU6y+4AQdCBiTFbbz/g7w
 VSwJbrvGDL6/G6huNJy529h+d/0FnC18+rGQ882lrNXFqmDPfW1653qp+0KEuA/dRz/S
 O+LQ==
X-Gm-Message-State: AOAM533zo02POUSliYqWyf2QWQuGywt8ESux8FTGwMoS/K4/4wRgtDQY
 c8oOQxThp+aNGIeUuOAj5CGabKw4wrfBe2AYBhRQJA==
X-Google-Smtp-Source: ABdhPJyv8BQWNH/83BhH8HxSqTjhSNDp1ZZMOPq3fs2wcekwu3QYRZXMHvX9tKckE4dTG8oAjSbVpJ7FWcXyzS3TxUc=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr27760393edt.204.1605725693016; 
 Wed, 18 Nov 2020 10:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118152639.173860-1-groug@kaod.org>
In-Reply-To: <20201118152639.173860-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 18:54:41 +0000
Message-ID: <CAFEAcA-=CtUT2hfPp+=KL77zZreMvV35DU1-WhOWzm05HXiMHw@mail.gmail.com>
Subject: Re: [PULL 0/1] ppc-for-5.2 patch queue 2020-11-18
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: Cedric Le Goater <clg@fr.ibm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 15:27, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158:
>
>   Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/gkurz/qemu.git tags/ppc-for-5.2-20201118
>
> for you to fetch changes up to 6d24795ee7e3199d199d3c415312c93382ad1807:
>
>   Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts" (2020-11-18 11:05:56 +0100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2020-11-18
>
> This fixes a regression that badly breaks some guest setups because
> IPIs end up misconfigured in the XIVE interrupt controller. Hopefully,
> the last fix for sPAPR. I'm sending this PR with the blessing of David
> who is currently on holidays.
>
> ----------------------------------------------------------------
> Greg Kurz (1):
>       Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts"
>
>  hw/intc/spapr_xive_kvm.c | 102 +++++++++--------------------------------------
>  1 file changed, 18 insertions(+), 84 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

