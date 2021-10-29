Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D943F74F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:36:44 +0200 (CEST)
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLVK-0000Lw-Uv
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKjJ-0003bg-Jc
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:47:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKj4-0002Xu-Uo
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:47:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so5797066wms.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8HYTOFdIauI71Dc6pq5WtYCEXHLnCKX6iXvFqkqw9Ww=;
 b=ch/uNDRE+gR4cksm3EawStTjQnUeC3968+XShmPG4qj8FwO0quMHoNac1k1povJfl/
 Myw2mdEGoQ4P0TU/CVeNbB0jBYKIMbgdjYwADqk9oMTDREFZPIMW6Xtx7BOYwZmRIpw9
 G+kSU+ICEKG1MjhAyf/UN3kXVou0bo34y/Qyk6yAbTnyW+Y22rlZify8vFK8sgTDjMeT
 8TeX3OOWBqaWG1dAiu4BmfR2XKx7H4CgOyKXD6yNWVRftlpNThYQZ1JxSNiSU58GsoaI
 KnHW5IAFottbuJvWihUabrvbnqJnjm1HkJCzgmk/FJTAB5oeScuzneg+zZ7++2h6X4dY
 avDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8HYTOFdIauI71Dc6pq5WtYCEXHLnCKX6iXvFqkqw9Ww=;
 b=NdKgLrmnC0eGsuqCxlDvD1kE+dgS4OjFWSD3U5FCKWYWnPJwZ2lhqHifPlmlGY6rZb
 KRsHQCHo3lRxoT4jbQFDjl8KYrB879dq0QGFYIvotD3euZm3uNSKl7LWG6oyFyVtGeCJ
 dzpgBJwQlaU40Xg1KDIJb0jLtFUKh8Aj9YEQc7ZMXNSrQoB+mgUflfv8+nt1vgQpH8rF
 wdwxnyjkHLu2zpdce/ehAYe1+jG9nKI2f8490+IAh/chMALPH62WKuVPAfZlsqmR90EH
 lijkaW/BMxy+7H+/Yj24zKHYHmKIC/0pFzdHfP/v8SwSGFxBmWTGXUtTIxkFfJchxUL2
 YKuw==
X-Gm-Message-State: AOAM532G0T9C+wz89wFbjQDvTj4ufUcHfeM+3lGi7Mp0YG9ZglezEbQs
 iSSxvcr2R/MICjIW0XUlhG4=
X-Google-Smtp-Source: ABdhPJyCGGRtogyMGFJVuCsnEKjA2OoSW6li7krMSA2+XilMVITdcomup8i9b3LRWeO3H7dTgH5ycQ==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr17431600wmg.85.1635486409258; 
 Thu, 28 Oct 2021 22:46:49 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o9sm1989537wrs.4.2021.10.28.22.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:46:48 -0700 (PDT)
Message-ID: <4d81b027-1ef1-ae56-1c77-262f9ac52e8d@amsat.org>
Date: Fri, 29 Oct 2021 07:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 18/23] hw/intc/sh_intc: Simplify allocating sources
 array
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <7257db154178303a7913986e230ec0ce1af387cd.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <7257db154178303a7913986e230ec0ce1af387cd.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
> variable assignments.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index eb58707e83..ed0a5f87cc 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -400,21 +400,14 @@ int sh_intc_init(MemoryRegion *sysmem,
>      /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
>      desc->iomem_aliases = g_new0(MemoryRegion,
>                                   (nr_mask_regs + nr_prio_regs) * 4);
> -
> -    j = 0;
> -    i = sizeof(struct intc_source) * nr_sources;
> -    desc->sources = g_malloc0(i);
> -
> +    desc->sources = g_new0(struct intc_source, nr_sources);

g_new() is enough, since all get initialized in the next line.

>      for (i = 0; i < desc->nr_sources; i++) {

Even clearer as:

       for (i = 0; i < nr_sources; i++) {

> -        struct intc_source *source = &desc->sources[i];
> -
> -        source->parent = desc;
> +        desc->sources[i].parent = desc;
>      }
> -
>      desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
>      memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
>                            0x100000000ULL);
> -
> +    j = 0;
>      if (desc->mask_regs) {
>          for (i = 0; i < desc->nr_mask_regs; i++) {
>              struct intc_mask_reg *mr = &desc->mask_regs[i];
> 


