Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC5E34D4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNdb0-0004hl-0B
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 09:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc5M-0001Sc-2Z
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc5K-0004Lp-6E
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:19:23 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36714)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNc5I-0004KT-8e
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:19:20 -0400
Received: by mail-oi1-x242.google.com with SMTP id j7so1657533oib.3
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yF4kmh7NbZvXPtMgHJWlsAOw8uUWNX2w8ZYVD+ioYYk=;
 b=RJlxKSULgpaeQyXgaRNpct0tZ1bigHKlk2dQZie7hKL61E1VSgxdmgRuDlKnTwwUHW
 5Q72gy4hybElHPb6Fdg7DFxBYIPngRtUgBB7bWJS6mYl2pQPqBMMoGtAUv6VvTjbha10
 ENGh++dCHYmPvArdWCqFiHG/JvNlfc0mxYWOa3y0pBlXSG/tiCT3fSqdGwzwuTEDNJdQ
 t9kCX0gfRTVj8TUr3GqAm4Jnm+9/m9D20uo9yXCtRbyfc9vNdrYw3x2XfGCAOlebHItq
 wAOWiy5uh1+zDG/fC6Dqja/zgNwWU0XAGQ2bI6mHHzGn0voEpw5mxknxd/UI1Q4D5E84
 Xl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yF4kmh7NbZvXPtMgHJWlsAOw8uUWNX2w8ZYVD+ioYYk=;
 b=pAxLztmuBJXtdfcdf57gWr3jp1BEUpWiSymIQYInzf1tFRigCRzRn1BxBMUrNgW5jD
 tnP9qKnFA5A8+NiRxI6XxqRngJPmLOAWHyt2ealAF1tZMfBYiHXbEs0DE6YQ5Xn+d4Yc
 9nO3laDH9g6wSacfRvHI6J9z73oWcjerJecvRcX5ncqkPZW9eBEpJz8mI+knYcxaP268
 9fqwT9z2CaggpMbySe9EwWc5WmIJZPm8xoHdsog+L7NbgG33PKjm8/F8sXfwI3Mzhdab
 cdQ7COCdEqM2Ht5ATt2W/BUUibc1VbEttHVHcDUjfspp3UekmEQ5M3a1FcaHLGpktT+b
 zyvw==
X-Gm-Message-State: APjAAAX6m5vRweugAz6ZrWPKtLi9HRwD7ywIGeLoM7jG0r9uEJwWzXFb
 MlR5XgF34Dn/MtP2tFEJIMbZ7gSGphEuav35WSGGzq+CIPw=
X-Google-Smtp-Source: APXvYqxpFZn6q2ebuOOWQihDFfa+ve3BcRb7vG/vI+S4AQnJnaoIP3cjHJwk66/GFHr2oo+SsLPuYKYvHMlN+JFl/GM=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr4139460oia.48.1571919559106; 
 Thu, 24 Oct 2019 05:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191021134357.14266-1-peter.maydell@linaro.org>
In-Reply-To: <20191021134357.14266-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 13:19:08 +0100
Message-ID: <CAFEAcA8d6xXp+bCJCSWwD47Omfrenh4C=4NC3cFm4pEAHhkGmQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Convert sparc devices to new ptimer API
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Oct 2019 at 14:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the devices used by sparc machines to the new
> ptimer API.
>
> Currently the ptimer design uses a QEMU bottom-half as its mechanism
> for calling back into the device model using the ptimer when the
> timer has expired.  Unfortunately this design is fatally flawed,
> because it means that there is a lag between the ptimer updating its
> own state and the device callback function updating device state, and
> guest accesses to device registers between the two can return
> inconsistent device state. This was reported as a bug in a specific
> timer device but it's a problem with the generic ptimer code:
> https://bugs.launchpad.net/qemu/+bug/1777777
>
> The updates to the individual ptimer devices are straightforward:
> we need to add begin/commit calls around the various places that
> modify the ptimer state, and use the new ptimer_init() function
> to create the timer.
>
> Changes v1->v2:
>  * patches 2 and 3 are the old 1 and 2 and have been reviewed
>  * patch 1 is new and removes a pointless NULL check; without
>    this we'd probably have got Coverity errors when patch 3
>    added a use of t->timer before the check for it being NULL

I'm going to apply these to target-arm.next; I know they haven't
been on list long but the change since v1 is only minor and
they've all been reviewed.

thanks
-- PMM

