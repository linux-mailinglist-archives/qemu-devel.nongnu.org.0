Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931B2E811E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 16:56:22 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv0JJ-0007WG-9o
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 10:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv0IB-0006xe-0t
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:55:11 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv0I9-0001uZ-En
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:55:10 -0500
Received: by mail-ej1-x635.google.com with SMTP id lt17so25779767ejb.3
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 07:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GnYKkYzQgDG7fW++v9ygqQDw79Gzd6IWGyYQOjJ+Exg=;
 b=WdB3EugTvNqGUk5Ix1ypd2ONd4SvtLj2brhpn0khmS5Uh8cZ78M3u0JgIiW/WOfM66
 8EsYqj+EULbxBgtMedS5AeDJXsxGy746S5bz3X0GoK5uy+jff/9T4koy/82YiSjUMDKr
 8R0FIBWvdbei1FqQc10f5xdVDsVcs6OQ5f8V1WuJXijLuQ1W9v0Qlx06L2H82mrwUaN+
 qHwI4Gv45qodYaPNEwUC06lxhYvcNObUg/sUHJtOJnkAecAwLsfTw3+yGU1VRTZUtEOS
 AGr1Iu9eFbS+ptO2DnLRvvvDH7gdlk1D68bCGShKYtiNdJSCKSmRd96zSq1aHnGFDYnu
 ZDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GnYKkYzQgDG7fW++v9ygqQDw79Gzd6IWGyYQOjJ+Exg=;
 b=Mzjmb3mQ7C6F3lQTdKAtD/eCWswPuz7E+2Po1kA0Qw+KFUR1dXw+aIUO1g25CrPbgm
 16pDgVVdwdXsKFX6BACWVhxORCmkuACGIFeiULDQ7+MykFB2P9rwYxS1jKRqgL1udNw9
 Bbs9TljNnJs5my2a3xy0KnbiJesMoXCnmY+ktjXVl8FdHfATLpAnSyyJkc3r8Xi0bSLU
 MU/3gt1Fpqwk/jHBl5YnT7f0GN+mQZ0n/d59eByB548A4MLMhMz1b9KxPJbHJbFNI9Ds
 ST0f9PiHSmkhvEvLb9WERT9k9Xe8498+mRlcvANbNZhlPhboHeXXRO8522f4VnKaPyDE
 74LQ==
X-Gm-Message-State: AOAM531/xYVBmvlT1WkzfTpjwnPQcLpexTUXbFEIINMAnRszEz86QbP0
 Zow+oaS1iaelg1OhU/P2PCFlplTiPvt2SltHCpWDdWmEddU=
X-Google-Smtp-Source: ABdhPJwO1WPdDxg/9A86WSgofVGxXbU8ZsjJ2dfCBa0e60XdRW6V74a6+4D3LiSMZ1qroG2OgGN01wL8fiUtpFC40gQ=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr53742912ejr.482.1609430107392; 
 Thu, 31 Dec 2020 07:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20201218102407.597566-1-laurent@vivier.eu>
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 15:54:56 +0000
Message-ID: <CAFEAcA8ayBBfbLa0iY_Wym=5+sXE+spgxFRbqtKaPtNC9zebrA@mail.gmail.com>
Subject: Re: [PULL 00/14] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Fri, 18 Dec 2020 at 10:26, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' int=
> o staging (2020-12-15 21:24:31 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 7a5805a08f942325b373643099f784cdac65c9ea:
>
>   linux-user/sparc: Handle tstate in sparc64_get/set_context() (2020-12-18 11=
> :23:29 +0100)
>
> ----------------------------------------------------------------
> Add MIPS Loongson 2F/3A
> sparc64 bug fix
> Implement copy_file_range
> Add most IFTUN ioctls
> Fix mremap


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

