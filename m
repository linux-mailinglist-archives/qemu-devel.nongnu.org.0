Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738083001E2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:47:35 +0100 (CET)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uuc-0004K2-84
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l2utG-0003rw-Om
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:46:10 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l2utD-0000Jd-Og
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:46:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m1so4100251wrq.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 03:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fkQhuqGXp8r+1qgFK/CRW6SzDZF3ZDNjSuG4vPSpvyQ=;
 b=sM1yZpsfYEJ2F3H/5euM9jWkyexn4ABucaGCZRolHEjDSXEuoyegvLW49/YE0kpCEf
 /Q3JZUCa5W7CpCqqVwer8WrRGAxtMiugF0UmgoqFye7u5I7wo9HU0Os12QSOyzxorVhu
 tiSUnD+BlOH8sWqK21RCtGNfZhSt7UH8SD2+z3rUDfKJmDl2fBI+4YD2c95BHIUVrt9Z
 qrUReHhlG9xsoX14qUCICd9TWOJXRdjerdD4kNuLNzzK7ngVemPlMJCqAVGLPonFQWhI
 DPDm/CIhNvhMc3NIixMxtPVf+nyFwzdZRIe+EaGoMDKHWUwLHeEwABXbbB4tJhXiR+nX
 ydrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fkQhuqGXp8r+1qgFK/CRW6SzDZF3ZDNjSuG4vPSpvyQ=;
 b=uPicK9Hn8DPbD/WEZsHHPTGzbTn/qDCDEHGM1ar/QDALJ14jI+WiZQADE+GRbkz6ok
 MICsaRgJnCDXT5UKtelwIVrshRrBoJ43NOkANQyrH8r9plP+cJ/Sy+XraDtRH/Myy+Ub
 7hKolsU8CfecT5fB7M6gZC7NVFuvTSlFR/VH7OzWqxeREcbE7D2qjwO8v2z4k26C+q97
 CELmOax6E3Q3U6l6UVT8S0eeUn7T7ewz1gmPejW2i33WvZjgysjTDwd42yWf2+uKVmby
 NBkS52Kd9WmfH4czMw7WADlbOLLJbzrPH6cMl1GcV6MtKr2P5/oxypOdGXt6DRMb6DgT
 RFjw==
X-Gm-Message-State: AOAM533WzQ8FDGXHWP8tCvze7IUA4U9eCd5KN3r2uvK1ynmNaz/MiD/b
 06xqO1cUcXoF/pNTOU421OEI+g==
X-Google-Smtp-Source: ABdhPJwrEhbROF1a8I8/SGxuFMVEk3s49vXxirXJJt8DQCJUy0sPLgM9XT/DnA9MXsTK5GlafFRydA==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr4143380wru.64.1611315966400; 
 Fri, 22 Jan 2021 03:46:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y24sm10626056wmi.47.2021.01.22.03.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 03:46:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C98F1FF7E;
 Fri, 22 Jan 2021 11:46:03 +0000 (GMT)
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
Date: Fri, 22 Jan 2021 11:42:57 +0000
In-reply-to: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
Message-ID: <87y2glry84.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> Sometimes we need to collect the translation logs starting
> from some point of the execution. Some TB listings may
> be missed in this case, when blocks were translated before.
> This patch clears TB cache to allow re-translation of such
> code blocks.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/translate-all.c |    8 ++++++++
>  include/sysemu/tcg.h      |    1 +
>  stubs/meson.build         |    1 +
>  stubs/tcg.c               |   12 ++++++++++++
>  util/log.c                |    3 +++
>  5 files changed, 25 insertions(+)
>  create mode 100644 stubs/tcg.c
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index e9de6ff9dd..3acb227c57 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1461,6 +1461,14 @@ void tb_flush(CPUState *cpu)
>      }
>  }
>=20=20
> +void tb_flush_all(void)
> +{
> +    CPUState *cpu;
> +    CPU_FOREACH(cpu) {
> +        tb_flush(cpu);
> +    }
> +}
> +

This isn't needed - tb_flush flushes all translations although it does
need to be executed in a CPU context to do so.

>  /*
>   * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-on=
ly,
>   * so in order to prevent bit rot we compile them unconditionally in use=
r-mode,
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a..7415f11022 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -9,6 +9,7 @@
>  #define SYSEMU_TCG_H
>=20=20
>  void tcg_exec_init(unsigned long tb_size, int splitwx);
> +void tb_flush_all(void);
>=20=20
>  #ifdef CONFIG_TCG
>  extern bool tcg_allowed;
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 80b1d81a31..95e70f8542 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -38,6 +38,7 @@ stub_ss.add(files('set-fd-handler.c'))
>  stub_ss.add(files('sysbus.c'))
>  stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
> +stub_ss.add(files('tcg.c'))
>  stub_ss.add(files('tpm.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
> diff --git a/stubs/tcg.c b/stubs/tcg.c
> new file mode 100644
> index 0000000000..775a748c77
> --- /dev/null
> +++ b/stubs/tcg.c
> @@ -0,0 +1,12 @@
> +/*
> + * TCG stubs
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "sysemu/tcg.h"
> +
> +void tb_flush_all(void)
> +{
> +}
> diff --git a/util/log.c b/util/log.c
> index 2ee1500bee..2ff342a91b 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -26,6 +26,7 @@
>  #include "trace/control.h"
>  #include "qemu/thread.h"
>  #include "qemu/lockable.h"
> +#include "sysemu/tcg.h"
>=20=20
>  static char *logfilename;
>  static QemuMutex qemu_logfile_mutex;
> @@ -84,6 +85,8 @@ void qemu_set_log(int log_flags)
>  #ifdef CONFIG_TRACE_LOG
>      qemu_loglevel |=3D LOG_TRACE;
>  #endif
> +    tb_flush_all();
> +

I would call tb_flush(current_cpu) or first_cpu here. But two things:

 - I'm not sure you have a CPU at all times qemu_set_log is called
 - It seems overly aggressive to throw away all translations every time
   the log level is changed. I would define a mask in log.h and have
   something like:

  if (log_flags & LOG_TRANSLATION) {
      tb_flush();
  }

>      /*
>       * In all cases we only log if qemu_loglevel is set.
>       * Also:


--=20
Alex Benn=C3=A9e

