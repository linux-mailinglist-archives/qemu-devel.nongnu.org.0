Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E155CCA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 11:26:52 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiF3s-0003fx-5H
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 05:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35737)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiF0h-0002a6-3r
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 05:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiF0f-0007eq-JN
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 05:23:34 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41297)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiF0d-0007Zs-O0
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 05:23:32 -0400
Received: by mail-oi1-x244.google.com with SMTP id g7so12468969oia.8
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJp8Y3IivklWEU/GlPUXnnihWF/59LLGbSOdRuk95RU=;
 b=mxtyvy9hWNVCM5XEYgTpaC0Vy3f00l0OihddldLcVAghD2i5PAb6LcVGe0NUMLDgta
 93OdO7gsvg6s9P8OxYO7qEs7tAXCe8u4fX2xTDvwJdVPOBFWbIVxKkvx0Z6ZeA5SKH1k
 X9N62eo/ZuF7jF2Vcei4mrFkem3AW/2ElkbXoA5V28ZuDaO3E8VrvtnoA6+LIUdiSPCg
 NHXYvBD+tqUOdHY5Ll0immQuMX8r6h/f0S1E9b3SouPOuJ4NaN3W7VzjD+ibVx9i3Pau
 PP9SdkGmbTUgcUtqwWtVQu3f4yXTlmZ0Iq1s3n+IoZnOf0QbE3hNlh3u1YtqO2QYN9p2
 SFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJp8Y3IivklWEU/GlPUXnnihWF/59LLGbSOdRuk95RU=;
 b=VQrY/DAYR7z4c3Pan2KgO1boQxiKWEdx6YajhCjero+eYU3AxfNZFirV0BPhk3DGen
 9Fpve8kDJxbGQ4K14EI8dVMfQK3dfYW+BAnfTzceA1J2h6tNFNinnrjsGNmqJc8MeRHc
 CkZyz2K07hoBa2Ovw734qKH6HsW3zMRL/0FSvJWSgTKqmRWtPVgLz/FS/dPYecHqq6JO
 A7SRnK+V4yA2ePPooDdyRTt5CurX8QWWSnoDtPCKfH58AiFhsz10QPdG+7IL7tqq47z8
 0vzPOz2woPOPq4q8T11c5y/NRY7Yg7aLSJ4UxK0nPklGyLryfqOHIy3gTMl1eiIt+L2y
 uOiA==
X-Gm-Message-State: APjAAAVs4yOvh+uNX39VncTFPpt9AoFqiVeuzE0kxH48ja5E89yu64RJ
 2KzTTJRLXWyk5tdjHsrzekhYE2nk41Xs43Y6ISnKCw==
X-Google-Smtp-Source: APXvYqyTM0fBOGp/708ohExZKyWab+1S+q3+ssOYp+kRD7V9nLB+b/74b3YRAYIZMSbhw9mIpbcv540IPa/K3Y+PW7Y=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2304932oie.48.1562059397642; 
 Tue, 02 Jul 2019 02:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-6-philmd@redhat.com>
 <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
In-Reply-To: <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 10:23:06 +0100
Message-ID: <CAFEAcA_n3BpZuBPFS8y90XaOwzAo-tuKpO24_apz+9yzpxUxHQ@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 5/9] hw/block/pflash_cfi01: Add the
 DeviceReset() handler
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc <qemu-ppc@nongnu.org>, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019 at 04:16, John Snow <jsnow@redhat.com> wrote:
> Does reset always get called as part of realize, really?
>
> Or are we just trusting that the device is probably going to get reset
> by the guest during bringup?

Reset is not called "as part of realize", but it is guaranteed
to be called after realize and before we try to run the guest,
as long as the device is in the qbus tree. Things are in the
qbus tree if either:
 * they're plugged into something already in the tree (eg
   pci devices, scsi disks)
 * they're a sysbus device (which is automatically plugged into
   the 'main system bus' which is effectively the root of the
   qbus tree)

In this case TYPE_PFLASH_CFI01 is a subclass of TYPE_SYS_BUS_DEVICE,
so it will always be reset as part of system reset.

(the main things which don't get automatically reset are direct
subclasses of TYPE_DEVICE, notably CPU objects.)

thanks
-- PMM

