Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EDC4C51B8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:47:33 +0100 (CET)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjN6-0007Oy-PV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiWn-00007S-QS
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:53:29 -0500
Received: from [2607:f8b0:4864:20::62a] (port=44634
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiWm-0004f7-DJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:53:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q11so5875815pln.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hpRnt69voxFVO5vI+Dxv/d+3566lhscbWS/ONKF5myU=;
 b=H7Ndrd0octNwgf7iAOvCignB7DM/LsvVrsijDMO/dUCWOm2PPcp1giWA37HrA4ro/j
 ReRHYvGx5LD8lbNTAB5Y/vvAKzROy5dtgAVmgqP4P1UXPc1hmCl+JX8MmFFODwMRgqe4
 Hp11s9eCjbSRlMNZF4M5Ww3YwtW+tBmqV6DX60cZ/iV5tlDZ5GcJVHbMu5Cw06izX/UD
 KjGn/xmL3QuTeeEbm0iS2vPFrEvEYKYnbeT7NnQSIuUUKX/Q+kkp9Jf0/T8OJHm0zAbc
 6y7uWoWL7x3dEN5e6xISaOPPLydysBKyLLb+r3i8U1Tu7Q6ZnAiPpN/xO2LIbDHWTEwC
 AugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hpRnt69voxFVO5vI+Dxv/d+3566lhscbWS/ONKF5myU=;
 b=i6+XI/SGrhHFcCssorvppo/mZURuwaye+BsJQOruZtSqKdaveOuN3mWLhyjxZW3WuH
 UvnDxJJBSRVYQ93AEPvhq3b0fZ5sAWqLVmHptuuaVuXBessMGUvxFHoPrz/R6hSRkxKh
 4Ku6M3Mi7kX4JGpcp0Sn6Zo3zdjEaIZ+VqIZO6fWdxeCle/35FzEgCb694QIbmglPb7d
 IJu/ZzFXdEoZ623Sjs6BRGUajeGQhlUEaO015IRNEt46qxHheP7iAa/4Gw7OXpCgkNdy
 xaC+UBtk2XwSE/ThVYBXzbmSxrExfqGm1xbgLZcmuSsgUmnZoPlLl8iIrnbMwV49Nrct
 QSmg==
X-Gm-Message-State: AOAM533HPlTSq8GL2h9jbhgWuHEPBktyuSKwUHtpEViwmYRq2+dNwBWm
 pbZA0FmG8Ph1WdmV35tL97M44Q==
X-Google-Smtp-Source: ABdhPJzFQJzNRS9yyG2DS+OmQpV+B7FEBnCNL3jDyzuj0q0ey3WMBFGyhrwGLnHIQ38OtVXRH19/sg==
X-Received: by 2002:a17:90a:d314:b0:1bc:d942:2606 with SMTP id
 p20-20020a17090ad31400b001bcd9422606mr5127050pju.169.1645826006909; 
 Fri, 25 Feb 2022 13:53:26 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm10146133pjn.34.2022.02.25.13.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:53:26 -0800 (PST)
Message-ID: <bfe0b459-2e1c-2a78-dec7-8e33aee02fcf@linaro.org>
Date: Fri, 25 Feb 2022 11:53:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 35/49] target/ppc: Implement xxgenpcv[bhwd]m instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v5:
>   - One helper for each IMM value.
> ---
>   target/ppc/helper.h                 | 16 +++++
>   target/ppc/insn32.decode            | 10 ++++
>   target/ppc/int_helper.c             | 91 +++++++++++++++++++++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 43 ++++++++++++++
>   4 files changed, 160 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

