Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF2100583
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 13:23:57 +0100 (CET)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWg4S-0002i2-P4
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 07:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iWg3M-0001nv-I0
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:22:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iWg3K-0000sy-F7
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:22:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iWg3K-0000sS-5o
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:22:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id z19so18607801wmk.3
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 04:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vl6ghxplkBl691bZ0NdDI6Nqp1Ev7jV1JTYbTD1cpwc=;
 b=a0Y5plbJhoXcA3359sse8mnNszI/8mtLFyrRKNpEwtqGZ6mRuTAuMebn/bpKsT9LbZ
 i5U3gyNJ/Ksfx+2LJyZrrMsVHvYfLnI9F8MEtpcS8E/IigJnQipTQLzJGXWNS3DTZBan
 3vVH5p2YMUUhk0ibJwCKI3OtXl34VA5KFZnkGdO3U1H2LRhZMlJaE2d0f0GBvQG3C2P9
 OaZcCKjwgfdDyIeD7LskjmMJsLh8IUrxQbI7Ws7MXvuoOoXqqNTLQInz1ZzIbnw1Lxsp
 wlOUlURe+sVlHoHc6nC4T7lQC7A8VrmCKXBf2MXZx0tHcAsoQVIRUurIE8Qv1Z9LiWPV
 8k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=vl6ghxplkBl691bZ0NdDI6Nqp1Ev7jV1JTYbTD1cpwc=;
 b=OdJ0T1QLW+p4Z4R8BP+sth7wSTI8/YXNHKraIDW6j8dinDoTvls4OvsIZ9evaY5Ge7
 sIZrZoZhEC5R9k9un1e2efobZf/J0n9kV5+KG6AGWnfAsdveWbUDSyxEpJBt1vwZBUgm
 GoaR9Lw4rklxek12GCXANI5y97frLcg8vcnuKHE679HzdKnq84/FQ+YrIGJ/VreQ+96H
 sLA9hBR/5lpof1+KPFLjpK1nFglH/tNI6ezbRvVK3//uNsVa+G0VM7r10HliwICcve+r
 bXcAP7oy16N8wKB0EjtOo24bZMd09Ws+jkMf+7jKIKiEsEbMz4WYQdsx07H6FO8pyoWo
 s3yw==
X-Gm-Message-State: APjAAAVBupYqeKO6MyTAWz+yTzk4NMzdqNFElYlji6pYlM+8vNV5Q/6V
 KVPRE69/6reLc9nRl44WwzJxXw==
X-Google-Smtp-Source: APXvYqxHMhHgNTW1l5k8v7IiwaMJol1kjPgqBFf/qC2UwIBmWlF+vNEk4Vqp0wqmP9bUc+xd2g5bvg==
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr26658638wml.158.1574079764346; 
 Mon, 18 Nov 2019 04:22:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t12sm21980611wrx.93.2019.11.18.04.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 04:22:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BA791FF87;
 Mon, 18 Nov 2019 12:22:42 +0000 (GMT)
References: <20191115131040.2834-1-robert.foley@linaro.org>
 <20191115131040.2834-6-robert.foley@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v2 5/6] Add use of RCU for qemu_logfile.
