Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A8364AE1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:59:21 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa3E-0005Xm-Lz
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZY9-0007mI-P0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:27:14 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZY6-0004tV-VE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:27:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id p2so9511605pgh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i87gjY+BbDm+l4usvNn3WDnQ6RJlpPfWEzNRztXtlXM=;
 b=toFjPYEglaErKbVichqahJJnnaV9jbUED162o8jChGz5V3DqHIALOfBM0RVzbwfc2Y
 fqBKmlLs/w+H1v7kq5L+MOx/yOQAf91DFnS5D5+NyeqOnq12E+oyGYumkt7VyZSmyeKP
 iPAWW02OwEapl53ug/z+BstDxrPubQOW+KB5AqfVOuVMOvbi7voITAe9RxNekzcKjf5v
 qRIVjBi7zmW6lISKqnEmH+XvYBhiLQrr+ler1N6eK8iLM3caYNS2mKcmvAsqPeD62mhh
 2qhZEK6qZw42kPl6HOloqfkUV7LZHxoIyVfL1V7mYualDSoTx9Q/gDyRDdeqPn7AgEVG
 l/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i87gjY+BbDm+l4usvNn3WDnQ6RJlpPfWEzNRztXtlXM=;
 b=Vl1be1jp4SpWT1Y+Nplxn9PROXLgZM2hC2mnQ4qsjxq4I9wes7MN4Yda/kuLAhokoX
 ufq6VuJ/6JGEmgpHOgpNl7vn8h4l+v44BnoVQ1Fbj84/EOvT/fch+6nbZss8CmuR/ATq
 VuZFn7GaTYeQEOmp8CndPDsoofrujPpfp882o2oPncz2pP2oeGFQVAJl3lHlE8rNtNfW
 6fUPvHCfxOeZd5c0kIz7igwB+b9D5585ffv7ELfei+IEAUeUeHlB3u3PcHLyiMBANjNM
 drkefbiDx1LPHABU6v+Q1bnJxqR4MviqMpT9L2rG5HJ3vd7Sk4k8z793NUPxdIru9Att
 WwVQ==
X-Gm-Message-State: AOAM533SutkY5IltbJ7r+IX+pRFtOczwg7+jF9l2coMVFX6zTd7elABz
 /27xuHYZ/HoU6stPdAJynpVIow==
X-Google-Smtp-Source: ABdhPJzvVTMP80hwlO+SY3rauxvTsiakAAqx9giX5rBTyOsR7wVlYkXR6n0M/J4PzgUk+8+CMCXMYA==
X-Received: by 2002:a63:f506:: with SMTP id w6mr12987142pgh.367.1618860429507; 
 Mon, 19 Apr 2021 12:27:09 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c16sm3903180pgl.79.2021.04.19.12.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:27:09 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/mips: Declare mips_cpu_set_error_pc()
 inlined in "internal.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ff019aa-00c5-f600-eb2a-4c8d3e3a0dd1@linaro.org>
Date: Mon, 19 Apr 2021 12:27:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
> Rename set_pc() as mips_cpu_set_error_pc(), declare it inlined
> and use it in cpu.c and op_helper.c.

Why "error_pc"?  The usage in mips_cpu_set_pc certainly isn't in response to 
any kind of error...


r~

