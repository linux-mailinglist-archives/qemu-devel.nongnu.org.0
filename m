Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D630032
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 18:31:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWNy9-00042p-Sa
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 12:31:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hWNwn-0003Og-2k
	for qemu-devel@nongnu.org; Thu, 30 May 2019 12:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hWNwl-0006nP-No
	for qemu-devel@nongnu.org; Thu, 30 May 2019 12:30:33 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:51879)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hWNwl-0006n3-Ey; Thu, 30 May 2019 12:30:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MA88C-1hQNfg1jxq-00BgWD; Thu, 30 May 2019 18:30:22 +0200
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190530143916.20255-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ced800af-8f00-cc27-358d-57cb0e715e45@vivier.eu>
Date: Thu, 30 May 2019 18:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530143916.20255-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OXBBRV1jbcaTvxs09wiB5t6LAnDsLlH8toXVQZoCrdkjUnwj1mx
	YWWwi1H4YcZA7COE8r8fB4AY+RJ8qtGBWcmj4FhJGbizGsZgGTzrJhSDICxXMB2PVLIhIsA
	P1dmqumSbrnA+ta3IKyVPwn7Z0k6ZlYR7d0dz08k+wW+kG4XkY1feOa9c81RNhbJb6FLvGM
	pu9D2lbCmXPpI1W2Q2fPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:56/LrKOKgy4=:Ivz+5Func4aFpbRBIOHS7r
	zSrZYkd5wM1zqdfVBg+76Mqu4DuneGZbDCtG8CbsSMrCAD7Y/jTE7wlE1XueATZE5mPnp0sqO
	7QaDXRl9xKNpKQiRr8FLhzyw8eZCtF7XPG7n6NXHiC+IvDCGJb83FiMNMsgkQd6rfSsY5CBkx
	TM2PiSxsrKggMWHUyMZeqrBvVhNiQQTLUYAk8VHXq9u48uzDJCR8Zr22KapjLJDJBzxpgBE3+
	kOtmK828rJE5X2sKG1p39d4mXI6dg1HVJyFKhNkt9rCUU7GHSK8VvDwxyL8L5wj6XTneHZucp
	KBfL/34j/kLEeJseYRoa7PFqcuwTEgq0taONjAhe/3twQYV7eNt4bAGCefWcwRa4jnMVa/AC6
	9NtQs9l3If85QwEnM27Il6VCRXmn6gch6fR6+7uLMhHTZXsNgCvXSsG0apukplhl/cUhmX5zN
	9A1RA3pwfyHSFuE/birfv9a400qiveNO4bbA9zmXmykZulmL5Qn1qBJq8g+toueAqYM7DgIp1
	GcNA1utoCnHUMrN7R4ANTTDqz54R5YVCRcEEMO+HwOLmmbxnxMbIebir9TmQli3n6JaEbh3YL
	zZ5hh6OQKeOnMfBa3SuuBuLnF5+hKqiMBJQg0XNQ/A0eJ2QptXdQUQj2otJepdzN6WcFsEtR3
	4prTRVuxZ/JrHL9KxZU16u5i6JMOQWwpTOht4V0nySwZKzdIcwfxZwNoKq93XesY4StBDRrI/
	W7LIUR4FY97JsKqkbwYO88isUhQJG2tfYzNN2/VA+fT36phWA+z7SEbcLgM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [RFC PATCH] semihosting: split console_out intro
 string and char versions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/05/2019 à 16:39, Alex Bennée a écrit :
