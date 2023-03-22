Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280026C456C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuEe-0008FR-NS; Wed, 22 Mar 2023 04:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuEd-0008FB-Qu
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:54:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuEc-00078h-C1
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:54:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id o7so16174384wrg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679475257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2Ea5p3Qj/ZViK4PKyUf/eN2Y++dSZRQH/ZAY/6PC7c=;
 b=MpiMAzff36BAFJ7KiPR6mBWygvhS4IXvPmrOfMHMHSaP8VbyQxodRwykflRNM02YZe
 bGxBKvvwZDUCacgg6dqm6BQ0QwC3OWmTnR4jPUprFj3bjjSl5sDsf+h9ddf4JsSQjK8e
 H2KfDzJO+Od6iPkXknpWnA6IC+SsCV17ngx9C8nD1dT0OVd4tLtc+o6+x+4xOPToSrb+
 3k9XUnQyyS0GRx2gCl1DKyPmbIeWabP8je/JaJRQJqacZi6fRvJcNMzoVuTnoJ3yG7tF
 1ULlgOn8IMb/dDrHZvYWwWWx8V3mRNGxCykMtor2qfPJ2RYSzXzriQntL5pcxkurVBO5
 Rn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679475257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2Ea5p3Qj/ZViK4PKyUf/eN2Y++dSZRQH/ZAY/6PC7c=;
 b=2zrmTPyOlZ9waehUrQM5qkIYLi7vIJiMGvZ3OVmp5DepN+6MeCZ265b/xonIii6j7n
 Ev5Bf8WctuBOi44SRTOIiwTzCbez0LyQLYH0ylNeGrT8eQlXCFa0JKeFO4mYyoaoHjC7
 d6psMFho9MnBm2gCimAk+Cpw85+eYoPoQkjjcs2QFuW2o0MyxB2pC4xK17PaACbOnPpg
 Ash7/dEyiu8rTEXwm/KSig21SE4P7fR6Gamc2D95sVcEP9pT1mNksBLbumZMionXYVH6
 mA/Fh7hGcXw/Ii2/BlhQ5eTRC/u75gt5CNHUfKVrZBlUrmVMXkvXM/zHAfIUIMr0wKKn
 ZZmQ==
X-Gm-Message-State: AO0yUKWK4L49ouKz2cui89tjzX51hmt4jzeNu3gpicg+LyKrV5YwE57r
 KQ8fj+oKzCiNFQ1v8TWHdluWHA==
X-Google-Smtp-Source: AK7set8yo6/NrGwp2po+K6f5A4y9oCfIoBRZLw972/iEnkmBl4NyzmkkrrtoKP3cHEXKG/in21ly1A==
X-Received: by 2002:adf:ef06:0:b0:2c5:3cd2:b8e with SMTP id
 e6-20020adfef06000000b002c53cd20b8emr4404821wro.1.1679475256883; 
 Wed, 22 Mar 2023 01:54:16 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002cfe685bfd6sm13331518wrw.108.2023.03.22.01.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:54:16 -0700 (PDT)
Message-ID: <40ae1dd3-3061-603d-bb06-2bd71c54d4f9@linaro.org>
Date: Wed, 22 Mar 2023 09:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] tests/qemu-iotests: serialise all the qemu-iotests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20230321235102.3832417-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230321235102.3832417-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 22/3/23 00:51, Alex Bennée wrote:
> Something on OpenBSD fails with multiple tests running at once and
> fiddling with J=1 on invocation just made everything else very slow.
> 
> Based-on: 20230318114644.1340899-1-alex.bennee@linaro.org
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index a162f683ef..d572205a60 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -64,6 +64,7 @@ foreach format, speed: qemu_iotests_formats
>              depends: qemu_iotests_binaries,
>              env: qemu_iotests_env,
>              protocol: 'tap',
> +           is_parallel : false,

Per the commit description, what about:

               is_parallel: targetos != 'openbsd',

?

>              timeout: 180,
>              suite: suites)
>     endforeach


