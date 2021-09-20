Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E441296A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:29:56 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSjT-0007E0-3H
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSShd-0005av-De
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:28:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSha-0004dD-T7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:28:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id bb10so12121483plb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uBEXhbLfubpCZnEhvX0kIogAMRCTgb6my74DNwscH2o=;
 b=kyqapECPe82kSMhw6A72pgLhiOgzmE4Yx2u8XR/fKHxXAkk6u76VjFMaAIi0DrdXjn
 KpfytiefB/fAo2Zng6Z6QOsROxHNQ/McURqGuOS12/+xALAoJ9pQiMhV1X+FPvQUz29N
 ziEv48pM8T5Y2G7jFa3FWl6mmsl0QBAln2jwgakYeuBUwza4t3p/hn4pq6n+gOyMN9me
 kCnTrhcoT55xdJk1RLBoUa2/7pJb0tBY7wA6Xj2UTTw41IoC1HYlL08owfObrArZpH1u
 8ONu1Ogf5EBZXsbiz0JlAVGKznX2eQv0rvBDD2lZvmBe5aUw1jZ465yA2QgGmjq6WMCo
 chwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uBEXhbLfubpCZnEhvX0kIogAMRCTgb6my74DNwscH2o=;
 b=aj02mOKa4S+lJhw73n8yEn1SbJy3lfP3R9V0f+VBC7gmmB/KQrAqPG//T5w2UjYCAY
 Mvg5iQidtJsMJ7JpG9WtVc2QcfazsBTc69+4AAxnzw7gObSIIeKwo4bEDPUOD1mGCQ8k
 0gNtFEszQHibymxYymRgTQveYWoWV1b3dhnbykX66HRu8B1nzJzekZr/HAvuHmEEn0Cj
 I6NaTJf0UoCj6H/07lmYRqnzZHfDF4GaMox4WyGS3Jtr9k6Wm9wUndx2h+mPfISt0GV5
 PF11g+EJ3wej3SxjAxaODamB32b1ROiVWB9kp/rFHfSrm8ePXPGyalwn/cfxHJSmGVsY
 u9Vg==
X-Gm-Message-State: AOAM5320OxInJMilZNHJa9sXauBI5mwfXp9uJ31Qj0+9uvPu333zvIoq
 VxbYuXEbDasLrSSBhVf+Lkf4Gw==
X-Google-Smtp-Source: ABdhPJz15NpXZjuUPihuTvxzBC2wK3M5osP7E+vIygkjp9ftQW9BCOKYAEGTOmy2mKsOtDkadF8wYA==
X-Received: by 2002:a17:90a:b009:: with SMTP id
 x9mr1729665pjq.118.1632180477526; 
 Mon, 20 Sep 2021 16:27:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o2sm463285pja.7.2021.09.20.16.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:27:57 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] Hexagon HVX (target/hexagon) import semantics
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-25-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5cb808b2-6a82-eb9e-6da1-dcf6d15d5343@linaro.org>
Date: Mon, 20 Sep 2021 16:27:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-25-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Imported from the Hexagon architecture library
>      imported/allext.idef           Top level file for all extensions
>      imported/mmvec/ext.idef        HVX instruction definitions
> 
> Support functions added to target/hexagon/genptr.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

