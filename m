Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E4129CC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 10:20:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMTQV-00058i-AE
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 04:20:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hMTP8-0004ao-63
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hMTP7-00033q-Di
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:18:50 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:41843
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1hMTP7-00032s-7f
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:18:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 3F17E81386;
	Fri,  3 May 2019 10:18:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exelNjIT98wi; Fri,  3 May 2019 10:18:47 +0200 (CEST)
Received: from localhost.localdomain
	(apoitiers-155-1-191-106.w109-220.abo.wanadoo.fr [109.220.154.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id F3A4281385;
	Fri,  3 May 2019 10:18:46 +0200 (CEST)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1556194715-24427-1-git-send-email-frederic.konrad@adacore.com>
	<1556194715-24427-2-git-send-email-frederic.konrad@adacore.com>
	<c1ba4bd6-0790-9d41-eb6b-4a21fa17ec10@ilande.co.uk>
	<05b496be-408a-50b5-7b38-c402b172c962@ilande.co.uk>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <8ebd3335-188d-a5ff-e15e-cdf22b955660@adacore.com>
Date: Fri, 3 May 2019 10:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <05b496be-408a-50b5-7b38-c402b172c962@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-devel] [PATCH v2 1/3] leon3: add a little bootloader
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, philmd@redhat.com, chouteau@adacore.com,
	atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

>>>       }
>>
>> I think this patch is basically okay, however if you don't supply both a kernel and
>> bios then you get the slightly enigmatic message below:
>>
>> $ ./qemu-system-sparc -M leon3_generic
>> qemu-system-sparc: Can't read bios image (null)
>>
>> Perhaps add a define for LEON3_BIOS_FILENAME and return that if filename == NULL to
>> give a better error message?
> 
> Okay I see there is already a PROM_FILENAME that exists and can be used here.

I think we already have this behavior without this patch. Should this be fixed
in an other patch?

Regars,
Fred

> 
> 
> ATB,
> 
> Mark.
> 

