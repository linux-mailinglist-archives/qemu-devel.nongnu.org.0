Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC308A26B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 17:38:51 +0200 (CEST)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxCPL-0007pj-4E
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 11:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxCOq-0007O3-Jg
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:38:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxCOo-0007iv-Lc
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:38:20 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxCOo-0007gn-0g
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:38:18 -0400
Received: by mail-ot1-x344.google.com with SMTP id b7so110104555otl.11
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sm/ptB77J1VuhidDNAzB9fi+hFZ1Vjo5Tc6oEl0bcNA=;
 b=p8zkvCcJfi52FnxXG3XbNNwfSxMR2rKc8mr2i8vbESrWEpy+Zd0l1MqnXgleEzeBC8
 aEzpOjAwMnVUrrn38z1insxY3HnrXc2qhalIoXcQ73yy/TjP2mJE1XF4MtykKIhShcfi
 MELRaIO0NC25j6PCz/c1/Aa3/t1mseE81WD1ZrIXi7b3c91jn/GySSZrY3y4QZBsTS0r
 vAOIzBy3uxeYbFBdRM9c3VvSsyngkNJ68FCRVRmyY7XNFETDxLdXxO1eDw9419wvJOO6
 yJvbEV2b4WwTGlvAaxkEapoHo7TVcuK4PwzKeV1tBdzeOwWB/WAJRpaY1EFJ5FiMBQ19
 9Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sm/ptB77J1VuhidDNAzB9fi+hFZ1Vjo5Tc6oEl0bcNA=;
 b=pJK98P2LWmyxNnSmCcQlEM1QiEjFYZk0yNQi+F44XBghpmDMK75y4XJBIdXgTD4iKg
 YzyNEC6M6Q1PyNXeWVlFMxkNzt0cnWIPR9AE00PPgjyB/NvGCFM+ZZflh5s3lZeHaK7T
 paokVoTQ71ne9dT85gnF9AaIgqh4clKjz9ax3eJeQiLBfF74RLg8YfZ5EZuVzTQCLafN
 koSbfqgElWt7VSjqemfFQd17xzKGed4tRK3moGvCCqxbTzBwh5MTnAUVWRzXIClO0qvd
 KbKVHJbGtPiGR3ajBAQNsnA96EK04b1EmIadizSKyceV3gnS4jx3kZK6E39r1kibPi6p
 kG3Q==
X-Gm-Message-State: APjAAAUMf9TMUh083W97mOgIKD9HB5JQ7hvBbpillhhtNXVbKzLtQcoa
 RXZLHrqCU6C2Elq6oYbCUgFN1qis40I7opLKzilrPg==
X-Google-Smtp-Source: APXvYqyQsByPhNX0IGOnvGIvXpB6uMOyLG4IKssis4l50RebAgwtyUjy1eJn2sqfojorlQdI8sF7j1ZW5PtFEFj3BeU=
X-Received: by 2002:aca:4bcc:: with SMTP id
 y195mr13551913oia.146.1565624295735; 
 Mon, 12 Aug 2019 08:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190812065221.20907-1-kraxel@redhat.com>
 <aec51679-b766-5773-86cb-9ebd06a8cb49@redhat.com>
 <c4b30dfe-83d7-f1e0-d868-82791d56d6b6@redhat.com>
 <CAFEAcA-3bFuy2DDG8=-_Y3JO4HWpCW80EcsGWWN8toxiMpafBA@mail.gmail.com>
 <20190812093510.1b85cac8@x1.home>
In-Reply-To: <20190812093510.1b85cac8@x1.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2019 16:38:05 +0100
Message-ID: <CAFEAcA-PxgCZzMJu8favVEP3x+DX3208TfChsu17fYCkibGg2w@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 0/1] display/bochs: fix pcie support (qemu
 security issue)
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
 QEMU Developers <qemu-devel@nongnu.org>, Prasad J Pandit <ppandit@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Aug 2019 at 16:35, Alex Williamson
<alex.williamson@redhat.com> wrote:
> Quoting new commit log:
>
>         This makes sure the pci config space allocation is big enough,
>         so accessing the PCIe extended config space doesn't overflow
>         the pci config space buffer.
>
>         PCI(e) config space is guest writable.  Writes are limited
>         bywrite mask (which probably is also filled with random stuff),
>         so the guest can only flip enabled bits.  But I suspect it
>         still might be exploitable, so rather serious because it might
>         be a host escape for the guest.  On the other hand the device
>         is probably not yet in widespread use.
>
>         Mitigation: use "-device bochs-display" as conventional pci
>         device only.
>
> Is it clear to others that this mitigation remark seems to be
> referencing an alternative configuration constraint to avoid the issue
> rather than what's actually implemented in this patch?  IOW, if we
> never place the bochs-display device into a PCIe hierarchy, then
> extended config space is never accessible to the guest anyway, and
> there is no issue.  I think this was meant to be an alternative to the
> patch but the enforcement of that would happen above QEMU, probably why
> it was mentioned in the cover letter rather than the original commit
> log.  Thanks,

Yeah, that's unclear in retrospect. How about:

# (For a QEMU version without this commit, a mitigation for the
# bug is available: use "-device bochs-display" as a conventional pci
# device only.)

?

thanks
-- PMM

