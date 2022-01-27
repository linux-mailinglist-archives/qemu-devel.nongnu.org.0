Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89049EEAB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 00:12:52 +0100 (CET)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDwg-0003Xo-Q5
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 18:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDru-0001jk-KB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:07:54 -0500
Received: from [2001:738:2001:2001::2001] (port=28430 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDrs-0007GT-5L
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:07:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 480BE746369;
 Fri, 28 Jan 2022 00:07:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2F8697457EF; Fri, 28 Jan 2022 00:07:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2E7CD7456E3;
 Fri, 28 Jan 2022 00:07:48 +0100 (CET)
Date: Fri, 28 Jan 2022 00:07:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Mouse pointer warping with gtk display
In-Reply-To: <05fe1a3d-59f4-391c-4d1c-fd94c5c92fd7@ilande.co.uk>
Message-ID: <79815b53-d2e8-287-94bd-2325986d036@eik.bme.hu>
References: <15f521a3-712a-f8de-6994-bad6222681@eik.bme.hu>
 <CAJ+F1C+hwUJ5Zt9-bANNw8tpeeX4KyoRYk4g=qJNv3J-ji-LnA@mail.gmail.com>
 <CABLmASH5K=mO0=k4oR76JS70a9L87rNzJu9OhtNR9dohzg5-jA@mail.gmail.com>
 <05fe1a3d-59f4-391c-4d1c-fd94c5c92fd7@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
> On 27/01/2022 20:28, Howard Spoelstra wrote:
>
>> Hi Zoltan,
>> 
>> While I can reproduce the issue you report when running morphos with gtk, I 
>> cannot currently reproduce with the Mac OS/OSX guests I tested on Linux 
>> host. Both mac99 (adb mouse and kbd) and mac99,via=pmu (usb mouse and kbd) 
>> keep the mouse inside the guest window with both sdl and gtk.
>> 
>> Best,
>> Howard
>
> Does the ati-vga device have a hardware cursor? Maybe it could be related to 
> that?

Yes ir does and it seems to be related but still don't understand how. 
I've desctibed what I've found in another reply.

Regards,
BALATON Zoltan

