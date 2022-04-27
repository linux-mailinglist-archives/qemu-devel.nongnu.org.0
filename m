Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA47512424
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:53:08 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njoep-00077Y-Rm
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1njodQ-0005ca-Rx; Wed, 27 Apr 2022 16:51:40 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1njodP-0006Mk-2V; Wed, 27 Apr 2022 16:51:40 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 c17-20020a056830349100b00605ca7d1deeso1890751otu.3; 
 Wed, 27 Apr 2022 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IWBGwWclpQY5wsRs8zXkZ8ShPaaPiOxIUYjJUHA+OEU=;
 b=fzIn0ju+siVfqjE1RkonunQNGIdSzPkFnUr73p6sOPqTgwaV9wkGeSQR+HwXcSC1LM
 E60rFoEoaBOd5mpBPMHs3uhWWQD/NpFRU/6MtlotDInP4jWGIXoa4zE/1tDVmmUAUZbo
 8wJCk+ZonbgIQRjJt3J7x9vkdtSF4Nii3ujlCqYH8Kt5eW87oA0UmXhZjxnyy0sL4gQI
 Ox47FXa0jGRO9O0snZ8CBwk9ym5kHKJWmd7vo42TQPhhegcj0nWu7Hw+rwM/9N2Ceva+
 u8SMTwU+u+fB5A02NuLcTANlQnuqMz2SGb+WJysklPyRCrQPD8fnEeFavdciVL8558jE
 1ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IWBGwWclpQY5wsRs8zXkZ8ShPaaPiOxIUYjJUHA+OEU=;
 b=jouT0qhrNkWT8I0bF2peI0ssGe3BkVPVt17UL1TXJNBt6RJT+1E0eBceTRgAlH9JCT
 08D6M815N2+rchbY5t3yJCxEn0q1b9hCo6VsRo3SIdgO3jPHwj15KlwoLOAf9QFtJysw
 TqSXolTZh7NKfUijcDgBXVs6nHvQL2GA96UYE4Fo5lQK59ZAWy9PLkJQWCzn+UryN0cB
 Zq6XZZai8c6XrEqU/lcZ3svKDyrKjWjZpj/QAQaWM/aj7JwKoeuVNqy4v0+DJ2HrjMOX
 0o64DFPCvJU6D7a30hb9YTyZecvPqhM5Ge+MH5JCR+YQxSl4CBt5PmWvCddyyOnbkIkE
 bhsA==
X-Gm-Message-State: AOAM530dDN9g4YCDBIYi3T++ZZsTdXCifRC1fOHk4KEhsDSLWuhz13jL
 +C7NSZ9ni3Nb1RS0As2LwIw=
X-Google-Smtp-Source: ABdhPJzJ2aCAwnq2jN1XCFu53RfFa1teGgffOY10LS817iovtKS2liWxRvnYX8q7lTIokV9nkzfSeQ==
X-Received: by 2002:a9d:ea6:0:b0:605:e43f:db71 with SMTP id
 35-20020a9d0ea6000000b00605e43fdb71mr775816otj.128.1651092697213; 
 Wed, 27 Apr 2022 13:51:37 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:3a18:8059:d9aa:a8b3:7e6b?
 ([2804:431:c7c6:3a18:8059:d9aa:a8b3:7e6b])
 by smtp.gmail.com with ESMTPSA id
 bb33-20020a056820162100b0035e71a9ed3esm3659617oob.38.2022.04.27.13.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 13:51:36 -0700 (PDT)
Message-ID: <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
Date: Wed, 27 Apr 2022 17:51:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 lucas.araujo@eldorado.org.br
References: <20220427064204.373027-1-joel@jms.id.au>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220427064204.373027-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/27/22 03:42, Joel Stanley wrote:
> These are new hwcap bits added for power10.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> MMA support for TCG is on the list so I think it makes sense for this to
> land after those are merged.

I believe you mean this series:


[RFC PATCH 0/7] VSX MMA Implementation


In that case I'll queue this patch together with it.



Thanks,


Daniel


> 
> I tested my patch with this program:
> 
>   https://github.com/shenki/p10_tests
> 
> $ qemu-ppc64le -cpu power10  -L ~/ppc64le/ ./test -c
> HWCAP: 0x58000580 HWCAP2: 0x8ee60000
> ISAv3.1: Yes
> MMA: Yes
> 
> $ qemu-ppc64le -cpu power9  -L ~/ppc64le/ ./test -c
> HWCAP: 0x58000580 HWCAP2: 0x8ee00000
> ISAv3.1: No
> MMA: No
> 
>   linux-user/elfload.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 61063fd974e5..0908692e62b3 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -779,6 +779,8 @@ enum {
>       QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
>       QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
>       QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
> +    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
> +    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
>   };
>   
>   #define ELF_HWCAP get_elf_hwcap()
> @@ -836,6 +838,8 @@ static uint32_t get_elf_hwcap2(void)
>                     QEMU_PPC_FEATURE2_VEC_CRYPTO);
>       GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
>                    QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
> +    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
> +                 QEMU_PPC_FEATURE2_MMA);
>   
>   #undef GET_FEATURE
>   #undef GET_FEATURE2

