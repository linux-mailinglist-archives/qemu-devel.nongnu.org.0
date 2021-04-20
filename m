Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC876365A96
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:52:15 +0200 (CEST)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqnW-0006GZ-Q7
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lYqjv-0003wa-F3
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:48:34 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lYqjm-0005XW-2o
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:48:30 -0400
Received: by mail-qt1-x82e.google.com with SMTP id o2so15243946qtr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LvkpkY5KJdJUvplp80QAEfKZKhwkydoye7tz53Sgu5k=;
 b=Ovegm4AWSbg7x0ierMIyWc8jzE7GieoLNvX79bDgu/4WPxOmkM1JhP77/4rYdHjhRf
 I5Uzwl/S7A+tpUVSBK8nX63btYgJzTKuOHO7GfThSXNE7JyjsNpKDBZThHJcnURJgybQ
 DPAotDbLjGiWXnuOHWZX8BGmmUTZQH+XSySHmw+4W1l2d0nhgdzOsgxBAo0R21ab4mAP
 GkCVxGfsz3s0ouZWuD5o+RPmLv6FJjAgVnVm7Vz5kOjFuWDlEPPqX26WnWqZYr24zbTr
 VpSjd05mn2gaCT+BqQtN5CruifnrvqDKKcYxe8qBzk41T3w+5r54VRrYM2dGRpQVDaTW
 fC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LvkpkY5KJdJUvplp80QAEfKZKhwkydoye7tz53Sgu5k=;
 b=YnKvwd6MGZ2ULI/86LioSFgK83FyEFG6bCWbD7GglU4sx5ri3CptJucx9dBtZCdlW8
 WrMndaZXqio2NSBAxkyiSCITjax2MRg/C8c/LjjN2HD/SXkmCWF+A2EPJ8lwEeJRQ4io
 DC6ONV0iatDoENXNJwZbUUDN7uCGqEzeU0hgzUPECVC0c48J1m0TuRaVzJ79wiPab7q4
 1pmVPJBzdcOvW4wKFBLOJNYmvXWiC+pd1ADBRihwzepOHz9FCVKY99Jfajr2h3h+Vjl8
 Y2CsvhyrBHTZ9NEBfPWOZwEnaPvTSYALJm9lBZ60Qm6drF2u5NE0vSUEOck0I/pfsl7N
 mPFw==
X-Gm-Message-State: AOAM5321woqIqYtLVBh76fMZyWisuTex+eP7vtX7YWoo7yft2FtJOJIB
 k7zJj++0C6AdGP7O+TUzLFG2o6nSoZ4fgcOyAasG0gPlur+Oyy/pgVNkbTQztAz0i2pDgEVXQGO
 vEqz52dGJLiHpkd5BBkQqBj96nQAd0wSOvOZ4WT3ZenWw3pwow4mBYUj65axzAxkIktAZnu0=
X-Google-Smtp-Source: ABdhPJxNZW7gLDpZNdIdumtQ/JrVZ42qg33UMMZt0esZdJzjEzw9Vos/Z+wbgGIh6OMhCEfzhlZmag==
X-Received: by 2002:ac8:5f10:: with SMTP id x16mr17218030qta.6.1618926498798; 
 Tue, 20 Apr 2021 06:48:18 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b3sm10178463qkd.29.2021.04.20.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:48:18 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210420123106.10861-1-peter.maydell@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d4a6e840-9b5a-6417-6dec-201976c5efbd@nuviainc.com>
Date: Tue, 20 Apr 2021 07:48:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 6:31 AM, Peter Maydell wrote:
> In tlbi_aa64_vae2is_write() the calculation
>    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                              pageaddr)
> 
> has the two arms of the ?: expression reversed. Fix the bug.
> 
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d9220be7c5a..957f4247010 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       uint64_t pageaddr = sextract64(value << 12, 0, 56);
>       bool secure = arm_is_secure_below_el3(env);
>       int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> -    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
> +    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
>                                     pageaddr);
>   
>       tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> 

Reviewed-by: Rebecca Cran <rebecca@nuviainc.com>

