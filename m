Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6A5078F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:34:44 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsgV-0000tw-1r
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsfP-0008VL-Cq
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:33:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsfN-0000v7-8i
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:33:34 -0400
Received: by mail-pg1-x529.google.com with SMTP id 203so5873023pgb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G23IfbvHU83BS1AOctTv1Keb6ViBH/Nehic9oq2mRNE=;
 b=Mwtg+5RPkcyl09OYTSqzmoeNduU3KFX8NwatIdrh6QxsNW9s993XeJlDRglFSVrEm8
 w5zyIJJVPcRg5tu2YX0otxeKS8ppe2FDMmA2ljbCX8Q9YA3JQSm1UoGBlqsNXcN3d6s+
 iXpevDrviQQacHhjvyoNYpS6mFWe0PYJkftnMWouOdVRsZO5KtaY/yuUkeSz0TpiN4VY
 sMfYI2E9Ty79xu12GKtXU+M0bZXON5LsQwk6esqdXy6ELV9GHRUE2BwdVxsTqbEDm8cZ
 bBYgXI2k7b5IwMqGeYDooOV02gIVM4oXlglV5nQU2TBl6jis+K1q01M8dBnczOK9xIEJ
 igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G23IfbvHU83BS1AOctTv1Keb6ViBH/Nehic9oq2mRNE=;
 b=uzW62QPIj7q8Izh8RtyMIX+t3zZycoonfKuJ/nBqW+TJs72ZF3OS+tjUTm/wBQD/Hi
 LGGwRpK7hBH5nPafpQThaXpaJ/s2tNbFcaWym3K+BgzdxNAkP1d6Q4HyI4pD2D/UmGE5
 PfQehrX3Ndepp7l7UcSRRgVTSrVFEF4vd4jFrX5xZfLb552EArCUN+mdekDYyDsfSINr
 xJJVYZKFtKDquUT6vjEJbBgNlBrThXfLxTuHRUMPeL5nYE7yiuUwtpojXaJPXvpiQbb0
 YM85hKKdZVTJJ6FwvCTuOKRV9asNxlqylrCPGvfm/Acm6jpajg86o2wp5NXcOkywsGq2
 wjUA==
X-Gm-Message-State: AOAM532vY1zEYvXJVG4aJ1rbok7GyswkW+IYXqEeRSFgbzJ15hIfRjww
 QrNhb009JdeKeFTE+OgJpMoNOw==
X-Google-Smtp-Source: ABdhPJxwiPtVgPC5hs5G1O+I42M4LxsI3sB2fU4naKwqhnJ5aOdeRBkxHtOlDA6nP8LD4NgCeliK/g==
X-Received: by 2002:a63:b20a:0:b0:398:9e3e:d581 with SMTP id
 x10-20020a63b20a000000b003989e3ed581mr16352171pge.236.1650393211850; 
 Tue, 19 Apr 2022 11:33:31 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm17164214pgn.72.2022.04.19.11.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:33:31 -0700 (PDT)
Message-ID: <53d4d7c3-2d14-d401-24a4-48862c65f847@linaro.org>
Date: Tue, 19 Apr 2022 11:33:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 03/25] docs/devel: drop :hidden: and :includehidden:
 tags
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:09, Alex Bennée wrote:
> This was confusing and in the case of qtest was hiding the details of
> the qgraph sub-document in the qtest pages.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/index-api.rst       | 1 -
>   docs/devel/index-build.rst     | 3 +--
>   docs/devel/index-internals.rst | 1 -
>   docs/devel/index-process.rst   | 1 -
>   docs/devel/index-tcg.rst       | 1 -
>   docs/devel/index.rst           | 2 --
>   docs/devel/qtest.rst           | 1 -
>   7 files changed, 1 insertion(+), 9 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

