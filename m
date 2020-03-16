Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34796186CED
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 15:20:28 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDqbS-0003R6-Nb
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 10:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jDp2e-0001zj-H8
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jDp2c-0005fk-FH
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:40:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jDp2X-00032z-VY; Mon, 16 Mar 2020 08:40:18 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F172A747DFF;
 Mon, 16 Mar 2020 13:40:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D69D1747DFD; Mon, 16 Mar 2020 13:40:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D501D747DF5;
 Mon, 16 Mar 2020 13:40:07 +0100 (CET)
Date: Mon, 16 Mar 2020 13:40:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/8] hw/ide: Get rid of piix3_init functions
In-Reply-To: <877dzkn6yy.fsf@dusky.pond.sub.org>
Message-ID: <alpine.BSF.2.22.395.2003161337240.70254@zero.eik.bme.hu>
References: <cover.1584134074.git.balaton@eik.bme.hu>
 <adddfa21552783020d64e1314318cab6d24362c3.1584134074.git.balaton@eik.bme.hu>
 <877dzkn6yy.fsf@dusky.pond.sub.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Mar 2020, Markus Armbruster wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>> This removes pci_piix3_ide_init() and pci_piix3_xen_ide_init()
>> functions similar to clean up done to other ide devices.
>
> Got a commit hash for "done to other ide devices"?

Not yet in master, patches to CMD646 from Mark are queued in ide tree and 
I've submitted another one for via-ide as part of another series fixing 
that model which is also part of the latest version of that series revised 
by Mark. These are hopefully merged together so should appear close in log 
to be clear which these refer to.

Regards,
BALATON Zoltan

