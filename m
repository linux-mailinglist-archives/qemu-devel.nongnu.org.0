Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249EE536672
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:14:07 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudXJ-0006nR-A6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudEV-0001lh-D9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:54:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudEF-0006Mv-Nr
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:54:39 -0400
Received: by mail-pl1-x631.google.com with SMTP id c2so4624946plh.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XSNGLNIbKhY2G0a/PRFwmDwCWHy6addx9b3bDGicNsI=;
 b=MhwCrvIElTJMZEi86zBeFZo3b4tn9B7lXBpC+GqIHXNUCwtDeowfdg1hLdbMZBxeSc
 gcO23qGkWgkA/4HMi8vJv76VCkoSQ9owPY/yZX8/yOpvyl7i7zYjMfUiwJ87PzjoQ8vY
 Hzpr7r9f7Fm3zkovgL9scKut8o8gmVKtq1cHE8cMgSA5TrQlzBZ+pk09QngPn3d8gpEX
 VquvY1qMPWIJbIhiGZ+zXz5Z/3DoDnqokZsH9fHflOS243AqKa3mbmpWSx1IS2UzITg5
 5/lAG+6qwDlJjsebPN9fB/Te2rdaJkV48LVgTLG8WVRJrT8SfeENMrXr5hqUulZvoPS6
 0trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSNGLNIbKhY2G0a/PRFwmDwCWHy6addx9b3bDGicNsI=;
 b=Hl8b2yR/p2fiTxCYwpedn+f5IVxhH0XI1Y8B+8rO6aWbwy3ZbFhrczKhVk7ew6j+MW
 KbPqB2HyT5HKfF2HKL+LNkcq8U5M0uYpDec3s+uZrjyuo/UTamR9PoD7JHh1qUNkE+m/
 STsik5Dmbls2P+PDYnAS9+Or5DsM1Abv+AaoxWncb7bS+MCGeWxIj7ms8lIjvWfb+nWz
 hYjNVo26Y/lcdDu+iHsSSpnVz2VSVtS8D1+4ZEodkdEAJhIJTViyrKpe1JyB2+KsYRDq
 00LH9fWB/YNRgbCQqa7U7VwbYeokSA+CU+JrCyMRBB8x91g1Alm7UsOBXGI3KzXkxWG7
 4nzw==
X-Gm-Message-State: AOAM532tEiMZ7+A4oROgLTD736GkQ7MklnkEbBwID0U/ErcuUNQ3mcdt
 VnrG7RiUr7N2rK4U53M+9e58XA==
X-Google-Smtp-Source: ABdhPJyDiEIAJbXAYsSMe1ngcAGIdR1DChtJWE+u+rrIEBaiMtIbZ12eb/RL6hGJelBA0TaJ44PETQ==
X-Received: by 2002:a17:90a:b78d:b0:1d9:4f4f:bc2a with SMTP id
 m13-20020a17090ab78d00b001d94f4fbc2amr9364741pjr.155.1653670461926; 
 Fri, 27 May 2022 09:54:21 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170902a40700b0015ea3a491a1sm3917791plq.191.2022.05.27.09.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 09:54:21 -0700 (PDT)
Message-ID: <7d1f48f1-50f3-d1d9-43b8-b608b50a8de9@linaro.org>
Date: Fri, 27 May 2022 09:54:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 01/15] include: move qemu_*_exec_dir() to cutils
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, peter.maydell@linaro.org
References: <20220527135459.117877-1-marcandre.lureau@redhat.com>
 <20220527135459.117877-2-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220527135459.117877-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/27/22 06:54, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The function is required by get_relocated_path() (already in cutils),
> and used by qemu-ga and may be generally useful.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20220525144140.591926-2-marcandre.lureau@redhat.com>

You seem to have missed an include moving this code -- fails on freebsd:

https://gitlab.com/qemu-project/qemu/-/jobs/2515649103

../util/cutils.c:984:30: error: use of undeclared identifier 'CTL_KERN'
         static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
                              ^
../util/cutils.c:984:40: error: use of undeclared identifier 'KERN_PROC'
         static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
                                        ^
../util/cutils.c:984:51: error: use of undeclared identifier 'KERN_PROC_PATHNAME'
         static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
                                                   ^
../util/cutils.c:991:14: error: implicit declaration of function 'sysctl' is invalid in 
C99 [-Werror,-Wimplicit-function-declaration]
         if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
              ^
../util/cutils.c:991:14: note: did you mean 'syscall'?
/usr/include/unistd.h:582:6: note: 'syscall' declared here
int      syscall(int, ...);
          ^

r~


