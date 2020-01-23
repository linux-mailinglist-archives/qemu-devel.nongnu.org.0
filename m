Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B0146FF4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 18:45:21 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iugXf-00065D-MO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 12:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iudV3-0000MF-Ik
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iudV2-0002kp-5w
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:30:25 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41233)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iudV1-0002jM-W8
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:30:24 -0500
Received: by mail-ot1-x341.google.com with SMTP id r27so2870825otc.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pB6XjcvH9tNysxWPccQYg8fLHgzMk898R9ckNDGrKA8=;
 b=I2FkN4n8HoVtwzbW4l6oxYSU4vTJeWtdsnML0YJy7ZpvAwc6B7V7O+W7WyqCb5owu9
 R2crCohKw4WNXfp7+veGQGQ1I1QDnCXEayMqRRaHHNlWK5sSK5UpIAAoLKXvHew7ipmF
 EOPaGxJweLBREp25et1eF1hVrmie1k6i8YeDwcPqEBLYvlycSnISq4M6tLmrl3RQ7euq
 UCi10Gx70uTESBYMzP/QzoftnDZhMQ272NYyn2vIq1fBQ6VIIRwkbgeYa52j9zYWWdQc
 Oyrp7CVz8lE3vHi2+85gmRx+J8hxlohUs5WFb1eZRBGRyoxWaZoW93nCVO1zgb240+NN
 To3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pB6XjcvH9tNysxWPccQYg8fLHgzMk898R9ckNDGrKA8=;
 b=PFc2wTXLydYRErEkjtT6tbnfdXxZ2mYvne+xJg535lSukVlcLVctV0UZt9l9FTicb5
 vhvspjyArYjJtyu0DmDVG7HoYM9vGnUQU0IbdNzgOf88kjH2NoerquJfzrfmP2NpDiCK
 pxkLZYgQGBZBAKHbkI4r06o+g0oO9b8Bwvy0I0tSIHd/MJQDiqiF/aWLlUIc85NcBchk
 gfff9kadWLFFOQr+L4CSU+bLkxSEGO6b5sNaS6JSYMbJCidJ+2sIBtPNnDql6z3Q8eoq
 3UAzdVPpovlsS4EL3g+NEOl69ipDtCc66xfG1jcLBmFpEJhbadr4qfpMY6hvwTZMaIF8
 IauQ==
X-Gm-Message-State: APjAAAVFxCI5yG4sS+Uh7/bFSn8j6JCyEB8HGMp71bUdihFCAN+WXXsS
 95oHOIRBtG4V0hk6hTDArUyWejzUMC8MoqbWW08vfnSJ0bc=
X-Google-Smtp-Source: APXvYqy0lnaqkHgB5UnMIXsVNGuzKkkeNDyKyIKlGNwSuMYKw9Ai13gPDH7qtOoGL4BFhxquxele73GOuIq1eBziwUk=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr11823515ota.232.1579789822703; 
 Thu, 23 Jan 2020 06:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20200122064907.512501-1-mst@redhat.com>
In-Reply-To: <20200122064907.512501-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 14:30:11 +0000
Message-ID: <CAFEAcA_oLUFrEdG=L-_VuBeesXszdgn8EwzKsQXy9_fkMmb5Mw@mail.gmail.com>
Subject: Re: [PULL v2 00/17] virtio, pc: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Wed, 22 Jan 2020 at 06:49, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Changes from v1:
>     - add a missing expected file
>
> The following changes since commit 3e08b2b9cb64bff2b73fa9128c0e49bfcde0dd40:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/edk2-next-20200121' into staging (2020-01-21 15:29:25 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to aefcaf9d1b3ebb30981627bd08f595211a648a62:
>
>   i386:acpi: Remove _HID from the SMBus ACPI entry (2020-01-22 01:47:55 -0500)
>
> ----------------------------------------------------------------
> virtio, pc: fixes, features
>
> Bugfixes all over the place.
> CPU hotplug with secureboot.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

