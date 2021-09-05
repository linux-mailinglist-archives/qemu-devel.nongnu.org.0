Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09AB400EB6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:36:24 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMndX-00080o-U3
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMncQ-0007Fe-PF
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:35:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMncO-0005dx-Oj
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:35:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v10so4975742wrd.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YdwbykvsT/lmdvkQoexjq15mZDXkjtDCoquks5EoE9M=;
 b=E6tZRcXmlNz013K6js7oEktjlT54HyYkwZDoJk8eQ63jqlCkP/0Vad8P5HqA1qLgHo
 7nK4g+FnYaM9J1Xz5FGrsDOwm4MzxtpjZ8e+t4Syaw0TWLdyP4GoTj3ktPtKmw8BTdTc
 hcq+a46YV8DAgO1YvPzX72eQIGyrqp6GFrAIMxymjdIH3Kc1EwE2SGvqgBnEf42y5Gin
 mRupLFiVb5P4EChRCHZ2yZLi2XU8/RhQAfh+vWT4K5unNLxco6JTNMkzA4UjbkvwdOgm
 2KS7Wu4xVestD6EFewkP28P2lVUz2jxOeeQKwODtS7ww9BK06zAfVINuRRlAUPW2NXBr
 USAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YdwbykvsT/lmdvkQoexjq15mZDXkjtDCoquks5EoE9M=;
 b=LsxcMuU74EWkFikJmaenGdPmKzs6vQje96J1VV6rrdXDimH+tjNAG0VSoLhmp2QjQ2
 +EQ7E6bM/dSVSeTOhUxZM/cB/u985/6LykIzcaEfAS4s2LZuuOYJoaZkURLL5Imzddc0
 GYHeX7nkXlEzk14BJ1pPUqh2+VZgWALSv8HlYlXQg+dy/tjJAOGFPDXOiou1pudUn6N0
 UTPWKVCeTqBNqd0s15X41XrivtR8TihAv+ALPRJgc+S7RiopG9nlCNp/Xmsm9wI0txyp
 9e3004CZHjTu+gftmSctRSZ2bbLORYUmhMprcyZTaZBViUfZvvd9Iw9+E7pOxM7Q30/e
 HEzA==
X-Gm-Message-State: AOAM531PHN9yOcnW14wWOGxbmRI0hQWOqtlVXM6QyIvbnNDrgC5gMpui
 QS6cVhNvB4tVkx8BGGORcozduw==
X-Google-Smtp-Source: ABdhPJx+d2z0R1RqWjhou4InwTExucTIGcJUSI8+Zv1n8vp6bFV5Zj+cxbqpKm/X8gU0+x7z/9x/NA==
X-Received: by 2002:a5d:6e84:: with SMTP id k4mr7434967wrz.426.1630830910619; 
 Sun, 05 Sep 2021 01:35:10 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id w20sm1681441wrg.1.2021.09.05.01.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:35:09 -0700 (PDT)
Subject: Re: [PATCH v2 11/24] target/i386: Move x86_cpu_exec_interrupt() under
 sysemu/ folder
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210904235542.1092641-1-f4bug@amsat.org>
 <20210904235542.1092641-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <190f4143-d285-48d5-c496-ce493c439d60@linaro.org>
Date: Sun, 5 Sep 2021 10:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904235542.1092641-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/21 1:55 AM, Philippe Mathieu-Daudé wrote:
> Following the logic of commit 30493a030ff ("i386: split seg_helper
> into user-only and sysemu parts"), move x86_cpu_exec_interrupt()
> under sysemu/seg_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> I prefer to not squash this into the previous patch because the
> ifdef'ry removal (in previous patch) is not trivial IMO.
> ---
>   target/i386/tcg/seg_helper.c        | 64 ----------------------------
>   target/i386/tcg/sysemu/seg_helper.c | 65 +++++++++++++++++++++++++++++
>   2 files changed, 65 insertions(+), 64 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

