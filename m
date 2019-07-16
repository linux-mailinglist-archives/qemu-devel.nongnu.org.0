Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE006AA7F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:19:25 +0200 (CEST)
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnOIe-0004VF-Fy
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39067)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hnOIP-00046n-NH
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hnOIO-00087m-Qn
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:19:09 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:32867)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hnOIO-00087H-Jz
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:19:08 -0400
Received: by mail-ot1-x335.google.com with SMTP id q20so21212594otl.0
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l93+VBOGcQ9LQ52GkiOn6n1LnYNq/3vm7XdKvaTzrpg=;
 b=oCAyFIA4lu9vW0JQT+X6rZkqEQHry7MnggEq9IA7+s5EqlCGtQmgAypm8VAG2Ch71s
 rfTszrVsV3tfrL6Z0oMTRH2zke1u7fob1zUmhRYU7NFgtU4f6SetE+atOq6uNymxhNAv
 v6Esbitr3nvKFnbxHxDUPG0QuFNUaAgcsTkzPk0IqjYqLIgDYrUtkyELTDdFafTA97bv
 vH5NZij5KuvtPyGTnZdRLkbtUzTOsLZDYVzhEB5FINw72cU2Tr7hE+ik23CpOuJj0/Wj
 56jUWlbcMzHmaEwjNwzChOmQ59VtVe4GW8iQuGPAyKA4iAEbiAnTauQ2xzNM+oeEn+Gg
 sd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l93+VBOGcQ9LQ52GkiOn6n1LnYNq/3vm7XdKvaTzrpg=;
 b=B7iB6Cs3kTpbXWfqkSTUpI9B9ITstIKEVMetcMBnGk/ZUi4cwGxHxmzexQ2kjvdahJ
 lOLAIO+gt+rwa3KYgo5RGPj/7DzccykLF/nP1caphdvxNjP1uAqa+1v5BnK7K+yoloLf
 HAWYqC+SSyM4suVfJUKm58KtuvSG+o+/3woZ9kEYWAmM4JGx5mhVEd+aoXhM5wX1IjFb
 AhA4qNPOOf2D+JGsTHekSXVPbqAydDPmx9QX9we2yGbavgckEBdl0yCbg2SURsemUNqC
 Tdv5/OOucbc4bH32Ca69zBsyzOKRHysziweUUscLn3TGdnba7npU/VqbTVGqTc+JnPzk
 4RQg==
X-Gm-Message-State: APjAAAUNVMzlRBU/0xWwF8TobmTcvIjgdUdFe27USSkpmKdsaPfkpC6+
 UAzYuTf37l4t0N/Ix5hY/BG1Md3O33gV4cohy0BNGw==
X-Google-Smtp-Source: APXvYqyByxqdk6B5NjIQSthcc+jtK2Cv/Y+1R6LtzIKUsFUfIcf4+ARds/ZT/loroCGVhx7Ys5u6idF0FCLcgYU2R3A=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr23607596otk.221.1563286747279; 
 Tue, 16 Jul 2019 07:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181102171638.24069-1-peter.maydell@linaro.org>
 <20181102171638.24069-9-peter.maydell@linaro.org>
 <3e3d2018-3993-f651-8e94-5bea612bd776@redhat.com>
 <CAFEAcA_FtoHOUv_cPgfO7GrZ8Ug9cKCvmY2z75i9DaAQ8Qx+gQ@mail.gmail.com>
 <2745eb9d-c2a2-30a8-c1d0-b8cb3ee43705@linaro.org>
In-Reply-To: <2745eb9d-c2a2-30a8-c1d0-b8cb3ee43705@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2019 15:18:55 +0100
Message-ID: <CAFEAcA-EqXU3vM63bK4+Yo1j07fZpD_=gapB_5_ygrJFk2-Rsw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-devel] [PULL 08/10] target/arm: Conditionalize some
 asserts on aarch32 support
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jul 2019 at 15:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/16/19 12:03 PM, Peter Maydell wrote:
> > The intention of the assertion really is to catch QEMU bugs
> > where we got the ID register values wrong in our emulated
> > CPUs. Perhaps we should relax all these assertions to only
> > testing if we're using TCG, not KVM ?
>
> Perhaps.  In some instances if ID register values are wrong we would then not
> migrate properly, but none of the checks we're currently doing of this sort
> would catch those particular cases.

In those cases we should probably print a warning and install
a migration-blocker, rather than asserting...

thanks
-- PMM

