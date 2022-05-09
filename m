Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C0520821
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 01:05:51 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noCRq-0001iB-D1
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 19:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCQm-000136-AC
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:04:44 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCQk-00059U-SI
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:04:43 -0400
Received: by mail-pg1-x52e.google.com with SMTP id x12so13225843pgj.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 16:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m3XJNhX+NB0z2rqqb34dptfBi4nYahT+c0x3YVxET14=;
 b=IqaMrQfIgg7nrP0pdJvpkerb1VW/Vr+QObcUmVHQd5mgSe4c6qfO0vgOgk//J+M959
 T3WN9DyJR47mqKjWEgEvbf9tCjaqoWIJElr0iVeJzn0126tSrhZqEAcDmFjMrS5/lD6o
 NxboUVcDha8YJ6CHNsHhV+PXxHvc/k1Kw832IdAa4ndN65lJzuYnWqIdbrHkqKGp6S1j
 7UZqro1PjumQ8bPKgaPlPp6l2ABsbjExtoMwZVIXP0P6qEHabPWIGM/XTwxUIBBCm+Ck
 oBQU7l/uG0bjVLtpWNPeSlT8qfYqrqpq7b8FmE9T/SHYuoABUwSL7li99Ecy/iEmaG2x
 MkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m3XJNhX+NB0z2rqqb34dptfBi4nYahT+c0x3YVxET14=;
 b=uO4JFcSV6mkd3NMaCS+/iq62JKI2LZtj+UiTxYmpBZtTiGgeqhjwBmIdyh9g7OtP/j
 SrEzbowUnuxE2foTfmLOUoutOAnvgRzHsUMXwjH4OD6eKKYPg4EBOJN/Eg5lh+eZfCDq
 jkf6vu5pRau2JnX4dtlV7qgilQf1cy+niMMXwC5pD4uf0u7aOvgPHJ0QC6UAROoNDckt
 45i4C8BAX0fyVtu+22j4VBncxh+Jt9Qk6cZ+XoY6h67IjRR0EIuUWNdVoaxGeSqf8xzq
 Xw1+OBX5jJ/Z5FA6Hg4l0njEIOSLT9mC9dxy9roy/GLsEmbzb7O08t9nJfqPEMzSowX/
 Zmlg==
X-Gm-Message-State: AOAM5303cvOztHJ56tjwhxSvsBQ5s8l38tqslyNWO2jQD4/paJWwq/HH
 At/nqZqk6vR6OQcRC0tXTK2Kx53huE0uaw==
X-Google-Smtp-Source: ABdhPJxB+NDGmun80dwmfj94+GihUnHuKPA6zpR7dMw+Bw/87aMYZzG7wUZNNEjSyfAp4tiDRjfpcw==
X-Received: by 2002:a63:d611:0:b0:3c6:afdf:819b with SMTP id
 q17-20020a63d611000000b003c6afdf819bmr6737981pgg.513.1652137481411; 
 Mon, 09 May 2022 16:04:41 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a1709029b8f00b0015e8d4eb25dsm398262plp.167.2022.05.09.16.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 16:04:40 -0700 (PDT)
Message-ID: <3cb8bdec-a59f-859b-ffee-2e68ef74f863@linaro.org>
Date: Mon, 9 May 2022 16:04:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] linux-user/elfload: Remove pointless non-const
 CPUArchState cast
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
 <20220509205728.51912-2-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509205728.51912-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 5/9/22 15:57, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> fill_thread_info() takes a pointer to const.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

