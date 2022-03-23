Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26694E572D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:11:24 +0100 (CET)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4W3-0002Vq-AP
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:11:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4VB-0001hB-VP
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:10:30 -0400
Received: from [2607:f8b0:4864:20::1035] (port=52111
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4VA-0000Zu-Cq
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:10:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gb19so2355355pjb.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=7DnWsl1CphcjgFWX6m+X81TIHcHkiXzagyfcqkmXOqQ=;
 b=vjNJfCr6Oll7ug7+y3bNsSY8E/6ike/5QOF4QCykNRLvWEFYH0RRNBVQuS5+pESVoe
 1TDQP7tqfXCR85E1JRUpvAtKBqPTWrumj7pMyGnLpPgLpaqBl5nqGRS6T3cb37Lt+Awg
 US+n+avrVI/6mYCWPlsX4+kk4ic3vDaJotXs4UARgsFdCvJ4V/2nO/LXGs9eCaPVAt1B
 +OYqIiYnhrbqM8os8lwlJsQERvYuQRgy3Avg5dPXYiNq2iwzg8kay5EjqOAG2xvy2NG/
 qP985Qt3GOufud9Wd1k7jgZpnho31qgJqQn1kYSXpp7e471B0ILbtMZBXAgzYo0e5IUh
 7LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7DnWsl1CphcjgFWX6m+X81TIHcHkiXzagyfcqkmXOqQ=;
 b=hblTYl3KCoKI4zyrTdC1QmoFxWN357nwu6Lm8Jp58Tcpx43Uk7tPEx2QOS3nBQNYYK
 oCNqylvRzuuRbTvEP7svxDDumJjfo//cNp2G8Ukt9GjdOIdaWJeuWmjWLk6BHYNnBsCe
 AKth05Dm2rd6lULQe1TujXAX66YsmsQQYH6qWvYiScVr17PWOgnT8VXFphsTjPk/Gofy
 56UjLqb4hIa8wmnE3u8RAb3wOSYkBRJvilOFBijEjRC/zfMLhD1Mc5VXArTE+wynS02e
 rMB5uvRLDpq8AJbMkfpdiF7egFRvCUQxL3jllkz4FBYoocRSxeq6Fe6s82dF/xC7DGwk
 +yRA==
X-Gm-Message-State: AOAM53307bSRZmd6/g1AwESKpDMLw9TGgD217Yt0nFraGYvUMSP8/ynS
 v85f1PDiEkLdKYlStZDXSyHKBw==
X-Google-Smtp-Source: ABdhPJxITlfPlnNM7owzpEhtn8a9OYt7b+rtode3RE3CIt2CaGfnBzyTmPrWJ/CLlyJuj8RW4BuOZA==
X-Received: by 2002:a17:902:ccd1:b0:154:359:7e17 with SMTP id
 z17-20020a170902ccd100b0015403597e17mr1001297ple.42.1648055424753; 
 Wed, 23 Mar 2022 10:10:24 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k186-20020a636fc3000000b00381ef1e50a2sm341732pgc.25.2022.03.23.10.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:10:24 -0700 (PDT)
Message-ID: <26746ccc-d97c-3232-5315-b0250f397b20@linaro.org>
Date: Wed, 23 Mar 2022 10:10:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/32] Replace config-time define HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-7-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> [ For the s390x parts I'm involved in ]
> Acked-by: Halil Pasic<pasic@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

The last time this came up, I asked for HOST_WORDS_BIGENDIAN to be poisoned, so that uses 
can't creep back in (usually via rebasing branches across this patch).


r~

