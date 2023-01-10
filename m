Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01010663A66
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9cS-0007Zq-Qr; Tue, 10 Jan 2023 03:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9cH-0007Xv-B8
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:04:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9cF-0007oK-Ms
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:04:16 -0500
Received: by mail-wr1-x435.google.com with SMTP id w1so10824604wrt.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nmDqK+qwaobCGlu6HmufPppNf439YWNMTe1H3Hw6FxE=;
 b=j8P8Yy7QwvQ1aIEib3dDZqbPTW6nLd/sQc8sCblk70HvglbLGv40ALYHpyF0rvg0GP
 O6/dLXJgQLdedP+vGGurRuQ4Qz0JgVQm/8oaJaSiuUO8VFs3a2MPj7R0l1mlgIUp1RfW
 IMmSR4y0M1eMnY3knwBh+y5kcv/5bI6oUbTEgK/cAfCv4F7sDkp3ONYgWV8byB+Wu0eE
 X4bVKjAFGjuWu0PGA7QKT6QWaAfOu61IWk9+dy7vWsfYWy/rvRmHiuOavPMUINCilgeB
 rcgE6uxRNADObLFRaBc0oFNKEyweW4dPCzUnBv9oHQy3B4oD6yI63AHN3XKxuvk8CtLH
 7P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nmDqK+qwaobCGlu6HmufPppNf439YWNMTe1H3Hw6FxE=;
 b=agVsHzlxzq8TRgi9C+s4iDKocZ0NwxhPeyqncSrknClZVC05aJ7RneKH32ULQzPgGr
 QJP0ggoGHQTHkHNi+gUOM0OliiH8cxBk6jXEMjTomEflF44YSa83810GdqDLMH8OFhJ9
 mz1htjjdlP2B8NEkj1VtqDlAz+PppbpG/1NuhXxEJTucypPXAGL5R5FoM2ecuMIM0Q55
 Iiu2Fm6qMeqYTEXOpu5hEB0vzBEqpBhT75/lOGUE/OGJyrzqUtz1NeWRR7X7i6PLbHjJ
 saPxQ2sxtSoFSSvJgx/EZgtrsD0vPZqzO7Fv86I0vQYaYwhsTlIhKanPw/IRRdYReOB4
 xBKA==
X-Gm-Message-State: AFqh2ko+wRDzIm1pU/yA1j4rEucjpA1IHP0voyt10u8AGLyDNfd64mr8
 lYV74+9DLQUrVKktmgjl7vywVQ==
X-Google-Smtp-Source: AMrXdXtINly5ZBB1KZGLIpeKcCDjnSaW648i4kP0noBdu/gtEZ4UnO7vywOl4+CEXrJQtPxDtzCG1Q==
X-Received: by 2002:adf:e38e:0:b0:241:d7ce:4383 with SMTP id
 e14-20020adfe38e000000b00241d7ce4383mr43306180wrm.20.1673337851168; 
 Tue, 10 Jan 2023 00:04:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm12263375wri.36.2023.01.10.00.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:04:10 -0800 (PST)
Message-ID: <3940b511-221d-dd4e-f3e2-d1a82d57f8b2@linaro.org>
Date: Tue, 10 Jan 2023 09:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] hw/isa/Kconfig: Add missing PARALLEL dependency to
 ISA_SUPERIO
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230109204124.102592-1-shentey@gmail.com>
 <20230109204124.102592-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109204124.102592-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/1/23 21:41, Bernhard Beschow wrote:
> isa-superio.c, managed by ISA_SUPERIO, instantiates TYPE_ISA_PARALLEL,
> managed by PARALLEL.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



