Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF12D3E3C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:11:37 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvVX-0000CF-Ga
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvTX-0008BM-5f
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:09:31 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvTU-0002I0-Ik
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:09:30 -0500
Received: by mail-wr1-x442.google.com with SMTP id i9so876671wrc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cwv/aEEhosURJlXjXa5A0v4NjckFLr3kngZVWxi1Jsw=;
 b=P/Ko5ybal02sE52ZQkYUuMxZyxqcjxp9WnGOjVwjD5w8wInNS4RmKER4jakXs3lh9B
 4kY4CuOOPtT9kD69RlWn519lc7bl2y8Cc59kiDuhNZ3BOFPv7VQV4d1gaZ3X/NboT8Ki
 laSsYjPg3Zv9fMNpTZG3hKEMtYZx3tPvG9pMEARJ3TDxDdzaWiWYiWcqICKNQ+xNtDsU
 dRuuFXq2seLMkhrApYTHipbT6TqusaPlkLh4KRV5MdJWDOOMT2UPKSGl2YwakYq80Pr7
 nIn+VnvajrqrN3eOcSUNiex2IrrYe4aBvJG0vuOz6xDvgGicV1mMhz/AUtp8wf1dgDZv
 IZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cwv/aEEhosURJlXjXa5A0v4NjckFLr3kngZVWxi1Jsw=;
 b=oLekJ2wZfR6sXjHzrrRHbfXvPLKL46kvuIxOIFN+48Xw0zqH60SqtYXIJdYsx9khzE
 WjY2q393y9BpmlJ5jBSAg0ewFTfjoq57u8kbtLBqzNTiSyTELUmHUB7nsG7w2rKj9VcI
 o1dE7FdmmwhagnFIRVuhP8cP0Ppj5YHSOqt2BJ4j2iVzAOlrDWOwlM7/7Sw3aoU+AhjS
 c3o62oS4Z8bSEN3lpxlqSYlNUnVpIqQK/2gGJ08sKRPjellMwCF0hwQKjX8UGLiHNqbW
 XrGxaCHhcg695zRv4sf0rT322/05bXy0ZiKl/dbQVdujlxleNgnQNpIZJg1DjoHrPRNi
 85qw==
X-Gm-Message-State: AOAM530qDVpBUCPgKuU9eONgpyYe3RG88JQXcoLE9abk9wGLhKW/36Md
 rj2xUoPuFK4wAwHyd3HsQhuCcQ==
X-Google-Smtp-Source: ABdhPJxCyqX8H4Yyw+LXVOLifV7EDOWLxYVwzi9Pam53yc5n4d2oL/h30dHKhpKVRxTRCA2GVrO1sQ==
X-Received: by 2002:adf:ba46:: with SMTP id t6mr1561754wrg.168.1607504966468; 
 Wed, 09 Dec 2020 01:09:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm2040299wro.40.2020.12.09.01.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:09:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75B6B1FF7E;
 Wed,  9 Dec 2020 09:09:24 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-3-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 02/32] accel/tcg: split tcg_start_vcpu_thread
Date: Wed, 09 Dec 2020 09:03:22 +0000
In-reply-to: <20201208194839.31305-3-cfontana@suse.de>
Message-ID: <87sg8ffirf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> after the initial split into 3 tcg variants, we proceed to also
> split tcg_start_vcpu_thread.
>
> We actually split it in 2 this time, since the icount variant
> just uses the round robin function.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-all.c         |  5 ++++
>  accel/tcg/tcg-cpus-icount.c |  2 +-
>  accel/tcg/tcg-cpus-mttcg.c  | 29 +++++++++++++++++--
>  accel/tcg/tcg-cpus-mttcg.h  | 21 --------------
>  accel/tcg/tcg-cpus-rr.c     | 39 +++++++++++++++++++++++--
>  accel/tcg/tcg-cpus-rr.h     |  3 +-
>  accel/tcg/tcg-cpus.c        | 58 -------------------------------------
>  accel/tcg/tcg-cpus.h        |  1 -
>  8 files changed, 71 insertions(+), 87 deletions(-)
>  delete mode 100644 accel/tcg/tcg-cpus-mttcg.h
>
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index e42a028043..1ac0b76515 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -105,6 +105,11 @@ static int tcg_init(MachineState *ms)
>      tcg_exec_init(s->tb_size * 1024 * 1024);
>      mttcg_enabled =3D s->mttcg_enabled;
>=20=20
> +    /*
> +     * Initialize TCG regions
> +     */
> +    tcg_region_init();
> +

