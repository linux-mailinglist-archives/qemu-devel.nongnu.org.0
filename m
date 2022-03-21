Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6F4E3292
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:08:48 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQCl-0003Il-JQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:08:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ8v-0007Y4-5N
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:04:49 -0400
Received: from [2a00:1450:4864:20::434] (port=37620
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ8t-0003tp-E5
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:04:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id u16so21532388wru.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dJwuoqSVEB2DET34FekHP1Y0/dq7GW1cyXnfL9jeAjM=;
 b=OxCgzrYL9/QKrvErfNeIL8LvQakslJxU4MrQQB/KjsU1lgKl/jmHNhGr5D6RToQ9jB
 2qDqoZwJsOOa9xTeR/lsCbOczPAZAWksRz5J7Kpf/hP9muF9GjS+afkTsjngJvJxmaDM
 m51wZ7X7ybJOaBdItpLihJG4NfNy5MaiOhEjGQETEmJg7NXcmJ+f3tXqNiUlj8soBec2
 eC1hsXgl9X+Dg51VU/Ck6QyfmN+c2GhbB8C4ZbtCoslmhlyLVH6oKrYYzsdXmj8EyTG0
 axS9klrzmriFNIoO7bxkrB5S9+6zr8PnLFzKVek0hzxUAWkjA4lWZR7EYJXmfpnuGft8
 eIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dJwuoqSVEB2DET34FekHP1Y0/dq7GW1cyXnfL9jeAjM=;
 b=R4wRspUTRIS+NnttpcEfL99myhUDEDLCzkyBWJBN4e4ugn6PpU5ckSQim7ZzuJwvQk
 u1GJ9tXMLDjOfH2B+z0bjgwjIbcrZAiA85ETcOil4yITtoGcQ1I7Gp88ltvilhVmbXLh
 dwmorPPv7R/NGOH/PckJTbIInCZz6KyZ4MXIwT/5xLgjJYFgy3/9lC/UpcY/NlkYXIYs
 t+nER73DUP7JSzrc9Yx65M9MPuEGbjsyop26QHiX0cpMeVFfgSFl/BgpYYGt1f9zZQP3
 jeETDNcBLEba2JhyjEyDkBaMo152TSu9UMOm7FcVG1EUbAm9A4H9HwEMZ636JKA/rG6y
 /64w==
X-Gm-Message-State: AOAM530ZsyawB/iHK8dyA6JyB5yOdg3L7DJTfqQoZJ2FFRJ2w3I1z96i
 QAJa6U0BNFtNb6mcWobP2SM=
X-Google-Smtp-Source: ABdhPJxCsLXke0WF18n3davIb1IRdFafeFiKnLYkawfhc0xGzCFQ/XMzOinqAakF0fNErQgsSYwjvA==
X-Received: by 2002:a05:6000:120a:b0:203:d837:be76 with SMTP id
 e10-20020a056000120a00b00203d837be76mr19442812wrx.511.1647900284309; 
 Mon, 21 Mar 2022 15:04:44 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b00203efad1d89sm16259275wrs.9.2022.03.21.15.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:04:43 -0700 (PDT)
Message-ID: <1938c323-1737-479d-2e3b-baa6c746da4a@gmail.com>
Date: Mon, 21 Mar 2022 23:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] i386/cpu: Free env->xsave_buf in KVM and HVF
 destory_vcpu_thread routines
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-6-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321141409.3112932-6-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
> Create KVM and HVF specific destory_vcpu_thread() routines to free

Typo "destroy"

> env->xsave_buf.
> 
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
> ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
> ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
> ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
> ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
> ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
> ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
> ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
> ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
> ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
> ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
> ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   accel/hvf/hvf-accel-ops.c | 11 ++++++++++-
>   accel/kvm/kvm-accel-ops.c | 11 ++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

