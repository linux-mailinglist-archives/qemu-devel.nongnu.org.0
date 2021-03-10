Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11A3343BA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:54:11 +0100 (CET)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK266-0003Sx-4C
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lK1vD-0003iZ-Ds
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:43:00 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lK1v7-0000kf-Tv
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:42:52 -0500
Received: by mail-il1-f177.google.com with SMTP id e7so16132050ile.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOojLKN2e4/5Hpfa5z6WmRjSQ4HMB6OSn+/XN+7CWpw=;
 b=kwfFpwrpsk6XUSl/R82SWo2PGEHI++xyJWleWtpo77HCoBlOAkqyJ2kl4KRByzjfHo
 UB0aO/jhXU6gfa3cqjJ8+1ySGiBpNrqe7PaBm2Hdgb3WdgRt12odz1mEv5rpiJZE4VdZ
 ns+irtKnLzdZ/XuIwxCdLcmobMnfZnDxnOv+PEB39Iv7dgUEyEWKlAKdace7zRbGHgRf
 XYUqKV71ysGT18U8Rbaa1IBAM2XV0yoWZPWC5qqgV20MX39RMPQsHIrtiqECE37Tm5Fa
 KEK7kbGOj+hRWqeYD459M9O/F4+wl2Igx2upAHvd7dw66tRAaybeWkv1ZuY97okflELZ
 4Fiw==
X-Gm-Message-State: AOAM533i/u1OCAfKPhx1fUjvxwHL73rJnTjdUFMwmyVJTVm8sUCzMFEz
 R+b9lIuL1XVjcrPbaCScte4Pa0WhuFs=
X-Google-Smtp-Source: ABdhPJzarT8hHTxGq5lmXDGiAI/iOWxYjXW/VGD9UCMiKk44NkOjR70ee7/tRkVyQZR+HTbGr2hsig==
X-Received: by 2002:a92:b002:: with SMTP id x2mr3275688ilh.248.1615394567972; 
 Wed, 10 Mar 2021 08:42:47 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id s14sm9536329ilj.83.2021.03.10.08.42.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:42:47 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id s1so16131136ilh.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:42:47 -0800 (PST)
X-Received: by 2002:a05:6e02:20e4:: with SMTP id
 q4mr3403297ilv.197.1615394567353; 
 Wed, 10 Mar 2021 08:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20210309213513.12925-1-j@getutm.app>
 <20210310095126.fqxigwoczqkckosp@sirius.home.kraxel.org>
 <5b8a28d1-5a66-9634-f6fb-5b2bdfcf96f8@redhat.com>
