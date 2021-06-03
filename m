Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137039A94A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:35:38 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorFp-00042c-EV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorEK-0002co-HL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:34:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorEH-0001Q3-Mg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:34:04 -0400
Received: by mail-pf1-x431.google.com with SMTP id t28so5410330pfg.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5ebPXcAGyABqkZLBco58ovh5j0OE6ZrDrGu0Ab3O7Zs=;
 b=ze87pFqTWRSVBTunE6xBsss6Njf+e7qWPP/JDTS4ObrU/nocUMBXE9Ui2EPN1I/qIp
 Ckb1fIYW/ek0bBfeOBDMbCA0ZBUkwJJ/Xs+I5dzEZkxLzh6hs08EfwCmVgTH+G2BKdeC
 Iqcv7osp1CnKSVI4KOBqfmvMTmebUQCUNullNy/Rm/GSXWHvlmf7CwMxxth3rFFD1qqM
 wv6ymSf6pcmGrr80ZDmDlmxlf0+ADhyQM35nCUgzYFH5xPrvYMmvAEa/PBT1UfANaiZ8
 ObF9mMpepF5nuATWIFqMufz4Lm/qZiVufkA12xpuSIsrgUZXVMMHSZq9lcKp8ZN1P6b6
 18hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ebPXcAGyABqkZLBco58ovh5j0OE6ZrDrGu0Ab3O7Zs=;
 b=YzTMmBWMO7j3F5h7VJUVIGsZGb5KuN39jIwtT1HOr6swQIKkT235uLfS2+1+ftsrd4
 fWm2Ym+/gmK2Hh0t4XobglMwsVp2dFCwGMeDEk0ZOxEfnxZZTQXyZeAoAmi+LX1fY/kN
 XfKEObIxzhrML/IMTdCxNOuN53aqMr9NRft2KlUMV9tDUmS03XEaarVtfaBc9sNtIhPH
 G21HgvSMCQii0ancGFR5V8IuhukL/OHX2igwfke912h72fM+ZQdpg6OXkhELcLLSvOpz
 XA5x5/+zBJF1uZMNQAl/hQmYOF47wlS62pZuu+4O6b9g0vLH7TfpsEngksa67HcN9pOr
 pvQA==
X-Gm-Message-State: AOAM533C/QLgL3vI7CA2aKaacKP45oq0GfWNkO+bKaamRCFJDPtnCrZl
 rfRVX6m069AMLBKvtd9Z6pqn7Q==
X-Google-Smtp-Source: ABdhPJzuxlgy9tTr017jz/kMdyPK4DxPXkseUqmBhDa70rGCYEiSSQQiYnxCBUYGGhEhPVvXR5I8gg==
X-Received: by 2002:a62:60c4:0:b029:2ca:ebf7:cd0d with SMTP id
 u187-20020a6260c40000b02902caebf7cd0dmr425419pfb.71.1622741640293; 
 Thu, 03 Jun 2021 10:34:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x13sm3239308pja.3.2021.06.03.10.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:33:59 -0700 (PDT)
Subject: Re: [PATCH v2 14/26] s390x/tcg: Implement 32/128 bit for VECTOR (LOAD
 FP INTEGER|FP SQUARE ROOT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-15-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d59d23f-e330-b186-e5fb-03930a4384e5@linaro.org>
Date: Thu, 3 Jun 2021 10:33:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-15-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  4 ++
>   target/s390x/translate_vx.c.inc | 74 ++++++++++++++++++++++++++-------
>   target/s390x/vec_fpu_helper.c   | 46 +++++++++++++++++++-
>   3 files changed, 109 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

