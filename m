Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64E4E3E71
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:25:08 +0100 (CET)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdZT-0000mv-DG
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:25:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWdCw-0004Dn-VE
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:01:51 -0400
Received: from [2a00:1450:4864:20::336] (port=43693
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWdCv-0007Pi-C3
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:01:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so605616wme.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vzP2CaOU96kvneWGF0z6Axk2DEnrR6I2l4RXdp78CfE=;
 b=jO35ZFCwUGoxmMT6xUx/sA2bxxo+sjox3FLu8mUs6BhtDfv9UqZ70DrqcJkzpf64IB
 /h3fb+wlou+zeZZy2vTuBVbE73Dw60tIPHesLZRKajg3A86REPlxo6XxLs0dvn7yKQFW
 NN1EbmuLEUjpdeKEFFHyp/2HgKDccD1TIQUOZPEgJNjKGTRjJ5/0CHQuMlvPgZOi6HEq
 I8+gWXd0uFE06/RMlCx9d047nrnbPjcVWmYxT5av5ychgybqA8SdwTYslLjbxkpRI/so
 SE1GxRBrrBbyiNENmqpuRDfyApISna7eI9VpVnHvClA7teHVeW1WdSc1nQ1CgN7+Jrgy
 4hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vzP2CaOU96kvneWGF0z6Axk2DEnrR6I2l4RXdp78CfE=;
 b=19f0O0/i1YIQKo5BAks5NFYxXoUmmyWSKmKgIe+WHK3eoc02wKaO8dw/QGSyD2Oq0H
 4uEDyTG8d9KK/Fod//Y5edWkr5WW1ZtmL8straNfBv2xdWy9ZsUTSMETTDo8V553CFgI
 yR80HCLZuuMk0MGa+i+5WmFfHI4ib7Agjm8grAlQlUgk050mPEYQlFAsukiTc99DqoJB
 imRDyU0p7tOP/IVlhrh4CrmFb8LOtrpsJgQIKOJ5PYLQWaKtQy3Lh3nQ623MZyfPepnA
 Skhska9437qNCxK2ylNsALnvn4ohvgdCZpR81RjePscvLz72it5qfcQyrHIvbZ8yCXWU
 iurA==
X-Gm-Message-State: AOAM531s2x4MQZuPE/xXk78SMJ6Dd2kIXxjvlZ5mn+HUKFfL/+c6DdRG
 Q21MKUQxFFLCjsVI8YG7yj4=
X-Google-Smtp-Source: ABdhPJzYrzBB/ILhw6HGd4496NrmsOAL1+HpKzU0Q4iViszHKprAGWh0bK/Xr2v9qOQw6ah9W4o/xw==
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id
 q10-20020a1ce90a000000b00381504eb57dmr3472245wmc.177.1647950505324; 
 Tue, 22 Mar 2022 05:01:45 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00203f94379a4sm11048704wrd.67.2022.03.22.05.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 05:01:44 -0700 (PDT)
Message-ID: <554e213e-ab93-cd83-c938-382007c8f80a@gmail.com>
Date: Tue, 22 Mar 2022 13:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] i386/cpu: Free env->xsave_buf in KVM and HVF
 destory_vcpu_thread routines
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-6-mark.kanda@oracle.com>
 <1938c323-1737-479d-2e3b-baa6c746da4a@gmail.com>
 <38ac951e-011d-547b-21cf-347a2a06a2a6@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <38ac951e-011d-547b-21cf-347a2a06a2a6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

On 21/3/22 23:08, Philippe Mathieu-Daudé wrote:
> On 21/3/22 23:04, Philippe Mathieu-Daudé wrote:
>> On 21/3/22 15:14, Mark Kanda wrote:
>>> Create KVM and HVF specific destory_vcpu_thread() routines to free
>>
>> Typo "destroy"
>>
>>> env->xsave_buf.
>>>
>>> vCPU hotunplug related leak reported by Valgrind:
>>>
>>> ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 
>>> 8,440 of 8,549
>>> ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>>> ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>>> ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>>> ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>>> ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>>> ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>>> ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>>> ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>>> ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>>> ==132362==    by 0x7EB2159: start_thread (in 
>>> /usr/lib64/libpthread-2.28.so)
>>> ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
>>>
>>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>>> ---
>>>   accel/hvf/hvf-accel-ops.c | 11 ++++++++++-
>>>   accel/kvm/kvm-accel-ops.c | 11 ++++++++++-
>>>   2 files changed, 20 insertions(+), 2 deletions(-)
>>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I meant:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Withdrawing these tags with HVF.

First xsave_buf is only allocated by KVM, second accel/ directory is
meant to be target agnostic, so x86-specific code there is not right.