> ---
>   include/qemu/cutils.h                |   7 ++
>   include/qemu/osdep.h                 |   8 --
>   qemu-io.c                            |   1 +
>   storage-daemon/qemu-storage-daemon.c |   1 +
>   tests/qtest/fuzz/fuzz.c              |   1 +
>   util/cutils.c                        | 108 +++++++++++++++++++++++++++
>   util/oslib-posix.c                   |  81 --------------------
>   util/oslib-win32.c                   |  36 ---------
>   8 files changed, 118 insertions(+), 125 deletions(-)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 5c6572d444..40e10e19a7 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -193,6 +193,13 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
>    */
>   int qemu_pstrcmp0(const char **str1, const char **str2);
>   
> +/* Find program directory, and save it for later usage with
> + * qemu_get_exec_dir().
> + * Try OS specific API first, if not working, parse from argv0. */
> +void qemu_init_exec_dir(const char *argv0);
> +
> +/* Get the saved exec dir.  */
> +const char *qemu_get_exec_dir(void);
>   
>   /**
>    * get_relocated_path:
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index a72e99db85..b1c161c035 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -557,14 +557,6 @@ void qemu_set_cloexec(int fd);
>    */
>   char *qemu_get_local_state_dir(void);
>   
> -/* Find program directory, and save it for later usage with
> - * qemu_get_exec_dir().
> - * Try OS specific API first, if not working, parse from argv0. */
> -void qemu_init_exec_dir(const char *argv0);
> -
> -/* Get the saved exec dir.  */
> -const char *qemu_get_exec_dir(void);
> -
>   /**
>    * qemu_getauxval:
>    * @type: the auxiliary vector key to lookup
> diff --git a/qemu-io.c b/qemu-io.c
> index d70d3dd4fd..2bd7bfb650 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -16,6 +16,7 @@
>   #endif
>   
>   #include "qemu/help-texts.h"
> +#include "qemu/cutils.h"
>   #include "qapi/error.h"
>   #include "qemu-io.h"
>   #include "qemu/error-report.h"
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 9b8b17f52e..c104817cdd 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -44,6 +44,7 @@
>   
>   #include "qemu/help-texts.h"
>   #include "qemu-version.h"
> +#include "qemu/cutils.h"
>   #include "qemu/config-file.h"
>   #include "qemu/error-report.h"
>   #include "qemu/help_option.h"
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index a7a5e14fa3..0ad4ba9e94 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -15,6 +15,7 @@
>   
>   #include <wordexp.h>
>   
> +#include "qemu/cutils.h"
>   #include "qemu/datadir.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/qtest.h"
> diff --git a/util/cutils.c b/util/cutils.c
> index b2777210e7..6cc7cc8cde 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -931,6 +931,114 @@ static inline const char *next_component(const char *dir, int *p_len)
>       return dir;
>   }
>   
> +static const char *exec_dir;
> +
> +void qemu_init_exec_dir(const char *argv0)
> +{
> +#ifdef G_OS_WIN32
> +    char *p;
> +    char buf[MAX_PATH];
> +    DWORD len;
> +
> +    if (exec_dir) {
> +        return;
> +    }
> +
> +    len = GetModuleFileName(NULL, buf, sizeof(buf) - 1);
> +    if (len == 0) {
> +        return;
> +    }
> +
> +    buf[len] = 0;
> +    p = buf + len - 1;
> +    while (p != buf && *p != '\\') {
> +        p--;
> +    }
> +    *p = 0;
> +    if (access(buf, R_OK) == 0) {
> +        exec_dir = g_strdup(buf);
> +    } else {
> +        exec_dir = CONFIG_BINDIR;
> +    }
> +#else
> +    char *p = NULL;
> +    char buf[PATH_MAX];
> +
> +    if (exec_dir) {
> +        return;
> +    }
> +
> +#if defined(__linux__)
> +    {
> +        int len;
> +        len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
> +        if (len > 0) {
> +            buf[len] = 0;
> +            p = buf;
> +        }
> +    }
> +#elif defined(__FreeBSD__) \
> +      || (defined(__NetBSD__) && defined(KERN_PROC_PATHNAME))
> +    {
> +#if defined(__FreeBSD__)
> +        static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
> +#else
> +        static int mib[4] = {CTL_KERN, KERN_PROC_ARGS, -1, KERN_PROC_PATHNAME};
> +#endif
> +        size_t len = sizeof(buf) - 1;
> +
> +        *buf = '\0';
> +        if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
> +            *buf) {
> +            buf[sizeof(buf) - 1] = '\0';
> +            p = buf;
> +        }
> +    }
> +#elif defined(__APPLE__)
> +    {
> +        char fpath[PATH_MAX];
> +        uint32_t len = sizeof(fpath);
> +        if (_NSGetExecutablePath(fpath, &len) == 0) {
> +            p = realpath(fpath, buf);
> +            if (!p) {
> +                return;
> +            }
> +        }
> +    }
> +#elif defined(__HAIKU__)
> +    {
> +        image_info ii;
> +        int32_t c = 0;
> +
> +        *buf = '\0';
> +        while (get_next_image_info(0, &c, &ii) == B_OK) {
> +            if (ii.type == B_APP_IMAGE) {
> +                strncpy(buf, ii.name, sizeof(buf));
> +                buf[sizeof(buf) - 1] = 0;
> +                p = buf;
> +                break;
> +            }
> +        }
> +    }
> +#endif
> +    /* If we don't have any way of figuring out the actual executable
> +       location then try argv[0].  */
> +    if (!p && argv0) {
> +        p = realpath(argv0, buf);
> +    }
> +    if (p) {
> +        exec_dir = g_path_get_dirname(p);
> +    } else {
> +        exec_dir = CONFIG_BINDIR;
> +    }
> +#endif
> +}
> +
> +const char *qemu_get_exec_dir(void)
> +{
> +    return exec_dir;
> +}
> +
>   char *get_relocated_path(const char *dir)
>   {
>       size_t prefix_len = strlen(CONFIG_PREFIX);
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 477990f39b..7ba4472760 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -283,87 +283,6 @@ void qemu_set_tty_echo(int fd, bool echo)
>       tcsetattr(fd, TCSANOW, &tty);
>   }
>   
> -static const char *exec_dir;
> -
> -void qemu_init_exec_dir(const char *argv0)
> -{
> -    char *p = NULL;
> -    char buf[PATH_MAX];
> -
> -    if (exec_dir) {
> -        return;
> -    }
> -
> -#if defined(__linux__)
> -    {
> -        int len;
> -        len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
> -        if (len > 0) {
> -            buf[len] = 0;
> -            p = buf;
> -        }
> -    }
> -#elif defined(__FreeBSD__) \
> -      || (defined(__NetBSD__) && defined(KERN_PROC_PATHNAME))
> -    {
> -#if defined(__FreeBSD__)
> -        static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
> -#else
> -        static int mib[4] = {CTL_KERN, KERN_PROC_ARGS, -1, KERN_PROC_PATHNAME};
> -#endif
> -        size_t len = sizeof(buf) - 1;
> -
> -        *buf = '\0';
> -        if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
> -            *buf) {
> -            buf[sizeof(buf) - 1] = '\0';
> -            p = buf;
> -        }
> -    }
> -#elif defined(__APPLE__)
> -    {
> -        char fpath[PATH_MAX];
> -        uint32_t len = sizeof(fpath);
> -        if (_NSGetExecutablePath(fpath, &len) == 0) {
> -            p = realpath(fpath, buf);
> -            if (!p) {
> -                return;
> -            }
> -        }
> -    }
> -#elif defined(__HAIKU__)
> -    {
> -        image_info ii;
> -        int32_t c = 0;
> -
> -        *buf = '\0';
> -        while (get_next_image_info(0, &c, &ii) == B_OK) {
> -            if (ii.type == B_APP_IMAGE) {
> -                strncpy(buf, ii.name, sizeof(buf));
> -                buf[sizeof(buf) - 1] = 0;
> -                p = buf;
> -                break;
> -            }
> -        }
> -    }
> -#endif
> -    /* If we don't have any way of figuring out the actual executable
> -       location then try argv[0].  */
> -    if (!p && argv0) {
> -        p = realpath(argv0, buf);
> -    }
> -    if (p) {
> -        exec_dir = g_path_get_dirname(p);
> -    } else {
> -        exec_dir = CONFIG_BINDIR;
> -    }
> -}
> -
> -const char *qemu_get_exec_dir(void)
> -{
> -    return exec_dir;
> -}
> -
>   #ifdef CONFIG_LINUX
>   static void sigbus_handler(int signal, siginfo_t *siginfo, void *ctx)
>   #else /* CONFIG_LINUX */
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index dafef4f157..6c818749d2 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -269,42 +269,6 @@ void qemu_set_tty_echo(int fd, bool echo)
>       }
>   }
>   
> -static const char *exec_dir;
> -
> -void qemu_init_exec_dir(const char *argv0)
> -{
> -
> -    char *p;
> -    char buf[MAX_PATH];
> -    DWORD len;
> -
> -    if (exec_dir) {
> -        return;
> -    }
> -
> -    len = GetModuleFileName(NULL, buf, sizeof(buf) - 1);
> -    if (len == 0) {
> -        return;
> -    }
> -
> -    buf[len] = 0;
> -    p = buf + len - 1;
> -    while (p != buf && *p != '\\') {
> -        p--;
> -    }
> -    *p = 0;
> -    if (access(buf, R_OK) == 0) {
> -        exec_dir = g_strdup(buf);
> -    } else {
> -        exec_dir = CONFIG_BINDIR;
> -    }
> -}
> -
> -const char *qemu_get_exec_dir(void)
> -{
> -    return exec_dir;
> -}
> -
>   int getpagesize(void)
>   {
>       SYSTEM_INFO system_info;


