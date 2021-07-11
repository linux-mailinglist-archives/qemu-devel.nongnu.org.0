Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1273C3C35
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 14:18:45 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2YQ0-0007yD-8F
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 08:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2YOC-0006vQ-L8
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 08:16:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2YOA-0007jV-Tm
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 08:16:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dj21so2612429edb.0
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUJ5Z9LbnDP/loAZG4Y98E3umNgTHeJ/lSmu6kKMZhY=;
 b=RUP2F/H0HkT//eYM3JDGyM+rjDE7n5RcBBwbwdX4TH5G6FUS23snAeMRqMpJ9PLl2+
 GariX/gq1a6KnR7QdIK22WsSqx8r1O5d1Ec86jla3h4rUTvxfTp882Z/6najG5kcZjwL
 +unFi14Phca8/sO/JjWo+tCD2HOPcNEq2y7QahdmtvYapYklGNr0+1QCbB6bG2dlvRaA
 AtcSw/NY9+MBy+zqy9gzXGoRoVMNfRReRSeiumQCFL7FRJV598hq9HrhBepPoP4Gm9He
 KNSx6UWlAmF6c0Mxj5je0pbZgiokVI5SNvM0sB04XOIYkiUmrpJF0xDLAIiFT8ndpEw7
 HpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUJ5Z9LbnDP/loAZG4Y98E3umNgTHeJ/lSmu6kKMZhY=;
 b=cT2TVD4lYmE3kL1nDTGQU1CpYHhORh2fk6GWbh+eU19SfGEEHfNmcQXIMoBh92Z2I/
 Ni7bcgyOgbX6zud7WRvmg6Jv6rftELGJJG0/6wOk2fA4LJEzBPJyEh5sWeHdTRFZpOtp
 r4d1wHQZO+IoiAy3J3km9BGkKSGYugBRbL/IbQgTgbTlMaF8pbPb9xHwOjMxn1Q5dQGU
 sZc1IfPoBIierILdPxoxbzw/dca3xGYSzjUR/WrREb8jYIHeS3Lurg1dt9fWFAS8Q96B
 +HVx9iCzSO20eE3+XQ0M/MnasukxTXH18ENbTHaivyHKQo8ZYQwnrP5/PFKLebuAG9/z
 waJw==
X-Gm-Message-State: AOAM531HbkU5HxNHICrOdX8TcYEa8KIywj4S9dVAr6OiK1iqIF2DQ1WK
 h2vHz3/jUrHZRiFashLorzJcAxG/8gyOr2c5b+qJZQ==
X-Google-Smtp-Source: ABdhPJyYDDR3UOQgXo50dJcCiwwm+3hC8x6JoeE4vHxfxj5zQEeahaOYohkcHRet3GZ3aSk1kA26fp3ZngTxXlbOsCM=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr37410629edy.44.1626005809160; 
 Sun, 11 Jul 2021 05:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <20210711120854.andcppzuxo6ztykd@Rk>
In-Reply-To: <20210711120854.andcppzuxo6ztykd@Rk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 13:16:10 +0100
Message-ID: <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Coiby Xu <coiby.xu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 13:10, Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi Peter,
>
> On Sat, Jul 10, 2021 at 02:30:36PM +0100, Peter Maydell wrote:
> >I've noticed recently that intermittently 'make check' will hang on
> >my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>
> I have a newbie question. How do you do an aarch32 chroot on an aarch64
> box? At least, this issue seems to be not reproducible on an aarch64 box
> directly. I specifically ran the qos-test for 5 consecutive times and
> each time the test could finish successfully,

Your aarch64 host CPU needs to support aarch32 at EL0 (some
AArch64 CPUs are pure-64 bit these days). The host kernel needs
to implement the 32-bit compat layer. It probably also needs to be
built for 4K pages (which mostly means "not RedHat"). Then you can
set up the 32-bit chroot however you'd normally set up a chroot
(for Debian you can do this with debootstrap; other distros will vary;
schroot is also a bit nicer than raw chroot IMHO.)

-- PMM

