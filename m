Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB36224D1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osfkQ-00066L-4I; Wed, 09 Nov 2022 02:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfkC-00064N-EI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:43:35 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfk8-0004vx-84
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:43:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso655665wmp.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m6FLeR39csL5CCjliAwP1DH4Alh12cwwVCVx2uAdybs=;
 b=rzAFbg5JlEghLxmwOJ0xA7/BFxq8rnJhBQs8MDPaxxuRYuIIdoEzv5oYIE2yzZvTvT
 u28I/zCa+ZSCN1ioCizi3IKc8JB4hSM+ZpP6med5K19IxBokTvjpABawUuV8gSSyE2W9
 7STqItRCXLPt279rkcRiZEPLZvC88wFZYCTEhmUvz3RvbB99pmDBKjeo/JjSlOuH4Ueh
 m8qoi5iBQLWDRRsK1+bPoL/RuUnaf59GghTmF7mRuNV4BGXz/LvnrXGQ8lpuL2zHL3tc
 jmAOepsLZR6bvl0QMwEa9RFoCSdiA4EmVW4QrgLwdNjG0vjpVvYIPW10GMTsPguzXLTU
 b9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m6FLeR39csL5CCjliAwP1DH4Alh12cwwVCVx2uAdybs=;
 b=kezMfSi7frXafw1sev3eGon/Nj7yhNtvl1/eg/GURFaYxGnRcoTXEYiupjXggC0+KE
 atuwOf7V0nx6GrZvllgK11hEueTqBp3vZvbS1GAUVQG+jdpkz+PcV2Jv892uL7SAlZdB
 2O/o+KkK/uOQkE6e9xk4ecuEeBG/S/IgbtR3xUKk7iKV9pp1ntvnce7/999GWqD85XwA
 Lh8E6jGlo7vSVrIti2NXzs4mzECNUVB254Bz7Se8p6gUw2kzJ16O3bLWWHYQ5W4xUu8w
 alRZAuG67P/mSyyUy0cPHb01bHYhZFCKRg+xR631sJMpv3y/k5gJ0shz2cC4E9G1o/yF
 v7GA==
X-Gm-Message-State: ACrzQf2bnLGzR8bI0O9HYiQ0GpygIEKiK2Pi4mSqWEJeqqcBDb03tJvK
 WJ5V+9tNv8SsAoSIUgsC8h7jww==
X-Google-Smtp-Source: AMsMyM4IBwFwIymo1BLhm6pz3N7X7v5pLt/yguCa8AiCRMJt9exyw9O6p7JeMm1btquNhTEtWDGE8w==
X-Received: by 2002:a05:600c:3655:b0:3cf:7082:dc18 with SMTP id
 y21-20020a05600c365500b003cf7082dc18mr35141337wmq.36.1667979805019; 
 Tue, 08 Nov 2022 23:43:25 -0800 (PST)
Received: from [192.168.63.175] (218.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.218]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600010c900b002368424f89esm12345547wrx.67.2022.11.08.23.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 23:43:23 -0800 (PST)
Message-ID: <898348ed-a9bf-5e4a-d389-b60a456ccaba@linaro.org>
Date: Wed, 9 Nov 2022 08:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PULL 0/3] Memory/SDHCI/ParallelFlash patches for v7.2.0-rc0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221108183352.9466-1-philmd@linaro.org>
 <CAJSP0QVdQ=wTtgNVDChzu5U1ww3SZAa2HfXjuE4z5uOnFeT_bw@mail.gmail.com>
 <CAJSP0QVZ8D59AM_tvgHzdhqF6EUefUgmyD9WMtfPUD=nn54v+g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QVZ8D59AM_tvgHzdhqF6EUefUgmyD9WMtfPUD=nn54v+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/11/22 21:57, Stefan Hajnoczi wrote:
> I've dropped the SDHCI CVE fix due to the CI failure.
> 
> The rest of the commits are still in the staging tree and I plan to
> include them in v7.2.0-rc0.

Thank you Stefan, sorry for not catching that failure sooner.

