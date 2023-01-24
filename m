Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C5678DB7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 02:50:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8RJ-0005cy-Ga; Mon, 23 Jan 2023 20:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK8RG-0005cf-K8; Mon, 23 Jan 2023 20:49:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK8RE-00012x-5P; Mon, 23 Jan 2023 20:49:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EA5D0746376;
 Tue, 24 Jan 2023 02:47:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B2A5974635C; Tue, 24 Jan 2023 02:47:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B0ACF746346;
 Tue, 24 Jan 2023 02:47:00 +0100 (CET)
Date: Tue, 24 Jan 2023 02:47:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
Message-ID: <8e6f46fb-5e1b-8016-c595-85e8e83ace47@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
 <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> From a Mac OS guest perspective, via=cuda is needed for Mac OS 9.0.4 due to
> the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would be
> that these suffer the same usb issue)
> The real powermac3,1 AGP has no adb.

And do these OSes run on real PowerMac3,1? If so then we likely have a bug 
in USB emulation so maybe that could be fixed? In any case my patch does 
not change mac99 and this should continue to work.

> via=cuda supports Mac OS 9.0.4 up to OS X 10.4. via=pmu is strictly only
> needed for Mac OS X 10.5 guest (for which the speed reported was hacked to
> 900Mhz to fool the installer), but should support all Mac OS/OS X that are
> now supported.

Since via=pmu is what should be a real machine does it run OS X >=10.2 
already?

> via=pmu-adb seems only needed to trick mac os server installations that
> would later run on the g3beige.
>
> To my knowledge 32 bit Linux guests all require via=pmu
> See here: https://wiki.qemu.org/Documentation/Platforms/PowerPC

That doc might need some updating. It seems to be from before pegasos2 was 
added. Maybe we would be better off linking from this page to others that 
are more actively maintained such as: 
https://www.emaculation.com/doku.php/qemu 
and 
http://zero.eik.bme.hu/~balaton/qemu/amiga/

or even better updating the main docs in

https://www.qemu.org/docs/master/system/ppc/powermac.html

or somehow link these sources together.

Regards,
BALATON Zoltan

