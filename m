Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD66A945D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1yC-0002PU-Ss; Fri, 03 Mar 2023 04:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1yA-0002Ke-Vu
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:44:55 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1y9-0006iY-If
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:44:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id c18so1180575wmr.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S1jjL4oE632lripB1tLFpaEUySlf/wTdOxJzkYl6RQU=;
 b=l8do7zs8BYSt7Yc9Lax5nGmef2OpkaiGjWBCE7/bIFEFdl2FkWqEnlb7UpsQb3Jr02
 Wkr4yx9ZcIj2Eo3Q6rZuFk3/5tiToN5oZVLgfEgeOfrBIykcXnX/ddEubLSWrHhrlBxX
 B7DBwtWfwptYb5HvmHz5mHL6SssR2CdU23aEd570wHAKWDIiWV92tnPN0cwiq6eEb63z
 YjYz3m3nGprD42udkHHf7G6lDDG3xn0i5G168wOiwfz1rO8LlqlCY5IHZ7aODJNn8RFM
 eWR+bxx4lpeZJTLBjVKfSmzHtbE/GKnf4R8wsAjqHtM5LGSyahcSd53T/QKkPF96iJnB
 K52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S1jjL4oE632lripB1tLFpaEUySlf/wTdOxJzkYl6RQU=;
 b=x85UFoC2ZJrDitV9mtybIECFDGX8yyD2D9slvnU0lEYDTzJzjDejwxXBvdxphuAW6A
 qAJVCdovoLx2gotoDKwUUmAh8en+JdzLIFSGHRc9qOt+drVCZ7mrscK+/nuwOE0bWti7
 uH57ycRbg0QZwywyqfuP1HmI6e1JFPrmn9Fw6bPAFTPyOqf/waHxLdCqrP6kJTif0G+/
 D/JM876D9PMVM/66aVhqWljNlMpYJeIFpEdJw1K225MWHWqn1BF0IWi09HDqkZPC+7Z3
 Tgx7HvGaiCJOzI3tPaTTR2VPUC8EILG0qW9GclPr4xhEJKnQYFCPIqm7uBEixruzW096
 aNig==
X-Gm-Message-State: AO0yUKWkb20l7GRaHBReSqq9na9AUk5X3lyzXOKJNifIkS9dzjnNkZp6
 +PkAIlgRoDwa1n2Nw1rrEfxcoaRGRc9PprKL
X-Google-Smtp-Source: AK7set9mR1OQpG07eTUq2hP0REoNFAAmLHssZdbJ5xbMXn1sl38QZyv3ifujLSER/CPJHTtYXE3q6g==
X-Received: by 2002:a05:600c:3c89:b0:3eb:38e6:f659 with SMTP id
 bg9-20020a05600c3c8900b003eb38e6f659mr1019578wmb.15.1677836691512; 
 Fri, 03 Mar 2023 01:44:51 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm5246022wmc.47.2023.03.03.01.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:44:51 -0800 (PST)
Message-ID: <0b3f38db-81c5-6114-28d4-69aeafae3d34@linaro.org>
Date: Fri, 3 Mar 2023 10:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4.5 27/29] gdbstub: Adjust gdb_do_syscall to only use
 uint32_t and uint64_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230303025805.625589-1-richard.henderson@linaro.org>
 <20230303025805.625589-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303025805.625589-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 03:58, Richard Henderson wrote:
> Pass %x as uint32_t and %lx as uint64_t; pass the address
> of %s as uint64_t and the length as uint32_t.
> 
> Add casts in semihosting/syscalls.c from target_ulong to
> uint64_t; add casts from int to uint32_t for clarity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   gdbstub/syscalls.c     | 12 ++++++------
>   semihosting/syscalls.c | 34 ++++++++++++++++++++--------------
>   2 files changed, 26 insertions(+), 20 deletions(-)

Few more casts, but nice target(_ulong) simplification!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


