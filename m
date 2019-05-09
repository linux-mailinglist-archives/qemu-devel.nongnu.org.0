Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103B18CFC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 17:32:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOl1s-0002HY-IG
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 11:32:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOl0h-0001df-8e
	for qemu-devel@nongnu.org; Thu, 09 May 2019 11:31:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOl0g-0005In-2V
	for qemu-devel@nongnu.org; Thu, 09 May 2019 11:31:03 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:42933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOl0f-0005IY-TC
	for qemu-devel@nongnu.org; Thu, 09 May 2019 11:31:02 -0400
Received: by mail-oi1-x233.google.com with SMTP id k9so2197423oig.9
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RQajKTWSjVKSV0mGLeCniKsbLuCfAXsICDUoxuOIKKk=;
	b=DaTL66Z98APYirqPD9kidPrGCM3ArbCMOxSUP7GnGecVslfi+xTS+Evzt+gF3D4z0D
	51JwJeFOl2Zmp1SYCmeHFaFTuH9FD8cqGFi8WYXzsCtFELiAvR51U0OdpwKsx470PKSJ
	EoLj6vROUvOgeTux4Ohn5TyL/s09mNzPvw9uQaxcdPvbxXMPOQ1vcCvLEOTmR54kpL0/
	TftqT7ofua2Xlw2lF6HxPk7KIxkomzf1RbPQfClmD0H9COdJyOC/UQWh7kXA0S8kJo+5
	9pzF3FfX+MwvI2ThgL4C/CM0YjCex4T3IVrU7m8/R+lJKN+ASshGgNgIwhF8as/LVamH
	PyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RQajKTWSjVKSV0mGLeCniKsbLuCfAXsICDUoxuOIKKk=;
	b=CYeVkayJsHmzkBp9wm44fK5BU7IFslUFsiEFTA23ghMywi/UinLF/q2DRgC0aeFz3Y
	jjtBMl0ehqOuW88wp4ncHL6XSdlOskj35f3sT3Xn/XPsX2wsNe8i8mHQ7WNBX9qp08t5
	05/rbaqHoqcVTgZSMg/IeYDV8tHAgcI1DNV2e8l3i0EtPZmh/irUSL93OQvu0l+fCk4Z
	4aw7trCKXKNqnJ5lmi8h5o78BTwWIRh3qdHzMN2vBcotUDjnNIzh13Khc4ylIRYhJ8sg
	HgKT1MHGxKNyx7QRIzCla15OXLMOxcWHH1Kl61UZISJwuktMKJrslRFtsYoHqkKXLHoT
	km5g==
X-Gm-Message-State: APjAAAXMuxtwNZPy+p/aHwVV0mf9OCkqQtzfcykLi/euCazxuL0iCaxQ
	RbN1QxsaM0mHKSGZOL1SQqRchDaI0HirjbE4+q5x5g==
X-Google-Smtp-Source: APXvYqxDcgYZfgeD+eOloB6dmm8sKH/kLNxzun0rUSANwnUj5gzNolIUmoyPIzd+DEeRrFMApoXzl0MaTLUd9QBWA0s=
X-Received: by 2002:aca:110f:: with SMTP id 15mr1883505oir.163.1557415860738; 
	Thu, 09 May 2019 08:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190509081930.19081-1-thuth@redhat.com>
In-Reply-To: <20190509081930.19081-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 16:30:49 +0100
Message-ID: <CAFEAcA-YnC21fxXmb+6Ha8rAKbStiAN92uOSg6izVQgsjZa00g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-devel] [PULL 00/14] qtests,
 copyright statement clarifications and misc patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 May 2019 at 09:19, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 629d166994725773dea9cef843fcb0ae5f3585fe:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190507' into staging (2019-05-08 00:06:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-09
>
> for you to fetch changes up to 2c8fcd8f9ef2394b9933a52c157df4ef67ca1eba:
>
>   include/exec/poison: Mark TARGET_FMT_lu as poisoned, too (2019-05-09 09:37:09 +0200)
>
> ----------------------------------------------------------------
> - Fix "make check" problem that occurred with LANG=C and Python 3.5 / 3.6
> - Get rid of some more dependencies on the global_qtest variable in the qtests
> - Some other small test clean-ups
> - Some copyright statement clarifications
> - Mark TARGET_FMT_lu as poisoned
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

