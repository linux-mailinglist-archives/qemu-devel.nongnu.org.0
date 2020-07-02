Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319D211DAA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 10:01:06 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqu9Y-0005IE-V3
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 04:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jqu83-0004bM-NK; Thu, 02 Jul 2020 03:59:31 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jqu80-0006n9-6k; Thu, 02 Jul 2020 03:59:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 79A3D7482CE;
 Thu,  2 Jul 2020 09:59:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35AAC7482C8; Thu,  2 Jul 2020 09:59:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 33C257482CD;
 Thu,  2 Jul 2020 09:59:15 +0200 (CEST)
Date: Thu, 2 Jul 2020 09:59:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [PATCH v7 0/8] Mac Old World ROM experiment
In-Reply-To: <CABLmASGbMZGRTb30sVcsufyTKTbFX19=xFoXSJ+1jzt5h03dUA@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2007020937240.64147@zero.eik.bme.hu>
References: <cover.1593456926.git.balaton@eik.bme.hu>
 <5057ce7a-8e34-5b07-e93b-9cf8976fa3b2@ilande.co.uk>
 <CABLmASGbMZGRTb30sVcsufyTKTbFX19=xFoXSJ+1jzt5h03dUA@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jul 2020, Howard Spoelstra wrote:
> The boing is beautiful when g3beige/screamer with increased buffer size
> boots the G3 rom ;-)

Try it without my RFC I2C patches (checkout the one before i2c which is 
"mac_oldworld: Change PCI address of macio to match real hardware" then 
build that). With that a crashing sound is heard and you get > prompt 
where you can type ? to see a hardware test menu (but most tests don't 
seem to return anything useful and the ROM checksum is failing, seems to 
read from wrong address). I've shown that here:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-06/msg00239.html

I've never seen that on real hardware but I don't have much experience 
with old Macs. I guess you'd get the same if you removed all RAM from a 
machine and connected a serial terminal (in case you have a real beige 
G3). This might also be useful to test emulation if someone wants to 
investigate.

Regards,
BALATON Zoltan

