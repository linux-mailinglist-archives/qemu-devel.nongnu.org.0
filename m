Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7A30E04F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:58:43 +0100 (CET)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LUI-0006wC-Vd
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@amarulasolutions.com>)
 id 1l7LPD-00021M-Nf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:53:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@amarulasolutions.com>)
 id 1l7LPA-0007cQ-Dg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:53:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id c12so25226374wrc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5MVshN3nGOBFeOV4RAtBxc4cnm5aGdEycQONmNRpoLo=;
 b=Dvlbx8j5Mg5vlS1A6Qp5KrJbxsuOIdiJ5ua77XnC9lHtMUSXmoxqHxvPqfvonLwkfU
 GTYivIfLnVoW1AGkEWr58h0VvEXCMY0R4oAU8zOTnJkJNrFoe08XeJwrITEoCJnToEbv
 nfMv3EH5e0+5Xx2EflYSdZW9FClnjC+24yIwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5MVshN3nGOBFeOV4RAtBxc4cnm5aGdEycQONmNRpoLo=;
 b=RozeyjsL1nPFGlB7AkynY9SvbpHTBdBbws0zunIJLvLVlXixQuqmelxPwN19QfXuOc
 cHtJgIwM3KKwKGr6NFdTvBbDd91SJZgR2fV/IArkrzMkX6OKLKAJ++vK+uFJVQ6OOiU0
 A7o5j+sYO2Z/UiAU8xdOSe3lAvOLbhSFLoTFjYXQ0cq8gbZEVK46mJX6ElaQ9JJrNmt7
 AoOK07670Cngw0K2a2/+W2Er75pNkul8PUSjuYpjQnrIhEkxd4Y/kN4EyN9KLQ7h9Rrm
 ZW/nZAQWjzEnBM6l9tVSu7m31IZufPEp1pLdZM8oma9MQZrYIgGwvh8RY0+WyoFBR5IS
 ijIQ==
X-Gm-Message-State: AOAM530PKIRHrR1NN7XccDvZwFkk8gvK7ilUcssdDgYML/n2c+lOSiTf
 b8NBD7JHrfoSbYvjz/HfwCDIf74U2e8D6Hqz94kLRw==
X-Google-Smtp-Source: ABdhPJwYhQ0GsPRm2ui813MKVAGu4r+UZVOyY8KNdiGZ1PHLPUBZXuAn/mmFNktDIoSvUreMBm4rWx1m3sWqiKVfHq0=
X-Received: by 2002:a5d:654f:: with SMTP id z15mr4628951wrv.46.1612371200734; 
 Wed, 03 Feb 2021 08:53:20 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwkxAVNs_=TtVwUiEKyp+UZO_bT26sdCneR679Q5hZ_J2A@mail.gmail.com>
 <CAOf5uw=_tT1h612vnsHjCSRWhQg3_rFWeh9cic86sgKX8ZGubg@mail.gmail.com>
 <CAOf5uw=uiL2vVJQYaGcKU_SvVFDd-_h6QuaSZ9abZZQuZKEaUw@mail.gmail.com>
 <87h7sgjtys.fsf@dusky.pond.sub.org>
 <d3ad4c7e-fd3d-b891-4275-effb86ef7961@redhat.com>
