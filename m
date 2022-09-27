Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D85EC330
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:46:43 +0200 (CEST)
Received: from localhost ([::1]:38106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9yx-0007PT-GI
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1od8XY-000115-5u
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:14:16 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1od8XU-00071L-3d
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:14:13 -0400
Received: by mail-vk1-f180.google.com with SMTP id h5so4764773vkc.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XICseC5ZAJO4L5qBXcqSTTr7i+K2qxui8nEb3EChY9Q=;
 b=ZPv8C72IbqGLNUeZiNbv6CQaQciIGJeqRxVRMpSrVhuVSl7fQzJv7i7CuiA2CrCu2P
 4i8Gm29Lp9VMSunEKl8Qn0dbkvefXf/6PC6lb5bTkktzxkfs7a++ZHW5ckKyAeyPq5Yx
 cuiuNvVzGdeTIth2Z6G44/cmVdBc7yN/w918wWMGI83e5Sy/gwuMayUGf0l3S4UyQC4U
 ldeDqAFgHRG78n/HYtoeOhwXLdw2PvCJ5NQynEkpbpY9doqPER30CWA4quTnWYaH0Aic
 4fyuVY6Ic/wLo5F9mHQSfDn+mCzyW5d/mgsbbOk9NzTnBmPlTLydcrnLVGoQ0TruwM4f
 VEJQ==
X-Gm-Message-State: ACrzQf3hqNJOaTy5Vjf2v34mRHLC+8iuamXvB2iCzQqqVy4j/TCPyLLn
 jwW4zzfhBkfykAhA4Ct9B8Djn+A0u48AEsdECoo=
X-Google-Smtp-Source: AMsMyM4xjILWS2zUJTjT2bitgCGTH6ONtRSkZ9LMQzafK24GZo3sLQLyvdXj2xvY1vbADL2UMVbnZ8aMXgkS6yYsYG0=
X-Received: by 2002:a05:6122:10dc:b0:3a3:4904:2941 with SMTP id
 l28-20020a05612210dc00b003a349042941mr10828412vko.24.1664277250462; Tue, 27
 Sep 2022 04:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <YzLJlENCtqx87DIs@p100>
In-Reply-To: <YzLJlENCtqx87DIs@p100>
Date: Tue, 27 Sep 2022 13:13:58 +0200
Message-ID: <CAAdtpL5CvS_3aMgYhpc+okqSYA+WLQ=DfW0TvH04rYPXSJ9ggw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add guest memory layout to exception dump
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Hi Helge,

On Tue, Sep 27, 2022 at 12:09 PM Helge Deller <deller@gmx.de> wrote:
>
> When the emulation stops with a hard exception it's very useful for
> debugging purposes to dump the current guest memory layout (for an
> example see /proc/self/maps) beside the CPU registers.
>
> The open_self_maps() function provides such a memory dump, but since
> it's located in the syscall.c file, various changes (add #includes, make
> this function externally visible, ...) are needed to be able to call it
> from the existing EXCP_DUMP() macro.
>
> This patch takes another approach by un-macronizing EXCP_DUMP() and turn
> it into a function located in syscall.c.
> Beside a reduced code footprint, this approach allows to add the memory
> dump and simplify the code to print to console and log file.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
> index 36ff5b14f2..0b26b56915 100644
> --- a/linux-user/cpu_loop-common.h
> +++ b/linux-user/cpu_loop-common.h
> @@ -23,18 +23,7 @@
>  #include "exec/log.h"
>  #include "special-errno.h"
>
> -#define EXCP_DUMP(env, fmt, ...)                                        \
> -do {                                                                    \
> -    CPUState *cs = env_cpu(env);                                        \
> -    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
> -    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
> -    cpu_dump_state(cs, stderr, 0);                                      \
> -    if (qemu_log_separate()) {                                          \
> -        qemu_log(fmt, ## __VA_ARGS__);                                  \
> -        qemu_log("Failing executable: %s\n", exec_path);                \
> -        log_cpu_state(cs, 0);                                           \
> -    }                                                                   \
> -} while (0)
> +void EXCP_DUMP(CPUArchState *env, const char *fmt, int code);

s/EXCP_DUMP/target_cpu_dump_exception/

Worth split as a preliminary patch updating all targets.

>  void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs);
>  #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index d17f5d1c66..00861e9351 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -158,6 +158,7 @@
>  #include "qapi/error.h"
>  #include "fd-trans.h"
>  #include "tcg/tcg.h"
> +#include "cpu_loop-common.h"
>
>  #ifndef CLONE_IO
>  #define CLONE_IO                0x80000000      /* Clone io context */
> @@ -8177,6 +8178,33 @@ static int is_proc_myself(const char *filename, const char *entry)
>      return 0;
>  }
>
> +static void excp_dump(FILE *logfile, CPUArchState *env,
> +                      const char *fmt, int code)

s/excp_dump/dump_excp_file/

> +{
> +    if (logfile) {

Rather:

    assert(logfile);

(programming error).

> +        CPUState *cs = env_cpu(env);
> +
> +        fprintf(logfile, fmt, code);
> +        fprintf(logfile, "Failing executable: %s\n", exec_path);
> +        cpu_dump_state(cs, logfile, 0);
> +        open_self_maps(env, fileno(logfile));
> +    }
> +}
> +
> +void EXCP_DUMP(CPUArchState *env, const char *fmt, int code)

s/EXCP_DUMP/target_cpu_dump_exception/

> +{
> +    /* dump to console */
> +    excp_dump(stderr, env, fmt, code);
> +
> +    /* dump to log file */
> +    if (qemu_log_separate()) {
> +        FILE *logfile = qemu_log_trylock();
> +
> +        excp_dump(logfile, env, fmt, code);
> +        qemu_log_unlock(logfile);
> +    }
> +}

Nitpicking a bit, otherwise LGTM.

