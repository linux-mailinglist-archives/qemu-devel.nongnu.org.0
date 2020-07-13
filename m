Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B816021E0A3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 21:23:07 +0200 (CEST)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv42c-0006Vy-Qc
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 15:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv41e-0005HL-Ln
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:22:06 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv41c-0006W7-Kk
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:22:06 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MVuXT-1kKfUi0tZF-00RohF; Mon, 13 Jul 2020 21:21:53 +0200
Subject: Re: [PATCH v3 2/2] linux-user: support of semtimedop syscall
To: Matus Kysel <mkysel@tachyum.com>, riku.voipio@iki.fi, qemu-devel@nongnu.org
References: <20200626124612.58593-1-mkysel@tachyum.com>
 <20200626124612.58593-3-mkysel@tachyum.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e1b2e842-f022-b4f9-0227-b0a1fb6f7186@vivier.eu>
Date: Mon, 13 Jul 2020 21:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626124612.58593-3-mkysel@tachyum.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6iB+4bS0ToYUPBmHbuINJqJhURL4xGx/oTsjFA6XGDHZQGXKlFy
 AGq3GJfg0Lv4o5UvZnLplTHRxD/hArwjEqqtB/RwZxpWboxnW9nVRsWciW1sZdgVyeVb+wi
 /ByRfIWvE7D2dqJhLsqcXfDgByD0AQ7rwP0M8SJvnb4k4WFpFfMonCEL/fN4/9xLqoALOOo
 RoRjohRusnD0HmSdI4BsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dFuJyW3iOc=:ZconO1Kf8eRcQ1zp5Lh02q
 gvegv0JZSY8uSwnJP4OZMktDiXljHwPEeTmmmeqTdLIMW0VFCTQcLXVGjnLBDb7+58TLL8MsD
 YmYSM9f1wAlEuUqkmA0bTTW3F9TYQu90JEn1TXt7+enHxkZ6Y5c7OyYT9K3o5ruGquXqGvDsn
 hxz2JIWXfDSZJuSCL+I2Px/6nV3ogrdV9h9GBF6C6FWaCVGNGx5jm1PnRvuV2kjHYGat7X09u
 fW02NVG9mf0g0J4kqyFKsPJ8YGY++UkGw0OdAW6Hg+A/sx2YiFx8+C0xah0j/p77pdCFa5xpo
 1WCaTWWR5HvT+pjZGZrgc6ysBzEEwxi0Do77dq+OSWMIK1EMhR5KDfPzPcwoz6mISVKy/czg9
 OA1c/kGcJldtTViVkZfDzqEs8JJQThG6zy+lV9ZqSygYUVkASNZfASZyxa6ZQ6tunVzaEWsB4
 3AVORCAWbsEquwBB5qVIxgXAComYVhKkWSDkmSm4qtAzMDV68NkmCtOgb0iQTUvSsGALNlqzr
 OHZ5BJYtgbwQyxmQVeprhMziEdqDsJAmi/xy56kE4ADzIuQ0MQplanY7/5ujT2EnZodu5vz7E
 K8oUJ/w2bN25eNEjO9BNaBOb0ZFsqS8QuMKLycvXKWDlp+eLlZu61CGlEJ2x1CsKzAN3t86kQ
 x7erG9PABlS4QCE1szWwBAX7gCcTSlqgfEjZx0yx7gPfMWpcUSiyhGR91axBYNjidwoU97oQb
 zfKCHiMcNO8KYdToKZMq8UdC+6+I/+5wMz0is09KlbTjMY9HVQNpo6EHWMZDXnnk/X8QsX4Bz
 FXFV4MNmqomEGdtknyEWyHhjKzprzEjBLGOln9rDUE+cP/26WWicRKxpfh3c/K3e2/zr29m
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 15:22:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/06/2020 à 14:46, Matus Kysel a écrit :
> We should add support of semtimedop syscall as new version of glibc
> 2.31 uses semop based on semtimedop
> (commit: https://gitlab.com/freedesktop-sdk/mirrors/sourceware/glibc/-/commit/765cdd0bffd77960ae852104fc4ea5edcdb8aed3 ).
> 
> Signed-off-by: Matus Kysel <mkysel@tachyum.com>
> ---
>  linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 990412733b..538a7e673c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1232,7 +1232,8 @@ static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
>      defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6) || \
>      defined(TARGET_NR_nanosleep) || defined(TARGET_NR_clock_settime) || \
>      defined(TARGET_NR_utimensat) || defined(TARGET_NR_mq_timedsend) || \
> -    defined(TARGET_NR_mq_timedreceive)
> +    defined(TARGET_NR_mq_timedreceive) || defined(TARGET_NR_ipc) || \
> +    defined(TARGET_NR_semop) || defined(TARGET_NR_semtimedop)
>  static inline abi_long target_to_host_timespec(struct timespec *host_ts,
>                                                 abi_ulong target_addr)
>  {
> @@ -3880,25 +3881,53 @@ static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
>      return 0;
>  }
>  
> -static inline abi_long do_semop(int semid, abi_long ptr, unsigned nsops)
> +#if defined(TARGET_NR_ipc) || defined(TARGET_NR_semop) || \
> +    defined(TARGET_NR_semtimedop)
> +
> +/*
> + * This macro is required to handle the s390 variants, which passes the
> + * arguments in a different order than default.
> + */
> +#ifdef __s390x__
> +#define SEMTIMEDOP_IPC_ARGS(__nsops, __sops, __timeout) \
> +  (__nsops), (__timeout), (__sops)
> +#else
> +#define SEMTIMEDOP_IPC_ARGS(__nsops, __sops, __timeout) \
> +  (__nsops), 0, (__sops), (__timeout)
> +#endif
> +
> +static inline abi_long do_semtimedop(int semid,
> +                                     abi_long ptr,
> +                                     unsigned nsops,
> +                                     abi_long timeout)
>  {
>      struct sembuf sops[nsops];
> +    struct timespec ts, *pts = NULL;
>      abi_long ret;
>  
> +    if (timeout) {
> +        pts = &ts;
> +        if (target_to_host_timespec(pts, timeout)) {
> +            return -TARGET_EFAULT;
> +        }
> +    }
> +
>      if (target_to_host_sembuf(sops, ptr, nsops))
>          return -TARGET_EFAULT;
>  
>      ret = -TARGET_ENOSYS;
>  #ifdef __NR_semtimedop
> -    ret = get_errno(safe_semtimedop(semid, sops, nsops, NULL));
> +    ret = get_errno(safe_semtimedop(semid, sops, nsops, pts));
>  #endif
>  #ifdef __NR_ipc
>      if (ret == -TARGET_ENOSYS) {
> -        ret = get_errno(safe_ipc(IPCOP_semtimedop, semid, nsops, 0, sops, 0));
> +        ret = get_errno(safe_ipc(IPCOP_semtimedop, semid,
> +                                 SEMTIMEDOP_IPC_ARGS(nsops, sops, (long)pts)));
>      }
>  #endif
>      return ret;
>  }
> +#endif
>  
>  struct target_msqid_ds
>  {
> @@ -4393,7 +4422,20 @@ static abi_long do_ipc(CPUArchState *cpu_env,
>  
>      switch (call) {
>      case IPCOP_semop:
> -        ret = do_semop(first, ptr, second);
> +        ret = do_semtimedop(first, ptr, second, 0);
> +        break;
> +    case IPCOP_semtimedop:
> +    /*
> +     * The s390 sys_ipc variant has only five parameters instead of six
> +     * (as for default variant) and the only difference is the handling of
> +     * SEMTIMEDOP where on s390 the third parameter is used as a pointer
> +     * to a struct timespec where the generic variant uses fifth parameter.
> +     */
> +#if defined(TARGET_S390X)
> +        ret = do_semtimedop(first, ptr, second, third);
> +#else
> +        ret = do_semtimedop(first, ptr, second, fifth);
> +#endif
>          break;
>  
>      case IPCOP_semget:
> @@ -9644,7 +9686,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #endif
>  #ifdef TARGET_NR_semop
>      case TARGET_NR_semop:
> -        return do_semop(arg1, arg2, arg3);
> +        return do_semtimedop(arg1, arg2, arg3, 0);
> +#endif
> +#ifdef TARGET_NR_semtimedop
> +    case TARGET_NR_semtimedop:
> +        return do_semtimedop(arg1, arg2, arg3, arg4);
>  #endif
>  #ifdef TARGET_NR_semctl
>      case TARGET_NR_semctl:
> 

I have merged PATH 1 and 2 and applied to my linux-user-for-5.1 branch.

Thanks,
Laurent

