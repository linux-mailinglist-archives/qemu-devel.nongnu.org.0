Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD956C629
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 05:15:03 +0200 (CEST)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oA0vu-0007Pc-7u
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 23:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oA0uG-0006ih-1e
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 23:13:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oA0uE-0006u9-9r
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 23:13:19 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q82so448618pgq.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 20:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9uos0+sfuC4XnCLp5MLfP82WpD6q3ms+JMyjaDE70b4=;
 b=hYhCW8XoyrZ8ujfRu9q0S7LxYHZVGN4RRsBqNKK+UvKOASDobKswMxGjBqS7kRcEU4
 Jnohy1jtoELuTvdmUk6NeLp8yHNOEPfZCpKt67Z8SGQAGIpvxyHsaI55TesuWUNxmp9K
 V8YBRBgNvKQWk9/viL8AjO0nH0Drc5kqUnwqv4e9yl5mpCMFpky0E1c7dVStA+mYUqWy
 rrUlo/8k7wqRkWS2c7gp/vj6HGmBgoj9iC/EWkx70vh7k6ZHnbZphxGi4ocJTFsfCp15
 U7ERR/oODTW+dB27/Eq6OCiduXDrbKB0VeNkpU+0G50Rs+Rc/4tBZitF5/LrWk3Lmjcv
 ocPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9uos0+sfuC4XnCLp5MLfP82WpD6q3ms+JMyjaDE70b4=;
 b=pHWjgdhEQlv5xcL3gY8gg49P+LB3KHNq5y2TCmo5ScmcoA/vn0N75uXuHSP+FwPwrx
 W7JXsPlAYuB6jyfX9vbWLj75NBdt/GlwxJ8eMCxBc2aI3rbNRcppbuN3Z255GXEQj0nt
 bR6S2Tlx1bqonsTiDrgS0p3QG98tyht+RTTy1bYM3xXpnIhUt5B0Z50ydc28NR7a44gd
 FdznfPIE/VK3onMF3CbgEvE6dKB2c58HlNTVlAD35gNlrXdCg8xHT+9PAgJHMUfViutE
 N9ENsVBR56Vh5GT7/e368e5viXVNjwd//9XTRBSROegkpx4dDiSLR2Am+pX29sK4ukbw
 Ivmg==
X-Gm-Message-State: AJIora/IltDtpv4/Dgf35GZ1S2Fu1PO71B3Un4mItFbodOnAhruVngnq
 fip+fL08kqkiko8RzwgZCLWxYA==
X-Google-Smtp-Source: AGRyM1vynejcezAjhT4PCgdVjsf/50c331pQsNd2hVoIvT19u3I0fAEgS6+teIfE3b5/wMoSaDI7nw==
X-Received: by 2002:a05:6a00:13a4:b0:528:1b6d:f8a4 with SMTP id
 t36-20020a056a0013a400b005281b6df8a4mr7106729pfg.54.1657336396489; 
 Fri, 08 Jul 2022 20:13:16 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a17090a4f0600b001ef9114eb9dsm148188pjh.42.2022.07.08.20.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 20:13:16 -0700 (PDT)
Message-ID: <1c1725ac-c9a4-fd65-9d43-063fe4cf45fe@linaro.org>
Date: Sat, 9 Jul 2022 08:43:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220707210546.15985-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707210546.15985-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 7/8/22 02:35, Taylor Simpson wrote:
> Recall that the semantics of a Hexagon mem_noshuf packet are that the
> store effectively happens before the load.  There are two bug fixes
> in this series.
> 
> 
> Taylor Simpson (2):
>    Hexagon (target/hexagon) fix store w/mem_noshuf & predicated load
>    Hexagon (target/hexagon) fix bug in mem_noshuf load exception
> 
>   target/hexagon/gen_tcg.h                 |  10 +-
>   target/hexagon/helper.h                  |   1 +
>   target/hexagon/macros.h                  |  37 ++++--
>   target/hexagon/genptr.c                  |   7 ++
>   target/hexagon/op_helper.c               |  23 +++-
>   tests/tcg/hexagon/mem_noshuf.c           | 122 ++++++++++++++++++-
>   tests/tcg/hexagon/mem_noshuf_exception.c | 146 +++++++++++++++++++++++
>   tests/tcg/hexagon/Makefile.target        |   1 +
>   8 files changed, 323 insertions(+), 24 deletions(-)
>   create mode 100644 tests/tcg/hexagon/mem_noshuf_exception.c
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

