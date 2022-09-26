Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869A5EA84C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:24:00 +0200 (CEST)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp1b-00033C-66
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoov-0002az-0F
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:10:57 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoos-00026x-V4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:10:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id r18so14311412eja.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=tD+pb9b1e03R7duXlSF9Sq2SFAGrj/kZQapwl9bhPbY=;
 b=YQAMU6O4yG3uXnzg7/dEBxzISe8BRPihdkfpRYERtz4Llj41U3VezrIR/Jdwm393ZN
 TtcEPb97M62qLFSkccjMZUaoyu7CY4z9hTKWUAWdJZ1xXxuweF8sta3cSab60It15aDo
 9kxPisIFInG3gi+4SdVFkkkoamXA1HakGAqUejidajzvV61uoO6a4IQ6/0R/fzPvT30a
 PkP5g49bqlESNYZbZ3TENPsPqafCCmBJC5o8bJTSvE/5s8rD/BHA8YLAruM+RvrBhyev
 B01wca9NtGdKEmMu4Lw1awjEi7HAkH1KlpOdglYrvRZZsufyPRfJeca+UgoCgQrGdo1J
 BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tD+pb9b1e03R7duXlSF9Sq2SFAGrj/kZQapwl9bhPbY=;
 b=aTCXtTKW+ipJmvP4r0xsFD7nWXTa2Dv7gU5bpQgsvZPoYMVHjXNO4iwLzesMQVh+EM
 puJc6UKLgkJ/AxaD/t6Uviqm+IiE95brG2XbiuoOWPWw2OCk6RD7UWz5JBh0S7+9sZlN
 fJ7wpBrnk05/JzUbFYeeXitpwjGGvLHUiBFcQFXjxz9IG6XoYYH4ySP9prxDunwwWXun
 fCWht+zJNeBsQ0dfNxm+Cf54+rfG6hz0ODBe6BBTOlupufK13STgphfC3HcSPeNU7cfE
 p3rWW1KTng9v0dBl+VeUy1Kraff1ay45EMUn7qr6b+nD0aj2t3G9VzNY+tfyQ7h6vE4K
 7lCg==
X-Gm-Message-State: ACrzQf3btdFjWNRY8qN6FoZBxfzXIdE4WuF1uYTdPyrz02cqeAVcsfdn
 4jwbIACa4Xp0v8iPFBzSvhI8Fnb9U7fK9mg894prjw==
X-Google-Smtp-Source: AMsMyM7yt43Gic4fd2TlqpqwlXpXkBtQHN1hm7EnIz8JBf7LEmcdxWKMAcoMxvP0TXJ8cIyLS4wQddd/1xDFe9Rdfig=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr17810672ejb.609.1664201448864; Mon, 26
 Sep 2022 07:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-4-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:10:37 +0100
Message-ID: <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> Cc: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 060aa0ccf4..13b7971560 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>              val =3D hvf_get_reg(cpu, srt);
>              address_space_write(&address_space_memory,
>                                  hvf_exit->exception.physical_address,
> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, le=
n);
>          } else {
>              address_space_read(&address_space_memory,
>                                 hvf_exit->exception.physical_address,
> -                               MEMTXATTRS_UNSPECIFIED, &val, len);
> +                               MEMTXATTRS_CPU(cpu->cpu_index), &val, len=
);
>              hvf_set_reg(cpu, srt, val);
>          }

Don't we need a similar thing for KVM ? (In that case it's in
the generic code in accel/kvm/kvm-all.c, for the KVM_EXIT_MMIO
handling.)

-- PMM

