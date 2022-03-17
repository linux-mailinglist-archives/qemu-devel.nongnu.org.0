Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518014DCBAA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:48:24 +0100 (CET)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtIV-0007YF-5s
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:48:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtHR-0006pe-Ft
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:47:17 -0400
Received: from [2607:f8b0:4864:20::1032] (port=35402
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtHP-0007UA-Vt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:47:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso8142688pjb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ML8uBO+9+xQDoTsgmPxQxovHxmxkBOoFOZ24jPVPoaw=;
 b=Lx11CNvdv01aGZLJGLnz5yDgfKFjhuJyInfye7IfB8dQ6I2H0ZbtxTuPFFByeB/kfm
 abpbUO1oFuatX+rZGxtCGozuHZJFKt6jMx/k6a8rcfkoH9GyVRVkMDhmuqY6N99o9+4j
 1nSnOrBnV9oz33twH5zvRAUPkjXQfsx9aWDKuQOoEa6yIc8ZM9xjObXBy79cf8Ot2/nw
 nd7ZWDsAoue9CmPXTta7PgDSQA0lbSNHEjMgpP/p/excD1qUPlnfR0hhwV8zJw4gfLvR
 mfdZritcHdLkm0huNIYt08WWxW9tlZWWdSAKcpPjpP4fW4syKnL1k5E2ZV45vuhCuKRL
 gYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ML8uBO+9+xQDoTsgmPxQxovHxmxkBOoFOZ24jPVPoaw=;
 b=o3Y6WYY/EQq/tNzgkFIMehLpNrnq4IQI7XsBoQ0gCzMQ65gsOfoCz35wG9n/+OWCKd
 Y6xOg9HI2zcNwA45SrlIrfqMmzZ4cLLbwhMqWplgooi1GFSkz9pDubXBjNpEBGBG4Wi/
 4lWmz926E3nKQo1ZmriUgq8RLRy387rXWMnVIjcPpuCcrNYkaQggAVHnhX3/CRBBwMqh
 8QZ2NCbuLTUHlzUevzy3Ii2uFEsHVsb1tIvfxxtGK6YyXR4GKF8dn369IKSyK814XuJP
 98PFntce4uVXDWKiD1x9HwkE6BGgcxLL7LA70oC8pwezkuuCLyWpPylEkoEM8otSKETW
 Hq7w==
X-Gm-Message-State: AOAM532nQGUT3b5oKJ9aKzfO+aPQYL+kiW6vqAtbJnvwE0KKB5m7fJVT
 nyJ6mB5uX29uZKrnDEclu1MIPg==
X-Google-Smtp-Source: ABdhPJyefcILAnahey4Z33zhosgZjLzxoADUW59N335ocoUSFMOWmyA7xkXHDX/7Njcue8n+1Z43Wg==
X-Received: by 2002:a17:903:1c8:b0:153:b4bd:3c43 with SMTP id
 e8-20020a17090301c800b00153b4bd3c43mr5652974plh.114.1647535634241; 
 Thu, 17 Mar 2022 09:47:14 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z2-20020aa79902000000b004f75842c97csm7837895pff.209.2022.03.17.09.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:47:13 -0700 (PDT)
Message-ID: <6c013a91-64e2-b213-6014-3337f09b72a9@linaro.org>
Date: Thu, 17 Mar 2022 09:47:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 23/51] target/nios2: Handle EXCP_UNALIGN and
 EXCP_UALIGND
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-24-richard.henderson@linaro.org>
 <CAFEAcA-dwaHuLaBSqKX3fj2+-e_=mgsKYT1E97EF-H3yxBufuA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-dwaHuLaBSqKX3fj2+-e_=mgsKYT1E97EF-H3yxBufuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 08:27, Peter Maydell wrote:
> On Thu, 17 Mar 2022 at 05:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These misaligned data and misaligned destination exceptions
>> are defined, but not currently raised.
> 
> nios2_cpu_do_unaligned_access() seems to already raise EXCP_UNALIGN.

However, we failed to set TARGET_ALIGNED_ONLY=y in configs,
and we don't set MO_ALIGN, so it never gets called.

r~

