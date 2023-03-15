Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD56BBA5C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUUK-0005m5-G3; Wed, 15 Mar 2023 13:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUU9-0005ib-KW
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:00:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUU8-00023b-2F
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:00:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id p4so11755978wre.11
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678899618;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XuoZH8n6/y582VGtlT//Ved/gL6UQ8JXwf4cJ+tY/zQ=;
 b=ZF38jHOEeZ8KeJK75mSxpXWoqXaAQ4fnabKsIrXlwI+2Qk11NMTZiVmtGnz6Z8ByKg
 3aFAirWLFDJ6uV1GjRjWd9PDiq7K3MvajaW/Ksl+K/aWQ5BeYo2enaicEGerGlZ21iVX
 THLZ8nm6KH+MInipbDI3LS5PwJEP9DSQ5MhaNe+AvdB2Z5Hj7kJNUoplcNpe2KqVRv87
 gx6LUApRFNhcEnTNx+gpnAYLhGSX6OxoZvKLVc9R8jhPDOcPq2JmUwGQsXB4yUMsW0qz
 OM0q2y1fhodcmuC0wFThhadV51gBC5BJNFEy5WHXEyEnAGRcHQUc/KajT//9gaYOzidX
 0yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678899618;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuoZH8n6/y582VGtlT//Ved/gL6UQ8JXwf4cJ+tY/zQ=;
 b=nFDpHK22NhYJjF6SUubPPQ3a0XQyEgGxX6Qfkj4HOO2p4368S8v4iRvYdusnGnpmJT
 JnxJE/rYSE9SFbbLabr33WuADG5hJKvnT6dZL5f7NY7GOlDfUMnd19bEuTcQLiUzZbrF
 kmPe2SUc693kKoZGzBPhLGNPPaDz9/6V6Gp9/2ko9Im+6sRgroGX91S+hZIVp3DgXykB
 Jo4dqIK5Nzy8hZpvGZQlr8BD5+3fSM0FlkJe1PiZcaP/xJhiSDz3mkXxmll+qciaWtHy
 HiRW5wJt6nmPfDZLjFFsljR1mFFSYRbPZf3YTVKu9adWlnmtQnIU2ZQOIaxqS6OiHf1y
 95GA==
X-Gm-Message-State: AO0yUKW+ciF4oqFtu21tUsJ9r5Jpo6tLWthMqhPba6PHT9H8hINzuXkA
 W4ag+dJ6RDuCNs8+VnWZ8YSC9w==
X-Google-Smtp-Source: AK7set/MIxnjTpEP94LttF7q2m3Ai5GmTkUCC3xvEVHDvukr0FFVTLz4Bfg/jczpaLzlm8ng2wgxlg==
X-Received: by 2002:a5d:4586:0:b0:2cf:e65a:a5fc with SMTP id
 p6-20020a5d4586000000b002cfe65aa5fcmr2550760wrq.8.1678899618547; 
 Wed, 15 Mar 2023 10:00:18 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z13-20020a5d4d0d000000b002cfe1377fb1sm4995124wrt.70.2023.03.15.10.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 10:00:18 -0700 (PDT)
Message-ID: <37cc184e-2b5c-a841-1cca-34db745f27dc@linaro.org>
Date: Wed, 15 Mar 2023 18:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/30] tcg/aarch64: Detect have_lse, have_lse2 for linux
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 03:57, Richard Henderson wrote:
> Notice when the host has additional atomic instructions.
> The new variables will also be used in generated code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.h     |  3 +++
>   tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
>   2 files changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


