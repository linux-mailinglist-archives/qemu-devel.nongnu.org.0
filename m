Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D755F4C1FBC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 00:34:07 +0100 (CET)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN194-0004XZ-F0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 18:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN17t-0003lz-UT
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:32:53 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41877
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN17s-0002Ba-C0
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:32:53 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so508760pjb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 15:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cq+pXj7/W8tZ5N49NVpSy4Bpu8WBCNxzZxfY1fO/m6U=;
 b=JbV40EOoKFHfJU3P6SbwEEmwH7Y4g4Xyz4I7AKWA1f3fXIF3iZ5Llfs24EdSwwikjQ
 9VN0XUrMXWLqCHZumDjajErbhueawn9ugt3Lao0EkzR0TrohwChGRRHVlClWG0/q5NRE
 emqwA2LI4wGXoveKtoXLUSarHK6g9U0FU08dNZbgnl7n9cLiG4Qh8mC8iUSChPw01QhV
 T0pjc/WPTNLJ0MYU6n4apGf4oTxkIVOXEvo5rLQPIfJqnHGsndDV4XXWqL8Dy3zXlsUV
 DUxPfrrwFbwwkXv3qJqFMJAXA4vhKRKP/lUtmXPrWtKY3u6lH0Gzv5v77QZQuU7EFXFI
 ofKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cq+pXj7/W8tZ5N49NVpSy4Bpu8WBCNxzZxfY1fO/m6U=;
 b=L175BZGX+tdr+oW8K3ZIveU8CpZkjapaDfsIXKohqthDsPm8ptsepaInYj1hJlrtsL
 UN0meUDmn0nCrzHfSiyZ1RpWYLFaPKls8iZVMe3+Y6k/8HHtEsK1zkq7VrTk4QVWcWWO
 0X7OOEc0M5Uvbw9mK8RTJWwqCw853UYob4XZp/OH6n8i6i7tSZqO3Vv8GvGNk/NDAhXS
 nYf2r1Ayn4Je9vWHkvNr3D5l5h1VES08B33LJhvxrsPXB5tY7vVluQuQz2uh9LoLfBMI
 4YqFykyqEXtgYcv3dH+30QE3VVWIE9iYOacDXA9IU9ibVplXVovj6PPGfe4INv8W58RR
 x93Q==
X-Gm-Message-State: AOAM5329GZmCtiaw1q52pDKSLnQ6bZDAF2sJvrNjrBvu+sPtKgQFvwWJ
 69vbw06/C2+eR4XXeODlT06RCw==
X-Google-Smtp-Source: ABdhPJzOqPEvoXMWlNIOMcAcgZdY5kRWL9prJM5CpdKp9dxoSr4cezxxbHr8WpmuUQBogyaR75L68g==
X-Received: by 2002:a17:902:d50b:b0:14f:c723:8742 with SMTP id
 b11-20020a170902d50b00b0014fc7238742mr2128343plg.26.1645659170768; 
 Wed, 23 Feb 2022 15:32:50 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id m21sm518656pgh.69.2022.02.23.15.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 15:32:50 -0800 (PST)
Message-ID: <9db0c7df-0939-9fe6-fd59-c5cefbecb398@linaro.org>
Date: Wed, 23 Feb 2022 13:32:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-2-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220223223117.66660-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 12:31, David Miller wrote:
> resolves:https://gitlab.com/qemu-project/qemu/-/issues/737
> implements:
> AND WITH COMPLEMENT   (NCRK, NCGRK)
> NAND                  (NNRK, NNGRK)
> NOT EXCLUSIVE OR      (NXRK, NXGRK)
> NOR                   (NORK, NOGRK)
> OR WITH COMPLEMENT    (OCRK, OCGRK)
> SELECT                (SELR, SELGR)
> SELECT HIGH           (SELFHR)
> MOVE RIGHT TO LEFT    (MVCRL)
> POPULATION COUNT      (POPCNT)
> 
> Signed-off-by: David Miller<dmiller423@gmail.com>
> ---
>   target/s390x/gen-features.c    |  1 +
>   target/s390x/helper.h          |  1 +
>   target/s390x/tcg/insn-data.def | 30 +++++++++++++++--
>   target/s390x/tcg/mem_helper.c  | 20 ++++++++++++
>   target/s390x/tcg/translate.c   | 60 ++++++++++++++++++++++++++++++++--
>   5 files changed, 107 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

