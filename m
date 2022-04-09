Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF664FAAD7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:43:08 +0200 (CEST)
Received: from localhost ([::1]:43284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHvH-00022o-OS
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsq-0008W5-6E
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:40:36 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHso-00049S-Jr
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:40:35 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso2317828pjj.1
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ltVuTEgyQJKYvNjM1Q95U83FfiVswzhYCc3xnZ1LS/Y=;
 b=TwLbpvJXLVqJS87UKez1MUtfOEon9n2o+Kg4a96od3CUNhcDqAzi5e6aqJxcwaLi1S
 umDf4z+ook8HIMgoavNxJ+qpt9zLbNS1LypTjc0dU6AfWVlTuuT1K1Duql4qkRD57wxb
 0wHQKN2rTmiZCqT995Wz7m2xL5veABay3NkZuY4bKMMzhZk03D47QVBbE8xwXTJRHMba
 2Pu0DHiqnFQn0NY6TO3gtZsqy9/kbScfn6jlxBAxLd6fqpCt1cA5f/dHziTd1C1zF4H7
 CoPz7t9wpkUiQ7D74TOnLa3+NFxwOnykT+nj1M427mcenbEm+0OR1RrwLwb4Y8rjKQHX
 VIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ltVuTEgyQJKYvNjM1Q95U83FfiVswzhYCc3xnZ1LS/Y=;
 b=RZKiEVyPIZjkNDc0NjCqul9uikvdJBjPmYtYJvTLCoM+lCLK394OUmcR0Y+rJ+ondb
 GbSbPWbF78hhxkE8gUkeN+yPq98KiYAAJYMGFkDVg135PuwKfcfVWA+oWUrWUh3PxV5o
 ZajANv9f88p/TK9s50hK+0TCWEmqIQhMAiZUYXkyWNzdRkDrMHv/Ccbo0ihb+i1aVF4/
 ElQU1vLwyjTJlISQe5nUx+SBJzlegnMt2IJvLoKZR+XM6iQgp3pGyiwgWwGGIjXRA7uJ
 9gi9Aze9YhLxUYYtFm5Akd0vNyFjMUXrP+mg2h2tocX/99oViqb6+1lR7KKbwe6dfZ/N
 gr7w==
X-Gm-Message-State: AOAM533HeZh1lHpgB9w9R4mdTDebuZ+B7miiElIEB1z1VtpWAKr4VqQm
 /Zdv/Gsb1LzJ3iwzZkNUAgUBOQ==
X-Google-Smtp-Source: ABdhPJzo/vrPbjjl43WHtbsREaB6NOcWVzjsidtDESLbBAon3vtDV0CiPaTC54eXljkSLUwRwrnvtg==
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr29207661pjb.4.1649536833354; 
 Sat, 09 Apr 2022 13:40:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm15565341pjq.25.2022.04.09.13.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:40:32 -0700 (PDT)
Message-ID: <f73281f0-e61a-dfe3-3b26-10e445be8e3a@linaro.org>
Date: Sat, 9 Apr 2022 13:40:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 36/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_inv_vlpi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the function gicv3_redist_inv_vlpi(), which was previously
> left as a stub.  This is the function that does the work of the INV
> command for a virtual interrupt.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

