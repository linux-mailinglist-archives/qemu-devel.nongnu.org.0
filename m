Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21145D80F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:15:04 +0100 (CET)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBmR-0007oi-GO
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mqBiB-0003pt-4K
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:10:42 -0500
Received: from [2a00:1450:4864:20::336] (port=54196
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mqBi9-00079O-9L
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:10:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id y196so5064968wmc.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vFbpFI/n3zF4FvU5PWaQgUnP3rbWBjCUI2RrNYnjxNc=;
 b=ID7nshjmiru76VebxgPvotRswyJykfQljIwMzitiIL7zwSPVWKyoGQrCnPLNIuM6pY
 QyTSN0qfkmI1jc1w3eTgBbsfnQPPA0+j/3YMrzf8c+7brYhGfLHge88zqFangsbXe4AA
 xkP3s/RC/eJKKj/C7YYbpnrldlcWHbjuOFYDoA8Hut5se1i+Xf2qREggkT37XgrXMUSB
 LBzpzmV3G/mp5dsscT+AefC5amtm9jqQWQVqVoofQfZmNL6I6QD/h6jEck2nKNdQj9aA
 tSia4HJwC/j9F4yRoV13oHRCaFPQpSep3obPOLyQKbTLrzB4Gz4PE8WH41Bv8GZl0U2H
 lprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vFbpFI/n3zF4FvU5PWaQgUnP3rbWBjCUI2RrNYnjxNc=;
 b=o8wI/zOcu6mKTL1heqUFhhKlFoC7gZE4z97PUNJwn80/kMpEJ/Y3sIoOrQtvVMTQFn
 jVDmDI17GpdLVq788RItC9NhQyCM9JpKzMrUB0g1GDFLk1LQdJUpsZgcPtVp72IP77Ry
 eaQQtWNc3VD/k5JVTa1nIfaOeupXNToklpRFxxKR0+r91Dqs66Pt6zSDccg1F5ezgFhc
 0Od/T5hoqsw9HD8w5+bxd03C3nLh38CDKlWV6r1RaCdoYMxVXWs9w/E53YlfTKxhKq6f
 qdivEtnmjCnJowR0/MISM+8KyOlTWGTkEWWZ6sic0Sn+XddWEKznU96soxN175Zv7US0
 e0kw==
X-Gm-Message-State: AOAM530sW5E/F0QRML+WnVWOSap6JN8KLepxuWrwfb8xlz/4Xgpt3Egq
 4Z05BsLiVNonbChNm2N6Ycg=
X-Google-Smtp-Source: ABdhPJzPqWE8nns6dmsm+ZkG7QD5JpGDFQik26p/JGs9PEbSTDy4iQILcC/Z4WPadtreFohHppRfjQ==
X-Received: by 2002:a1c:1903:: with SMTP id 3mr5698913wmz.89.1637835035056;
 Thu, 25 Nov 2021 02:10:35 -0800 (PST)
Received: from [192.168.1.36] (217.red-83-50-76.dynamicip.rima-tde.net.
 [83.50.76.217])
 by smtp.gmail.com with ESMTPSA id d15sm3410387wri.50.2021.11.25.02.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 02:10:34 -0800 (PST)
Message-ID: <5d871de6-fb35-6dea-ac33-7508499cd363@amsat.org>
Date: Thu, 25 Nov 2021 11:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637830681-4343-1-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1637830681-4343-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 09:58, Song Gao wrote:
> TARGET_MINSIGSTKSZ has been defined in generic/signal.h
> or target_signal.h, We don't need to define it again.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  linux-user/aarch64/target_syscall.h    | 1 -
>  linux-user/alpha/target_syscall.h      | 1 -
>  linux-user/arm/target_syscall.h        | 1 -
>  linux-user/cris/target_syscall.h       | 1 -
>  linux-user/hppa/target_syscall.h       | 1 -
>  linux-user/i386/target_syscall.h       | 1 -
>  linux-user/m68k/target_syscall.h       | 1 -
>  linux-user/microblaze/target_syscall.h | 1 -
>  linux-user/mips/target_syscall.h       | 1 -
>  linux-user/mips64/target_syscall.h     | 1 -
>  linux-user/nios2/target_syscall.h      | 1 -
>  linux-user/openrisc/target_syscall.h   | 1 -
>  linux-user/ppc/target_syscall.h        | 1 -
>  linux-user/riscv/target_syscall.h      | 1 -
>  linux-user/s390x/target_syscall.h      | 1 -
>  linux-user/sh4/target_syscall.h        | 1 -
>  linux-user/sparc/target_syscall.h      | 1 -
>  linux-user/x86_64/target_syscall.h     | 1 -
>  18 files changed, 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

