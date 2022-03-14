Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1A4D8B45
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:03:36 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp2d-0005XB-Rb
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:03:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nToyI-0006QD-G4; Mon, 14 Mar 2022 13:59:06 -0400
Received: from [2607:f8b0:4864:20::c34] (port=35487
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nToyE-0002sg-3l; Mon, 14 Mar 2022 13:59:03 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so21288517ooj.2; 
 Mon, 14 Mar 2022 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rMxzX1DsI/fSNKVYzaI+0bHLH6yKLOcYgUI7TNQKkG0=;
 b=c7y04gv9/D0zEUj2HB/Z7O8dGlI61fo6cfQvZc74Kyrge5m97OUKs2KWv6jZ4dYfr/
 +tq164odVai4YOC5NtknYJBa7KPlZrkAYK0tUqOWvtIJauKqRJZCvF5+iEmLbH7T/jeg
 ocILjmIZo0hW4KVZlnssIR7RSSh+uYUbXiwpGcYoc/3zFuscOCaVLHe6LEPA3rgR/Va2
 tJDXRKqWeiS5wBTZh4ukUbvMC/e4HTtI/RKgHnNWY5c+cacLPI2e11T17eTamzafdYEn
 xIz72wHKF/1ixYuV9fKB+Vo6Mw7C5Gi5ZZK2ImemmxO+F4qqMwwIOZT475WaBu83Ys17
 RbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rMxzX1DsI/fSNKVYzaI+0bHLH6yKLOcYgUI7TNQKkG0=;
 b=aeNQwj0p5W6smySDhhs7zTcK5aXKpbTujZ0BChcqjxhhR5YcQIDR/B38kiNlaSxTmC
 xrfl1qEXBo43hWztXzu/Ox9ObQj5yQNVVRttLQvjXtXQC0VmeejpQsAVLDWplerTzDZ5
 TkJjOwfK0rzLK/QzPhpFk95Ctj2kPz3c02PGVjB/W8SEYJRdXnumewBiqYzLkUUOzv5f
 2CH5ewCsxMl2B5eGh64xB+o9xL7OhDSpjuEMvT8gvkSNXGHWJzzfGblJALEVUndYyFwV
 UOwatLZut+SB7yRxPGEtbUzLRs52sDK/lPr2HaQLfSSlBNZl7O4idxdunNXdhHQTOP+h
 ec2w==
X-Gm-Message-State: AOAM530Pb8FK9oLBaEs4/zl90H6QkWTHiTuAehI1kyklydLsbvnGDcsV
 DB6TjS2FTydI+hbtzev0j7w=
X-Google-Smtp-Source: ABdhPJzQm9C7wtZCyHT/gJBdqeirKlmECdVLxNP7cBiamtObUqcpe0PstA4gd9YpJjxjPB9zKpuyVQ==
X-Received: by 2002:a05:6870:4792:b0:da:b3f:2b39 with SMTP id
 c18-20020a056870479200b000da0b3f2b39mr170251oaq.216.1647280740643; 
 Mon, 14 Mar 2022 10:59:00 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:b99a:f075:1c24:8dfe:9a50?
 ([2804:431:c7c7:b99a:f075:1c24:8dfe:9a50])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a056830101700b005ad0bd6fe0csm8184455otp.47.2022.03.14.10.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 10:59:00 -0700 (PDT)
Message-ID: <edb07e42-fbe0-2eed-48cb-adeade84d416@gmail.com>
Date: Mon, 14 Mar 2022 14:58:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] ppc: Include asm/ptrace.h for pt_regs struct definition
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20220314172508.816110-1-raj.khem@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220314172508.816110-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/14/22 14:25, Khem Raj wrote:
> Fixes
> ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
>      return uc->uc_mcontext.regs->nip;
>             ~~~~~~~~~~~~~~~~~~~~^
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Drop ifdef __powerpc__
> 
>   linux-user/include/host/ppc/host-signal.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
> index b80384d135..ec6166ed66 100644
> --- a/linux-user/include/host/ppc/host-signal.h
> +++ b/linux-user/include/host/ppc/host-signal.h
> @@ -11,6 +11,9 @@
>   #ifndef PPC_HOST_SIGNAL_H
>   #define PPC_HOST_SIGNAL_H
>   
> +/* needed for pt_regs */
> +#include <asm/ptrace.h>
> +

I am intrigued about why we didn't hit this before, especially considering that ppc64 header is just a
pointer to this file.

I looked it up and didn't find why. This change seems harmless to me though.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




>   /* The third argument to a SA_SIGINFO handler is ucontext_t. */
>   typedef ucontext_t host_sigcontext;
>   

