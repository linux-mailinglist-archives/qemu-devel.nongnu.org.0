Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06513E8A2F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:25:49 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhgT-0004VD-1p
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDhf5-00037w-Jm
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:24:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDhf3-0008Sz-LB
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:24:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 6so1112517wme.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2yi5Y6HmeSItGk7+R0uFMPNVZATRlCwG7YyTWYyeAXk=;
 b=CT0C+vbI/9fu1l+kW/1GrvPW0vODdSJRRVUUFfZ9nK2PcVHxs/+A0TRLAWfOCzo1st
 Fz2or0r6YMn18lm53s9O7fihJYuQ8gL0FhsLnxoDCvMyc9M5Pp85F+hmH7LEVaVBSZm/
 exuyw7CTi4oRsRPfj2SQYpKTlowyZDkNcz3gov+KxWsZIiO3jhvcffa0LpeT7uLlRz+0
 ITu+Q63589tPTFfP8+fDdQ2pt8AuCYCIzf5CrwzB8HTuAowWV0GQjOPW5PnMXoCA08WM
 RQkMxNY4nISP8zb95effDgfKxBi3/8eU5skgWHTKMygU/DKgeU0my9Yhmv0A/ZeHZK6R
 E7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2yi5Y6HmeSItGk7+R0uFMPNVZATRlCwG7YyTWYyeAXk=;
 b=QAXpufGadXwvXI6nV8kRjVmB1kV/frz/quhCWpjcDLS4pPVR51j525P8IvdMs8CGz+
 ea5ys8Jb091gtuYkxrm93u1AwllJf1v778gJm8Msamb3uxaU0PcpYrAd4v2cyjs1fiGk
 9FNszC+T7Y+ZhFzmcO02BefOuBVJ/uudUZ2paQioSrFtwhL8JU/EVWXlO9AxU5rVRrAB
 HoIAj4IWv5vRhctxbjZ3tDEs4eZ8r4ID3azEBQdqKBYlf/ni4t5Gm90FFNOQI/DZmRY/
 kLPHx65Jhu6UW0kOuRcEqFb6f30SQJ5ZWQjNVd3+1VwKy0RBwlnFuAIUPY+nn/0qeIeD
 36yw==
X-Gm-Message-State: AOAM530NAnf7b9GYnytp28gxeQgb/6Jqlqv5ib4V8otxpcL8RmFrnt9J
 wHYmcJ1lsLDtZbVnfEHNJaM=
X-Google-Smtp-Source: ABdhPJx0FLcuNSrFWUP3rqB92G3TClS70tNQHcHttSvm1QK9tuhDhagfx3pHD8uegxyeaa3HQ13c3A==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr8060456wmj.10.1628663060036; 
 Tue, 10 Aug 2021 23:24:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h8sm4744724wmb.35.2021.08.10.23.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:24:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] gitlab: exclude sparc-softmmu and riscv32-softmmu
 from cross builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc3c5445-2825-2677-ac05-cffb53e7feab@amsat.org>
Date: Wed, 11 Aug 2021 08:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810140653.3969823-2-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark/Artyom

On 8/10/21 4:06 PM, Daniel P. Berrangé wrote:
> We need to cut down compile time by excluding more targets. Both these
> targets still have their 64-bit variant enabled, so the loss of coverage
> is mitigated to some degree.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 7d3ad00a1e..cfb576b54c 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -9,7 +9,8 @@
>        ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
>          --disable-user --target-list-exclude="arm-softmmu cris-softmmu
>            i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
> -          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
> +          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
> +          sparc-softmmu xtensa-softmmu"

I disagree for sparc, as there are some differences (sparc64 is not
a superset of it). However I'm not against this patch.

>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>      - if grep -q "EXESUF=.exe" config-host.mak;
>        then make installer;
> 

