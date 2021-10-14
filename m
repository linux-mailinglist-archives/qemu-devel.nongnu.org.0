Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4242DFFE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:19:11 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4Nq-0001Lh-FD
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb4MA-0000e2-0o
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:17:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb4M8-0004LR-HT
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:17:25 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k23so5298588pji.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VRQUci3hHu38w7nkWJrsZ0fQ31N8SNZcct/YrJ7Z1+A=;
 b=PrpYYqlQO26QKCKEdft/XCEpOB2SLPWOE/qhWB1YL1UisdGyENAOKBtGduF7gnXsBO
 7eZSx7Puk12kfWxWz87T61vkg41IG4KWYE1BICr837MQZcerg2Q48ZzTkLHdxZByixLa
 kgeynTwfHmQzEBcOvJnEKWKV3kXnYw5BQP5okGCyJDU6Tt0cG+igedN6epYQwB8i4PGU
 8p1gkugZKvBjV3IQDzMv4NGxxa7VPw6eLvyOaye1mDbeVMW8cT2DY8VCWlD1V0yzn0ii
 O4PkgduXpLSAmr1Z2I8KmYtR4iQGMn9B7/vlix/f1GcEQ7+63fQkENdfICXbeRg7+LWv
 Mpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VRQUci3hHu38w7nkWJrsZ0fQ31N8SNZcct/YrJ7Z1+A=;
 b=T0FU4My/eBahZZ1qMsufPIpdh9o2Xen2KK3ksK41Y+68oLZqtnp0mowYaCIFJsM2Xa
 zmrn6Ehm5PNLA2IUzzuzcykzL3mfhDaXfGwk1uEub+MG2G+EvpHA5CXNvfOw9Hg9m9Qp
 IcXat+RNbrbACzAs6tkWjm7CSM2CxlGMZjddAMLCgyjxTCm55TW0G0O9297azaRIx9jf
 c9FrKRlJ3bsMn8/u8O/HwwIM5FDGloDdL6zzNF/neH3tDg45ON/ZTMg9/Fp4NT/EMXp/
 T02B0fp6bS+bfAsZK3+ecQZHDQRCTx79tDmXa+uYuzjFowOyPNd2EVSiSU4lQggjiM/w
 gYjw==
X-Gm-Message-State: AOAM531bW2S05A1wJm7RewVBLYJAXvOHVolLnqUvXYObHHBPs7uZxIXY
 MMv3IxfPQw0hmiHjrhEEqhtaJA==
X-Google-Smtp-Source: ABdhPJxERLAmbmI6UaPUOOQ1go7s3IrVfX3BAKCkF27bxk7zAl2azDZBmRzyJylrtqhSAd1QMybAvA==
X-Received: by 2002:a17:90a:384a:: with SMTP id
 l10mr7329268pjf.168.1634231842448; 
 Thu, 14 Oct 2021 10:17:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u17sm2949590pjn.30.2021.10.14.10.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 10:17:22 -0700 (PDT)
Subject: Re: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-2-richard.henderson@linaro.org>
 <87h7dmw4kn.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71e6a11a-2c64-24e2-1883-2c352475fd9a@linaro.org>
Date: Thu, 14 Oct 2021 10:17:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87h7dmw4kn.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 10:03 AM, Alex Bennée wrote:
> We need^H^H^H^H (might need, see bellow) a separate patch with:
> 
> docker-image-debian10: NOUSER=1
> 
> to ensure the images we base our "handbuilt" compilers on don't include
> a potentially clashing uid (which should only be added for local
> builds).

I think we ought to push this further back into docker.py.

I think that we should always have a separate image without the user installed.  When 
asking for a build with user installed, copy the nouser image (perhaps cached) and simply 
add the user.

> We need to split this like in hexagon and have a second stage which does
> a:
> 
>    COPY --from=0 /usr/local /usr/local
> 
> This will limit the size of the final image (and also avoid duplicting
> the UID in the hexagon build).

What are we eliminating from the image with the second FROM, since we then go back and add 
in all the build-dep for qemu.

There are one or two extra packages required for building gcc itself (e.g. libmpc) but 
they're not large.  Where does the major savings come from?


r~

