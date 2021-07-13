Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEB3C72BD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:00:48 +0200 (CEST)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jtv-0004mI-Ip
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3JsU-0003xy-T1
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:59:18 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3JsS-0001gH-93
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:59:18 -0400
Received: by mail-qt1-x832.google.com with SMTP id r17so5894297qtp.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=t2jLvkA/02G8F0BL54HH5TZC/6hLYM02RizDFZZna/c=;
 b=WZMZAGshujSqDhgn0+4yHZpAZhPpQD9CrH5E/iaxLUvZgaOdsL30zHr3iqHZet2dkH
 q/eJIiH5nHRdZB+sJ/3DCd6G1fVgsjUfeLbRRCFoYpTx4k99EiV9Dh+zOMxsGKR6VOe0
 Nw23U/4n9UGZjVT6Ax22OANEUlUFWNzJmO8fa8LBMQB5lN9yTzF/tf4m5+33lx0ol03S
 syzeUd4nkcGGEf4NskbB/PJAnl0zJHS9racCHJL/ZYz9rChr0ErNcc1ufqTT/duQUsKh
 jJo/IWbYVBSiMgc87WaFS3C+I6a/TIYiTUWRD6p2y1jAnwF6V1HdA6VUTuQ7YfShXs3Z
 jLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=t2jLvkA/02G8F0BL54HH5TZC/6hLYM02RizDFZZna/c=;
 b=bcRtfRqLsWpmlcPyUVm7qCb0bWxik6V7rPLQAfLf4faAmvATfEyB8pQKZYSYSUI7XW
 gbhOI3xB2rfpovgZ1eg7wNFXACWhaa9R22D4kaUYhzzqP3zpaXcvI5WlgQwxWLNKDbMf
 zbsk6pBzH+QgfpR6rkrc/RFHqd+8mImB5jh5kUgG8x/CYcPzvyZaMnuvDLV3XNRKzJEu
 ZRALa03NCCXUnRRLN1Qnz8gdeCF9fxWy6MODDsFdk820GX1e987o40RFqdk+1RJrGD2S
 W6t7Ko2spgIOML4lRsPweZ/GHmpM11r3BMLhJMVhbE5sBictsrbSCxKZ4uCT2G5gVcmj
 XOaw==
X-Gm-Message-State: AOAM532mLql+sfIE7buw6qF0syo/4Nvf0yKhyEaG17OY0eLfh4XQEhtS
 JPuZ1NuJ8swA5CE/L/1Aixk=
X-Google-Smtp-Source: ABdhPJxEZML/DqbwPA/pP8yqMbc1NSXYKoBxb6p1iK/qLkTeVVt9G8DBbNXi0AtBVvEOSFpejwv9Rw==
X-Received: by 2002:a05:622a:1a97:: with SMTP id
 s23mr4421040qtc.75.1626188355354; 
 Tue, 13 Jul 2021 07:59:15 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id d21sm8022707qkl.42.2021.07.13.07.59.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 07:59:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: usb-host device not working
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <YO2pPp1awcCXVZUZ@redhat.com>
Date: Tue, 13 Jul 2021 10:59:13 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB33144A-3F1D-4255-8217-3AA542519C34@gmail.com>
References: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
 <YO2pPp1awcCXVZUZ@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 13, 2021, at 10:54 AM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Tue, Jul 13, 2021 at 10:49:12AM -0400, Programmingkid wrote:
>> I have been having problems with using host USB devices lately. I use =
to be able to use host USB devices but can't currently. After doing some =
git bisecting I found it was this patch that causes this issue:
>>=20
>> commit 627302afb2f85cdd4b59595361876487aef19b7a (refs/bisect/bad)
>> Author: Gerd Hoffmann <kraxel@redhat.com>
>> Date:   Thu Jun 24 12:38:35 2021 +0200
>>=20
>>    usb: build usb-host as module
>>=20
>>    Drop one more shared library dependency (libusb) from core qemu.
>>=20
>>    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>    Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
>>    Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
>>    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>=20
>> I build QEMU like this:
>>=20
>> ./configure --target-list=3Di386-softmmu --enable-libusb && make -j 9
>>=20
>> This command use to work but fails now with the above commit:
>>=20
>> qemu-system-i386 -usb -device =
usb-host,vendorid=3D0x093a,productid=3D0x2510
>>=20
>> I think this is a bug with the commit. Any suggestions?
>=20
> It'll be helpful to explain what kind of failure you observe, =
including
> any exact error messages seen ?=20
>=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20

Sure, here is what I see:

qemu-system-i386: -device usb-host,vendorid=3D0x093a,productid=3D0x2510: =
'usb-host' is not a valid device model name



