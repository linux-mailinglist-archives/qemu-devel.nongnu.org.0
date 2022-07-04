Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BE56520D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:22:13 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JDZ-0007a2-34
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JBj-00065q-RK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:20:20 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JBi-0003oH-6i
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:20:19 -0400
Received: by mail-pf1-x432.google.com with SMTP id t21so8568330pfq.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IEpUPe6OelLAnFFUtEwqJArazfaJNRFBOBPI9yOWGjk=;
 b=trAeMPpfCNi7GO/3u3YDEE1xu3oKdssFJK7NlhqNKY+eVzTfotB28HMjLwnUynQU9r
 hb8vnG+WjkpMUDizWkXnhLjgTXL6Btj3mYJDSdvKzwUAMdkj0ZUnR1cZcMtiYsbzy7dc
 2ST3ZGBnIyU6QUtUmyNysMNba6+mboDBGWYJ7Iljm5VK8lfFC4/A2iHpsWodsVKAxWdO
 qNXxZ9kVPNQSm6eXGMd0OGqLZOomwOR9EO/Tq79yK1NDDLPA5SJMbpsWrEUpyvMdZJUq
 J8oKP31vW3smmimzQJKBH7Wh47oMC+nSJlsVIsmzhZIFGz8c95B2znM5MlwXwd/uwOS0
 nYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IEpUPe6OelLAnFFUtEwqJArazfaJNRFBOBPI9yOWGjk=;
 b=Qq1orgAd5BmX9JylVBs9z4neZrMv8nJJWz7EyyWPJbUAm3FrrTa0eYfAk77RK9ijJa
 mgxwdh7nOifZYI8ZxRpZlxOHNNm3VAT1Bn5K9SMCeRWZNS0njdCoXVuaaqdT8QRlL6pk
 QTN+Ss6KvWh51MGCkDGPy/ZA5CUVd7vfcCmJU5D/LnQ55k7UYobDmuTcTcgW5hItnROF
 T5BPM2YIiLxWe47eiP+jEY/HoZ8gCtP2ElzzxQoq10Z15Ttmk28ybmPKbPUDSYFRPc70
 qAQ26wnjViWUELND7+CzNcRxJVQAlmaJ+jMbaNRuIBOFm2DfDYhJvVAgd8oTJFqOgkgb
 oe0w==
X-Gm-Message-State: AJIora9N46KA3VuTJAT/ODozlTPm1trCi+r94VnwbCc1s6Uhwq7HVk6T
 0Uo3ECNiO2BhKza1xubnHBdonQ==
X-Google-Smtp-Source: AGRyM1tdsuw4a1j9gy33F5H6/1lCJNtmcoHDg3JPe0urArTe9CdfL96TXQkmJ0C4uBCkAT9O6q1zTg==
X-Received: by 2002:a63:2014:0:b0:411:90a4:6e9c with SMTP id
 g20-20020a632014000000b0041190a46e9cmr21751683pgg.500.1656930016820; 
 Mon, 04 Jul 2022 03:20:16 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a63dd13000000b00401a9bc0f33sm19926332pgg.85.2022.07.04.03.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:20:16 -0700 (PDT)
Message-ID: <73e221ba-4680-48bb-6472-95ea01fd9b37@linaro.org>
Date: Mon, 4 Jul 2022 15:50:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 09/11] target/openrisc: Interrupt handling fixes
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-10-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-10-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 7/4/22 02:58, Stafford Horne wrote:
> When running SMP systems we sometimes were seeing lockups where
> IPI interrupts were being raised by never handled.
> 
> This looks to be caused by 2 issues in the openrisc interrupt handling
> logic.
> 
>   1. After clearing an interrupt the openrisc_cpu_set_irq handler will
>      always clear PICSR.  This is not correct as masked interrupts
>      should still be visible in PICSR.
>   2. After setting PICMR (mask register) and exposed interrupts should
>      cause an interrupt to be raised.  This was not being done so add it.
> 
> This patch fixes both issues.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

