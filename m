Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF23D9D88
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:17:44 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zMV-0004OK-Js
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zLf-0003HY-6F
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:16:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zLd-0002BJ-Od
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:16:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id m12so570610wru.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uLr+rckiadF5eGNMaFD1Bi9B02AF4RFPMmN7e0jnbB4=;
 b=Z7OCz2lZVZVBeJJXMgnr1DI7QsgM25K3bbvO0aUBf+UAsCQRK00bDBk40VBtmrFjTQ
 6Jo30A4wF0eSjy2AFZffgOC8Fz/hVRhoN2oxT/Z/XuOYkDI8tOoHZhdi/OI+TbkTTaVc
 F6knYjA6iMkQg7E00BHWRAIUB0ju035Gl2ZB2lz9fiL+JX/FlniDNRx+eKL5Beyk9R7e
 aQextjemdsNIs1M0CAMGp1ShRykFPsPqhBy7dyq361iMv8ytG93Q3k85Zk0Qx2DoJwkK
 1K4tcrhyRMN8nP+HtSMmL1ym4Dthr8XkqA5CjdOCAM6SatzICkoQ5PMh7BnZNMP6PFTX
 iwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uLr+rckiadF5eGNMaFD1Bi9B02AF4RFPMmN7e0jnbB4=;
 b=ZwWb7iILVoKkep/jbQdZ//EOxOGsBoO8LxXfq1UHVM+7ptbOOqY0z6l9krxFh96bM4
 GY0Qalzo0K36nBq0Um+Eai4P2C6Vl4333PJ/oefnRBYXaoaBI5HZo6lF49PA9qrSPFGa
 doZge85qGd0j04rn6Ibi+llFeWBGQndUEDT9dBoDsYuJmI1DnH80IUw6zvbnifrBHjXZ
 j1DFU/fVitdMS26Gg3LJmxs2j2hpieJRxl9s0UopnlMRm69zQLsAHfxylwLoo16lIkU7
 TMrWyJOx98a56jANiDKQ72bAE0v6l65oLMz1aBKYigpZoAJqBfV+pwELsMyuL2xexsf+
 u7bw==
X-Gm-Message-State: AOAM53055bftJTUwn8/npTffoKd9pn5fE7laxqO5s/Zv1E7f8N3OUQBU
 alylA0NDZpY2ufJgUeP/Xac=
X-Google-Smtp-Source: ABdhPJxP9a8HI8QI1dFxls9AVD+NjQrCsCyMYeI7uBpQ53f5pHapJLqWbVUUjebIhZ/WDabDt911FA==
X-Received: by 2002:adf:ed50:: with SMTP id u16mr2899617wro.174.1627539408341; 
 Wed, 28 Jul 2021 23:16:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p5sm2425822wrd.25.2021.07.28.23.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:16:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 13/43] target/sparc: Remove DEBUG_UNALIGNED
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c7463cd-b3dc-2a27-9969-1d072cdd8cd3@amsat.org>
Date: Thu, 29 Jul 2021 08:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> The printf should have been qemu_log_mask, the parameters
> themselves no longer compile, and because this is placed
> before unwinding the PC is actively wrong.
> 
> We get better (and correct) logging on the other side of
> raising the exception, in sparc_cpu_do_interrupt.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/ldst_helper.c | 9 ---------
>  1 file changed, 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

