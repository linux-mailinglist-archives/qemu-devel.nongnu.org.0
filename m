Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBF53ED4D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:54:39 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGw2-0002QT-Pb
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsG-00069n-DU; Mon, 06 Jun 2022 13:50:44 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsE-0007fl-K0; Mon, 06 Jun 2022 13:50:43 -0400
Received: by mail-oi1-x22e.google.com with SMTP id w16so10771274oie.5;
 Mon, 06 Jun 2022 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qICFyRLjpFR5R6TKWUsafxlhmqcnH9Qju0mHNQi5AMA=;
 b=n7Hp8A+o7vcyvY5eG+k4K+yfRZcjJQXBslvDLRChBHy9ZVYIu2W+udToG6WSHW9pAt
 0SuHwnnaAFPQPpc6hHXceeonjAtDrAz+CQme08NwLhDKRxa6eRVafURoSXTR29DoI2C9
 YujXEDc1xYvq0mLgd9dCOCaDwLb1Fjd0cmDg46Qowcx1BZePkdGksTK7WiZfrwbLEHbv
 smQxbyehJce4n5UIWIsAKklhoHBQYH9wybvta98DnHpUDxdA+eIgB6LTZT55rQbdimC1
 8Rn57qlKQeUE8QbxmVuxQqTJH0TI7CxNl5aWnmZdJnDhVO+NYUsu55NjmezyZUlaypJu
 W7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qICFyRLjpFR5R6TKWUsafxlhmqcnH9Qju0mHNQi5AMA=;
 b=mYwwgykgZFqcbOHKZZJd36SWWpLRA1UClAJgAEpSYnuO/iZiCnCoaJTCCDV+PTgnIl
 NboZKnARdoPb8AXzdkjnH2F7HT41ykUQJBZwSdUSscHwLU17T6uC3HiUE1MyonE0ykHy
 L50+LIW/3QFxSKwaNBD2V8c11V7GC3NUzHHoWsqIgfzg5plGhI5EDMewFWC/dDGpOv58
 jB8ErvvBIulycAnHzM93zyOqZXHtDeJYcf49wl1j4EVOqhwj+ixC127F1k7+QxeDpZTC
 Nw7685tYkGy9amxrP6BFbhKnfOKbvsCkFVZTYfyHbwVH/6iEdZJGlR95GxeES7cnqWNU
 xPAQ==
X-Gm-Message-State: AOAM530BYHCZcmSkC1pePPVta15r2a3l94FUA9w0AuTHy9RAYqmsFe+7
 6Mpp69D1zk0RIB7efU5Zia8=
X-Google-Smtp-Source: ABdhPJzaqsCVQib+Jvir4K+obqGvK6B1CahKcdEcKUbEw2wrfjrtMkssnW9koXk8mborWIixeCsL2A==
X-Received: by 2002:aca:da09:0:b0:32e:95d4:7421 with SMTP id
 r9-20020acada09000000b0032e95d47421mr3366267oig.33.1654537841194; 
 Mon, 06 Jun 2022 10:50:41 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.74])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a9d624d000000b0060bfb4e4033sm1692844otk.9.2022.06.06.10.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 10:50:40 -0700 (PDT)
Message-ID: <97a4b629-6431-347f-7fc0-08175eda858b@gmail.com>
Date: Mon, 6 Jun 2022 14:50:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc: fix vbpermd in big endian hosts
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/1/22 09:53, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The extract64 arguments are not endian dependent as they are only used
> for bitwise operations. The current behavior in little-endian hosts is
> correct; since the indexes in VRB are in PowerISA-ordering, we should
> always invert the value before calling extract64. Also, using the VsrD
> macro, we can have a single EXTRACT_BIT definition for big and
> little-endian with the correct behavior.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Found this bug while refactoring VECTOR_FOR_INORDER_I uses. The
> complete patch series will also use Vsr[DB] instead of VBPERM[DQ]_INDEX,
> but it will need more testing. For now, we're just changing what is
> necessary to fix the instruction.
> ---
>   target/ppc/int_helper.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 105b626d1b..4c5d3f03f8 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -1307,14 +1307,13 @@ XXGENPCV(XXGENPCVDM, 8)
>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
>   #define VBPERMD_INDEX(i) (i)
>   #define VBPERMQ_DW(index) (((index) & 0x40) != 0)
> -#define EXTRACT_BIT(avr, i, index) (extract64((avr)->u64[i], index, 1))
>   #else
>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[15 - (i)])
>   #define VBPERMD_INDEX(i) (1 - i)
>   #define VBPERMQ_DW(index) (((index) & 0x40) == 0)
> -#define EXTRACT_BIT(avr, i, index) \
> -        (extract64((avr)->u64[1 - i], 63 - index, 1))
>   #endif
> +#define EXTRACT_BIT(avr, i, index) \
> +        (extract64((avr)->VsrD(i), 63 - index, 1))
>   
>   void helper_vbpermd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {

