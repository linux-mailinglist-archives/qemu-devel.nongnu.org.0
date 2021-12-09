Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FC46EF1B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:49 +0100 (CET)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMlm-0007wD-Nl
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvMfj-0004kr-NG
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:53:31 -0500
Received: from [2607:f8b0:4864:20::62e] (port=35754
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvMfh-00063F-W7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:53:31 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b13so4336031plg.2
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tr8/B4mZ9gWLESI047+uVxwVJVUqEtqFA6YkAYdKDzM=;
 b=JylrX00+JoxKlLSFnFBvgjusfNoRnGj4jWw5YA+lZ3dh3QBNfJuokiRGJEl9pV3lpu
 vsMlHK4fTkQKhdKOO54+hdBHZW1/JvcVTJRjHYRR3G4nitoEfVUc+4NXPggtrARpNQza
 OXa8yaVgL2HWnNDhaZq80TNBQH5NAuCtPHUsvEWyxniEFR5rynlK9N9ZS5vrH5FjMXjO
 hDQG1Vw/uIoMo9KB5fbdsqfzshsap7ZPxgiqrfgBqzc/qWpFA/blf//qowmZEa2fBxLZ
 5ctxBF+PCpwWo1TmXK/4Fq7Fvaa+tAtLSjCfaEeeVZUE5G5DEm5AWdOo0eVTFvMpQdYJ
 uWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tr8/B4mZ9gWLESI047+uVxwVJVUqEtqFA6YkAYdKDzM=;
 b=ZWZ3tHT7Cn+nCzfKGRLI94mJv25yWQhI4zdAMDfN+6NwTdAJE2MrRU41p5mP7qFMSb
 qZ3rYnEyPuvm424v9F4gQC1+jKiegalghlG5mkot4dN+3z6iua0B7b965KAIqEw5r94N
 1eh7IJezQsChNwoAYYRaT8qIWzhGglMOn74w7LlnQClxUUUp48ZlQbup1Vn2x9S8X4pe
 UPj9xNlVVa2cS6jn24C9mAlM9S1vztMcebh8nPPuM1F4kGX2K4c3c/psXcrJccda73sD
 t0449j+OapPsPPa+A6gXQy2iGksaQrqCFkEM8QteroL77BrHK6ZrrdY3aRfG7SxQeoNH
 vYXw==
X-Gm-Message-State: AOAM532WQ3ZQIex6+AfUzeCJgcoEKYK2qstnM1WB14v53gCsJgin6fee
 jqGGO+jIbAM0lrtMvv9Z3IO3EA==
X-Google-Smtp-Source: ABdhPJyLcdP0ZXXvt45xJMK3I2g7OGiEMAjlLs9Dldoi9vDmcy1klteiUTyW0L9mB3waAJG5qkMYuw==
X-Received: by 2002:a17:902:e74e:b0:142:fa5:49f1 with SMTP id
 p14-20020a170902e74e00b001420fa549f1mr68619442plf.84.1639068808406; 
 Thu, 09 Dec 2021 08:53:28 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id y26sm182472pgc.72.2021.12.09.08.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 08:53:27 -0800 (PST)
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211209152117.383832-1-stefanha@redhat.com>
 <CAFEAcA8mpWWZ0YS-FX8zCy6fZmCi_oznZ8c0N9mzyOqzVX1HMA@mail.gmail.com>
 <YbIv/yz/fLQq+eOP@stefanha-x1.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a2447a7-461a-2959-e680-caafa86b8af2@linaro.org>
Date: Thu, 9 Dec 2021 08:53:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbIv/yz/fLQq+eOP@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.803,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 8:34 AM, Stefan Hajnoczi wrote:
>> I'm not running the release cycle this time around, but: it's
>> already rc4, pull requests by this point need a clear justification
>> in the cover letter for why they're really release critical.
> 
> It's late, this isn't a show-stopper (block/nvme.c is not widely used).
> Let's leave it for the next release cycle and -stable.

Good.

Unless you want to re-issue with Cc: qemu-stable included in the patch, this can be the 
first PR of the next devel cycle, since it's already here.  :-)


r~

