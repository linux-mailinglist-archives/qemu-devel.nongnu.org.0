Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FB5757F9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:20:47 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC88U-0006Bu-SZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC86f-0003jb-9S
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:18:53 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:38762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC86d-0006VR-PA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:18:53 -0400
Received: by mail-il1-x12c.google.com with SMTP id c17so773774ilq.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dFTu+jpV/ZI6AaAkZRdU26WbYtFlwNxnd5hTasXB/DQ=;
 b=Ai/f+9f575bRyo2KRUpnH6BMeCUu2fFZpkCU9dLlvV2KzP0jDd1NsW1PpcYF42CYZ4
 7RUlF1hADXTOFDZLXFcheBWtJfe5mbqJJn2yYfbtzrYO3UeGPQdNlQ1FnZyT/ye20A4f
 z7W8HWcncZhFwQ80aW7z+tLbePv9FiqBk39LPhGOxrupMmdm397kcJCR0oR2FQGEAa7l
 iaKl7vKedsB8gSdMNGAzNE8eU5jPhXPAMRYZM9mX0WYmMeMRthSVX9yG1hT0HGYTmqIU
 4Rd0X9YAanxnzf9rgTpNSNLusMSie3wI6B+fkczv9u6wqRwBmOsBMH4ekAiez5oodag2
 uPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dFTu+jpV/ZI6AaAkZRdU26WbYtFlwNxnd5hTasXB/DQ=;
 b=yHBw/fC8QtHFdDiv2c9QwOckXWHXGKN3lvbOQSkt8f5EORnZy3C4RtNy2sFylhlvdJ
 bYYjV5TDijqfgvuN1kAiiuW3eXUOBM5KZmS12NsRIesdKs0KPcE3LVxXlfUjG7eN6gpb
 UlG4OzHfqtHEvJCOe1mjYFRsfnbRrMpekI8FEyYUWBiE52Y/N19XTSS2PVOV8FwBPoz3
 N9JTn6+6reni51/dKVe9M9RDls4F2EqwWpXFKMLv8dtaz5wrvBU4wBsKI+URvNEdxpE/
 Jnk5vK9NbfLJkBw5W58OWMJOAt3AQ6Vpx2Nxbw6vPh3N+5f7jHI3NEstNG0CARw6pAFW
 1yEg==
X-Gm-Message-State: AJIora8MdddD61lmssc7F3YVj9wK0XKOc3mtKkYpZFe2+Xm0uB2v6gsF
 yxMvL5JggjOVe7CHVmf/NEgu5w==
X-Google-Smtp-Source: AGRyM1uP92YLqQU9I2ah5XxTsb63vNJbFCPT6miqpLKjI0B95O28/AyNhgNLVpQ/mWbY8wS4A38Jyw==
X-Received: by 2002:a05:6e02:1be9:b0:2dc:7fb2:706e with SMTP id
 y9-20020a056e021be900b002dc7fb2706emr5685751ilv.239.1657840730612; 
 Thu, 14 Jul 2022 16:18:50 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a5d964d000000b006788259b526sm1318653ios.41.2022.07.14.16.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:18:50 -0700 (PDT)
Message-ID: <e9277735-59a4-0106-7ea1-847af14404ea@linaro.org>
Date: Fri, 15 Jul 2022 04:48:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/7] target/arm: Fold regime_tcr() and regime_tcr_value()
 together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 18:52, Peter Maydell wrote:
> The only caller of regime_tcr() is now regime_tcr_value(); fold the
> two together, and use the shorter and more natural 'regime_tcr'
> name for the new function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h  | 16 +++++-----------
>   target/arm/helper.c     |  6 +++---
>   target/arm/ptw.c        |  6 +++---
>   target/arm/tlb_helper.c |  2 +-
>   4 files changed, 12 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

