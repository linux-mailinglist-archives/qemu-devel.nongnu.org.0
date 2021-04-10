Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86435ACF5
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 13:31:19 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVBpe-0005zj-97
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 07:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lVBnc-00059Z-P8
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 07:29:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lVBnZ-00009X-Jh
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 07:29:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4571E746358;
 Sat, 10 Apr 2021 13:29:03 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1DFA4746357; Sat, 10 Apr 2021 13:29:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1C059746354;
 Sat, 10 Apr 2021 13:29:03 +0200 (CEST)
Date: Sat, 10 Apr 2021 13:29:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Mac OS real USB device support issue
In-Reply-To: <CABLmASEPFVDejmfJw-Ak1_veREySYv8F-+ZKW_S2cDsEbfu7Gg@mail.gmail.com>
Message-ID: <8827217c-8fee-7845-045-16ff9622d90@eik.bme.hu>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
 <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
 <F6C716CC-E058-4C70-A06F-FC0655516A1D@gmail.com>
 <CABLmASEPFVDejmfJw-Ak1_veREySYv8F-+ZKW_S2cDsEbfu7Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Apr 2021, Howard Spoelstra wrote:
> On Fri, Apr 9, 2021 at 9:37 PM Programmingkid <programmingkidx@gmail.com> wrote:
>> Have you tried the proposed changes yet for libusb?
>
> Hi,
>
> Yes, I experimented with the current libusb from brew, the latest
> libusb code from github and a patched version based on that. I
> couldn't get a flash drive passed through with any of them. Running as
> root made no difference. My Mojave host doesn't allow unloading the
> kext loaded for the flash drive where Sierra allowed that, but then
> that should be handled by the patches.
>
> I'll link to the latest libusb and the patched version plus the
> patches. I guess it will not work on your host, but you might be able
> to persuade qemu to use them by using
> install_name_tool -change /usr/local/opt/libusb/lib/libusb-1.0.0.dylib
> @executable_path/libusb-1.0.0-latest.dylib qemu-system-ppc
>
> I'll also include the patches, libusb is easily built.
> https://surfdrive.surf.nl/files/index.php/s/Qs0rtTVe2qIudw4/download

I think you (John and Gerd) found that detecting if a kernel driver is 
attached does not seem to work so it does not even get to unloading what 
these patches are about I think. So you first need to debug and fix 
libusb_kernel_driver_active() so the unloading function is called at all. 
I don't know how that's done on macOS but maybe querying the IO registry 
somehow that should have all info about devices and IOKit drivers.

Regards,
BALATON Zoltan

