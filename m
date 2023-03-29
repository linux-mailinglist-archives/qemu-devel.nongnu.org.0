Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966B76CDA43
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:16:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVf3-00088I-Is; Wed, 29 Mar 2023 09:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phVek-00085k-JW
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:16:02 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phVei-00017C-Gr
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:16:02 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso2005038wmo.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680095758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IM315ZywJ++pvQKJBXLBory7A9NdUJ3KrdWhkyLblbk=;
 b=fWwFHvpVnAH4XqX4Qc1OJy4wkR7/V6sQSt1TnwrTyT+IiHMcrSSrGsjC4g1g9I1MZF
 T0NyyCFbScYYfIoCUyoahyE8gRWm4Zr492OH73e64VjgZYkkvx7Py+sX9mkhEOcg3ef4
 UX2zuIThbN3YNfcNb7YvBYiKarCZUC0A7qcoGXWwFt8it4vN32psGQS5sgF/585Z+Apc
 QuWGvMVeL1Ouf4NKCyOdFE5WMuudvOJ1IAc7vFITuUbNnY23OeXXuRn61j8ya/hE8F95
 S74/uaHlEQro1oV8q7Qbl5KdQnuRD98asfQe2WknbpNPT5xpzlAqI+DC9KbC+IXes1rw
 TOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IM315ZywJ++pvQKJBXLBory7A9NdUJ3KrdWhkyLblbk=;
 b=bLEhcTgneyWRFua53shbwpGLfE881ZhV4jxqDJij5c8x9hXyQ7SBv7Ol69YO2s5Ydp
 +wwfznw6AZq4TRASkOZbDHG/KxkGZG4PcKMVwkctQnDmSgy5K08D2qyxxhKt3J89bh6M
 fjyFaEPBsDpFT7Jqa0VGiX2YvKhnMP3SctmAD3spqzHWA5swFNtis6LcUVyTb5CERLt4
 bZnQ6zeCXEs1e2pprb4P2Yyr26btrLDwdT4rnTFbta/C8gQJpxZsYKlzh51DSCaioAqL
 WrjZMVYfatkflstwBESNeOQX2wAtO8tqRN3ypqSRWTFT9vMTd5WbOO431kOBvclRp8xP
 hdhg==
X-Gm-Message-State: AO0yUKXmhwKGuyNsofZWOsa7fdOP0YBMwRu3GQ1rSEC6m7QTna6IJuPT
 v+hxLCxWOmV0hfpS/DIiFLFa/w==
X-Google-Smtp-Source: AK7set+QDAqP4Zzd8uFbfg5iEDw5gFePLAmNWD/FWgu25Pq6TDwrYkic2oC8cVHfVk2vSe59uxaHjw==
X-Received: by 2002:a05:600c:3650:b0:3ee:7d95:a39f with SMTP id
 y16-20020a05600c365000b003ee7d95a39fmr16174826wmq.33.1680095758278; 
 Wed, 29 Mar 2023 06:15:58 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y26-20020a1c4b1a000000b003ef62deb830sm2229332wma.25.2023.03.29.06.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:15:57 -0700 (PDT)
Message-ID: <5e2c63f2-b4b3-67d7-3578-73b09370291d@linaro.org>
Date: Wed, 29 Mar 2023 15:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for 8.0] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230329124539.822022-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230329124539.822022-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/3/23 14:45, Daniel P. Berrangé wrote:
> The 'check' script will use "#!/usr/bin/env python3" by default
> to locate python, but this doesn't work in distros which lack a
> bare 'python3' binary like NetBSD.
> 
> We need to explicitly invoke 'check' by referring to the 'python'
> variable in meson, which resolves to the detected python binary
> that QEMU intends to use.
> 
> This fixes a regression introduced by
> 
>    commit 51ab5f8bd795d8980351f8531e54995ff9e6d163
>    Author: Daniel P. Berrangé <berrange@redhat.com>
>    Date:   Wed Mar 15 17:43:23 2023 +0000
> 
>      iotests: register each I/O test separately with meson
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


