Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF12D90FA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 23:51:59 +0100 (CET)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koaDe-0006Ez-H2
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 17:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koa90-00050t-DJ
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 17:47:14 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koa8v-0000gc-Rc
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 17:47:10 -0500
Received: by mail-io1-xd2c.google.com with SMTP id y5so15122343iow.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OlTx5p/pkPQ3DLIoUPLqRkwQReEWI0JWkcNjRJFVvNY=;
 b=gmvBzfe0ejQs9XPp/FmLl4k9tV4tsNfcR5GP2n5zPr/845dlFOIlYa2NY344UCAync
 iWI/y1pBMyPlTd52fPtAJVzXpni+Tz3kapT2zbmBxubLI5PXm7w2OCmvlOFlseAMyIYK
 V4V1Skg5k49onoXXXzjt/Xvbs7Wmt1XGAADLkgxIhXng704h5KQ+2ZAQyX98zH8S9YLG
 llOtIfCDMOn+q7jFVFe88oVj8X6IBCwIY/jCuWMh61QlC3hj+SqK87SL0mb+QQM5nl95
 rqvjxyUKkKFr51hBhUJuxx0YQWyhd6AdPBj0NZV89d9IMkmrx38FUtgKiUtxBQe4cM0V
 Xlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OlTx5p/pkPQ3DLIoUPLqRkwQReEWI0JWkcNjRJFVvNY=;
 b=PLcuUSptcbmYJ1KoT8k8f5uKEYmQ6oRqonLnApXG31EGCfLv6MwrMxhN2HFGoSZ56e
 vI3rRmYR73qOmEsN61vZH18clIy/eWm2UtPpbWfe56WkTlvpK9IkUStjN/Kp6ba9VJPM
 lKbXoo5gBPmd04FRt5S6X7s0ih9oEGnFYOX0dgsnVEXU7at2bIgdgTYbFD6x9/diRtlE
 HxOq9SAizX2qR6CE3+bi53oHHmr9PpkdR7DovjI6zCjGuWQ1FjjZHh66aoFbJnGS6+33
 vUnVhJr+H+DSeaIhbGXpFR7uyAIdPzKSSXMiwkIvCxDYNmn/h5nPmyTxyFZRHINOOXLt
 z5jw==
X-Gm-Message-State: AOAM533mBYzWgNCIpD4Cp1WaXv4NFD8DfOY9ljx29y/jk7YmkItmY7kQ
 K/E++0B7W4AfhojqpuT11l9iGOT0sCCAqLCrbq6LwmmP
X-Google-Smtp-Source: ABdhPJyCTawk45nfAreXa6vEhkyTjyFRDEWebJ+ddMKYGRz3e96JdV5MINgFddSogQ+LxDF7Cuu38xAV3+OAwObGd88=
X-Received: by 2002:a5e:820c:: with SMTP id l12mr24449126iom.50.1607899624553; 
 Sun, 13 Dec 2020 14:47:04 -0800 (PST)
MIME-Version: 1.0
References: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
In-Reply-To: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Sun, 13 Dec 2020 19:46:53 -0300
Message-ID: <CA+ToGPFoARJQ80DcGnNqtH3KHcyN7OXiFYtkBEVr7wa=bJV4zw@mail.gmail.com>
Subject: Re: Slow video output from webcam with qemu-xhci but smooth with
 usb-ehci
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=diego.viola@gmail.com; helo=mail-io1-xd2c.google.com
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

OK, I just noticed that it's mostly at the beginning (when I first run
mpv) that the video is jerky/choppy, looks like mpv is still buffering
at that stage, after buffering gets to 99% the video is smoother (with
xhci).

Now I don't understand why buffering with ehci happens a lot faster/smoother.

Nevermind, not an issue after all.

Diego

