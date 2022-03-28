Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68B4EA2AB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:08:09 +0200 (CEST)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxWy-0000kZ-Tq
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYxVY-0007nw-Lt
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:06:40 -0400
Received: from [2607:f8b0:4864:20::229] (port=39872
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYxVX-00038E-7Q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:06:40 -0400
Received: by mail-oi1-x229.google.com with SMTP id j83so17173842oih.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LAKFXHRYBRyiT4rB/Zpli39JJYEGAp4So3bP6gRgNqc=;
 b=xPMZ4aPNyp6+YFA0YCzo+4xIw7WlKBWVgfkaudP2nZPPClbsibkIFi8+LaGI1bE+pL
 BvlS6U2HDvETAuysRefJKlsq+0Te7wIIrluM3H7zT+e1flvHJOXbSkXVuVzLWikONGC5
 WHWuPHLv/tRmMXfMds8z7e4/QC20Eo0SXOSjInJUs2Kr8QxmHqBKhCthFGEGPDYqXLUQ
 Vj5RN3p0F1S9pbq20sjeFlpH8Dxu26q/6s3nD6Qbe75HI8U3n8+7roapqQpS/bZsoSCF
 GhaDVMtt0/Vm+zIMwKIW4vI9JkDGXJi0I9o7JYVxRaC33BAu36/xya4vy/2pNtCBP3JM
 Cozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LAKFXHRYBRyiT4rB/Zpli39JJYEGAp4So3bP6gRgNqc=;
 b=fBdGMR8guXsanOS9deHqc2hE3SKmUam3/gGg6nf7RlZG5c+X4TOSecBpSIupWGvI/b
 HOGJtfl2C3udoMLeUghcRQBs3g34fJ6CYHda+6Gq2G55szlwMeCVdU7AFnP+PmQDOrdI
 jDTMgyjDzmJHW8kXz6SnAAO4u5NZrkIMJs3yVp+3z1Uhg+hhhW6NnXgo05rc3hloB9Zo
 iSzD4NJxAcsimVmEPS7sJBQBntN476zgoRdGzVZzfLESLkHJ6kek1/WUvdVD0w5gT5pO
 xXUs6j7S2TXXgS0ivAHwkkEkremRegHsFFSE+8gGPsi/1gpwChcLOsAV9lUP/IPCBPEv
 ICRQ==
X-Gm-Message-State: AOAM531f7J+8AefXY2YCSDmtOWGhpPztD9AoayWPbVV7RQRfgpT7ZrPE
 t8f0jcMm2pV/bjNtSBCwH/Zsvg==
X-Google-Smtp-Source: ABdhPJyRud8LdGG3vXK8zHMf2OaUN249x9A1XUGVMX/NCdjYsDdH1pCH/1OXLPEzEbXOdeJjtEiNVA==
X-Received: by 2002:a54:4683:0:b0:2d9:9229:7d52 with SMTP id
 k3-20020a544683000000b002d992297d52mr681005oic.91.1648505198033; 
 Mon, 28 Mar 2022 15:06:38 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 a32-20020a056870a1a000b000d458b1469dsm8004641oaf.10.2022.03.28.15.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:06:37 -0700 (PDT)
Message-ID: <90a06328-d8b8-c463-93fd-7c371962583f@linaro.org>
Date: Mon, 28 Mar 2022 16:06:35 -0600
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +typedef struct LoongArchIPI {
> +    SysBusDevice parent_obj;
> +    IPICore core[MAX_IPI_CORE_NUM];
> +    MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
> +} LoongArchIPI;

Why does this have an array of cores?

Surely the IPI device itself should not have this, but the board model should have an 
array of IPI devices, one for each CPU that it supports.


r~

