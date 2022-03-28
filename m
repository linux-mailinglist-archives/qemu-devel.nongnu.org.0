Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518C4EA2A7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:05:45 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxUd-0006Kz-L5
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:05:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYxT5-0005fB-Ru
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:04:07 -0400
Received: from [2001:4860:4864:20::29] (port=38831
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYxT4-0002hH-0g
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:04:07 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-dacc470e03so16752154fac.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S1fFzPjdQVDkqre8TWIIz5+TYcyrwemTtJml2UJDmDQ=;
 b=ulZIiPIbjDYEVfM+Mz1Jl3lzMCcR3yP3M1aEh3UrrEJSTQQnXpY0SB+Z2U/Bcqt/WX
 5tzoD7nTZ9/CG9sIaeAk/JxmZzbIgl2HVyLRRd2duFrgytGqqzNLnqkMLOIxphYsHYWP
 U0OlX5Capy/XvTMwMbtPc8kvTQx7zn3hq4QswcoDmDJViObT+sNzlhPQZBesWh659IVP
 9QtNmgjNbiBtpH0fKqYMy8p3ewSw7UKqRFSt2+mwI88SdPrpg5r/sNvFvZiRCouWdhZy
 i2DF3J2w5bmr9GdMPL2joDfI49buyhP+goTEuc6k18+CWa37FQEOFsjqhUzGTw6t0/nn
 OvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S1fFzPjdQVDkqre8TWIIz5+TYcyrwemTtJml2UJDmDQ=;
 b=oXu1a1MgfdVXZDi5CyJlKiT2XDl95ln/GU/gPTB4Tp6GBjRVgOfDbuV5+e90xhmQL7
 LNyntTAYG1/Yd054miMtLhYS0Qv5MBvrv+mhuVlPnIFZRVk+BJMHAK4PycddAdGRx4br
 F1bL4lppIqUX+NObhzIYsHXqRE8xw9TB90ELg4mw2Sp/jN06QTnWDL0vhcAGIVy9/ZY2
 UcJhhq6SxyOT4z6bgrVF9hvnTCBjCCZENPQZpFW6FoT5yjR/PgTYiwYB5wPNaC6U9jH8
 XHPhK+8Eoa9qCiTZdnnr7YnNviAmuCgAY+Isn0Wb5GaJARLmnYOKgTJ4CSm5sqy9LefA
 WCXQ==
X-Gm-Message-State: AOAM531afqCVRgXn4KZ4gmPe8fub1xiGxmyvbh3yRfnCvYZuXLdUhMy1
 UNpk35UDQCMrQxtXmpGihEMXrQ==
X-Google-Smtp-Source: ABdhPJzdao17484mSJXjPDBsQqCg6/pnLVsYSN6zBXGdtSZnP8lAb+lxcjuEaglUvWimjx9zl5fDBw==
X-Received: by 2002:a05:6870:d354:b0:dd:d425:d4de with SMTP id
 h20-20020a056870d35400b000ddd425d4demr668404oag.210.1648505044660; 
 Mon, 28 Mar 2022 15:04:04 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b000d9ae3e1fabsm7167550oak.12.2022.03.28.15.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:04:04 -0700 (PDT)
Message-ID: <2a8a504b-d478-1245-26ba-993a2b6416c0@linaro.org>
Date: Mon, 28 Mar 2022 16:04:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 16/29] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-17-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-17-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
> +                                 unsigned size)
> +{
> +    IPICore *s = opaque;
> +    int index = 0;
> +
> +    addr &= 0xff;
> +    trace_loongarch_ipi_write(size, (uint64_t)addr, val);
> +    switch (addr) {
> +    case CORE_STATUS_OFF:
> +        qemu_log_mask(LOG_GUEST_ERROR, "can not be written");
> +        break;
> +    case CORE_EN_OFF:
> +        s->en = val;
> +        break;

Changes to s->en should affect irq.

> +    case CORE_SET_OFF:
> +        s->status |= val;
> +        if (s->status != 0) {
> +            qemu_irq_raise(s->irq);
> +        }

I think s->en should be taken into account when raising irq.

> +        break;
> +    case CORE_CLEAR_OFF:
> +        s->status ^= val;

Incorrect: status &= ~val.

> +        if (s->status == 0) {
> +            qemu_irq_lower(s->irq);
> +        }

Likewise, s->en.

> +        break;
> +    case CORE_BUF_20 ... CORE_BUF_38 + 4:
> +        index = (addr - CORE_BUF_20) >> 2;
> +        s->buf[index] = val;
> +        break;
> +    case IOCSR_IPI_SEND:
> +        s->status |= val;

I can't see where this comes from, but helper_iocsr_write is very confusing.  It *appears* 
as if this is never invoked, because IPI_SEND is handled directly in helper_iocsr_write 
(which also seems wrong).


r~

