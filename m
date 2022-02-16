Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BC4B8F0E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:21:39 +0100 (CET)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNzl-0006xX-Gf
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKNx9-0004Ar-G0
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:18:55 -0500
Received: from [2607:f8b0:4864:20::52b] (port=43845
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKNx7-0003pK-PB
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:18:55 -0500
Received: by mail-pg1-x52b.google.com with SMTP id r76so2696955pgr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EF+NKXbrtv/QNaBwXnYGQM61PefZhaDqnVpjGLHrpdw=;
 b=gYln7xVGLQwS/319CHQOmRQk+LnuLVnZrV4j4tG1+vLMZrOU0XtJrcE46+hctzWb2b
 1DP9hkVb/vh4KH2Eh1RDKeoabQOyXJIHewFzrFs/rGEWZG1+ktXPiEhiYJ5eQ4nbvhDK
 u8fiDFjkbRGYfSDONPp7RQdLlQRLrX/hdrnWNxs+4J0lHts2wTxxevTOSeRyyKDoWj+I
 DuSi1OdqKpzytnnoUW3tkjX0mXBFPnK6d2SAs+JXSJrFuUXCFUJ+Cp2CveFc1UsqqyEx
 KaHbrdDX1zU+BdmcHIrmgScJjAMgDIe7S6XrMk+9TxYqsUZUsF3qzB8vGXxZnvCfXZq6
 V47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EF+NKXbrtv/QNaBwXnYGQM61PefZhaDqnVpjGLHrpdw=;
 b=gkXrEY2W9MhZRYikUydIvjFWj9Lw5AJD2ta5NUa9+ljG+7tFaP7r8jNwdOG8qljEps
 +C3vOuGCLLaE8XubgMzy82NN6S3aIn2FijGDuf4VHRJ1/z/4Ac7Idv3Iici06QAUzRRO
 TxDRRnkjqCFiSsXw5CsiZ8wcpcZenfpW3dWHvUQvp/XYqJ0JVmVnnF1Vnz6RgsTW/Laz
 u8GsInD5LskFYBm1rD9PPWS+i70ay3H1uqTN6ISgQwG7UGd81RUQ6ODgmsWyuXkKy9wP
 1hxb8i+1uCPMFaaW2L4PFS6OVW6WgpNl7k0zT/MNK5gMPH64NSB/s26UfvIt06MeZlT3
 hPlA==
X-Gm-Message-State: AOAM533uX06N73MVlbwZQOOn14fBHekkqBFyItNX/FqMtd7+O3XG0AVr
 wsiSBDE5Xhdsx6REUVQhrG0=
X-Google-Smtp-Source: ABdhPJy3lVu7r+GvGezR/4fGm31sKRzqYlhP8KlSIHe6dgfmMnn/7Ocj2kyT9iQoP6ugPTAjSYU5YQ==
X-Received: by 2002:a63:f750:0:b0:342:b67b:5922 with SMTP id
 f16-20020a63f750000000b00342b67b5922mr3041541pgk.483.1645031931166; 
 Wed, 16 Feb 2022 09:18:51 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b8sm548176pfv.74.2022.02.16.09.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:18:50 -0800 (PST)
Message-ID: <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
Date: Wed, 16 Feb 2022 18:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
 <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
In-Reply-To: <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
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

On 16/2/22 17:42, Akihiko Odaki wrote:
> On 2022/02/17 0:08, Philippe Mathieu-Daudé wrote:
>> On 16/2/22 11:19, Richard Henderson wrote:
>>> On 2/16/22 04:01, Philippe Mathieu-Daudé via wrote:
>>>> GCC 10.1 introduced the -moutline-atomics option on Aarch64.
>>>> This options is enabled by default, and triggers a link failure:
>>>>
>>>>    Undefined symbols for architecture arm64:
>>>>      "___aarch64_cas1_acq_rel", referenced from:
>>>>          _qmp_migrate_recover in migration_migration.c.o
>>>>          _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
>>>>          _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
>>>>          _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
>>>>          _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
>>>>          _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
>>>>          _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
>>>>          ...
>>>>      "___aarch64_ldadd4_acq_rel", referenced from:
>>>>          _multifd_recv_new_channel in migration_multifd.c.o
>>>>          _monitor_event in monitor_hmp.c.o
>>>>          _handle_hmp_command in monitor_hmp.c.o
>>>>          _colo_compare_finalize in net_colo-compare.c.o
>>>>          _flatview_unref in softmmu_memory.c.o
>>>>          _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
>>>>          _tcg_register_thread in tcg_tcg.c.o
>>>>          ...
>>>>      "___aarch64_swp4_acq", referenced from:
>>>>          _qemu_spin_lock in softmmu_cpu-timers.c.o
>>>>          _cpu_get_ticks in softmmu_cpu-timers.c.o
>>>>          _qemu_spin_lock in softmmu_icount.c.o
>>>>          _cpu_exec in accel_tcg_cpu-exec.c.o
>>>>          _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
>>>>          _page_entry_lock in accel_tcg_translate-all.c.o
>>>>          _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
>>>>          ...
>>>>
>>>> QEMU implements its own atomic operations using C11 builtin helpers.
>>>> Disable the GCC out-of-line atomic ops.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>>> ---
>>>> Cc: Stefan Hajnoczi<stefanha@redhat.com>
>>>> Cc: Paolo Bonzini<pbonzini@redhat.com>
>>>>
>>>> Clearly out of my understanding, but at least it links and the qtests
>>>> pass.
>>>> ---
>>>>   configure | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>
>>> These should have been supplied by libgcc.a, which we're supposed to 
>>> be linking against. Something is wrong with your installation.
>>
>> I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
>> compile these languages, but compiled C files using GCC. At the end the
>> Clang linker is used (the default c++ symlink).
>>
>> Could there be a mismatch between Clang (-mno-outline-atomics) and GCC
>> (-moutline-atomics)?
> 
> I think you have to instruct Clang to use libgcc instead of compiler-rt 
> and link the objects with GCC. Here is the documentation of Clang about 
> the runtime I could find:
> https://clang.llvm.org/docs/Toolchain.html#libgcc-s-gnu

Thanks for the pointer. And the next section is
https://clang.llvm.org/docs/Toolchain.html#atomics-library :)

   Clang does not currently automatically link against libatomic when
    using libgcc_s. You may need to manually add -latomic to support
   this configuration when using non-native atomic operations (if you
   see link errors referring to __atomic_* functions).

I'll try that.

