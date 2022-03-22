Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE54E3F93
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:31:14 +0100 (CET)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWebQ-0007N2-Nx
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:31:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWeZm-0005cF-PN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:29:30 -0400
Received: from [2a00:1450:4864:20::32c] (port=43566
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWeZl-0004Ej-3Z
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:29:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so891091wme.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fG9HbzCKw1GM4kFdIeLZU3ef1PIf/GnDdByrJY9IDtI=;
 b=l5cRMLA71wXL2GFyxJNtw3l5sIjkmgSK8OimI6mBXsbfcJww6pyRvb2QBR0n8E9tu5
 QsM6iL/G6rJUuUz1eY3+e6+BMXhxuta/cTCRhO2+FuEOwak0t+uEssoVwrv3KGNH3Lgj
 9xpy0SvHttXboqsRjfC3KcgDlXncw9PgcwCz7QkEKfCSjrEF6HOSCvZ87w110XEd+hHB
 dnHoUwGPb4xuULdAEeX/l0oGnsMmW9oZvZst/2PlJ6p9PQyp+B+K7jBjDW5Vb6Zm/tQX
 F9Ko40p1EuaBDK1Vag73lEO2JU5K85ujGCjUf/uvO4LQv4tXBglhJGhbEaM3Jyeswtz0
 0xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fG9HbzCKw1GM4kFdIeLZU3ef1PIf/GnDdByrJY9IDtI=;
 b=WvsvMhLlZHtBOBErvzrSOmZgr86vvLtn1igv+Tp6Cf7UwxYkU0cqcbANpIj96XbIA8
 QiHUkN0AGA3HQeKmamDApmsYou9qTRyRYRw4Bo+63TG8v3I9CPwA6GQ0Rc7y4k7WKt0X
 EVuscSTLDvXhMgwXHNx3BscSSGsHpcNbdvTOqsj4qTG/YLf/J6KHCjT/BHWIMTkaOwgi
 UCjgtfex2ntVSFwjmMBdWJ2bj7JK1B/c0F2MzANS+0PLjiWR7HfmDfLk1KPpoS70TqJw
 7G7uJkDp4ZYhO7i3Ot/yYP+7nfg72SDjOY1FLplAEDc6L2LgMqGcQ26Jo0dlKQoudQz/
 VvOw==
X-Gm-Message-State: AOAM532bcYzs2MQiphnDSPxy0DzvTG4tA+aAY1bD2gE8ZC64uNAV4epL
 hKWqaYSN4JjCiXrl1/XHLpszGxiV+E8=
X-Google-Smtp-Source: ABdhPJwMQA3KXffkE8yeaemCOJpEmz59thlUG4Zt55AGFcq7ZvPvgziVKGuj+23qtyYOAkANdkQZZA==
X-Received: by 2002:a05:6000:1687:b0:205:80b7:afca with SMTP id
 y7-20020a056000168700b0020580b7afcamr525192wrd.665.1647955767166; 
 Tue, 22 Mar 2022 06:29:27 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm15548581wrv.79.2022.03.22.06.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 06:29:26 -0700 (PDT)
Message-ID: <e4603209-651f-a0a0-d7be-255e0ddf2db7@gmail.com>
Date: Tue, 22 Mar 2022 14:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v4] target/i386/kvm: Free xsave_buf when
 destroying vCPU
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 13:05, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Fix vCPU hot-unplug related leak reported by Valgrind:
> 
>    ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
>    ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>    ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>    ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>    ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>    ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>    ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>    ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>    ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>    ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>    ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
>    ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
> 
> Reported-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based on a series from Mark:
> https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@oracle.com/
> 
> RFC because currently no time to test

Mark, do you mind testing this patch?

