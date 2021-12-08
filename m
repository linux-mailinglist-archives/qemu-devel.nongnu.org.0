Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328846DBA6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:56:08 +0100 (CET)
Received: from localhost ([::1]:37714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv26o-00009r-OK
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv25X-0007YF-2h; Wed, 08 Dec 2021 13:54:47 -0500
Received: from [2607:f8b0:4864:20::a34] (port=41537
 helo=mail-vk1-xa34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv25V-0000qM-Ca; Wed, 08 Dec 2021 13:54:46 -0500
Received: by mail-vk1-xa34.google.com with SMTP id 188so2179971vku.8;
 Wed, 08 Dec 2021 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sCzUTSqjkEX0PTOV3ZX3DOqOxwlB9BYZVS0upWP+mIM=;
 b=UaitcMysViSxaEjlyphppdgbOiSXrzV/8dmsEyOudwM0q6NtTozGjZqMjhbQ++9HtO
 y7aR9oqecAxcZpLfeSsf5BTSLujg1YcRMFYM2WxOvfwJYCzpEdpO+Mib10OkkrW4Lych
 KFBPEsJV5nf1jpt6ZCVl/DdOKQrXmDYfUqGY0BwFPn1RnBa/+rNJgFMK/+o4jU0kHZeg
 oj/oT7oCEzP9LYV/h+EDvchFwjFJuNmwJhv+4uobdQ8L+31lZW89L1ReGq+ERh3T2bxx
 ZRldSZtyEqYeLz89MySgEwbXA7H+SyK15eQoLcEahI0AgOKDcNSPGE8np31cFVQjbGsb
 GYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sCzUTSqjkEX0PTOV3ZX3DOqOxwlB9BYZVS0upWP+mIM=;
 b=UvAe38cB+5NtKhF/160xSmfIRV+iVOazAl5w3gbBQiZ6djMgMp9lLV6kWfQJYSeqbb
 gTtWaq+vASd/5Q6FafIGELMV9m4RnBIh8VSh96AKKoQaWNh4Lb3kgWNmDgB2mfkQz9/w
 Z4hu13IHQhM6MoEc8H8xw3L9of5GF0uTYq+btBSKz4COSX8aqUeeeiXBsrwVtnsNi7bw
 8Ifr7i3yprgx6NdW7jSqyJT/Kns5RrHUWLvkXQitAsLbNUszSskz6JgJFPCxTZjgCPhV
 0o+9+HkRIHQ6czpp43WyjwmmemAIH2aBNm7aEfEB1B996eAl/fRNsSOvjQJv+gkv+TZD
 nuTw==
X-Gm-Message-State: AOAM533u6U6zHuu1ImitYAUuYac9anCwAH8h2fqj70Fr76vsXkuk8joQ
 f0u6GXHm5XO7Hx08etHK1F0=
X-Google-Smtp-Source: ABdhPJwmQeh8OWvDH4jybI4b/UkeZlNZYY9+G8ztgWJkFKCCpWjDLGm8xbzAIuBQrFbtqUcDGGk7nw==
X-Received: by 2002:a1f:19d1:: with SMTP id 200mr700271vkz.36.1638989683715;
 Wed, 08 Dec 2021 10:54:43 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id c24sm2385264vkn.30.2021.12.08.10.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 10:54:43 -0800 (PST)
Message-ID: <da9c1d2d-ce52-5114-eefc-cbf3eb7c475f@gmail.com>
Date: Wed, 8 Dec 2021 15:54:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] docs: rSTify ppc-spapr-hcalls.txt
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, groug@kaod.org,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/8/21 13:59, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---
>   docs/specs/ppc-spapr-hcalls.txt | 92 ++++++++++++++++++++-------------
>   1 file changed, 57 insertions(+), 35 deletions(-)
> 
> diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.txt
> index 93fe3da91b..c69dae535b 100644
> --- a/docs/specs/ppc-spapr-hcalls.txt
> +++ b/docs/specs/ppc-spapr-hcalls.txt
> @@ -1,9 +1,15 @@
> -When used with the "pseries" machine type, QEMU-system-ppc64 implements
> -a set of hypervisor calls using a subset of the server "PAPR" specification
> -(IBM internal at this point), which is also what IBM's proprietary hypervisor
> -adheres too.
> +sPAPR hypervisor calls
> +----------------------
>   
> -The subset is selected based on the requirements of Linux as a guest.
> +When used with the ``pseries`` machine type, ``qemu-system-ppc64`` implements
> +a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
> +Architecture Reference document (LoPAR)
> +<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
> +This document is a subset of the Power Architecture Platform Reference (PAPR+)
> +specification (IBM internal only), which is what PowerVM, the IBM proprietary
> +hypervisor, adheres to.
> +
> +The subset in LoPAR is selected based on the requirements of Linux as a guest.
>   
>   In addition to those calls, we have added our own private hypervisor
>   calls which are mostly used as a private interface between the firmware
> @@ -12,13 +18,14 @@ running in the guest and QEMU.
>   All those hypercalls start at hcall number 0xf000 which correspond
>   to an implementation specific range in PAPR.
>   
> -- H_RTAS (0xf000)
> +H_RTAS (0xf000)
> +^^^^^^^^^^^^^^^
>   
> -RTAS is a set of runtime services generally provided by the firmware
> -inside the guest to the operating system. It predates the existence
> -of hypervisors (it was originally an extension to Open Firmware) and
> -is still used by PAPR to provide various services that aren't performance
> -sensitive.
> +RTAS stands for Run-Time Abstraction Sercies and is a set of runtime services
> +generally provided by the firmware inside the guest to the operating system. It
> +predates the existence of hypervisors (it was originally an extension to Open
> +Firmware) and is still used by PAPR and LoPAR to provide various services that
> +are not performance sensitive.
>   
>   We currently implement the RTAS services in QEMU itself. The actual RTAS
>   "firmware" blob in the guest is a small stub of a few instructions which
> @@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to pass the RTAS calls to QEMU.
>   
>   Arguments:
>   
> -  r3 : H_RTAS (0xf000)
> -  r4 : Guest physical address of RTAS parameter block
> +  ``r3``: ``H_RTAS (0xf000)``
> +
> +  ``r4``: Guest physical address of RTAS parameter block.
>   
>   Returns:
>   
> -  H_SUCCESS   : Successfully called the RTAS function (RTAS result
> -                will have been stored in the parameter block)
> -  H_PARAMETER : Unknown token
> +  ``H_SUCCESS``: Successfully called the RTAS function (RTAS result will have
> +  been stored in the parameter block).
>   
> -- H_LOGICAL_MEMOP (0xf001)
> +  ``H_PARAMETER``: Unknown token.
>   
> -When the guest runs in "real mode" (in powerpc lingua this means
> -with MMU disabled, ie guest effective == guest physical), it only
> -has access to a subset of memory and no IOs.
> +H_LOGICAL_MEMOP (0xf001)
> +^^^^^^^^^^^^^^^^^^^^^^^^
>   
> -PAPR provides a set of hypervisor calls to perform cacheable or
> +When the guest runs in "real mode" (in powerpc lingua this means with MMU

What's up with 'lingua'? As you already know "lingua" is Brazilian portuguese for "tongue"
and it's so weird to be used in this context.

The one English word that I can think of that is closer to "lingua" and would make sense here
is 'lingo'. But that is a slang for 'jargon' and not appropriate for a technical document
either. "langua" as a short form of "language" seems weird as well. I really believe 'jargon'
is a more suitable word here.

This was added by c73e3771ea79ab and I really believe this is an unintended typo/mistake. If
you're feeling generous feel free to send an extra patch (you can send an independent patch,
or another patch on top of this series, your call) changing this 'lingua' instance to something
more appropriate.


Since this is not this patch fault:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




> +disabled, i.e. guest effective address equals to guest physical address), it
> +only has access to a subset of memory and no I/Os.
> +
> +PAPR and LoPAR provides a set of hypervisor calls to perform cacheable or
>   non-cacheable accesses to any guest physical addresses that the
>   guest can use in order to access IO devices while in real mode.
>   
> @@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the screen.
>   
>   Arguments:
>   
> -  r3: H_LOGICAL_MEMOP (0xf001)
> -  r4: Guest physical address of destination
> -  r5: Guest physical address of source
> -  r6: Individual element size
> -        0 = 1 byte
> -        1 = 2 bytes
> -        2 = 4 bytes
> -        3 = 8 bytes
> -  r7: Number of elements
> -  r8: Operation
> -        0 = copy
> -        1 = xor
> +  ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``
> +
> +  ``r4``: Guest physical address of destination.
> +
> +  ``r5``: Guest physical address of source.
> +
> +  ``r6``: Individual element size, defined by the binary logarithm of the
> +  desired size. Supported values are:
> +
> +    ``0`` = 1 byte
> +
> +    ``1`` = 2 bytes
> +
> +    ``2`` = 4 bytes
> +
> +    ``3`` = 8 bytes
> +
> +  ``r7``: Number of elements.
> +
> +  ``r8``: Operation. Supported values are:
> +
> +    ``0``: copy
> +
> +    ``1``: xor
>   
>   Returns:
>   
> -  H_SUCCESS   : Success
> -  H_PARAMETER : Invalid argument
> +  ``H_SUCCESS``: Success.
>   
> +  ``H_PARAMETER``: Invalid argument.
> \ No newline at end of file
> 

