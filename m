Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8372510569
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:28:26 +0200 (CEST)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOzB-0005LQ-Td
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOxg-0004OY-UG
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:26:52 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOxf-0004Rs-Bv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:26:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id j17so18572955pfi.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rGd0K+W4DQNlqs6PatQiqVqFEhBsc0JWwMYMF5xmlCo=;
 b=VYw9+NxxYmKfW0b1+SKRsN2iY717PAuqomTvM3AD8a8Q9Zvu774o34zfQFiqgVUpY2
 gJItU2moAYhx2b4gWqk/QKb3jvnKb3OIRC1/5qV8UE4Det5klKQdQbvhO+abWaHZPoae
 zto1s65aOYWTk/95Ej7rAjV6Ol4jf80WOTNFoKIbHPj2imquNoChgX67LBXQfaOTQdbG
 E5Fm3vzskxnCdgyTljUvg1rTGEs3ROhbVjQOpq3dkbjoOmnJuIybh43oJJVlzD+8j9Mt
 XeMd9XnfSp19J8BAMQnBZEBX/x3xQuY7omtXAgC9s9Dx1qtMDE9llUV/Zx4xnbV/gy+2
 eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGd0K+W4DQNlqs6PatQiqVqFEhBsc0JWwMYMF5xmlCo=;
 b=7RP9j5p8TidZse0TPnxPZPpSuKfXx3hDeDKze9qpPeUdQG6K0ASs6ZzBR5PIyR7uTb
 xcUvPux2GvpMGfFvuU3LDWx7rBiVsHPsuukEwcaZPNLLCXt4yaDeQhP09gZcsQYOw7d5
 UAPWslWBzdkhg0X5Jit4f5mU8Mv6z/DpE1lR8vGXnZzTtBmkm/pAc776wa0s9J0wAxuC
 P91C6OTHQQDmi9SQNE3Q/ChfxKhmpRu/Gx4Z4Zzu1cV20qiPtAc8M2QfVdO219tJwZI1
 C7tF1Wv9XV1R2Vh5qIgKAE5FWuGtCgkHN8kjtIll0uwCJzb4NFUf1C/hT4CaLy+/7Npj
 I0yQ==
X-Gm-Message-State: AOAM532fG/iMXkVFG+CvMoKYs7rOkUxEUPoLjhH+c7Ef3dL+Zcx6PTwZ
 3T9QsRYwmd+M8GVyIE0/WD6OMA==
X-Google-Smtp-Source: ABdhPJyNowtJpiW8el0xLQcig4YLmermwVdVKgRuIp7wGaMIhhyc+y6xtNIjVr0H3w46S6IuHxlP+A==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr20551624pgm.470.1650994009642; 
 Tue, 26 Apr 2022 10:26:49 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a631815000000b0039fcedd7bedsm14667379pgl.41.2022.04.26.10.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:26:49 -0700 (PDT)
Message-ID: <ba8756a5-9b89-0275-caec-1915b4a3ee6d@linaro.org>
Date: Tue, 26 Apr 2022 10:26:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] target/arm, hw/arm/smmuv3: Advertise TTL and BBM
 features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 09:04, Peter Maydell wrote:
> Peter Maydell (3):
>    target/arm: Advertise support for FEAT_TTL
>    target/arm: Advertise support for FEAT_BBM level 2
>    hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

