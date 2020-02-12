Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D122A15A458
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 10:12:12 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1o43-00063O-Ua
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 04:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <roman.kapl@sysgo.com>) id 1j1o3G-0005Ed-QO
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <roman.kapl@sysgo.com>) id 1j1o3F-0002Dq-S8
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:11:22 -0500
Received: from mail.sysgo.com ([176.9.12.79]:60320)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <roman.kapl@sysgo.com>)
 id 1j1o3C-000286-OU; Wed, 12 Feb 2020 04:11:18 -0500
Subject: Re: [PATCH] i.MX: Fix inverted register bits in wdt code.
To: Peter Maydell <peter.maydell@linaro.org>, Roman Kapl <rka@sysgo.com>
References: <20200207095409.11227-1-rka@sysgo.com>
 <CAFEAcA_vgg8mVw+-vfjWcouyOOnM_qZPdsPFmSgatV4Lq5Panw@mail.gmail.com>
From: Roman Kapl <roman.kapl@sysgo.com>
Message-ID: <0f507694-f976-7880-ced4-aaac72d85282@sysgo.com>
Date: Wed, 12 Feb 2020 10:10:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_vgg8mVw+-vfjWcouyOOnM_qZPdsPFmSgatV4Lq5Panw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 176.9.12.79
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/20 6:57 PM, Peter Maydell wrote:
> On Fri, 7 Feb 2020 at 09:55, Roman Kapl <rka@sysgo.com> wrote:
>>
>> Documentation says for WDA '0: Assert WDOG output.' and for SRS
>> '0: Assert system reset signal.'.
>>
>> Signed-off-by: Roman Kapl <rka@sysgo.com>
>> ---
>>   hw/misc/imx2_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to target-arm.next, thanks.
> 
> (It looks like we're missing a lot of the watchdog
> functionality in our model, ie the actual watchdog
> timer parts, enable bits, etc etc...)

Yes, but the target restart functionality is the most important one. If 
I've read the i.MX forums correctly it is the easiest way to restart the 
board correctly.

Best regards, Roman Kapl

> 
> -- PMM
> 

