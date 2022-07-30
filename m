Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15835585A26
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 12:43:29 +0200 (CEST)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHjwO-000349-64
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 06:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHjsj-0008FG-9g; Sat, 30 Jul 2022 06:39:41 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHjsg-0002H0-Iu; Sat, 30 Jul 2022 06:39:41 -0400
Received: by mail-vs1-xe30.google.com with SMTP id d187so6812304vsd.10;
 Sat, 30 Jul 2022 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+i2t8yGKNYX1/+QAMCeXvPop6x5VCEshXH3WAjaeIM0=;
 b=XBzGqYVnJN+WV7BZKzYtlluA2/UvrxHyrGxoxdKnkYIxDLNdfFwtkcigTqBt5hqYbK
 hPfHpm22TR56yyOlxeVv6v0dx7/crqG9R/0A0clO3hPwW3mDyP7W7fnGyAPOI13HSLni
 6d5VxfToAampqPcbsYWn0zZj0IQ4E//CQjgn11ZfmZL4FWTFV+8Vn4tZrfdiLdPi1kuY
 9ijnV5HTJ+3E7OyOZca27wkY5XfDl6sy9Omj7MAHDddDwqwFXmUo+eZLsp8B2cCyArdS
 phLIxupuPho8ltkhevF7BcZsFkzbm1ZgSRJIe3+3tYLEfKvYKZqRuQgmPVcQX/NFPip2
 XQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+i2t8yGKNYX1/+QAMCeXvPop6x5VCEshXH3WAjaeIM0=;
 b=ugd4MNzqp4jxqSNmWjPEnmDubZ/R/JcKcJ+6Gtf7o3yW0EPSaFK2l0C6UXAkcO0Dyc
 5rhFGHO3fRXnq3BPCT9P/rs+Wl7FYNcwoa1X4wxdgI4aevaMgPEsz/ye9y88zZX8un82
 uA9nsGzEqxfTN+P+nSfqG/eoCnbKmSIQLj84h7xAtV0u+M/GWonJXmrpfE56wKtnTgQY
 cwCowYlIhbcHROisR+Xgd9H9sOsVYdtqueiMHPrFssDsLvu5sbFkssTSFduclwy+nRpv
 iOZX9Zs09KiH8oYQ1Y2fyE7Bl7vtYTFJzQFlfO5oVjFcUcfgPCfWki4HuUjbRhIUe6Om
 Vzog==
X-Gm-Message-State: AJIora+cF6Z5MPTQoTo3wEIaIrP+dXtN4ww8vzcfsJClWadDPYEHXBXr
 PjAa725ZxDEhO0BZGFARPdE=
X-Google-Smtp-Source: AGRyM1vZO5MctEJsvGazFAtF2GDciM2kYWJUMOpghhZAdH7SRMqyIIh4uJVL3sKmtWAI4/zhlRNTxQ==
X-Received: by 2002:a05:6102:5047:b0:34b:d9ef:bd26 with SMTP id
 by7-20020a056102504700b0034bd9efbd26mr3112214vsb.14.1659177577024; 
 Sat, 30 Jul 2022 03:39:37 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 o129-20020a1fa587000000b00376f0aff800sm2737792vke.18.2022.07.30.03.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 03:39:36 -0700 (PDT)
Message-ID: <8689fe2a-c32f-6248-8ebe-b645dca165d0@gmail.com>
Date: Sat, 30 Jul 2022 07:39:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] linux-user: Implment host/ppc/host-signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
 <20220729172141.1789105-3-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220729172141.1789105-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit title typo: "Implment"

On 7/29/22 14:21, Richard Henderson wrote:
> This commit re-enables ppc32 as a linux-user host,
> as existance of the directory is noted by configure.

s/existance/existence

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1097
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   linux-user/include/host/ppc/host-signal.h | 39 +++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 linux-user/include/host/ppc/host-signal.h
> 
> diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
> new file mode 100644
> index 0000000000..de25c803f5
> --- /dev/null
> +++ b/linux-user/include/host/ppc/host-signal.h
> @@ -0,0 +1,39 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (c) 2022 Linaro Ltd.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef PPC_HOST_SIGNAL_H
> +#define PPC_HOST_SIGNAL_H
> +
> +#include <asm/ptrace.h>
> +
> +/* The third argument to a SA_SIGINFO handler is ucontext_t. */
> +typedef ucontext_t host_sigcontext;
> +
> +static inline uintptr_t host_signal_pc(host_sigcontext *uc)
> +{
> +    return uc->uc_mcontext.regs->nip;
> +}
> +
> +static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.regs->nip = pc;
> +}
> +
> +static inline void *host_signal_mask(host_sigcontext *uc)
> +{
> +    return &uc->uc_sigmask;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
> +{
> +    return uc->uc_mcontext.regs->trap != 0x400
> +        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
> +}
> +
> +#endif

