Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805AE35F185
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:31:34 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWco1-0003xd-KI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcmU-0003RG-Mf
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:29:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcmT-0005Tq-3U
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:29:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so12322356wma.3
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MYBf3BClUV3kTEMLYfG9214ettpUJD67Ii4y6263/3g=;
 b=G9fcg9sVprmh2c1jqTza0+zxKnn+fscjNo6y0CibknVYal7LWxdtwwvRoSczonFqbT
 IaSgue43cfveLWbV4Hq4Wg5ro6Zuq1Z7GFrCGW8JRkAwX2zM3KkvjjT34MPl+1L0g/79
 DQNLluZ+xq7DOsOt0vvMURknYsG9exL3+LaWdDu1Mx7Lk1ogMRWzz+MI5LvSfulSBev9
 brM8JaQxJFXuz4u/bjWNNWTJuNd7Bvhbac40hDq4GWs+FeVbl9hrpMLm3nk2WSJBMUoW
 CO/yXN974YrFd7ioXvicDp/0qg08pY/OtzKSdz/fsgp3svhjFO0zZVUGjEmGOmCeGY2R
 s48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MYBf3BClUV3kTEMLYfG9214ettpUJD67Ii4y6263/3g=;
 b=NSVeFrhvxuGPwXZ5tRqZU+J0gI22L14uNoz2eE8qkYSle0abX8IILNBp1IOJefG6gE
 1HK22vCo+KANfvNh5Q3X5TWKhYn0kPvu30bgb1caPlKsB7GO6sfFEP7WkHl9lTQOxiiE
 Ph7XC4kkOB7FGLbe4kPTl6DVe96VMVaXg0yDTYfke35RcI2ahzNw9S1w2a3f7ERPWuVo
 gVdP+cxs8bxVclJXgKXIqOdq8Me1TrrYhVFqHR5z81HkgA5D8gmTUo6JqvSeUJoI1aEd
 X+BP15aid1kTMdcMeC8RpZkFjNujOEks6J3Nz+rIT5LnSrc7iGziNnkVr6A128NJx5ok
 P9tg==
X-Gm-Message-State: AOAM5312WH/jT/uPjmilKSeU+jfDvuZ5s6/k+dRbLqDUOvpyWMqPx6GH
 Vyq59RUU4Jf7SyC+/LY0k0A=
X-Google-Smtp-Source: ABdhPJzosdvTAP/hJWu9dH2l8yK1pjFWHYQCwyJvyBGC1YR0AoSyr8bjXs7fRRrIavYpBcKJM45uhg==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr2339017wmq.143.1618396195502; 
 Wed, 14 Apr 2021 03:29:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a22sm14379380wrc.59.2021.04.14.03.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:29:54 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] gitlab-ci.d/crossbuilds.yml: Enable compilation
 with ccache
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
 <20210414081907.871437-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8f0accf-2aaa-38c9-c2b5-802ceff4d21e@amsat.org>
Date: Wed, 14 Apr 2021 12:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414081907.871437-6-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 10:19 AM, Thomas Huth wrote:
> Ccache can speed up the compilation in some cases, so enable it for
> our cross-compilation CI builds, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 017731a894..dee327a936 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -1,4 +1,26 @@
> +
> +.ccache_cross_setup:
> +  cache:
> +    key: "$CI_JOB_NAME"
> +    paths:
> +      - ccache

I discovered last month the cache/artifact passing feature is useful
when all runners are in the same premises, but when you used runner
in different locations it become slower (except if all your runners
are in very fast clouds probably).

Not a short term problem, but can hit us long term. I haven't looked
if GitLab already figured how to manage this globally, like registering
runners with affinity, or assigning them to pools.

If we decide to stick with the free-tier runners, then this is a great
improvement.

For custom runners, a simple kludge is to assert they do *not* use
cache/artifacts (from free-tier runners).

We could restrict this to free-tier runners but these runners tag aren't
standardized, and AFAIK we can not (yet?) use the "ANY" word to "select
runners with any of this tag list". So far I noticed gitlab uses these:
- shared docker
- gce docker
- gitlab-org
- gitlab-org-docker

The last 2 are recent, and seem to help with the problem I reported
that some runners don't have Docker installed:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02213.html

Regards,

Phil.

