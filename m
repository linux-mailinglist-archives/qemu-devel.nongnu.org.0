Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6C18B76C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 13:46:44 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxVGF-00054x-NC
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 07:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxVFc-0004Z8-T2
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxVFb-0003R7-T3
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:46:04 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxVFb-0003Qd-Im
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:46:03 -0400
Received: by mail-ot1-x342.google.com with SMTP id m24so18200962otp.12
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xk5O3tu8TdSlpBlZT8bi0MdxKPcYOxgKEYICS+RrMY=;
 b=lOYV7KYzpbjcQllihuImtTNJE7vtAtNJANSCribyFDqyGU62A/yMEJI59isBuKG+jg
 RSeScqESCroUidSJaF9Jc+HdCW0WOMcsabGmZdDJDx7M1bAlEeMAwbLiekUdo8Wjjavg
 H8voh4eRlQ9J6eJgxmMa7Asj5fJUoQ4Ghpel3Bm2WfVBas7iaCsNO6ED6rw+awhVhjAd
 wgywaFIBFjfTujivVoKGy1wBurXkI1Kzw+JIU6rLR20MQ70L0J2V48tASfLYxb+Hr6Dm
 3+d9us/csfb9IoPut1UNNdNSXVyatybK+WWulBA+02DMRpY5aI28Rg9o9bPuPQpW6kpy
 RNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xk5O3tu8TdSlpBlZT8bi0MdxKPcYOxgKEYICS+RrMY=;
 b=i0FXC0s2kJoRlSuqP4R3f/S/BlH7vgBCP8QrbJPJGdmr0gbuyts9zHyLA+kxqKL+Wm
 SLLhQSzXutK4j27wgRTfWYYvCsTZOO1SnIDeiooLIS9uQbzntQ00ZWtgmXFMCS74Hp42
 P9UxFrdU6Shl69G8S8ap2A9Vmk0BeAINuzCBqWokYH9K0wWvq9FLJDwwywujqbBzvTfq
 ZgW0mlc03JT26wkI7hLGCrWS/gcK0DDiTeqDHpfZxOIXBW+6QfXheteSQf83NLBATSs6
 p5VSGTrjru7RJKDBwqs4k4E/J3BiWUSfK2uX9Wzv8Z7N/8j3HkeBxkC6sfnfYdf/vjMx
 6pJw==
X-Gm-Message-State: APjAAAW8F6/4EqIzvdCFmAAKq8FZC1C5vy65hBUqUViWgK+0SOlyfllH
 XIykTM85Iza18exgHOCRB+sjmbh3ARZnME+fuo8cyA==
X-Google-Smtp-Source: APXvYqx7IjdCXJDTZtt3Xk9kS1q218lK8SwXXeLg+belb5NwK+7XIXAvi1hKZ2faUNHGW6SeiXtAbF7pceQ52hGsp0M=
X-Received: by 2002:aca:6185:: with SMTP id v127mr1213490oib.163.1565696762361; 
 Tue, 13 Aug 2019 04:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190813065920.23203-1-david@gibson.dropbear.id.au>
 <CAFEAcA9-oo-LCrhUdCzV7MZvwyTeT6sxQFt9B0JEaT7FE4tidA@mail.gmail.com>
In-Reply-To: <CAFEAcA9-oo-LCrhUdCzV7MZvwyTeT6sxQFt9B0JEaT7FE4tidA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2019 12:45:51 +0100
Message-ID: <CAFEAcA_wpGVhZ4VG8kK=+Akonww5FHcy2C6ZQ+Sp6YDs7pYH3g@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PULL 0/2] ppc-for-4.1 queue 20190813
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Aug 2019 at 10:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 13 Aug 2019 at 07:59, David Gibson <david@gibson.dropbear.id.au> wrote:
> >
> > The following changes since commit 5e7bcdcfe69ce0fad66012b2cfb2035003c37eef:
> >
> >   display/bochs: fix pcie support (2019-08-12 16:36:41 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190813
> >
> > for you to fetch changes up to 310cda5b5e9df642b19a0e9c504368ffba3b3ab9:
> >
> >   spapr/xive: Fix migration of hot-plugged CPUs (2019-08-13 16:50:30 +1000)
> >
> > ----------------------------------------------------------------
> > ppc patch queue 2019-08-13 (last minute qemu-4.1 fixes)
> >
> > Here's a very, very last minute pull request for qemu-4.1.  This fixes
> > two nasty bugs with the XIVE interrupt controller in "dual" mode
> > (where the guest decides which interrupt controller it wants to use).
> > One occurs when resetting the guest while I/O is active, and the other
> > with migration of hotplugged CPUs.
> >
> > The timing here is very unfortunate.  Alas, we only spotted these bugs
> > very late, and I was sick last week, delaying analysis and fix even
> > further.
> >
> > This series hasn't had nearly as much testing as I'd really like, but
> > I'd still like to squeeze it into qemu-4.1 if possible, since
> > definitely fixing two bad bugs seems like an acceptable tradeoff for
> > the risk of introducing different bugs.
>
> Are these regressions? Are they security issues?
>
> We are going to have an rc5 today, but my intention was to only put in
> the security-fix bug in the bochs display device, and then have
> a final release Thursday.

After thinking about this and reading the commit messages I've
applied this pullreq, since it clearly only affects spapr and you're
in a better position to judge the significance of the fixes than me,
but it was really really borderline...

thanks
-- PMM

