Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E344C0D9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:08:13 +0100 (CET)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmOj-0000I9-0I
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmNo-0007nK-T1
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:07:17 -0500
Received: from [2a00:1450:4864:20::332] (port=41538
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmNn-0004EN-1l
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:07:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1818308wmf.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZPZvhyAHMF6fQv7vvN9CcWvuGq7Ra6AXidp/MDJIZBg=;
 b=EsP47IDq3jUtyigkbK3Wto/mAZB5XI8Q1tZB0oq6k54/gJBg7XdOVN3tr/SKQkdXoc
 duWZ7RXHBpIs5RqffA2qx3m96nWfeGFjOb0+5D6nHUZxH+qihq0LXn6jpSvwgD34gno+
 Df3E3EGQcsHALyzb4x39TrT5Ow5iaORuYj/nOHl1HYs/BvhzKzD3e0xLCvvZEKZ8x7Te
 BaczYsPdgXefuPvEJzsLfWK91maVwissjIbpGjkbniNMYhF91ufGUFAD6Anx/r7F+sJp
 dJr+yTlPRGjOgu2oyVJ6HJP1ujqlemkL+zUFBFLEbOHWA7tKwdFa+qBJIeM/UgvX/f0/
 gwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZPZvhyAHMF6fQv7vvN9CcWvuGq7Ra6AXidp/MDJIZBg=;
 b=kBceyg7OPbZTe/ToBWHpcyXwgVar4TOHG0s2RL10prV3MCdtid/tMaJzT8/GpZ6vq5
 lEJnnEH8RC04DmQjdSA+pS7oQFb7it1ZlGMc0JAfNMb3BUoF1QhmJyYHYUGXD7We9wLT
 4pX2DKcLPcnj+bbO+J5Jp5us/b5kge85oRmRgjqEYa37B2aKW32IGGD4k5ruZSsqT24y
 K3W4mgy6hvXhVdxSN8ihv/DK6LscCMaDTVf0nRW0IIUTfHrlilz74P9Z5+wa+ztzzwh6
 p/EMYqdhmSrpPbqg8VN+qdg2LSw4yCJbSoHj3JJora3x920FbUGLKUmNHd1JRH6CLqU1
 41Pg==
X-Gm-Message-State: AOAM530kiZsYJiSgK+4McdsnZpFfSbwC0WEp88CjdkFzQv6a/0TgG72E
 73CPBz4EDGmn6LSGbgsc8QPRkQ==
X-Google-Smtp-Source: ABdhPJxXaDlbmXBHLsdzt5YnfVC9mYvU9C1vEzqQ3GoyVKDFkScAEX1QfrOymmPyA8eAOt8uQ8SrYQ==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr16024089wml.80.1636546033133; 
 Wed, 10 Nov 2021 04:07:13 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id n15sm5886874wmq.38.2021.11.10.04.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:07:12 -0800 (PST)
Subject: Re: [PATCH v2] tcg: Remove TCI experimental status
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211106111457.517546-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74388486-4f19-bfbc-6b0f-8de2a13120b0@linaro.org>
Date: Wed, 10 Nov 2021 13:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211106111457.517546-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 12:14 PM, Philippe Mathieu-Daudé wrote:
> The following commits (released in v6.0.0) made raised the
> quality of the TCI backend to the other TCG architectures,
> thus is is not considerated experimental anymore:
> - c6fbea47664..2f74f45e32b
> - dc09f047edd..9e9acb7b348
> - b6139eb0578..2fc6f16ca5e
> - dbcbda2cd84..5e8892db93f
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2:
> - rebase
> - precise sysemu/user (Richard)
> 
> Supersedes:<20210920062306.2723797-1-f4bug@amsat.org>
> ---
>   docs/about/build-platforms.rst | 10 ++++++----
>   meson.build                    |  4 ++--
>   meson_options.txt              |  2 +-
>   scripts/meson-buildoptions.sh  |  3 +--
>   4 files changed, 10 insertions(+), 9 deletions(-)

Applied to tcg-next.

r~

