Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CA3FDDAF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:15:15 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLR1G-0007JL-RQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLQzG-0006N2-0d
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:13:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLQzD-0005Sl-2R
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:13:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id m2so2033231wmm.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BPDAHOwEFGUSEFTupARSITeo8c8XPIjUB3now1ZE8ho=;
 b=p92pCB8TAQ8M0nyN0S/ofKcrx/0KDRiGdtXHKt05MzVLxryFIMDOLb2AoNLUkto+xT
 PyIwJL/HH///IJ+PYrohcTPq9JEVZMpB9WORYYwTbWWCwYApFPvqYS8VO0fV2chEWmRb
 YQbOWnVFKQDOLyd3/rPF0SYRDLrc7d3P2ueNoAoR47/udH3umcX/PIsVF3PYgGtqsMqI
 zYWOfc1ktlj7bCsxWiZ2ysQePmM2tr502Y4NMHGcKzs2IRwcRQS9h6H5BrjN3arBXU5I
 Yr3pH48Fcy95u4rscCM+3iwUUQpHWlfXpJvzE5+t/YDjjBc7BLtsfO93iXQZBJLVxdwU
 sCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BPDAHOwEFGUSEFTupARSITeo8c8XPIjUB3now1ZE8ho=;
 b=lffqRvWI931yF6jCT9MD+dIr119FlV46qemafpF4r7dDQof2xJ59jiy2cM12hkQNdl
 EnyzxEXsZtrtG5Ba1Er6UEFQ5WMyTMDGpqhhLO/8DHGxKjdCJrv0u8jaGonvMs/imFTg
 03wuGL7pV7VWD4T8qwbnKBiFysjj9wiMqVsTXnh+9PRSdWoUd6nrYIssbIvwTd3aMeov
 6/tSWwz4RQUB9QI3XB7uXA7oFD47tNRtQWTMEl+r5THLPeh4ZKc/HRhxPNdpaD460eyz
 XhwpacLiZY9EFRYBscG+bKCmLuOt+2THhaCJSIL6tshabWwjjurd1Ij1s5YAHxIam0yz
 +M8Q==
X-Gm-Message-State: AOAM531fhos/X0dfwPMplnk5y4n5OuSsJDTfn0kYp63QeqHzo8NaLuGN
 GAwmNBk9dRiAaw/gdAFZeD6qaa4NmWU3v834mpBzeg==
X-Google-Smtp-Source: ABdhPJwr9cgGyjbSQguscwSqq/xs+j8RV9FfgeYWDaRpQ6pnkmpvxv/qHwkqj1YKG3r1gig0PnyS8nef0PpV42q1FoQ=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr9690157wmc.95.1630505585058;
 Wed, 01 Sep 2021 07:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901044248.3122252-1-kraxel@redhat.com>
In-Reply-To: <20210901044248.3122252-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 15:12:16 +0100
Message-ID: <CAFEAcA99F_=a+S4bMSvq04+DyKMeycjib6RzBvaz1KdtYyVS0Q@mail.gmail.com>
Subject: Re: [PULL 0/3] Audio 20210901 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Wed, 1 Sept 2021 at 05:46, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827' into staging (2021-08-27 11:34:12 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20210901-pull-request
>
> for you to fetch changes up to 0ebe43ea6a5ceb30b4372038fefddc9e224438f8:
>
>   MAINTAINERS: Split Audio backends sections (2021-09-01 06:34:30 +0200)
>
> ----------------------------------------------------------------
> audio: split audio entry in MAINTAINERS file.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

