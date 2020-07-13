Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC421DB92
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 18:19:47 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv1BC-0005Mg-ET
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 12:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv19z-0004X1-L7
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:18:31 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv19x-0002QI-JT
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:18:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6EOc-1jxE531rsu-006hYf; Mon, 13 Jul 2020 18:18:25 +0200
Subject: Re: [PATCH] linux-user: implement the semtimedop syscall
To: Andreas Schwab <schwab@suse.de>
References: <mvmy2nn7ms3.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <00ef8fd1-5b5b-5bce-a9dd-6874c35edb18@vivier.eu>
Date: Mon, 13 Jul 2020 18:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <mvmy2nn7ms3.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FZG2M5wiur35x4DCOVGPSeAsjzSwCM/vjUyLAn2rYyWV1KPPeFz
 NNkkW/3ItnOZdFNbteLmY6VOcg69utpeMNEzHZLgN32DAT1B9U+HN0X4EaEEQmWX2zLrjz5
 1fDTfKdd2GoZAAhjH7j/v0TGiQmXLTAJMLnIzfx1Zxi5FsIfoMS66emmxzWFQzkuYOWTxmG
 202iBzDhyKOb0/sk8RDMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j7Ku+XBhLIY=:eRdDtwmROpaKmiXgG7kvxh
 Fd64mM5I9bxbBCwfTK7j5MuuQ+2TiU0lgTSvIKn0jWhIKHCoOQl08EC1o9qs+xL69lx6/6O4a
 KgFoOyCdlvKQ3G9gT8WKBt9p4WTO9Up/xkPv2ybF6oweT9UNgFP0HRrnx3FhNxfT8Y8Fk+SRK
 QSMyhdDFHH5BibfJraihAxaUYQYoKYTTmIkWqCiDhSQFTIrPufTxRe75egqj01nZ+p4n7jxw6
 mix9k1dtDRja78ZgeJXlt7LxSGrFubRKLBnBcTpVVHE9rgPNLTqDOcb9NOU9D9s9W5yMop+Nd
 /MfFl4vr4zF+faV0QTNrVN84cCy+2TONBgJMOAoDQ6477JD+IV3OWJbNjn4U1FJO5TJLiYMCx
 lEPig5MNmpHsnGJmg9rkKeKo0Sr85EMSZnscWvdtfILpGeV6NQ5RhN8KD89pUJXJWTq8/5re4
 fK6cC80eATlr1TtbKjHXZe4ZP6PoRc8OhAo5ArjzyIPLaE7/SiL26Anj/DJ1js4FooepCixjz
 hfEvv6D0ik7aOy3hSu8rkS/C1BfE9Gqr1g/UKHN5DiA4n9atHkB/v6YCBrnPSDTsISszSB+Hv
 7OsBAdqU5/JdmnFibqTmjBY5u1llWh/1nqLlkxSUJM3nsjOFVPyEMhwyY1hWNqZmywHzo25qC
 2B/TB+DBUAecofG7/tYIth5DzR9PiCGjgh7fYjwEKu7R0xDaQVoEa9a8P0BGk8ypRqyJO1E2M
 fRpFZ2TEwdCwGG/RFU9VSxEqarCLJnQdDRJE7FMYW1wfjvluk0ttqEWzZvAftguoZ38a9w8vX
 jqzHY4WsKne+/6xC4OnwI7f0WAFlSlOEQ3Y27nHCnr6Xgj/DbiqR9iF46uCvoEjZvITzmWk
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 12:18:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you but we have already a series pending to fix that:

https://patchew.org/QEMU/20200626124612.58593-1-mkysel@tachyum.com/

Laurent

Le 13/07/2020 à 12:05, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9ec03a889d..7c0f5b83ff 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3877,23 +3877,37 @@ static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
>      return 0;
>  }
>  
> -static inline abi_long do_semop(int semid, abi_long ptr, unsigned nsops)
> +static inline abi_long do_semtimedop(int semid, abi_long ptr, unsigned nsops,
> +    abi_long timeout)
>  {
>      struct sembuf sops[nsops];
> +    struct timespec ts, *pts;
>      abi_long ret;
>  
>      if (target_to_host_sembuf(sops, ptr, nsops))
>          return -TARGET_EFAULT;
>  
> +    if (timeout) {
> +        pts = &ts;
> +        if (target_to_host_timespec(pts, timeout)) {
> +            return -TARGET_EFAULT;
> +        }
> +    } else {
> +        pts = NULL;
> +    }
> +
>      ret = -TARGET_ENOSYS;
>  #ifdef __NR_semtimedop
> -    ret = get_errno(safe_semtimedop(semid, sops, nsops, NULL));
> +    ret = get_errno(safe_semtimedop(semid, sops, nsops, pts));
>  #endif
>  #ifdef __NR_ipc
>      if (ret == -TARGET_ENOSYS) {
> -        ret = get_errno(safe_ipc(IPCOP_semtimedop, semid, nsops, 0, sops, 0));
> +        ret = get_errno(safe_ipc(IPCOP_semtimedop, semid, nsops, 0, sops, pts));
>      }
>  #endif
> +    if (!is_error(ret) && timeout) {
> +        ret = host_to_target_timespec(timeout, pts);
> +    }
>      return ret;
>  }
>  
> @@ -4371,7 +4385,11 @@ static abi_long do_ipc(CPUArchState *cpu_env,
>  
>      switch (call) {
>      case IPCOP_semop:
> -        ret = do_semop(first, ptr, second);
> +        ret = do_semtimedop(first, ptr, second, 0);
> +        break;
> +
> +    case IPCOP_semtimedop:
> +        ret = do_semtimedop(first, ptr, second, third);
>          break;
>  
>      case IPCOP_semget:
> @@ -9683,7 +9701,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