In-reply-to: <20191115131040.2834-6-robert.foley@linaro.org>
Date: Mon, 18 Nov 2019 12:22:42 +0000
Message-ID: <87a78tgyr1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: peter.puhov@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> This now allows changing the logfile while logging is active,
> and also solves the issue of a seg fault while changing the logfile.
>
> Any read access to the qemu_logfile handle will use
> the rcu_read_lock()/unlock() around the use of the handle.
> To fetch the handle we will use atomic_rcu_read().
> We also in many cases do a check for validity of the
> logfile handle before using it to deal with the case where the
> file is closed and set to NULL.
>
> The cases where we write to the qemu_logfile will use atomic_rcu_set().
> Writers will also use call_rcu() with a newly added qemu_logfile_free
> function for freeing/closing when readers have finished.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---
> v2
>     - No specific changes, just merging in cleanup changes in qemu_set_lo=
g().
> ---
> v1
>     - Changes for review comments.
>     - Minor changes to definition of QemuLogFile.
>     - Changed qemu_log_separate() to fix unbalanced and
>       remove qemu_log_enabled() check.
>     - changed qemu_log_lock() to include else.
>     - make qemu_logfile_free static.
>     - use g_assert(logfile) in qemu_logfile_free.
>     - Relocated unlock out of if/else in qemu_log_close(), and
>       in qemu_set_log().
> ---
>  include/qemu/log.h | 42 +++++++++++++++++++++++----
>  util/log.c         | 72 ++++++++++++++++++++++++++++++++--------------
>  include/exec/log.h | 33 ++++++++++++++++++---
>  tcg/tcg.c          | 12 ++++++--
>  4 files changed, 126 insertions(+), 33 deletions(-)
>
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index a7c5b01571..528e1f9dd7 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -3,9 +3,16 @@
>
>  /* A small part of this API is split into its own header */
>  #include "qemu/log-for-trace.h"
> +#include "qemu/rcu.h"
> +
> +typedef struct QemuLogFile {
> +    struct rcu_head rcu;
> +    FILE *fd;
> +} QemuLogFile;
>
>  /* Private global variable, don't use */
> -extern FILE *qemu_logfile;
> +extern QemuLogFile *qemu_logfile;
> +
>
>  /*
>   * The new API:
> @@ -25,7 +32,16 @@ static inline bool qemu_log_enabled(void)
>   */
>  static inline bool qemu_log_separate(void)
>  {
> -    return qemu_logfile !=3D NULL && qemu_logfile !=3D stderr;
> +    QemuLogFile *logfile;
> +    bool res =3D false;
> +
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile && logfile->fd !=3D stderr) {
> +        res =3D true;
> +    }
> +    rcu_read_unlock();
> +    return res;
>  }
>
>  #define CPU_LOG_TB_OUT_ASM (1 << 0)
> @@ -55,14 +71,23 @@ static inline bool qemu_log_separate(void)
>
>  static inline FILE *qemu_log_lock(void)
>  {
> -    qemu_flockfile(qemu_logfile);
> -    return logfile->fd;
> +    QemuLogFile *logfile;
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        qemu_flockfile(logfile->fd);
> +        return logfile->fd;
> +    } else {
> +        rcu_read_unlock();

As qemu_log_lock() and unlock should be paired we can drop the unlock
here and do an unconditional unlock bellow even if a null fd is passed.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +        return NULL;
> +    }
>  }
>
>  static inline void qemu_log_unlock(FILE *fd)
>  {
>      if (fd) {
>          qemu_funlockfile(fd);
> +        rcu_read_unlock();
>      }
>  }
>
> @@ -73,9 +98,14 @@ static inline void qemu_log_unlock(FILE *fd)
>  static inline void GCC_FMT_ATTR(1, 0)
>  qemu_log_vprintf(const char *fmt, va_list va)
>  {
> -    if (qemu_logfile) {
> -        vfprintf(qemu_logfile, fmt, va);
> +    QemuLogFile *logfile;
> +
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        vfprintf(logfile->fd, fmt, va);
>      }
> +    rcu_read_unlock();
>  }
>
>  /* log only if a bit is set on the current loglevel mask:
> diff --git a/util/log.c b/util/log.c
> index 91ebb5c924..9f9b6b74b7 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -28,7 +28,7 @@
>
>  static char *logfilename;
>  static QemuMutex qemu_logfile_mutex;
> -FILE *qemu_logfile;
> +QemuLogFile *qemu_logfile;
>  int qemu_loglevel;
>  static int log_append =3D 0;
>  static GArray *debug_regions;
> @@ -37,10 +37,14 @@ static GArray *debug_regions;
>  int qemu_log(const char *fmt, ...)
>  {
>      int ret =3D 0;
> -    if (qemu_logfile) {
> +    QemuLogFile *logfile;
> +
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
>          va_list ap;
>          va_start(ap, fmt);
> -        ret =3D vfprintf(qemu_logfile, fmt, ap);
> +        ret =3D vfprintf(logfile->fd, fmt, ap);
>          va_end(ap);
>
>          /* Don't pass back error results.  */
> @@ -48,6 +52,7 @@ int qemu_log(const char *fmt, ...)
>              ret =3D 0;
>          }
>      }
> +    rcu_read_unlock();
>      return ret;
>  }
>
> @@ -56,12 +61,24 @@ static void __attribute__((__constructor__)) qemu_log=
file_init(void)
>      qemu_mutex_init(&qemu_logfile_mutex);
>  }
>
> +static void qemu_logfile_free(QemuLogFile *logfile)
> +{
> +    g_assert(logfile);
> +
> +    if (logfile->fd !=3D stderr) {
> +        fclose(logfile->fd);
> +    }
> +    g_free(logfile);
> +}
> +
>  static bool log_uses_own_buffers;
>
>  /* enable or disable low levels log */
>  void qemu_set_log(int log_flags)
>  {
>      bool need_to_open_file =3D false;
> +    QemuLogFile *logfile;
> +
>      qemu_loglevel =3D log_flags;
>  #ifdef CONFIG_TRACE_LOG
>      qemu_loglevel |=3D LOG_TRACE;
> @@ -80,43 +97,47 @@ void qemu_set_log(int log_flags)
>      g_assert(qemu_logfile_mutex.initialized);
>      qemu_mutex_lock(&qemu_logfile_mutex);
>      if (qemu_logfile && !need_to_open_file) {
> -        qemu_mutex_unlock(&qemu_logfile_mutex);
> -        qemu_log_close();
> +        logfile =3D qemu_logfile;
> +        atomic_rcu_set(&qemu_logfile, NULL);
> +        call_rcu(logfile, qemu_logfile_free, rcu);
>      } else if (!qemu_logfile && need_to_open_file) {
> +        logfile =3D g_new0(QemuLogFile, 1);
>          if (logfilename) {
> -            qemu_logfile =3D fopen(logfilename, log_append ? "a" : "w");
> -            if (!qemu_logfile) {
> +            logfile->fd =3D fopen(logfilename, log_append ? "a" : "w");
> +            if (!logfile->fd) {
> +                g_free(logfile);
>                  perror(logfilename);
>                  _exit(1);
>              }
>              /* In case we are a daemon redirect stderr to logfile */
>              if (is_daemonized()) {
> -                dup2(fileno(qemu_logfile), STDERR_FILENO);
> -                fclose(qemu_logfile);
> +                dup2(fileno(logfile->fd), STDERR_FILENO);
> +                fclose(logfile->fd);
>                  /* This will skip closing logfile in qemu_log_close() */
> -                qemu_logfile =3D stderr;
> +                logfile->fd =3D stderr;
>              }
>          } else {
>              /* Default to stderr if no log file specified */
>              assert(!is_daemonized());
> -            qemu_logfile =3D stderr;
> +            logfile->fd =3D stderr;
>          }
>          /* must avoid mmap() usage of glibc by setting a buffer "by hand=
" */
>          if (log_uses_own_buffers) {
>              static char logfile_buf[4096];
>
> -            setvbuf(qemu_logfile, logfile_buf, _IOLBF, sizeof(logfile_bu=
f));
> +            setvbuf(logfile->fd, logfile_buf, _IOLBF, sizeof(logfile_buf=
));
>          } else {
>  #if defined(_WIN32)
>              /* Win32 doesn't support line-buffering, so use unbuffered o=
utput. */
> -            setvbuf(qemu_logfile, NULL, _IONBF, 0);
> +            setvbuf(logfile->fd, NULL, _IONBF, 0);
>  #else
> -            setvbuf(qemu_logfile, NULL, _IOLBF, 0);
> +            setvbuf(logfile->fd, NULL, _IOLBF, 0);
>  #endif
>              log_append =3D 1;
>          }
> -        qemu_mutex_unlock(&qemu_logfile_mutex);
> +        atomic_rcu_set(&qemu_logfile, logfile);
>      }
> +    qemu_mutex_unlock(&qemu_logfile_mutex);
>  }
>
>  void qemu_log_needs_buffers(void)
> @@ -245,19 +266,28 @@ out:
>  /* fflush() the log file */
>  void qemu_log_flush(void)
>  {
> -    fflush(qemu_logfile);
> +    QemuLogFile *logfile;
> +
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        fflush(logfile->fd);
> +    }
> +    rcu_read_unlock();
>  }
>
>  /* Close the log file */
>  void qemu_log_close(void)
>  {
> +    QemuLogFile *logfile;
> +
>      g_assert(qemu_logfile_mutex.initialized);
>      qemu_mutex_lock(&qemu_logfile_mutex);
> -    if (qemu_logfile) {
> -        if (qemu_logfile !=3D stderr) {
> -            fclose(qemu_logfile);
> -        }
> -        qemu_logfile =3D NULL;
> +    logfile =3D qemu_logfile;
> +
> +    if (logfile) {
> +        atomic_rcu_set(&qemu_logfile, NULL);
> +        call_rcu(logfile, qemu_logfile_free, rcu);
>      }
>      qemu_mutex_unlock(&qemu_logfile_mutex);
>  }
>  diff --git a/include/exec/log.h b/include/exec/log.h
> index e2cfd436e6..9bd1e4aa20 100644
> --- a/include/exec/log.h
> +++ b/include/exec/log.h
> @@ -15,8 +15,15 @@
>   */
>  static inline void log_cpu_state(CPUState *cpu, int flags)
>  {
> +    QemuLogFile *logfile;
> +
>      if (qemu_log_enabled()) {
> -        cpu_dump_state(cpu, qemu_logfile, flags);
> +        rcu_read_lock();
> +        logfile =3D atomic_rcu_read(&qemu_logfile);
> +        if (logfile) {
> +            cpu_dump_state(cpu, logfile->fd, flags);
> +        }
> +        rcu_read_unlock();
>      }
>  }
>
> @@ -40,19 +47,37 @@ static inline void log_cpu_state_mask(int mask, CPUSt=
ate *cpu, int flags)
>  static inline void log_target_disas(CPUState *cpu, target_ulong start,
>                                      target_ulong len)
>  {
> -    target_disas(qemu_logfile, cpu, start, len);
> +    QemuLogFile *logfile;
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        target_disas(logfile->fd, cpu, start, len);
> +    }
> +    rcu_read_unlock();
>  }
>
>  static inline void log_disas(void *code, unsigned long size)
>  {
> -    disas(qemu_logfile, code, size);
> +    QemuLogFile *logfile;
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        disas(logfile->fd, code, size);
> +    }
> +    rcu_read_unlock();
>  }
>
>  #if defined(CONFIG_USER_ONLY)
>  /* page_dump() output to the log file: */
>  static inline void log_page_dump(void)
>  {
> -    page_dump(qemu_logfile);
> +    QemuLogFile *logfile;
> +    rcu_read_lock();
> +    logfile =3D atomic_rcu_read(&qemu_logfile);
> +    if (logfile) {
> +        page_dump(logfile->fd);
> +    }
> +    rcu_read_unlock();
>  }
>  #endif
>  #endif
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 0511266d85..4f616ba38b 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2114,9 +2114,17 @@ static void tcg_dump_ops(TCGContext *s, bool have_=
prefs)
>          }
>
>          if (have_prefs || op->life) {
> -            for (; col < 40; ++col) {
> -                putc(' ', qemu_logfile);
> +
> +            QemuLogFile *logfile;
> +
> +            rcu_read_lock();
> +            logfile =3D atomic_rcu_read(&qemu_logfile);
> +            if (logfile) {
> +                for (; col < 40; ++col) {
> +                    putc(' ', logfile->fd);
> +                }
>              }
> +            rcu_read_unlock();
>          }
>
>          if (op->life) {


--
Alex Benn=C3=A9e

