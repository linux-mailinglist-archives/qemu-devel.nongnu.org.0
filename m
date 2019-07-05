Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223D608BE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 17:06:30 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjPnB-0007sv-9G
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 11:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hjPlg-0007K7-4R
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:04:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hjPld-0006mm-2C
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:04:55 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hjPlc-0006cQ-Rz
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:04:53 -0400
Received: by mail-oi1-x244.google.com with SMTP id m206so7324903oib.12
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWBioOA32UjFaFL/HcEDA3H5bwckqpsOwovCr4PoZEY=;
 b=Hzizd974rvfuKoVvEPumkx9V6Xu55D4LRgZ2xDo5K/fTgcegzR+9dMw0u6WVcaBKA9
 z5+NhlYx2CpJZn9xgeJaLDuWH6YqoyquVMz/BkZlh5rELG8Z75WYAqeURZvkV/+kb7Rd
 AsW5kZ2Nkorn9ou1MF8m6hajqbC7hxlFPQO3rzbZQRM9TjQRTDqau1xxPmzIN+WtqdVs
 OXHnUAG2DnZDqoPbA4KuqXX9MJGyZyHrtZ7LqWPXqGX2vxjV41Uzjn7mbbZCKp9uJuP3
 vi6rAeHtYsEay+/Ccj+clmtvcmwSGejO8MMNIqMgv1r83RjI55dacH5OhsxszkOBclUm
 Mbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWBioOA32UjFaFL/HcEDA3H5bwckqpsOwovCr4PoZEY=;
 b=HKc/OLEoug7OZnei12/ploJSZ+sEjiMIOI0pk/9k+dcic08LBRBj2xIcn2B+lteWtx
 wWDRqSyxtJhut094OJeqa6tXc/emY+DGfaIU6Q2LayzSah/TpPw/xWNTEFn5cOl5cOqs
 BCyvvDr2H+o+s/X9YSoWwXfSEOzQdxhIohQGTajI01eiy+T3euMdqQ+cHEt47GfjFwm/
 HoHu6Uep8Yn+pGPKWeGrKE0KoOyYsXj0PgLjxF0gFBypfj0ooKJZEUKIb2dUXSwps9uT
 QUGhS/Ioi+nSm/KS6Ce9TRVfLys8jxu7qWhJU1KzvoTnTWr+MO/BeB5wVNMO6ULY8V1S
 jeDA==
X-Gm-Message-State: APjAAAWbTOJ4qXtHmdHP1O+3YmQc+jeWhotwY4XxrgdDi2Wew8WhChOj
 mLYaV7Nq01tRCyr/EWSCsiv4esvwAvH+BSDwWC4Rjg==
X-Google-Smtp-Source: APXvYqyIX3fCLvbDZjh+YgMq4Hmi+x7Bl4zErfTylYZUzV9HKCoExqc5PgijR31jv0Ok0jttMamVQfbvjl7HTXyddr8=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2185549oie.48.1562339090459; 
 Fri, 05 Jul 2019 08:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190705134239.11718-1-kraxel@redhat.com>
In-Reply-To: <20190705134239.11718-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jul 2019 16:04:39 +0100
Message-ID: <CAFEAcA-gmbrFPyVwHMEUqP1Lv5sT5X+Ud_byUhuHERh-L=M6zw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PULL 0/4] Vga 20190705 patches
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

On Fri, 5 Jul 2019 at 14:48, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 57dfc2c4d51e770ed3f617e5d1456d1e2bacf3f0:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190704-1' into staging (2019-07-04 17:32:24 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20190705-pull-request
>
> for you to fetch changes up to 146dd326c1ff5869ba9e243e30325c44d696c996:
>
>   ati-vga: Fix setting offset together with pitch for r128pro (2019-07-05 09:50:33 +0200)
>
> ----------------------------------------------------------------
> vga: more ati bugfixes.
>
> ----------------------------------------------------------------
>
> BALATON Zoltan (4):
>   ati-vga: Improve readability of ati_2d_blt function
>   ati-vga: Fix frame buffer endianness for big endian target
>   ati-vga: Fix reverse bit blts
>   ati-vga: Fix setting offset together with pitch for r128pro
>
>  hw/display/ati.c    |   5 +-
>  hw/display/ati_2d.c | 133 ++++++++++++++++++++++++--------------------
>  2 files changed, 75 insertions(+), 63 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

