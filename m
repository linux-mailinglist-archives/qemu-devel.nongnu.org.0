Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F754FAAC4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:29:37 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHiB-00021M-UM
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHgv-0000wx-RJ
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:28:19 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:47028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHgt-0001rV-EU
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:28:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso642044pjf.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+faA2Nvp2x8ZB/mkFPW2wcHKqZWuSr9R3ddZOFX2imo=;
 b=UxI9aXsYA/T0lzofI82RbOU5EGxK3JNEj1VKjNug9MNoGb//t+SqBaoCs3Z5QC1t7x
 qqs6/ZY6UOjEL3e3JwDZ4fCVbz9TJBYU2jIVAyT5ZtLYkSKbCqPYdBJUIEB7aVq9xrH6
 N6TPPlG78aull6PkAmHM2SU9LaoigHNNME1m9avKlPl/pAAWQqysme+iGHqhpue9yRgk
 x/mX1i6sCHb4bl4q8bqY6QWY1yHIHy9CdDwbvioQcFKQ3AeBWkMuhpMHo3FhAiQB4X1z
 teVH9t/XWG7ZOWF1OXjxgRLj+P0DYvY5T3z6KGjd5pOyGGZR2ASDbwILc/a1XLW8d85p
 4UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+faA2Nvp2x8ZB/mkFPW2wcHKqZWuSr9R3ddZOFX2imo=;
 b=nhzReC370inDWWaBjiQwq9xX7Y590Si4fYWW/QproU9ALS+ljKRCdK9FPo8+vLC2nI
 Yyv/nwPYwmwP7vEd6lWL+WMVsmocYPDh/+eiYqeXmjCGft4uAmsFozYx8IPM7/gWnmkj
 xs56HzKT9HUk4O5ocWbn8Xx5nuQErW3cAf1T6DdeVZeoTUi8qVrTbusaPI77B1Osnmp4
 6LfmlXWEbNh3pD6Sj4nd14DBELl89oqAaC/C8Kz6+qwjwLw1dsppU5z3UEbS0X+GAOkY
 VI2vIW6/88Ilf0nrvx/0oN79CJf0MRPePnPESkDZLRgzRpCXGRZNqwxodUOCtIAkFCCl
 QM+w==
X-Gm-Message-State: AOAM531JkmdYPDSOL6vgaMRe/CK0hDYnxSAu41YfnJlyelw7bYrUFMHp
 adOAvSzJ9QpP3iTmY+0wL43Fhw==
X-Google-Smtp-Source: ABdhPJzUul31QNM3fnr+GCr6Fup0shN4ViEi8M0bW6ITrdHUg1rbH9uxDfaTYCSNGtbYViCmjkLqsA==
X-Received: by 2002:a17:90a:b384:b0:1ca:88a5:2c59 with SMTP id
 e4-20020a17090ab38400b001ca88a52c59mr28451568pjr.62.1649536093647; 
 Sat, 09 Apr 2022 13:28:13 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm15235354pjx.42.2022.04.09.13.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:28:13 -0700 (PDT)
Message-ID: <94f0b6a7-6475-ba7b-fa27-e38172da0829@linaro.org>
Date: Sat, 9 Apr 2022 13:28:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 31/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_process_vlpi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the function gicv3_redist_process_vlpi(), which was left as
> just a stub earlier.  This function deals with being handed a VLPI by
> the ITS.  It must set the bit in the pending table.  If the vCPU is
> currently resident we must recalculate the highest priority pending
> vLPI; otherwise we may need to ring a "doorbell" interrupt to let the
> hypervisor know it might want to reschedule the vCPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 48 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

