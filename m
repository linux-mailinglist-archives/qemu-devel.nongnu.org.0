Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF741FC5B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:44:42 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfJh-0004xo-Gk
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfI0-0004J8-Lf
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:42:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfHz-0007r4-8d
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:42:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id m22so14795887wrb.0
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TmC1Sz7wA2sjxjko41cOTfpCf3U+bXc0R/mSlhy/5nA=;
 b=BMY8Kxsb26y6r1qQdQvsIdejW6IluwRLsOdSJgPHFxM+d5pvE3KXLaL+Qj8ZmUFZTX
 s888HkDVCw2IOQibXPn6aLO6ReHQ3GNNkxBUHkGcWmg6jYNKZkPPdJQxIrgjWL9HtYjm
 CR2YLN/OP/9FL+qjWSjXs3AWR89FgUCn6ULge8F6wB5LsDyRU8WJGeKV74JBYCiudr7c
 jsFomqdSlKuSeoXrtludOG2xYx4N6uzmEsYFqu2ykg4xpOKg+/5f42z0QZRhGlKQOeoP
 2uijSoW5+ClSCIrN0WcLnvBRfkelZTiuxhs6mR8WKE5L56zR7kd0id9NOn0EdP9toaW1
 dQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TmC1Sz7wA2sjxjko41cOTfpCf3U+bXc0R/mSlhy/5nA=;
 b=qI8Lk8aC8cpMxe9Hj/1uNir6gxbQQKFXu+S8dmNxEAdWeoZJz/ub5MUSyW/uAh+cpk
 ZtnIfcJqQAgdlfP+B9R4gPX/qoYumJJ9vPLyABBAtdF/9R6yv2RXKSPcRF4I0Z5W6sS7
 TgpK/Bk+Cf3Kt25qptFJVCLlqD1mB8psuQIkH5cQjtPzV9SbaHVEa+oPF9SqVvfTwfGv
 R2JEZcs8+OHiOnjygM+mwxwyuGiOV7yan30LOvaqsrdCjZER6SR8Z1RtguB8C2jzmPKJ
 4ir/mh2ECiznJwAU5VxNYvUx6dzYofcRDNvfpZicbW8rUrGuh6YbYOKuzzCLAQo/p7hN
 ox0A==
X-Gm-Message-State: AOAM5315hPtMWA7V8H96eq90EXOFNTS0JirkyBA+upEJRek1RhVV9rtb
 g4rGHPov9Psqg2TuvO5D4a8=
X-Google-Smtp-Source: ABdhPJxShXbzgxWlBNjYMMIPysXRcoqIWWBQCsa+rluyDlkm5NeICMoGQkrXQjgPfvKjxL4cbi/Szw==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr3622045wrp.279.1633182173852; 
 Sat, 02 Oct 2021 06:42:53 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d24sm8554967wmb.35.2021.10.02.06.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:42:52 -0700 (PDT)
Message-ID: <575ad744-0dac-b0c4-15c3-d12d5211833f@amsat.org>
Date: Sat, 2 Oct 2021 15:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] nubus.h: add ULL suffix to NUBUS_SUPER_SLOT_SIZE and
 NUBUS_SUPER_SLOT_SIZE
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, laurent@vivier.eu, qemu-devel@nongnu.org
References: <20211002123101.14675-1-mark.cave-ayland@ilande.co.uk>
 <20211002123101.14675-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002123101.14675-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 14:31, Mark Cave-Ayland wrote:
> Coverity thinks that the slot_offset multiplications in nubus_device_realize()
> might overflow because the resulting hwaddr is 64-bit whilst the multiplication
> is only done at 32-bits.
> 
> Add an explicit ULL suffix to NUBUS_SUPER_SLOT_SIZE and NUBUS_SUPER_SLOT_SIZE
> to ensure that the multiplication is also done at 64-bits.
> 
> Fixes: Coverity CID 1464070
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/nubus/nubus.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