In-Reply-To: <5b8a28d1-5a66-9634-f6fb-5b2bdfcf96f8@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Wed, 10 Mar 2021 08:42:36 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDoUWh+U9vENzbB0NCZPWwkBHWmy0grdpUPkZTGZjZfUA@mail.gmail.com>
Message-ID: <CA+E+eSDoUWh+U9vENzbB0NCZPWwkBHWmy0grdpUPkZTGZjZfUA@mail.gmail.com>
Subject: Re: [RFC] hw/display: add virtio-ramfb device
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.177; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 4:45 AM Laszlo Ersek <lersek@redhat.com> wrote:
>
> On 03/10/21 10:51, Gerd Hoffmann wrote:
> > On Tue, Mar 09, 2021 at 01:35:13PM -0800, Joelle van Dyne wrote:
> >> Like virtio-vga, but using ramfb instead of legacy vga.
> >> Useful for booting from OVMF (with updated drivers) into Windows
> >> ARM which expects a linear FB that the virtio-gpu driver in OVMF
> >> does not provide.
> >
> > What is wrong with "-device ramfb" for that use case?
> >
> >> This code was originally written by Gerd Hoffmann and was
> >> updated to contain later changes to the display driver tree.
> >
> > Well, the tricky part with that is OVMF driver binding.  We don't
> > want two drivers bind to the same device.
> >
> > We have QemuRamfbDxe + QemuVideoDxe + VirtioGpuDxe.
> >
> >  - QemuRamfbDxe handles ramfb.
> >  - QemuVideoDxe handles all vga devices (including virtio-vga)
> >    plus bochs-display.
> >  - VirtioGpuDxe handles all virtio-gpu devices (except virtio-vga).
> >
> > VirtioGpuDxe could easily handle virtio-vga too but doesn't to avoid
> > the conflict with QemuVideoDxe.  It detects that by looking at the pci
> > class code.  virtio-vga is tagged as display/vga whereas virtio-gpu-pci
> > is display/other.
> >
> > Problem of the virtio-ramfb device is that the guest can't figure
> > whenever the virtio-gpu device comes with ramfb support or not.
> > Merging this is a non-starter unless we have a solution for that
> > problem.
> >
> > A use case which actually needs that would be helpful to drive that
> > effort.  I don't see one.  If your guest comes with virtio-gpu drivers
> > you don't need ramfb support.  The VirtioGpuDxe driver covers the boot
> > loader, and the guest driver everything else.  If your guest has no
> > virtio-gpu drivers the virtio-ramfb combo device is useless, you can
> > simply use standalone ramfb instead.
>
> Thanks for the CC and the summary, and I agree.
>
>
> Two (tangential) additions:
>
> - The arbitration between VirtioGpuDxe and QemuVideoDxe, on a virtio-vga
> device, happens actually in Virtio10Dxe (the virtio-1.0 transport
> driver). When Virtio10Dxe recognizes virtio-vga, it does not expose it
> as a virtio device at all.
>
> The reason for this is that VirtioGpuDxe consumes VIRTIO_DEVICE_PROTOCOL
> (does not deal with PCI [*]), and QemuVideoDxe consumes
> EFI_PCI_IO_PROTOCOL (does not deal with virtio). Therefore, the
> arbitration needs to happen in a layer that deals with both of those
> abstractions at the same time; and that's the virtio transport driver,
> which produces VIRTIO_DEVICE_PROTOCOL on top of EFI_PCI_IO_PROTOCOL.
>
> [*] I'm lying a bit here; it does consume PciIo momentarily. But, for
> nothing relevant to the UEFI driver model. VirtioGpuDxe *attempts* using
> PciIo for formatting the human-readable device name, with the B/D/F in
> it; but even if that fails, the driver works just fine (with a less
> detailed human-readable device name).
>
> - QemuRamfbDxe is a platform DXE driver, not a UEFI driver that follows
> the UEFI driver model. The reason is that the fw_cfg stuff underlying
> ramfb is a "platform device" (a singleton one at that), not an
> enumerable device.
>
>
> So, if you combined ramfb with any other (enumerable) display device
> into a single device, that would allow the QemuRamfbDxe platform driver
> and the other (UEFI) driver to bind the *same display hardware* via
> different interfaces at the same time.
>
> And arbitrating between such drivers is practically impossible without
> violating the UEFI driver model: first, the QemuRamfbDxe platform driver
> has no way of knowing whether the same display hardware qualifies for
> the other (UEFI) driver though PCI (or another enumerable interface);
> second, the other (UEFI) driver would have to check for a platform
> device (fw_cfg in this case), which is *wrong*. (Consider e.g. what
> happens if we have multiple (separate) PCI-based display devices, plus
> one ramfb device -- if ramfb were allowed to share the underlying
> hardware with one of the PCI ones, how would we tell which PCI device
> the ramfb device belonged to?)
>
> (... In fact, the second argument is akin to why I keep rejecting
> various manifestations of a GVT-g driver for OVMF -- refer to
> <https://bugzilla.tianocore.org/show_bug.cgi?id=935>. Due to the
> opregion being based on fw_cfg, the hardware itself is a fusion of a PCI
> device and a platform device -- and that's wrong for both a platform DXE
> driver, and a UEFI driver that follows the UEFI driver model. It's not
> that the driver is impossible to implement (three variants have been
> written already, mutually independently of each other), but that any
> such driver involves a layering / driver model violation one way or
> another. But, I digress.)
>
> Thanks
> Laszlo
>

Thanks for the feedback, Laszlo and Gerd. To avoid the XY problem
here, what I am trying to solve is that currently there is no good way
to boot into Windows ARM with virtio-gpu without using ramfb first to
install the drivers. The only solutions I can think of is:

* Implement a linear FB in virtio-gpu
* Hack in ramfb in virtio-gpu

And the second one seems easier. But perhaps I'm missing some other solutions?

-j

