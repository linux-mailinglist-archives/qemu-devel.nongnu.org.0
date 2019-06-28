Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189835A117
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 18:37:35 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgtsU-0008DL-9w
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 12:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34894)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hgtMf-0002oe-UE
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hgtMe-0000ym-1T
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:04:41 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hgtMc-0000sh-Ie; Fri, 28 Jun 2019 12:04:39 -0400
Received: by mail-lf1-x142.google.com with SMTP id a25so4331118lfg.2;
 Fri, 28 Jun 2019 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5dGU74xjYmsrypBQMVhsWiBTBztQOu4PtmKJ8sUHT2g=;
 b=uztqS68f0BdHeo3tc+fr2QKH14VfYOSPZAodaS7py4Hu7shbOw3jL8RSZ7xzwwg09D
 2qesWTYh1C4754/6YW66PWcY39Bk4UyHcdIsswQgML80d3nRNkVdZKcU8k26nrFeDIT4
 uw8XPRueagyGslP2S70I4REWtA2HRweTExTt9jpbSQRfr4X0IvQ5XfOLnNvLCB68Pxeg
 0NAvq15A2baKZ+55F2bre+Q6wGrKYqncvJO6OjOp63q9c/VEe/+inTzK9ZwVrNjM8vGI
 f9Z6gxfIGWlrjWt3X96WzBKEjG9mBHukQHS8FjGq3l+CyA8quvdO9CvNpHogEVKKvPbf
 wCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5dGU74xjYmsrypBQMVhsWiBTBztQOu4PtmKJ8sUHT2g=;
 b=fwHxMI8Uxq6rCqrtLX+w5hW4VVqRtPN90uKJQHxyuAe285nUpkiyLZFsuQanYhQSL6
 hOHhmB5QfVPol5slp4MP/a/W5wRe1GRedqVrQBSccTCZeqQdzQUDkeXGZA0Ai1jXi35x
 kGE8dz0Bvppr4spwzRsvunSoEBVngKCIVWrpQm4zhR8eJbADjG7epIYmtH6illjGpxGN
 UW+PBqLQ69Dx8N0RnIEYVVer9w3/x9Oj+c6mxwVudF3bbuPWjryAKL+JpUYYIUGjpHXk
 E8Udxgutgr2YQQ6+Z5tSXK4mmbB5IUA0F5cViJn83BK0qP0p0F0C8ZirivNAp0wm3SpG
 BLmw==
X-Gm-Message-State: APjAAAWVIxL97HcWgouNwdQAbHi/Osn6EcH6fVBbluVw8jxzkEUqmV2S
 gBnyfaytGherJ9x3AcuY3iTJZroht0tYlepP0BD4X5tYxY4=
X-Google-Smtp-Source: APXvYqwF7e0zx1tQvrQedR6htzRevSsC2E4lPPRr2FGufD1LNIirVxkhJrVWH2LiqHancWBbZP+64KpOKk7LktBt9Gk=
X-Received: by 2002:a05:6512:29a:: with SMTP id
 j26mr5269037lfp.44.1561737872461; 
 Fri, 28 Jun 2019 09:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com>
 <20190627202719.17739-8-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:01:32 -0700
Message-ID: <CAKmqyKPMkKNPXHqqEZPLmKH61c_BHSOXf26Fj8ZU4pyyoT8pWg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-devel] [PATCH v5 07/28] hw/block/pflash_cfi02: Simplify a
 statement using fall through
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 27, 2019 at 1:31 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index e9eea0ec08..9e8c28af8f 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -239,10 +239,10 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
>          case 0x0E:
>          case 0x0F:
>              ret =3D boff & 0x01 ? pfl->ident3 : pfl->ident2;
> -            if (ret =3D=3D (uint8_t)-1) {
> -                goto flash_read;
> +            if (ret !=3D (uint8_t)-1) {
> +                break;
>              }
> -            break;
> +            /* Fall through to data read. */
>          default:
>              goto flash_read;
>          }
> --
> 2.20.1
>
>

