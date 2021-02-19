Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4A31F678
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:23:16 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD20J-0000tn-2Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lD1z4-0000T6-TZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:21:58 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lD1z1-0005d3-SB
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:21:58 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIxJq-1lRxIj06g6-00KODt; Fri, 19 Feb 2021 10:21:43 +0100
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-19-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 18/40] linux-user: Fix types in uaccess.c
Message-ID: <ec051472-7511-62da-d485-17f7573aa460@vivier.eu>
Date: Fri, 19 Feb 2021 10:21:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216161658.29881-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j3twMP8G7WBWgwOZvs7F9Z5yT69VTyvLPgOCzFoAM3ipr0cyQhn
 TgIegRbfJ60RLlnYBPOoPW1qpvI7fgmz0UrZ/0cgVqv9U6ubibeVsN9/M89j6zAGl7a4B/6
 1gRdJT0kwFQ51Yd5zsx598Zy+EaTxXiiVtt6oDTt+nSiRJ1hCF4XqZAg1VKkjWIGlrvDq2I
 CWkPKFqGqKj/oOCgPZd5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ItBpCzCQ2uU=:C+FDptd/s74+lk+jn+9pa6
 cVhcpRu/hDy0bZ9ueSdIHGkMEH2Dbj7EoIrcTTaD2pRvZIh7be+7f9ObpYUIL+fZWQABSbE08
 SAAOdrgJMSVLK66c2DGJ0fF80dUVbog2sRONRY5rHfk6HKyhyJA59r5BhUiHmgqauwbITHS1M
 Kl9WcRFsuQB7rU6AscUxwryZmHJRvg+SHLNwpS3VumsR1bozspsihVdji5T18hZ7A/8stB9wB
 K5fnUc8qgEZs95ugysAHLt3A7R6fHAVZ7BTCT5f/lrmGCVHG5ddgTpz+YSRhs15usi2wAB6aj
 xthz94e4nkqopvGjSt349JnCAVTx58wNnaagNHv1rYeGR7ShG0LnLMVMZfOyVicv7LKjVA39L
 NmYhc01bIoktzZd0Xyph6wVZxBw3TS/0iXtpxY36PwNlq42ZSnhltK1UtDG8k
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

I think this commit is the cause of CID 1446711.

There is no concistancy between the various declarations of unlock_user():

bsd-user/qemu.h

static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
                               long len)

include/exec/softmmu-semi.h

static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
                                target_ulong len)
...
#define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)

linux-user/qemu.h

#ifndef DEBUG_REMAP
static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
{ }
#else
void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
#endif

To take a signed long here allows to unconditionnaly call the unlock_user() function after the
syscall and not to copy the buffer if the value is negative.

Thanks,
Laurent

