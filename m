Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A05358DA7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:44:59 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaaI-0004Vw-DO
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUaZC-0003y9-5X
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:43:50 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUaZ9-00005z-9M
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:43:49 -0400
Received: by mail-qt1-x82e.google.com with SMTP id f12so2389082qtq.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=FJO+RAGMSihhOjVKyWsMj4yHYOylPtAB2sWhHyMqDz8=;
 b=rTyKgRU7DTearKLe+Iv4jPcKadBd797A/nXVrstPGN+cP8ljuwSXcGx7cfgj9N6Nzp
 gaxDjmEnG4UotPWDm4wF2KPgs/pmaBZ9acvfLinMSx9X05Wz0GMbABMaZPtDsZWtzbVL
 RcioVnTqqVshNVCKPFSiwUSlapbl5p1svzLAkXRpE09sG16QKatfBKOomKZeQtkIUxLt
 DIAwHR5dn079ZUOEhIB7PJhJvDgeHtryfgNhAwyIvXY8J9MkKXIHPEqqTHJF+VqKOJ4G
 mSnIq4/l+pUsTtqZlZ769D8ITHBhleFaDIuX5ue0IUBKKYiggRXgEK5nhf4qb2CgrLUB
 2Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=FJO+RAGMSihhOjVKyWsMj4yHYOylPtAB2sWhHyMqDz8=;
 b=fAtxQDORkTt5f2ePNAVw6uoEfz+Qlp2lGfL6g4TRpYNbhIJ3LwasZkTnq86vGSuWU9
 ST4W8QkOmIytuWxtLMBsTekSnAan+MSVZmBMoVJ3EquvlCElIfz2Iak0nUcDd0ppUrxh
 vLNJwWeRaFIS5ltx+k8aM1SBIXgnR34/O1i399auxqBh/LI4+1ROB5L9S9lywrzK4v7Z
 qpPO5gq+uaN/bnVy2mZ03PlI11a5SjQocm1NcerP0C6Wa2SBjUH6OMxePSGxjl5x9vsh
 LuOWOom/1x9qwRRtzfXQv9jfa/bYI0Cv1Tz8wR28PP6V99XClafGRyzAvt3HtNznO5LQ
 6ppw==
X-Gm-Message-State: AOAM5332XMT44u/dc4OmNLDf6u5co5ycIjIuY4GtKNgsPZMsLUtAllde
 fnflChDaLhp8RlKfWER+ctA=
X-Google-Smtp-Source: ABdhPJzyC5YJZ6T4D62tpyepSfFIKtodjJyON4gViUmAeryytYr0L3I8JdcNPup2SQTp4mBpTdSY9A==
X-Received: by 2002:ac8:d87:: with SMTP id s7mr9209518qti.32.1617911025682;
 Thu, 08 Apr 2021 12:43:45 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id z24sm225858qkz.65.2021.04.08.12.43.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:43:44 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
Date: Thu, 8 Apr 2021 15:43:43 -0400
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
To: Gerd Hoffmann <gerd@kraxel.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
In-Reply-To: <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
Message-Id: <C055FBC4-09F8-4057-9742-99C660F97607@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82e.google.com
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



> On Apr 8, 2021, at 7:05 AM, Gerd Hoffmann <gerd@kraxel.org> wrote:
>=20
>  Hi,
>=20
>>> Those might be a good place to start. IOKit provides the drivers and
>>> also the io registry which is probably where you can get if a driver
>>> is bound to a device and which one is it. How to dissociate the
>>> driver from the device though I don't know.
>=20
>> =
https://developer.apple.com/library/archive/documentation/DeviceDrivers/Co=
nceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
>=20
>> According to this article a driver has a stop() and detach() method
>> that is called by the IOKit to remove a device. I'm thinking QEMU can
>> be the one that calls these methods for a certain device.
>=20
> libusb should do that.  Interfaces exist already (see
> libusb_detach_kernel_driver & friends) because we have the very same
> problem on linux.
>=20
> take care,
>  Gerd
>=20

The questions that come to mind are:
- Does libusb_detach_kernel_driver() work on Mac OS?
- Is libusb_detach_kernel_driver() called on Mac OS in QEMU?

The only mention of this function in QEMU comes from host-libusb.c.=20

After some tests I found out the function =
host-libusb.c:usb_host_detach_kernel() is being called on Mac OS 11.1. =
It never reaches the libusb_detach_kernel_driver() function. It stops at =
the continue statement. Here is the full function:

static void usb_host_detach_kernel(USBHostDevice *s)
{
    printf("usb_host_detach_kernel() called\n");
    struct libusb_config_descriptor *conf;
    int rc, i;

    rc =3D libusb_get_active_config_descriptor(s->dev, &conf);
    if (rc !=3D 0) {
        printf("rc !=3D 0 =3D> %d\n", rc);
        return;
    }
    for (i =3D 0; i < USB_MAX_INTERFACES; i++) {
        rc =3D libusb_kernel_driver_active(s->dh, i);
        usb_host_libusb_error("libusb_kernel_driver_active", rc);
        if (rc !=3D 1) {
            if (rc =3D=3D 0) {
                s->ifs[i].detached =3D true;
            }
            printf("rc !=3D 1 =3D> %d\n", rc);
            continue;
        }
        trace_usb_host_detach_kernel(s->bus_num, s->addr, i);
        rc =3D libusb_detach_kernel_driver(s->dh, i);
        printf("libusb_detach_kernel_driver() called\n");
        usb_host_libusb_error("libusb_detach_kernel_driver", rc);
        s->ifs[i].detached =3D true;
    }
    libusb_free_config_descriptor(conf);
}


Next to the continue statement in the loop is where my printf function =
says that rc is equal to 0. So it looks like =
libusb_kernel_driver_active() may have an issue since it sets the rc =
variable. Later on I will try to figure out what is happening here.






