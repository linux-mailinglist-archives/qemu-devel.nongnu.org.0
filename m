Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C16F35F5C4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:05:36 +0200 (CEST)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWg98-0004nW-Ko
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lWg7W-00047L-Sw
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:03:54 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lWg7R-0007bI-QZ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:03:54 -0400
Received: by mail-qk1-x730.google.com with SMTP id d15so8488899qkc.9
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qfca7NWD57QLTw3zgzHdGKm4CQ/mIXQ2cfxPjqE8QFE=;
 b=s25cqDQ9BG/jn6iVuFG8z5YyNAlHwOxe0W2yVE1KklciTdU/Y/XO4FUIirpSY0ifos
 zI9vcPdahODgCVBLTSkZKhW8kMN0sAium+iB/lBAYjaznZk5moUmxXBO/Kf5DjQz2sZo
 o8A0FDmWQA11b/X8glhG/b4ET+GMU3o1eIQ8Yc7k0q9d4bMlh3CMxgLm/MttRL6jSpYF
 kf6Q9jHpgKjrpQJJ2vuFUqa5JWhPc8T8JQCYBJUVwiKjcAO+lNbsZTAIWQzOSNBnYiS4
 BiftXynVMZhOoYQ6qq278nBZdRLD0Jw/RHD1L9ZZRaqlKa8Ga53WrxrAM1JQrKIRarMI
 9GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qfca7NWD57QLTw3zgzHdGKm4CQ/mIXQ2cfxPjqE8QFE=;
 b=M6sIV1p442oX3buzeh3XQ6o0s/wLRnP7DqijOdnO/9BmgHOBi1FTbfK6tjn1ZydoVm
 tebq/tzldfkO918N8O+O1okHUaouWDX3rDDGaGJx0oGn6O2AtL/MSA+K8cpE/aKIyFsK
 9mo/fc2SMrjT4byXtcDanlBQ22edrgWeEDKqRqvfWyrDvarukXCe5OAflXktQVY6VeDr
 yf48JUok5mxfTRAuf/bQEAKOuf8J9BeIH67gAW5cO4rcAvLvFvSE8zXBKXh+36N0Advs
 nNK+ke+zqUerSEJtmHAFXQj+CoEUK7ULQ7vt21qbemMfOjlLFXzilbqgBjExoidtuIcD
 1lhw==
X-Gm-Message-State: AOAM531i8pMk8ra2La7eOwUM8EpUACQojiqlk5QaBsGY2yhMExZohm17
 lFsyonYu+MHv4HdWV+0vtYE=
X-Google-Smtp-Source: ABdhPJwEA595JJiQg5z8NcGt8kyg3g8pVjOYKXtrv1q+A/Z/ekto7EXzhYb80NfC5GN6Z4cNOLqbqg==
X-Received: by 2002:a37:9ec9:: with SMTP id
 h192mr19319852qke.119.1618409027746; 
 Wed, 14 Apr 2021 07:03:47 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id p5sm12287644qkj.35.2021.04.14.07.03.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Apr 2021 07:03:47 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210409080804.vs2r546gy3ntdmgr@sirius.home.kraxel.org>
Date: Wed, 14 Apr 2021 10:03:45 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F8803E0-D336-4B36-AC0B-7824678E7C52@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
 <C055FBC4-09F8-4057-9742-99C660F97607@gmail.com>
 <20210409080804.vs2r546gy3ntdmgr@sirius.home.kraxel.org>
To: Gerd Hoffmann <gerd@kraxel.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 9, 2021, at 4:08 AM, Gerd Hoffmann <gerd@kraxel.org> wrote:
>=20
>  Hi,
>=20
>> The questions that come to mind are:
>> - Does libusb_detach_kernel_driver() work on Mac OS?
>> - Is libusb_detach_kernel_driver() called on Mac OS in QEMU?
>>=20
>> The only mention of this function in QEMU comes from host-libusb.c.=20=

>>=20
>> After some tests I found out the function
>> host-libusb.c:usb_host_detach_kernel() is being called on Mac OS =
11.1.
>> It never reaches the libusb_detach_kernel_driver() function. It stops
>> at the continue statement.
>=20
> Yep.  Most likely libusb_kernel_driver_active() returns 0 because the
> kernel driver management functions are not implemented for macos.
>=20
> take care,
>  Gerd
>=20

I was wondering about the usb_host_detach_kernel() code. It iterates =
thru interface 0 to 15. Why does it stop at 15? Isn't possible to have =
up to 255 interfaces?=

