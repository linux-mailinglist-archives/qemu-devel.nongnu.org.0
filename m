Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF24B8568
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:22:40 +0100 (CET)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHSJ-0003mV-Jc
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKHPk-0002OU-Mk
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:20:00 -0500
Received: from [2607:f8b0:4864:20::1036] (port=39435
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKHPi-0003vx-4E
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:20:00 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso5989404pjt.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JOvMHt5fpawB6UrTmCHCyyl826xLmI3BjTRXgHL96l4=;
 b=YQt83nLIhBaw6spPOISyDEjnaGkr79y9cZ+oREvO5cuBqGYEeE3DJgvPsRSPzIdjWX
 NcL9+9Lwu7obJEMvXXkhIyi0hSJ1nQEv2ZzhxZstei6pTpzhpaxl9Tx4suJZ7yigY9CD
 IXsvQBLpm8eLWoQrkZ4ddIBispw+clNKTpzOClcQ0jIXe9NzH604Ko5DdBL17aTIu1HC
 BGChvyoJkmetm3r3YYsuYteEGU9LwAS7equNbWhtySGs8U45nItKxPbZhMGjCuDgQZw7
 mcfEv9zSd+8w2ttnnadsbvkbuLVk1T5FIqjgL/xxu8gtzQVlomkpYfnZYbzdzsLPkNZ0
 ARhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JOvMHt5fpawB6UrTmCHCyyl826xLmI3BjTRXgHL96l4=;
 b=R+I+bFYtazlx2olnDWsUHV1G0I/MVcQ69/hD2yXOJMppLdl0wUgky9koGP+OjrnOC2
 KZgIQQw6/kiMQas64+xokB8vJthaylGeKAkX9D90VvNVqYKlAuq/7Je6I3+AkrM1xa5Y
 agHxobB70V/xt+AQpE17S9wghyeXGmPGLdOr4lmO3H8NziHTyDTN7BkALSv3/wvU8tBf
 MX6FNTZmtm6ShKjNUDwUDg8TQSCCD6/Jl+noF2oKH0AT9M0SyVbRITLpuvlKB1UU3Gkq
 sLygki8zz+RRfkleBhZybkU5Mws6DrFgBu+2ELqmMySozQ1bjWjfFc3F9P7Q8QWJlxwA
 tyHw==
X-Gm-Message-State: AOAM532Y8ROpccIElXe/CDoqiYbuX6UInjpzYHZ9CxQK8NhYHliyQVgs
 XlRrf3vOEnVLfOjRae8JZR1Leg==
X-Google-Smtp-Source: ABdhPJxe4x7d/7HHp3j+czLouvwaCZUAF3wxF+TgcLnvqQTajM3Mah2Aj/8alht4DRRSLbSjhwnDyA==
X-Received: by 2002:a17:902:dcd4:b0:14d:af57:ec5c with SMTP id
 t20-20020a170902dcd400b0014daf57ec5cmr2005118pll.141.1645006796713; 
 Wed, 16 Feb 2022 02:19:56 -0800 (PST)
Received: from ?IPV6:2001:8003:3669:700:fe11:3bc:6f06:c324?
 ([2001:8003:3669:700:fe11:3bc:6f06:c324])
 by smtp.gmail.com with ESMTPSA id e13sm11318046pfv.190.2022.02.16.02.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:19:56 -0800 (PST)
Message-ID: <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
Date: Wed, 16 Feb 2022 21:19:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220215170106.95848-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 04:01, Philippe Mathieu-Daudé via wrote:
> GCC 10.1 introduced the -moutline-atomics option on Aarch64.
> This options is enabled by default, and triggers a link failure:
> 
>    Undefined symbols for architecture arm64:
>      "___aarch64_cas1_acq_rel", referenced from:
>          _qmp_migrate_recover in migration_migration.c.o
>          _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
>          _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
>          _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
>          _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
>          _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
>          _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
>          ...
>      "___aarch64_ldadd4_acq_rel", referenced from:
>          _multifd_recv_new_channel in migration_multifd.c.o
>          _monitor_event in monitor_hmp.c.o
>          _handle_hmp_command in monitor_hmp.c.o
>          _colo_compare_finalize in net_colo-compare.c.o
>          _flatview_unref in softmmu_memory.c.o
>          _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
>          _tcg_register_thread in tcg_tcg.c.o
>          ...
>      "___aarch64_swp4_acq", referenced from:
>          _qemu_spin_lock in softmmu_cpu-timers.c.o
>          _cpu_get_ticks in softmmu_cpu-timers.c.o
>          _qemu_spin_lock in softmmu_icount.c.o
>          _cpu_exec in accel_tcg_cpu-exec.c.o
>          _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
>          _page_entry_lock in accel_tcg_translate-all.c.o
>          _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
>          ...
> 
> QEMU implements its own atomic operations using C11 builtin helpers.
> Disable the GCC out-of-line atomic ops.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> Cc: Stefan Hajnoczi<stefanha@redhat.com>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> 
> Clearly out of my understanding, but at least it links and the qtests
> pass.
> ---
>   configure | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

These should have been supplied by libgcc.a, which we're supposed to be linking against. 
Something is wrong with your installation.


r~

