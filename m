Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE951EB28
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:57:55 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnX7K-0003Kh-4T
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX4D-0000NQ-DB
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:54:41 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX4B-0005V2-OR
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:54:41 -0400
Received: by mail-pg1-x536.google.com with SMTP id 15so9287348pgf.4
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mwAtoGhFF5NacqFxasauthR7ayEJ+0prhQAxzOSQEDw=;
 b=rEyZ0/3C10vcsF8Oanjh2JvwbFWAr+IDyomUURYJm1eaOnjq8GaDFVNdSwmNnhXZ7e
 cHQtjDOsUgzY5dlVBhmY8tsXRL4USqoe0fr3X0GcrDqBY5T9L3nElWyLUa2sjxKdT2Qe
 /z+H2st7tWnWJa7eqqUo/XbuirsiRVSBSJAHvxNcMCocQsCwQ/3ZK4k9dIZBRQhW1rlZ
 9GYvFL7IHGT97D85XNGPrTXdYqD3NnZtUX6PyvQFMYhekMgB0M+dXpiBOH5DSYSsBL62
 iLP/9+syL8Rzrl5BJdagxol5v1yKmiU+saX4bG4vPsrwKwPrOG0dz8r8qejF8eNVulN3
 w5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mwAtoGhFF5NacqFxasauthR7ayEJ+0prhQAxzOSQEDw=;
 b=g/2DARHnR7Ai7FUg/hsXckn5uK4tzUVz2ux55qkyKuhHQvie23FpNDlZQSiWsROlDD
 NnWq5RAZpMZlILrnRGzULKjdnzfGBBI0gw4YK2WE1zpxZRQIu1fk9qwuEhctZ/PWfSvk
 EPdNTAU+Ji+QvX3z7rEAbXefPxdX4icOecIDhCIH2I0WjrmN/obkynPDAlhAkNK/KwyB
 kfSULlbvYJHriQWdxClPd9tGFg86DCQBEJ/wIYTDBZDl/BUpAQTDJDOrdKXja02qZP1p
 lhsMCaDyMfDUaICpCF7iLrwUyX9LZMg6AqefQF+g8ZLSuA8AegIjoKwZovwIkD2tpUsY
 95Qg==
X-Gm-Message-State: AOAM533Rirv0DbvySkMFHPY2GXSH/wb2gLkXbpASe7+q4IUqy8ca46NZ
 ZXdEwoelpk0BaMNz62yKk7lQgA==
X-Google-Smtp-Source: ABdhPJwe0oGjv8dr7+JQrnAEJYy73HF1Z4gVAuSSWGh8QBYSPH4CNRisNIMyRMvaRVCNFZyFgV2DZw==
X-Received: by 2002:a63:580b:0:b0:3c1:a780:59f7 with SMTP id
 m11-20020a63580b000000b003c1a78059f7mr8239771pgb.76.1651978478098; 
 Sat, 07 May 2022 19:54:38 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 r9-20020a056a00216900b0050dc7628195sm5828817pff.111.2022.05.07.19.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:54:37 -0700 (PDT)
Message-ID: <ce327b3f-6539-2bcc-680e-ba43345d91c7@linaro.org>
Date: Sat, 7 May 2022 21:54:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 38/50] lasi: move lasi_initfn() to machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-39-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-39-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Move the simplified lasi_initfn() back to machine.c whilst also renaming it
> back to its original lasi_init() name.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h |  2 --
>   hw/hppa/lasi.c     | 10 ----------
>   hw/hppa/machine.c  | 12 +++++++++++-
>   3 files changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

