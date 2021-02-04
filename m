Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF630EAA4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:07:32 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UzT-0001Lz-6V
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UaI-0001cf-E4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:41:30 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UaG-0003gL-SE
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:41:30 -0500
Received: by mail-pf1-x431.google.com with SMTP id y142so1159630pfb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBCCi0gRBjmiDdEpg8UjucPZ0bgyQV/WSHwjhOH/JtY=;
 b=bhu0Qt/VCQ3ugh7yxZm/+vq68+clkH3TRCGPpFWwblnm5DWl2VJe6bTT181+gIXkcX
 LJWc3zkc6qFcJpZSy2fR0fhwn7E65J7fVch8R6aFYydl0TC4ZQjFs38C4zRdGNb0bgnb
 TtwdsgLe04F4QomxPBjDeL9y/SSjM2IoumoARzR5dogNSaafwEK8GVU8o5bBqKLXkwtq
 ZYN0KIGIfIg2YqxPsxDw9SwM0l1KhrDevVxZvfpeF5bIsF2KeXw5+Bhv+y1JtqCXbOq3
 mz47fEbOiIRAjfMxSoCWDT9hxtAR/eX0kwuCkcKH7dWHFIp7p4J4IfI5K5mUAU4yfN2X
 DE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cBCCi0gRBjmiDdEpg8UjucPZ0bgyQV/WSHwjhOH/JtY=;
 b=oZ/p8MSUMRgiWHbSAFufUYVEMM9dc8MYXoR1/c8L1OHIor9HlyOUVX/DsHNemyIocf
 1xWW107W3O4lg7Y3Nk3AF3WKdQdeNuOjD5ijf5ZpODNgP/+RhlRMGuRfpcBDzprs2CGZ
 k8llxlAycwjnCRyfJFbyg9+hxwvHw3ZWzBA94GOxD3wtTrZ2keNgeu5YZ0Tm5vWCPN78
 2vgljhqAppfmTwHyUBhwB+yxEfQZPzvEbJPPUju6QYcIMd3vLlL2gD2pxbVtvk5hAuD2
 t8uJ6Mu8kF0y4rvnF7oumls7KHd8qVnejnJVNoYrXsFfp2ygIDdEv+D/AGuZVrhCJJOb
 T2eQ==
X-Gm-Message-State: AOAM533bAhFrCLG0LVKVFHIhV9QP56PMqSNPEyrAvY9REzp5e3AeCIDV
 3MB6DPwV5vLREkN8+vhWXIY12w==
X-Google-Smtp-Source: ABdhPJzjECWwUPsJ1N7Gm63wjhPkoM5f/6969IVmjRFDeqiuwMleCxURgJRYGcLZEgn2lcqFlvyQbw==
X-Received: by 2002:a62:7d03:0:b029:1bb:5919:6dec with SMTP id
 y3-20020a627d030000b02901bb59196decmr6013142pfc.76.1612406487469; 
 Wed, 03 Feb 2021 18:41:27 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m27sm4225071pgn.62.2021.02.03.18.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:41:26 -0800 (PST)
Subject: Re: [PATCH 1/5] target/sh4: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127232151.3523581-1-f4bug@amsat.org>
 <20210127232151.3523581-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23bea334-86c7-11f0-0de0-20a653f90f1c@linaro.org>
Date: Wed, 3 Feb 2021 16:41:24 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127232151.3523581-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:21 PM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Easier to review using 'git-diff -w -b'
> ---
>  target/sh4/helper.c | 82 ++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


