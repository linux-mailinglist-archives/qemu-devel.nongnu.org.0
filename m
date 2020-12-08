Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAE2D35C7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:05:46 +0100 (CET)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kml7B-00080I-Ep
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksF-0002Jk-1q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:19 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksD-0006Vg-6x
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:18 -0500
Received: by mail-oi1-x244.google.com with SMTP id s75so194270oih.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pxqZFKpCxt1YMmCRnRmZFTodNYlQR/RONK9lMwj2jVU=;
 b=zQsbgGjWu6V+B5JVuOMuDSb5iEFt9eGLaCETCMHJ4Y4LiwqkIM4bpvJpoyjgswnSvh
 VFNrxj3Enfx7IaHU3w3zhToIokBVbDMqBRo9UsibkOas7+y7WEghw7LpHZ3y+Gi2vYmn
 TgWdrwWsIrs09dxVpWdxQRFqSeqWDe0xmejWRYd08kcbT7b0y+KHP18wNQJnSI7Nq6RF
 cU4TeqKQpE/uP1aXL5YJ31MJfO9h2XyvTlmhpzWUsgDL3V4Q7u91W6Jgln4ookg2Hgeq
 nbEGvNE1/oggaTiREELMDLOux8IHwJF7WYXV8wS1prTkRdTg0t/QQL/t2EVPcwPISMq2
 uWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxqZFKpCxt1YMmCRnRmZFTodNYlQR/RONK9lMwj2jVU=;
 b=Qo0O4So9DKGQLodZnuzr/p6Ak8JO9KroYMzCI4llXfvAwLp9Uv2SdIAV7HTuhxH1+4
 P7mB5xZo3336kLBXYp34B5dz+sJv/cqBmo3L3unGgJHTEiBqmz+rAS+GYpiVGYfN/hjc
 bApsj+2tq9HewcW6vGSiIJYBlTuw0EGn19D/EUDXVl2tAsbYlW9ldMT4ILgJXKjTaZM6
 aMhVmylNhyry+nkqdk+go5sNB1G+CkJ5nMpZcLkFrDE2kdgrq0M2FiPDvWIa5xof1hsa
 YxXODvTcxSqNFDP/oUvsKPet+4RnCdclVjMfr3TEtNmnp00Hbz+mQDq7v7THr0MoLj3j
 FFyw==
X-Gm-Message-State: AOAM5311+giA5uSpbK0C2OcUrfDp54U9r+pTAn8YyyyCyX79KuzEOMB7
 AaaED3nfl3ReFcr04vbSVuvcuw==
X-Google-Smtp-Source: ABdhPJyOnKjKPWWhZgg3fUUBpi/TPH0TvxU3LEnX8ziNkxQYFhzUdC0YQlrp+RhoLJXoD77tBSCu6A==
X-Received: by 2002:aca:4c4f:: with SMTP id z76mr4460421oia.1.1607464212745;
 Tue, 08 Dec 2020 13:50:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x20sm50652oov.33.2020.12.08.13.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:50:12 -0800 (PST)
Subject: Re: [PATCH 04/19] target/mips: Remove unused headers from cp0_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94c54de7-0a03-2f4e-122f-c921e772be7c@linaro.org>
Date: Tue, 8 Dec 2020 15:50:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Remove unused headers and add missing "qemu/log.h" since
> qemu_log() is called.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cp0_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

