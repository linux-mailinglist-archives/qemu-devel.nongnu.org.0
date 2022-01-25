Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08249B132
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:21:17 +0100 (CET)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIws-0003qD-Lf
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCIot-00061p-NZ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:12:59 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:44435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCIor-0002vk-NF
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:12:59 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDygG-1n2Quh2dIy-009vxz for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022
 11:12:55 +0100
Message-ID: <7876f6e9-7c11-171f-daef-68ecfac282c2@vivier.eu>
Date: Tue, 25 Jan 2022 11:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: Implement starttime field in self stat
 emulation
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20220125024712.6626-1-dirty@apple.com>
 <c36b5e78-7633-8546-d697-3e66a7569b69@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <c36b5e78-7633-8546-d697-3e66a7569b69@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+01bUoDZNNwd3xjsM1knQt6ZjZmBzhle2D0wiVkTqNvp0sCu00m
 jawGiyObQEtHYOyHik7ZFjLqFxHO/4gOtvE5tXWiV7BLte8t5B5KAsRq+pKH/XLa3BaVrh4
 lTLHeRzN86bUMWViGZAGOPBvfkz/oymPIIPHZVRzKMaBxjM54HfEtKBbAyA4hv6Wbgva+sp
 H92OL2h2CWGZSJsW0NRgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5O7S3OBtHPg=:05zJBbzmSheiFPIJ6GnTYO
 Tl6g8oIS9PXR7qS5C3X1m3I2VLvB6nv2p5r8lOZwO/7sUc7uM54MmqceinWamrNu2nnQgHP9A
 8HqnLgTSsq8c6T2tpXqSK8kBhamGciU4iy6mGKuHcrFtRlB+iIHE4FBibYfJnjugajHOgPQPD
 1Ltp7AQvglXri30HHvRGdrZqfZ1uEZ/fvHfrRj1WxQJqh4wXq58vowti9AFgZf+u1FRF0KghD
 hyvio+vxC1e6UhKdyaT4AoW7QYHvz83OJX7i1SAkdzrK1qfKQVfXt+sfOYilNR/X8KV2dBu22
 RV2O4zurerT5BgicjP+LQi2/i9f5OLWGBqmwgwPfqO5cJgD9HXFA2Dz4jMZw22GVWZpzo1WWc
 JbBKyl3KmDCRZRLsPdFf6aDezPsku4atpoqJcbBDLIBLKyY+n1iESb6Ltb4GpUEih5BCzekF5
 o1PRTmgFCusm0AwyYFBLuNKtVkV9dRwRocNGxzYF4p1s1s/iDN950RNc/CcMKglT8MXre2SxW
 33Y4d8wSbzaCbBR7eCO8Igy+wqvh5AeFml4/tNDfuPqAAdZQNSAvTTgSRTQeMOhlHtpYJWYDN
 gy7i/NuNkkKrRvZla7XZHK+8ElTzELCu1rnKVZGA/diifSN2flelR611eNNoPPJ7Beo4HmOeN
 JVxHg8ZbUfWGPPlop7e3phmWgZjegBC64xF780qpqbLoDlYnrGioj8qHkO4n6/25G0Ac=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/01/2022 à 10:41, Laurent Vivier a écrit :
> Le 25/01/2022 à 03:47, Cameron Esfahani a écrit :
>> Instead of always returning 0, return actual starttime.
>>
>> Signed-off-by: Cameron Esfahani <dirty@apple.com>
>> ---
>>   linux-user/syscall.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 5950222a77..59265ab986 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8107,6 +8107,34 @@ static int open_self_stat(void *cpu_env, int fd)
>>           } else if (i == 3) {
>>               /* ppid */
>>               g_string_printf(buf, FMT_pid " ", getppid());
>> +        } else if (i == 21) { > +            /* starttime */
>> +            FILE *fp = NULL;
>> +            char *line = NULL;
>> +            char *skipped_comm = NULL;
>> +            size_t n = 0;
>> +            unsigned long long starttime = 0;
>> +
>> +            fp = fopen("/proc/self/stat", "r");
>> +            if (fp) {
>> +                if (getdelim(&line, &n, '\0', fp) != -1) {
>> +                    /* Find end of comm field */
>> +                    skipped_comm = strrchr(line, ')');
>> +                    if (skipped_comm != NULL) {
>> +                        /* Skip over parenthesis and space */
>> +                        skipped_comm += 2;
>> +                        /* Scan starttime (field 20 after pid and comm) */
>> +                        (void) sscanf(skipped_comm, "%*c %*d %*d %*d %*d %*d "
>> +                                            "%*u %*u %*u %*u %*u %*u %*u %*d "
>> +                                            "%*d %*d %*d %*d %*d %llu",
>> +                                            &starttime);
>> +                    }
>> +                    free(line);
>> +                }
>> +                fclose(fp);
>> +            }
>> +
>> +            g_string_printf(buf, "%llu ", starttime);
> 
> According to the kernel code:
> 
>    start_time = nsec_to_clock_t(timens_add_boottime_ns(task->start_boottime));
> 
> (timens_add_boottime_ns() is to adjust time offset according to the namespace)
> (nsec_to_clock_t() is "div_u64(x, NSEC_PER_SEC / USER_HZ);")
> 
> and
> 
>    p->start_boottime = ktime_get_boottime_ns();
> ...
>    static inline u64 ktime_get_boottime_ns(void)
>    {
>            return ktime_to_ns(ktime_get_boottime());
>    }
> ...
>    /**
>     * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
>     *
>     * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
>     * time spent in suspend.
>     */
>    static inline ktime_t ktime_get_boottime(void)
>    {
>            return ktime_get_with_offset(TK_OFFS_BOOT);
>    }
> 
> So I think rather than scanning /proc/self/stat you could use clock_gettime(CLOCK_BOOTTIME, ...) to 
> get the value.
> 
> https://linux.die.net/man/2/clock_gettime
> 
> CLOCK_BOOTTIME (since Linux 2.6.39; Linux-specific)
> 
>      Identical to CLOCK_MONOTONIC, except it also includes any time that the system is suspended.
>      This allows applications to get a suspend-aware monotonic clock without having to deal with
>      the complications of CLOCK_REALTIME, which may have discontinuities if the time is changed
>      using settimeofday(2).
> 
> https://man7.org/linux/man-pages/man5/proc.5.html
> 
>     /proc/[pid]/stat
> ...
>      (22) starttime  %llu
> 
>          The time the process started after system boot.  In
>                  kernels before Linux 2.6, this value was expressed
>                  in jiffies.  Since Linux 2.6, the value is
>                  expressed in clock ticks (divide by
>                  sysconf(_SC_CLK_TCK)).
> 
>                  The format for this field was %lu before Linux 2.6.
> 
>>           } else if (i == 27) {
>>               /* stack bottom */
>>               g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
> 

and we could add a field in TaskState (start_boottime) to set the bootime value in init_task_state() 
when the task is started and to read it in open_self_stat().

Thanks,
Laurent




