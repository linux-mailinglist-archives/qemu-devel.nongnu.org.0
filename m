Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019B40C72A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:13:32 +0200 (CEST)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVfH-0006pe-Cz
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVdV-0005KF-SA
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:11:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVdU-0007Vj-3T
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631715099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wD9f1gGfsFj6BbxulC/85kClLl3DOnLq7rAr2wHP1AQ=;
 b=KrGXKfdnAMfUmIY06u+n+2qUrczH+qD8PvIy9s5DcI28Bka4YXFGI2ZVU65Jievv1thFdM
 o0ihdqx1aLS+/WkzOdF+mTQ4K0OVqP+RK0Lx1jiqsEjxf6twUr9Z42MpsqnKPReEwj8leJ
 WaYrgR403ujgm5w7n2L9lqmJLKIfu3c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-y6454HupN_K5Y_bp7_VvaA-1; Wed, 15 Sep 2021 10:11:38 -0400
X-MC-Unique: y6454HupN_K5Y_bp7_VvaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g13-20020a1c200d000000b00308ecd761e8so1529314wmg.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wD9f1gGfsFj6BbxulC/85kClLl3DOnLq7rAr2wHP1AQ=;
 b=M6ZOCcrdqlYM+85E21lOZ90T06u+CZb46jYWM+4n5syZ+SgjOBlwEiMo/D1mTMFIqk
 B+Qsm/zgNVSQ97Vw/ykFzg6S/uhghkMTJ7XKAPDLkTa7ljWW1rBgxy41VEpaJMnKsalv
 WADyxhD9FidDoCEmH39R2G1iDEhymAMI4wwdmBP8DCBhkup7X/dRqkqw4UW/JSmkG06/
 eE4tSjR1XO+hmhotcKtDuRieEYkVLqGQ31O5OLuN9N6Pde3lMbSvnX3lGamwBavTvs4e
 rDkR5/axEkycBUPmtLZ/iBaACWOUzyStJBmHsDYj1Yld80Jl7kNfm3yr+vQnqXngIqIv
 hxGQ==
X-Gm-Message-State: AOAM530TCyQreGheDDHrBvbCuD/5SxZ+NzRMuACiSEUthPkEmYWiUrwj
 yfIHgcUPeDmxVdupV2a/pH2D2SswfffGKU9iLvE0mSOVk3KGVH+HUCYS4AT8IyDGj3I/rn+Rt+6
 q/Uv3MQ5849qF6dw=
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr4763375wms.95.1631715096983; 
 Wed, 15 Sep 2021 07:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4rHSdLaligAa3voerz7MLFr699yNF2expChlqLEKCmRwG0HDGB1exsycI5JEchc1z4rEjnA==
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr4763344wms.95.1631715096671; 
 Wed, 15 Sep 2021 07:11:36 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-145-004.46.114.pool.telefonica.de. [46.114.145.4])
 by smtp.gmail.com with ESMTPSA id g1sm5348639wmk.2.2021.09.15.07.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:11:36 -0700 (PDT)
Subject: Re: [PATCH 1/2] gitlab: skip the check-patch job on the upstream repo
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f6c28fba-d5a5-31e9-e180-90ca16f4cfb4@redhat.com>
Date: Wed, 15 Sep 2021 16:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915125452.1704899-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 14.54, Daniel P. Berrangé wrote:
> The check-patch job is intended to be used by contributors or
> subsystem maintainers to see if there are style mistakes. The
> false positive rate is too high to be used in a gating scenario
> so should not run it on the upstream repo ever.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/static_checks.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> index 96dbd9e310..902843f8b3 100644
> --- a/.gitlab-ci.d/static_checks.yml
> +++ b/.gitlab-ci.d/static_checks.yml
> @@ -8,7 +8,7 @@ check-patch:
>     variables:
>       GIT_DEPTH: 1000
>     rules:
> -    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
>         when: never
>       - when: on_success
>         allow_failure: true
> 

Acked-by: Thomas Huth <thuth@redhat.com>


