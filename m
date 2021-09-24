Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7F4176F9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:43:16 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmPz-00078o-1g
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mTmOF-0006S6-J1; Fri, 24 Sep 2021 10:41:27 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mTmOD-0005Rw-Iy; Fri, 24 Sep 2021 10:41:27 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id cv2so314149qvb.5;
 Fri, 24 Sep 2021 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v2ZKXWqXK/seH2yQQaNzWZ47PMzGrbpiS/63TJKJ0cE=;
 b=ppg4ruglAIaJOpNzDoFRjyc2noVWOzQLZSctHstxv0pC6b+fU9zYe8mQgQyqeiz+NZ
 zb9rbF4w9n/awPEgouw8Lp7oGPjUJvHUv8REedbpxaJGtkTYOi0hnMR5FdDpCBsccInj
 XJxrcE5If53L2D4hec2H+4k55g+3ffPrrpll3kdUv6/R0nloOqzLxsUnmf1hq5bw7gCM
 osUNe6Odr2uTkbXsRKNf8BriwesC4wAPgK7sSP3CX+RF72C7hm4lu8OXrKI8B3o6lEam
 eGZYJHM6bFb7dokRnC/pjhzXDltxMzaTgCB7Mfy+Xvy8LpA6kl1SM/R23b16YvNUGYbX
 e5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v2ZKXWqXK/seH2yQQaNzWZ47PMzGrbpiS/63TJKJ0cE=;
 b=CNgRCx4imyke8ZNHy/xMpAraCcOR727PU1M5yMN5GYVFSpci3vd71IoJT3cmGY2NAM
 79qcwi7pv4hmswWWwXvZKJ4erTAb1zZwKW3kf0FoL0Nqmed1cX3rWv9RLZP/K7MnOSwH
 dMJJB8MzpS0rbHnELixwClpAqOl7c6m+qNQR0qgiPOFGtuoUNcGmpu66+vDBMNOGsgOJ
 4vvvmiDKqJfZC8zYa3sMeQirf/KVgABM3fSXWTBnBb+HBq76BNoJxXW0OjwUhoDEKBr6
 AfdfM5fh25sBsq188zeQmRyYBWmIM22RZSYINIB4qMXN3o3KAp6gW4oX5R9BUHY8pxga
 BY4g==
X-Gm-Message-State: AOAM532JDlwH2MGMnehyayx7h0wpQJIsRW1AJMe0r+CB1T0cMwZbpL2d
 2qVAlY6fZfJaqwYCUXAtspY=
X-Google-Smtp-Source: ABdhPJzAJfHkSpYAPv7y57dGphJuZR9D5o1Glvs+Gifdrz7Ms50bJrLhWFIqxg0ExbWFhzGVdTUB0w==
X-Received: by 2002:a0c:9c86:: with SMTP id i6mr4046746qvf.62.1632494483702;
 Fri, 24 Sep 2021 07:41:23 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id bi20sm6030367qkb.133.2021.09.24.07.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 07:41:23 -0700 (PDT)
Message-ID: <9497e03c-69c3-c736-283f-b95331f4b2e2@gmail.com>
Date: Fri, 24 Sep 2021 11:41:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/15] target/ppc: PMU basic cycle count for pseries TCG
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-4-danielhb413@gmail.com>
 <fa7aa371-3fa0-e064-cf73-1c89508bba00@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fa7aa371-3fa0-e064-cf73-1c89508bba00@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/21 08:24, Matheus K. Ferst wrote:
> On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>
>> This patch adds the barebones of the PMU logic by enabling cycle
>> counting, done via the performance monitor counter 6. The overall logic
>> goes as follows:
>>
>> - a helper is added to control the PMU state on each MMCR0 write. This
>> allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
>> is cleared or set;
>>
>> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
>> having to spin the PMU right at system init;
>>
>> - the intended usage is to freeze the counters by setting MMCR0_FC, do
>> any additional setting of events to be counted via MMCR1 (not
>> implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
>> freeze counters to read the results - on the fly reading of the PMCs
>> will return the starting value of each one.
>>
>> Since there will be more PMU exclusive code to be added next, put the
>> PMU logic in its own helper to keep all in the same place. The name of
>> the new helper file, power8_pmu.c, is an indicative that the PMU logic
>> has been tested with the IBM POWER chip family, POWER8 being the oldest
>> version tested. This doesn't mean that this PMU logic will break with
>> any other PPC64 chip that implements Book3s, but since we can't assert
>> that this PMU will work with all available Book3s emulated processors
>> we're choosing to be explicit.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
> 
> <snip>
> 
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 0babde3131..c3e2e3d329 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -401,6 +401,24 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>>       spr_store_dump_spr(sprn);
>>   }
>>
>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    /*
>> +     * helper_store_mmcr0 will make clock based operations that
>> +     * will cause 'bad icount read' errors if we do not execute
>> +     * gen_icount_io_start() beforehand.
>> +     */
>> +    gen_icount_io_start(ctx);
>> +    gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
>> +}
>> +#else
>> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    spr_write_generic(ctx, sprn, gprn);
>> +}
>> +#endif
>> +
>>   #if !defined(CONFIG_USER_ONLY)
>>   void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>>   {
>> @@ -596,7 +614,10 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>>       tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
>>       /* Keep all other bits intact */
>>       tcg_gen_or_tl(t1, t1, t0);
>> -    gen_store_spr(SPR_POWER_MMCR0, t1);
>> +
>> +    /* Overwrite cpu_gpr[gprn] and use spr_write_MMCR0() */
>> +    tcg_gen_mov_tl(cpu_gpr[gprn], t1);
>> +    spr_write_MMCR0(ctx, sprn + 0x10, gprn);
> 
> IIUC, this makes writing to MMCR0 change the GPR value and expose the unfiltered content of the SPR to problem state. It might be better to call the helper directly or create another method that takes a TCGv as an argument and call it from spr_write_MMCR0_ureg and spr_write_MMCR0.

I'm overwriting cpu_gpr[gprn] with t1, which is filtered by MMCR0_REG_MASK
right before, to re-use spr_write_MMCR0() since its API requires a gprn
index. The reason I'm re-using spr_write_MMCR0() here is to avoid code repetition
in spr_write_MMCR0_ureg(), which would need to repeat the same steps as
spr_write_MMCR0 (calling icount_io_start(), calling the helper, and then setting
DISAS_EXIT_UPDATE in a later patch).

The idea behind is that all PMU user_write() functions works the same as its
privileged counterparts but with some form of filtering done beforehand. Note
that this is kind of true in the previous patch as well - gen_store_spr() is
similar to the privileged function MMCR0 was using (spr_write_generic()) with
the exception of an optional qemu_log().

Maybe I should've made this clear in the previous patch, using spr_write_generic()
and overwriting cpu_gpr[gprn] with the filtered t1 content back there.

Speaking of which, since t1 is being filtered by MMCR0_REG_MASK before being used to
overwrite cpu_gpr[gprn], I'm not sure how this is exposing unfiltered content to
problem state. Can you elaborate?



Thanks,


Daniel

> 
>>
>>       tcg_temp_free(t0);
>>       tcg_temp_free(t1);
>> -- 
>> 2.31.1
>>
> 
> 

