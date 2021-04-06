Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8C3556B7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:34:58 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmms-0006aJ-4T
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTmlc-0006BK-1a
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:33:20 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTmla-0005uu-Fj
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:33:19 -0400
Received: by mail-qt1-x833.google.com with SMTP id y12so11264494qtx.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fINe4mBEKqvmhM8WH5QAcUcpBxaIoiUz/XmsfBdYNsI=;
 b=r9dl88MqbZfSdru+lpDMQ+XkoOt/5sPw7pPoBhg4ULWJCBqGklOFyEAucXEb1GGlF2
 GGVFIyJPJTcEaBu+At4dVfJuYdBuuYEZQR5jRMZ/3QUvqj/DpPvZPp9Q89bFCGckcRXB
 NaFSYxLfJefj2CiZiCPljqPoYPeI9CU4aKJ1DqfJaqrSH4PFIP0VMuB1sEQw9aoSfUz2
 ZbODvUpkwWswKc0xkxa4KJ6wo5ZDQP9fF4FqReU4o40W91DPERmbIrwyo/eE3zGs+ymc
 /GINHBmewa8bKrCtJ7pCKMBDAt7W8usZODms3XKDO6pPmBDfPQhuk14+xYJpEoR4pfFf
 s7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fINe4mBEKqvmhM8WH5QAcUcpBxaIoiUz/XmsfBdYNsI=;
 b=Z7gwp8QGWzmyZBqkEVRKYrvm/0rrEEbMWa9QZ4kkY3hR6qYVg8BNBMNBepE0haCUAx
 09+vhhotMCi2gHej8LDvpkQiPlBgIt8YFYAttN3p5hsYvjIu8IBTfdeSL5Uil0TpUy3v
 H+olLV0HWuWNh0J8m07j14XqA29ScciyNfIPBqXyrXBXBYFZ2TZxsswIdlkcMq46hG1J
 PsZTxpSjoK1gP1Gr+txJ+WRo+GWx8w+sY9P9Y0182TlqPaRhcNAuX6mVtxKMwygx46xY
 c+HQ+o0J7vaVzDK4ZuLt8H1iYFG3g6sUgYBAtP2568e4e+zl2s1QRNthrKe0f50wokq1
 uVDQ==
X-Gm-Message-State: AOAM533xpQjlUEwnw+lnlHyTnCdvYZZ3AnCdtuCLwdJXiCjpYbfCoPOv
 EQomj9/iszCB12AS5Gc/DaI=
X-Google-Smtp-Source: ABdhPJyHjPziU+EGkqaR+HSeX6ID5OnkekdLKBXN+HlO0dWlM24Y2BPEasWMpg/rymjhwz//eKHdyQ==
X-Received: by 2002:ac8:5142:: with SMTP id h2mr10461920qtn.166.1617719597462; 
 Tue, 06 Apr 2021 07:33:17 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id z17sm5544983qtf.10.2021.04.06.07.33.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:33:16 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <97cddc56-1b13-dab4-33d8-5fdaeae575d7@eik.bme.hu>
Date: Tue, 6 Apr 2021 10:33:15 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <36BCBE7F-7369-4893-BBC7-CD0AFBC9F510@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <97cddc56-1b13-dab4-33d8-5fdaeae575d7@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x833.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 6, 2021, at 10:20 AM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
> On Tue, 6 Apr 2021, Howard Spoelstra wrote:
>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>=20
>>> Hi Gerd,
>>>=20
>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 =
machine to test USB support. I am on Mac OS 11.1 and cannot make USB =
devices work with any of my guests. So far these are the guests I have =
tested with:
>>>=20
>>> - Windows 7
>>> - Mac OS 9.2
>>> - Windows 2000
>>>=20
>>> I have tried using USB flash drives, USB sound cards, and an USB =
headset. They all show up under 'info usb', but cannot be used in the =
guest. My setup does use a USB-C hub so I'm not sure if this is a bug =
with QEMU or an issue with the hub. Would you have any information on =
this issue?
>>=20
>> Hi John,
>>=20
>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
>> not support USB 2.0. I was successful only in passing through a USB
>> flash drive that was forced into USB 1.1 mode by connecting it to a
>> real USB 1.1 hub and unloading the kext it used.
>=20
> I think USB passthorugh works in VirtualBox on macOS so maybe you =
could check how that works there and what might need to be done for it. =
Although I'm not sure if it's in the open source part or in the non-free =
extensions so may not be that easy to find out what's needed if the =
sources for it are not available.
>=20
> Regards.
> BALATON Zoltan

Excellent idea.


