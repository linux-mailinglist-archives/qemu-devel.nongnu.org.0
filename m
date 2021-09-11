Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EE9407900
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 17:12:15 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP4ft-0006dZ-8J
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 11:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mP4en-0005xf-35
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:11:05 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mP4el-0002co-9B
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:11:04 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id gf5so3234605qvb.9
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rGMJtiZpRWAlIo2fQ6JTsqtY6IChkW8yGCeCULfdpaA=;
 b=NTdRjl9xQjVz4PtJAGER5p40OPWg382XO1skcB+I72ejk5rUNZDwo03LfR9q3k0lLQ
 D+E/3Wj4dKM+nomDAjPA7OaduDxiZ1Uglo9YiJpUnBYrH7jT84Y1ibkKk59/zerAUUWQ
 g+kvk/vTcKYMlPLvvBqXJfTKUXbGt9KZj3JgXcxE4i9rMw+wIE/BY3exDTKAAk2PkTMM
 7lIopb3z7L72RsHOse8aQ9ZuUl7FZ0ULiwpE4jKY8FK3p8CLbiQnwL+CgZbVF08b1Wy8
 55nE5mq/5y6Mj79DonBziXUD+tytCjGqdZfvoYcDA0YAtBJJPfobSlLkGybSLeirr34+
 4pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rGMJtiZpRWAlIo2fQ6JTsqtY6IChkW8yGCeCULfdpaA=;
 b=uCpLaDQMkdvulxsraISgmCH9dOBi4FFJbAJ6T3uz+wLVHJP3/uStD4KOlGBaPJiBiI
 cVdzzdx4CNqy7NnXzCcTxIkDO/vaJmBYXst2iPmFfs0x/3JrXgdF/zOP0KY4JTDs9v27
 op4una4NpobrLEAWV5A52Il6nSEU5ff88Wn47G+YYYXlMWP03sl7+SkL0bLBQ/mu9BQZ
 7kUfXuIiSIGEPBQ9JofYPJwc1opHshc1Z72mqMKdXD7JAuHi3Eh0gQRY1BDI+yBg73LX
 3WmLlPMgtvKVKRvYFsJJzoPA+EWbkzKSdVISMSY40tRKOwSSbv59HNJE1+KJD6Vkja7q
 MCVA==
X-Gm-Message-State: AOAM5333Mbmu4kpGJxksZsBBBDERFobaeMTgIREEGNsJpp65a1ZjOotk
 dTKpsEMKvtQuw8HQc+B5aGw=
X-Google-Smtp-Source: ABdhPJxWa3hPdAXt5T7nWIBS5UGQgQhFXHOcOrqnRyBOR5qVNVN3ZiRYN+iv4Sd4ZgGEoffMvSNIdg==
X-Received: by 2002:a05:6214:10c4:: with SMTP id
 r4mr2738816qvs.58.1631373061525; 
 Sat, 11 Sep 2021 08:11:01 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 191sm1382562qkh.81.2021.09.11.08.11.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Sep 2021 08:11:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CABLmASEN5DVvpHxUSTb=iY3t2ArMGUxru6ShnAtDf2HhHaNBzg@mail.gmail.com>
Date: Sat, 11 Sep 2021 11:10:59 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <51A7F6D6-8A34-4E65-9264-DB91DE06387B@gmail.com>
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
 <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
 <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
 <aa588212-b557-223c-cf85-4c97b7d71cfa@eik.bme.hu>
 <FA5C1048-9BE4-460B-B5C6-F8AEAB0FD2E1@gmail.com>
 <CABLmASEN5DVvpHxUSTb=iY3t2ArMGUxru6ShnAtDf2HhHaNBzg@mail.gmail.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 11, 2021, at 5:46 AM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>=20
