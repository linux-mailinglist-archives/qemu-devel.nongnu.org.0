Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DA100576
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 13:19:18 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWfzx-0000F8-0d
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 07:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iWfxN-0007Nw-WF
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iWfxL-0006ss-PT
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:16:36 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iWfxL-0006sf-Hi
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 07:16:35 -0500
Received: by mail-wr1-x444.google.com with SMTP id l7so19179148wrp.6
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ci9rctQr59fYtG57m5ibGqrGJ0nO3wWyz1FApX0JlXk=;
 b=Danb90nLlegl41JrxWJfMzoc5Vkz8g2r/uBkuT6lehh9ddPZVleMTqkOvlPUokXQTO
 uYKzNv79KoK5G+o9vMO9s+vTmPOsJoEeQLHcLkhx1rJrUMgjSNU7FF5u+J6YwZsDuGYH
 XqC7ER+yygs4XCYPgHgjAfk8M5URBdBWNt1nF89QrWfwLMUQyLN3q7nTdBcKRUBXNA2U
 p+5NxHj7eu9LQhG142JZYRc68OzPf+ZFuZAI1pVLGxa0J6DWVTNYryEuup4IpxfcJ2jN
 4AlsXpMYReDnpc1oCveRUdbaEY66ev/8SNsvv6arapk7i7EKXIGpuD0hVChrj4n0IkjY
 mgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ci9rctQr59fYtG57m5ibGqrGJ0nO3wWyz1FApX0JlXk=;
 b=ovcX+v4xYsLp2rzdTzqbbnaNqm6e492DI3V3s5CbsK1PFMgkA8SR/VaW4uLhpUi/kz
 KHJNMTD0troRjcMmPNg+/MxBgsIzyIbBVDZLZMnCyODvqLLS0+xOlTQ89GLi65awAdUb
 /6OqCxzhXWcg3uCCshoHjZq57Mdnmo/H92H1N2C7QVQfSM/cHOQC9+FJJ/g27Ldc1w3k
 Jgte6FUYDaR1ESHFmF3XHNbXP4TNyN9KKh0d+tAydEt/sJR0Cel8AkNyUiOIhPus4R4d
 wRfWoC6LO8hLVqa5baUdOazMPApQz+7up8NdcwEgrG2AbdqGYNMANVREgjjgcWx+md9E
 Jutg==
X-Gm-Message-State: APjAAAVtPbInwhXnBueOklM16yA3rSro5Xu3l26B6fKXEt48iMxNDcQF
 0M7STjtY+ErvP2s1AyEf2S3Gl9pmNgw=
X-Google-Smtp-Source: APXvYqwaZztouW+SMnbrGEvS5CKser6rR4Csq6lT+GuAzZd/IbzwDTqVxxbMu2HB7nLibY5YsxUB2w==
X-Received: by 2002:adf:c649:: with SMTP id u9mr1416823wrg.20.1574079394035;
 Mon, 18 Nov 2019 04:16:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm27089589wrg.0.2019.11.18.04.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 04:16:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36FA41FF87;
 Mon, 18 Nov 2019 12:16:32 +0000 (GMT)
References: <20191115131040.2834-1-robert.foley@linaro.org>
 <20191115131040.2834-4-robert.foley@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v2 3/6] Add a mutex to guarantee single writer to
 qemu_logfile handle.
In-reply-to: <20191115131040.2834-4-robert.foley@linaro.org>
Date: Mon, 18 Nov 2019 12:16:32 +0000
Message-ID: <87d0dpgz1b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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

> Also added qemu_logfile_init() for initializing the logfile mutex.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---
> v2
>     - In qemu_set_log() moved location of mutex lock/unlock
>       due to cleanup changes.
> ---
> v1
>     - changed qemu_logfile_init() to use __constructor__.
> ---
>  util/log.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/util/log.c b/util/log.c
> index 417d16ec66..91ebb5c924 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -24,8 +24,10 @@
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "trace/control.h"
> +#include "qemu/thread.h"
>
>  static char *logfilename;
> +static QemuMutex qemu_logfile_mutex;
>  FILE *qemu_logfile;
>  int qemu_loglevel;
>  static int log_append =3D 0;
> @@ -49,6 +51,11 @@ int qemu_log(const char *fmt, ...)
>      return ret;
>  }
>
> +static void __attribute__((__constructor__)) qemu_logfile_init(void)
> +{
> +    qemu_mutex_init(&qemu_logfile_mutex);
> +}
> +
>  static bool log_uses_own_buffers;
>
>  /* enable or disable low levels log */
> @@ -70,7 +77,10 @@ void qemu_set_log(int log_flags)
>      if (qemu_loglevel && (!is_daemonized() || logfilename)) {
>          need_to_open_file =3D true;
>      }
> +    g_assert(qemu_logfile_mutex.initialized);
> +    qemu_mutex_lock(&qemu_logfile_mutex);
>      if (qemu_logfile && !need_to_open_file) {
> +        qemu_mutex_unlock(&qemu_logfile_mutex);
>          qemu_log_close();
>      } else if (!qemu_logfile && need_to_open_file) {
>          if (logfilename) {
> @@ -105,6 +115,7 @@ void qemu_set_log(int log_flags)
>  #endif
>              log_append =3D 1;
>          }
> +        qemu_mutex_unlock(&qemu_logfile_mutex);
>      }
>  }

This looks a bit odd. I can see it's fixed up in a later patch but I
guess the reason is to avoid a double lock when we get to
qemu_log_close(). In the cases of unavoidable temporary ugliness in a
patch series it is best to note the problem and mention it will be
cleaned up by a later patch in the series.

With an extra comment in the commit message:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> @@ -240,12 +251,15 @@ void qemu_log_flush(void)
>  /* Close the log file */
>  void qemu_log_close(void)
>  {
> +    g_assert(qemu_logfile_mutex.initialized);
> +    qemu_mutex_lock(&qemu_logfile_mutex);
>      if (qemu_logfile) {
>          if (qemu_logfile !=3D stderr) {
>              fclose(qemu_logfile);
>          }
>          qemu_logfile =3D NULL;
>      }
> +    qemu_mutex_unlock(&qemu_logfile_mutex);
>  }
>
>  const QEMULogItem qemu_log_items[] =3D {


--
Alex Benn=C3=A9e

