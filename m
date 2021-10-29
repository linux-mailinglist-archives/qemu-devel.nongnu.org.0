Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783624405E3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:51:23 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbec-0008MZ-DK
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbX3-0002kE-Lp
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:43:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbX1-00058b-UG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:43:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o14so19137098wra.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QmJ1pP0XVXL6TCHMlD2HZeZF3rl+NXYA3OMdeD3/1K8=;
 b=TnuzlXoMHm7bEp+4/PLa7m3+nYDzpcf4GOKXvhruXP9DI3iasGi18jOM+5gE0odqYu
 /9uXgxKGT2Sceo6Yz/hmRv/PvPegi6sIeOR/ByyMGO1r64l7CqdjrI8ceAizqY/qjlNb
 AGZfW5oOG0Vrb7o66ZVV4I89ny8P/8N4rOPxrUdGbifNktpGKgcd+IEFlmJ3drzjfU2g
 1EKBOdgtloFANjo5JM3EunqOjLwylAu1itlmjyCm5K+grgdsHfuJONlUrkz9evZ+0bEJ
 gDu9iY9JBdCB+7XSY3ep151cvY9c79Y3heoufsuEas6CgMPo3hlPZ+cLUpnYE62zCwUE
 w9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QmJ1pP0XVXL6TCHMlD2HZeZF3rl+NXYA3OMdeD3/1K8=;
 b=GahDKM5GK3O3C4B8TGPJ/jt/LslAgEJTMBcLBfRoRn5guvsoOiabMuJyO+f8sCHEpd
 2A2EnMKEP03LeazN1SCmTZI2RRoVeJr9us9i2J3Po4ZCj5PqF5npBMVsFk/s+pCS1Hz+
 kylVI6DqRoQSOecz2y3LVShd5BkvZSgJe5Sh5dYzV9eRBCupyllO8cyPWNt95LS/Dmwf
 QIB1nVGv+fZUAVcW+UckwRmjbaIXyz+N8JI6jBKanU5KqZ7dxEo5/BwE9RnmiSHB7dXZ
 Kmb2ZmPQ6VCHP4pPbiYzdLUW/RSFld0I0Fxy6l6Qm26o6h2uhX0ZzWZl9foLJxN3sOMl
 tmcQ==
X-Gm-Message-State: AOAM5327sGMknfo1MRM7gjvxij97nnTqlQ9hzT2O0oi3cMXNmLB8Vojq
 i2xW0+V0Qv/+KicAOKhhtuU=
X-Google-Smtp-Source: ABdhPJyH1kgynLlAZ8obOnlOctmJplyz69cWMKq1A/IY6x+ZSFYqCzP22LP4SI5IbDslhMOLSQUTSg==
X-Received: by 2002:adf:8bc4:: with SMTP id w4mr18059096wra.36.1635551010187; 
 Fri, 29 Oct 2021 16:43:30 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm7476488wmp.1.2021.10.29.16.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:43:29 -0700 (PDT)
Message-ID: <3515f98b-da2b-440d-f6e7-d775e5726dad@amsat.org>
Date: Sat, 30 Oct 2021 01:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 58/67] accel/tcg: Report unaligned atomics for user-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-59-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, which
> has access to complete alignment info from the TCGMemOpIdx arg.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 5646f8e527..92cbffd7c6 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -476,11 +476,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>                                 MemOpIdx oi, int size, int prot,
>                                 uintptr_t retaddr)
>  {
> +    MemOp mop = get_memop(oi);
> +    int a_bits = get_alignment_bits(mop);
> +    void *ret;
> +
> +    /* Enforce guest required alignment.  */
> +    if (unlikely(addr & ((1 << a_bits) - 1))) {

           QEMU_IS_ALIGNED(addr, 1 << a_bits) ?

> +        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
> +        cpu_loop_exit_sigbus(env_cpu(env), addr, t, retaddr);
> +    }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

