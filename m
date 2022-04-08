Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DF4FA00C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:18:59 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncxsY-0003mK-Cg
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxrK-0002SR-C2
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:17:42 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxrJ-0003sI-0Z
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:17:42 -0400
Received: by mail-pg1-x52e.google.com with SMTP id z128so9017029pgz.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JaJTUhHc//J2Cc+u3V2neoVF4vB7Qk41UTICuW2Oo0g=;
 b=ETud69gePvqmzg8sTa29zT2oXOeo/iE69se5xleJJstVCulzfGboJM1ZW/h0+TVVr4
 Q7qSVJguIJXOXls+0oENkiMVdzevX1wQWutm19DM3X+hOgf/Ip0RdATkpDukOxu9bxtP
 v6tLpgTZB7hw+5qdXIf3czgCnfhgIxZpx+ZUOvMBzDVb25lDlkO5GqMYf+UnoFBeG+XU
 HNMod3Hq2HHFbZ5M8XPk1sNtG/IXAqV2P5XAzkPjUhRwHCRbfuQwj6hjV4utsJCxqQ5f
 xuVW4T91WB8w+q2CEBeMvbZh0rFP4YdiiJdE1oe3gxU0cpChazJIu2pvZqT6ZpuWf/J3
 I+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JaJTUhHc//J2Cc+u3V2neoVF4vB7Qk41UTICuW2Oo0g=;
 b=DnvidMyobh+DunLpXtpJuR/lN4nOKfvB+ph52zFzcWdppgMTMY7VC8DyjKmJif2qZf
 u7sYRxwM9UGy1rIhsMJq8rp6Zbn2Gk9Ha56BqZuu7jND9AP9rMjeYx+qMkPKujVZBpZh
 ZufCt0nh8xwC4zY2Z0tRPHJBvWhvJB+FXtwIp9uFwfO1LE5+9c/bYsdGOoouMK1D52O4
 CwwXlU6SGrHynO6LA0M+pyzgt1Zph/36pYYDJ9aZEMnWD+BceXMnxe1EemO0+OH3pqTJ
 a+MLelVxOB6TK2RQlBKiVFdUgfVZaz5XYzZMjajzZwdDwVpjfE7hCyWscJXHd7LF3+uw
 5Hbw==
X-Gm-Message-State: AOAM532I+VXbn13/jE3L4URlQfz+U7J0ionDN11MJzBOEWSxvaIsqG57
 gy6jnFjVDAuT/nGX3aT71SRQKg==
X-Google-Smtp-Source: ABdhPJzQg7bE8hnNhG72fkxzpQUVVkRr+pbLnEvs31hUN9RDmWxs2gWp0ytGqIEbpIrGaO5vVczn9w==
X-Received: by 2002:a63:368f:0:b0:398:1bfe:bdab with SMTP id
 d137-20020a63368f000000b003981bfebdabmr17308304pga.29.1649459859244; 
 Fri, 08 Apr 2022 16:17:39 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a63ee10000000b0039d1c7e80bcsm120973pgi.75.2022.04.08.16.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:17:38 -0700 (PDT)
Message-ID: <abe167af-ccc3-db75-eb29-67ac92194240@linaro.org>
Date: Fri, 8 Apr 2022 16:17:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/41] hw/intc/arm_gicv3: Sanity-check num-cpu property
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
> In the GICv3 code we implicitly rely on there being at least one CPU
> and thus at least one redistributor and CPU interface.  Sanity-check
> that the property the board code sets is not zero.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Doing this would be a board code error, but we might as well
> get a clean diagnostic for it and not have to think about
> num_cpu == 0 as a special case later.
> ---
>   hw/intc/arm_gicv3_common.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

