Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E96199C53
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 18:58:15 +0200 (CEST)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJKDP-0006tU-2B
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 12:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKCM-00064P-MI
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKCL-0004sY-AI
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:57:10 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39013)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJKCL-0004rx-0y
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:57:09 -0400
Received: by mail-ot1-x344.google.com with SMTP id x11so22773971otp.6
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x0eki5hkAPVzCnZcllF5bW2JAJhSm7YBPE16COsYfrc=;
 b=Zf9i9RkcnHVlJPIKAJ3lvGSnPA7YO1KoXsa1fdQyfmbd7BwUPuGC5hg9rLnMjmN5bS
 fy/DZ/KFikQn6eJEfD++lhHq+P0/NiRhcxaGfwf5CisfHyB0WFmnawufPUKoNBi8FPid
 gV2pEXcCtH0idObfO/dPpcIUfYuUgYPIG8dsDYpvSipxVdyjFCb1VXEq/vWR7w3j95I/
 wUEHy39PgtUuvoDCBWP8cZrZ6HXrgstuHMagNVjcopioYtG9KSTXwfcq+5xckjGIkUh1
 Yi+w63l+iPnbkvbdDQBqm0Ra4wiwq90JyCaOM6LCs6ymntotWX2lJQpLZ1kd79MwgZgM
 /q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0eki5hkAPVzCnZcllF5bW2JAJhSm7YBPE16COsYfrc=;
 b=FFGBnV6aFfSBwmrH8XsERMhkF4U7MeCgSiHNGrBEEVmomnNLKWBAX+kDRVt/3eOyYq
 PNM+54SknkzbI9ZbSkjIsdJ4l7fZiwSpTe7yX6mEwFh0kGOsnHKUg+2YKTpUDRd0A8bc
 j7mz6YSoAOcMFuD6NVzxprWczn6WdIOIiMeJYVFrNl+4jEdfwnfrimUdNhOumS60M5Wf
 yjWCX2HyHfPKDu27dmOx8neoFW5A0SN/Rjb9C0vLlSMoX75It4dtmocr5s3Oe5KsLa4G
 h9LGRZKxhzY/SdT8TbLqWz0f9F1N0SrF6dYaHCUFwt8c0xL7qZvUH5XVm4InHmNNV4FC
 VeFA==
X-Gm-Message-State: ANhLgQ3zg1kPYcTSJwaulfdDjgUkfPCbGihvFgBPWvcXGrKHXyaPhMyM
 BLgA5b8JOEz60Wt40mWNn7r1K3HABM4PRGIK5lvTmg==
X-Google-Smtp-Source: ADFU+vsrtSIwX0dIsWxiQIBCTYECGOJNCKR74gCuquYXmCLuhKpweEpgW05xVBnZGREVDVli/R7ZCLOyzHWHTiTu+Ys=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr2423052otq.91.1585673827809; 
 Tue, 31 Mar 2020 09:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200331145631.135630-1-mst@redhat.com>
In-Reply-To: <20200331145631.135630-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2020 17:56:55 +0100
Message-ID: <CAFEAcA9Hmc1QNwxNUe8vC25pdLowe8gV1zsezg2jvuA18DPUEg@mail.gmail.com>
Subject: Re: [PULL 00/10] virtio, pci, pc: bugfixes, checkpatch, maintainers
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Tue, 31 Mar 2020 at 15:57, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 5acad5bf480321f178866dc28e38eeda5a3f19bb:
>
>   Merge remote-tracking branch 'remotes/jnsnow/tags/ide-pull-request' into staging (2020-03-28 00:27:04 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to e82cdba3945340f524ba153170d52800dbd55ca4:
>
>   vhost-vsock: fix double close() in the realize() error path (2020-03-31 10:54:28 -0400)
>
> ----------------------------------------------------------------
> virtio, pci, pc: bugfixes, checkpatch, maintainers
>
> Bugfixes all over the place.
> Add a new balloon maintainer.
> A checkpatch enhancement to enforce ACPI change rules.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

