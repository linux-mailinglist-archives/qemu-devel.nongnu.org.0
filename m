Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AFF510B0F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 23:13:41 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSVA-0005DS-PI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 17:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSTS-0003VW-A2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:11:55 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSTQ-0008H3-SO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:11:54 -0400
Received: by mail-pg1-x530.google.com with SMTP id v10so5964194pgl.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rXJ02zLK37zJnlK+dA2+6gZT/OLBTNIKbGjfOZRGSQc=;
 b=wLBqcqdW9zmZrayPyMgZfpC/7Grkqe1FmMg8zog0QAOk+b8H9bX302yWijNh3WpU2Y
 DY9X0OB93uR5qOFUzduaYnRvCanTx6sLxXlVdqVmEWOaHkIHEzsFa8j30s9fycQtVANl
 FqvKguWCaOjAmTukFRvMcAaiCVDPdi3Uney/v5cuRtQBRA0klkEvFdYwGckOcFEz2grM
 YR2ytIy236sMw6775muWRl90vCbeHswbcvyouXtXt/1ccxSY3ZJypOPq2YNoYTZcrjvW
 isTtKAXo+anuaJUqLmt4w9/ZG6MIXk8cyI+eqGXl8Zk+AXz4HOFdCNAZ7Rd76M4sYLD/
 6jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rXJ02zLK37zJnlK+dA2+6gZT/OLBTNIKbGjfOZRGSQc=;
 b=ai4AJASdRfNgqiw0+A/JwgkTK8K4sHR4mOukbxeTHm1HrRiK46x+g8nZpJaVfGO48s
 +RZMXks4t6KoJSkoJOWqTyPcE/rWhj5JARnwqH21UPcgcpPUO1QbaCWlpXPfS/ovvbwT
 0SqH839qqTODBHsZscqj2+bkC0Rde+rKCGmJJiTPQHhH5jMGIrQdIvL4M7m2emaIzvM2
 N1gHzw6oHY1nIY6Mp5dda5Lge8J72+zfPvPoZMVe+Uyu8W3+Q6TrEIR0DZoRIjw5z+Lm
 Q8Vzc7+/hOjCBhO2t8UNLaMg+QEGP8ymbMYDiTnSrQCldh3NBk7xvD+/YCYQxWFGT81P
 yLpw==
X-Gm-Message-State: AOAM533pIo1+sSvbLRPST3G5fsqzGYZUz9kbZxh6mfI/8IxB7l2F/TAe
 7kp1Bb33payEEyBdL2f2b/Itmw==
X-Google-Smtp-Source: ABdhPJxgmlADNcf/7IJIq5g09409+RkPRMwtv+mEEfCPCLBJv51iTGmrRP0wJ2+ueWelgmzRXtVV0w==
X-Received: by 2002:a05:6a00:26ca:b0:50a:6ac7:5014 with SMTP id
 p10-20020a056a0026ca00b0050a6ac75014mr26658553pfw.81.1651007511584; 
 Tue, 26 Apr 2022 14:11:51 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a17090ae50700b001d7dd00c231sm3911294pjy.22.2022.04.26.14.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 14:11:51 -0700 (PDT)
Message-ID: <a06c7853-cf2e-9df0-402a-1c12978adaa0@linaro.org>
Date: Tue, 26 Apr 2022 14:11:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/20] target/ppc: Remove unused msr_* macros
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422185450.107256-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 11:54, Víctor Colombo wrote:
> Some msr_* macros are not used anywhere. Remove them as part of
> the work to remove all hidden usage of *env.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h | 21 ---------------------
>   1 file changed, 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

