Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FB6433F29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 21:20:53 +0200 (CEST)
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcufM-0002wT-Id
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 15:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcudH-00022V-CW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:18:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcudF-0001rJ-MF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:18:42 -0400
Received: by mail-pl1-x62e.google.com with SMTP id v20so14385973plo.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MQGfRT5+DilAHwQD/0J4fBL0FwOG8sPRMQn2yS/n7YA=;
 b=KsEq/17NiPc1Qbva7Tre4kYYZB/Itg1OV39bPamRuNLzCn+BApugCJ3fSn3LP/xzws
 syU1pBoJOo6BIuBTidh5GUYCHO950JSvHvlvq7XX5xjLBQ5ecU3prij4NEHoH+BsbUZR
 liZU6upu9L7WcQIJKwwb9tj1tUbSn2Ki9TiCZSaaRjFE0Rs0vuPZVH+sKu92j2gM8XIM
 WLyLAJD/+b8vUH+7UOplYDuHMEuzHBx8N+dHE1zQ4ZnkeFJfPaYm2xq9m5l0FS0pNGqE
 SjIY7A652P3A33tVv7Zzc9upvaeY2+MjhGIbfbce17Xlb2vayKbKveOFSLImUiOf+mor
 iXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MQGfRT5+DilAHwQD/0J4fBL0FwOG8sPRMQn2yS/n7YA=;
 b=CaYnNowUGSRwyPdbbfSWqzbJELSCKrLRRNbRzIbr/8wUr8Hdt1dGqD9ay9dKocbzRy
 S5j6STuoxu9y8NNvvpnhrrq2h5XZqLOIq1EBtAARA9cv850LnRsoijDxxjHhFS0pljlz
 L1eCQ7GFjdhkuT+8L3yXqZQqWZM7crcxzkA5+5rqgbQiiQtDnj5oJHDTwsc03i6cz3QY
 jDjHumCZMckOjIC4XQAi4ypHLyVcHjlHeWdZC0itzrlrOQxYg+JBNXPF2DrzIhZ9Lqe+
 DxMo4fIlFRkHE7bRf9faePgZPV+JCXyqmkEPt9YvKHL/cTV7KmUlmGWNbkuofOR5uB3A
 hsaA==
X-Gm-Message-State: AOAM5310nplkHYT0bMmrYyASVfmMYgFpNtyNy81EMBYVrDOjo4O7OrsA
 AfT2UjVRyS7N55nyQ8GHCdqTDQ==
X-Google-Smtp-Source: ABdhPJwlVwGjLUSZbPJLgeljYy7rL2e3BMUQRHGDmTg+CSZTf5qMF2gGYA7zmXjTbPjlnLKdrNo9Sg==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr2012135pjg.202.1634671119748; 
 Tue, 19 Oct 2021 12:18:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g11sm5330pgn.41.2021.10.19.12.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 12:18:39 -0700 (PDT)
Subject: Re: [PATCH 03/31] target/loongarch: Set default csr values.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-4-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87c82387-5a73-5cff-b9fc-731303091d72@linaro.org>
Date: Tue, 19 Oct 2021 12:18:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-4-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> +#ifndef CONFIG_USER_ONLY
> +static void set_loongarch_csr(CPULoongArchState *env)
> +{
> +    uint64_t t;
> +
> +    t = FIELD_DP64(0, CSR_PRCFG1, SAVE_NUM, 8);
> +    t = FIELD_DP64(t, CSR_PRCFG1, TIMER_BITS, 0x2f);
> +    t = FIELD_DP64(t, CSR_PRCFG1, VSMAX, 0x7);
> +    env->CSR_PRCFG1 = t;
> +
> +    env->CSR_PRCFG2 = 0x3ffff000;
> +
> +    t = FIELD_DP64(0, CSR_PRCFG3, TLB_TYPE, 2);
> +    t = FIELD_DP64(t, CSR_PRCFG3, MTLB_ENTRY, 0x3f);
> +    t = FIELD_DP64(t, CSR_PRCFG3, STLB_WAYS, 0x7);
> +    t = FIELD_DP64(t, CSR_PRCFG3, STLB_SETS, 0x8);
> +    env->CSR_PRCFG3 = t;
> +
> +    t = FIELD_DP64(0, CSR_CRMD, PLV, 0);
> +    t = FIELD_DP64(t, CSR_CRMD, IE, 0);
> +    t = FIELD_DP64(t, CSR_CRMD, DA, 1);
> +    t = FIELD_DP64(t, CSR_CRMD, PG, 0);
> +    t = FIELD_DP64(t, CSR_CRMD, DATF, 1);
> +    t = FIELD_DP64(t, CSR_CRMD, DATM, 1);
> +    env->CSR_CRMD = t;
> +
> +    env->CSR_ECFG = FIELD_DP64(0, CSR_ECFG, VS, 7);
> +    env->CSR_STLBPS  = 0xe;
> +    env->CSR_RVACFG = 0x0;
> +    env->CSR_ASID = 0xa0000;
> +    env->CSR_ERA = env->pc;
> +}
> +#endif
> +
>   /* LoongArch CPU definitions */
>   static void loongarch_3a5000_initfn(Object *obj)
>   {
> @@ -113,6 +147,9 @@ static void loongarch_3a5000_initfn(Object *obj)
>       CPULoongArchState *env = &cpu->env;
>   
>       set_loongarch_cpucfg(env);
> +#ifndef CONFIG_USER_ONLY
> +    set_loongarch_csr(env);
> +#endif
>   }
>   
>   static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
> @@ -140,6 +177,9 @@ static void loongarch_cpu_reset(DeviceState *dev)
>       lacc->parent_reset(dev);
>   
>       set_loongarch_cpucfg(env);
> +#ifndef CONFIG_USER_ONLY
> +    set_loongarch_csr(env);
> +#endif

As I said vs patch 2, I think you'll want to set all of these unconditionally.


r~

