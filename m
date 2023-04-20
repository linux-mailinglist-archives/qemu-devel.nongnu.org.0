Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0D6E8CEF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:38:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPni-0001bu-KZ; Thu, 20 Apr 2023 04:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPnh-0001bm-1i
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:37:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPnb-0002Qp-Qr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:37:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1763eea08so5014415e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681979869; x=1684571869;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5vy/lOTbEcwmKJq6ieBXo3ojzcy1KVveZHrAMeZ0XM=;
 b=e+9o3MUxtqQk91qFXrxIvooaKS+11YD5Cn9IfLwmBWzH5Sj9IJZQNIvOQ9sG9H2ox1
 7yaGmSlsEmC/Svng9tpBerm2Z9ULK91fBZR7/+k1KjYMNHHit9c3kMWuuKIpLjuEcJ48
 zYX/U7wsg3CSq/oXGfRX8uL7w3MoR74s/fKoZ35eVoN1dwMaFgSREv62GaC1iKSiSiZP
 Z8yWMPaLK4UZnQ+59uc8kttirti8a5BvfI5vNKE/bT4eRcrS3Lb0Oeaez2YS3naJPh0v
 Jig9IOofgZANewP9I/6Dt+TkQtCgUcDa6AYg5LmFcqKz/vIIbIC1c2y9zoymwewsnQcF
 smfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681979869; x=1684571869;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5vy/lOTbEcwmKJq6ieBXo3ojzcy1KVveZHrAMeZ0XM=;
 b=Vk/vP6K980B+SxY94pjJL7aK1PKKLa7zSsor+RTpfob12phCKVgdk+gQld+x3YwyiD
 teV0oOqzGjajVJqBRJDT7xffsTvV6FpUEQ+omEaauMwTlLtbJ0mYOOU/kIWa98zpukuM
 IhtF9Rizsez353PEJWTT3kKGFOP4D75Oon5GFqocdIXrSkrtseE7uIoepqYc94eLsjSV
 2uKwfyqZrTj6RQ57kXCu9LU0DcVIJYQ74IJ6Rb5GNfJaMTSjSjiOvQTrIOqtpZze81aI
 238MfB7CoEmGZA48KaqBBOrQo2q02N9zKLfMDtwuzlQHlEkwaPHoATooaKIAbWjDJtb2
 xgBA==
X-Gm-Message-State: AAQBX9cJpNc4lpoj/U+o+nNM0lHsiV2NrTCOCptDJAyzs+tQ+e51SydP
 mca1OjK/PxAshW1rTwsGA/fr78SvEkLcAxd1e/ZYRw==
X-Google-Smtp-Source: AKy350Znm1A7t/zfAk35WZJel4DOtNdibc5wa/jJg3UQSB2LSx3JRWhMLa/0gV1xRL/0Mq2qgmSv9w==
X-Received: by 2002:adf:ef51:0:b0:2f8:6c01:3bfc with SMTP id
 c17-20020adfef51000000b002f86c013bfcmr643378wrp.30.1681979869118; 
 Thu, 20 Apr 2023 01:37:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6204000000b002f900cfc262sm1313139wru.66.2023.04.20.01.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:37:48 -0700 (PDT)
Message-ID: <2c1552f0-4ee4-a65c-6cf4-5b32c028213d@linaro.org>
Date: Thu, 20 Apr 2023 10:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] softmmu/ioport.c: allocate MemoryRegionPortioList
 ports on the heap
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419151652.362717-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/4/23 17:16, Mark Cave-Ayland wrote:
> In order to facilitate a conversion of MemoryRegionPortioList to a QOM object
> move the allocation of MemoryRegionPortioList ports to the heap instead of
> using a variable-length member at the end of the MemoryRegionPortioList
> structure.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   softmmu/ioport.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


