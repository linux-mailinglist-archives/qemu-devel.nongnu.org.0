Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803718719D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:54:18 +0100 (CET)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtwP-0007mq-4S
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jDssR-0003WJ-Hb
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jDssQ-0004uK-2u
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:46:07 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35653)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jDssP-0004gb-O3
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:46:06 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIzb-1iqYZl2Mk9-00WIPd; Mon, 16 Mar 2020 17:45:57 +0100
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20200316085620.309769-1-laurent@vivier.eu>
 <20200316085620.309769-2-laurent@vivier.eu>
 <BYAPR02MB4886D8ECC90C0845C3BFE27FDEF90@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v3 1/4] scripts: add a script to generate syscall_nr.h
Message-ID: <ec9e86fe-76c2-bab0-6b08-c524e3582dba@vivier.eu>
Date: Mon, 16 Mar 2020 17:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886D8ECC90C0845C3BFE27FDEF90@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2ILNCQqKVweqcQDF3hzO6jBURHRb5GY0xCV0SMaRPWIMfGA29dD
 4ZsJJTnUEPGGF8LXh/gFYH87/lTqOHzne70gfApJRSFhMqSr0UWolQ9Oy9HD5Lz8JuMOIO3
 urWFX2cdsc27oTrfWpDu3y1d2ohWBwN1bTBLcnV6SjXhK5BNoFEIWyeegx6MKiFcF75kJV4
 4OKuVL+SQF1axfNuZg2tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vaU7+ddkzXg=:NSrr/NobzZL7ivCNJYbH0a
 54HGCcy/IAloBhoalkHz+pSUOC1MzkfvoU+IqNWvRssTd9EFk4SAa9o7GZthdImgibgNJVShT
 zJ7PyWR84OFM+vQZzHnNRFUoRZX8nCi3nZzTiHElXDI44lqyGeJYuhQfRnZKmKmxHgHMFGg3t
 c92F/uVgWA8vFb8RuoGHzaWDVL64N85WtWgl3d8yISTZl8NheL9Kl5NbmgkN8pfvJMN/G3Aa3
 F2M2KSQkSBhv8EKCqN2IzMV9+EntAo0SH/EMorMkLwVL71IygiQlta0m0GX9Bdyt/LbekN/i6
 74BaMVpSexEDCu5mnfs6KQbF3SKcm2EnNyRmTcg0tMeh9fh9M2CLDJ29HcYo71btFdajsmEyx
 iXuZNGecHqYKhfuAbTdiLoHPoCbqolaJnpqm79A967uNQoFpMwUj2YJAwheSlhwQzFhRxB7H/
 VuvLmVAwxZPnNWttupDON9HQUWw5TnTvRqsNezP5OKBmpjTf2X3yUd8lkvNh4ffHVcRY55Rr6
 /xppRZDe5MrNIPIjsLbqdIGZsXwrLR0SJobE1bs8ou3aRqR/pKFBbgFw1jOAVuGw6NE7s8rxm
 RWdV4L1WQKpTALw7AcE73dkXHjxzEyHBeKbops0Vu4tDvoN8RIH8EFeKmV9aSMupbVY110sYc
 O4+pcoBWkW84AJA2VnXIK9YMhZFApowdUmVEcT8U07FblUUtiKpqgJXqQd61XCZwkhfpcQw1U
 0U4dzBivGBOufe23WiA8Ts3meddYMHYar03biLQ6OfsFhet7nnKBCXw53496bR9k4SuzLMzK0
 Fk5CqYtR3iry5FvYN65ThaJdCjWiHMPvIBqfiVxPeGr7EboU/ogc1GlVaTv29phisRx3Vyp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/03/2020 à 17:21, Taylor Simpson a écrit :
> 
> 
>> -----Original Message-----
>> From: Laurent Vivier <laurent@vivier.eu>
>> Sent: Monday, March 16, 2020 3:56 AM
>> To: qemu-devel@nongnu.org
>> Cc: Laurent Vivier <laurent@vivier.eu>; Richard Henderson
>> <richard.henderson@linaro.org>; Riku Voipio <riku.voipio@iki.fi>; Taylor
>> Simpson <tsimpson@quicinc.com>; Alistair Francis
>> <alistair.francis@wdc.com>
>> Subject: [PATCH v3 1/4] scripts: add a script to generate syscall_nr.h
>>
>> This script is needed for targets based on asm-generic syscall numbers
>> generation
>>
>> +
>> +filter_defines()
>> +{
>> +    grep -e "#define __NR_" -e "#define __NR3264"
> 
> For Hexagon, we're still running a 4.9 kernel.  When I tried out this script on that code base, there are a handful of these
>     #undef __NR_syscalls
>     #define __NR_syscalls 291
> This works fine with normal C preprocessing, and the last one wins.  However, when the #undef's are filtered out, it lease to build errors from multiple #define's of TARGET_NR_syscalls.  AFAIK, qemu doesn't use this, so it should be OK to filter out.  So, I changed the above line to
>     grep -e "#define __NR_" -e "#define __NR3264" | grep -v "__NR_syscalls"
> 
> If you're OK incorporating that now, great!  Otherwise, I'll add it to the Hexagon RFC patch series until we get to a newer kernel.

Sorry, I've just sent the pull-request.

Add it to your RFC, please.

It's why this script is only an helper, so it means once the file is
generated it can be edited before being committed.

Thanks,
Laurent

