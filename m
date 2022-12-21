Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E182652F60
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 11:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7wFp-0002FB-79; Wed, 21 Dec 2022 05:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7wFk-0002DC-8L
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:23:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7wFi-000162-Kk
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:23:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id o5so14444633wrm.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Juxh6VY0t33DdpLRnexiznnjRZLdj9SjB3aiBTfWpk=;
 b=dhjwZPrJrYzuDCLVjAgo0Lr0GIrvPZ+5RQ8oU9geiVMZcDiDgfM3Cyx6dhnrzVGSVo
 Ew47bsEdSUdOlDPKA5Wdy81I2qpChoPvpfBq19fr951lrtgzfOmv6yEh3DtCsNPHWMs4
 a92GlS/knXUwJEjg0suIveuxQIxKOgj5x50LEReVNqjksaEVmFXi5RvDZbZ9CgBpccpY
 Gs0Hz3MtfiwdEr8GkT1pLtshfwpVwcUdYAV1y6hVwz/zd1llQ7cP6hHaOLbsDD+aZGyL
 De5iV65cLHQ6asB7S/C+b0LYgPxwk5nryZ85qaLdPJt8PRj+seQC2grxXToPM3wo2Tn+
 JGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Juxh6VY0t33DdpLRnexiznnjRZLdj9SjB3aiBTfWpk=;
 b=4I3rZ4bKK90KLg8I+BtPWtB7ytVwbiHlVkNdy0NJIgnhj5nMvuY+TXbtLBAJ+8pfGv
 WMSD7VlqgIXr4k3IJdupt5YRttGSYM9RF2n5y9Yb+nI5R/wWuSTIVb8XlmwOAp++5LuQ
 zgNr3UwgXX04dZwsic1P4Qn28sKrvv8VzIKYLMfGHzgA7ntswASj3M7mmHOizdyPU02R
 REbAflZova2iEfHB47uT4OdaHOb1eVZDf5VuwufWN3Kt0jtBL24Bpj3fygITsqzer6tF
 Ht7T2MEo7F7+yfIUslPK7s2j9rraQG/pY+RUnB9IS+cl2tb8Mwmchly5tTY1IOtIG00u
 rgbw==
X-Gm-Message-State: AFqh2kpVGBKk86gy03JEdV9Yt3g8hBKEi495Lmj0c8jvUctOJS2zuqww
 UYwrKt+yzc2xjhgGabxTXAau0A==
X-Google-Smtp-Source: AMrXdXseUHPsAYuOnGpKo9gFlmZm5vtQCI2Ueh4LqG6ngAiGHlx2wOPGsZn3739iLdnxgoyE4fj0EQ==
X-Received: by 2002:adf:de05:0:b0:260:4cca:ffb8 with SMTP id
 b5-20020adfde05000000b002604ccaffb8mr819498wrm.36.1671618188989; 
 Wed, 21 Dec 2022 02:23:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ck13-20020a5d5e8d000000b002425c6d30c6sm17528708wrb.117.2022.12.21.02.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 02:23:08 -0800 (PST)
Message-ID: <072d1b6c-6759-c684-ab29-4a947388d72e@linaro.org>
Date: Wed, 21 Dec 2022 11:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/6] current status of testing/next
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221090411.1995037-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 10:04, Alex Bennée wrote:
> Hi,
> 
> Here is the current state of my testing/next tree. Nothing
> particularly out of the ordinary but we do now have a binary release
> of the hexagon tools. Hopefully this time without the header damage.
> 
> The following still need review:
> 
>   - tests/tcg: fix unused variable in linux-test
>   - configure: repeat ourselves for the benefit of CI
> 
> Alex Bennée (3):
>    gitlab: turn off verbose logging for make check on custom runners
>    configure: repeat ourselves for the benefit of CI
>    tests/tcg: fix unused variable in linux-test
> 
> Mukilan Thiyagarajan (2):
>    configure: Fix check-tcg not executing any tests
>    tests/docker: use prebuilt toolchain for debian-hexagon-cross
> 
> Thomas Huth (1):
>    gitlab-ci: Disable docs and GUIs for the build-tci and
>      build-tcg-disabled jobs

Possible candidate for testing/next:

https://lore.kernel.org/qemu-devel/20221221100254.1352686-1-ale@rev.ng/
"[PATCH] target/hexagon: suppress unused variable warning"


