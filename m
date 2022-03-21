Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66674E3297
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:13:32 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQHM-0004D1-0n
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQCf-0004ev-1G
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:41 -0400
Received: from [2a00:1450:4864:20::32c] (port=41943
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQCd-0004je-KR
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so344819wme.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sR6AW07KZKtk/94ITy1swC+H8ulK6BnCAbOp/nlAVHg=;
 b=NWDnssfwm11FusHHJ+3rI/kNLsHy1ZWOZCJFgy1XpwCRZjrb7itlgOQuEdoVsLzTJL
 amQTxAQmDqxctJaKcK0ZXymC0DnrO+l+7tr5RREpV5fxsSumetu+20Ta7CDNjHFWE/ux
 H7XGsSsQkg7btnZ7JYkMXCsdGYWOo8oqAyWlyfhIbb4SRkcp02AXSBAwymdlbvWid9D+
 mIeJNSU1JRZLM37+tYNFR3CTKcbARECV6LTWiYf5uKYiVtnIOUsSBcNyfV1EoVoajEQ5
 3NHl3VtlUDIcMOmd6Vh46HHlQECYScVekvv2QZBYvu2+3CrrBacjADonjyIkUvOx/+K7
 nxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sR6AW07KZKtk/94ITy1swC+H8ulK6BnCAbOp/nlAVHg=;
 b=d3c47BOO18gExY+t4fGyUskqGHLqcKqpFbHw/+uUNZTCh1kw/gVLcg5AbSBAHAOapv
 8zBBUN0gnrIcJWvIqtvnAXcBP3dqvmXQ4Fj6c+WoqWzZmCQ7mgYwh1BlW6qlLaDtO8P1
 w9JY5DmMSMPp95eGBjwFxZggSw9Tsd1351xDxN+ghVKwW9nOCEI2raFpMbGJB8t65ZSC
 pfyJ3Q864gaa6OfEZLwksPnsQLCWNOU24XHtqKS33ZMHO/UxE3iWjX6aCzyOI/rCdqeU
 mrlwigJ4qVqn3I1pftuV11Ao/nf0AHNUD3XlT7RJ49YTap4xhQeooNKTQpnNpywW1svH
 RKEw==
X-Gm-Message-State: AOAM533lh/78+OL+3HYsdtRapMIlo6EIsl3bGM94Ot0dA5sCBbzb2n14
 GW2jCYRLmJA/2hq323nYyRo=
X-Google-Smtp-Source: ABdhPJwrTt2ivH5dbfiqzL5ZvCqQjRYb3RLAZ4AT9e8ah8KEz30WmuVsm98/V2tVu0kHgAcFvalA6g==
X-Received: by 2002:a05:600c:2188:b0:38c:9a21:9c95 with SMTP id
 e8-20020a05600c218800b0038c9a219c95mr950498wme.87.1647900518412; 
 Mon, 21 Mar 2022 15:08:38 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm12195563wry.64.2022.03.21.15.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:08:38 -0700 (PDT)
Message-ID: <38ac951e-011d-547b-21cf-347a2a06a2a6@gmail.com>
Date: Mon, 21 Mar 2022 23:08:37 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <1938c323-1737-479d-2e3b-baa6c746da4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

On 21/3/22 23:04, Philippe Mathieu-Daudé wrote:
> On 21/3/22 15:14, Mark Kanda wrote:
>> Create KVM and HVF specific destory_vcpu_thread() routines to free
> 
> Typo "destroy"
> 
>> env->xsave_buf.
>>
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 
>> 8,440 of 8,549
>> ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>> ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>> ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>> ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>> ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>> ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>> ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>> ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>> ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>> ==132362==    by 0x7EB2159: start_thread (in 
>> /usr/lib64/libpthread-2.28.so)
>> ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   accel/hvf/hvf-accel-ops.c | 11 ++++++++++-
>>   accel/kvm/kvm-accel-ops.c | 11 ++++++++++-
>>   2 files changed, 20 insertions(+), 2 deletions(-)
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I meant:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


