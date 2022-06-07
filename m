Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E8541F3A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:52:28 +0200 (CEST)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi3m-0003XF-Jo
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygqp-0006HX-31
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:35:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygqn-0000Fq-FS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:34:58 -0400
Received: by mail-pl1-x633.google.com with SMTP id b5so15899299plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3QlZSnFTstM3ZbOiBW3B542JqPoo9HgOWvulELSNtXg=;
 b=O2P21ONNKdu9F9hKdOvaWPHZEV2YgllVytPTAO1pppQtd0Y34wF4s86GEa7oY7nhnL
 DsM9gyYzKK9uPeYq3ECTSfHFovBQUKu0q99hj8HY70UgIYGmJ9tJUu1g9nlxWS4LXrB9
 MMFbbZrmCPBO+IR7MEqXYeA94ZtQeGVNZXrf19aGTSgAxF7FyKmRaCQ7ygU6Issh/FQq
 Z220v0pyrBGxi4ZrGwKcJTNPiC5FRgSuL7PMQEmc88GPSxXxmxuMR0U2dErYjV0sXLVv
 P10xorNmLYi15rLWps7R9fF+E87boea65/qHvpQnbXi9ER5l3NC5bmcQGvi4exSaTxRk
 romQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QlZSnFTstM3ZbOiBW3B542JqPoo9HgOWvulELSNtXg=;
 b=W9FgOeL/rtI6x1WVSMFhZwYp9LBLpzKDum0OdkTQ2so+TwWG9wP2yOR2Ec2MAz82u0
 OIohDZKY7G94JkWo21Tddq/a4CtXZwgwNVTxNDZ+FAXqLqWuLDmrECrWM701OzeGG1K3
 nuOkr/orSJ76Bh0SoTkLUPzz2mDQpFuwGlwqMcJtzFrhNvdUL7HUubXRwB0dpaQuJOH5
 KaHp34XQk8+ZPHYTggn22hiq1Wqz9gBkcUjEJ7v3soGcMd1vQzdQeOwODiQPSkSbTPjr
 +7p32ZjOvwIlLoVrahvp0kMcZMIS7aDOjRTqQVmOqI1O8dPtNAjqHWPx6q1ka15tj95o
 o+uA==
X-Gm-Message-State: AOAM531iXNVYoIk67AHWHsBh32OJZ1eFy1oc6ZmUGrTygfiTmYGCp2LI
 4e7mEvw9UOIZAfmIlyBJTRC0KA==
X-Google-Smtp-Source: ABdhPJxcHb2YxUXLVR75fYCwFlUhZ+ZwEXQsjy/4d3wl14BTJtFGsF6eR2gNXipOkv+YVbUS5oP6Ig==
X-Received: by 2002:a17:90a:d3d2:b0:1dd:30bb:6a45 with SMTP id
 d18-20020a17090ad3d200b001dd30bb6a45mr70045759pjw.206.1654637695968; 
 Tue, 07 Jun 2022 14:34:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b0015e8d4eb28esm13058400plb.216.2022.06.07.14.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 14:34:55 -0700 (PDT)
Message-ID: <d00133d6-4c1f-637e-6a36-a68558bbefb0@linaro.org>
Date: Tue, 7 Jun 2022 14:34:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/6] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220607201440.41464-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 6/7/22 13:14, Warner Losh wrote:
> +static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
> +                                abi_long arg2, abi_long arg3, abi_long arg4,
> +                                abi_long arg5, abi_long arg6, abi_long arg7,
> +                                abi_long arg8)
> +{
> +    abi_long ret;
> +
> +    switch (num) {
> +    default:
> +        gemu_log("qemu: unsupported syscall: %d\n", num);

qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);


> +#ifdef DEBUG
> +    gemu_log("freebsd syscall %d\n", num);
> +#endif

Drop this.  It's redundant with strace.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

