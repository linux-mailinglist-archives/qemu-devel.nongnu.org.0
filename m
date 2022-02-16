Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B14B8C1A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:10:38 +0100 (CET)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLwz-0006tx-EL
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLvZ-0006CC-Cs
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:09:09 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36613
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLvX-0003bG-Aj
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:09:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 v8-20020a17090a634800b001bb78857ccdso4387618pjs.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M0NrcGhQmaJLK9hS4KmaSNcallqHM5W7BxYehViCoZs=;
 b=hC1plNOKHERNq4xEkLKJ14WhCQ8GmfJROJfZ5OWqtVX3+4sVly/1yrMBKUFQ3PTveq
 YDHzn5sGeazJBBTo3/WtaIqTSrvDt4xzL8+i98r1XN0lxoFw3QkbYpg1qJc9qMJ8JEnO
 ff6GSQwoZEzwagWVoqcVfnW5jtkhrdD9m9TolQ6eIaASWx2CAnjcj28Eunct3uWskv2p
 bBhyNYYRs/aRFIYHWd/6zvOG+9B0XWzeiJwD/Fa4zao3b8+bkw+9VSIRG9xk6n9Ju4b4
 9XfOYUPIdDS3/WCnirOl1dpho3V3AJz6uG+1P1bzOAux6yE3T0o4kM1e//g+p7OLTjpX
 pqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M0NrcGhQmaJLK9hS4KmaSNcallqHM5W7BxYehViCoZs=;
 b=Ga+txcWn1PuiAfmoTCRzSep4lIayn5qsg7x8V95GefVX6EzU+maObeXNeKDl7dViy3
 ArariHZ+olsCQz95fS00LsoOSG9EO6ETfALutNLaff5OhIcrnuNR3cP/GIhtKvw5LAJc
 vbBPFih3eDV9doeTkyI9viPqZL2zW0PKEGj8A54JfEx52oEI7bYLpvDojB2oFISSvvUK
 +3UNfEnPzNKqvMUi8ce+/MxQZ0YDQKiv8EbNTtbFC1mfgsVcHfSf9jaYkveltSLUE7r1
 c0op0JXs4JBiM5YUbAOATPuPfc2PqZJzWLdG6/OrupdALeVwz4R7kWt3EPRUjY0YyaZO
 WvKA==
X-Gm-Message-State: AOAM5322CkTiFVlJENuIg5HiE3f8bNBxhlnKVvFEAK5F435eQkwskMtj
 M+eUarUNW7e70dIZizuk4F8=
X-Google-Smtp-Source: ABdhPJziAEt+PhPvGRz9bc8S7dbkSFnFtDyyMnuPtzqUoAoE4AvV+0b1hrbPJG36h/jGUzi5wQ3S1Q==
X-Received: by 2002:a17:90b:4f4b:b0:1ba:81fa:c6e3 with SMTP id
 pj11-20020a17090b4f4b00b001ba81fac6e3mr2215252pjb.121.1645024146024; 
 Wed, 16 Feb 2022 07:09:06 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id mt19sm20512631pjb.32.2022.02.16.07.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:09:05 -0800 (PST)
Message-ID: <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
Date: Wed, 16 Feb 2022 16:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
In-Reply-To: <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 11:19, Richard Henderson wrote:
> On 2/16/22 04:01, Philippe Mathieu-Daudé via wrote:
>> GCC 10.1 introduced the -moutline-atomics option on Aarch64.
>> This options is enabled by default, and triggers a link failure:
>>
>>    Undefined symbols for architecture arm64:
>>      "___aarch64_cas1_acq_rel", referenced from:
>>          _qmp_migrate_recover in migration_migration.c.o
>>          _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
>>          _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
>>          _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
>>          _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
>>          _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
>>          _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
>>          ...
>>      "___aarch64_ldadd4_acq_rel", referenced from:
>>          _multifd_recv_new_channel in migration_multifd.c.o
>>          _monitor_event in monitor_hmp.c.o
>>          _handle_hmp_command in monitor_hmp.c.o
>>          _colo_compare_finalize in net_colo-compare.c.o
>>          _flatview_unref in softmmu_memory.c.o
>>          _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
>>          _tcg_register_thread in tcg_tcg.c.o
>>          ...
>>      "___aarch64_swp4_acq", referenced from:
>>          _qemu_spin_lock in softmmu_cpu-timers.c.o
>>          _cpu_get_ticks in softmmu_cpu-timers.c.o
>>          _qemu_spin_lock in softmmu_icount.c.o
>>          _cpu_exec in accel_tcg_cpu-exec.c.o
>>          _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
>>          _page_entry_lock in accel_tcg_translate-all.c.o
>>          _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
>>          ...
>>
>> QEMU implements its own atomic operations using C11 builtin helpers.
>> Disable the GCC out-of-line atomic ops.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>> Cc: Stefan Hajnoczi<stefanha@redhat.com>
>> Cc: Paolo Bonzini<pbonzini@redhat.com>
>>
>> Clearly out of my understanding, but at least it links and the qtests
>> pass.
>> ---
>>   configure | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
> 
> These should have been supplied by libgcc.a, which we're supposed to be 
> linking against. Something is wrong with your installation.

I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
compile these languages, but compiled C files using GCC. At the end the
Clang linker is used (the default c++ symlink).

Could there be a mismatch between Clang (-mno-outline-atomics) and GCC
(-moutline-atomics)?

