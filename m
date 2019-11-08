Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6DF3E24
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 03:40:49 +0100 (CET)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSuCd-0000if-Tl
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 21:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rajaths@cs.utexas.edu>) id 1iSuBl-0000BU-W7
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 21:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rajaths@cs.utexas.edu>) id 1iSuBj-0006hp-Uf
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 21:39:53 -0500
Received: from newman.cs.utexas.edu ([128.83.139.110]:42210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rajaths@cs.utexas.edu>)
 id 1iSuBj-0006hJ-IT
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 21:39:51 -0500
Received: from [172.20.2.59] (rrcs-72-128-130-131.sw.biz.rr.com
 [72.128.130.131]) (authenticated bits=0)
 by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id
 xA82dmX6020596
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
 Thu, 7 Nov 2019 20:39:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
 s=default; t=1573180789;
 bh=hWFT1L2uyC3YSe+oCXRhQ/FkmA+8n+lfBOfKCciIf8E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kqE79Hnmj4GMns+6PMf0HdqIIGwILI0VT6yhWvmr8pz8YwSgPyn+kqdMtYEJ2MEYx
 IDBtipGrFU2TlCRvLa8SbJkIysCIE1wzjPmDukiSqymY9MOs7gicNCDpVgt6Hv4Z6P
 qgEf7XeEVp4ZsdQvZ8dPpa/k3Xr8iftk85AcV2wQ=
Subject: Re: Looking for issues/features for my first contribution
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <f5a16b3c-2c17-60e4-e80b-dd20b3c088cc@cs.utexas.edu>
 <CAL1e-=g8c=QJiMm1AvBCNmsTyVWoUAjL0na2HWodHCQPiLdWJw@mail.gmail.com>
 <CAL1e-=j8K+FKj=4pTd8HKkL-D=F+9hY+5bF4ibM8WE+Sp+pk=Q@mail.gmail.com>
From: Rajath Shashidhara <rajaths@cs.utexas.edu>
Message-ID: <f300806f-ced2-5926-40ff-4cdd29c5078e@cs.utexas.edu>
Date: Thu, 7 Nov 2019 20:39:47 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=j8K+FKj=4pTd8HKkL-D=F+9hY+5bF4ibM8WE+Sp+pk=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9
 (newman.cs.utexas.edu [128.83.139.110]); Thu, 07 Nov 2019 20:39:48 -0600 (CST)
X-Virus-Scanned: clamav-milter 0.100.3 at newman
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.83.139.110
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 07-11-2019 07:33, Aleksandar Markovic wrote:
> 
> I did a quick Google search on datasheets of existing RTC
> implemtations, and the result is:
> 
> DS1338: https://datasheets.maximintegrated.com/en/ds/DS1338-DS1338Z.pdf
> M41T80: https://www.st.com/resource/en/datasheet/m41t80.pdf
> M48T59: http://www.elektronikjk.pl/elementy_czynne/IC/M48T59V.pdf
> MC146818: https://www.nxp.com/docs/en/data-sheet/MC146818.pdf
> PL031: http://infocenter.arm.com/help/topic/com.arm.doc.ddi0224c/real_time_clock_pl031_r1p3_technical_reference_manual_DDI0224C.pdf
> TWL92230: https://datasheet.octopart.com/TWL92230C-Texas-Instruments-datasheet-150321.pdf
> Zynq RTC: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> (chapter 7)

I have a few questions about this:
[a] Is there any particular reason that you picked DS3231 ? Linux kernel 
has drivers for DS3232/34 only [1]. I did read the datasheets of both 
3232 & 3231 and found that they are quite similar except for the 236 
bytes of SRAM support found only in 3232.

[b] As per the datasheet, DS3231 has a built-in temperature sensor. 
Temperature can be read from a dedicated register. There can be two 
approaches to emulating this: (1) Return a constant temperature value on 
every read (2) Throw a not-supported exception/warning. What is the qemu 
convention for handling such features ?

[c] DS3231 also has programmable square-wave output + 32 KHz output pin. 
M41T80 chip also supports this feature. However, qemu does not support 
emulation of these features [2]. Do I take the same approach ?

Thanks!
Rajath Shashidhara

References:
[1] 
https://elixir.bootlin.com/linux/v5.4-rc6/source/drivers/rtc/rtc-ds3232.c
[2] 
https://git.qemu.org/?p=qemu.git;a=blob;f=hw/rtc/m41t80.c;h=914ecac8f4db418633d6daf92608cb50f6b89052;hb=HEAD