In-Reply-To: <d3ad4c7e-fd3d-b891-4275-effb86ef7961@redhat.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 3 Feb 2021 17:53:09 +0100
Message-ID: <CAOf5uw=o7S77yK8B7mXyvRNhZj-j2TdDwquCxjzOojs-=LQoPQ@mail.gmail.com>
Subject: Re: usb-wacom-tablet failing to register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=michael@amarulasolutions.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 3, 2021 at 5:51 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Michael,
>
> On 9/2/20 1:31 PM, Markus Armbruster wrote:
> > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> writes:
> >
> >> Hi Markus
> >>
> >> I have seen that you are a committer there so what I have seen that
> >
> > I know precious little about USB, and nothing about this particular
> > device.  I'm cc'ing our USB maintainer Gerd.
> >
> >> This request is not implement
> >>  switch (request) {
> >>     case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
> >>
> >> When linux probe it fail here
> >>
> >> ret =3D hid_get_class_descriptor(dev, interface->desc.bInterfaceNumber=
,
> >>>                         HID_DT_REPORT, rdesc, rsize);
> >>
> >> I think that I miss something in documentation
> >>
> >> Running 5.8.0-rc3 and qemu 4.2.0
> >>
> >> Michael
> >>
> >> On Sat, Aug 8, 2020 at 4:59 PM Michael Nazzareno Trimarchi
> >> <michael@amarulasolutions.com> wrote:
> >>>
> >>> Hi
> >>>
> >>> What I have seen is that the parse fail to execute
> >>> hid ll_driver parse fai for
> >>>
> >>>  ret =3D hid_get_class_descriptor(dev, interface->desc.bInterfaceNumb=
er,
> >>>                         HID_DT_REPORT, rdesc, rsize);
> >>>
> >>> Now this is not implemented in hw/dev-wacom.c . What am I missing?
> >>>
> >>> #!/bin/sh
> >>> IMAGE_DIR=3D"${0%/*}/"
> >>>
> >>> if [ "${1}" =3D "serial-only" ]; then
> >>>     EXTRA_ARGS=3D'-nographic'
> >>> else
> >>>     EXTRA_ARGS=3D'-serial stdio'
> >>> fi
> >>>
> >>> export PATH=3D"/home/michael/work/amarula/buildroot/output/host/bin:$=
{PATH}"
> >>> exec   qemu-system-i386 -M pc -kernel ${IMAGE_DIR}/bzImage -usb
> >>> -device usb-wacom-tablet -drive
> >>> file=3D${IMAGE_DIR}/rootfs.ext2,if=3Dvirtio,format=3Draw -append "roo=
twait
> >>> root=3D/dev/vda console=3Dtty1 console=3DttyS0"  -net nic,model=3Dvir=
tio -net
> >>> use
> >>> r  ${EXTRA_ARGS}
> >>>
> >>> This is how I run it
> >>>
> >>> Michael
> >>>
> >>> On Sat, Jul 11, 2020 at 4:38 PM Michael Nazzareno Trimarchi
> >>> <michael@amarulasolutions.com> wrote:
> >>>>
> >>>> Hi all
> >>>>
> >>>> On my 4.17.0-rc1 linux kernel i386 running on qemu, I can't register
> >>>> the wacom driver emulation
> >>>> QEMU emulator version 4.2.0 (Debian 1:4.2-3ubuntu6.3)
> >>>> Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project develop=
ers
> >>>>
> >>>> [    0.395368] ata2.00: configured for MWDMA2
> >>>> [    0.397049] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM
> >>>>   2.5+ PQ: 0 ANSI: 5
> >>>> [    0.584135] usb 2-1: new full-speed USB device number 2 using xhc=
i_hcd
> >>>> [    0.734449] usb 2-1: New USB device found, idVendor=3D056a,
> >>>> idProduct=3D0000, bcdDevice=3D42.10
> >>>> [    0.734461] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D3
> >>>> [    0.734466] usb 2-1: Product: Wacom PenPartner
> >>>> [    0.734470] usb 2-1: Manufacturer: QEMU
> >>>> [    0.734474] usb 2-1: SerialNumber: 1-0000:00:04.0-1
> >>>> [    0.737347] usbhid 2-1:1.0: can't add hid device: -32
> >>>> [    0.737366] usbhid: probe of 2-1:1.0 failed with error -32
> >>>>
> >>>> I get back an error. Any suggestions?
>
> Do you still have that issue?
>

Sorry, I'm really on a lot of programming. I have a patch, need to
clean up and send up, according to review
and I need to test it again

Michael

--=20
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com

