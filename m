Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F207B504B62
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 05:49:54 +0200 (CEST)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngIOf-000780-PQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 23:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngINh-0006TM-L8
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:48:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngINg-0007FC-36
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:48:53 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j71so3088273pge.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 20:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5GAo7/YKJEL5s5naz6QPJMEpPmPFPCDKILlF/ypwa7M=;
 b=rqj9G7ve2YfnvkPCRrPZpcKX+mnEAzel3llYX1pwkSelb4JuR5PJY/zeTeB1hmYTKH
 VKLLrYv6Fgv0QNy5ujw4cR1HK3Els8hOK8VxmBFEFZ22PQRpeUGeUxXtBaCO0m1aMf/K
 HHNjrHfUbmGn8fGa2XBwlYNjbXZ8l61WCs5Ordk6qK3igdZOjxpKnqqgBxANeRvcej/w
 DI68FXMbsyZHq4RdDTT12v3w0+o34p9mJJbFtS2r+1PEFFxDF5MsHdkq3hR4T24QlE7/
 ilfd3tj7M/em7Uk4WbRm1dNKKk5mCelrGytbbGJm1ZIsjVhNh9aG+6mWtCk15Y2tzuRm
 sDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5GAo7/YKJEL5s5naz6QPJMEpPmPFPCDKILlF/ypwa7M=;
 b=tllFDOTGyotcp33BZx0VVh66taMltAVx0JZdw+dts1UQfAjXdXaKAhrgmUd/eB2uo2
 KcObWRNEMpBHGcFYCLEmJU+UfBACorcBj0najamVhgRA64QfUXojqBw5BAXA8+22eDUt
 ka8AVAVd6DZJgtinvzF3vyvIBpfzy0K+a8hWCZKydgPh5KtQsMYJB3YtJVAGz9eVo/Za
 Z0IIyal1e8xEuorZi7szYaMEzs/SX/zV6+DPWHAp/VzaYTg9wUrXTp9UCVVcAdyW42n5
 HypGgpTxNv/E1V5pBJJNyQsspM4i45V3bWm8pHeUKt3jmh6dG0aJCKe+ZQ7xCPHmj5IO
 hWgQ==
X-Gm-Message-State: AOAM532ucjU1fmqOmmmpCUJa4nH+xeOPNagN8Y46wSjLKfdNfUuiAmLc
 mqkPQFAY+6oSXZs+L7Q2Yb/dIA==
X-Google-Smtp-Source: ABdhPJxf16eHn8zOpNkujOhYvMrLSUxR8gGW84gq4sLF8lOcnWxFELqWNVTCVc0JBy5iesul/2gj6A==
X-Received: by 2002:a63:b66:0:b0:39c:ef72:bb70 with SMTP id
 a38-20020a630b66000000b0039cef72bb70mr8543488pgl.354.1650253730660; 
 Sun, 17 Apr 2022 20:48:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x136-20020a627c8e000000b0050a6a93b3eesm3132070pfc.116.2022.04.17.20.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 20:48:50 -0700 (PDT)
Message-ID: <6d62ce6d-acc2-b07e-71ac-dee03bbfd22f@linaro.org>
Date: Sun, 17 Apr 2022 20:48:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 35/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +        memory_region_init(&s->mmio[cpu], OBJECT(s),
> +                           "loongarch_extioi", EXTIOI_SIZE);
> +
> +        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
> +                              &extioi_nodetype_ops, s,
> +                              EXTIOI_LINKNAME(.nodetype),
> +                              IPMAP_OFFSET - APIC_BASE);
> +        memory_region_add_subregion(&s->mmio[cpu], 0, &s->mmio_nodetype[cpu]);
> +
> +        memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
> +                              &extioi_ipmap_enable_ops, s,
> +                              EXTIOI_LINKNAME(.ipmap_enable),
> +                              BOUNCE_OFFSET - IPMAP_OFFSET);
> +        memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - APIC_BASE,
> +                                    &s->mmio_ipmap_enable[cpu]);
> +
> +        memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
> +                              &extioi_bounce_coreisr_ops, s,
> +                              EXTIOI_LINKNAME(.bounce_coreisr),
> +                              COREMAP_OFFSET - BOUNCE_OFFSET);
> +        memory_region_add_subregion(&s->mmio[cpu], BOUNCE_OFFSET - APIC_BASE,
> +                                    &s->mmio_bounce_coreisr[cpu]);
> +
> +        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
> +                              &extioi_coremap_ops, s,
> +                              EXTIOI_LINKNAME(.coremap),
> +                              EXTIOI_COREMAP_END);
> +        memory_region_add_subregion(&s->mmio[cpu], COREMAP_OFFSET - APIC_BASE,
> +                                    &s->mmio_coremap[cpu]);

Why are these separate memory regions, instead of one region?  They're certainly described 
in a single table in section 11.2 of the 3A5000 manual...



r~