It might be worth noting in the commit log this is OK because the
accelerator is now guaranteed to be initialised so you know the details
of MTTCG when initialising the regions.

>      if (mttcg_enabled) {
>          cpus_register_accel(&tcg_cpus_mttcg);
>      } else if (icount_enabled()) {
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index d3af3afb6d..82dbe2cacf 100644
<snip>
> diff --git a/accel/tcg/tcg-cpus-mttcg.h b/accel/tcg/tcg-cpus-mttcg.h
> deleted file mode 100644
> index d1bd771f49..0000000000
> --- a/accel/tcg/tcg-cpus-mttcg.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/*
> - * QEMU TCG Multi Threaded vCPUs implementation
> - *
> - * Copyright 2020 SUSE LLC
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef TCG_CPUS_MTTCG_H
> -#define TCG_CPUS_MTTCG_H
> -
> -/*
> - * In the multi-threaded case each vCPU has its own thread. The TLS
> - * variable current_cpu can be used deep in the code to find the
> - * current CPUState for a given thread.
> - */

Ahh gone now ;-)

> -
> -void *tcg_cpu_thread_fn(void *arg);
> -
> -#endif /* TCG_CPUS_MTTCG_H */
> diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-cpus-rr.c
> index ad50a3765f..f3b262bec7 100644
> --- a/accel/tcg/tcg-cpus-rr.c
> +++ b/accel/tcg/tcg-cpus-rr.c
> @@ -144,7 +144,7 @@ static void deal_with_unplugged_cpus(void)
>   * elsewhere.
>   */
>=20=20
> -void *tcg_rr_cpu_thread_fn(void *arg)
> +static void *tcg_rr_cpu_thread_fn(void *arg)
>  {
>      CPUState *cpu =3D arg;
>=20=20
> @@ -262,8 +262,43 @@ void *tcg_rr_cpu_thread_fn(void *arg)
>      return NULL;
>  }
>=20=20
> +void rr_start_vcpu_thread(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +    static QemuCond *single_tcg_halt_cond;
> +    static QemuThread *single_tcg_cpu_thread;
> +
> +    g_assert(tcg_enabled());
> +    parallel_cpus =3D false;
> +
> +    if (!single_tcg_cpu_thread) {
> +        cpu->thread =3D g_malloc0(sizeof(QemuThread));
> +        cpu->halt_cond =3D g_malloc0(sizeof(QemuCond));
> +        qemu_cond_init(cpu->halt_cond);
> +
> +        /* share a single thread for all cpus with TCG */
> +        snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
> +        qemu_thread_create(cpu->thread, thread_name,
> +                           tcg_rr_cpu_thread_fn,
> +                           cpu, QEMU_THREAD_JOINABLE);
> +
> +        single_tcg_halt_cond =3D cpu->halt_cond;
> +        single_tcg_cpu_thread =3D cpu->thread;
> +#ifdef _WIN32
> +        cpu->hThread =3D qemu_thread_get_handle(cpu->thread);
> +#endif
> +    } else {
> +        /* we share the thread */
> +        cpu->thread =3D single_tcg_cpu_thread;
> +        cpu->halt_cond =3D single_tcg_halt_cond;
> +        cpu->thread_id =3D first_cpu->thread_id;
> +        cpu->can_do_io =3D 1;
> +        cpu->created =3D true;

I was wonder if we should be duplicating hThread here but on closer
examination it looks like it's only used by HAX/WHPX accelerators so
maybe this is a candidate for accelerator specific CPU data?

Otherwise LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

