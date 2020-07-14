Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E9121EDC9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:21:58 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvI4T-0007Im-78
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvI3J-0006gm-GM
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:20:45 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvI3I-00084t-1u
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:20:45 -0400
Received: by mail-wm1-x344.google.com with SMTP id l2so4567080wmf.0
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y8+G+cmJGNQzEh5zGh6xTVny0HO2ineGZkxtS+KH6S8=;
 b=IXMVlD8Fiws4tSKfTPkIO8TmLvOPSjw9kOW05KshuzDzWTshAl7laoiDDXh52gfFT7
 a242Y/p9+8hdUwijl6GAhPLs1fEWoK3QhEFUGK8F6p5xSzBEjTPlXIpzZFHBB2PBtmw4
 FcFqkxCeGM4RLP1Lod7t7wNA6ZtE8BWqt3rjAF9+KoZDlDTNOPwwC24mn8YTNDq88GMM
 NyZN07M0n/uApLUaGCUX564ZRiCthy8EqKyxF1pAKjkax1ZtYK2pcOwSAxSV5qsxIOpl
 P9ovDwSYl7XbY8FQvtfvmdk+xWT+VJ/P4Y3ARQgeOOcVRIplV9j4Ti7W4FMiUe6izfQe
 nnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y8+G+cmJGNQzEh5zGh6xTVny0HO2ineGZkxtS+KH6S8=;
 b=aRsy6fhwX9bn6tkQWr3ya6dcssVuxlP5PtDtUIN7YPq8pR7WzCpX34oZm5ZBSU9KM5
 Rg2F5wnrf2ui9c0T1avks6KgwgeW50CkHhEX3OCTM4DVG+J7fc1rKXwTJN2+sp7Lv0vo
 hwnF8Y3acV+Ek+rmWSS3wHEzas9XglE6+KOsGwVDzf7L3odIPjvSyCsCKoqBbgiCK3oF
 z2TIbP72QZRo0t0+sVy5dMFEMb6ZVZkvpZIP7G0YwmP2JQUZpu/UunFcTaj2lngJ/hYe
 hnYdgeP4B/Ipk/f+3VLEzDq5w2K67MewDbQZzndi9XWi4pC1DLPMfsf4FhuCLZBEl5GC
 XU3Q==
X-Gm-Message-State: AOAM530Y6osMNRV7u/+zy19K6optsD50zx2z+YHb1C462SoZY1O9q17S
 E8miVa9311L5MReZcvLJecE=
X-Google-Smtp-Source: ABdhPJxR4NVYwn+6RwX1gkdLASftzLfN2C7nNpSVda+CXfD7V+JrihdWhWj8bOTi/XMhPLgqZ/3jfg==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr3442337wmb.53.1594722039625; 
 Tue, 14 Jul 2020 03:20:39 -0700 (PDT)
Received: from [192.168.1.43] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id v5sm3661817wmh.12.2020.07.14.03.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 03:20:38 -0700 (PDT)
Subject: Re: [PATCH v2 08/11] docs/devel: fix grammar in multi-thread-tcg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200713200415.26214-1-alex.bennee@linaro.org>
 <20200713200415.26214-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3fb0d8a0-5fda-5707-57db-08124708102c@amsat.org>
Date: Tue, 14 Jul 2020 12:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200713200415.26214-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, robert.foley@linaro.org,
 richard.henderson@linaro.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, peter.puhov@linaro.org,
 kuhn.chenqun@huawei.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/20 10:04 PM, Alex Bennée wrote:
> Review comment came just too late ;-)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/multi-thread-tcg.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
> index 42158b77c7..21483870db 100644
> --- a/docs/devel/multi-thread-tcg.rst
> +++ b/docs/devel/multi-thread-tcg.rst
> @@ -107,7 +107,7 @@ including:
>  
>    - debugging operations (breakpoint insertion/removal)
>    - some CPU helper functions
> -  - linux-user spawning it's first thread
> +  - linux-user spawning its first thread
>  
>  This is done with the async_safe_run_on_cpu() mechanism to ensure all
>  vCPUs are quiescent when changes are being made to shared global
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

