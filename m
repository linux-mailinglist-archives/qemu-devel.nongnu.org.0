Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F27510E56
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:04:20 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njX2R-0003uT-6S
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWzs-0002FX-DQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:01:40 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWzq-0002Er-LV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:01:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id r83so345296pgr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6D18t6uZxdOUYgmcZ4N1itHNMzbPGBmQa7EknyLfQWA=;
 b=KbI3KHaid3NJnk61LuJY75JS7Ws9zz9Kr6i0gwy9kG4rVGWIRXZYuN/4z9fI8BJfkR
 GgjWYTHeKr7Re9GQCc+bTqSZ3F2oXdhydRrMX8FTfJEDX+vKl1pUqF7rYDP7wPIX5Lok
 eeIQCcVzayun1nstlIJTDc/GjPJyXrR3cNXBZGKoGHHI/101AuTSkdDhlcJaze9uVJcr
 WBTeyRXvgz3SFnSRwlpLR1CKFIx3I+zHlbg0uMJ34e1vCw4mZYu36fpDNAQBYF33X32E
 GW5Xc/8COsIIWgRi1Di5sD0dT2RmDCiS1gfd4q5wMB2OrC8LJ5r4fIVzUrxm23Pbi5Yg
 iqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6D18t6uZxdOUYgmcZ4N1itHNMzbPGBmQa7EknyLfQWA=;
 b=pCWTjQkQqPEaJF/2z9UQZTd3Vi0DYnWKD07nyRP/PVO1gHN47lkJtDdDWFcM4ND4vp
 7SjWCUKwS5ve3s0oqGMYm01EIrBrJihDqPNfOSWMdQ7PbXX8oxZIGTI5lAuwHm/soLz2
 9BvLHAmp9Pcf0Eqn6JsCZlNF0xrQMDnGBNsB2NQpSPBI5Rz5ya0zcGwoUN6uEfR2hAvT
 wVDH2GmzW8HvpF2g3yKCHX2/6CtVcWEaf8AgO4wWwYklW4woONmzReTaDnsxeybl8cUM
 06e3+PL/XN1yIrJdSAFrpQaU7+XzO0c9feQZBOur37Q3joHyH8y7JX+4mgDFsQmUSqZc
 rxpw==
X-Gm-Message-State: AOAM5300y6XyUCJ8MD4vo/PpPc6GLMG/sEbmPvms2Kgqh1ABAT703WAa
 CYzwyciuUI+BiaUCtIEYmvLWNA==
X-Google-Smtp-Source: ABdhPJwyhn+nP82GNL5CFgrTyUbNxcFpJWm8j9WcMAA0B2KZvoxpqQz7tBj2zuk/WjNzg6LRFXNRYQ==
X-Received: by 2002:a05:6a00:22c8:b0:50a:dbf5:59cf with SMTP id
 f8-20020a056a0022c800b0050adbf559cfmr27311859pfj.74.1651024896904; 
 Tue, 26 Apr 2022 19:01:36 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o34-20020a634e62000000b0039cc4376415sm13999863pgl.63.2022.04.26.19.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:01:36 -0700 (PDT)
Message-ID: <1d26cacb-f31d-7627-e207-56b05629e714@linaro.org>
Date: Tue, 26 Apr 2022 19:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 33/43] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-34-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-34-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 4/25/22 02:10, Xiaojuan Yang wrote:
> +static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
> +                                    uint64_t val, unsigned size)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
> +    int irq_num = val & 0xff;
> +
> +    trace_loongarch_msi_set_irq(irq_num);
> +    qemu_set_irq(s->pch_msi_irq[irq_num - PCH_PIC_IRQ_NUM], 1);
> +}

This needs to be bounded properly -- irq_num >= PCH_PIC_IRQ_NUM -- since 'val' is under 
the control of the guest.


> +static void pch_msi_irq_handler(void *opaque, int irq, int level)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
> +
> +    qemu_set_irq(s->pch_msi_irq[irq], level);
> +}

You should be able to connect the gpio lines directly, rather than having a pass-through 
function like this.  I think this is sysbus_pass_irq.


r~

