Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F456F824F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:52:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putxx-0003Qo-JI; Fri, 05 May 2023 07:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1putxv-0003Qb-Uo
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1putxt-0007BH-Jd
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:51:11 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6URd-1psz5c0t9F-006yCI; Fri, 05 May 2023 13:51:05 +0200
Message-ID: <5274e1f0-36f5-7119-ac03-81d59f0ff175@vivier.eu>
Date: Fri, 5 May 2023 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] linux-user: Add /proc/cpuinfo handler for RISC-V
Content-Language: fr
To: Palmer Dabbelt <palmer@dabbelt.com>, schwab@suse.de
Cc: qemu-devel@nongnu.org
References: <mhng-9a8e79cd-e48e-4b27-a5d9-af5ef2a5cd6c@palmer-ri-x1c9>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <mhng-9a8e79cd-e48e-4b27-a5d9-af5ef2a5cd6c@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DBh03oK5HKYucx/SFwv8E0xM/5jMA8qvjwC9cy3PDLNiNduxd7X
 7RB2Bs8LaqwToL+tG28bGoaG90uLSQyURfXTWfJxDSgpVNhMsR3M2fI+eivIt7A5pjHs+qH
 Y4xrwHpFrDi+LGsbE2aOnJbTf8J3K++ZzljlYhT7pavvuCCOmXPZDOj4NPwq9HB9jPIAJ0k
 xdSist8HKlcQ22jzhcR+w==
UI-OutboundReport: notjunk:1;M01:P0:WnnYNMgF2Ac=;ayMOakQdfYYTa72OZoiwCauqdOo
 fReoFm8H5ff/9eX72ILG4TGrB+tadDj2FlCzXCzzzWJKmg5i+n9tuVginJmXUAotxU+q5uKWN
 2bwCGGdh2w2bb0opEWRjbIx8B8rmO+k4BwSZVISJ2JkcWlA6+yjlCRwHP1jkoeDpyvaT75cVE
 Hpgy+xK7LDDo6WZRANSJJC+McVxa47RDrt8vfyBT+cXeG7/tARUXfjwt2nR1Lb1JQmhy+XIod
 31bey5tjaVHlUblfux2hq1F9Un4ZZMw2+CcCfUG8FdqA/lHXy2aQKUHc01S2Gq6NcGIjXDENn
 7Ot44/w7og+F47+9KXPfdhDXCf67RGeBc5vyJfvhDYR78NDW+2fMVshjA9bV592Akqy5QzeUQ
 fsXIQurA0Wj3KG4ml8TqmWTqom8W+GHzIZ1imcWIl7wlq2T1Wazu+sCt1VAy1OB7/3YM9GS31
 fJUyAUJMWyLSBwkSjvyJgy5XjhFp5TVZN0emswD1+X3x9Yfdw4J4b5zJ+Ty7fN8IggRDEwdDy
 WaV01O0YwmD0oHthHnW6XCOsVpqNQvEuxBBm0SWvEstmIemI84kr5R1sqq0CnHf9g0UU6Je3V
 JhiiKi+KCadPBpvpiZ78nb8QyduxOMzcyYjPKf5jGJ6Vz0/5Ntyo/LTiP/14ccjhzWMoWzEmm
 /00xWHlfIi6Sqcxmv78sC6ixdY+U6wdf3ismA1BHgg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 03/05/2023 à 17:34, Palmer Dabbelt a écrit :
> On Wed, 03 May 2023 08:30:12 PDT (-0700), schwab@suse.de wrote:
>> From 912af433fa5d93ce81d2054135ed475ab7462d2d Mon Sep 17 00:00:00 2001
>> From: Andreas Schwab <schwab@suse.de>
>> Date: Tue, 18 Apr 2023 11:54:01 +0200
>>
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>> v3: fix isa order
>>
>>  linux-user/syscall.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 69f740ff98..5207259b56 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>>  }
>>
>>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
>> +    defined(TARGET_RISCV)
>>  static int is_proc(const char *filename, const char *entry)
>>  {
>>      return strcmp(filename, entry) == 0;
>> @@ -8309,6 +8310,56 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>>  }
>>  #endif
>>
>> +#if defined(TARGET_RISCV)
>> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>> +{
>> +    int i, num_cpus;
>> +    char isa[32];
>> +
>> +#if defined(TARGET_RISCV32)
>> +    strcpy (isa, "rv32");
>> +#endif
>> +#if defined(TARGET_RISCV64)
>> +    strcpy (isa, "rv64");
>> +#endif
>> +    i = strlen (isa);
>> +    if (riscv_has_ext (cpu_env, RVI))
>> +        isa[i++] = 'i';
>> +    if (riscv_has_ext (cpu_env, RVE))
>> +        isa[i++] = 'e';
>> +    if (riscv_has_ext (cpu_env, RVM))
>> +        isa[i++] = 'm';
>> +    if (riscv_has_ext (cpu_env, RVA))
>> +        isa[i++] = 'a';
>> +    if (riscv_has_ext (cpu_env, RVF))
>> +        isa[i++] = 'f';
>> +    if (riscv_has_ext (cpu_env, RVD))
>> +        isa[i++] = 'd';
>> +    if (riscv_has_ext (cpu_env, RVC))
>> +        isa[i++] = 'c';
>> +    if (riscv_has_ext (cpu_env, RVV))
>> +        isa[i++] = 'v';
>> +    isa[i] = 0;
>> +
>> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
>> +    for (i = 0; i < num_cpus; i++) {
>> +        dprintf(fd, "processor\t: %d\n", i);
>> +        dprintf(fd, "hart\t\t: %d\n", i);
>> +        dprintf(fd, "isa\t\t: %s\n", isa);
>> +#if defined(TARGET_RISCV32)
>> +        dprintf(fd, "mmu\t\t: sv32\n");
>> +#endif
>> +#if defined(TARGET_RISCV64)
>> +        dprintf(fd, "mmu\t\t: sv57\n");
>> +#endif
>> +        dprintf(fd, "mvendorid\t: 0x0\n");
>> +        dprintf(fd, "marchid\t\t: 0x0\n");
>> +        dprintf(fd, "mimpid\t\t: 0x0\n\n");
>> +    }
>> +    return 0;
>> +}
>> +#endif
>> +
>>  #if defined(TARGET_M68K)
>>  static int open_hardware(CPUArchState *cpu_env, int fd)
>>  {
>> @@ -8333,7 +8384,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, 
>> int
>>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>>          { "/proc/net/route", open_net_route, is_proc },
>>  #endif
>> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
>> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>>  #endif
>>  #if defined(TARGET_M68K)
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Thanks!
> 

In my linux-user branch I have already queued:

[PATCH qemu v2] linux-user: Emulate /proc/cpuinfo output for riscv
https://patchew.org/QEMU/167873059442.9885.15152085316575248452-0@git.sr.ht/

IS this one better?

Thanks,
Laurent

