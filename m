Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60F375259
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 12:30:54 +0200 (CEST)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lebHQ-0001ha-MX
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 06:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lebG8-00018a-Ag
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:29:32 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lebG6-0002aV-Dg
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:29:32 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLz7f-1lvr1e03wf-00Hwxb; Thu, 06 May 2021 12:29:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210505160344.1394843-1-f4bug@amsat.org>
 <4c67e219-8698-5855-909b-21fb1c45a385@vivier.eu>
Subject: Re: [PATCH] target/m68k: Remove unused variable in ABCD/SBCD memory
 opcodes
Message-ID: <ab11d44e-e0bd-d684-cadf-cbe641cb8be1@vivier.eu>
Date: Thu, 6 May 2021 12:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4c67e219-8698-5855-909b-21fb1c45a385@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:waZhvrDjfzEYxqzQWf7kMclpyGhc1t747jA+sJBHsWpofvmhPQ9
 7vdYl3C8q6GiOSf+Y6Arxa3BH9Dr8v0U6kzJDrEuJeVRouoZfBfsbyA85/qodzEL1Fi3JAH
 I9zYhdDASy6hd9pXeradtboJb+b3J+3/ApW0XIRMSpm4vro7yYOwvXloVO4b5Ix1q63gXWP
 2IJHBXRBsiCntIh0saE5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qudYyR7uPkc=:KVj8wJy0HUpwUn6RvG0pgE
 EXam3wqmlz9oQpG2ciJ0gmddOOAF4roZViwwDhchlY26mlwoAntjzmkiYEgnYE4PHsUP5hgML
 U4KS3PHtAomWtr9Z8dIhCWnCQVx38Aj55IDywAlB3pnMDjUAF1Fqw3m+5G3kC085Kq1si5Pev
 XcIJ+FaZZf3dwbkaipgYWeMByobu6IUGPJOOIQ8iCXVQxU56LEyfK0d+sqXvvfBJ7STIPx0ti
 +v1QCg9jqXBwiO6LZhGviu1hnqKMGAbc+oQ0YD8AVSkiWsmnVV/F9CyRqso7Y94xqthAQO0OH
 Bcrlbt78yZN8n+HacEeiiF9i8tnntrNVQo8ncZfsW7REPkX+WaWG3FnFfkgGb+KbNqt8SNhHW
 JGVy7b0MX8kgbpmTZ8RRQOuyR0SS2dk2MvxvfwSH8UhpdugTGrW03q0SHG+eP6mJO6quwmHdV
 LQjP5ag8Uens3AUOfKOKoufqL2yvcQ7CZJKuCuaz2aYkk4nFrYrbo0d0TRn2KPqTsNPQ0Pzil
 pnYK7x8gpM62yVa3S8B0h4=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/05/2021 à 18:43, Laurent Vivier a écrit :
> Le 05/05/2021 à 18:03, Philippe Mathieu-Daudé a écrit :
>> The ABCD / SBCD memory opcodes (introduced in commit fb5543d8200)
>> don't use their "addr" variable.
>>
>> Remove the unused variable and pass a NULL argument instead to
>> gen_ea_mode(). This fixes warnings generated when building with
>> CFLAGS=-O3 (using GCC 10.2.1 20201125):
>>
>>   target/m68k/translate.c: In function ‘disas_sbcd_mem’:
>>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>>     897 |             delay_set_areg(s, reg0, tmp, false);
>>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   target/m68k/translate.c:1866:21: note: ‘addr’ was declared here
>>    1866 |     TCGv src, dest, addr;
>>         |                     ^~~~
>>
>>   target/m68k/translate.c: In function ‘disas_abcd_mem’:
>>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>>     897 |             delay_set_areg(s, reg0, tmp, false);
>>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   target/m68k/translate.c:1829:21: note: ‘addr’ was declared here
>>    1829 |     TCGv src, dest, addr;
>>         |                     ^~~~
>>
> 
> It's really strange because ABCD and SBCD support indirect predecrement (mode 4, "-(Ay),-(Ax)"), and
> if you look into gen_ea_mode() &addr (addrp) is used with mode 4, it is initialized on EA_LOADU to
> be reused on EA_STORE.
> 
> The bug is somewhere else...
> 

I think I see what is the problem: as the mode is indirect pre-decrement, the register doesn't need
to be updated and thus the addr is not needed.

But if we replace addrp by NULL, gen_lea_mode() will be called twice and the register will be
decremented twice (on load and store, rather than only on load).

Thanks,
Laurent