> This is ostensibly to avoid the weirdness of len looking like it might
> come from a guest and sometimes being used. While we are at it fix up
> the error checking for the arm-linux-user implementation of the API
> which got flagged up by Coverity (CID 1401700).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/semihosting/console.c         | 34 +++++++++++++++++++++++---------
>  include/hw/semihosting/console.h | 25 +++++++++++++++++------
>  linux-user/arm/semihost.c        | 28 ++++++++++++++++++++++++--
>  target/arm/arm-semi.c            |  4 ++--
>  4 files changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
> index 466ea6dade7..4a5758972db 100644
> --- a/hw/semihosting/console.c
> +++ b/hw/semihosting/console.c
> @@ -36,26 +36,24 @@ int qemu_semihosting_log_out(const char *s, int len)
>  /*
>   * A re-implementation of lock_user_string that we can use locally
>   * instead of relying on softmmu-semi. Hopefully we can deprecate that
> - * in time. We either copy len bytes if specified or until we find a NULL.
> + * in time. Copy string until we find a 0 or address error.
>   */
> -static GString *copy_user_string(CPUArchState *env, target_ulong addr, int len)
> +static GString *copy_user_string(CPUArchState *env, target_ulong addr)
>  {
>      CPUState *cpu = ENV_GET_CPU(env);
> -    GString *s = g_string_sized_new(len ? len : 128);
> +    GString *s = g_string_sized_new(128);
>      uint8_t c;
> -    bool done;
>  
>      do {
>          if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
>              s = g_string_append_c(s, c);
> -            done = len ? s->len == len : c == 0;
>          } else {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "%s: passed inaccessible address " TARGET_FMT_lx,
>                            __func__, addr);
> -            done = true;
> +            break;
>          }
> -    } while (!done);
> +    } while (c!=0);
>  
>      return s;
>  }
> @@ -68,9 +66,9 @@ static void semihosting_cb(CPUState *cs, target_ulong ret, target_ulong err)
>      }
>  }
>  
> -int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
> +int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
>  {
> -    GString *s = copy_user_string(env, addr, len);
> +    GString *s = copy_user_string(env, addr);
>      int out = s->len;
>  
>      if (use_gdb_syscalls()) {
> @@ -82,3 +80,21 @@ int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
>      g_string_free(s, true);
>      return out;
>  }
> +
> +void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
> +{
> +    CPUState *cpu = ENV_GET_CPU(env);
> +    uint8_t c;
> +
> +    if (cpu_memory_rw_debug(cpu, addr, &c, 1, 0) == 0) {
> +        if (use_gdb_syscalls()) {
> +            gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, 1);
> +        } else {
> +            qemu_semihosting_log_out((const char *) &c, 1);
> +        }
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: passed inaccessible address " TARGET_FMT_lx,
> +                      __func__, addr);
> +    }
> +}
> diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
> index 30e66ae20aa..3a4fba75905 100644
> --- a/include/hw/semihosting/console.h
> +++ b/include/hw/semihosting/console.h
> @@ -10,17 +10,30 @@
>  #define _SEMIHOST_CONSOLE_H_
>  
>  /**
> - * qemu_semihosting_console_out:
> + * qemu_semihosting_console_outs:
>   * @env: CPUArchState
> - * @s: host address of guest string
> - * @len: length of string or 0 (string is null terminated)
> + * @s: host address of null terminated guest string
>   *
> - * Send a guest string to the debug console. This may be the remote
> - * gdb session if a softmmu guest is currently being debugged.
> + * Send a null terminated guest string to the debug console. This may
> + * be the remote gdb session if a softmmu guest is currently being
> + * debugged.
>   *
>   * Returns: number of bytes written.
>   */
> -int qemu_semihosting_console_out(CPUArchState *env, target_ulong s, int len);
> +int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
> +
> +/**
> + * qemu_semihosting_console_outc:
> + * @env: CPUArchState
> + * @s: host address of null terminated guest string
> + *
> + * Send single character from guest memory to the debug console. This
> + * may be the remote gdb session if a softmmu guest is currently being
> + * debugged.
> + *
> + * Returns: nothing
> + */
> +void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>  
>  /**
>   * qemu_semihosting_log_out:
> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
> index 9554102a855..b7cdc21f832 100644
> --- a/linux-user/arm/semihost.c
> +++ b/linux-user/arm/semihost.c
> @@ -15,10 +15,34 @@
>  #include "hw/semihosting/console.h"
>  #include "qemu.h"
>  
> -int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
> +int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
>  {
> +    int len;
>      void *s = lock_user_string(addr);
> -    len = write(STDERR_FILENO, s, len ? len : strlen(s));
> +    if (!s) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: passed inaccessible address " TARGET_FMT_lx,
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    len = write(STDERR_FILENO, s, strlen(s));

You could avoid 2 calls to strlen() if you inline directly
lock_user_string() content:

    len = target_strlen(addr);
    if (len < 0){
       qemu_log_mask(LOG_GUEST_ERROR,
                     "%s: passed inaccessible address " TARGET_FMT_lx,
                     __func__, addr);
       return 0;
    }
    s = lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
    len = write(STDERR_FILENO, s, len);

>      unlock_user(s, addr, 0);
>      return len;
>  }

Thanks,
Laurent

