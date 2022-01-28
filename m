Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E805449F042
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:59:38 +0100 (CET)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFbz-00036r-Jb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFRD-00005U-0g
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:48:28 -0500
Received: from [2607:f8b0:4864:20::52b] (port=46039
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFRB-0004Hp-9Y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:48:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id z131so3791640pgz.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SUm3SrNFqxwGrknwyolaVYtnAH0L4rTtam1QSrKsu50=;
 b=OW3OKu12oZXnnN1+a4oXLrS6eGlOE/j67OmZt5uDX4ZCT6WnxC1QPDZJsXkHkZiWrt
 MiOZ8isGGRbn6fhdonOjH+VAs1FKLrFdyD4eS3fHkcacQO0WqmrqhtdIgMeHbrlePkZ9
 G16kmVjjWGi1hAgBNzb8HbLtnWCsPT7ny3LGSnFrbHhz8BxJywlI5gLR1F3yoPJHJhc6
 ffuJuRX9fTi48CFT5YafvldF+mQ1BeJIYsoioBSwkJCyNcZFRoq264MmZrh2omjiLVgE
 AyeF3sJe2eJhvu9X6kAF93sGqVv6aWEKPlGB7V8v89csGnT1lvv848ZMkszOUvqdsdRx
 TpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SUm3SrNFqxwGrknwyolaVYtnAH0L4rTtam1QSrKsu50=;
 b=r8h/R0Imf1Rab/QWc3I2BSXnG1zyE2iMt0CYRsDeH3Tx4HPBI+Wwo2a3Mh1Z2pkBcS
 fBKsxKLr6ImwRqMjknbMKK5Ar1UdCyzna4E/m3TgQEoHsPA0O15ALVqTj6pEcni+KVxL
 iHqCPb7OEPVH1FcmzVPW8yTAG1clLb4REMqzfUvqXY/v2vQKeciFj/oLsjxF0gPw9pZ8
 nuhbammupUiTfOmT0rc76ENIwY6fYDWugnFLpV8bEHjtZ/xEzauF+xvb+EVfLFqgVIg/
 rnSEm2y7hs3S94pcbhYW+2LcvmTnaE5RWoGZ9zPk+bBzOW159LImK/ZKhMvG7ic+XqwO
 XjiQ==
X-Gm-Message-State: AOAM533kLgdFFZqLww3VnrBr69Wb8KfMAH+desfAfwx7kgz9e5ANNQrq
 fmMV9B1ZrfoSMQjNt7PStCRRag==
X-Google-Smtp-Source: ABdhPJxXvwQf6fiqV1+z3beNHO7L4ZTDtksHXbtp+2OFVPrDMNw7TEgNtL21BMzLNy1YkfDJm4wY1Q==
X-Received: by 2002:a63:4e26:: with SMTP id c38mr4578754pgb.475.1643330902049; 
 Thu, 27 Jan 2022 16:48:22 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id x25sm6834251pfu.91.2022.01.27.16.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:48:21 -0800 (PST)
Message-ID: <d9d28754-201f-434d-401e-5e48f7180faa@linaro.org>
Date: Fri, 28 Jan 2022 11:48:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/10] hw/dma: Move ScatterGatherEntry / QEMUSGList
 declarations around
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111184309.28637-10-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 05:43, Philippe Mathieu-Daudé wrote:
> In the next commit we will use the dma_addr_t type in the QEMUSGList
> structure. Since currently dma_addr_t is defined after QEMUSGList,
> move the declarations to have dma_addr_t defined first. This is a
> pure code-movement patch.
> 
> Suggested-by: David Hildenbrand<david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/dma.h | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

