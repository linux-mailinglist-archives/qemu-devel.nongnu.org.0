Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960F6062D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:19:21 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWOE-0003X2-Eg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:19:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWFw-0004vJ-8a
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUjm-0002Vx-Dm
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:33:27 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUjk-0006Gf-T6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:33:26 -0400
Received: by mail-pf1-x431.google.com with SMTP id y1so20133110pfr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1uSmN0Bd0T3Jq2r+hywYFH9RxoYplXVcFNMN5vlx9Y=;
 b=UpLI9mnSiuBo1Zi6qRlznuCl5TurhY4OQ03cv7tno9OdIZWI9TBz5OeZ5uLUtrrgAI
 +wEuxCO8JOsZhaa31+IMQPZ12IcXArub7GTHXraSUd7ejSRsjFLndiXCT0kIYXNsU/wL
 m3XjfMACbka1RQRGqeEfVe3QasxLw0C5GDVXgGFkLsHMCXyC9j2/o9QOb6aqYMDTGVeP
 fYp8F63HjoowUzeyyw2e7bNj+LLkMOhVPMH9yg7UbwxjTqkkxAV9i+s0Ek059z7r6qG4
 YA9WvmMce7aNpDE6zLjgPOem+pqtQsJcA7oLUwKVJl2XKIBxDsAf7jeFlgC9915q++dw
 JyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1uSmN0Bd0T3Jq2r+hywYFH9RxoYplXVcFNMN5vlx9Y=;
 b=KDy8bE6j60PqUgZnhiezkM372d3x9a/B/e//FLi58koMl8ysoD8ppGOEXMUQ2nNNkD
 AJpTtG4WJ+gWhvwjGukpbNGeikmrFn8tXLS6619dg6FP7DCIQg+79vWn6UmxUiO+s221
 U2idbCi6qJggYpxpTAccdWMYC6h8NrXC+U+52n1kHKi7beSkPjvBXkStiUypybu2WCQH
 jN0EWchmgWTNDVEU0Md8g6PlC9rgTiuZLllro6Tcz0IZ+tKQToVOzymY+Q7vuRSJtt9G
 a6XAwBo8VJzO+EzmOMheAHR5Kq8t/s8Y/0IERKJpP55sd+pWMPexnxCkvlArh/kpv/pS
 bPZQ==
X-Gm-Message-State: ACrzQf1hZ2Wa7QcYrhv8DQu5H33O1RUKqIkiXhRzbBcoZoP8mWDEVOQ+
 0zTSpQ6ZUPNJYlIfrx9n8hIxOKZwqNxbiWfd5URZ0Q==
X-Google-Smtp-Source: AMsMyM6y2eNSxGPgw70v1PzpANWlqUGGtTLDITwIDLPOLbzOEgOk4YHlLYt9HkCmQX7Qg8N014ApY61hHznNoQcpYqU=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr11914869pge.231.1666269203041; Thu, 20
 Oct 2022 05:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220621204643.371397-1-richard.henderson@linaro.org>
 <20220621204643.371397-4-richard.henderson@linaro.org>
In-Reply-To: <20220621204643.371397-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 13:33:11 +0100
Message-ID: <CAFEAcA_i8x00hD-4XX18ySLNbCB6ds1-DSazVb4yDnF8skjd9A@mail.gmail.com>
Subject: Re: [PULL 3/9] accel/tcg: Init TCG cflags in vCPU thread handler
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 21 Jun 2022 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Move TCG cflags initialization to thread handler.
> Remove the duplicated assert checks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Hi; I've just noticed that this commit seems to break icount
mode when there's more than one vCPU. Specifically:

> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 1a72149f0e..cc8adc2380 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -152,7 +152,9 @@ static void *rr_cpu_thread_fn(void *arg)
>      Notifier force_rcu;
>      CPUState *cpu =3D arg;
>
> -    assert(tcg_enabled());
> +    g_assert(tcg_enabled());
> +    tcg_cpu_init_cflags(cpu, false);
> +

In icount mode we round-robin on the same CPU thread, so
the rr_cpu_thread_fn() gets called only once, and we set
the TCG cflags on the first CPU here, but not on any others.

>      rcu_register_thread();
>      force_rcu.notify =3D rr_force_rcu;
>      rcu_add_force_rcu_notifier(&force_rcu);
> @@ -275,9 +277,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
>      static QemuCond *single_tcg_halt_cond;
>      static QemuThread *single_tcg_cpu_thread;
>
> -    g_assert(tcg_enabled());
> -    tcg_cpu_init_cflags(cpu, false);
> -

This code gets called for each vCPU, whether we are going to
give it its own thread or not, so when we did this check in
the old location we would call tcg_cpu_init_cflags() on every vCPU.

>      if (!single_tcg_cpu_thread) {
>          cpu->thread =3D g_new0(QemuThread, 1);
>          cpu->halt_cond =3D g_new0(QemuCond, 1);

So now only one vCPU gets the CF_USE_ICOUNT thread set,
and the guest kernel hangs shortly after it brings up the
secondary CPU.

Reverting commit a82fd5a4ec24d923ff1e fixes the problem.

thanks
-- PMM

