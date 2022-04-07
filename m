Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A714F883F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 22:02:05 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncYKR-0003so-Re
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 16:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncYI1-0002oU-Iv; Thu, 07 Apr 2022 15:59:33 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:45459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncYHz-0005kt-Q5; Thu, 07 Apr 2022 15:59:33 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so7527497fac.12; 
 Thu, 07 Apr 2022 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7sREfXvpqt5bNi3n42YLxJpTbeqZAjqXSVHI3wxOw+U=;
 b=iE+t4yCVp2PFID86SdXm+Ch3NfE5etf2NhPUNRczZXB9cPmNb+1m84K1ccehBQOUUR
 ZF9G4A8UjxpbkFQ+zcwn/HP7OnDGr3ys7ugLgDFjkBu1lKP/Y/VILe1+4J/nc6dooAiq
 oxSURji4yjjZfegSkKLBhic4LWugCfa1DZ4O4xSboOGFblQdn9dfNSCnZZOIFMYEELc1
 SN6PBN2oyR/ZNORYYg4ImoFn8M/qQ7EkqIqRO5c5Bp3j3x7MiWGIE2czpbReudCOx4pj
 oPN6flsAVw8aqi2QxWiTV44VyUZYWPE3KggmlHHe1sQnQUivQ+uLc7RL+Dfjj9C19vGJ
 5VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7sREfXvpqt5bNi3n42YLxJpTbeqZAjqXSVHI3wxOw+U=;
 b=N6NLGa55dAmzcMrkFcQHf3M1NzOgFfrj7Bvfb0+uAx+YMsSFkKhtGvCI5XTERvhZdF
 gRJD4kGy0ZaXXu++GIaPwpuM+TQvxUqYyULHkDxfVIHfPbuoad6xH65WUEswuLwplI11
 pyqG48NDLGlx4I6JoIqQ8oFmeAcehy9APa54OD6AGKy74NK95FzgKdpyG4cloPcuHQs0
 Cy3ukv2jmnUUbyfqqG+0PDk2v2BeTcf9sRGzz5GIIqHFKvbNjldGJq7/QUBmO/0MJHS/
 Ryh72ZMkA6H38VZeGl7Af8jHj92oSxT6Whz0xUCavGEeyFAGbT/tYEptmrgdoU5nGqPC
 j17Q==
X-Gm-Message-State: AOAM5313o8TmEa0KS4j3kY4f2ud2i0vV+DCMu3t4GcDnc2zmjYxEx+xk
 F0KxBgsB59LXCfPQ349M7NquYZQWyzY=
X-Google-Smtp-Source: ABdhPJxvzGkqVNlCyiMC2H0urZzcVKBR/CF/6wTGnu9Ynl+KtHy+5hwz7TYD/OibvnNDuwCfgmTtkg==
X-Received: by 2002:a05:6870:d29e:b0:dd:d3ae:2251 with SMTP id
 d30-20020a056870d29e00b000ddd3ae2251mr6638217oae.88.1649361569793; 
 Thu, 07 Apr 2022 12:59:29 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a0568301e7100b005b256697d7csm8221728otr.72.2022.04.07.12.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 12:59:29 -0700 (PDT)
Message-ID: <6b608c5e-d1fd-b491-17e0-dabc93c5795d@gmail.com>
Date: Thu, 7 Apr 2022 16:59:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH qemu] ppc/spapr/ddw: Add 2M pagesize
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
References: <20220321071945.918669-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220321071945.918669-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/21/22 04:19, Alexey Kardashevskiy wrote:
> Recently the LoPAPR spec got a new 2MB pagesize to support in Dynamic DMA
> Windows API (DDW), this adds the new flag.
> 
> Linux supports it since
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38727311871
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> PHYP added support for it in development builds as well.
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr.h  | 1 +
>   hw/ppc/spapr_rtas_ddw.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f5c33dcc8616..14b01c3f5963 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -745,6 +745,7 @@ void push_sregs_to_kvm_pr(SpaprMachineState *spapr);
>   #define RTAS_DDW_PGSIZE_128M     0x20
>   #define RTAS_DDW_PGSIZE_256M     0x40
>   #define RTAS_DDW_PGSIZE_16G      0x80
> +#define RTAS_DDW_PGSIZE_2M       0x100
>   
>   /* RTAS tokens */
>   #define RTAS_TOKEN_BASE      0x2000
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 3e826e1308c4..13d339c807c1 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -72,6 +72,7 @@ static uint32_t spapr_page_mask_to_query_mask(uint64_t page_mask)
>       const struct { int shift; uint32_t mask; } masks[] = {
>           { 12, RTAS_DDW_PGSIZE_4K },
>           { 16, RTAS_DDW_PGSIZE_64K },
> +        { 21, RTAS_DDW_PGSIZE_2M },
>           { 24, RTAS_DDW_PGSIZE_16M },
>           { 25, RTAS_DDW_PGSIZE_32M },
>           { 26, RTAS_DDW_PGSIZE_64M },

