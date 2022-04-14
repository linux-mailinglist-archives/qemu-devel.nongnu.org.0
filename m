Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F767501538
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:39:47 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1ZS-0005Qb-95
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Xn-0003ep-Qk
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:38:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Xl-0006Pe-Ht
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:38:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so2276942wms.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U/WCEYvZhgItKJHKyT+8GB6AumZUrflmi3O3BcsfLGM=;
 b=J/InKYYTcI1QJUJNU9/dqrciXguLJTxwtKb7Mu6THgUdvJhK2vRgWfI/SaU+MQFMuO
 WxAT0TSUX9TMf0kY5cxpuQIAtd/wXQVczVE06C5TEBUdYFhoSGQjKk/s1mBdqZYhNReJ
 gMd3LOTOn2X8EvTZJCu2+XIenC2yXFxnUkjNhU/2bAz4uE2Sg+XFBZJKVFe5zbi1GXmy
 urSZY2go6/Nz9jSuqpuw6fqy38lk9IVETG3iVe2xdET2oIYbKA5OQXakMMjKM885SSoE
 0lmPYibrfq/khA8yEAcqbVRzF6x0sd0l+Ho7AF2cTgYrXaCjdsCX72y7sNmb3QWl2CUo
 OHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U/WCEYvZhgItKJHKyT+8GB6AumZUrflmi3O3BcsfLGM=;
 b=lGaA/E8MRNI3GxvsmpVLMWg9AGTY2+EaygTUT/bDfcoi5IdDsnFsKZcz4qJm/zAbUG
 3Ov5nZr0TaHWhSCg1jtXEQdrWYXWtpd0Fn+JNyzohRCbKgDxpVDdLTu2b0YLhr6XhggD
 ZEljbgoEF7RJtgczAH8wTxOohLilIDSxUCqe3OQ70+DKy1u9vGm424VKuoiHHgmiRkTJ
 Yst4cd2e7ji420+y55CTqu9ZSGcf5PnIntPdyjzKq3wo3q9UemyRKKd2OClCkgzs1BrU
 OTm3mD0CFtzHvKF6u84sqolezaOg9n/2XZg0WwBujf7ER1u87Ab+K9fBY+iX9qFPqb7H
 QyNQ==
X-Gm-Message-State: AOAM53206vO7yXbb1rdyX/uqiz3mP9XcpYIYol7Xp/oyAES1moB8LTLn
 J379EaFvJAo0U3DYG1YbuRNrbg==
X-Google-Smtp-Source: ABdhPJxunN1WKUjLzR7e/xPHEPlM8yPqYFqFWWNwi/PmvgsrAAJHP1+XeI9KfJG1jw6nPEt92pnv3w==
X-Received: by 2002:a05:600c:a45:b0:346:5e67:cd54 with SMTP id
 c5-20020a05600c0a4500b003465e67cd54mr4178871wmq.127.1649950679985; 
 Thu, 14 Apr 2022 08:37:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm2004802wrv.19.2022.04.14.08.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:37:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53A091FFB7;
 Thu, 14 Apr 2022 16:37:58 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-48-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 39/39] util/log: Support per-thread log files
