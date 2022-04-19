Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACAA5078F8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:40:47 +0200 (CEST)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsmL-0007Zm-W7
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsjA-0005FO-SI
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:37:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsj9-0001Yl-8C
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:37:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q3so16638491plg.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oyu3Xb4NcNqF1n7HxAz67X+M1Stgorj2k/ZpbP/TRJs=;
 b=X+ODl3JYkLRQYHgby8sSD4x7OdSUEJhWvIMvbAmGWC0J6243RBze5pQ+N3XcZzmPf7
 6kb141+4rp/SydxJLVDmAlt1sWNL1tZjZWakJF0gcDrvENBa5rth+k/6vTOByeQuy9A6
 eSiEKLQGfieR7gSFHlwBs050ieDQOMUBZzxRM0QZPI6T8howLdRNk00C4qVye59/I0eH
 GbMS+b/9k5ZkzcCkHwdEqtLpUqF2BnqUTSRcxzRpMFQ26zN4L2IiEgPRMbD0LM0/k65X
 Wy6zaJBiHSeruFewwFuruyc7q20NXwsEkTTgGCiHrfG1JSScMsxIOW/TE6SfIRHiVtYK
 WNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oyu3Xb4NcNqF1n7HxAz67X+M1Stgorj2k/ZpbP/TRJs=;
 b=U5O0MXDCQLVeXm+pr366DsoeBklFr14ng0pEISPlR8S9MszoV9S/4sroQnzfAz1QcP
 GetA08fisqvP6ZR/OZQRLmLVRWxjpi3cW/4wRsC1zzbmowDjhn2qPdRRx9OKoTInoD38
 asX1ZtYfQ6l8QvUJAjl4KymsQKvdfCj0w+91EQYU9b4ZbJrDdpTlwqf/3toVAcur6xpe
 XArOvPCT8ARsFr2Pb3bWxu5O21bWOo05oFZAYYQF7Tdi6gh4hiFe7wPIjXvl40rKUtZ6
 FTG0fzpKxNKXNGyGF9fj0E/vizkmL941tJAKWorKKNuwwVruNh0K2VpTj3spmyWBq0S3
 IYCQ==
X-Gm-Message-State: AOAM533CmMA0ni07MQBG9fgLhNKFxK/86+ibiWsA+VyhPgPKacp2Ic3l
 sOyD3l2gKlCGRRx3hj/HtCqO1w==
X-Google-Smtp-Source: ABdhPJz47hwy5PHLKaBk5e9ewVUXb9A8/1iT1khDRZo33HW4tqzZ6Xz5spEacWUqZBYxKfaJsHfeHQ==
X-Received: by 2002:a17:902:f211:b0:155:ceb9:3706 with SMTP id
 m17-20020a170902f21100b00155ceb93706mr16630432plc.35.1650393445878; 
 Tue, 19 Apr 2022 11:37:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a656785000000b003a566365b8esm11672077pgr.35.2022.04.19.11.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:37:25 -0700 (PDT)
Message-ID: <f1a850e8-7a94-4ac6-13a6-6b5c8780b4b2@linaro.org>
Date: Tue, 19 Apr 2022 11:37:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 07/25] tests/docker: remove unnecessary default
 definitions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> The definition of DOCKER_IMAGES and DOCKER_TESTS copes already with an
> empty value of $(IMAGES) and $(TESTS), no need to force them to "%" if
> undefined.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-5-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

