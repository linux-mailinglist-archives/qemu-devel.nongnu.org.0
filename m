Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE845AAEE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:09:24 +0100 (CET)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpaEN-0006DF-QR
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpa47-0005wk-J2
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:58:47 -0500
Received: from [2a00:1450:4864:20::336] (port=54950
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpa45-0007he-G2
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:58:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id i12so19511661wmq.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VMDbr+zLpSGJ4P0XgNCYipvJzdbIuR1bCTTFcvqUyLE=;
 b=TipLIoykw/erJ5RgDK4rH4/m7JdGgCiHZtlzEV5AciFwmLv5ec3Aj8H56Dx9ePrl0A
 LQqqn6cKLA4yCU+dMpqw5CQMlwSvKV68i/rnLprtJ4qLObZM6+jrhp4XB1WfUaXorHrh
 crPr8Ib/6iX4ZkOyfarpBE3Dbsolt8In8zYMhGQ2Im1/4yvcFCelawVsdHWagJcWFMGe
 254BLEeT3TdQEjODpr5Rrmu+QBf9SuMgm7cCf3QmDb9EGqNfpv3n0RERCFHNT6m/vGSG
 +UwtoUrV73Mf9Dj8j24ERQs598CLUlz06VwbKmDBoZiCCuZeSVxc1gfLVmIlDh6oo3ZA
 nd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VMDbr+zLpSGJ4P0XgNCYipvJzdbIuR1bCTTFcvqUyLE=;
 b=52Oj9NDxKFmjWJUUo/OR9MO8cOCivXB2O6RsSDRihgQjd+FwB3TmnIq2H3sAtE4wYs
 ni/VCu4IHMmZqfoMMOfcq7AwBNMEGUtL9BDw9GGif6QGLe6HMMsIkuZqIJ/KSx1Oijkt
 7O8+CLeZDiLf6HsGGdG337eJhd9QmKrS9hXwCADkU2hoKDmoGgTVMNbl6T50AWqFPwU9
 pOthx1C1WTwblMRgw2euzBrTJ0gC5Ch6OD/RfI2G6cFBemPw2lcwDMlf2d+tAM9eta1g
 IwapKaOgirkACA7gVyj6c/Me745POAu7QM82Qcqb+bd1VV5faJUHG2imnAGR0L5qi73C
 NibA==
X-Gm-Message-State: AOAM5320nIimaeKEsmjXcCrr7YsbcafucvrR/et3vNMemAkfe3TK4DB8
 oJqLaUXpOVHzVExwLzx32Aq56A==
X-Google-Smtp-Source: ABdhPJz7XnnELFPQJPRlqI2IUBF0ny1qK8/FqGXN62ZLgsPb5mtHLtKVGuOAzAPjZIjqyuKkAyATGQ==
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr5361863wmh.15.1637690322301;
 Tue, 23 Nov 2021 09:58:42 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id a10sm2036836wmq.27.2021.11.23.09.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 09:58:41 -0800 (PST)
Subject: Re: [PULL 0/3] Block patches
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211123155909.717547-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e334083b-d995-b113-08e1-08dc4b3ac74d@linaro.org>
Date: Tue, 23 Nov 2021 18:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123155909.717547-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 4:59 PM, Hanna Reitz wrote:
> The following changes since commit 73e0f70e097b7c92a5ce16ee35b53afe119b20d7:
> 
>    Merge tag 'pull-lu-20211123' of https://gitlab.com/rth7680/qemu into staging (2021-11-23 11:33:14 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-11-23
> 
> for you to fetch changes up to 4dd218fd0717ed3cddb69c01eeb9da630107d89d:
> 
>    iotests/149: Skip on unsupported ciphers (2021-11-23 15:39:12 +0100)
> 
> ----------------------------------------------------------------
> Block patches for 6.2-rc2:
> - Fix memory leak in vvfat when vvfat_open() fails
> - iotest fixes for the gnutls crypto backend
> 
> ----------------------------------------------------------------
> Daniella Lee (1):
>    block/vvfat.c fix leak when failure occurs
> 
> Hanna Reitz (2):
>    iotests: Use aes-128-cbc
>    iotests/149: Skip on unsupported ciphers
> 
>   block/vvfat.c              | 16 ++++++++++++----
>   tests/qemu-iotests/149     | 23 ++++++++++++++++++-----
>   tests/qemu-iotests/206     |  4 ++--
>   tests/qemu-iotests/206.out |  6 +++---
>   tests/qemu-iotests/210     |  4 ++--
>   tests/qemu-iotests/210.out |  6 +++---
>   6 files changed, 40 insertions(+), 19 deletions(-)

Applied, thanks.

r~


