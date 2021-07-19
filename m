Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA03CD63C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:58:39 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Tn4-0000ou-JX
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Tlz-0007LQ-Jz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:57:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Tlx-00051b-TD
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:57:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r11so22145551wro.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c/XSV+OsMSo4sw4ZoppIUrwtdycOv9HBEpcBZdT/Qz4=;
 b=YRdm24jNDWLVnScFeE+Xgb3IedwpptqYApU25Uzm/BwnvEbPhXorQi9cg2WaZ0w4D2
 Wj8G7rjO8TJ3WBFdrWLu0AsHO8fvo6GlzTRpjXUjvd25pjFfiDJuKIyeqH03RzxWjxrL
 RdaW1Vd2QwVZIh0l+ehehtlz5lLpXThbj3QIa8rImCc3HG7WQWugGEAlZ3SMJvx72yp0
 I/Dy5ma0NBVW1SzbCofSSzgixnUpYQAvvWgVO0G41r9v9nCxlM/N+MSYre7yynlDUznO
 ZVLMWVDSJ6v5zy1P8CvRN7hSU1YEzzNfGgYtG9BcnZOm0RF1B/jRbV/D+mfj9LhiQc5d
 0qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c/XSV+OsMSo4sw4ZoppIUrwtdycOv9HBEpcBZdT/Qz4=;
 b=ihJbD4diZPUQV3AcjrRNImPrdXcq2TR7lNzwzEPM8tCFVv6D15Hzrsn5A1OGVnWfIn
 sZXMqVGT118Z/xHPWu4aJQooBgtFWeFUaddWNDVElQTIcj4vIuOz6nRnVEKh8jwDE8YK
 aTrT14tr34p+kemBhJgMBeJKwuv9jYcuTbj6aVX4WJw+JsHiH7mR8IG2oSNaHsmdMzua
 4GnbuGHe1+dA0NBosu5JEsWbvccGvHYn7OCojHa/ERI/OTiyqwRICPyeAQ7Z8iAkQEPq
 Brbz+NEunJpuICBcIRq55pv2h7tBp0WF89S6NTpSRH6lynl3cAcwVajSJF0U/ZEPAulf
 bBXQ==
X-Gm-Message-State: AOAM533+7EOaqPtfFjwMkcWV4CdU2JpSCkx9cv0FEoydEeceZKm3XLPV
 2k0MzLVXWZPcIk3rQyowVsHH/w==
X-Google-Smtp-Source: ABdhPJz3uZ5CJp+KnICMC/IeSfCWlWNogP2itnSXscRR/hzm7082m3ofTYNdpOhMj2c5CP/YWoYqMQ==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr30155378wrz.344.1626703048153; 
 Mon, 19 Jul 2021 06:57:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm20686388wre.84.2021.07.19.06.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 06:57:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 535D31FF7E;
 Mon, 19 Jul 2021 14:57:25 +0100 (BST)
References: <20210719123732.24457-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] tcg/plugins: implement a qemu_plugin_user_exit helper
Date: Mon, 19 Jul 2021 14:56:08 +0100
In-reply-to: <20210719123732.24457-1-alex.bennee@linaro.org>
Message-ID: <87im16pfsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, minyihh@uci.edu, robhenry@microsoft.com,
 Laurent Vivier <laurent@vivier.eu>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> In user-mode emulation there is a small race between preexit_cleanup
> and exit_group() which means we may end up calling instrumented
> instructions before the kernel reaps child threads. To solve this we
> implement a new helper which ensures the callbacks are flushed along
> with any translations before we let the host do it's a thing.
>
> While we are at it make the documentation of
> qemu_plugin_register_atexit_cb clearer as to what the user can expect.
>
<snip>
>=20=20
> +/*
> + * Handle exit from linux-user. Unlike the normal atexit() mechanism
> + * we need to handle the clean-up manually as it's possible threads
> + * are still running. We need to remove all callbacks from code
> + * generation, flush the current translations and then we can safely
> + * trigger the exit callbacks.
> + */
> +
> +void qemu_plugin_user_exit(void)
> +{
> +    enum qemu_plugin_event ev;
> +
> +    QEMU_LOCK_GUARD(&plugin.lock);
> +
> +    start_exclusive();
> +
> +    /* un-register all callbacks except the final AT_EXIT one */
> +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
> +        if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {
> +            struct qemu_plugin_ctx *ctx;
> +            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> +                plugin_unregister_cb__locked(ctx, ev);
> +            }
> +        }
> +    }
> +
> +    tb_flush(current_cpu);

We also need to disable memory helpers during the exclusive period as
that is another route into a callback:

--8<---------------cut here---------------start------------->8---
modified   plugins/core.c
@@ -498,6 +499,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
 void qemu_plugin_user_exit(void)
 {
     enum qemu_plugin_event ev;
+    CPUState *cpu;
=20
     QEMU_LOCK_GUARD(&plugin.lock);
=20
@@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)
     }
=20
     tb_flush(current_cpu);
+
+    CPU_FOREACH(cpu) {
+        qemu_plugin_disable_mem_helpers(cpu);
+    }
+
     end_exclusive();
=20
     /* now it's safe to handle the exit case */
--8<---------------cut here---------------end--------------->8---



> +    end_exclusive();
> +
> +    /* now it's safe to handle the exit case */
> +    qemu_plugin_atexit_cb();
> +}
> +
>  /*
>   * Call this function after longjmp'ing to the main loop. It's possible =
that the
>   * last instruction of a TB might have used helpers, and therefore the


--=20
Alex Benn=C3=A9e

