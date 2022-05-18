Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B152C3E7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 22:03:12 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrPt0-00015Q-N7
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 16:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPrl-0000OV-37
 for qemu-devel@nongnu.org; Wed, 18 May 2022 16:01:53 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPrj-0004NJ-Cu
 for qemu-devel@nongnu.org; Wed, 18 May 2022 16:01:52 -0400
Received: by mail-pf1-x430.google.com with SMTP id j6so3089453pfe.13
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 13:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gi1uaISPziDftKHpdjL1vs4XeXtpv9boZ90GiyH1eE0=;
 b=aYfvDbkIJMjZjOhHrLhY+Dc4YGWZvOcO02toGzW6NIybALaLJoFvwg7pUvf0uJ/GWk
 FX73MAVsecoOZmV6RZpjH2vljseHkTC6Sgc2j21NxDEfC24Smj6esoE+hrkjLJEwX6GG
 EYAm/mqy1f/90OB70/eoWDxwye7HXsD6FHz0bbydHF70c8DCoJMN8U9rOAqKzeqBCqaG
 D03q73MWREPDNBLM/HGv7i9STbpvfFIfCbWrStL/UFtD2PWGjoP0WdFThivdObUfNb0V
 5Cpy4N47XDqLVMGgofDdpnXcZPKI/iJsWte9aLm1Ci/kdhhuycza/kCF3eLadj9l8YPi
 QVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gi1uaISPziDftKHpdjL1vs4XeXtpv9boZ90GiyH1eE0=;
 b=dclBMjUne0jFXTyv1e84oLJ/fJrvP5PdhmYNDR1vXGlwAdauXCdtf9WFTJYivuun36
 HL7E/reo3dNKwxR0jUwzQWZA1LyMvOJKKL5CLusRdcZ/68dDMQ3PqtuYNUTkFxXYh03G
 HuREZvGySl39p21F3/6sRKiSvVVhMcugBLdzRV0uooT0NQhVUrsGtHILICH9z01ZnIuO
 qkBMJq6zBR1vrJCYDyxtszRhuF4C929ARsFXstbnSQGCoZgwo984PiNQfOwDRxGXH0xc
 sq83FHna3bXay+i1Qd7PSwk/X5Y3MEpmI98cMAFtmAWXepCAwXWHM9AyHU2NqanMKkj8
 cXjA==
X-Gm-Message-State: AOAM53246xQhAf8/GI5m3dEDWKynv4R7LGNIveCu2mqz+47fXLefDAS3
 kUwrILQ/Glqv97Sl49D/FAzHyw==
X-Google-Smtp-Source: ABdhPJyz3ZA+dBOYenl+Sgl0QIUvejKZalzXHhn6nYwgIrxF5KBxvIDByQTFqFRMZ8rPY5F1dxeyFw==
X-Received: by 2002:a62:e518:0:b0:4fa:9333:ddbd with SMTP id
 n24-20020a62e518000000b004fa9333ddbdmr972362pff.11.1652904110004; 
 Wed, 18 May 2022 13:01:50 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ad14500b001d960eaed66sm1948861pjw.42.2022.05.18.13.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 13:01:49 -0700 (PDT)
Message-ID: <a79ec00e-e529-5b37-81ab-48aa53414e6a@linaro.org>
Date: Wed, 18 May 2022 13:01:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 39/43] hw/loongarch: Add LoongArch load elf function.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-40-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517113023.3051143-40-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/17/22 04:30, Xiaojuan Yang wrote:
> @@ -26,6 +31,10 @@ struct LoongArchMachineState {
>       MemoryRegion lowmem;
>       MemoryRegion highmem;
>       MemoryRegion isa_io;
> +    MemoryRegion bios;

This is unused.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

