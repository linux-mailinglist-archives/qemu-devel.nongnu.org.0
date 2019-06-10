Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6F3B811
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 17:11:01 +0200 (CEST)
Received: from localhost ([::1]:47594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haLwr-0007T8-0h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 11:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1haLvo-0006sa-Gc
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1haLvm-0003WY-KF
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:09:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1haLvk-0003VX-OL
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:09:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x15so5509101pfq.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f6J9IAv0zl7JYsrbZVilAxHLK16vDDIGoOJMwfcaCaE=;
 b=caGxOsLiEuH0rSEgXqqEkrKYNQwOC0xSQQ15XqsU3U/pWZ11uhiaLI/Je2iqGxJw4G
 tgMInbHH8CHQpSHd0Dan4ny2CwUaR19zb8G4Nf7hZGmGaRAfUnCgjvW2/21a5EdpnF5H
 n2odAEaLeoWzrUTtg8jP+RhdGyoCaA6mVwNrsVGHSvJtHfbQexjRPfmFKsa1khXWipXo
 PnKf6Om5PEN7tSdiRX9c8rS+xSxzEYU54UgqdLvFy/85YHoONLE3H7e7wluC2MndJsXo
 YtRkVO0DduSJ7SGQxB/zyBflfujaPlH27B+On/mayvd+2HIJ6ArWANm9otn4dWR3+xpI
 Ziiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f6J9IAv0zl7JYsrbZVilAxHLK16vDDIGoOJMwfcaCaE=;
 b=LFjWsVUWiNwA1qDYJZgKtBmSUS7mUlNd9ibvgivEG8yr9DQbsC+mmsIBGm65+ytFVy
 LN2IcyCTxAnl0bWPH9ok0BdagNEdKai9+uKIXNGOdvKNlOP4f3Juazb6pchB8WG5+qRo
 aWq4fNbK0AQc//8va3cCAbRYDHZKQ52Alue/M1AMyRVOr7Wfn+zvUE8EkoR2wB8OWH8M
 8Z3YjiP97rrizwBivm17r5fCo/XEZEc58ml5gQ8AMJaSTyjQIs7tBvrNCy+VBw4hic+P
 ott5LDEK4XYRGcxpiTv0dJc0YOe4wPoCuQybSktbeI2CChhJJ1j90AZdM243yxRw0S+7
 E+CQ==
X-Gm-Message-State: APjAAAV56hbuScImKv0SLK1eg55AbU6Hn1DZilPWl2wNys2ayKKG26A7
 JiPOv9gxJ3PaTlqzzGQJSC1L2g==
X-Google-Smtp-Source: APXvYqzTh+3wz78QqVIF61RJi3ZrM18/U6a+i6EfeUwfI8erDjyoeiuj5l02ifq2qNmxoU3mgHxu3w==
X-Received: by 2002:a63:2c4a:: with SMTP id s71mr16161941pgs.343.1560179391504; 
 Mon, 10 Jun 2019 08:09:51 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 c6sm17308154pfm.163.2019.06.10.08.09.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 08:09:50 -0700 (PDT)
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20190606193012.37715-1-mrolnik@gmail.com>
 <20190606193012.37715-5-mrolnik@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b3865501-dda0-fa4e-26f0-cd837a309f36@linaro.org>
Date: Mon, 10 Jun 2019 08:09:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606193012.37715-5-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42f
Subject: Re: [Qemu-devel] [PATCH v21 4/7] target/avr: Add instruction
 translation
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:30 PM, Michael Rolnik wrote:
> +void avr_cpu_tcg_init(void)
> +{
> +    int i;
> +
> +#define AVR_REG_OFFS(x) offsetof(CPUAVRState, x)
> +    cpu_pc = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(pc_w), "pc");
> +    cpu_Cf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregC), "Cf");
> +    cpu_Zf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregZ), "Zf");
> +    cpu_Nf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregN), "Nf");
> +    cpu_Vf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregV), "Vf");
> +    cpu_Sf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregS), "Sf");
> +    cpu_Hf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregH), "Hf");
> +    cpu_Tf = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregT), "Tf");
> +    cpu_If = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregI), "If");
> +    cpu_rampD = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampD), "rampD");
> +    cpu_rampX = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampX), "rampX");
> +    cpu_rampY = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampY), "rampY");
> +    cpu_rampZ = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampZ), "rampZ");
> +    cpu_eind = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(eind), "eind");
> +    cpu_sp = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sp), "sp");
> +    cpu_skip = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(skip), "skip");
> +
> +    for (i = 0; i < 32; i++) {
> +        char name[16];
> +
> +        sprintf(name, "r[%d]", i);
> +
> +        cpu_r[i] = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(r[i]), name);
> +    }
> +}

These register names need to be permanently allocated.
I suggest

    static const char reg_names[32][8] = {
        "r[0]", "r[1]" ...
    };
    cpu_r[i] = tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(r[i]),
                                      reg_names[i]);


r~

