Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3C174F04
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 19:54:46 +0100 (CET)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8Tjh-00073s-G9
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 13:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8Tix-0006aC-5k
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 13:53:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8Tiw-00054T-A7
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 13:53:59 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:13521)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j8Tit-0004wd-Qj; Sun, 01 Mar 2020 13:53:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 67D767476D5;
 Sun,  1 Mar 2020 19:53:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4DF4F746383; Sun,  1 Mar 2020 19:53:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4C761746381;
 Sun,  1 Mar 2020 19:53:53 +0100 (CET)
Date: Sun, 1 Mar 2020 19:53:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 2/2] via-ide: Also emulate non 100% native mode
In-Reply-To: <alpine.BSF.2.22.395.2003011902490.28669@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2003011951370.28669@zero.eik.bme.hu>
References: <cover.1583017348.git.balaton@eik.bme.hu>
 <32bb2eab213344151ca342bab5db2cf8c2758fb7.1583017348.git.balaton@eik.bme.hu>
 <f7f6bca9-ce20-cc3d-5366-1e947d729c21@ilande.co.uk>
 <bdbef976-a853-7178-8163-579e4bf9e2e0@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011731130.95594@zero.eik.bme.hu>
 <57ff6676-5054-d3f6-f4fc-6ff02b09019f@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011902490.28669@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: qemu-block@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Mar 2020, BALATON Zoltan wrote:
> is not legacy mode but "not 100% native mode". The prog-if is set to 0x8a 
> which corresponds to native mode but this is what the Linux fixup function 
> does, firmware sets it to 0x8f which means native mode.

I mean, 0x8a legacy mode and 0x8f native mode, I see firmware poking 0x8f 
and Amiga like OSes reading that yet expecting legacy interrupts. Linux 
fixes up prog-if so its driver detects legacy interrupts but still uses 
ioports from PCI BARs.

Regards,
BALATON Zoltan

