Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D370140C6F7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:04:27 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVWU-00039R-Gm
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVTM-0002Mh-SQ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVTG-0001y5-HQ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631714465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlZ1YCb30SRmECy4rt2akXvv/judfTNAwht78vwMZxk=;
 b=Cqu/rmd6rsM4b6GYMJFETgTDDUKhOgw+Ln7oI4VPSdn+wDRwNJIwBzJLgHy/iPeRgMMiZP
 ixk6M7Q0g94AxHgc68DqGHAqDtUNEFwwoVP7+lyqjXI1ru+V7VqtaVtwW36mjAoJ0U0q2d
 uLZWVX5H/NWjlME0v6huFXIOtnjIZf8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-zJUpXnnbOcmsz7BjOy3gCw-1; Wed, 15 Sep 2021 10:01:04 -0400
X-MC-Unique: zJUpXnnbOcmsz7BjOy3gCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 j1-20020adff541000000b001593715d384so1057871wrp.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BlZ1YCb30SRmECy4rt2akXvv/judfTNAwht78vwMZxk=;
 b=4/95i/Khh+yJawaWzQ5YRwGo5WWaUkWqe1s6Nh79Xs7X46P9c+p/xxiWb8cPwyiz3H
 mhTfVXAgDWSe5C1nlIdToNPYNkJo/P7WFVpufGhEOYnp2QkLpEeAs5Cvcpcxnk0umipd
 f7f3X9zhLTSZP34ue0i/utf03PtX//+02f0Lv61b3v79U05aXS24uNInFZ/HCkLbCGHi
 DD8NkZlYCHgFRhNwyQLpWTEmPcQNgUH52bxlFu1gfTW2XSoWotb4wfhk6a+cfPXAwqXk
 WriARDRhyWYBbctGst9mIkyNHOtMVvyUQnk2D6elXkN+wfa9f9tRNmloiR10BAk2cNSh
 lgVQ==
X-Gm-Message-State: AOAM531eY1QiYlWY7AKDpxz2aC49ZeeaHDovQ3OkWVzVjjcNnenzAcOo
 ivoVLmStCF+PEBns0whV3VHL9z5xV+Qdc4g6ZLcBBcqRH827ZgxNx4sbHocYZMQOpFxwqWM9XHK
 krqAO5/8XHJtBpTI=
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr3813192wms.135.1631714462907; 
 Wed, 15 Sep 2021 07:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM3blawnZjrYbFELbpQnzU15idZrYW5YGPkbybOAiHZm9ajXeGhumso4pNc/m4JeilSEO6Yg==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr3813152wms.135.1631714462664; 
 Wed, 15 Sep 2021 07:01:02 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-145-004.46.114.pool.telefonica.de. [46.114.145.4])
 by smtp.gmail.com with ESMTPSA id z5sm4548140wmp.26.2021.09.15.07.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:01:02 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Mark manual-only jobs as allow_failure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210915123412.8232-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <826e27ab-fff0-0a5e-bf35-59937f51b130@redhat.com>
Date: Wed, 15 Sep 2021 16:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915123412.8232-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 14.34, Peter Maydell wrote:
> If a gitlab CI job is marked as manual-only but is not marked
> as allow_failure, then gitlab considers that the pipeline is
> "blocked" until the job has been manually triggered. We need
> to mark these manual-only jobs as also allow_failure: true
> so that gitlab doesn't insist that they have run before it
> will consider the pipeline to be complete.
> 
> Fixes: 4c9af1ea1457782cf0adb29
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index bcd22ca293c..a89a20da48d 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -60,8 +60,10 @@ ubuntu-18.04-s390x-alldbg:
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> +   allow_failure: true
>    - if: "$S390X_RUNNER_AVAILABLE"
>      when: manual
> +   allow_failure: true
>    script:
>    - mkdir build
>    - cd build
Do we need the "allow_failure: true" on both parts, for the staging branch 
and for the manual rule? Or would it be enough for the manual rule? Anyway:

Acked-by: Thomas Huth <thuth@redhat.com>


