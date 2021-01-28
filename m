Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93B307E93
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 20:09:24 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5CfS-00007e-Or
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 14:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5Cc2-0007h5-Su
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:05:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5Cbz-0004ig-QL
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:05:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id c12so6510517wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=e8VQhvkW6TItv0idWi+56T/WHww5kkJ/NQu6uZj7lWc=;
 b=WGcsBrRHiOskVmFx59AkpDKKl9m+6f1JftuBM66O05xAwh4aJ3X/zhadxumYPj87to
 aQRu4LvaU186LHJaWsU2c8kbJtvoN2OItD1vaWpQ/4brZL7PLeayve0sgFq2vEzhvDKd
 NS//I6siN4DbsPveyC+4p1/10ZshOk3BmZ3iT2hpz2hgqyyZO3CM3FAEja9zvq6qFeAN
 gMjh1bGVPj4dk8hvmsx4ND2s22BI+AOTT8tTmj7L5CEqRE9LMO8EhKIMVfVW/k1MW3Bl
 p14pr3pIZAIa8IokpCN/Gdi1cTxKFWxgL54Q0UHDnS0V3HtG2T2Oq3w6nuy6EV5gNVlQ
 Emmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=e8VQhvkW6TItv0idWi+56T/WHww5kkJ/NQu6uZj7lWc=;
 b=Kl3Rdtt4HwLpXDCEiUrkYB9u1lK23H8YQ8z44afXWHnyDINcNDHjPjpHAUesNNwKGR
 ac9G+eVmzh/0raSBKpRGwR26g6MnrelnSzgJZT6uurVPARVxOCIvDrjkgwZnMPhkADf8
 Xd7qf10S0zKi9Xdjw7dqPamY/AXRci5Kob7qaK3R02Cr4loshUNMmayxvyc+JzllK2G7
 Vkst1h2I7iNRfRe4ToDV5U4gGsRFKxbmsSvxpic4E6AcypYZHrBHrxTqvPghmZUFRR+p
 J7N/pY+zeJS4ZMrf9cA5+fTfwIVFhsH3K4Rzpy94w+vCJ+hZimTQNkV+NkT+xF0tlQI+
 QWug==
X-Gm-Message-State: AOAM533aP2dXuPydFwjZ2IoTJWE6oy6yfjf6pU5W0OvLRXLqWL0SXo28
 FCxKCdbYNTSoyTuBjhny+1EDEA==
X-Google-Smtp-Source: ABdhPJxX0zmBL3lzIXnYSAnBWIPleKuZ1Xf//8dc8VWcgb1yknMPCd3f8a1MYtgNc0jKq2q5XeENOA==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr524064wrr.259.1611860746297;
 Thu, 28 Jan 2021 11:05:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm12975714wmk.0.2021.01.28.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 11:05:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 706BF1FF7E;
 Thu, 28 Jan 2021 19:05:43 +0000 (GMT)
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-5-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v14 04/22] cpu: Move synchronize_from_tb() to tcg_ops
Date: Thu, 28 Jan 2021 18:58:03 +0000
In-reply-to: <20210128092814.8676-5-cfontana@suse.de>
Message-ID: <87a6ssubjs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/cpu.h     | 20 +++++++++++---------
>  accel/tcg/cpu-exec.c      |  4 ++--
>  target/arm/cpu.c          |  4 +++-
>  target/avr/cpu.c          |  2 +-
>  target/hppa/cpu.c         |  2 +-
>  target/i386/tcg/tcg-cpu.c |  2 +-
>  target/microblaze/cpu.c   |  2 +-
>  target/mips/cpu.c         |  4 +++-
>  target/riscv/cpu.c        |  2 +-
>  target/rx/cpu.c           |  2 +-
>  target/sh4/cpu.c          |  2 +-
>  target/sparc/cpu.c        |  2 +-
>  target/tricore/cpu.c      |  2 +-
>  13 files changed, 28 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 96fdca39d2..b3c1bb77eb 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -87,6 +87,17 @@ typedef struct TcgCpuOperations {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBl=
ock
> +     *
> +     * This is called when we abandon execution of a TB before
> +     * starting it, and must set all parts of the CPU state which
> +     * the previous TB in the chain may not have updated. This
> +     * will need to do more. If this hook is not implemented then
> +     * the default is to call @set_pc(tb->pc).
> +     */

Possibly re-word a little more?

  ...TB in the chain may not have updated. By default when no hook is
  defined a call is made to @set_pc(tb->pc). If more state needs to be
  restored the front-end must provide a hook function and restore all the
  state there.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index fa4d4ba4eb..140cb33f07 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -54,6 +54,7 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>      }
>  }
>=20=20
> +#ifdef CONFIG_TCG
>  static void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                          const TranslationBlock *tb)
>  {
> @@ -70,6 +71,7 @@ static void arm_cpu_synchronize_from_tb(CPUState *cs,
>          env->regs[15] =3D tb->pc;
>      }
>  }
> +#endif /* CONFIG_TCG */

Looking at the function here I wonder if we should be worried about the
thumb state? Peter?

static void arm_cpu_set_pc(CPUState *cs, vaddr value)
{
    ARMCPU *cpu =3D ARM_CPU(cs);
    CPUARMState *env =3D &cpu->env;

    if (is_a64(env)) {
        env->pc =3D value;
        env->thumb =3D 0;
    } else {
        env->regs[15] =3D value & ~1;
        env->thumb =3D value & 1;
    }
}

#ifdef CONFIG_TCG
void arm_cpu_synchronize_from_tb(CPUState *cs,
                                 const TranslationBlock *tb)
{
    ARMCPU *cpu =3D ARM_CPU(cs);
    CPUARMState *env =3D &cpu->env;

    /*
     * It's OK to look at env for the current mode here, because it's
     * never possible for an AArch64 TB to chain to an AArch32 TB.
     */
    if (is_a64(env)) {
        env->pc =3D tb->pc;
    } else {
        env->regs[15] =3D tb->pc;
    }
}
#endif /* CONFIG_TCG */


Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