>=20
>=20
> On Fri, Sep 10, 2021 at 9:23 PM Programmingkid =
<programmingkidx@gmail.com> wrote:
>=20
>=20
> > On Sep 10, 2021, at 7:51 AM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
> >=20
> > On Fri, 10 Sep 2021, Howard Spoelstra wrote:
> >> On Fri, Sep 10, 2021 at 7:07 AM Gerd Hoffmann <kraxel@redhat.com> =
wrote:
> >>=20
> >>> On Thu, Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:
> >>>> Hi Gerd,
> >>>>=20
> >>>> Howard and I were talking about USB audio problems with Mac OS =
guests.
> >>> We think the issue might be with frames being sent to the USB =
audio card
> >>> too soon. My guess is only one frame is suppose to be transmitted =
every 1
> >>> millisecond. I was also reading the todo notes in the file =
hw/hcd-ohci.c.
> >>> This is what it says:
> >>>>=20
> >>>> * TODO:
> >>>> *  o Isochronous transfers
> >>>> *  o Allocate bandwidth in frames properly
> >>>> *  o Disable timers when nothing needs to be done, or remove =
timer usage
> >>>> *    all together.
> >>>> *  o BIOS work to boot from USB storage
> >>>> */
> >>>>=20
> >>>> Do you think implementing isochronous transfers would fix the =
audio
> >>> problems Mac OS guest are experiencing?
> >>>=20
> >>> Most likely yes, audio devices typically use iso endpints.
> >>>=20
> >>> take care,
> >>>  Gerd
> >>>=20
> >>=20
> >> Hi,
> >>=20
> >> Below I pasted the first lines mentioning isochronous traffic from =
a pcap
> >> file when running fedora12 with the usb-audio device and the first =
lines
> >> from a pcap file running Mac OS 9.2 with the usb-audio device
> >>=20
> >> Fedora:
> >> 91 56.715001 host 0.5.1 USB 256 URB_ISOCHRONOUS out
> >> 92 56.715018 0.5.1 host USB 64 URB_ISOCHRONOUS out
> >>=20
> >> MacOS:
> >> 143 56.031989 host 0.16.1 USB 256 URB_ISOCHRONOUS out
> >> 144 56.032026 0.16.1 host USB 64 URB_ISOCHRONOUS out
> >>=20
> >> The usb-audio device works for the fedora guest, so would this not =
indicate
> >> that the iso endpoints are already working?
> >>=20
> >> The usb-audio device also work (for a limited amount of time) when =
running
> >> MacOS. Looking at USB logging in the Mac OS guest, to me it seems =
the MacOS
> >> side runs into timing issues when packages drift too far apart. It =
then
> >> finally gives up trying to keep the stream open.
> >=20
> > I was also trying to find why the usb-audio device does not work =
with MorphOS but I could not figure it out. Now I have two machines =
(mac99 and pegasos2) that can boot MorphOS but usb-audio does not work =
with either so maybe it's not because of the USB controller. I've found =
there is a debug property that enables some logging: -device =
usb-audio,debug=3D1 but that did not reveal much more. It looks like =
MorphOS tries to query the device but replies come very slow (not sure =
if that's normal or a problem) then just gives up after a while. Maybe =
you can try comparing what Fedora and other OSes query as it may be =
we're missing some info in USB descriptors that other drivers than =
Linux's rely on but that's just a guess I haven't tested with Linux =
guest on pegasos2 or mac99 yet.
> >=20
> > Regards,
> > BALATON Zoltan
>=20
> Thank for the info everyone. When I try to use the USB-Audio device in =
Mac OS 10.4.11, the operating system doesn't use it. It does show up in =
the System Profiler application. In Mac OS 9.2 the sound from it is =
perfect sounding, but the operating system crashes after less than a =
minute. In Mac OS 10.2.3 the operating system does set it as its output =
device but it does not work.
>=20
> To find out what is wrong we would probably have to build the USB =
audio drivers in Mac OS X and enable debug output to see what is wrong. =
They are open source and I have done this in the past. As for Mac OS 9, =
I'm not sure how to debug its driver.
>=20
> See the screen shot attached for the warnings about timing in MacOS =
9.2 before the stream collapses.This was after some system sounds were =
played successfully.
> <usb-audiolog.png>
> Best,
> Howard

So the question to answer is what is the wr gap?=

