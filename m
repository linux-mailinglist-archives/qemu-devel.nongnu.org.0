Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFB64BD92
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5BGr-0000Ia-Rr; Tue, 13 Dec 2022 14:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5BGp-0000IP-O8
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:48:55 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5BGn-0006Gb-Pk
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670960931; bh=WQBQJ9SWTNf7BB82bM50Rzjz9V4ILkexE7kdC9r6ops=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=g7aNGbIsgKJe1SxlXIn3IJkjNaEOHkHa011qMdp77W8P0NiSJGkE9cZmfjc0CW03O
 mQ9d2UkdD81pxclXW2FEaNVjiyHCULrnN5xldz3a9mfy3tYrW1KfGJyqYCFm2TmJ++
 ys7sPSr5jSXoFnVHqCsJBnDnZ+/wO/htCTPe/g6K5ZBhdc/0wLc6CranzKNjsnjE2n
 ESZAWYfXyfayjvcII6H+b3rDXdrbVvB9hh0q7xzC1YIUPUNYqGxBrNoMqVk2XOiCsD
 UIRrtpcvE5uIb6Fypp+mJ49DLJoXHSvlh4DOwZuNcZ2nMB71RSOimILgeINEaHk9n9
 TzDC2qEepoS8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.201]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1od2JV0rFq-00kyGJ; Tue, 13
 Dec 2022 20:48:51 +0100
Message-ID: <5177c93a-7cf5-4da4-d1a7-8d00632af640@gmx.de>
Date: Tue, 13 Dec 2022 20:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Enhance /proc/cpuinfo output for sparc, hppa
 and m68k
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y5ij6ST3s5dLNHPM@p100>
 <577ccfca-2767-c8a2-5b05-0b02c898e486@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <577ccfca-2767-c8a2-5b05-0b02c898e486@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:madZbMJMYtszMTtWmRwQJf92ib3EtSZar5lZVYYYR8fLXOZtbUg
 a1gpy36UJLyo7YNBl1HpmLX2NO6znt6oR09ecv6jHJC96woLT5NyOdnB7Rtjvnr1XmO2IIN
 rTEvBuFyMC8FgkweMwIcRH53akMW0T22QwN0XZTNIRMrMBFuaJ1YlGprsqDQBd+7fbWUJvt
 fTo42dX9EdmXHG9EGf62w==
UI-OutboundReport: notjunk:1;M01:P0:wVedCfOro2g=;kt0CiqedFETSzUU2r+wcyAVEZAV
 8oWvILZEqFxTRH2b4YMxOzBYIRn7Wc5bzd1gpsNeQ4RF3TmKj6n0f8+CBcGqYHrvx4rn+YZJN
 Uj6UCXZVKcTqcJ2HGdEAdVDpdAAqyZIf+/PGMlWwb4Tw8dojbc6knz3jvvP2G1WR7LHWVvr4Y
 y5dS3OBIled0kCRFwvEqAnMSeE+qgkYNlyfR7kdyY5IgmXpSsHMYHzC4wCYcTG/8bQZhS9al/
 O3IoLs+qJosByDN+6x2oGVenMXdg7ZKkGWz4pD0tsi3oJrbLh6S1yn3afuMjs8smP9XkXcCct
 DXW91UL7OsXSwhbYy59J2Ni7A1Y2ZXMNVqI/7MNN+MdzgKz3HXq0XZZcINFVFWRX3Hrb9qZf0
 rrgm+ackcetnhdVUlABO/jCbxS/kqLJOYezMAjt0q/3M2yJO81Jc5hakKkZERMQDRz3hmZ8Fi
 2bn/YHYY9yqugXrxZUfB01o/PZ0V96bCNk31LeT6G9xKntq1bXbyWYO/L2tGMn1UHI05RZYVU
 NEi81pV5Si2C36zMpsWm9FAp8anuxUz5Ymj9r40OfTm/uecyvZdPJ0kgigrdxriqv3PcJa2hl
 TLWu8a6Dvvf8cBy6c10EyZa1gJBTwz3T7XT0It1izzLUCeMvL6AGWU+MZxus6tVjrM3lYD3Et
 O6Dvh0nFbh+sRbj41q8H4uDQcdrQ3takIoutvD6JBd2b0FQohSVB0wQJKbBwBV0xBAholdGAb
 WO3toZdYbpp2uUEkEtoGZ/lD88XPtMGjuLGFLjdracTBgL6ThPV3nSokcCT9y/7HvyKD268Ji
 Tm/ayYJMcsyTXpsD+vvwIzpWMny7EWnrSBFaoJJVVjHQ78cJs127+hAdYJeK+OE1pLvN9FYxP
 7wBi7UKOCDegGsmfkKnsaGDGD3i0mvShO3xDe+PSMvZ1vpuwCNu1wqojQN0xnfSrLerGi7Z5A
 u5MM3Q==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/13/22 20:31, Laurent Vivier wrote:
> Le 13/12/2022 =C3=A0 17:10, Helge Deller a =C3=A9crit=C2=A0:
>> The sparc, hppa and m68k architectures provide an own output for the
>> emulated /proc/cpuinfo file.
>>
>> Some userspace applications count (even if that's not the recommended
>> way) the number of lines which start with "processor:" and assume that
>> this number then reflects the number of online CPUs. Since those 3
>> architectures don't provide any such line, applications may assume "0"
>> CPUs.=C2=A0 One such issue can be seen in debian bug report:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1024653
>
> Why don't they use something like system("getconf _NPROCESSORS_CONF") ?

Yes, something like that.
Any return value other than 0 would have been sufficient at least.
But sadly that's not the only program which does it that way.
Just search the internet and you'll find tons of such posts to
use "processor:" from /proc/cpuinfo.

>> Avoid such issues by adding a "processor:" line for each of the online
>> CPUs.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 9e2c0a18fc..d58e9b8d10 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
> ...
>> @@ -8319,6 +8331,7 @@ static int open_cpuinfo(CPUArchState *cpu_env, in=
t fd)
>> =C2=A0 #if defined(TARGET_M68K)
>> =C2=A0 static int open_hardware(CPUArchState *cpu_env, int fd)
>> =C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 dprintf(fd, "processor\t: 0\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintf(fd, "Model:\t\tqemu-m68k\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>
> This is /proc/hardware, not /proc/cpuinfo.

Oops... you are right!
I'll drop this hunk.

Thanks!
Helge

> root@debian10-vm1:~# cat /proc/hardware
> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Macintosh Quadra 800
> System Memory:=C2=A0=C2=A0=C2=A0 1025024K
> root@debian10-vm1:~# cat /proc/cpuinfo
> CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 68040
> MMU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 68040
> FPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 68040
> Clocking:=C2=A0=C2=A0=C2=A0 1529.8MHz
> BogoMips:=C2=A0=C2=A0=C2=A0 1019.90
> Calibration:=C2=A0=C2=A0=C2=A0 5099520 loops
>
> And on m68k, no one expects to have a "processor" line.
>
> Thanks,
> Laurent
>


