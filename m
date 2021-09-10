Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF64071CF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:24:39 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOm8c-0001hY-07
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mOm7Y-00010o-Vf
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:23:33 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mOm7W-0003O7-Ki
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:23:32 -0400
Received: by mail-qt1-x830.google.com with SMTP id u21so2452915qtw.8
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=djguZWny067urxkcR5EKVgvH3v/JG75PvVtmfFtp/5M=;
 b=H5gjMwUGo6Ge6g/ijmtPzefC7wlODs8IaGcrTiqTjAIMSAv5F3hXth7h83ViMTd7Ud
 /W5+CmjYEdOkJNY1FcXDc0ElqGvCjoo2ggNLr0NMeWf1iz3s5htvIp6ThgPkfamrawiT
 WWUIf6YsSTE1WEH1XZLPKSfpiZn9VmLVyFeJJlcnvIIYPwGo4SbVcu9Qrog3J8GMAq4Y
 8tzDg0qnC4Pmclfr5RF6/JdWGTJX5b8yzENnZVzTFsioBuPANhDydJsXrQvh3hTgBQ4P
 r5u8z4hmJrtaAIIBjmGS80Xk1nVKIgOQ6qOzxnQ5O6ECOLB6a8gQbMkVcTFhG7tLcfl9
 6Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=djguZWny067urxkcR5EKVgvH3v/JG75PvVtmfFtp/5M=;
 b=cttbbv5V2eBj4w3aezuJVAOXsBPe8+DrQCYJWlRDZ/SUDZbyAN0oY73FK0Gc0/58yS
 ojCUwmJBOCMcWVCV36ZA9662S0QxjJL3kLhE7ehInljz7lfNRGiDeQMN5Aifl1s5ynjO
 80XF2S5m7lbjO+jJYaSEH2IFWzso4gjVpK/JQuW11f8uqQY7Gv1vJpc7EeM6Xa+Bsyj6
 JVQbQYYLiEQl8/OJuDUT3USHM41QHaF+T+LYfMevDYQjDC+SjzN8nLRAWfyXk4JLryKg
 DNLO9S9s9W5QB26hVWRJXol1bQdwGhuJWCnQnz7KPg5/V6Q5P5y3I8WwJl3cOk7xYgcb
 57Gg==
X-Gm-Message-State: AOAM531Qx4GFXJgyq6gMo14JAhT6r0dF1JjLw67luH1pUgnIp2yo6odP
 Oy91kREx4gkNnlkCw2v3Q9Q=
X-Google-Smtp-Source: ABdhPJxEg9zGN5wfdylX4CLjh9+spcDTU54C0oiP2DfkH+1W7b1QSjjQXRUcifLUGn6J7Gq/KMC1Ww==
X-Received: by 2002:a05:622a:1a24:: with SMTP id
 f36mr9629451qtb.294.1631301809806; 
 Fri, 10 Sep 2021 12:23:29 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 9sm3800997qtz.83.2021.09.10.12.23.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:23:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <aa588212-b557-223c-cf85-4c97b7d71cfa@eik.bme.hu>
Date: Fri, 10 Sep 2021 15:23:27 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA5C1048-9BE4-460B-B5C6-F8AEAB0FD2E1@gmail.com>
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
 <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
 <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
 <aa588212-b557-223c-cf85-4c97b7d71cfa@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x830.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 10, 2021, at 7:51 AM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
> On Fri, 10 Sep 2021, Howard Spoelstra wrote:
>> On Fri, Sep 10, 2021 at 7:07 AM Gerd Hoffmann <kraxel@redhat.com> =
wrote:
>>=20
>>> On Thu, Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:
>>>> Hi Gerd,
>>>>=20
>>>> Howard and I were talking about USB audio problems with Mac OS =
guests.
>>> We think the issue might be with frames being sent to the USB audio =
card
>>> too soon. My guess is only one frame is suppose to be transmitted =
every 1
>>> millisecond. I was also reading the todo notes in the file =
hw/hcd-ohci.c.
>>> This is what it says:
>>>>=20
>>>> * TODO:
>>>> *  o Isochronous transfers
>>>> *  o Allocate bandwidth in frames properly
>>>> *  o Disable timers when nothing needs to be done, or remove timer =
usage
>>>> *    all together.
>>>> *  o BIOS work to boot from USB storage
>>>> */
>>>>=20
>>>> Do you think implementing isochronous transfers would fix the audio
>>> problems Mac OS guest are experiencing?
>>>=20
>>> Most likely yes, audio devices typically use iso endpints.
>>>=20
>>> take care,
>>>  Gerd
>>>=20
>>=20
>> Hi,
>>=20
>> Below I pasted the first lines mentioning isochronous traffic from a =
pcap
>> file when running fedora12 with the usb-audio device and the first =
lines
>> from a pcap file running Mac OS 9.2 with the usb-audio device
>>=20
>> Fedora:
>> 91 56.715001 host 0.5.1 USB 256 URB_ISOCHRONOUS out
>> 92 56.715018 0.5.1 host USB 64 URB_ISOCHRONOUS out
>>=20
>> MacOS:
>> 143 56.031989 host 0.16.1 USB 256 URB_ISOCHRONOUS out
>> 144 56.032026 0.16.1 host USB 64 URB_ISOCHRONOUS out
>>=20
>> The usb-audio device works for the fedora guest, so would this not =
indicate
>> that the iso endpoints are already working?
>>=20
>> The usb-audio device also work (for a limited amount of time) when =
running
>> MacOS. Looking at USB logging in the Mac OS guest, to me it seems the =
MacOS
>> side runs into timing issues when packages drift too far apart. It =
then
>> finally gives up trying to keep the stream open.
>=20
> I was also trying to find why the usb-audio device does not work with =
MorphOS but I could not figure it out. Now I have two machines (mac99 =
and pegasos2) that can boot MorphOS but usb-audio does not work with =
either so maybe it's not because of the USB controller. I've found there =
is a debug property that enables some logging: -device usb-audio,debug=3D1=
 but that did not reveal much more. It looks like MorphOS tries to query =
the device but replies come very slow (not sure if that's normal or a =
problem) then just gives up after a while. Maybe you can try comparing =
what Fedora and other OSes query as it may be we're missing some info in =
USB descriptors that other drivers than Linux's rely on but that's just =
a guess I haven't tested with Linux guest on pegasos2 or mac99 yet.
>=20
> Regards,
> BALATON Zoltan

Thank for the info everyone. When I try to use the USB-Audio device in =
Mac OS 10.4.11, the operating system doesn't use it. It does show up in =
the System Profiler application. In Mac OS 9.2 the sound from it is =
perfect sounding, but the operating system crashes after less than a =
minute. In Mac OS 10.2.3 the operating system does set it as its output =
device but it does not work.

To find out what is wrong we would probably have to build the USB audio =
drivers in Mac OS X and enable debug output to see what is wrong. They =
are open source and I have done this in the past. As for Mac OS 9, I'm =
not sure how to debug its driver.=20=

