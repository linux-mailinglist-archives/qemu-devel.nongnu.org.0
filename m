Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C351C709
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:17:35 +0200 (CEST)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg2h-0006xT-08
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfYe-00025j-Ud
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:46:33 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfYd-0000F0-8S
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:46:32 -0400
Received: by mail-oi1-x235.google.com with SMTP id m11so5064444oib.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/6kjGji0MCDChSGL5SXMF4gPTdhnqq07mbuoiL/jtuY=;
 b=B0H/xL9wCLbfkxaiPuH6TkuyP+ZiWr8ehB1vxG2J6caNmx6WJib1EptQ0W/mQxTO/+
 0X2TsdveWeRdL+A35euYYSE3e8RqW2w4wmbncB7YO0aE3t4fnUtLXl1KgQ1vKgE20Xc0
 siAaHGFc+fHHByWN+JlAMgDepnrDr1o5WjoCZaHo5TSwsvdJEnRvYBzPc8rEin5DPskB
 Py/dLZ9/4x4EfwX2P2zHSyjxvGR/ugK28vfFdyjWCT4eKbGXaWFmWEL97CReSJ7gf+DY
 AYYoDZIdGy3fu+WTSoCO/b8it0SRIl+5wYl7TkWopVQaI2PQ1PI3CnErcdRdKCaAD0l4
 O60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/6kjGji0MCDChSGL5SXMF4gPTdhnqq07mbuoiL/jtuY=;
 b=azwu15ow2JUOJhWx5sqM46sY0PdrFk50g4tfdVoJY0YuIF7RDvDu1qk5zU3RwUTTe4
 Qgi+ovNYmCZDbOo4RWnXObYQ5zel21FztWC8erI46uyo2aC7SgGQflnhfl2imEYofLHy
 +3GGs7zRqNPFuKVWn2hDJLvqeq3YITx7cmzOI01J62oUGjgfmiDTEK8EJx6L8Kft8h8e
 TTPcjekPCmizaRJ8iC3Cb0CdXzvdUds5T/RYva86XkuPvTVegwXjOVGN4s/STKqb3OCr
 aDJ9DSReHp+kPyTzK1kB+akw5zcRRQkF666GMc3aZGabCM4iYjGdRRMEM4q7mZgNzWlU
 7yXQ==
X-Gm-Message-State: AOAM532HTtgxMRuAmIQfwItWnUC1dgorMmspROSNBKlmWYeySGObDomw
 4eTZXYusDI0NWkRZgczy5mcZuw==
X-Google-Smtp-Source: ABdhPJzentvnefYJu8gAgvOjXo/Ic5vNNghcRl8ngJR+S4azoDR+DjP9WCl/oMyF8AIkZDta3v3QmQ==
X-Received: by 2002:a05:6808:e83:b0:322:3344:13c with SMTP id
 k3-20020a0568080e8300b003223344013cmr2915840oil.233.1651772790184; 
 Thu, 05 May 2022 10:46:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a544515000000b00325cda1ffb8sm830427oil.55.2022.05.05.10.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:46:29 -0700 (PDT)
Message-ID: <10c162fb-ad53-0de8-6bc6-ec61d1683f33@linaro.org>
Date: Thu, 5 May 2022 12:46:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 15/50] dino.h: add defines for DINO IRQ numbers
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-16-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
> This is to allow the DINO IRQs to be defined as qdev GPIOs.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

