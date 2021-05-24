Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DF38F274
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:44:28 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEct-00086l-VR
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llERD-0006DR-VX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:32:23 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llERC-0000mf-8q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:32:23 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p39so5040022pfw.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ifnoQsIZE85l03rJv9Tz0nqsQaEhxyKDGDGKEVckIhc=;
 b=yhsgly4Ix7c+nY3i621qKxKukGHE3AvPYRCDoOAu2PrOXPhwkNmERsO0WPhR72SyEh
 azq9CYTYDUmJijiNMiwUd7Bhl34c5LZLGJV+H0My0k2bowNYzsZhGFfuLTgVUOsDE6tr
 zaz6bciM24MxwYf2EtwviZZFKtgnDjFGmDRZ9IYSD/kujjl+YCcLiJvvm2/rO7yer+cb
 wcKB7TSd/hecCifmDP14IaChvCr+WWgonhp/xeThbwII3ps0+raRO0mDM5JhxiSNJVYd
 TY3yuLqPN2AwOpAsGZSlzWPfdhyIIk+9WRXOIKgNEne2qcIu+SiYxlDhgSuLv0ZnLcEt
 jRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ifnoQsIZE85l03rJv9Tz0nqsQaEhxyKDGDGKEVckIhc=;
 b=qzgCqnLtie26/6ySmyLoDtBN15FTmW/0I+ocyq/gQs5M7v7M6kdMjs7YkU5ShQLy35
 RwpC5bbU4hkp3EI4AQhy39LYgVsWWkWUyB8TvPaII46uWddE5CeMfDuWulrQjaxst+Lj
 zahIDhe4aBIze926to0PfQZwN1/OOuh4fXltwXD9uexEv6J6E77tVnGFdLAAfyRRy7X+
 Xwz70rgBh63fVq9qOY3JgVACGVPaGLljGFVBK6Nr7SatmcEUXYdOO4R7Fx1RF1mV4SuM
 0W7jwnohJzF64RWooTP0Yeu2/wArWSnkW4Y6mNH+LRXzHJNHw7iWvJYsUSgzg7Bip6tG
 +3gQ==
X-Gm-Message-State: AOAM533gZhKIuitVTzJ2t3vOGRTdfd3meEIWdjkASKzzMdUC9mUPNwiq
 R2BSAIS/ExFNAmxN6SsI73YWbQ==
X-Google-Smtp-Source: ABdhPJzfUkGI53ZU225nfr1rOT2XyG9T/NcPXGHoRRM6mFugpMTCsOfqHtF+prL8iDPgXqa5amLZDA==
X-Received: by 2002:aa7:8556:0:b029:2e2:45aa:d01e with SMTP id
 y22-20020aa785560000b02902e245aad01emr23930050pfn.14.1621877540657; 
 Mon, 24 May 2021 10:32:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 66sm12487387pgj.9.2021.05.24.10.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:32:20 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] target/ppc: used ternary operator when registering
 MAS
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
 <20210524135908.47505-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e2410bb-5d57-09a3-0746-6357d0481a18@linaro.org>
Date: Mon, 24 May 2021 10:32:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524135908.47505-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 6:59 AM, Bruno Larsen (billionai) wrote:
> The write calback decision when registering the MAS SPR has been turned
> into a ternary operation, rather than an if-then-else block.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/ppc/cpu_init.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

The commit message here says what, but it doesn't say why.

The important part of the change is making the references to spr_write_generic* 
conditional, via SYS_ARG(), so that the code compiles out for !CONFIG_TCG.

The actual code change is fine:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

