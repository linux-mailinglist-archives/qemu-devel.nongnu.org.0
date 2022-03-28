Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C14EA293
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:54:39 +0200 (CEST)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxJu-0006sb-2a
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:54:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYxI2-0005wv-MG; Mon, 28 Mar 2022 17:52:42 -0400
Received: from [2001:4860:4864:20::2c] (port=37470
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYxI0-0000ny-WF; Mon, 28 Mar 2022 17:52:42 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-dee0378ce7so6357709fac.4; 
 Mon, 28 Mar 2022 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ag3g7NNsvxPGOkxkFKNj0ixxepcNDbKYQdvZegf/bKE=;
 b=YbXjgVKzprcTYOxLr5u5vZmUEGShVBePIqqIIAVuSUve7QkY3mAb5oPgpMd5cG4H4b
 1ZZaHT3SzFxR1cdIhmZNB/5k5J4dvednn02h0l0KVunF1pT+YUOc6bZrSW6JRBsc6sa+
 f+iu9tNDiXlI5XixxNc/nu9IQKUXq649hWGwAMn7e6y1qe04bsHtzPz5+On8cYVIEsun
 5VTee3X8JwfT1jNqN0h4lVYiDLlnXWWoLjn20Lg6KrvNlL8oFAurcqHBeji1HsuXL+GE
 zlrCGrNH1HxunciylgrRWllXzAF/iCeeY+jCgdBI90ehWizcW0na6BINDXJ1LzuDrL5X
 h6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ag3g7NNsvxPGOkxkFKNj0ixxepcNDbKYQdvZegf/bKE=;
 b=AZZtewQ13nUj6xGKt8Snvt57j/Wp8JzrOc/1tt0cGpoKDGADTehljCqTZfEl6nKpif
 AVX/aIGDtGB/vRt6BA1qbEhGkFHkB9nYHaXicYceRp5RgutSD+P8YOES1t2gGysruJVw
 0ggtdPRUTT0aEiRkDNKQqReIos2RnsyQUwDx8fTg1AZtc66YaZPEYI/meZ1eZHkYbUr2
 LDmwQuyJeSRTvrzp4DulvOxfLU9OnYW0n2l//QuYKTszLBdoitSCo8pTRNZeh5++zbTs
 PgZLvQE6ZVu/sUN09tI6d+eVhC7Go9hpPB6FZkp7kt1n/5V80HB6oSQhNbYnw462+Trp
 KLuw==
X-Gm-Message-State: AOAM533O02O4ADn+Er301QCM6OhTvyAHJL+4Zxyoq5TEKcsBpf4TNejz
 TfK3JWe0SQ0T7XxceXTdPQE=
X-Google-Smtp-Source: ABdhPJykkq9VmnjBhXbwEbJslfVKVsHgwfRAZvvOBsF+1Oke7nAXBARGbO7Go7tklDZXYw4ZRlU+9A==
X-Received: by 2002:a05:6870:f6a8:b0:da:cf54:dc14 with SMTP id
 el40-20020a056870f6a800b000dacf54dc14mr606549oab.43.1648504358965; 
 Mon, 28 Mar 2022 14:52:38 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 184-20020a4a03c1000000b003240492fc15sm7632624ooi.36.2022.03.28.14.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 14:52:38 -0700 (PDT)
Message-ID: <581bf96b-9e45-fa46-1f5b-3e59455234b8@gmail.com>
Date: Mon, 28 Mar 2022 18:52:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/ppc: Improve KVM hypercall trace
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325223316.276494-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220325223316.276494-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/22 19:33, Fabiano Rosas wrote:
> Before:
> 
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
> 
> After:
> 
>    kvm_handle_papr_hcall 0x3a8
>    kvm_handle_papr_hcall 0x3ac
>    kvm_handle_papr_hcall 0x108
>    kvm_handle_papr_hcall 0x104
>    kvm_handle_papr_hcall 0x104
>    kvm_handle_papr_hcall 0x108
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


I believe this is benign enough to be taken in the next PR and it will help
in the debugging right away.


Daniel

>   target/ppc/kvm.c        | 2 +-
>   target/ppc/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..a490e886ea 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1681,7 +1681,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>           break;
>   #if defined(TARGET_PPC64)
>       case KVM_EXIT_PAPR_HCALL:
> -        trace_kvm_handle_papr_hcall();
> +        trace_kvm_handle_papr_hcall(run->papr_hcall.nr);
>           run->papr_hcall.ret = spapr_hypercall(cpu,
>                                                 run->papr_hcall.nr,
>                                                 run->papr_hcall.args);
> diff --git a/target/ppc/trace-events b/target/ppc/trace-events
> index 53b107f56e..a79f1b4370 100644
> --- a/target/ppc/trace-events
> +++ b/target/ppc/trace-events
> @@ -23,7 +23,7 @@ kvm_failed_get_vpa(void) "Warning: Unable to get VPA information from KVM"
>   kvm_handle_dcr_write(void) "handle dcr write"
>   kvm_handle_dcr_read(void) "handle dcr read"
>   kvm_handle_halt(void) "handle halt"
> -kvm_handle_papr_hcall(void) "handle PAPR hypercall"
> +kvm_handle_papr_hcall(uint64_t hcall) "0x%" PRIx64
>   kvm_handle_epr(void) "handle epr"
>   kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
>   kvm_handle_debug_exception(void) "handle debug exception"

