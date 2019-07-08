Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB062147
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 17:14:25 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkVLU-0008TT-Gf
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 11:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hkVJr-0007q4-VS
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hkVJq-0003mg-Q4
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:12:43 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:45847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hkVJq-0003ig-AV
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:12:42 -0400
Received: by mail-oi1-x234.google.com with SMTP id m206so12835394oib.12
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHb4vILNWMjD4mpXSVNFblOCeZRXoUDcbG4yA/ma+6g=;
 b=LMh6E3iIt/Qcd+vK6q51M74HWQfWo1Bj2a+G4HeSfoF8r71q+dH4kVQYQ9MHN5nWaz
 qrQNxgqZRKwGEic4WxhjVZE8tZ6D0WU6a1DXQdR4B373Kt9Iq7mT8fTH+d39lP4kXKAH
 FBUuB8J279hmunaTHNCYVn5E0kO3QmDT0okyjsQfHyW+Y+pFAXMd2sErUQx2G+A3f3Yv
 NIfGvSCTCzY3xhSsXW1IpHcLWRERY/iA+lnK1e/DMTY6HSRUALCWMpfoa9nKtoayg1Ge
 mSYnhKWqxaO8kUpOIINNCU7VOit0tLeqhN0sJHCwm+NpZFHUjph9eYBz1USfOvq4oSyd
 QQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHb4vILNWMjD4mpXSVNFblOCeZRXoUDcbG4yA/ma+6g=;
 b=SZUpODW5qLfzAnToV30W9hfFcR7FjxKPBV+p5xxTv0NJTnPqp5em1bCfDOAIWgaTqC
 Jh4Ziphy5zeSk4hmvEGwo+xHceLaVkfjea+YZyqEBkw8+ja2GledcPpn6Lfys79U2DqF
 3Gvq0iOFexfJU/f4rC0iDj49mSHgXw5ZZ5FiGrFnW5K3Qf6+Ex3hqY13AFqTa4sFSErQ
 r5JkBhVqzw9DGumTUazYBhWSedwNrgtGgaEXM1rDSCngYaqv7l/Q2P0MaNlTqPk6ckY1
 M/Rd03nggJ78seBe9VOmX841mAkhZPJ0xTnf81fVSnf8zMwGfgBJE2zaeEz+KkuA7pP4
 b8eg==
X-Gm-Message-State: APjAAAXX8cMdI8sfzN96PUZxj7KFVQfBxzsjump1PwNyIojBYm8/e/Ch
 kn3k/E90+wiYHSWZY+5vCuLYpqOU+GgLeA9BElf0gw==
X-Google-Smtp-Source: APXvYqw5vpe7BpaJgNaXGvaUb071+APti0p9x45SVcs+nKtOtKzVm/ZAd4hi33qrOfTeOeLSscg6rsK9x1zvRUBHfoo=
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr9573073oij.98.1562598761329; 
 Mon, 08 Jul 2019 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190708141812.3974-1-kwolf@redhat.com>
In-Reply-To: <20190708141812.3974-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jul 2019 16:12:30 +0100
Message-ID: <CAFEAcA-eM-yqxak=hM6NN9LxDHcdruX8VuBuK9zZcxLkCb++5A@mail.gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
Subject: Re: [Qemu-devel] [PULL 0/6] Block layer patches
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Jul 2019 at 15:18, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit df34fe314b5da628bc9a2664fb1b887bc0a6cc6d:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190708' into staging (2019-07-08 14:23:32 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to f7077c9860a438087c2d9a8cc27cb8438c98a748:
>
>   qcow2: Allow -o compat=v3 during qemu-img amend (2019-07-08 16:00:31 +0200)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - virtio-scsi: Fix request resubmission after I/O error with iothreads
> - qcow2: Fix missing v2/v3 subformat aliases for amend
> - qcow(1): More specific error message for wrong format version
> - MAINTAINERS: update RBD block maintainer
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

