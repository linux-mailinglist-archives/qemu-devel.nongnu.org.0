Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDA4E3298
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:13:33 +0100 (CET)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQHM-0004ED-P8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQG7-0002CN-2Z
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:12:15 -0400
Received: from [2a00:1450:4864:20::42a] (port=38441
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQG4-0005Na-CH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:12:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t11so22581709wrm.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lN4uAChASYabnyAx04z3g4UCGFmw351OSuY4EUQ79Do=;
 b=Knz5U6kRBYju8jovYBcCugTTwSMNA0PSEOPY1TX9GXN3hCZ9W6hy8xdaBN2oaJqKOG
 KmDMOI1pq7pOwNE2LCuzIlAd3qGZ6udKKliiS4Jzf2T3Btn6y/uQ5FdOWymu4zYZx/0d
 pdKsB22pGNK9USAIcKj3FVYltdzZwOu8JBV28GdpHM9fHsDmMink35A1SRNkrhy+EO/M
 RlRtro07i+twZqKJKHbkvOvuWkXH4ZPyPn2uKDCQWSnG7L5zxiXgCbHR9OT+ozL0doTC
 ARXDXjO2hEjDmWTVaJ09n5ESsdCN1kxEqU8M4bDMI9+PlTrKYy7gJTLA+7TCe0WFsMHs
 teEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lN4uAChASYabnyAx04z3g4UCGFmw351OSuY4EUQ79Do=;
 b=UCw6cDqQpHAbVAJh4XiS5aX1270fIFgo0SGA2kMaaXWLnzWjhfE6SyItZD1l4rX6aX
 7y+++MAyd9YvyFw8IucsV/7Jc/bBhb592COD5e0YcgixSy4bVBP15zkdEpNIk1QKMF1E
 qznPDAhuXcc5jrO0wZ30Zs+G9HPJ1j7hzOM9Kw2g6K516QQGqDLwLUHQmhMh1WfdLYaG
 DmrvAFUq6llYX5iQTy4MpkZ+dpOYsRB0NPxd8GdXpRcoKdKsDCkajIy/dBBMjsNKOqod
 LSaJyu3MGM7MeQnEpAAASQ+NRQaVluWO/ZHdb+OfzWMAjuKac3UXotSR+kogn5NPOAhG
 E46g==
X-Gm-Message-State: AOAM530DDrZK4kYIQ8RT0t8iT6pH7rXOTefCplF7VJpCLPylhX1vfOMw
 QkCWNPWMNLNiyxSbTrc72vZJ4N6g/r4=
X-Google-Smtp-Source: ABdhPJycGWb7NEQfmhesgLOVcGGDuXXPtQBoxqg6iZog+nomV7lVCkzjJuQt7X7vSDCbVYL7m+CYog==
X-Received: by 2002:a5d:4441:0:b0:1f0:882d:77e9 with SMTP id
 x1-20020a5d4441000000b001f0882d77e9mr19220520wrr.718.1647900730934; 
 Mon, 21 Mar 2022 15:12:10 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm7919594wrs.96.2022.03.21.15.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:12:10 -0700 (PDT)
Message-ID: <652c4cf9-65d4-33fb-805e-07d156271ccb@gmail.com>
Date: Mon, 21 Mar 2022 23:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-4-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321141409.3112932-4-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 15:14, Mark Kanda wrote:
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 8,555
> ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)

Here we want to extract a common generic_init_vcpu_thread().

> ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
> ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
> ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
> ==102631==    by 0x93E329: property_set_bool (object.c:2273)
> ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
> ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
> ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
> ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
> ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   accel/accel-common.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 623df43cc3..297d4e4ef1 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -140,4 +140,5 @@ type_init(register_accel_types);
>   void generic_destroy_vcpu_thread(CPUState *cpu)
>   {
>       g_free(cpu->thread);
> +    g_free(cpu->halt_cond);
>   }


