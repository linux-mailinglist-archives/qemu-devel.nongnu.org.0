Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A9313E02
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:49:55 +0100 (CET)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Bbe-0001ik-Ky
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l95L5-0005Zc-29
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:08:24 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l95L1-0008Fi-6N
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:08:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id t5so17707916eds.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v6vzA5DyWEzzwaUkNwGbJxbKI8hzMwwsOzJCyXpoIR8=;
 b=GtGJCCZegjFunANqdEJK/dlMV1eMRYpuPnMs22UCDCf8trVUa1JAdb3WDnfGKKO2Ez
 XpKjVgXziwEOCGMvZIReOuK3qz5fi8Q3RsjrtY1Qy3e+QEU1H7Wv9jq5TGHqyb8CfnA6
 Ea06NgV7aBke+1bshU+pU+yLLv0ptvzLnVRUYpmfo7u9MMyLmq8sIdeYDHT+dVXnIGqx
 kb46F3/q24bon6dOQPwX6EfOFnkKlCF43lexfQvOp63NNH/7RxOYpu//sZo45EZNb3UY
 nb/uKywoKSsa4p3xOqHgzkfZj0GyCOFWnq02UaCZBgyJPOPZbuPGbmQ9XpYKdjDEKUW1
 DP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6vzA5DyWEzzwaUkNwGbJxbKI8hzMwwsOzJCyXpoIR8=;
 b=CAdNYIrnq664eCC/+cOFpP85vJYNa1EcTloKxG3day2uya5mUODw3QBE4svygofmvl
 Vf7JaVzoOxYOfaYph1t9WbE2WrwyABbl9x+GfSm52/2AcpedzpKwAl972udmFNFnjA34
 Wt0M+bo//CwSuy6FikKO8jKeoBW3HYxqeHwZft+S0ONzdFYw3EowGudBngG+jHoeONwV
 o/deoviMzVYYXEghpJGtnlRl2V/Gj1n5yLS2+CqBvt0awWOv7+FS+BbY2uEvJFoCsKW6
 fR8W4+Z/Syrqh4jZrsBfYHYObcfnHh0K5C3pvoBx2p7tvCOGfm1o5P7J9L6WmPnKLA6i
 lpGw==
X-Gm-Message-State: AOAM53042y9ZJ78WHQO2Lea0tCh+glRauk5T9pgyQLUxLFpdIz1w3OCL
 pxX8Le/CANqtDn7efJvvyK8e8ECV7uKPEDwO5Epj3A==
X-Google-Smtp-Source: ABdhPJx2qe4uUlAv7yTCs5LJ2WEh75SxO4G03VHlKR5AaRUMwAYm5y6Z/Pflkbv6vxJBtDKo4IRagvwGDyVpNXMz51Q=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr15258408ede.44.1612786094240; 
 Mon, 08 Feb 2021 04:08:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
In-Reply-To: <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 12:08:02 +0000
Message-ID: <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 11:34, Thomas Huth <thuth@redhat.com> wrote:
> Looks like the SCSI controller returned VIRTIO_SCSI_S_FAILURE instead of the
> expected VIRTIO_SCSI_S_BAD_TARGET here (see virtio_scsi_locate_device() in
> pc-bios/s390-ccw/virtio-scsi.c).
>
> The question is: How could that happen? If I get hw/scsi/virtio-scsi.c
> right, this is only set by virtio_scsi_fail_cmd_req(), i.e. it only happens
> if virtio_scsi_parse_req() returned -ENOTSUP ... which indicates that there
> was something wrong with the VirtIOSCSIReq request?

Yes, virtio_scsi_parse_req() returns ENOTSUP because it
fails the "if (out_size && in_size)" test.

I am becoming somewhat suspicious that the s390-ccw BIOS's
implementation of virtio is not putting in sufficient barriers,
and so if you get unlucky then the QEMU thread sees an inconsistent
view of the in-memory virtio data structures. For instance,
the virtio spec says you must have a memory barrier after
writing the available ring entries and before incrementing the
available index, but pc-bios/s390-ccw/virtio.c:vring_send_buf()
has no kind of enforcement of ordering between these two steps.

Linux's arch/s390/include/asm/barrier.h suggests s390 needs real
CPU barrier insns here; even if it didn't you would at least want
enough of a compiler-barrier to tell the compiler not to try to
reorder anything past it.

thanks
-- PMM

