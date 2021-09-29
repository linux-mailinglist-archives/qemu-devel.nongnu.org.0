Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42941CA32
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:33:51 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcWk-0003Hg-Hv
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcU1-0001A1-Ho; Wed, 29 Sep 2021 12:31:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcTz-0004ZL-MV; Wed, 29 Sep 2021 12:31:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id h15so3684299wrc.3;
 Wed, 29 Sep 2021 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mc0p2V+4e9u0RQdTnp/cg9+KLmU6XIVOX4G50p95VSs=;
 b=AHsw5ohw7cEyeZRk5M2LIESvfthqLQpOeaemC3ssnjLnNF2T+tZ2Nk1icpQT0i06gs
 aPe9dgYb2mJHB9AmPl1geiQ4UFLANQmd1EV1qraL1fTFFRtt3UQ9KuKGDsAvA+z5ViBV
 jetn3OUC8ZLVLzm5pf43mSHCE5T8dS725wShk3mfZh3pQtiOvoh2wKS0Dai/S0yJsm03
 a9z5uzFRURoDvyTKj7839yO8I2Smeb770xgabGzogTaPbaQ2TOaXUCmo2WJErHuJVwt2
 jcIjXTTw4Hbze2bUJmvZuSoT1S7V8u5yNY+92EyRO77zs88ft61Xce7RJmEzPAQ+TPIN
 KMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mc0p2V+4e9u0RQdTnp/cg9+KLmU6XIVOX4G50p95VSs=;
 b=RSjyMfGApe3jylNAk6WuIW0YD6wI34byuAI6Jg6sMf3OEHNjSOB1DWSIlWVGMU2nlH
 wD3qoAHKw5zf62EaGdf4y2LBXUOVdqWGZwQkZiotAbjp0/cgLorRIV1uMcJqloEb52KA
 MDyza5h7YUI8/owGeL94p0FcpJ+JjKhv0KcvReDsNmTXWBlypQtfJOGH5pbMW5juUfxz
 jmfmRLcnwYtew9lWHj7Ua0/VoZltSZjOpxM1aVkvRP0sO4a73akBLCPC52en2d6rbNmw
 L4KuCrvAbiIdZW0aLIT9w0OTwlX4MXhoF4Nj67f8u38SGBao7r9yWca4PWdqXHtTq1o1
 hsmA==
X-Gm-Message-State: AOAM533Dhb7XwRPkIIrL19VcRpAXGo0/7mYLP8T9xvcvA1Bvjsnt/AkE
 nMl3L3hdNajzN/kB4keQN5GFcMUcIGE=
X-Google-Smtp-Source: ABdhPJxOtAvhG6zGp6bfZip6tzCd5iX6n4VLqiZyj/4qKmlM8VfW3QKvNaclWZIou608tMYA81dTeA==
X-Received: by 2002:a5d:4a41:: with SMTP id v1mr962025wrs.324.1632933057570;
 Wed, 29 Sep 2021 09:30:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v20sm367260wra.73.2021.09.29.09.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 09:30:57 -0700 (PDT)
Message-ID: <af9fd393-3373-883d-0118-b0fa0ffcb03f@amsat.org>
Date: Wed, 29 Sep 2021 18:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210929162540.2520208-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210929162540.2520208-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 18:25, Philippe Mathieu-Daudé wrote:
> Instead of including a sysemu-specific header in "cpu.h"
> (which is shared with user-mode emulations), include it
> locally when required.
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.h                    | 4 ----
>  hw/i386/kvmvapic.c                   | 1 +
>  hw/i386/x86.c                        | 1 +
>  target/i386/cpu-dump.c               | 1 +
>  target/i386/cpu-sysemu.c             | 1 +
>  target/i386/cpu.c                    | 1 +
>  target/i386/gdbstub.c                | 4 ++++
>  target/i386/hax/hax-all.c            | 1 +
>  target/i386/helper.c                 | 1 +
>  target/i386/hvf/hvf.c                | 1 +
>  target/i386/hvf/x86_emu.c            | 1 +
>  target/i386/nvmm/nvmm-all.c          | 1 +
>  target/i386/tcg/seg_helper.c         | 4 ++++
>  target/i386/tcg/sysemu/misc_helper.c | 1 +
>  target/i386/tcg/sysemu/seg_helper.c  | 1 +
>  target/i386/whpx/whpx-all.c          | 1 +
>  16 files changed, 21 insertions(+), 4 deletions(-)

> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index baa905a0cd6..76b4ad918a7 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -28,6 +28,10 @@
>  #include "helper-tcg.h"
>  #include "seg_helper.h"
>  
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +

Self-NAck (incorrectly rebased on top of commit 0792e6c88d4
("target/i386: Move x86_cpu_exec_interrupt() under sysemu/ folder").

> diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
> index bf3444c26b0..34f2c65d47f 100644
> --- a/target/i386/tcg/sysemu/seg_helper.c
> +++ b/target/i386/tcg/sysemu/seg_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "tcg/helper-tcg.h"
>  #include "../seg_helper.h"
> +#include "hw/i386/apic.h"

