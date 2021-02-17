Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CFD31D792
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:34:34 +0100 (CET)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKAD-0001Av-I6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCK9K-0000g8-8k
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCK9G-0001WQ-W5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613558014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHNn+Q7EqOd1a6SfUCtlakHzYK8ffFZRGM1W2WYZs84=;
 b=P0jSYq7bsCh/9+XZW72zM5m4C9LVNL90mkTTztzg+kvMwiK/qvWpOzE6kjzCxEoQPKmzFK
 pzInZE8qLEAho6uOWn3tnQyyG3nyoFPVvrO2QViGf3eOV0RpA1q6i0s5mTR1yNG+pMeGNo
 3hl3zT2FEVTnbpulfazI4X5JlMW8eFM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-bpRTjxSEOhmag_bhL0WdIQ-1; Wed, 17 Feb 2021 05:33:32 -0500
X-MC-Unique: bpRTjxSEOhmag_bhL0WdIQ-1
Received: by mail-wr1-f70.google.com with SMTP id p18so14365236wrt.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 02:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aHNn+Q7EqOd1a6SfUCtlakHzYK8ffFZRGM1W2WYZs84=;
 b=pP+XMEUkRXOUOvggzxEw4HlVGdUpkZH+ZcRtbIftCr7Ggh2le0aX/CyIQjMKEzq7Sl
 Lwy1nFzXqbRrbqwNCu+eHYFtlniDD7wXJTQmUNukdf2nkgxQGHLotgQ0pnv5OH/BtX/y
 RKK1aBQoH7zr7oMT9vCmr4UvhOYl6te+faTnyOsAY5ReDTIlKgz4+POaxNSeUPZ9AQn2
 /KMlV3bVhfr08pKp5hem2t5Fv4stFh7o27u7HOoX081NSq7fADBdTuGPE+zIHHiy6crT
 J0jRMtl32QPiO1B8wGgmvpdBh/WOjO6A/VhIoFXTq6TWuro7B8DOP+lkvHAh5RuqjZc2
 b8uQ==
X-Gm-Message-State: AOAM5329WY+5a3Z/omGwENcPoYpbcvGHYuXPPMDqF1SZjaUOJAbWeOyB
 IMAODco49nXI5wyLYXZ19XsPTdsb6Wa28pHYrjIFfRIU8mxGWwMi+nY/xKGYDfVQRSWIXO0te5D
 PtcjzLrMU6jTC5Vo=
X-Received: by 2002:a05:600c:2351:: with SMTP id
 17mr6618968wmq.2.1613558011234; 
 Wed, 17 Feb 2021 02:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAP3HBtHah73P7dEzhxBrNM7i+rXQVmiN005Az4UQlG0s+ULnO1dINNrQaZG65eHFxJEPCug==
X-Received: by 2002:a05:600c:2351:: with SMTP id
 17mr6618944wmq.2.1613558011005; 
 Wed, 17 Feb 2021 02:33:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n66sm2379462wmn.25.2021.02.17.02.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 02:33:30 -0800 (PST)
Subject: Re: [PATCH] travis.yml: Limit simultaneous jobs to 3
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210217102531.1441557-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <52bc71f4-cf53-0044-9c8e-ef958bdd4841@redhat.com>
Date: Wed, 17 Feb 2021 11:33:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217102531.1441557-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 11:25 AM, Thomas Huth wrote:
> Even though the host machines that run the Travis CI jobs have
> quite a lot of CPUs (e.g. nproc in an aarch64 job reports 32), the
> containers on Travis are still limited to 2 vCPUs according to:
> 
>  https://docs.travis-ci.com/user/reference/overview/#approx-boot-time
> 
> So we do not gain much when compiling with a job number based on
> the output of "getconf _NPROCESSORS_ONLN" - quite the contrary, the
> aarch64 containers are currently aborting quite often since they
> are running out of memory. Thus let's rather use a fixed number
> like 3 in the jobs here, so that e.g. two threads can actively run
> while a third one might be waiting for I/O operations to complete.
> This should hopefully fix the out-of-memory failures in the aarch64
> CI jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See also this URL for the explanation of the 32 vs 2 CPUs on aarch64:
>  https://travis-ci.community/t/nproc-reports-32-cores-on-arm64/5851
> 
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index fc27fd6330..cc39a447e8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -88,7 +88,7 @@ git:
>  # Common first phase for all steps
>  before_install:
>    - if command -v ccache ; then ccache --zero-stats ; fi
> -  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
> +  - export JOBS=3

Maybe worth a comment around?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>    - echo "=== Using ${JOBS} simultaneous jobs ==="
>  
>  # Configure step - may be overridden
> 