Date: Thu, 14 Apr 2022 16:35:02 +0100
In-reply-to: <20220326132534.543738-48-richard.henderson@linaro.org>
Message-ID: <87y207smjt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Add a new log flag, tid, to turn this feature on.
> Require the log filename to be set, and to contain %d.
>
> Do not allow tid to be turned off once it is on, nor let
> the filename be change thereafter.  This avoids the need
> for signalling each thread to re-open on a name change.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Make use of CONFIG_GETTID, and fallback to SYS_gettid.
> ---
>  include/qemu/log.h |   1 +
>  util/log.c         | 149 ++++++++++++++++++++++++++++++++++-----------
>  2 files changed, 115 insertions(+), 35 deletions(-)
>
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index a325bca661..c5643d8dd5 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -34,6 +34,7 @@ bool qemu_log_separate(void);
>  #define CPU_LOG_PLUGIN     (1 << 18)
>  /* LOG_STRACE is used for user-mode strace logging. */
>  #define LOG_STRACE         (1 << 19)
> +#define LOG_PER_THREAD     (1 << 20)
>=20=20
>  /* Lock/unlock output. */
>=20=20
> diff --git a/util/log.c b/util/log.c
> index df0710720f..0bb2233788 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -27,6 +27,9 @@
>  #include "qemu/thread.h"
>  #include "qemu/lockable.h"
>  #include "qemu/rcu.h"
> +#ifdef CONFIG_LINUX
> +#include <sys/syscall.h>
> +#endif
>=20=20
>=20=20
>  typedef struct RCUCloseFILE {
> @@ -38,22 +41,36 @@ typedef struct RCUCloseFILE {
>  static QemuMutex global_mutex;
>  static char *global_filename;
>  static FILE *global_file;
> +static __thread FILE *thread_file;
>=20=20
>  int qemu_loglevel;
> -static int log_append =3D 0;
> +static bool log_append;
> +static bool log_per_thread;
>  static GArray *debug_regions;
>=20=20
>  /* Returns true if qemu_log() will really write somewhere. */
>  bool qemu_log_enabled(void)
>  {
> -    return qatomic_read(&global_file) !=3D NULL;
> +    return log_per_thread || qatomic_read(&global_file) !=3D NULL;
>  }
>=20=20
>  /* Returns true if qemu_log() will write somewhere other than stderr. */
>  bool qemu_log_separate(void)
>  {
>      FILE *logfile =3D qatomic_read(&global_file);
> -    return logfile && logfile !=3D stderr;
> +    return log_per_thread || (logfile && logfile !=3D stderr);
> +}
> +
> +static int log_thread_id(void)
> +{
> +#ifdef CONFIG_GETTID
> +    return gettid();
> +#elif defined(SYS_gettid)
> +    return syscall(SYS_gettid);
> +#else
> +    static int counter;
> +    return qatomic_fetch_inc(&counter);
> +#endif
>  }
>=20=20
>  /* Lock/unlock output. */
> @@ -62,20 +79,34 @@ FILE *qemu_log_trylock(void)
>  {
>      FILE *logfile;
>=20=20
> -    rcu_read_lock();
> -    /*
> -     * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
> -     * does not work with pointers to undefined structures,
> -     * such as we have with struct _IO_FILE and musl libc.
> -     * Since all we want is a read of a pointer, cast to void**,
> -     * which does work with typeof_strip_qual.
> -     */
> -    logfile =3D qatomic_rcu_read((void **)&global_file);
> -    if (logfile) {
> -        qemu_flockfile(logfile);
> -    } else {
> -        rcu_read_unlock();
> +    logfile =3D thread_file;
> +    if (!logfile) {
> +        if (log_per_thread) {
> +            g_autofree char *filename
> +                =3D g_strdup_printf(global_filename, log_thread_id());
> +            logfile =3D fopen(filename, "w");
> +            if (!logfile) {
> +                return NULL;
> +            }
> +            thread_file =3D logfile;
> +        } else {
> +            rcu_read_lock();
> +            /*
> +             * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
> +             * does not work with pointers to undefined structures,
> +             * such as we have with struct _IO_FILE and musl libc.
> +             * Since all we want is a read of a pointer, cast to void**,
> +             * which does work with typeof_strip_qual.
> +             */
> +            logfile =3D qatomic_rcu_read((void **)&global_file);
> +            if (!logfile) {
> +                rcu_read_unlock();
> +                return NULL;
> +            }
> +        }
>      }
> +
> +    qemu_flockfile(logfile);
>      return logfile;
>  }
>=20=20
> @@ -84,7 +115,9 @@ void qemu_log_unlock(FILE *logfile)
>      if (logfile) {
>          fflush(logfile);
>          qemu_funlockfile(logfile);
> -        rcu_read_unlock();
> +        if (!log_per_thread) {
> +            rcu_read_unlock();
> +        }
>      }
>  }
>=20=20
> @@ -112,40 +145,74 @@ static void rcu_close_file(RCUCloseFILE *r)
>      g_free(r);
>  }
>=20=20
> +/**
> + * valid_filename_template:
> + *
> + * Validate the filename template.  Require %d if per_thread, allow it
> + * otherwise; require no other % within the template.
> + * Return 0 if invalid, 1 if stderr, 2 if strdup, 3 if pid printf.

From a neatness point of view having an enum would make it easier to
read in the switch down bellow...

> + */
> +static int valid_filename_template(const char *filename,
> +                                   bool per_thread, Error **errp)
> +{
> +    if (filename) {
> +        char *pidstr =3D strstr(filename, "%");
> +
> +        if (pidstr) {
> +            /* We only accept one %d, no other format strings */
> +            if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
> +                error_setg(errp, "Bad logfile template: %s", filename);
> +                return 0;
> +            }
> +            return per_thread ? 2 : 3;
> +        }
> +    }
> +    if (per_thread) {
> +        error_setg(errp, "Filename template with '%%d' required for 'tid=
'");
> +        return 0;
> +    }
> +    return filename ? 2 : 1;
> +}
> +
>  /* enable or disable low levels log */
>  static bool qemu_set_log_internal(const char *filename, bool changed_nam=
e,
>                                    int log_flags, Error **errp)
>  {
>      bool need_to_open_file;
>      bool daemonized;
> +    bool per_thread;
>      FILE *logfile;
>=20=20
>      QEMU_LOCK_GUARD(&global_mutex);
>      logfile =3D global_file;
>=20=20
> +    per_thread =3D log_flags & LOG_PER_THREAD;
> +
>      if (changed_name) {
>          char *newname =3D NULL;
>=20=20
>          /*
> -         * Allow the user to include %d in their logfile which will be
> -         * substituted with the current PID. This is useful for debuggin=
g many
> -         * nested linux-user tasks but will result in lots of logs.
> -         *
> -         * filename may be NULL. In that case, log output is sent to std=
err
> +         * Once threads start opening their own log files, we have no
> +         * easy mechanism to tell them all to close and re-open.
> +         * There seems little cause to do so either -- this option
> +         * will most often be used at user-only startup.
>           */
> -        if (filename) {
> -            char *pidstr =3D strstr(filename, "%");
> +        if (log_per_thread) {
> +            error_setg(errp, "Cannot change log filename after setting '=
tid'");
> +            return false;
> +        }
>=20=20
> -            if (pidstr) {
> -                /* We only accept one %d, no other format strings */
> -                if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
> -                    error_setg(errp, "Bad logfile format: %s", filename);
> -                    return false;
> -                }
> -                newname =3D g_strdup_printf(filename, getpid());
> -            } else {
> -                newname =3D g_strdup(filename);
> -            }
> +        switch (valid_filename_template(filename, per_thread, errp)) {
> +        case 0:
> +            return false; /* error */
> +        case 1:
> +            break;  /* stderr */
> +        case 2:
> +            newname =3D g_strdup(filename);
> +            break;
> +        case 3:
> +            newname =3D g_strdup_printf(filename, getpid());
> +            break;

default: g_assert_not_reached?

>          }
>=20=20
>          g_free(global_filename);
> @@ -153,8 +220,17 @@ static bool qemu_set_log_internal(const char *filena=
me, bool changed_name,
>          filename =3D newname;
>      } else {
>          filename =3D global_filename;
> +        if (per_thread && !valid_filename_template(filename, true, errp)=
) {
> +            return false; /* error */
> +        }
>      }
>=20=20
> +    /* Once the per-thread flag is set, it cannot be unset. */
> +    if (per_thread) {
> +        log_per_thread =3D true;
> +    }
> +    /* The flag itself is not relevant for need_to_open_file. */
> +    log_flags &=3D ~LOG_PER_THREAD;
>  #ifdef CONFIG_TRACE_LOG
>      log_flags |=3D LOG_TRACE;
>  #endif
> @@ -163,12 +239,13 @@ static bool qemu_set_log_internal(const char *filen=
ame, bool changed_name,
>      /*
>       * In all cases we only log if qemu_loglevel is set.
>       * Also:
> +     *   If per-thread, open the file for each thread in qemu_log_lock.
>       *   If not daemonized we will always log either to stderr
>       *     or to a file (if there is a filename).
>       *   If we are daemonized, we will only log if there is a filename.
>       */
>      daemonized =3D is_daemonized();
> -    need_to_open_file =3D log_flags && (!daemonized || filename);
> +    need_to_open_file =3D log_flags && !per_thread && (!daemonized || fi=
lename);
>=20=20
>      if (logfile && (!need_to_open_file || changed_name)) {
>          qatomic_rcu_set(&global_file, NULL);
> @@ -354,6 +431,8 @@ const QEMULogItem qemu_log_items[] =3D {
>  #endif
>      { LOG_STRACE, "strace",
>        "log every user-mode syscall, its input, and its result" },
> +    { LOG_PER_THREAD, "tid",
> +      "open a separate log file per thread; filename must contain '%d'" =
},
>      { 0, NULL, NULL },
>  };

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

