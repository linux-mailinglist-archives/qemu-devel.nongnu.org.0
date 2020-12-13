Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED332D9033
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 20:32:43 +0100 (CET)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koX6n-0005DP-MX
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 14:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koX5E-0004kH-VT
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:31:08 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koX5C-0004hX-5c
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:31:04 -0500
Received: by mail-io1-xd31.google.com with SMTP id o6so1746258iob.10
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 11:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3xyhB7Y0UGZrQK/yKwYdosy5T56skl1P2aILUMPbri8=;
 b=jY0/PpB+khy+ojbtkFGAuQFP1M/PDum3pxRL4giJPUdi0V5Nt8as0lCoiBTqtlOS9Y
 XZ48jxjD8IJebGbEAGuCC1rzv0TOHTNWnI3SWSXa0RvYxSPtcEzjPuXuEFc6rU0y3oiw
 1ejlHZOhdLtMMlyDFh4JYQMqfY6ALdKbNO77lECv7R2W0niCyuuqpsdiTmj6afjQDFbN
 m82cXBFqPFRYQgz6UY2grTYoBUEH1m0CCxhx3GxPOTpfF5xAn5UbJ0SXPfza39TnCkc0
 0c0/7zoSoAAFGJg2ZUGcfm9GBrDZ2HsjzDKkQbIdKDWKw1BAqIbtM+LsIleQmsrtCI7D
 5Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3xyhB7Y0UGZrQK/yKwYdosy5T56skl1P2aILUMPbri8=;
 b=CxNRuYUgLEy1EwW6ay5zR9l1aLW7eMQKLPJkn8QZ3hTxLMXUnQBqv1EBBre5wGzOLL
 r/RoZxS2Qtevd36+EO7PEFNgnwh/rxQvz3H9rHczwpRxd635Zf1I3GxXJIVP1Us2EiEt
 abBRTX6D4kFUgYmOe58MyOHDiXEJ9JbLfxTJWZgSAPW1/gD7QC666AlzF62DXhvl3tpE
 imsU/jwZVkbZdmJgFr/XLdaIfFJBFJdSHUgkrs+4vqssIneTni2zn3g2mdXBnp+d9ssG
 ZMCBrubmSGt6G3+THvZ6vXdg5Z0U6F7t5HVljVGiM9edvLZ629B+2PVgbGN4uoCMzcSv
 aixw==
X-Gm-Message-State: AOAM530iabSxRSptMQ4NNAbSmMJle1GROXLg5IL6x5KaXjn+jZsEXEvs
 J79PZkREMc1vqL3m4l7SZNfqgG9+acinMZeRNXuLjW+HTak=
X-Google-Smtp-Source: ABdhPJyqUy6MS+HsKfGgIsjocpKUYntqYKqYh1QBWfK/G5Tqh54ozD2IKT/u6hvz/jsg2cRiETbKOtepV5Vo1WPS+38=
X-Received: by 2002:a6b:5403:: with SMTP id i3mr27721246iob.136.1607887858926; 
 Sun, 13 Dec 2020 11:30:58 -0800 (PST)
MIME-Version: 1.0
References: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
In-Reply-To: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Sun, 13 Dec 2020 16:30:47 -0300
Message-ID: <CA+ToGPHFEsqwUmH-E8ZSkcsPa68dPnXmDBOJBqehev4RnC0t6A@mail.gmail.com>
Subject: Re: Slow video output from webcam with qemu-xhci but smooth with
 usb-ehci
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=diego.viola@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure it's related but I'm seeing this on the guest now when I use
mpv --vo=drm on a tty:

[ 28.918606] xhci_hcd 0000:00:04.0: ERROR Transfer event TRB DMA ptr
not part of current TD ep_index 2 comp_code 13
[ 28.919816] xhci_hcd 0000:00:04.0: Looking for event-dma
000000012a8c7d80 trb-start 000000012a8c7d70 trb-end 000000012a8c7d70
seg-start 000000012a8c7000 seg-end 000000012a8c7ff0
[ 28.919818] xhci_hcd 0000:00:04.0: ERROR Transfer event TRB DMA ptr
not part of current TD ep_index 2 comp_code 13
[ 28.921019] xhci_hcd 0000:00:04.0: Looking for event-dma
000000012a8c7d90 trb-start 000000012a8c7d70 trb-end 000000012a8c7d70
seg-start 000000012a8c7000 seg-end 000000012a8c7ff0
[ 28.921023] xhci_hcd 0000:00:04.0: ERROR Transfer event TRB DMA ptr
not part of current TD ep_index 2 comp_code 13
[ 28.922203] xhci_hcd 0000:00:04.0: Looking for event-dma
000000012a8c7da0 trb-start 000000012a8c7d70 trb-end 000000012a8c7d70
seg-start 000000012a8c7000 seg-end 000000012a8c7ff0

Video is then a bit smoother.

Diego

On Sat, Dec 12, 2020 at 1:28 PM Diego Viola <diego.viola@gmail.com> wrote:
>
> Hi,
>
> I'm experiencing a lot of choppiness in the video output when I pass
> through my USB webcam to the guest using qemu-xhci as follows:
>
> qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
> -device qemu-xhci,id=xhci -device
> usb-host,bus=xhci.0,hostdevice=/dev/bus/usb/002/004
>
> My webcam is:
>
> Bus 002 Device 004: ID 04f2:b449 Chicony Electronics Co., Ltd Integrated Camera
>
> I am using mpv /dev/video0 from the guest.
>
> It works fine if I use usb-ehci instead, e.g.:
>
> qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
> -device usb-ehci,id=ehci -device
> usb-host,bus=ehci.0,hostdevice=/dev/bus/usb/002/004
>
> In this case, the video output from mpv /dev/video0 is not choppy.
>
> My QEMU version is 5.2.0 -- I am running Arch Linux on the host and guest.
>
> Any ideas please?
>
> Thanks,
> Diego

