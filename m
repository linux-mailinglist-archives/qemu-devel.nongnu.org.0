Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896E417192
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:13:32 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk55-0000LU-Li
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsS-0006vp-Iv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:29 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:41772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsL-00039Q-Af
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:28 -0400
Received: by mail-qk1-x72d.google.com with SMTP id m7so10843419qke.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h2xNDSXoh5YJnmdUhc1zXbtAwmZA2k1fK0oQIZhwnEY=;
 b=k2wWuReRdbD3RXW8HfNu9QW84zW3bwYXYG5gmf2Zy6FgZkaGP7W4ncgacbuSVy3fgL
 yiKfYvfmy4s1B4Id/g0a1lkCQYOaUwiURKpo4cxIAE8Jlt6xNZpFdHIFxg9/B1Rd11Bq
 rwbveIknQDSOoZfhAv64p4IT8rNma46Ey1dqhEb8NUxfPwyK23sNNr04Tlh+ytUh2zyh
 lJAgDBeRcLjICPdh1Tk7FRcOqODWMUh0ET/1oIXjqdWa9qUYRAHrn/Vda10AEVJTq4iG
 vQ3YVJOIFDMlBx1hFhJAUpU662AfWyrlCD9gPSsYWvDMyT5UI6rQM9y06cqegJFzlBxq
 YnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2xNDSXoh5YJnmdUhc1zXbtAwmZA2k1fK0oQIZhwnEY=;
 b=Bs8CZ/mSuLvrydDc/FaHjfRC8hfIwiSCaKLoxYkuYUHxRzNzGg8vNqdQduJHjzADdF
 jDc8rMuaF1MwKVmo9mJc1E4DujW/EWS9RpPl4T390QqwzN6iVUo5HQ1NWU6oyOls6ri+
 9H1990DYJNM9qqL+8AMF89zMf7vPqxl6fxNGLjwPy3Y0Rwtb0gWA5dKJ6V5sxjwri6Hq
 +YRuZnvy/neeSKmiqAMlJ4lmDwL69x5nD1sZn2DcMOfZPi0sShgBsXJ1dsnYYK6PZ0mZ
 kXlaLepf4JHPHaQftw7VHfJA06IhFUF1Rwn4hHffXmIwNjrNosEklTQd6SaHnvzq4U3U
 v4hg==
X-Gm-Message-State: AOAM532kBM7nGlP5nuNmsbvSKNARkaGXuIVEmyplHIo6vOI2uynvFnsP
 q+TIOqVYMtywz9LyJ00/6P7mrA==
X-Google-Smtp-Source: ABdhPJwYKHIuSwOnCd+d1giweSScBU4JdYGT7gLnhypgeYaM7GLKVUzVLk73AMc4h+zbzSpsDjhXRQ==
X-Received: by 2002:ae9:e811:: with SMTP id a17mr10134256qkg.172.1632484817964; 
 Fri, 24 Sep 2021 05:00:17 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id d6sm6406878qkn.119.2021.09.24.05.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:17 -0700 (PDT)
Subject: Re: [PATCH 06/14] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78eb3b43-ac98-320d-fcc1-c733e10f42e2@linaro.org>
Date: Thu, 23 Sep 2021 11:00:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
> FreeBSD-wide.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h  | 3 +++
>   bsd-user/i386/target_arch_signal.h   | 2 --
>   bsd-user/x86_64/target_arch_signal.h | 2 --
>   3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
> index 3ed454e086..9fcdfce003 100644
> --- a/bsd-user/freebsd/target_os_signal.h
> +++ b/bsd-user/freebsd/target_os_signal.h
> @@ -1,6 +1,9 @@
>   #ifndef _TARGET_OS_SIGNAL_H_
>   #define _TARGET_OS_SIGNAL_H_
>   
> +/* FreeBSD's sys/ucontex.h defines this */

ucontext

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

