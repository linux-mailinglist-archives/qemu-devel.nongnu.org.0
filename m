Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B63556AD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:32:30 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmkn-0005bC-5G
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTmjc-0005BD-BZ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:31:16 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTmja-0004fY-Lu
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:31:16 -0400
Received: by mail-qt1-x836.google.com with SMTP id h7so11291347qtx.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jHvGxyieXBqQTKBYzTPDEVQuk74DOrsUq4R/fvXoj9k=;
 b=mvSvwXIwhsqoRNGnQskoMm7c7mhUXLL91hXiJ+NJbskMK0fyed41Ou/Dw32YsQ5DjS
 1LZ5loSouRHvqcHkEGUIgh2UYX2QOVuSpuaLJLmpv4XpUSU7LIWXO6Q/EHCwqF2/I5Aw
 jHBgtZHPRv3s+0ASLW8str0mcL5yT006GSmnwulM50Fl0Z+G07HrxHq9frQ6tejiw4Dz
 Zf1/IbeY/TnrIZIKwQbuQzQE6JVqhkU4KJ2N6mlkb2KfkKYIcP84Vw1OPpd6H6meq/Ra
 TlRFHol7N4TlQI63U+PiWnKSzOQ/TNtdtHJbhFv0Dt7gG2Ahds/FA5zsbiVButb4UGpy
 bLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jHvGxyieXBqQTKBYzTPDEVQuk74DOrsUq4R/fvXoj9k=;
 b=WY4VlO0wJcTwOTkYvR6UGBKQEH4NMwZ6IAshCLSn3xAJwOzMC19a2uu5QXSuX0TjyM
 jUKiXtINnI04cnUWo+u22V/rhnVBCerFouXaIAGTQd07im/qb9e9PcUEz7Q13mPV92AP
 eoLz4O8yl2oHGCCmcFmCwD1Md7hZdx4vxpok3hV/dQoQsZvg1alzyadHPyVP1zxtJXoE
 6Zbr7uRRjofxdLnu3ar2HJzfo9Y+vITmL5j/qP+EOs/+s5rNz7Tbh4u7aJtwJNdPwCK/
 NeqEnuWdQpsy8R9ARpJzY0k2Cy8BY7fCccsPuC35dp3SuLe+KU5kM1dTzT40Jox9PBLY
 ZGAA==
X-Gm-Message-State: AOAM530dE7Pc+420sZ8j7F9ouM51w23UXS+SBCHs1gAd6UrCqrWHrtAS
 80lad4GmCiRqVT1I9D000KM=
X-Google-Smtp-Source: ABdhPJzCaVLstKQL9kA5Jscs21mENtBTRTVtP5pahWiQ2TV/DQFOBBqBidZgEWTuswyq9wc2nZdb2Q==
X-Received: by 2002:ac8:424d:: with SMTP id r13mr27165180qtm.196.1617719473221; 
 Tue, 06 Apr 2021 07:31:13 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id m25sm14810247qtq.59.2021.04.06.07.31.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:31:12 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
Date: Tue, 6 Apr 2021 10:31:11 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x836.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>=20
> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>> Hi Gerd,
>>=20
>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine =
to test USB support. I am on Mac OS 11.1 and cannot make USB devices =
work with any of my guests. So far these are the guests I have tested =
with:
>>=20
>> - Windows 7
>> - Mac OS 9.2
>> - Windows 2000
>>=20
>> I have tried using USB flash drives, USB sound cards, and an USB =
headset. They all show up under 'info usb', but cannot be used in the =
guest. My setup does use a USB-C hub so I'm not sure if this is a bug =
with QEMU or an issue with the hub. Would you have any information on =
this issue?
>=20
> Hi John,
>=20
> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
> not support USB 2.0. I was successful only in passing through a USB
> flash drive that was forced into USB 1.1 mode by connecting it to a
> real USB 1.1 hub and unloading the kext it used.
>=20
> Best,
> Howard

Hi Howard, I was actually thinking about CC'ing you for this email. Glad =
you found it. Unloading kext files does not sound pleasant. Maybe there =
is some better way of doing it.=20

Thanks.

Currently there doesn't appear to be a single page with info on how to =
use USB devices in QEMU with a Mac OS host. Hopefully when I have =
collected enough information I can make one.=

