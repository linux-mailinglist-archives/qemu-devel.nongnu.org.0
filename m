Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8766B70
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:14:07 +0200 (CEST)
Received: from localhost ([::1]:48246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hltV8-0006tM-Ds
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hltUu-0006Me-BE
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hltUt-0004ab-8T
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:13:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hltUt-0004a0-1Z
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:13:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id s20so9072112otp.4
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USTinHvKC8PNCXYOsMbNfTrkBK+wqxWYlfSzEvER56c=;
 b=ITpifCqCHiErnQWpW95RJIghhDQezvkzuIBrP9EKpJ6sPVc4Uh3ckOS1Ohg/9GSVmv
 nQXbbT6codlrJmVsXyNZerQ455CG2wibokZW+ty7iI8Z4YOYzJTjCfqlyhGJWxDvWuBY
 AzdyT77DgDCqKMD/XVfE0bqRQ2li9WHNuvkdPOeh8tyNJ1e7FBuGnDNEgt51XRI1TEZI
 Y+G2r2UreAn2DCb3n67xt3Dykr33mxzzkviR7benQR2K8flP3EdoGwRsl5TARsgo4XDp
 hlM9OmHXHgvSE+q0xBj2mdXFZmE6K9KVqc2umoH2YzEo8r7WyH6o88FQw3c09szRVa4C
 7Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USTinHvKC8PNCXYOsMbNfTrkBK+wqxWYlfSzEvER56c=;
 b=s3rf7+Vt/8Ylk76cnCVeoc6jyZ3STLs5VJglyVZ7ci1l7RfKuHzqdY3JtfJRtw/qyd
 STx9XUwJh5EPmikn4fAgvh4DDPMBgUqEu25w7lQKoBmLVUIuCyvMXodWSlv0C7xQcG+4
 yUc36GSx4o6R7GJJt5Zy3rtPdYijrgOiuu7e5wZJYll0TpZkOQbkXc4m+OQkia4WNVdt
 3ilUSvNOcb2kmJ0NtYZDPVOA8OSi3uIdCk4kptizqZDhUdjUn1jOzyXjupazASbSTf+u
 nzuG7adWZ+/WwNl7YAEbzfwkhJeR33BFKSGYZKYMvoIo0iMxO8qvRgHAHIru9OR0yhHq
 FkpQ==
X-Gm-Message-State: APjAAAWCgur7VRRbrDnvU8XG866fA68b54uySf5Bdgo2RMO1pj1Cy8ws
 X6UWT0T38kqSiH87aB1tp2InIxaShD+G6Clng9RlhA==
X-Google-Smtp-Source: APXvYqw3K3YBqStw9a8z48as3gVeNMryWlLHCKm88y+JYBylt/rB14jOo1hyKqyyhqozehz3cEbIM4RroA+/Dmy4uO4=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr429527otr.232.1562930029499; 
 Fri, 12 Jul 2019 04:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190712062509.31370-1-david@gibson.dropbear.id.au>
In-Reply-To: <20190712062509.31370-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2019 12:13:38 +0100
Message-ID: <CAFEAcA9YvaLRsDghYKipYDyG8zvh=PBrNHNAU+iU7UEX1oJ5fw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PULL 0/2] ppc-for-4.1 queue 20190712
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
Cc: gkurz@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Jul 2019 at 07:25, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 9411db8f37c64b9adb3e4b393c623a5760bcb847:
>
>   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' into staging (2019-07-11 11:58:14 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190712
>
> for you to fetch changes up to 38298611d5a87d2739d0a21d5f9e47ba43570c22:
>
>   xics/kvm: Always set the MASKED bit if interrupt is masked (2019-07-12 15:50:00 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue for 2019-07-12
>
> First 4.1 hard freeze pull request.  Not much here, just a bug fix for
> the XICS interrupt controller and a SLOF firmware update to fix a bug
> with IP discovery when there are multiple NICs.
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>       pseries: Update SLOF firmware image
>
> Greg Kurz (1):
>       xics/kvm: Always set the MASKED bit if interrupt is masked


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

