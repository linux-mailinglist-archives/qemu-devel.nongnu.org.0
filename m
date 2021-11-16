Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB37452F3F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:38:39 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvrK-0005bx-9u
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:38:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmvpu-0004tR-5f
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:37:10 -0500
Received: from [2a00:1450:4864:20::434] (port=41563
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmvps-0001q2-Ih
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:37:09 -0500
Received: by mail-wr1-x434.google.com with SMTP id a9so10393889wrr.8
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TjmhxNW3pWyH0fEyjiE8omqGbyj6NoUAeQhtOPAI0J0=;
 b=p3j0BOOVhNvzvyAMcPlB2Uv6ddUoxKfV2ES8UwH0NYyQCEah1BY7GTiXdMaLjImvCT
 5mt7cAhRDyQ2ux4cVmRyqq5XAkO6HA7BnoWiPfnueu/aaRn18bAfU4ri+z/XVIAtLlM+
 nKt4byQQs08jq1K67kWdDYdnmPDkb7PgjtAlP42x4HyxjPftVsjT9quifGx4c0CPPSjH
 EYSikQoXvz2hHePloJ0Sf+ClOV8h38CL1XxAlygst82jKVefsXz0W4CZkNac0RcoSB4W
 V1Ir6XwuHxZc2QgkORxowB+eXH0vfJ8yAZPSz66G2W6KRtNpQT6mRxX4ZPDlBZW/St2v
 AGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TjmhxNW3pWyH0fEyjiE8omqGbyj6NoUAeQhtOPAI0J0=;
 b=JCCuBHoMCv7cxTrPOxOWc9NB/8WP1P2EiGUVBNfF2SLdXmq7ODTmiUz0bpVXG+knVk
 vW5gxkPmOOwyeK4Z1+3xPXghoEmbr1EKMnecXAJK7liI+0OvSHUSWYFCQoCG0h4qm795
 8sCS5MMsFT2sW+MPyDvJVYF0+NlRM1E+yrxIHnfaYcyTttbvCDwNt36NhdqV1a//E387
 rrUNs888qh+yVtKdMaSrj2v7tY9IdrfJeIj4npLxq6JMTMocEk3TTTEfvgxOdcxSsbqz
 XfRLM2UgpufdmnfGnjKxwzZQiSRZCcJ8uknEVf0anVAP1kz1qMsxsTBCoymPU9miu/bp
 Qh8A==
X-Gm-Message-State: AOAM5302n7bnNprMjDEQC9XTtZTwy0dxNuRqJZzA1m53dI6Uw1HZS0I1
 b6p28WLUGLm0SCTAfrQKsL4=
X-Google-Smtp-Source: ABdhPJw13WM4u0Y3Vbcy/H5CMPTWR3RbMdhwFNBOoU1BPoVcjVUoDUvR5SLPTDVfTVKaBxvW2ZQp1g==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr7823831wrl.181.1637059027025; 
 Tue, 16 Nov 2021 02:37:07 -0800 (PST)
Received: from [192.168.43.238] (85.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.85])
 by smtp.gmail.com with ESMTPSA id t1sm19264349wre.32.2021.11.16.02.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:37:06 -0800 (PST)
Message-ID: <151ba866-c56a-44c5-225e-9af3a099afe1@amsat.org>
Date: Tue, 16 Nov 2021 11:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211116095042.335224-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211116095042.335224-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.446,
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
Cc: pbonzini@redhat.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 10:50, Richard Henderson wrote:
> In ba0e73336200, we merged riscv32 and riscv64 in configure.
> However, meson does not treat them the same.  We need to merge
> them here as well.
> 
> Fixes: ba0e73336200
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> At the moment, configure for riscv64 host fails during meson.
> 
> 
> r~
> 
> ---
>  meson.build | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

