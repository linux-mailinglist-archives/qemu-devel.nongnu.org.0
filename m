Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875E4E2AF7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:36:40 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJ9C-0004p3-SA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:36:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWJ8A-00045X-PE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:35:36 -0400
Received: from [2a00:1450:4864:20::430] (port=37480
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWJ89-000883-8Q
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:35:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id u16so19974538wru.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AoYtVyQQViMwgMOM/ajwkclqfB6czNSH9VJuzJaybqA=;
 b=koYcKm/b0j6HphL4fk1DpsJ9Ji4xWEn2DemJ08ozhJkjtj5KjtvKSElgyFKe7k8Lfg
 hUQUsLySR6AUKM8EBW6LUQnWT5QPSHhZ/loIy2kj2d3hmQH5gteBi9Up6i4Y44hx2WmL
 4AySeqqYlQmMbV0TvOw2YXlA6Kf8zEckQ8ZRof0uT0r9EJDT3OUG80g1wcdZtM+NMkOG
 NjMo+/WXVI72/V67dslmGSJXLSLiiISDnogZImCzXuyD0BiFkGWgG8GOEfHgxxKDj5dz
 y8U2HLQP+U2nlPeLcCrkdpJH3lFopvhw4OxgXTz0cvutuY+ab7/4QQdUbCO1YcwTZ9hF
 GYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AoYtVyQQViMwgMOM/ajwkclqfB6czNSH9VJuzJaybqA=;
 b=QMn0e4t+zUkOVvAB8Igr0V08qh2q01rZOGT3kQoXv4XCMHXBVAJ92MtN4A1oqTU/5b
 WXDMeUCRl66OioIX3g9kPqPJt06INQJiBB8jXUHN3VLb0jaO4uMooOuyM597RZMuTsvF
 aNXA3rWmQ95GRFPtwwH4fNuRmw+hcdrT0W9pc64zV4BtYpY1aVhODXW5G+7GULq/PBBl
 AySQ5P7OEIfIWpgqz8yFVsLekNPlDhep0LRootg4XbGRrounH5tLQd9LwHJbNC2tiPgF
 qnagZpVPu1R1iabGWunXkoAdGnRXEfDyUOpeLEgkCZhZD09cASJ3J8QwBl7Ve0CbzcgL
 9xPw==
X-Gm-Message-State: AOAM530hmaApxMH9/VMXjc9U+ZAULGTJ22N7LsgxpbT8+4qbRpw1Y6ri
 zUkLAmfu59P90+56/Ss5/vU=
X-Google-Smtp-Source: ABdhPJzjCFQ+Wq8yPK9E6AfuO3s4JHKl6lyR9rVTChZ5XMCNIl1mA0090pUImEQcf1pxlTX/2QQKIw==
X-Received: by 2002:a05:6000:11c5:b0:203:dc09:dfe8 with SMTP id
 i5-20020a05600011c500b00203dc09dfe8mr18739778wrx.499.1647873331336; 
 Mon, 21 Mar 2022 07:35:31 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00203f1231082sm14792352wrd.90.2022.03.21.07.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 07:35:30 -0700 (PDT)
Message-ID: <cf1ea327-2e74-d02e-1c47-ed4f3bb9afd1@gmail.com>
Date: Mon, 21 Mar 2022 15:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] hw/i386/amd_iommu: Fix maybe-uninitialized error with
 GCC 12
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220321143346.156481-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321143346.156481-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 15:33, Paolo Bonzini wrote:
> Be more explicit that the loop must roll at least once.  Avoids the
> following warning:
> 
>    FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
>    In function 'pte_get_page_mask',
>        inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
>        inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
>        inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
>    hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used uninitialized [-Werror=maybe-uninitialized]
>      877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
>          |                      ~~~~~~~~~~~~~~~~^~~~
>    hw/i386/amd_iommu.c: In function 'amdvi_translate':
>    hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
>      906 |     unsigned level, present, pte_perms, oldlevel;
>          |                                         ^~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Having:
> 
>    $ gcc --version
>    gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)
> 
> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/i386/amd_iommu.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

