Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F11333E9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 22:23:04 +0100 (CET)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iowJb-0006lZ-1Q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 16:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hpoussin@reactos.org>) id 1iowIW-0005KU-FF
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 16:21:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hpoussin@reactos.org>) id 1iowIV-0000yt-AJ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 16:21:56 -0500
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:50706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hpoussin@reactos.org>)
 id 1iowIU-0000vo-Pd
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 16:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7N2NlyCRRtN4JrgQObMjwaloNnyPr9QSikWxoGB8GsQ=; b=Oqoyy7ZAjAN8s9NKeq6Ax/o9uF
 8zWPRO0zO1igs0ybl1DTgwqUlx7S1H0cvdwOpz9p05iwKQ7wqGL+E8s8yMF6Yh9FqJWC8JXV68iYj
 7XYEWIqX3AUuddsy7eLV/nyIZhtDDkigNIMh2ZOvOfudDwGHI7ijfcgrd/qNl3LIwros=;
Received: from [2a01:e35:2e3e:3c40:b837:a6a8:d654:7660]
 by iserv.reactos.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1iowIP-0007Cx-Ti; Tue, 07 Jan 2020 21:21:50 +0000
Subject: Re: [PATCH] hw/ppc/prep: Remove the deprecated "prep" machine and the
 OpenHackware BIOS
To: Thomas Huth <thuth@redhat.com>
References: <20191203072922.14981-1-thuth@redhat.com>
 <9de5fbb4-3241-7940-abda-6b0e57e89724@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <2836db45-4d1a-e899-fb53-d151fdfbc85d@reactos.org>
Date: Tue, 7 Jan 2020 22:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9de5fbb4-3241-7940-abda-6b0e57e89724@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c17:5ae1::1
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/01/2020 à 10:22, Thomas Huth a écrit :
> On 03/12/2019 08.29, Thomas Huth wrote:
>> It's been deprecated since QEMU v3.1. The 40p machine should be
>> used nowadays instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitmodules                |   3 -
>>   MAINTAINERS                |   1 -
>>   Makefile                   |   2 +-
>>   docs/interop/firmware.json |   3 +-
>>   hw/ppc/ppc.c               |  18 --
>>   hw/ppc/prep.c              | 384 +------------------------------------
>>   include/hw/ppc/ppc.h       |   1 -
>>   pc-bios/README             |   3 -
>>   pc-bios/ppc_rom.bin        | Bin 1048576 -> 0 bytes
>>   qemu-deprecated.texi       |   6 -
>>   qemu-doc.texi              |  15 +-
>>   roms/openhackware          |   1 -
>>   tests/boot-order-test.c    |  25 ---
>>   tests/cdrom-test.c         |   2 +-
>>   tests/endianness-test.c    |   2 +-
>>   15 files changed, 10 insertions(+), 456 deletions(-)
>>   delete mode 100644 pc-bios/ppc_rom.bin
>>   delete mode 160000 roms/openhackware
>>
[...]
> 
> Ping ... Hervé, what do you think about the patch?

Hello Thomas,

I completely agree with this welcomed patch!

Acked-by: Hervé Poussineau <hpoussin@reactos.org>

Regards,

Hervé

