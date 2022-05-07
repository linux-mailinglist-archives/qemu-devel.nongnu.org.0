Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD251E82B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 17:32:19 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnMPq-0001S7-5p
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 11:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnMOl-0000mG-Oh
 for qemu-devel@nongnu.org; Sat, 07 May 2022 11:31:13 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnMOg-0006Dg-H0
 for qemu-devel@nongnu.org; Sat, 07 May 2022 11:31:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id a11so8669698pff.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 08:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=2vKBfGJv+6Fo2oj57RV66ifID3Csnui6MtncIVqtpb0=;
 b=D3CvERfgJm9IfH2kZpeP7Fy2o+e2J61EQV+Bop3Mry93OT/Ut3yK4I2QRbbZrNSE8p
 SowJn7MluhvKgzFa6avAlR3YChbhbVupebebyIl14naaT6GDNUqLL//DhR5zkrbCyz14
 1KWiyKy0ZAgYobNk7UitCV7nPrU1KReZlN4gTzk6r5x9drw5ddGZqG/LJAA1qp5dh1lH
 iQObYRdRgYdCRbdi9dka6LWOJ8ttUsjOdLiyus3Ef5gH4U5xAYvvvAvtqOpP8ct/MSJy
 73ov6OiOZZvyGo0Pow9wi3vdJPmV4VX4qzKb+uYEnQfSGkJ0WPV2uezuO9mX0jUiHnIc
 A2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=2vKBfGJv+6Fo2oj57RV66ifID3Csnui6MtncIVqtpb0=;
 b=nMM/6dm1pmGy2DwrR5oSlrraeyywDvGYSiQ6J9nsyAIJTVUkxcwNW9QOnevJ2yiTIx
 jLcNvXnzOhaXhfM4okOTk7x9yEvLW6fpNz622TW9YU3wzAjj0ld2BaPjSM/LD1KzAZjj
 BmCLug5QJj8JUOd0CRUBNwKrzApei/wxnd5hMyvxwMXLLnHcchoV/q33oVNW8KylQd7r
 6XFEtMU+DJ7T5BWSWXnJGmvDRNLNhJDRN9IrSBs3er8SAGFkVlK1fPpQhXMlblpdHm5U
 YFRQC4SrW9yjYmtgT4CB5tO3lZm6FVC94fVihGw2QTqlx4xsgc+Ne6ZvPx4XTmJESKi1
 Chxw==
X-Gm-Message-State: AOAM532AIHxVl/vtnGPIacueID3M36LLUzStcByZ7OVrAn5/bYV2rO/X
 eVGgW/TvWIBTldCpsM/ZJx0nAg==
X-Google-Smtp-Source: ABdhPJxObx2BlPDF6nOR2vZEA+JDXdMRCZFhZl9MZ5Itflc0/kBHszHQHldYm7jLWAjc1yAWFaMCpA==
X-Received: by 2002:a05:6a00:170a:b0:50d:3e40:9e0 with SMTP id
 h10-20020a056a00170a00b0050d3e4009e0mr8622639pfc.48.1651937464681; 
 Sat, 07 May 2022 08:31:04 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 p18-20020a1709028a9200b0015e8d4eb2cdsm3784579plo.279.2022.05.07.08.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 08:31:03 -0700 (PDT)
Message-ID: <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
Date: Sat, 7 May 2022 10:31:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/29/22 05:07, Xiaojuan Yang wrote:
> +    int ipmap_mask = 0xff << ipmap_offset;
...
> +    int cpu_mask = 0xff << ipmap_offset;

These two masks are redundant with

> +    ipnum = ((s->ipmap[ipmap_index] & ipmap_mask) >> ipmap_offset) & 0xf;
...
> +    cpu = ((s->coremap[cpu_index] & cpu_mask) >> cpu_offset) & 0xf;

the 0xf masking here.

> +    cpu = ctz32(cpu);
> +    cpu = (cpu >= 4) ? 0 : cpu;

You are not considering CSR[0x420][49], which changes the format of this mapping.

I think this function is wrong because you maintain an unmapped enable bitmap, but you do 
not maintain an unmapped status bitmap, which *should* be readable from 
EXTIOI_ISR_{START,END}, but is not present in extioi_readw.

I think that only extioi_setirq should actually change the unmapped status bitmap, and 
that extioi_update_irq should only evaluate the mapping to apply changes to the cpus.


> +    if (level) {
> +        /* if not enable return false */
> +        if (((s->enable[enable_index]) & (1 << enable_mask)) == 0) {
> +            return;
> +        }
> +        s->coreisr[cpu][coreisr_index] |= (1 << coreisr_mask);
> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +    } else {
> +        s->coreisr[cpu][coreisr_index] &= ~(1 << coreisr_mask);
> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +    }

This final bit, updating the cpu irq is also wrong, in that it should be unconditional. 
This is the only way that it will work for the usage in updating the enable mask.

I think you are not considering when the MAP registers overlap outputs.  For instance, if 
all 256 bits of EXT_IOIMap contain 0, then all of EXT_IOI[n*32+31 : n*32] overlap.  When 
that happens, you cannot lower the level of the cpu pin until all of the matching ioi 
interrupts are low.

Or, perhaps I don't understand how this is supposed to work?
The documentation is very weak.


> +static void extioi_writew(void *opaque, hwaddr addr,
> +                                   uint64_t val, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    int cpu, index, old_data, data_offset;
> +    uint32_t offset;
> +    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
> +
> +    offset = addr & 0xffff;
> +
> +    switch (offset) {
> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
> +        s->nodetype[index] = val;
> +        break;
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
> +        s->ipmap[index] = val;
> +        break;

Do you need to recompute the entire interrupt map when ipmap changes?

> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        index = (offset - EXTIOI_ENABLE_START) >> 2;
> +        old_data = s->enable[index];
> +        if (old_data != (int)val) {
> +            s->enable[index] = val;
> +            old_data = old_data ^ val;
> +            data_offset = ctz32(old_data);
> +            while (data_offset != 32) {
> +                if (!(val & (1 << data_offset))) {
> +                    extioi_update_irq(s, data_offset + index * 32, 0);

This is not correct -- you're unconditionally setting level=0, corrupting the old value of 
coreisr[cpu][index].  You need to recompute *without* changning those levels.

> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> +        index = (offset - EXTIOI_COREMAP_START) >> 2;
> +        s->coremap[index] = val;
> +        break;

Recompute the entire interrupt map?


r~

