Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D423C60A6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:32:10 +0200 (CEST)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yqn-0001qO-KD
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yoM-0000Ix-5q
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:29:38 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yoJ-0003sA-8Q
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:29:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g24so10422964pji.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XtmWpkq01X97gueXkOGca0rUJj7jLFPy9fArTJSIkGA=;
 b=ALScJZfpSz939LnT30Tm5r7dq7tNdRA8RauQl+vogrF+C5TABvAEjO5+VjZ15n/fwi
 sineEp/zYAGPPr4kuDDCyYkiV8fF8ZPHnqqUJ3Z6+okE1C/tTFq2CeH8WT1ds08XMZLE
 pvxLBP/oIMFNEkYzpYczYi5VckJMAK+Oq+f6lApbba8my/TWUp62KRE4sXFfY0jGzL/T
 mk7x+zRQetZtePspOXEnP829hvxpjwqJZfM0oi2GobTge9H+wWhU9KrslNiExHNeQ+Xq
 VSkli1GBuOqup7xHzPcXF+kj1D3ejujdqfoDRAHqMdnjX30cOYfqdkRhzqZvl092E4uD
 SjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XtmWpkq01X97gueXkOGca0rUJj7jLFPy9fArTJSIkGA=;
 b=StTSSVQsffvXP5GA2DPvfv8wEJbKdX3CQrOmMySY8cDT5ug3DagEZtFW74JMYvanzd
 qUyVj8d/C7HpizQISzvhhDxq3FIu4zh2YAtum/gCGYvGivfNSi6MPEq//XvEff82Wx1L
 9qDwwmuRkmBKq3KTsyw2kLXcyjnzs3QInxA8ofAzAYls0J/FlaFiGhYdcr29pJ3P0ncn
 II7Rgn6JFTCoDScn8RSpyiEhL6DRLTt5YyMINBGYuuykXPqJ/k1Fdgj4WF/X3w9DDNTO
 /uBXbUlKiykwUr906y7T3BAyu5S/o0oi5ejOOBaXv8fYsE97zrih/yuMlU20pSkPXM4G
 bd5Q==
X-Gm-Message-State: AOAM533RWQduUv/Db8Zlk0S4LD2UihtqJT5Mye1EwbbdX4X+ppUuffwI
 g2hIGHILN4ODuQ1UTl/amL6zsg==
X-Google-Smtp-Source: ABdhPJyhp2pFQlKoF167q88eUP3wwDyrnAMI/1MGpPpZVoKGYGtGq6c92VeR73QETC1mJIRrf69mEw==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr46178111pjb.111.1626107372459; 
 Mon, 12 Jul 2021 09:29:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w9sm12859994pfu.112.2021.07.12.09.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:29:32 -0700 (PDT)
Subject: Re: [PATCH] target/i386/tcg/sysemu/bpt_helper.c: typo since
 cpu_breakpoint and cpu_watchpoint are in a union, the code should access only
 one of them
To: Dmitry Voronetskiy <davoronetskiy@gmail.com>, qemu-devel@nongnu.org
References: <20210613180838.21349-1-davoronetskiy@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17761933-8df7-6edd-9c35-121e9b990398@linaro.org>
Date: Mon, 12 Jul 2021 09:29:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613180838.21349-1-davoronetskiy@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 11:08 AM, Dmitry Voronetskiy wrote:
> Signed-off-by: Dmitry Voronetskiy<davoronetskiy@gmail.com>
> ---
>   target/i386/tcg/sysemu/bpt_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I've got a small queue of other i386 tcg stuff, so I'll include this.


r~

