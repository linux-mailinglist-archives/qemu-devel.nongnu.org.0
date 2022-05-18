Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B752C0EC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 19:20:10 +0200 (CEST)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrNLE-000114-Sq
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 13:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrNJy-0000G7-4d
 for qemu-devel@nongnu.org; Wed, 18 May 2022 13:18:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrNJw-0005UA-C9
 for qemu-devel@nongnu.org; Wed, 18 May 2022 13:18:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id q18so2379213pln.12
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GpnBWr3jNFxTMS1wWKxtY8YsqDkeVhdG4OVgRKfIlmE=;
 b=jeKL2omWrUi7myRJexRR+rAF6B5243jrZYl9800e7BkzReazsynL++UbFN2/5YO2cv
 2yd22PeuJvfizv0Km1VaaH0Ovff/vN/m5hyeZdz3qjLC7pY+n4cJwYB2OvxiScoAZEW6
 kY0+r3ITgANMWPPtuHei2FiRY634HjlvOWfEDJ7BdDd7EM+jCHkA+H/dSMf5ayAq3nRh
 hKb/ZSfHAIl1gxGkeT/TfzgooEFshOaCMwqPGVKmJ1n2ocgOHoDUlGTGR67XAHxOZtJm
 L+9dgJGIeq1amLFfY6CTBZkeOFGSLUu3UYC2i8BfA1cqGfPl0l8kxrI57d6S26YLW93I
 H6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GpnBWr3jNFxTMS1wWKxtY8YsqDkeVhdG4OVgRKfIlmE=;
 b=oNdX8/LT+eJ46UM8RGQ0o9ZGuex9rlYkU12C5tAa+wHoa1yK0wHWRX77WWOGoJ9EXg
 bJZdpPDjFD5unu27NT4vLdkzjZY60Acux9kTOUPStKwzgRGFdM3SOIa7oz3zifNn9npv
 TBGmjguu9QzDOK3LkX8RmEqNUcbIM3h6KHwiuof9Lw4a22NNB+RoDEUeDEeFT35tJyg1
 clCDgpts2TaIPC0EMSya07mpOtHzv13E+Pn/3qqZz50voDjULX51ASLcuPMJg/PzQ5rU
 kYFSrO6WAZEAS6kgqXrOhCGIoazGXOKJqzD8JS/NctDc+s128uQp8lmZNrj1DyeRbIjz
 /xfg==
X-Gm-Message-State: AOAM532+1CBqzIfSUU4O+VRUm5J8s3lACkb3D/1MjOnbAd8paPo4y5yv
 Rv5CB9kVuvFe/MpkRDqO0tUFQw==
X-Google-Smtp-Source: ABdhPJwymO4AL5FwXO2idBgGomZ/8Yzax2nYgdOrpLX8at8pRxRr9Fj0DKGxREq8Jm7dlcpS/USBuA==
X-Received: by 2002:a17:902:8bca:b0:15f:28b6:ad46 with SMTP id
 r10-20020a1709028bca00b0015f28b6ad46mr574995plo.69.1652894325140; 
 Wed, 18 May 2022 10:18:45 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a1709027fca00b0015e8d4eb1e2sm1978998plb.44.2022.05.18.10.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:18:44 -0700 (PDT)
Message-ID: <0e9c3f0e-5a13-8346-ccb6-eb05a166a20d@linaro.org>
Date: Wed, 18 May 2022 10:18:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-26-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517113023.3051143-26-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
> This includes:
> - CSRRD
> - CSRWR
> - CSRXCHG
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/csr_helper.c                 |  87 ++++++
>   target/loongarch/disas.c                      | 101 +++++++
>   target/loongarch/helper.h                     |   8 +
>   .../insn_trans/trans_privileged.c.inc         | 264 ++++++++++++++++++
>   target/loongarch/insns.decode                 |  13 +
>   target/loongarch/meson.build                  |   1 +
>   target/loongarch/translate.c                  |  11 +-
>   7 files changed, 484 insertions(+), 1 deletion(-)
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

