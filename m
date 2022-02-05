Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACB4AACFE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:14:51 +0100 (CET)
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUGX-00019D-Qd
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUFX-0008C9-1k
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:13:47 -0500
Received: from [2607:f8b0:4864:20::530] (port=40686
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUFV-0000xG-Bc
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:13:46 -0500
Received: by mail-pg1-x530.google.com with SMTP id q132so8264018pgq.7
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SOEw093ivVY/1HiWne4isYk2sF3RrSY6mX2ceIUqQMY=;
 b=mn54cNXU8eJZzttgLg+FtKgUYM1L4m2Z8tG7fsQuOTlZ32amaXB6fElAs++P0U4+rC
 LWazggGSBkzv1cTRcoQtksf5lvl5Vro2ImCXB41d2UmDfkn8UQo0LzZkhrhHnp49tVoS
 67Ir76goCrB2dueH54bMUqJ/y+c07eE934Hchh69++8UaXFk0XXSFhbdJIpLkM6ZqHKG
 tHlmmwJAEutNMt4jjjrF3l39VEm2AS4jV/HVWwOOcBIsQhdtJ+MxiwqUXug2m4UcW67H
 Tu5iq0UVQ/AkevzMCxAR0i12bBNWXyXPQteiNj5GhHHqwY7zk5+X1XxTCqGC1IxWs44V
 9CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SOEw093ivVY/1HiWne4isYk2sF3RrSY6mX2ceIUqQMY=;
 b=ZoRE+WQLVTzqZS4Vy4TvBIGFeqzwTTnOIlOMJoyyF6eZaPB3OHcMs9JXk09r3Oprq4
 SAIhtnGfOdoddFFc3TCAWMSR3Ev8A4Av1KnN/7+I3rETN5Zh0ynF8mx+zrSVig9e5Ufh
 9Ch02g2kmkckUveCQnTSBXCJcCfTkasot0P0g2shlhX/t8TE6dtG7+sH5G5Rn2Jni+Xf
 dHJ3gnOX945ZHp726Fxmg44OtWIWF9af1OZ4kb3HBJ/QazUGVhVHLj59c9cucwuAN2VM
 YbHNSM+qU25GM1ddICAu42JiipMxJx4MMY+adGvgynvzwNMuz0wYWdTUACdAlwFFm4q7
 1i0w==
X-Gm-Message-State: AOAM533sFS11hU67cTrTrtC+P9w0wIU2uolGBkE2Y0eC0OEpqqDjwYRg
 60D+6VG7NFTUywGb/UETuWiXeg==
X-Google-Smtp-Source: ABdhPJzzdUlRMLcpyfhLhs/q2H+BZl+n1SRTntVqRliBqN2Ep8tDZrsl6jD3jsyqF0bli8F7rsObaA==
X-Received: by 2002:a63:6f45:: with SMTP id k66mr4313390pgc.511.1644102823684; 
 Sat, 05 Feb 2022 15:13:43 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a1sm4529642pgm.83.2022.02.05.15.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:13:43 -0800 (PST)
Message-ID: <bb88b68d-904b-0b33-4c89-e60225130126@linaro.org>
Date: Sun, 6 Feb 2022 10:13:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/21] exec: Make cpu_memory_rw_debug() target agnostic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:17, Philippe Mathieu-Daudé wrote:
> cpu_memory_rw_debug() is declared in "exec/cpu-all.h" which
> contains target-specific declarations. To be able to use it
> from target agnostic source, move the declaration to the
> generic "exec/cpu-common.h" header.
> 
> Replace the target-specific 'target_ulong' type by 'vaddr'
> which better reflects the argument type, and is target agnostic.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   cpu.c                     | 6 +++---
>   include/exec/cpu-all.h    | 4 ----
>   include/exec/cpu-common.h | 4 ++++
>   softmmu/cpus.c            | 2 +-
>   softmmu/physmem.c         | 6 +++---
>   5 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

