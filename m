Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D240FF76
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:35:09 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRIhX-0000jN-OZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIgF-0007ya-8j
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:33:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIgD-0000Ej-Db
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:33:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so10660122wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6BtbayFLlnMH5quHI0bJzrl94pEjyQbLwEiB3EjV9as=;
 b=YGKEaPgTTys+j6L2tRCC3MwiOwD69i+qBPXAzJ/kpW7d/F9vI3bN79n8lzPVmWDB/W
 mgOgMDWOzQZI0GzlZjUbv8rweDqQsV7oH+MahskmbJ2IDre8tDX7HPD8lS9yePxfbbsZ
 l9Pv7aI+mOZdgcoRUoNVboS7ViMge9JIn5TyS+4oJ1yI2dBzc+MEbngwwUAUk/UyPJEy
 V/sZFluigpIzi1a1ZGS9xOVdbvjWyfPdPH8HTRjZ781wHRZsDIr5V4mRiYbzrIFyx/xI
 mdFwZB/ge/hrVTM3le6PYywx+VyDcetIEEwEk5vR+JrI5z5rmbFuI6/SEjPK1knhXNBw
 FOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6BtbayFLlnMH5quHI0bJzrl94pEjyQbLwEiB3EjV9as=;
 b=5wqbfrfVLmXzCdRmGLoyR4oftvQq9Ct6H5noVH0jIkz+i4fYv96E+aqmSTADbhTDGw
 RVDteaHZFnEWwkcBWJwdT52OcclFQMLo3dQyxl09IKtv4f5BWlO8RcRY4cqHR4BjR5tS
 ZBmCianPM4aEIPPP36JQX4G1W6pMoj0Rcg8tikZmo2fb/oud2L8aLxpMzZDlLY43nJox
 Cbf/3O2llUHhqdlFKSrSTLeCJMNHOAwndYJIzvP5F0Oydjo5Rt820NkTU5R9WT7xO4F2
 L938/opj7w7rTgUSMFwBvMY0hBZD0Wq85G26Nt0AKSdwHUX2svruTlIUR4n3tWINYK1u
 7HcA==
X-Gm-Message-State: AOAM530PE/0Zp/zvCCm0JlnQK4juK1uU5gHJz9+e6j/DKvkdjO7hb7nX
 jyoELYBd5HlwjpfHCy2uBAo=
X-Google-Smtp-Source: ABdhPJzSvalGiJNQMpMG6UL/IOenw0hJVj+2OZrFF0I49OPyM37W+1905eI/P079PWH9ARiGfHvrsw==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr16280591wmj.189.1631903623832; 
 Fri, 17 Sep 2021 11:33:43 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id s3sm2873112wra.72.2021.09.17.11.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 11:33:43 -0700 (PDT)
Subject: Re: [PATCH v1 05/11] gitlab: Add cross-riscv64-system,
 cross-riscv64-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e6f172df-41c6-4ba8-9678-aeabfae54f42@amsat.org>
Date: Fri, 17 Sep 2021 20:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917162332.3511179-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 6:23 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210914185830.1378771-3-richard.henderson@linaro.org>
> [AJB: add allow_failure]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

This was a Nacked-by... but I'm find with this version,
so OK for the R-b tag.

> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 
> ---
> v2
>  - allow_failure: true
> ---
>  .gitlab-ci.d/crossbuilds.yml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index f10168db2e..17d6cb3e45 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -124,6 +124,25 @@ cross-ppc64el-user:
>    variables:
>      IMAGE: debian-ppc64el-cross
>  
> +# The riscv64 cross-builds currently use a 'sid' container to get
> +# compilers and libraries. Until something more stable is found we
> +# allow_failure so as not to block CI.
> +cross-riscv64-system:
> +  extends: .cross_system_build_job
> +  allow_failure: true
> +  needs:
> +    job: riscv64-debian-cross-container
> +  variables:
> +    IMAGE: debian-riscv64-cross
> +
> +cross-riscv64-user:
> +  extends: .cross_user_build_job
> +  allow_failure: true
> +  needs:
> +    job: riscv64-debian-cross-container
> +  variables:
> +    IMAGE: debian-riscv64-cross
> +
>  cross-s390x-system:
>    extends: .cross_system_build_job
>    needs:
> 

