Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4A5D11C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 16:01:23 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiJLW-0000Cc-U8
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 10:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40847)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJJ6-0007Ad-Aj
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJJ4-0007sY-3M
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36157)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiJJ3-0007qs-N2
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:58:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id r6so17254330oti.3
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S+jHy48iSxspioqGS3Ovjl+wHzVcWi4HmsUkyeKtm5I=;
 b=nG/S20r/iguAF4sFMgx8Uoy6AWQSopVOz2nhUjGOncE2JRmfkNJGwUxX8C4DQ3/W2U
 hexwMOZ/2c5ap0wzDhEktzWuvuo2y3oeg0ze5Egra9KLmK/j4vGpgZ/pFL+vHg9dZNuw
 3z7o3P/P9+BRI22NJVRn9jPPF4weJA9JGetuWP1v6/xs7LaCEbrwD33u290kHQ0XRYTQ
 5vUk9I5FIXzcjfrvN2g5nUR+7zSWu8kzoW1bVFpjqn3lyv6XyMMVRGEK/ropBlzSJDDA
 QX5v7dD3dTyrrx2AtFGmzEH3xtBbdlPxLQGPJHMNEQFK+/SFzi2UyuCckwkRJFU1V3NY
 dlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S+jHy48iSxspioqGS3Ovjl+wHzVcWi4HmsUkyeKtm5I=;
 b=n2UHLIU/z/XahEPvE3IP2h0f3CDzU5epbD++U7wv537b0bWFpnre1fOGVOaJZVRx1s
 8IxkBNjyOFq3u0la6f8ynjb2DL1txw377xVAKZu9JZBHg2TVpVBeRCk0HLBBPjay9Jq4
 mf+nmcOvg0It0khB94F73TRfjypAqRyAN/tlk3rcXqJ3Wxb4Y0S48Fy/7ygHUuOYpddu
 JydStZ2vvlVoJtvOZxUxUeIq8/47oWneXBgKaWHSD7NBdUi1aRaePO1f97+3Ut0rjrmX
 MMBF5on3qu2OGowxgr4Z83tLNCADE5KmxJV32Y+vCQmD/lx4aSrAjXYEUq6CRW4ttlz6
 sWzw==
X-Gm-Message-State: APjAAAVvo5TrlxFd+adcamceyH20Ao3mypRBaDZqOZbjP9Yjt1IoIUVj
 O/feW7FQRc56CS6U+wx2gLemqzvZWAw5dEfdZ0/VoQ==
X-Google-Smtp-Source: APXvYqwcE4RPq9RDLvCdgHY2TC+CAMUsuI3/1rQwte61yIUvinTXNyhddPOR79QxhoN1sYIuc5AbkstoyqUcwMfiyDw=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr25110572otn.135.1562075928909; 
 Tue, 02 Jul 2019 06:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190701194942.10092-1-philmd@redhat.com>
 <20190701194942.10092-3-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 14:58:37 +0100
Message-ID: <CAFEAcA855a+_uKWhF9pN5DyArD3g-YEYbQ+7hwMfaVAOvBYQxQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v4 2/8] target/arm: Restrict semi-hosting
 to TCG
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
Cc: Yang Zhong <yang.zhong@intel.com>, Andrew Jones <drjones@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Jul 2019 at 20:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Per Peter Maydell:
>
>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>   both of those go to EL1, ie to the guest, and can't be trapped to
>   KVM.
>
> Let check_for_semihosting() return False when not running on TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: inline call to g_assert_not_reached if !TCG
> v4: fixed some ifdef that had moved in the next patch (Peter)
> ---
>  target/arm/Makefile.objs | 2 +-
>  target/arm/cpu.h         | 7 +++++++
>  target/arm/helper.c      | 8 +++++++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

