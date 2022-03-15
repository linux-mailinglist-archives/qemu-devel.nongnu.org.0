Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58504D9B63
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:40:05 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6T6-0005mm-ER
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:40:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6OA-0003Rt-F5
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:34:58 -0400
Received: from [2607:f8b0:4864:20::62a] (port=38578
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6O9-00045s-2Z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:34:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n18so13418306plg.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fH/BM/oZjx1+DwjFO9M1ASNCXZpM3sSQ7HpM+zL02nQ=;
 b=dOHkkoJ0h2PJwnT05NrM6c1D3Z7u9n0led+m+82CAyobGtMYNNtKgdh3vNr2F7FrG6
 ZAOUa28H39+O82FStzimiDEGJxYDBUfKNufqs54cbglmh5gyXtbv8Na1Quu0Bdn9V8wt
 gz6ZO46KD+7R8BsmIfdy2GhPOA+zdVo3Z8rtffxUtpaB3u4j5uUVYJV5Km1PPILOhi9m
 Uokc4tzqlCtjS2dtVI8e6PkQTvGBYwObAcghgf5HgmAgv2eFAsjDdvqsTFku6dPDeyFV
 pikhLFw0IT2766P1c8RdYk6CibZ9LHgAwRH7uB29Zcg5Cc0GdCl+qAFgh3E5WxZhuCLX
 CsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fH/BM/oZjx1+DwjFO9M1ASNCXZpM3sSQ7HpM+zL02nQ=;
 b=mEODvDVqBFXwDkco+rFymN5TBDgroRGcVA79GiuIyLlWJ7y0lBpSUmX6asB1WyOdi+
 cM16OFsOghfglIfBoMDFtSx2dyBmcVZX5vmL6v2OjHAFjWYedmxTybyercflJ/SSrdUh
 vR8TTrU/7h3qropPZ/iV/9sMnlX1Vol7npoh9XVplOLRuRj2LE2LfXG2nVhnPtOVU/4Z
 ruRRB52knkpoLqSEx/1OFLV9pqihYb8xO8vzkiFF3BAczmI0UiSCYbZvFgm3w3x8l654
 fjjxz1J0+Qg1QeJuz/Eh39lXyQI/XUEKoqC4HAWD5JMHNgdG4iMeoVD+T1F7L0OPAk8x
 mCRg==
X-Gm-Message-State: AOAM5322isDRyFYWUw104/Zq53zMLQ9HwBWTMHDO6EucUZY4sLRgMXR4
 iPnhOAn3rPjeOtD8ZJPuINc=
X-Google-Smtp-Source: ABdhPJwdYgEZePVkVVpr3GJDJay9V51y9V8U3cASaBGGeWgcgdHEKaYKSVG2YpKKz+1kQPfzPmwWGA==
X-Received: by 2002:a17:90a:ea83:b0:1bc:2cb6:78e0 with SMTP id
 h3-20020a17090aea8300b001bc2cb678e0mr4406429pjz.20.1647347694257; 
 Tue, 15 Mar 2022 05:34:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 9-20020a621909000000b004f6f40195f8sm23075992pfz.133.2022.03.15.05.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:34:53 -0700 (PDT)
Message-ID: <531d5dba-31d6-a777-dd33-dcc59beacc7e@gmail.com>
Date: Tue, 15 Mar 2022 13:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] gitlab: include new aarch32 job in custom-runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220315121251.2280317-9-alex.bennee@linaro.org>
 <20220315121954.2283887-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315121954.2283887-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 13:19, Alex Bennée wrote:
> Without linking it in it won't be presented on the UI. Also while
> doing that fix the misnamed job from 20.40 to 20.04.
> 
> Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - argggggg!!!!!
> ---
>   .gitlab-ci.d/custom-runners.yml                                  | 1 +
>   .../{ubuntu-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml}       | 0
>   2 files changed, 1 insertion(+)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml} (100%)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 3e76a2034a..15aaccc481 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -16,4 +16,5 @@ variables:
>   include:
>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
>     - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> similarity index 100%
> rename from .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
> rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.ym
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

