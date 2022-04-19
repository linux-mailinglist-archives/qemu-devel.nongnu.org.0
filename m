Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F05079D1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:08:58 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtDd-0003Xi-L6
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtBd-0001R6-RO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:06:53 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtBc-0006Ed-A6
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:06:53 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso2730774pjk.5
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=06K4nvzRg28X7DlcQzaRBvDKFdI/ErdosjD4jco6+3M=;
 b=eOJ3TUtLqMSLKboRReGhci+Yy64EcnGBPpCRWtpzEOXdDCEphHOJU+L0eqKN3Nrpgt
 2wjUHNcysE4AvYOqULLXB+ZVaUrnwWn6pccNWfWiXQz7PO9wpE8GhVEW7Xbhc3XIeVj3
 GREEITIZf8yGYIAO8S8vioSDfl0HvXx0g1PV+MAYlVVrmJhuRkF5xCNXc9Tt3CZsDKgx
 LYWEgBj5bwntcb01A2Yz4HwXvyPpqf1aqt7DJ8TaB1T6keRLoaDUhq5BwC3usdKd4rQL
 sRBX1y19D6hajuQ0B3GBpDXJXkNXCeOEDhmrqYlX13qq1Uatabx8C0APhpmIzk8tmq4d
 8LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=06K4nvzRg28X7DlcQzaRBvDKFdI/ErdosjD4jco6+3M=;
 b=noRcJWUwo02aEiILUnhtrdVceECvBIWjj++p8o66oWAc9A441oSbhaO08Ig0zxcgLA
 lbYlChRu6CAD634ySkGrp+iqixQKknt1taAcY4/i6S9NpLoWbbK1uEXgs5oARtWBM+rw
 5oDAXZkCodVpBvuods4l8R/DvUkfPa61mf6hxozjVCnaK4JrPBzjHwHg08osUfEjTZsq
 9QlH5hzgb54Ei3bPdWwJQy69NZZ8uRwbpDSHE7FbEfrxsSRlH3GddkEeMCjkjaU4/aXk
 SOywr2FPrxeSlk7PoT4VPLREsq1zAxGRHmTeaYlU/NAhKhRE/E0VviRGxuqty8jdwLR2
 HbPw==
X-Gm-Message-State: AOAM530rRkd5uVEIWmwiZn7mCQnF0txkts0miUszjdK9tDxri9RD3G6y
 fYmSgut+iT85LFD2em5QeWxm7g==
X-Google-Smtp-Source: ABdhPJwWEadRgBYesHuy5gLYQEKBij4a5KlaIJLVgf83QreFMa3EwfX4Da3jBmdvH5C+0DcLWGBKZA==
X-Received: by 2002:a17:90b:1044:b0:1cd:2d00:9d23 with SMTP id
 gq4-20020a17090b104400b001cd2d009d23mr90558pjb.124.1650395210874; 
 Tue, 19 Apr 2022 12:06:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004fae885424dsm18093488pfx.72.2022.04.19.12.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:06:50 -0700 (PDT)
Message-ID: <a48f7981-213a-6790-6e9e-6f1310224b21@linaro.org>
Date: Tue, 19 Apr 2022 12:06:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 19/25] tests/docker: remove SKIP_DOCKER_BUILD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> It is now unused.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-17-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 12 +-------
>   tests/docker/docker.py        | 57 -----------------------------------
>   2 files changed, 1 insertion(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

