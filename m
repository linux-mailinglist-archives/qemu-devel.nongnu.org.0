Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083846868E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:33:05 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYuF-0000ku-SP
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:33:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYt7-0008VB-0i
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:31:53 -0500
Received: from [2a00:1450:4864:20::429] (port=43977
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYt1-0006Jn-Nq
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:31:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id v11so12781195wrw.10
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eqmZR9jFjDfHhvivUjWyUAfLra1HofDt1mivVFeD/kY=;
 b=XsJMKPV9/6SD55sCmNgTL8ZRybq+9rG08PVk5Wvh3gHrqlSoEkEnF0OLcMK4pII7Wp
 3e+U1CAiipgxn7qc3ZKIWR0CEafCYQqAG4L85EePWVUQILOLV8pGKRiAdAZAE7wnZ64i
 Ls44tG96Tm5gd0dLVxVQQrpukEuFrsCr71Hw+pmuLSa2TiYNPum8HTBIGYsC14vThisz
 NXI8CAWGv/+vZLzE8swXO5Z9ehSEy6kwhDjMOacFG16hlHZjYfNGYZU3+8NSFfOYU6z1
 u6dBfHfoZq8zKTZtat3SoAFbw/NEku5BW5cCTa+cFzMgSZdbpa+E6jAEZskbxMxJUHDe
 u8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eqmZR9jFjDfHhvivUjWyUAfLra1HofDt1mivVFeD/kY=;
 b=PFTx3+OdlVF49yC6L7oJaOifDhCjUkcyM5hKCGk9jV53UFmgd4SBEILkqMhj39FDJ9
 Oa5j1ojjzH5G7f6pVD46gFG1NkKmZOHdx41OM2jiFl+2+tzUkg+H4pU7C7IDwsGne03u
 zpat0WrrjLJlX1mnyT36sZY5EWli9RgUEzUB85lgQ9+c9UadAzdIk2oatF6KWopKOMrp
 dRL3rF2p1ZmXXLug4HuyO8/f+hMhLopBl6ohpHZdVPwzaT1evnyvphbuLBfLPO/N1VGg
 9xtQEx7NUlauxmw3+7UK1TTmLq7LgkKPgj78LDhp5RAOGCnDJB8ffk9xAGCJePB5/u1U
 unmA==
X-Gm-Message-State: AOAM533+72JLwiekKCL87NlMuNmRHrAFWOh/3HUNAstkJj24+1k4XpLc
 z3eugD8ZZPqgHPMCphyWf60=
X-Google-Smtp-Source: ABdhPJzVw0ghhAT18wttxZAjJ4D2fJvfCY9tjSteepx5Ci46I6bkAl68JdVKw6Am8Yca+EgGlCWsRg==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr29012737wrw.486.1638639106441; 
 Sat, 04 Dec 2021 09:31:46 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id x1sm6009658wru.40.2021.12.04.09.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:31:46 -0800 (PST)
Message-ID: <f87c7027-7ccd-b130-5975-595426cd5d9b@amsat.org>
Date: Sat, 4 Dec 2021 18:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 21/26] linux-user: Add LoongArch syscall support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-22-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-22-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> We should disable '__BITS_PER_LONG' at [1] before run gensyscalls.sh
> 
>  [1] arch/loongarch/include/uapi/asm/bitsperlong.h
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/loongarch64/syscall_nr.h     | 313 ++++++++++++++++++++++++++++++++
>  linux-user/loongarch64/target_syscall.h |  44 +++++
>  linux-user/syscall_defs.h               |  10 +-
>  scripts/gensyscalls.sh                  |   1 +
>  4 files changed, 364 insertions(+), 4 deletions(-)
>  create mode 100644 linux-user/loongarch64/syscall_nr.h
>  create mode 100644 linux-user/loongarch64/target_syscall.h

> +struct target_pt_regs {
> +    /* Saved main processor registers. */
> +    target_ulong regs[32];
> +
> +    /* Saved special registers. */

Eventually:

  struct {

> +    target_ulong csr_crmd;
> +    target_ulong csr_prmd;
> +    target_ulong csr_euen;
> +    target_ulong csr_ecfg;
> +    target_ulong csr_estat;
> +    target_ulong csr_era;
> +    target_ulong csr_badvaddr;

  } csr;

And rename registers accordingly.

> +    target_ulong orig_a0;
> +    target_ulong __last[0];
> +};
> +
> +#define UNAME_MACHINE "loongarch64"
> +#define UNAME_MINIMUM_RELEASE "5.16.0"
> +
> +#define TARGET_MCL_CURRENT 1
> +#define TARGET_MCL_FUTURE  2
> +#define TARGET_MCL_ONFAULT 4
> +
> +#define TARGET_FORCE_SHMLBA
> +
> +static inline abi_ulong target_shmlba(CPULoongArchState *env)
> +{
> +    return 0x10000;

Eventually 64 * KiB.

> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

