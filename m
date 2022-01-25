Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE449B0C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:54:31 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIX0-00014h-NJ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCILh-00085q-Bu
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:49 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCILb-0006SE-AA
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:48 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBDWo-1mzgbs1H3u-00Ch0a; Tue, 25 Jan 2022 10:41:54 +0100
Message-ID: <c36b5e78-7633-8546-d697-3e66a7569b69@vivier.eu>
Date: Tue, 25 Jan 2022 10:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
References: <20220125024712.6626-1-dirty@apple.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Implement starttime field in self stat
 emulation
In-Reply-To: <20220125024712.6626-1-dirty@apple.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kRAXFwhCieDVVN0I452lcdcAfwP9wZjw96URbzd4HhOHFHSLJhl
 Q4ZGo7NDxM3LvMZ7OMMaI0zc28+JqMBYa7lsarZYNvJ4cE2FpDincMuuk2erQVTUfcPNVnT
 EsgWgYMY/1YqAkBFQxr7qRRRoQT2r07H9BsLg5u7GgOVYLZMG1Q4i5wbnxjHZA7gizV2JxW
 unbMc95GRcmEr5Ne7cuRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:let7evdxeNU=:1nlaNHb2XT90laDF1EWaPI
 G8m3N29SIdptcW86xUKxGveNREVmoPhvY5nLiH95XhUCSyIfKP6LhEIKw4fcrXJP/jmbuHVlP
 X3pc2MbjsAtSGk6vahcB4BZIUL7zioobXZi8QVNuWRRohhSEr1m2JDXgCkv5opV+xiH2qx9NN
 XmKZ5JTHX6ID1IxCWN6R2zxO6TSlNNY2lLEtqR3X8frBMzjcGJ/gIQjLxTF7sqPJBd5F8V21H
 P4tlg/s0hb9+r08XZJK7FO0myE3Q8HGmAegKkfHHqvNzkSAJuDQjAbcSVeqiW8rtw2cZ6abR1
 tFcmfm9FzOPSpY/yKnHcoAApbqCWr8Gpl9Q3viroxiezSq85ulSod7wq1JSGVkdrJ9GVsLjpE
 TXfjLoxilwGkflttQWAytACsZ0Cvsd3tnFE10u+BlNEfATx4JUynRx0D24Csqat+2SIdVJ2HR
 +LPz4L/n3mlFpSQGY0BzTaSaZBVVE2QZayZHK2aaetInCqa80EOLo9j0hW2m+K6+RBxMNJ56/
 97okOmwdhFwMmMq9wkUVgNNp4P6064gPs2dG9hbyDS4WcW1ydEb0TbgGPU2X+I2VUwQeMMG+W
 wCnalXfavViR6vS80Og0HVBIe59zaPX6Bu1L6MrLYgNpeDfDiFRNsp4yeSQ+9OxqmanqU05CA
 f0mJzmFAYI68gmU1yjDiXg4zyKCp6yLlDJaJuURm0SbXn+JAnOaWiL7Iz24KHjZhQ/O8=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 25/01/2022 à 03:47, Cameron Esfahani a écrit :
> Instead of always returning 0, return actual starttime.
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
>   linux-user/syscall.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..59265ab986 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8107,6 +8107,34 @@ static int open_self_stat(void *cpu_env, int fd)
>           } else if (i == 3) {
>               /* ppid */
>               g_string_printf(buf, FMT_pid " ", getppid());
> +        } else if (i == 21) { > +            /* starttime */
> +            FILE *fp = NULL;
> +            char *line = NULL;
> +            char *skipped_comm = NULL;
> +            size_t n = 0;
> +            unsigned long long starttime = 0;
> +
> +            fp = fopen("/proc/self/stat", "r");
> +            if (fp) {
> +                if (getdelim(&line, &n, '\0', fp) != -1) {
> +                    /* Find end of comm field */
> +                    skipped_comm = strrchr(line, ')');
> +                    if (skipped_comm != NULL) {
> +                        /* Skip over parenthesis and space */
> +                        skipped_comm += 2;
> +                        /* Scan starttime (field 20 after pid and comm) */
> +                        (void) sscanf(skipped_comm, "%*c %*d %*d %*d %*d %*d "
> +                                            "%*u %*u %*u %*u %*u %*u %*u %*d "
> +                                            "%*d %*d %*d %*d %*d %llu",
> +                                            &starttime);
> +                    }
> +                    free(line);
> +                }
> +                fclose(fp);
> +            }
> +
> +            g_string_printf(buf, "%llu ", starttime);

According to the kernel code:

   start_time = nsec_to_clock_t(timens_add_boottime_ns(task->start_boottime));

(timens_add_boottime_ns() is to adjust time offset according to the namespace)
(nsec_to_clock_t() is "div_u64(x, NSEC_PER_SEC / USER_HZ);")

and

   p->start_boottime = ktime_get_boottime_ns();
...
   static inline u64 ktime_get_boottime_ns(void)
   {
           return ktime_to_ns(ktime_get_boottime());
   }
...
   /**
    * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
    *
    * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
    * time spent in suspend.
    */
   static inline ktime_t ktime_get_boottime(void)
   {
           return ktime_get_with_offset(TK_OFFS_BOOT);
   }

So I think rather than scanning /proc/self/stat you could use clock_gettime(CLOCK_BOOTTIME, ...) to 
get the value.

https://linux.die.net/man/2/clock_gettime

CLOCK_BOOTTIME (since Linux 2.6.39; Linux-specific)

	Identical to CLOCK_MONOTONIC, except it also includes any time that the system is suspended.
	This allows applications to get a suspend-aware monotonic clock without having to deal with
	the complications of CLOCK_REALTIME, which may have discontinuities if the time is changed
	using settimeofday(2).

https://man7.org/linux/man-pages/man5/proc.5.html

    /proc/[pid]/stat
...
	(22) starttime  %llu

		The time the process started after system boot.  In
                 kernels before Linux 2.6, this value was expressed
                 in jiffies.  Since Linux 2.6, the value is
                 expressed in clock ticks (divide by
                 sysconf(_SC_CLK_TCK)).

                 The format for this field was %lu before Linux 2.6.

>           } else if (i == 27) {
>               /* stack bottom */
>               g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);

Thanks,
Laurent

