Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2449344650
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:57:50 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOL40-0007Lo-Gs
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKmL-0005lD-Pm
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:39:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKmJ-00007H-Ls
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:39:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so16858377wrt.6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B5kuefvIYUys7TnQ0ymrK2vA+VBzUvXgsoZK5SAK0/s=;
 b=KtZLm4+LsD5DAG2CZozuPaEsNwOqmOV0Ps8bc3eX9TxsXrZda8k5WW+f+VlQSAafAs
 cher5HzRrN3+7DTqVnQ/5IYFU/FFKDggKGcqS6OQKK7JUkBmyiU7Pn++5gclZeGFCpF2
 1NtuIGHJWDSWn6KWyRu+2Zg8pU27FzwdA70pKtfsHh++ERjNhX2MRikHTbebB9TPMlj2
 meWXxiD2Xc4INtd4lTa9qPjCRrwd+Ov10KChAy2g/XrtamwgcGu1w1adTe6PXk0fp27+
 2rY78xrSe1P/TZxMjlMwGyN+1QDMhaLUOQVLVimAbCC8+DFXbXYbT4xqJ8WJDS2y3gJw
 zaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B5kuefvIYUys7TnQ0ymrK2vA+VBzUvXgsoZK5SAK0/s=;
 b=XZGFsEze52dL6OHwTXSJT4A9bTvJrdU9RqcY2obL+JqwAzBggpJGr43slCnM7B6AW/
 M4dXFYPZhu8cUforBw2M2lJr0M1saQEvC1TcGHyz46A1jSHp72om6JHC+D8OCxAnuJsi
 vBjqEuTMuTXcAE+zZAxbhU4pEgZ5c7JdFXxN0GcA3HsH0I4LKWpLsWwm5nDENlzN3rKe
 QzksXAuHvJEfD7Bg1QKJ+tBcnRwI4QK+dxXRLNxSvErWNmLlrouKFckX6ub1hv5LeISa
 6N0h6i4/cNzDWgj2aol+23mGwsxJiGUlEwGwc5L1GWbyYS4g0CYPoRMTHdbz9Ooj0GEM
 qN9Q==
X-Gm-Message-State: AOAM530Ytg/J1Lra10IRpdV59WLf9Ui3yCmixvSzvBA86uXUkldRUp6p
 gGmPo7FAhPCX263rzLTEs+U=
X-Google-Smtp-Source: ABdhPJw895M3A3ka3nEBXTt+LEx6sbPk4cK24hZC0fEfR2oFMCQXptbLNezz/2JK0Raxle7hUOPNfQ==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr16168605wmb.2.1616420370105; 
 Mon, 22 Mar 2021 06:39:30 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c2sm16610771wmr.22.2021.03.22.06.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:39:28 -0700 (PDT)
Subject: Re: [PULL v2 04/15] gitlab-ci.yml: Add jobs to test CFI flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
 <20210310160002.11659-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a374fee5-7771-c9c2-489f-d496d3042196@amsat.org>
Date: Mon, 22 Mar 2021 14:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310160002.11659-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 4:59 PM, Alex Bennée wrote:
> From: Daniele Buono <dbuono@linux.vnet.ibm.com>
> 
> QEMU has had options to enable control-flow integrity features
> for a few months now. Add two sets of build/check/acceptance
> jobs to ensure the binary produced is working fine.
> 
> The three sets allow testing of x86_64 binaries for x86_64, s390x,
> ppc64 and aarch64 targets
> 
> [AJB: tweak job names to avoid brands]
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
> Message-Id: <20210305092328.31792-9-alex.bennee@linaro.org>

> +build-cfi-x86_64:
> +  <<: *native_build_job_definition
> +  needs:
> +  - job: amd64-fedora-container
> +  variables:
> +    LD_JOBS: 1
> +    AR: llvm-ar
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> +      --enable-safe-stack --enable-slirp=git
> +    TARGETS: x86_64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build

FYI this job is timeouting:

ERROR: Job failed: execution took longer than 1h0m0s seconds

https://gitlab.com/qemu-project/qemu/-/jobs/1112829128

> +
> +check-cfi-x86_64:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-x86_64
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-cfi-x86_64:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-x86_64
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
>  tsan-build:
>    <<: *native_build_job_definition
>    variables:
> 

