Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A912D41345A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:36:18 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfwX-0000M8-PK
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSfqy-0004XR-Su
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:30:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSfqw-0002wF-5P
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:30:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id q23so17371534pfs.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qDLicoDmIhGKlLMsZXsYI4vzoHN5hXvnOncXZe20ywc=;
 b=UWr+Iwjly5NtO3RZsbuPr2na6TBFlFCJlXUv+WE6iZH1x8Mn8aQsQIYXL6C+g93Upn
 z2Y/ZYWd2v82ZLqo8gCaLIsvGSg8OMk1dz8SRScrE33DLFtObQoBDI/Ly4BB2in1d+ik
 cXM6jiO7hPWTsiPFh/WqR13LbzqPfDnF9/NcrJ4xmBDo+h1Fz+JcGNlYPqBz5M1l7f6z
 mY4OANyxe0tOc/ciUyo5eB2IG9VjscZrA7IzIOnVIKd5x/LxXECl7VA7X68cZ3obpuuW
 nNz5yJDiM3jXz5t/r31cgJTsCafrjzmkIklxv76jgnp9faFgczeeXOx9lVt0VGgrL1bW
 W56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDLicoDmIhGKlLMsZXsYI4vzoHN5hXvnOncXZe20ywc=;
 b=2hgDiWtX1ilqpji/t6eRt4WvkM687FoiGqxPUKtjDzFtBCePPUH6mnwvV8Q5A3q7mC
 ZR0s4XUhBtikaQxWlBXboAjLVQkIeHaea4QTVRjVVacCzpXl+RuBoJCHHe5nj3Zdjymq
 xgX6w2Gy0gETjL4U1wTMXGFf6wMb8VWpJo1Z7fpuAd4ssy3qieHiiA+otFbXX7IesjsH
 ZJ0iCI1OqBs8SFi/x1xDdusX9komKTLLpDjZx3QCLpP7uGU49epGJN7npigzCiiORw0u
 u44dyNdZRshi1jcx6PTk8sIH+Bzm6rq/jh0SvmHadDfqFjMV7ymI8t2HkgurJygtidmE
 P3uw==
X-Gm-Message-State: AOAM530KseiWE/jiot928d+rvUlswU9cRY78fRWynl4vn4KXb94vtIvT
 FWE/yjbLXqOhT2HMXb6I19CHT1xz4S2iUw==
X-Google-Smtp-Source: ABdhPJzXkpFMx3oWUe3djwf6tROP6fCX9x2cWHnIXjQo75z9zHvvLNAoiIRvro066JbLwZZDCUTakw==
X-Received: by 2002:a65:63d0:: with SMTP id n16mr28918838pgv.432.1632231028438; 
 Tue, 21 Sep 2021 06:30:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v8sm2700809pjh.24.2021.09.21.06.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 06:30:28 -0700 (PDT)
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8d75100-3d0a-7864-fb48-419f77a48035@linaro.org>
Date: Tue, 21 Sep 2021 06:30:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 11:02 PM, WANG Xuerui wrote:
> The loongarch32 tuple will most certainly come into existence some time in the future, but 
> probably bare-metal-only and without a Linux port AFAIK.

Ok, I'll bear that in mind when considering target/loongarch/.

> So should I drop the explicit probing for __loongarch64, instead just probe for 
> __loongarch__ and later #error out the non-__loongarch64 cases individually?

I'm ok with checking the __loongarch64 define, but I thing ARCH=loongarch is sufficient. 
That name will apply to linux-user/host/$ARCH/ and tcg/$ARCH/.


r~

