Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD63F75F5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:35:58 +0200 (CEST)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt4P-0002GW-CO
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsot-0001aL-7V; Wed, 25 Aug 2021 09:19:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIson-0008Ns-Ox; Wed, 25 Aug 2021 09:19:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id u16so36434273wrn.5;
 Wed, 25 Aug 2021 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4V+qDAXAAShPHx6+xqOJ3S5BoNUoTbi42ucGsipfl0s=;
 b=W3DFFN6Z9O8jSHqf2mgN/l6SUCYLpuv461NxLbO86G3O7hIoBFLlGPNi+fn9IoUOMW
 5uyn6KLQ9xMI3mtlgOjstKYDZhEs487Zo15Y7NcrTUvd7K4qzXb5RziWbZWRYQh2uqL6
 tCkwGRaHDEfe82cm+BsmwZlbneoIWThsw72c+/HGyzQGOf/MfkbNsKZtYiG7NwyoU4vG
 TpbMZqa86Gb7fa66odpHIL1ROT0fk+6Bps6tsketqq41jU5JjbCCCSRINt8c8OkgNwLZ
 Rjq1pkI2TLWooORHYl9gyvqsCeM4hAk2IJYYUQ4K6e4ZFM3ycKaJ2W2n9tgBWFKD4TC5
 VRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4V+qDAXAAShPHx6+xqOJ3S5BoNUoTbi42ucGsipfl0s=;
 b=ZpcGzgKAP44Td0oXO4j9QZuqD7QIwjWCGDNQbh+lxep1OvvHv1GC+vij/oCSW+bS4d
 PrcBqCeJ9SJH+1MnqpXDXbKJKml6TDsqIV5wgXRyjLxS2618kgahDPqV0/QMAKG1+48D
 T9Rv76y9DJfaXHIgeSCyrJ35hdLh22bZYNlGY74Db3Cl+w55Lgyl13ZJyrS++OhDNar3
 O1UYqWI8uJWzUoM9tzP0+k7+Fc4ZIf3TkgUC/ocF5IYDHzb7+I1dRXPCzHT46/5Leu9b
 60/d0b3No8nOwAR+GRYIL6P8wIhTEPRCX9fpPvhHHjDZBaN1KBTLE8VKRdd9dZKOvxhQ
 kmkA==
X-Gm-Message-State: AOAM530KVT8ylDnH6xuXY5GAz0/DBlIVD0fuJTluzjmZIXtXXL86FjZ4
 bFVeLOTFr2wWXuahCt/n9EI=
X-Google-Smtp-Source: ABdhPJyJNLxHz4BcDa+G1DJwu4vH/NxcLNDOBkw35ZUwxR39J8ALyVaLk+Qcujq4+Bv3+Lx/3V2iXg==
X-Received: by 2002:adf:e901:: with SMTP id f1mr25356880wrm.13.1629897587952; 
 Wed, 25 Aug 2021 06:19:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p13sm3743047wro.8.2021.08.25.06.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:19:47 -0700 (PDT)
Subject: Re: [PATCH 18/19] target/ppc: Move dct{dp, qpq}, dr{sp, dpq}, dc{f,
 t}fix[q], dxex[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-19-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd665092-0eec-5acc-e7fd-1c3f8b824a3a@amsat.org>
Date: Wed, 25 Aug 2021 15:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-19-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:27 PM, Luis Pires wrote:
> Move the following instructions to decodetree:
> dctdp:   DFP Convert To DFP Long
> dctqpq:  DFP Convert To DFP Extended
> drsp:    DFP Round To DFP Short
> drdpq:   DFP Round To DFP Long
> dcffix:  DFP Convert From Fixed
> dcffixq: DFP Convert From Fixed Quad
> dctfix:  DFP Convert To Fixed
> dctfixq: DFP Convert To Fixed Quad
> dxex:    DFP Extract Biased Exponent
> dxexq:   DFP Extract Biased Exponent Quad
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             | 20 +++++------
>  target/ppc/helper.h                 | 20 +++++------
>  target/ppc/insn32.decode            | 23 ++++++++++++
>  target/ppc/translate/dfp-impl.c.inc | 55 ++++++++++++++---------------
>  target/ppc/translate/dfp-ops.c.inc  | 22 ------------
>  5 files changed, 69 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

