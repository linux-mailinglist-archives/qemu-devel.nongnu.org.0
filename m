Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7A6B7C37
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkIf-0000LH-CN; Mon, 13 Mar 2023 11:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbkId-0000GS-0s
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:41:23 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbkIb-0005Z9-1x
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:41:22 -0400
Received: by mail-wr1-x431.google.com with SMTP id r18so11762971wrx.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678722079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YN8Be5m3vpBNqZBZE5qAACYIpYonOHt7xx457HgIQik=;
 b=xZG920FyJ6KOyeIreI2VebMsUx6HExAb3FhMav/y9GNd8l2R1vLnbUt1K7yVjb+jQI
 U2O9NM2Qec61u6AYAXldBBUOsN7mfePUbWtgz3DLs8HZAaHmm4XuvfMNc47G6QxQidGB
 5JN6u050dPCVUR2OM5OkY83UVnkDRzoCNm84PUuiJ5PHqe1npPSBlec0qW4y4KnQNTVg
 JmAP1EJeNZdi3TBh00SmUarqZToWTkkCEkiRwdja0YdKzQCn682faVri+w6unHUKUoUx
 NYjf1nNgqfI0RRGpg8fLyWdL7tR02nJvIzFz6Abmat9aZxZqEB5U7H7QwHRObUVHIUSy
 pLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678722079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YN8Be5m3vpBNqZBZE5qAACYIpYonOHt7xx457HgIQik=;
 b=kav6UPzSyhFzGxfxog4fh+rb9mijG/r0l/pyEK3zmrNb42VQVkTGj5NlZrzdr81WO/
 kdtXZ3bus8QZRbbMhsaIlMCcwVk1FCdcyWnepQZafAzwNTBzKDOorqdTeGcwj4qV0hDO
 84rIBY+PkgNW5aSYI6It8Njeq+CeEdnyi5kPY6fKXiKPC2vzRCmq1PXe0CheuLcbK/WO
 L99I/2SU2H8/0c0KLYXopuyQn4A8u86DgLABHA0AA854pNJabPJkzA9T9eyX+EhFlpnO
 qD3gpM/YGJ9WEoJf7mSzUSQVxmWR6mjVuBUQVdGeyzAz0KzmfR5vurlrSp0/dnKkNlcx
 nN7w==
X-Gm-Message-State: AO0yUKWX2fOmnwB4XZrC7/pfepmdqH+OmwDqY5ml2QCDeh4A4i77anJv
 tThT4WLiyElIt+GWf21B0mvztQ==
X-Google-Smtp-Source: AK7set8Hkw/WylfxOl4cYO/RC3BJkVwD+yBN0g/hfcJwio1DMVObQXqlLkM320HsAlbcdZ0m1YXsOw==
X-Received: by 2002:adf:fd02:0:b0:2ce:a651:d3f6 with SMTP id
 e2-20020adffd02000000b002cea651d3f6mr5072068wrr.39.1678722079339; 
 Mon, 13 Mar 2023 08:41:19 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020adfdfca000000b002cea392f000sm7416230wrn.69.2023.03.13.08.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 08:41:18 -0700 (PDT)
Message-ID: <38b1989e-248d-88fb-2551-13c895999841@linaro.org>
Date: Mon, 13 Mar 2023 16:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
 <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/3/23 15:52, Alexander Bulekov wrote:
