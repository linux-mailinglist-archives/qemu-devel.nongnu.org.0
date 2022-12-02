Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DD640E2F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 20:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1BKi-0002EC-Rm; Fri, 02 Dec 2022 14:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1BKe-0002DZ-Fv
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 14:04:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1BKc-0001gg-Rk
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 14:04:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso5056821wmo.1
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJbgAsWXjOUH3suU0A1KUekuXNGnKQ77xafGi2tELz0=;
 b=FG+w9xJSERLrI+CgO8TrXgjj4Qbi69FHEUFD/M3lySvl+2lNfKQm88IW6i80OadwJB
 sNkqvH875utufGXHjFQ0zqILH5DDt1kNudheqq2o06SY6mWG2tjizBMtx50b0DoTVJd4
 mzAYND9zI/v0c3N2xL+UnVkqje9WNlLTAaaN/x8kMmJ7Zdr6HbJGGytyjbGwqXOC9wxg
 MAzMUapAZ+kVvRtySZpXxkHs27ldKgnDhl2FTx3P+bont0pwEdg11V856+RW8sIMlt6y
 GQsXAOVuZVZqrfOJ7A4GGNjq2QwN0YLF+54VCWRidnQ66G9HrMw+EvNXy9C6VNtGUQDW
 UHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJbgAsWXjOUH3suU0A1KUekuXNGnKQ77xafGi2tELz0=;
 b=xJk+9cWJgk2AeCFLoKzJwgBGzF03qlbaasTcfx26WujWIeTL5aSs2kCORK/FEv83c3
 M9YriCtXzAZs7pbM/LIRl4sKqtava+DHF5BzuXRzGAu6ZVUyGGlUC6gCAu1pGaDnVu5B
 7kaxXO7/vstlBDzI71oTH0Uqbx436BR1Ngq/sBx+i4QY8j/2egLHIGPTdWc7wOPRIXbQ
 JD5kFB6jZCEymt+UzM+lyYBgA1nR9y+a2p6KU2QVQ64p/v867GxS38tpdprhCTDPq+R+
 LiB5k1EHHnSRGgsmmN2KKON5uTP1OYy88xUckVp9C+dY/aTY3CTLRpA/OSKMqeK2F9px
 pntw==
X-Gm-Message-State: ANoB5plqX2JW5ULfsJ9vc0VlFk+fSztZIq9ySHnbhf+VfvEqGXuwDCX4
 MjvA2umAJjInfz7qqD+JZy128A==
X-Google-Smtp-Source: AA0mqf6+O0eBrlZER1Ig8AJktgjw3E/kIJ7s/ilR8drmtuR3y7yJfdprP+Z8W8b3OlXy+H7bUwmptA==
X-Received: by 2002:a05:600c:3543:b0:3cf:74bb:feb1 with SMTP id
 i3-20020a05600c354300b003cf74bbfeb1mr51708682wmq.102.1670007856938; 
 Fri, 02 Dec 2022 11:04:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm17000032wmo.0.2022.12.02.11.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 11:04:16 -0800 (PST)
Message-ID: <e84934e8-5a17-8598-f158-6bf9729c34ea@linaro.org>
Date: Fri, 2 Dec 2022 20:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH for 8.0] configure: repeat ourselves for the benefit
 of CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20221202174746.1218017-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202174746.1218017-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 2/12/22 18:47, Alex Bennée wrote:
> Our CI system echos the lines it executes but not the expansions. For
> the sake of a line of extra verbosity during the configure phase lets
> echo the invocation of script to stdout as well as the log.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 26c7bc5154..849ac7aed9 100755
> --- a/configure
> +++ b/configure
> @@ -83,9 +83,10 @@ rm -f config.log
>   # Print a helpful header at the top of config.log
>   echo "# QEMU configure log $(date)" >> config.log
>   printf "# Configured with:" >> config.log
> -printf " '%s'" "$0" "$@" >> config.log
> -echo >> config.log
> -echo "#" >> config.log
> +# repeat the invocation to log and stdout for CI
> +invoke=$(printf " '%s'" "$0" "$@")
> +echo "configuring with: $invoke"

    test -n $GITLAB_CI && ... ?

> +{ echo "$invoke"; echo; echo "#"; } >> config.log
>   
>   quote_sh() {
>       printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"


