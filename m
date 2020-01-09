Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9221350C1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 02:00:36 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipMBe-0001F0-9g
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 20:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMAC-0000ia-Ps
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 19:59:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMAB-0001z1-35
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 19:59:04 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipMA9-0001uK-PA
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 19:59:02 -0500
Received: by mail-pl1-x644.google.com with SMTP id p9so1816217plk.9
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 16:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=AeWzA6tBi6Il/1HonnJTvliIFQYNhq8at6n6ZvU3U58=;
 b=A4ZMx/VWDLZehxggBDieHWn91Xt/aHqayDb127at7ERq1+XIK4wusMpKzO6oSBHazH
 ltO32OKlsueshML5bQ93EYfgMfJXR8Q6zRa334TdlVd6XJPOV73vgWBYWwbMFqPsYo1j
 3a7VChkATEtPR7AY7pOxqPawDdTrlKnS9wUOE87HLrlm6cQVlJPCnt1Pfsq7LeMZhp0n
 ebgmk7emp0yrEfuTiGewWdS0/8L1R0MOTF3rQ8uRJL5mcj0CpSSqHolcUOtuZzo8nPTj
 df+quYqon5DGbA02ZWYnw6ZZoSOQ5SDdQbecI2sl6QatQZjuTvpPEHdkS8twqS+7Gg4m
 HxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=AeWzA6tBi6Il/1HonnJTvliIFQYNhq8at6n6ZvU3U58=;
 b=KfjvAwm9VH2D7fjDmACY9YHFKKM90ykhmW6Sw3mgQeZVujknwscmIFiug7E+7Kyyhh
 Lf7IuJ2eW3Och158nsap4OXiGJYXI1C2oDjP4N7lFxAiWj1xNrICy+n/kCyaj/mgatDh
 KK9nLAIu932FHL8Br7gl+06hET8tdGfFSmC/g+M88ErHpm5cO2wBPXtZV+338Y8BKrGY
 guHtyynkz+0OJE8XRQE3bDrMPg/l+9L8X+lCGHMkEHV5T3U4jihVNpo7vBDKM2T6yw6M
 UCzYP/Qy37qXqg5gNF5kDSrzyNV8Babi1TmaVz23AQDXMIJc5LeU054/W+bSoOl/QCFg
 I6Ig==
X-Gm-Message-State: APjAAAUJeZtA3tQqfiqUCz+fx3urz257Pf6819I5NO0gmHJHqrgpXKvN
 TjFNZQwlOyFb+er9b+wcdxMiwJspdsM=
X-Google-Smtp-Source: APXvYqw2ZzI+tjvZ1jd9qihxiDExql7i7WDYNkFZcfoNT/bTbigEMSnoMpsUVuuQbmQIFbOLoZvp6A==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
 r4mr8487712plo.291.1578531539121; 
 Wed, 08 Jan 2020 16:58:59 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id i17sm5038140pfr.67.2020.01.08.16.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 16:58:58 -0800 (PST)
Date: Wed, 08 Jan 2020 16:58:58 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 16:58:47 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 29/36] target/riscv: Respect MPRV and SPRV for floating
 point ops
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <f1725ddb8d69edf68ddd2d6e1b6688cd7b2ba550.1575914822.git.alistair.francis@wdc.com>
References: <f1725ddb8d69edf68ddd2d6e1b6688cd7b2ba550.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-a52e4450-6d1b-4035-aa67-4eb899412231@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 09 Dec 2019 10:11:56 PST (-0800), Alistair Francis wrote:
> mark_fs_dirty() is the only place in translate.c that uses the
> virt_enabled bool. Let's respect the contents of MSTATUS.MPRV and
> HSTATUS.SPRV when setting the bool as this is used for performing
> floating point operations when V=0.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1d879b34db..dd93e12b45 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -748,7 +748,21 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +    if (riscv_has_ext(env, RVH)) {
> +        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +        if (env->priv_ver == PRV_M &&
> +            get_field(*env->mstatus, MSTATUS_MPRV) &&
> +            get_field(*env->mstatus, MSTATUS_MPV)) {
> +            ctx->virt_enabled = true;
> +        } else if (env->priv == PRV_S &&
> +                   !riscv_cpu_virt_enabled(env) &&
> +                   get_field(env->hstatus, HSTATUS_SPRV) &&
> +                   get_field(env->hstatus, HSTATUS_SPV)) {
> +            ctx->virt_enabled = true;
> +        }
> +    } else {
> +        ctx->virt_enabled = false;
> +    }
>  #else
>      ctx->virt_enabled = false;
>  #endif

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

