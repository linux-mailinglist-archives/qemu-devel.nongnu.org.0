Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEEB50903E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:17:58 +0200 (CEST)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFpt-0000vS-5t
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFl8-0001nV-5o; Wed, 20 Apr 2022 15:13:04 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFl3-0002Xr-Rf; Wed, 20 Apr 2022 15:12:59 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e2afb80550so3019258fac.1; 
 Wed, 20 Apr 2022 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YVFSFzcUC5z68KuVIhNjBPz2ycj/E3mWghj+QM1REEo=;
 b=NFgSmG9zVT12kNJF9egNmbPr3OFeATS706Q3Kdd/UyJV6mJcCQDNJG7vG1Wr7hyKdk
 PHXWdJRD55Mo3imPhL33Ea9SNB1DMhYbGAK7V4DS2W0NHVWjL7H2d5w39KlSjnBmNztT
 57XvsKPaE/xhD0Gk4ZU8B8NXTMx3DCBCK1g3tIlhvJ51L1lBaPx8P1IZJ3rpceW8fk38
 4F8yPFc98foJS7FNQK/F3xSdhBQad9IWMocbbFhYTPvR/DgNBndzPGKfKTqGpxJr0o9l
 qeXT9jXUyC52TRCBLtBgKxG/yFthSqWs8UD8e9MEwf/6MT/eW6QXWIu9u26O8yXKCnji
 pNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YVFSFzcUC5z68KuVIhNjBPz2ycj/E3mWghj+QM1REEo=;
 b=bmO6uYlKrsWaDEn/+fY/fJS9jPQBc7ydn+wdfRFg1vai/9pnkQPyusLkT9PFx0415d
 VUWCi/j/oNBYgY3wS0R6E2epipoZdv0NG8S+UVK2fAdBzmI7L4pjg3Z7bkaA5Y7yFEr8
 ONxPZKgxjiiU3EWdNrzNEv1pPR9RjQFHOikoq++qHaWnjQXDvW0wFKXmQ18HrMLvIIKC
 73NyJpCCBGFUrGQcF29qT3HiiIZ4zWmJUDaji2NuonWZ35o9gzldH83LvnfWNnvuh5kQ
 ECoXLqfukezrUuK73B/+/EEHRbPLiASCgfCz63BbMO+lhUJBAcFnbcayC/E0TqvDbYsT
 pgWQ==
X-Gm-Message-State: AOAM530qT6PUQ90nEzVE2tob9GrPYOuCZhJvLjT2f6ocNPMEN3G/cdaJ
 76D+QyrnWKfLUQoERaixGbvgDOQCLRI=
X-Google-Smtp-Source: ABdhPJwMO85RlHDKwWW2lvTcI324IqcEpYzcDoaJk1YH7YzJdYLV3dFjDOmBmaV8mZouyLqH8ObNpw==
X-Received: by 2002:a05:6870:e2d5:b0:e5:e41d:917d with SMTP id
 w21-20020a056870e2d500b000e5e41d917dmr2210238oad.234.1650481976225; 
 Wed, 20 Apr 2022 12:12:56 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a4a6951000000b00329d8b23f0dsm6988509oof.5.2022.04.20.12.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:12:55 -0700 (PDT)
Message-ID: <2e62d048-1635-ba62-022b-ce3b30ac6290@gmail.com>
Date: Wed, 20 Apr 2022 16:12:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/ppc: Improve KVM hypercall trace
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325223316.276494-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220325223316.276494-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

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