Le 16/02/2021 à 17:16, Peter Maydell a écrit :
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
> to involve abi_long.  Use size_t for lengths.  Use bool for the
> lock_user copy argument.  Use ssize_t for target_strlen, because
> we can't overflow the host memory space.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-id: 20210212184902.1251044-19-richard.henderson@linaro.org
> [PMM: moved fix for ifdef error to previous commit]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h    | 12 +++++-------
>  linux-user/uaccess.c | 45 ++++++++++++++++++++++----------------------
>  2 files changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 971af97a2fb..d25a5dafc0f 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -7,8 +7,6 @@
>  #include "exec/cpu_ldst.h"
>  
>  #undef DEBUG_REMAP
> -#ifdef DEBUG_REMAP
> -#endif /* DEBUG_REMAP */
>  
>  #include "exec/user/abitypes.h"
>  
> @@ -629,8 +627,8 @@ static inline bool access_ok(CPUState *cpu, int type,
>   * buffers between the target and host.  These internally perform
>   * locking/unlocking of the memory.
>   */
> -abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
> -abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
> +int copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
> +int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
>  
>  /* Functions for accessing guest memory.  The tget and tput functions
>     read/write single values, byteswapping as necessary.  The lock_user function
> @@ -640,13 +638,13 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
>  
>  /* Lock an area of guest memory into the host.  If copy is true then the
>     host area will have the same contents as the guest.  */
> -void *lock_user(int type, abi_ulong guest_addr, long len, int copy);
> +void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy);
>  
>  /* Unlock an area of guest memory.  The first LEN bytes must be
>     flushed back to guest memory. host_ptr = NULL is explicitly
>     allowed and does nothing. */
>  #ifndef DEBUG_REMAP
> -static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
> +static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
>  { }
>  #else
>  void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
> @@ -654,7 +652,7 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>  
>  /* Return the length of a string in target memory or -TARGET_EFAULT if
>     access error. */
> -abi_long target_strlen(abi_ulong gaddr);
> +ssize_t target_strlen(abi_ulong gaddr);
>  
>  /* Like lock_user but for null terminated strings.  */
>  void *lock_user_string(abi_ulong guest_addr);
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index bba012ed159..76af6a92b11 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -4,7 +4,7 @@
>  
>  #include "qemu.h"
>  
> -void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
> +void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
>  {
>      if (!access_ok_untagged(type, guest_addr, len)) {
>          return NULL;
> @@ -26,7 +26,7 @@ void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
>  }
>  
>  #ifdef DEBUG_REMAP
> -void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
> +void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
>  {
>      if (!host_ptr) {
>          return;
> @@ -34,7 +34,7 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>      if (host_ptr == g2h_untagged(guest_addr)) {
>          return;
>      }
> -    if (len > 0) {
> +    if (len != 0) {
>          memcpy(g2h_untagged(guest_addr), host_ptr, len);
>      }
>      g_free(host_ptr);
> @@ -43,53 +43,53 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>  
>  void *lock_user_string(abi_ulong guest_addr)
>  {
> -    abi_long len = target_strlen(guest_addr);
> +    ssize_t len = target_strlen(guest_addr);
>      if (len < 0) {
>          return NULL;
>      }
> -    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
> +    return lock_user(VERIFY_READ, guest_addr, (size_t)len + 1, 1);
>  }
>  
>  /* copy_from_user() and copy_to_user() are usually used to copy data
>   * buffers between the target and host.  These internally perform
>   * locking/unlocking of the memory.
>   */
> -abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
> +int copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
>  {
> -    abi_long ret = 0;
> -    void *ghptr;
> +    int ret = 0;
> +    void *ghptr = lock_user(VERIFY_READ, gaddr, len, 1);
>  
> -    if ((ghptr = lock_user(VERIFY_READ, gaddr, len, 1))) {
> +    if (ghptr) {
>          memcpy(hptr, ghptr, len);
>          unlock_user(ghptr, gaddr, 0);
> -    } else
> +    } else {
>          ret = -TARGET_EFAULT;
> -
> +    }
>      return ret;
>  }
>  
> -
> -abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
> +int copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
>  {
> -    abi_long ret = 0;
> -    void *ghptr;
> +    int ret = 0;
> +    void *ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0);
>  
> -    if ((ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0))) {
> +    if (ghptr) {
>          memcpy(ghptr, hptr, len);
>          unlock_user(ghptr, gaddr, len);
> -    } else
> +    } else {
>          ret = -TARGET_EFAULT;
> +    }
>  
>      return ret;
>  }
>  
>  /* Return the length of a string in target memory or -TARGET_EFAULT if
>     access error  */
> -abi_long target_strlen(abi_ulong guest_addr1)
> +ssize_t target_strlen(abi_ulong guest_addr1)
>  {
>      uint8_t *ptr;
>      abi_ulong guest_addr;
> -    int max_len, len;
> +    size_t max_len, len;
>  
>      guest_addr = guest_addr1;
>      for(;;) {
> @@ -101,11 +101,12 @@ abi_long target_strlen(abi_ulong guest_addr1)
>          unlock_user(ptr, guest_addr, 0);
>          guest_addr += len;
>          /* we don't allow wrapping or integer overflow */
> -        if (guest_addr == 0 || 
> -            (guest_addr - guest_addr1) > 0x7fffffff)
> +        if (guest_addr == 0 || (guest_addr - guest_addr1) > 0x7fffffff) {
>              return -TARGET_EFAULT;
> -        if (len != max_len)
> +        }
> +        if (len != max_len) {
>              break;
> +        }
>      }
>      return guest_addr - guest_addr1;
>  }
> 


