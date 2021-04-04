Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B3539B8
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 22:28:30 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lT9MD-0003HI-5J
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 16:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lT9L3-0002YI-Nc
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:27:17 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lT9L1-00015z-Vk
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:27:17 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 h3-20020a4ae8c30000b02901b68b39e2d3so2452989ooe.9
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 13:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4VHJcPCxnbA6WnOtG0lBi2eAsU11zc32m4+4b3tKNVw=;
 b=pAX7AOtb61zBcOwNduNDHGUpUGQLxElAHQenkdl+pPcoXEfj9zJ2tvpfvu2KBsOFum
 hrjRPEpmhwpsjUNp0oquPYtTnSKeJCQ38R4Z2HEjSaHETdeS8FAEiQe8NkGls+jyG/Ie
 b3wAerSskAK/rv8mh31iuYddRqGtW7irTZoighe2nzgJiiP8d7oURbhGia9mg00PVHkI
 zn3K2ldSjIZgQvSoS5g9YGoAYpXV49Ywk8jaFXQ7LbI9R5qz6rxPt7HXVPvpskoFjfnl
 b33p+SA18xJf+7BhqqwL8uZaCeuA7hMy/SQuR37gA0o4lcKYGymzZdHAdsjOo3GstUda
 p/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VHJcPCxnbA6WnOtG0lBi2eAsU11zc32m4+4b3tKNVw=;
 b=lNqmCr+D5OYM/XlkM+lkPEPEzY7y+qKMTmNOLMewYUHmgSrPVwBKzWQJL7GQIgwLH2
 fTBSbVEQYyVn0Ze9BAHHGKDLQnJGcbzpnMmNziChHXvv0UaCDAyfD7YEDEo1bPTarChK
 rzlSibU8bpy0AMpbSY7YU0HnqgG9ItyfjgimFadYXi3C//U048KHbNMkgDY2PTen3hPJ
 6wEv43579p2UnKmZWwiDoJeA5QfXblJMADcXHRBlxSa7V37AYed44jzsJw34nnffRFSs
 D/seiUCJeV+U6570nZbJdhGXR93U+5o54ZQdX1aCp1xKnVWWmgid4cqvdgt4Hk18Dw8s
 6+RA==
X-Gm-Message-State: AOAM530O460EB1aCKtGpF90yG6fe4SpFY50gPlcBcv9OwC6FQwnPAvt/
 DeF8osx3OSts8IAda8f8I5R7Fzux+cm1/oARaJI=
X-Google-Smtp-Source: ABdhPJw2zEnrNxPAkqp2hmTAu3QUT3k0m5F3t+PhTTe7cTMO9dR8k5clUqev5qoERFBHefzLoXuI8l/wEOwvIYBp6zY=
X-Received: by 2002:a4a:de56:: with SMTP id z22mr19793378oot.14.1617568034203; 
 Sun, 04 Apr 2021 13:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <157240001496.28481.10507378472210680134.malonedeb@chaenomeles.canonical.com>
 <161756045467.30007.996672314397132559.malone@gac.canonical.com>
In-Reply-To: <161756045467.30007.996672314397132559.malone@gac.canonical.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sun, 4 Apr 2021 22:27:02 +0200
Message-ID: <CABLmASEKnvsx85Rx9r7HbqXH4zcGsHE5vYYYO6SR816DGaStQA@mail.gmail.com>
Subject: Re: [Bug 1850570] Re: Cannot use usb-host on Mac OS
To: Bug 1850570 <1850570@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 4, 2021 at 8:30 PM John Arbuckle <1850570@bugs.launchpad.net> wrote:
>
> I am also having problems with using real USB devices. I tried a C-Media
> USB sound card, a CISCO USB headset, and a PNY flash drive. All of them
> seem to be detected by the Windows 7 guest, but can't be started for
> some reason. I have tried running as root. I didn't see any libusb
> errors. My Windows 2000 guest also has issues with starting the USB
> sound card.
>
> My command-line:
> sudo qemu-system-x86_64 -hda "Windows 7 HD.qcow2" -boot "c" -m 5000 -device ich9-usb-ehci1 -device usb-host,vendorid=0x0930,productid=0x6545
>
> Even when I unmount the flash drive first Mac OS 11.1 will actually
> mount the flash drive when I try using it in QEMU.
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1850570
>
> Title:
>   Cannot use usb-host on Mac OS
>
> Status in QEMU:
>   New
>
> Bug description:
>   Usb-host will not work on Mac OS 10.15.  Qemu runs, though it gives
>   these errors and the drive does not show up.  Also, when Qemu is
>   starting the drive ejects and remounts twice. Qemu built with
>   ./configure --target-list=i386-softmmu,x86_64-softmmu --enable-sdl
>   --disable-cocoa --enable-sdl-image.
>
>   qemu-system-i386 image.qcow -usb -device usb-kbd  -device usb-host,vendorid=0x0781,productid=0x5571
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another process has device opened for exclusive access
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another process has device opened for exclusive access
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1850570/+subscriptions
>

Hi John,

I experience similar issues when passing through USB devices in
qemu-system-ppc. macOS load a kext for the device and will not unload
it when libusb tries to connect to the device. I wrote this on the
emaculation site:

For USB storage devices you might need to:
Run a terminal and execute: sudo kextunload
/System/Library/Extensions/IOUSBMassStorageDriver.kext

Other devices might be using other kexts (drivers), so you would need
to find out which kext is loaded for the device. Some devices might be
using a kext that is also in use for other host devices. If you unload
such a kext, the host will loose access to those devices.

I have not yet found a way to reliably find which kexts are loaded and
to unload them.

Best,
Howard

