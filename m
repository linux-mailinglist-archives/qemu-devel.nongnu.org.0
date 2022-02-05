Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C04AAD16
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:49:10 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUnk-00077R-Rg
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUmr-0006Sx-Nx
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:48:13 -0500
Received: from [2607:f8b0:4864:20::1029] (port=52084
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUmp-0005Y9-U6
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:48:13 -0500
Received: by mail-pj1-x1029.google.com with SMTP id y9so1659810pjf.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GUUSLla3rWG4w0yox8U5zUoQFS66wcqp2kIIbxSZHmA=;
 b=dBLJoIWF8DsUYYVNw/Rz6gG/toTQtsUDXSK/pjFD1jWwg5T2OafRdx/XM4dcNRk6yy
 dYKIO2vBVy6r6q6Lo2d+ksm1O40WnTcHo9Q+dyC9uVFZzEUXjoid3vbaEVnegwitmF/A
 Dbn6DPPTVxUJ6DHdM5cjzOq9ehx099s9hqs/LDclL/26adWfRwlcWcn4Lgaafgwdousx
 i8gjwOOCPgdDgRrhJMIzjPHHcnvxdjHtXZkAl0Yt67N+UBBS3aaPUGoMRMWuCmO1bigw
 ngLO6eo4TsCg9AcHOFnvneW/jh5F1hrro4g8ONWYb1CwGKcqDl05sEb+IXnUkOOa4bnn
 rbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GUUSLla3rWG4w0yox8U5zUoQFS66wcqp2kIIbxSZHmA=;
 b=bY6BFK7BiO+hQuRzug49IK55H8MKzKWw6Ag49d1sDG/t9DG2/AArxpDEt+BgzI8Kyn
 vNwnHQEXbUK4e+0Ue8WMOqDnRSrpT9RdZeJql966Ug1ic5QW5GiTjnbpL3S2g3xPrvYZ
 uDA4Qm62Xcz6q/dA+36C6IZDA0O/N9JjBTtsuY8F9pICMY0sNlXs9nUs91VQMlYZQtsq
 gSGpqniVup0h4A5TLQ7q6+1VPrqO7zh6/kpIRia8pODj/xqF8Gj6yZH9llJNd7ds1f3d
 GPyHhVpy78CMm2oF37UibefS1pSYWj73s90/L8mt47XGJcJlRu1HrGeJVslu3YnqymFA
 3NtA==
X-Gm-Message-State: AOAM530mWM/AJc0cjA4FnhJFKamR06Fyltzs/jCLM2P7xSwTnduqQFm8
 NGh2pGAWiGj/0NKSEMa5bMpP7g==
X-Google-Smtp-Source: ABdhPJzzEKt03p3OGTZR+HWHQD6r4LB3Snz7FlmLe0qnA1sq8hoIAjhSWcJqibZxQ2yWnKSYGfYQFQ==
X-Received: by 2002:a17:90a:be15:: with SMTP id
 a21mr4281354pjs.123.1644104890462; 
 Sat, 05 Feb 2022 15:48:10 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id z1sm7054989pfh.137.2022.02.05.15.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:48:10 -0800 (PST)
Message-ID: <80b645ca-016d-52a8-e0df-5aafd00ab9a5@linaro.org>
Date: Sun, 6 Feb 2022 10:48:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] hw/tpm: Clean includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 2/4/22 06:37, Philippe Mathieu-Daudé wrote:
> "tpm_ppi.h" only requires to include "exec/memory.h" to get
> the MemoryRegion declaration.
> 
> tpm_ppi.c requires "hw/qdev-core.h" to use the DEVICE() macro,
> tpm_crb.c is the only source file requiring "exec/address-spaces.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/tpm/tpm_crb.c | 1 +
>   hw/tpm/tpm_ppi.c | 4 ++--
>   hw/tpm/tpm_ppi.h | 4 ++--
>   3 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

