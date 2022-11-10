Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204EF624B1D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDjF-000124-Hj; Thu, 10 Nov 2022 15:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDj3-000119-IQ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:00:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDj0-0007IW-GB
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:00:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y16so3778675wrt.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aVJjmGjtuUm/zbNp8vq26/O3T6paQMXxVdrGVZ93uDs=;
 b=f+voIhNV7AhAgDXVNERK9WC7OhTpUkbjuUFYxFZz6W9FzNHGwlblqzyCIfK/ijYcnw
 3MFMSGqSZ6wG97gr8FqEPMAIcg98fClfpX7YbLi8GnFwKbQ/XAPQ73l8s+rFazo0fs2F
 p//eu4kzI60CnrntPnXSq1qnU1984lf0VF/6J4YV827p+a462caFcBMj/8YzvZgF/2BQ
 klI0eOEaXHzPv7BN/8B8gAmC2xLUytO3eUSdZfq7KA0wl2W0f/XsbAfubyYfXnMtmmw9
 vQwHXGl0OqrrM6CvqcbC8GiZfRNQoV0lSRaCVsOX9aWpPnCA/G3YJdu5rl+j+aeE4OSu
 FVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aVJjmGjtuUm/zbNp8vq26/O3T6paQMXxVdrGVZ93uDs=;
 b=WE8MTKR9sFvy67zIuowcsVnXGrKLGjiz1b+vxoeuDeZ+z/Yt4gbUOqDFQKJcfnxNw9
 2I4YLu+2XYtNI+ct3911NuRAl45XxigFUUo0UC1zS3Do4/f/IXrCgntWar6dkmL/fmh5
 AIWGVK1t+ynMirlEHpjtrWHAHiZoKSi93DWv7ugz8hAqwA75auJZoYf4eji74xvBlK7N
 s/U9ELd8uygDynbDz9Px5I0taqbzuVw/v+SiZZB1/4ZY7cB+/VOPaNJHfT72U9E7aAfz
 xzKsIWrasFq3ojKDXdwwME0oXDYPQX7vLaXNBX2/stIDLxCOKhdGu7NacvCygdCZlM1i
 WAfQ==
X-Gm-Message-State: ACrzQf2ZJhy5L2Kb6un/bshkcno0u9oDeMeYs8h2P0oKFICVvtwuHJ8i
 emL1gsg6NOT9jbT0k+Mf2VsW7A==
X-Google-Smtp-Source: AMsMyM7E+mIwVhRa4nWOCNFOPt63xfTSIlh0bWkUHAX+hnEpv1P7vzk2b5HPp5k2vjKes1sFrUsNng==
X-Received: by 2002:a05:6000:a13:b0:236:da43:2ef1 with SMTP id
 co19-20020a0560000a1300b00236da432ef1mr1074823wrb.697.1668110433001; 
 Thu, 10 Nov 2022 12:00:33 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d594d000000b0022cdb687bf9sm126854wri.0.2022.11.10.12.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 12:00:32 -0800 (PST)
Message-ID: <eb8745ad-8075-c6ea-6fac-4437530c63b4@linaro.org>
Date: Thu, 10 Nov 2022 21:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] libdecnumber/dpd/decimal64: Fix compiler warning from
 Clang 15
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, mrezanin@redhat.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221110131112.104283-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110131112.104283-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/11/22 14:11, Thomas Huth wrote:
> Clang 15 from Fedora 37 complains:
> 
>   ../libdecnumber/dpd/decimal64.c:620:8: error: variable 'n' set but
>   not used [-Werror,-Wunused-but-set-variable]
>     Int  n;                     /* output bunch counter */
>          ^
>   1 error generated.
> 
> Remove the unused variable to silence the compiler warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   libdecnumber/dpd/decimal64.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/libdecnumber/dpd/decimal64.c b/libdecnumber/dpd/decimal64.c
> index 4816176410..290dbe8177 100644
> --- a/libdecnumber/dpd/decimal64.c
> +++ b/libdecnumber/dpd/decimal64.c
> @@ -617,7 +617,6 @@ static const uInt multies[]={131073, 26215, 5243, 1049, 210};
>   #endif
>   void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
>     Int  cut;		      /* work */
> -  Int  n;		      /* output bunch counter */
>     Int  digits=dn->digits;     /* digit countdown */
>     uInt dpd;		      /* densely packed decimal value */
>     uInt bin;		      /* binary value 0-999 */
> @@ -676,7 +675,7 @@ void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
>       bin=0;			   /* [keep compiler quiet] */
>     #endif
>   
> -  for(n=0; digits>0; n++) {	   /* each output bunch */
> +  while (digits > 0) {             /* each output bunch */
>       #if DECDPUN==3		   /* fast path, 3-at-a-time */
>         bin=*inu;			   /* 3 digits ready for convert */
>         digits-=3;		   /* [may go negative] */

Or we could we backport the upstream fix :)

https://gcc.gnu.org/git/?p=gcc.git;a=blobdiff;f=libdecnumber/dpd/decimal64.c;h=f72c5730ac3b473e2c334f604e7e52da9711fa72;hp=269eaecade5115a62e979897742cd5decec0681e;hb=8a79685989bff33f479d0ac2df0e18d55d3ba78b;hpb=e1d1842b5432472330384d1523bb3c3132c4fea0

