Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF94C0009
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:19:25 +0100 (CET)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYov-0007yE-26
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMYlM-0005Mt-NR
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:15:44 -0500
Received: from [2a00:1450:4864:20::32c] (port=52848
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMYlK-0006pR-Ut
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:15:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w13so11533989wmi.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oJ2YD2NRxjMG5gE2Rf4NThtMzw1kf/D06xwOakry2io=;
 b=JugPc3p2tFWZDXyJfKdkUJIMcVFB57Yqr4jSQhD8Xisb8J7kFO3N47CJPKRHGfZxqR
 LRqQVnEK9GoNrQ1ra0ypPReRNRdwdqgMpMNFEfmVj31IC8aZBB3PyxlxA7xI+5liVHEY
 dmiyj7vkKcH0uVURZyZw76r4e7GwOig9Pje7OOeXiQsaebXC+Pf78PveyqSN/I4j0SYv
 /EPGzPAECoorKiz4J4PQCUvk8zUzHzMHZzrWDTJtxMbRgd3YeOFfwej0UwZ9a36xuJte
 1y8cNp9Lbo9IPnH0RhmKAywBVJVMaX1BI3hwifcaaoDYtTs8WZ2/irhkHgMXIzGwk+Wh
 sAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oJ2YD2NRxjMG5gE2Rf4NThtMzw1kf/D06xwOakry2io=;
 b=az+59+g3OvalPPB7AMHFjw0Qbo2bcfcc1f+0yvSBMTdpDxaQSRmVQWIzO0yxUfG6OS
 yyigHfgDCvKA7rDWRzNR2S7g0DzHajeyEi4lkoAposm5jTBdoEuremIAlvKxPZohK9o+
 7JKyoq1+N7/vITwnob0qFY6qPHWHdFg9qhvL8wuQHFLB5svjhAvu9PK8I2AaNhlMpp66
 bHzcm4XWCtKLmV6021NtEV8jGEZ6bbAT54L7xKyR1uoACwheZHIIWv73Z5wEApdmN9Om
 yf5FmfS2F987c/YwygxIA4wjpeiNnEhCYfXbVKdjSQFDdu5NQjOmJ2b45REg792v8Mht
 vAvg==
X-Gm-Message-State: AOAM530vk6bdsd7CRXchr59MsjrJ6+BfbVhKfxdBIuGS/WSR1NdhcTVo
 wIVgCf6CMhdGFLCEfWUtV74=
X-Google-Smtp-Source: ABdhPJxo8O2oUZuNGJb3f2L1ZYwiFIoeFWouKJjpmwgFAJHyZrv6PIeMgfWzT2aFHS4la0sRQTPYfw==
X-Received: by 2002:a1c:6a18:0:b0:380:dec5:7f05 with SMTP id
 f24-20020a1c6a18000000b00380dec57f05mr2513288wmc.129.1645550140876; 
 Tue, 22 Feb 2022 09:15:40 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u25sm2802973wmm.15.2022.02.22.09.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 09:15:40 -0800 (PST)
Message-ID: <c35a9dd9-a65b-8690-669b-db94e8629c62@gmail.com>
Date: Tue, 22 Feb 2022 18:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 1/4] softmmu/cpus: Free cpu->thread in cpu_remove_sync()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220126142946.667782-1-mark.kanda@oracle.com>
 <20220126142946.667782-2-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220126142946.667782-2-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/1/22 15:29, Mark Kanda wrote:
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==377357== 8 bytes in 1 blocks are definitely lost in loss record 1,029 of 8,471
> ==377357==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==377357==    by 0x65C14CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==377357==    by 0x8B5AC8: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
> ==377357==    by 0x7817AF: qemu_init_vcpu (cpus.c:634)
> ==377357==    by 0x7185A3: x86_cpu_realizefn (cpu.c:6447)
> ==377357==    by 0x8E46B7: device_set_realized (qdev.c:531)
> ==377357==    by 0x8EE36F: property_set_bool (object.c:2268)
> ==377357==    by 0x8EC3C5: object_property_set (object.c:1403)
> ==377357==    by 0x8F075D: object_property_set_qobject (qom-qobject.c:28)
> ==377357==    by 0x8EC72C: object_property_set_bool (object.c:1472)
> ==377357==    by 0x8E3F7F: qdev_realize (qdev.c:333)
> ==377357==    by 0x43F3A2: qdev_device_add_from_qdict (qdev-monitor.c:711)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   softmmu/cpus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 23bca46b07..1d8380d4aa 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -603,6 +603,7 @@ void cpu_remove_sync(CPUState *cpu)
>       qemu_mutex_unlock_iothread();
>       qemu_thread_join(cpu->thread);
>       qemu_mutex_lock_iothread();
> +    g_free(cpu->thread);

Shouldn't we free that in a dedicated AccelOpsClass::destroy_vcpu_thread
handler instead? (Similarly to free CPUState::halt_cond, next patch).

>   }


