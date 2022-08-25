Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF165A131B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:13:46 +0200 (CEST)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDc9-0000CO-3e
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDaa-0006Ip-Tk
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:12:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDaZ-0001R6-Bq
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:12:08 -0400
Received: by mail-pg1-x534.google.com with SMTP id 202so17995553pgc.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=gqJfQzU0wCVKePAPCq9CXnmkpmbhY/4rPHSB54tEfVA=;
 b=K2HgSDmQkci5b2i+DmEmpasmanyZYQ0dCHGh/uoiuhxfTAcCwEv518fxf332C7tWLI
 tRqTJHq1MLa469Lta9k3sVv6zBdS/Rv6KFgxYeEzd81YgFpWU1H+jfd0nTbPvUdMEJXF
 ENsSEncTpIw3ENuHA2ymBX0NkYaiBcP+Ovzt6fiPAd8YFOiEMcOYQKXIeFPMhp7DioBz
 b1GCvj2ulv2CfM/8pl8rdfJajEF19+QIbjB85TTihZvcUZAD7jZexUQqzpvBEP7LY5c5
 MDR9K4nrDmaTwLN7eoX++t+i0t2Tb37f3JkPZqMfCHwQYGOhKU+YSJqwZZd9FqlnUE+0
 iSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=gqJfQzU0wCVKePAPCq9CXnmkpmbhY/4rPHSB54tEfVA=;
 b=zr+Q705C6GFuN0K08yHYjfdDJc3duWEwDe78wq4hjmXY4bMeQqfN66lsBgq3Q1w8Cj
 lP8o2PBMn/1KaEa2r57uEQ8UGeasBq6YsxvTXInnMfb/GMjOJLhjiVuQeMOffQohNTkP
 oxjyczVY0pmqG8DwJDfbjOfaKsRyoeUql8Af9aUnTvHKRKdoQn59MVBQQlcqUnI6Slz8
 5K1xR5adjkP0Wtdu5aiwUOm/SPDUzfQwKdrXxcisajcWdHOxhsAL4t/WjAc4HDcZ2YY1
 c4C+qVaoNd4L/s+XH++/5ex/pnZcYhNOP4G7DFYYk9a+i8xg7ki0V2RrbYyFPbP79lfp
 F4AA==
X-Gm-Message-State: ACgBeo2izekMKXbm1kE+mUlyiQxDocXCer56VRz5d781tIlZ+Kb0V/ej
 SHMbwW/B+xe9cfu/wtU5YoI=
X-Google-Smtp-Source: AA6agR7L8l0jn9KO4FZiJIC9Ff3VqDx7m40Wvnp8m+F4tRKZerbiEZy7CZqCBrC9s7yrLiLfiL29Yg==
X-Received: by 2002:a05:6a00:1650:b0:52f:20d6:e858 with SMTP id
 m16-20020a056a00165000b0052f20d6e858mr4441428pfc.36.1661436726145; 
 Thu, 25 Aug 2022 07:12:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a17090a4eca00b001fa9739d951sm3541007pjl.33.2022.08.25.07.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:12:05 -0700 (PDT)
Message-ID: <3e889293-6f7b-78cb-e2ec-faba6dad59f0@amsat.org>
Date: Thu, 25 Aug 2022 16:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] configure: improve error for ucontext coroutine backend
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220819170251.227526-1-pbonzini@redhat.com>
In-Reply-To: <20220819170251.227526-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 19/8/22 19:02, Paolo Bonzini wrote:
> Instead of using feature_not_found(), which is not a good match because
> there is no "remedy" to fix the lack of makecontext(), just print a
> custom error.
> 
> This happens to remove the last use of feature_not_found(), so remove
> the definition and the documentation.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                   | 11 +----------
>   docs/devel/build-system.rst |  5 -----
>   2 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


