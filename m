Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690359717A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:45:08 +0200 (CEST)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKI7-000454-89
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOKGD-0002G8-Ut
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:43:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOKGA-0002Xf-Bd
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660747384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDyXShU0fbxHOv/EHtxcPPNuKLfmXabBd/UqmY0v9gI=;
 b=GJrgphS/k71Jc27z+EtxvnipU96lwTNsbTOaP2W0RXpTCoGqP1nAoNmhY2Uf9GiyO2KoZk
 y4APljl4BVF43jKf4Z1LoOzLNXpYN5GAp7f6FyRSY3wTHJ8dmwrJ6IhLUH8U+BVJA29nHY
 Vq6BT99dRFtp2kZHstNrwJiXOIYq20Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-Wy-u88yfOrixs1OdUrGQmg-1; Wed, 17 Aug 2022 10:43:02 -0400
X-MC-Unique: Wy-u88yfOrixs1OdUrGQmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 133-20020a1c028b000000b003a5f307844bso3630885wmc.2
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 07:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=sDyXShU0fbxHOv/EHtxcPPNuKLfmXabBd/UqmY0v9gI=;
 b=hTIoDc/4K3ldaliR7mREyV18R7cOMq+YjYt/UqcX+MoB2+Y+KOYQSmjLreK1zBIxNB
 2m+5lH8XimJp7eGkyF15VaDp9nEFrSkxPR2wKlQWZ1sH8CnbDImeDuJntuA+Uu0SF63q
 5U5F4uqb+ccH5h5iPbE+pZ8PGBapGGNqjwoYUpSMq1rTlI5E7vRQF7aHslDb9R02x+BD
 DaHaj8G1ioFbQ3Afzv/bB7kHct2Dd7ZXxdKQxiDa8XjB8ydtucDUxmVE2nh725UK5Unq
 hJQH7OEb/4h5HzDAHcsuIahdjURy962+P+qgtsxyhsm8OvCwu0g3HHMNpMAxWhh/ZT9W
 MDjA==
X-Gm-Message-State: ACgBeo0X8Kx1MT/uMzIu5gyqOfiZk+pWD9Q7MtCgca8PYIj4nnwhR/C5
 VrUDnLhYpy94vPgwIi8BbimxT/emWnp4Eo0YfLTb04GQTSxxYMFlvb9CruCbEeQ4PTxjWKqPNLs
 G/YZiaRdZJHMssXA=
X-Received: by 2002:a5d:6c62:0:b0:222:c8cd:26f with SMTP id
 r2-20020a5d6c62000000b00222c8cd026fmr14636939wrz.393.1660747381496; 
 Wed, 17 Aug 2022 07:43:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OaT3eceSW8cJZjrnoFo/1fFjuZ8Qql90OoaaicpR0VVq1WaHK9+ybcSWj37gT6eShC1cD4Q==
X-Received: by 2002:a5d:6c62:0:b0:222:c8cd:26f with SMTP id
 r2-20020a5d6c62000000b00222c8cd026fmr14636926wrz.393.1660747381254; 
 Wed, 17 Aug 2022 07:43:01 -0700 (PDT)
Received: from [10.0.0.51] (88-103-235-154.rci.o2.cz. [88.103.235.154])
 by smtp.gmail.com with ESMTPSA id
 bo12-20020a056000068c00b0021d7b41255esm13651345wrb.98.2022.08.17.07.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 07:43:00 -0700 (PDT)
Message-ID: <625a9862-f3fe-5b86-f613-eea985586393@redhat.com>
Date: Wed, 17 Aug 2022 16:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] .gitlab-ci.d/buildtest.yml: Increase the check-gprof-gcov
 job timeout
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220817034630.1600434-1-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220817034630.1600434-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/08/2022 05.46, Bin Meng wrote:
> Current project timeout is 1 hour, but the check-gprof-gcov job never
> completes within 1 hour. Increase the job timeout to 90 minutes.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>   .gitlab-ci.d/buildtest.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 1931b77b49..52d45508fb 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -495,6 +495,7 @@ check-gprof-gcov:
>     variables:
>       IMAGE: ubuntu2004
>       MAKE_CHECK_ARGS: check
> +  timeout: 90m
>     after_script:
>       - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh

Thanks, I think we could use this as a workaround ... for tackling the real 
problem, we have to figure out a way to speed up the migration tests in the 
CI, see:

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01219.html

  Thomas


