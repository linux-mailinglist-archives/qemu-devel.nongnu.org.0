Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF96344C08
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:45:33 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONgK-0006YO-7N
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONeV-0004q4-V6
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:43:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONeT-0006fA-V9
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:43:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so9332178wmf.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/6O2d6NDJlDLxwWOE3b9CwBibI6tsQmjyR/KPGoJLfw=;
 b=SNwzcgkB1yrOh/UGgf5CnKBR53YxdGVtZGnoeenN0qgcJyaMiTJw0bBnct02cCmcDC
 IxLAY8JcufPiPokGoFPDp6PudKZ/N96SMDaVPBRSIeDItQMdva4rvjA4xglquxaLRqhw
 4qanlROxpNJZZc1NTC8ha28rWCFdnHhrmzpTYe3iH0hjNVqGiAFG3x09lRNzxS+W/J9n
 mrYIfTDpuxvooczZa1D0JHQR0+DLOw46vEObFkoO95Xw8P7dwqJqg4YHq/VDZovAzwch
 O66ElOwQFtjN8hiqqsn8u1lS9cib9UqnuxO1BpCoEfg5pCvJmhvbEG3YfAs7V4/H01q3
 /Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/6O2d6NDJlDLxwWOE3b9CwBibI6tsQmjyR/KPGoJLfw=;
 b=E7FI+LuwT5wn/Ro8VY3Qot0+FluazgfxxWWQQ1IDnYPoQQByltWS8StTUaM3Bpys/A
 EfeuTRnlX3iub9mZNrKZrc4a5ASVkYwtiwtk1xvaEPcgzRC72PEIbVaKmgHzV2zg5hA4
 pvnsXLwdzCvzoWQCcMNsOTbzWqCEfZR3PP/UFsxE7H3T6CYRFfX0cb+Oc7BvqpKzDIvq
 O/d9aj7TgyCqTx/pygxVG8GLZJZ2NMYTbXCRNUCZzmiQPN2zCkiUnGCuH7ZHhdelNR+A
 04RLHgSNB518Pyrysf8M9n1POayKdGM2fHU0JfWUHpwNKcgeRh6dQ3Es7Naa1GfPqqt6
 S5Gg==
X-Gm-Message-State: AOAM530Epczam7fyiNBRLnYtThfepx5oiV4HXC1Rpo5dbgL8Pf9rHy9H
 YxU09wG1PZZeZjr7oNJbJQQ=
X-Google-Smtp-Source: ABdhPJz7NJSBsyARg+3r8CBZSCazS6LlIPO6O0Asnj1TklSHb/z0XHkJuVdcA1RpsDgfuxnPcoGk1w==
X-Received: by 2002:a05:600c:2106:: with SMTP id
 u6mr645941wml.55.1616431416624; 
 Mon, 22 Mar 2021 09:43:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b12sm10159898wrf.39.2021.03.22.09.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:43:36 -0700 (PDT)
Subject: Re: [RFC PATCH] gitlab: extend timeouts for CFI builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210322142110.4766-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef1f8222-72a0-7bfa-2e93-a7cc0394afd8@amsat.org>
Date: Mon, 22 Mar 2021 17:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322142110.4766-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 dbuono@linux.vnet.ibm.com, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 3:21 PM, Alex Bennée wrote:
> These builds are running very close to the default build limit and as
> they are already pared down the only other option is to extend the
> timeout a little to give some breathing room.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f746d5fbea..9ffbaa7ffb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -502,6 +502,7 @@ build-cfi-aarch64:
>        --enable-safe-stack --enable-slirp=git
>      TARGETS: aarch64-softmmu
>      MAKE_CHECK_ARGS: check-build
> +  timeout: 70m

So this patch will potentially consume 30 more minutes per pipeline...

Having now no more free minutes, I'm a bit reluctant to the "give
us some room" approach.

Short term, this patch might help having the CI green again, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Long term I think the problem is we expect all runner to be the
same hardware while they aren't, unlike Peter Maydell machines.

Should the tests check the runner performance and scale the
test timeout limits?

Another problem is some "container runner" (runc) are restricted
(either number of vCPU, amount of memory, capabilities).
I have the impression runners on Kubernetes are more restricted
than simple Docker runners, which perform better.