> On 230313 1502, Thomas Huth wrote:
>> On 13/03/2023 09.24, Alexander Bulekov wrote:
>>> v6 -> v7:
>>>       - Fix bad qemu_bh_new_guarded calls found by Thomas (Patch 4)
>>>       - Add an MR-specific flag to disable reentrancy (Patch 5)
>>>       - Disable reentrancy checks for lsi53c895a's RAM-like MR (Patch 6)
>>>       Patches 5 and 6 need review. I left the review-tags for Patch 4,
>>>       however a few of the qemu_bh_new_guarded calls have changed.
>>
>>   Hi Alexander,
>>
>> there seems to be another issue with one of the avocado tests:
>>
>>   make -j8 qemu-system-aarch64
>>   make check-venv
>>   ./tests/venv/bin/avocado run \
>>     tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
>>
>> ... works fine for me with the master branch, but it fails
>> for me after applying your patch series.
>> Can you reproduce that failure?
> 
> #0  __GI_exit (status=0x1) at ./stdlib/exit.c:143
> #1  0x0000555555f05819 in access_with_adjusted_size (addr=0x0, addr@entry=0x7ffff3b609d0, value=0x7ffff3b609d0, size=size@entry=0x4, access_size_min=0x1, access_size_max=0x4, access_fn=0x555555f0b4b0 <memory_region_read_accessor>, mr=0x7
> #2  0x0000555555f05380 in memory_region_dispatch_read1 (mr=0x7ffff3e34990, addr=0x1, pval=<optimized out>, size=0x4, attrs=...) at ../softmmu/memory.c:1442
> #3  memory_region_dispatch_read (mr=<optimized out>, mr@entry=0x7ffff3e34990, addr=0x1, pval=<optimized out>, pval@entry=0x7ffff3b609d0, op=<optimized out>, attrs=..., attrs@entry=...) at ../softmmu/memory.c:1476
> #4  0x0000555555f1278f in address_space_ldl_internal (as=<optimized out>, addr=<optimized out>, attrs=..., result=0x0, endian=DEVICE_LITTLE_ENDIAN) at ../memory_ldst.c.inc:41
> #5  0x00005555559ebb5d in ldl_le_phys (as=0x7ffff3e35258, addr=0x80) at /home/alxndr/Development/qemu-demo/qemu/include/exec/memory_ldst_phys.h.inc:79
> #6  bcm2835_mbox_update (s=0x7ffff3e34f20) at ../hw/misc/bcm2835_mbox.c:109
> #7  0x00005555559ecd5d in bcm2835_property_write (opaque=0x7ffff3e34600, offset=<optimized out>, value=<optimized out>, size=<optimized out>) at ../hw/misc/bcm2835_property.c:349
> #8  0x0000555555f05903 in memory_region_write_accessor (mr=0x7ffff3e34990, addr=0x0, value=<optimized out>, size=0x4, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:493
> #9  0x0000555555f0576b in access_with_adjusted_size (addr=addr@entry=0x0, value=0x7ffff3b60c38, value@entry=0x7ffff3b60c28, size=size@entry=0x4, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x555555f05820 <
> attrs=...) at ../softmmu/memory.c:570
> #10 0x0000555555f055c6 in memory_region_dispatch_write (mr=<optimized out>, mr@entry=0x7ffff3e34990, addr=0x0, data=<optimized out>, data@entry=0x2f2228, op=<optimized out>, attrs=..., attrs@entry=...) at ../softmmu/memory.c:1532
> #11 0x0000555555f132ec in address_space_stl_internal (as=<optimized out>, addr=<optimized out>, val=0x2f2228, attrs=..., result=0x0, endian=DEVICE_LITTLE_ENDIAN) at ../memory_ldst.c.inc:319
> #12 0x00005555559eb9a4 in stl_le_phys (as=<optimized out>, addr=0x80, val=0x2f2228) at /home/alxndr/Development/qemu-demo/qemu/include/exec/memory_ldst_phys.h.inc:121
> #13 bcm2835_mbox_write (opaque=0x7ffff3e34f20, offset=<optimized out>, value=0x2f2228, size=<optimized out>) at ../hw/misc/bcm2835_mbox.c:227
> #14 0x0000555555f05903 in memory_region_write_accessor (mr=0x7ffff3e352b0, addr=0xa0, value=<optimized out>, size=0x4, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:493
> #15 0x0000555555f0576b in access_with_adjusted_size (addr=addr@entry=0xa0, value=0x7ffff3b60e48, value@entry=0x7ffff3b60e38, size=size@entry=0x4, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x555555f05820
>   attrs=...) at ../softmmu/memory.c:570
> #16 0x0000555555f055c6 in memory_region_dispatch_write (mr=<optimized out>, mr@entry=0x2, addr=addr@entry=0xa0, data=<optimized out>, data@entry=0x2f2228, op=<optimized out>, op@entry=MO_32, attrs=...) at ../softmmu/memory.c:1532
> #17 0x0000555555f9b3ae in io_writex (env=0x7ffff3dd60e0, full=0x55555790c710, mmu_idx=0x7, val=0x4, val@entry=0x2f2228, addr=0x3f00b8a0, retaddr=retaddr@entry=0x7fffac01f9dd, op=MO_32) at ../accel/tcg/cputlb.c:1430
> #18 0x0000555555f90062 in store_helper (env=<optimized out>, addr=<optimized out>, val=0x2f2228, oi=<optimized out>, retaddr=0x7ffff3b609d0, op=MO_32) at ../accel/tcg/cputlb.c:2454
> #19 full_le_stl_mmu (env=<optimized out>, addr=<optimized out>, val=0x2f2228, oi=<optimized out>, retaddr=0x7ffff3b609d0) at ../accel/tcg/cputlb.c:2542
> #20 0x00007fffac01f9dd in code_gen_buffer ()
> #21 0x0000555555f7367e in cpu_tb_exec (cpu=cpu@entry=0x7ffff3dd4210, itb=itb@entry=0x7fffac01f8c0 <code_gen_buffer+129171>, tb_exit=tb_exit@entry=0x7ffff3b6148c) at ../accel/tcg/cpu-exec.c:460
> #22 0x0000555555f744f9 in cpu_loop_exec_tb (cpu=0x7ffff3dd4210, tb=<optimized out>, pc=<optimized out>, tb_exit=0x7ffff3b6148c, last_tb=<optimized out>) at ../accel/tcg/cpu-exec.c:894
> #23 cpu_exec_loop (cpu=cpu@entry=0x7ffff3dd4210, sc=sc@entry=0x7ffff3b61510) at ../accel/tcg/cpu-exec.c:1005
> #24 0x0000555555f73c27 in cpu_exec_setjmp (cpu=cpu@entry=0x7ffff3dd4210, sc=sc@entry=0x7ffff3b61510) at ../accel/tcg/cpu-exec.c:1037
> #25 0x0000555555f73aee in cpu_exec (cpu=cpu@entry=0x7ffff3dd4210) at ../accel/tcg/cpu-exec.c:1063
> #26 0x0000555555f9da4f in tcg_cpus_exec (cpu=cpu@entry=0x7ffff3dd4210) at ../accel/tcg/tcg-accel-ops.c:81
> #27 0x0000555555f9e019 in mttcg_cpu_thread_fn (arg=arg@entry=0x7ffff3dd4210) at ../accel/tcg/tcg-accel-ops-mttcg.c:95
> #28 0x000055555611d0c5 in qemu_thread_start (args=0x555557923bf0) at ../util/qemu-thread-posix.c:541
> #29 0x00007ffff6960fd4 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
> #30 0x00007ffff69e166c in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> Some sort of relationship between bcm2835_property and
> bcm2835_mbox
> 
> bcm2835_property calls directly into bcm2835_mbox which reads from
> bcm2835_property..

These models emulate (synchronously within vCPU) a vDSP firmware:
another core accessing the address space asynchronously.

> Guess bcm2835_property s->iomem needs to be marked as reentrancy-safe
> as-well.

Right.

Now I wonder again if this is a good time to merge this change set.
Hopefully users will test the RC before the final release.

