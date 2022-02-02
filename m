Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342114A7A25
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:21:56 +0100 (CET)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFN4d-0006ZD-26
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFN29-0004eF-UF
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:19:21 -0500
Received: from [2607:f8b0:4864:20::42e] (port=44005
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFN1x-0007Yg-HQ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:19:21 -0500
Received: by mail-pf1-x42e.google.com with SMTP id d187so385133pfa.10
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 13:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W08u8gWV2kdB1gWVk9clc7MVV2ByJqztbieghMKqd88=;
 b=dtQTBZ9E/WxLfWwENLRJmtM7P/eplbQKhi/+A4Q/oeFsZ8NdA8GGDcO/WDNbFECMfV
 ERz1EJl7BdfIe/THxfk0IcjdC1ess6JllyRrwBnxD+7oQrcSI4zcP0/qcDHIrR5HzEv0
 lU47Z/dxyXsOry9//OgGp8NkA1WKS43Dp4nd/wvLu1UQOk8arJnqdSYZ9UtgzNDGvqfA
 1Dry6xT5Cz+6mxfxIAIC19HYT9VBxWRvcYd0RTC5d5qVMnr0tv/LP2dW36tpctmQsiJR
 8c7Dwoiqtf6pGKSNdHrp2IPaV2RwsJnpVNBUXj5Cn6wp2kv+R+xWBO5c0MnpfstqsKPe
 Ksfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W08u8gWV2kdB1gWVk9clc7MVV2ByJqztbieghMKqd88=;
 b=H6pSTppuc0KjRvJyBeO6Ib0IoNVebaDXfZ4Guyc4aj6uZSP6YuRQVY2SaNyzJ90K8d
 fOZglXeTfYaPEvxqfbWb16bKBMiCgMnbAC95f6rnmJF+d2lg0JgQFCm7Ni4VQEOxgKec
 VTY95DZC2SiMrdN+CwtCCVKHUm91yUWn97ZP6r2mTGmgs9gh72ACHILgfo05crSoYPe8
 1f7g1VajhArcYmKdWGHPve6bmg7yExkYThH2RHwzrqC4z6idTljuV/tICHN873eJnbfl
 ap5iefNoeAb04cexiv5nKOfmNZLhMxxi/8mApqUxN44g6n6GGcxw8VlB6dz+msCRLysa
 3RKw==
X-Gm-Message-State: AOAM531oxG1/Qfo1KIB7ydEHPNqPy569GHlI0KO7AJ1lkmhdZt3DqbGW
 tWiJULuTcq4ReUfAQDE8kqXTFQ==
X-Google-Smtp-Source: ABdhPJxfO6OzfiRHWI/Q1K6QMkASbHHoz1L46ouaUdRv08Cwyalx1rPRsBKJx1r517sdCfck1fptDg==
X-Received: by 2002:a62:750d:: with SMTP id q13mr31322503pfc.43.1643836748135; 
 Wed, 02 Feb 2022 13:19:08 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd?
 ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
 by smtp.gmail.com with ESMTPSA id lt17sm6957073pjb.41.2022.02.02.13.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:19:07 -0800 (PST)
Message-ID: <2b280d2e-cc74-f02d-8b55-1c089cc16d4e@linaro.org>
Date: Thu, 3 Feb 2022 08:19:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 3/4] tests/tcg: add sha512 test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 06:12, Alex Bennée wrote:
> This imports the sha512 algorithm and related tests from ccan which
> offers a cleaner hash implementation with its own validation tests
> with which we can exercise TCG code generations.
> 
> [AJB: this exercise in copy and paste does raise the question of
> should we add ccan as a module to use for writing TCG tests?]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/sha512.c | 990 +++++++++++++++++++++++++++++++++++
>   1 file changed, 990 insertions(+)
>   create mode 100644 tests/tcg/multiarch/sha512.c

I glanced through and didn't see anything odd.
Could be a decent enough test.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

