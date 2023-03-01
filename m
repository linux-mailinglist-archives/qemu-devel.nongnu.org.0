Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2E6A6841
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXH2W-0006Bv-DJ; Wed, 01 Mar 2023 02:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXH2O-00062W-44
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:38:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXH2M-0004Ex-F0
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:38:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id h11so477929wrm.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677656284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XUpEQ/uHIC4kK9X3lf1DvjLD7Irehy2VfpQRNjmVuAs=;
 b=T/k+yPnEnNDGWwtdfjmSYseiBlXFDUZJKGYIF8GG2G1lzHTmmHEw28MBXuXr5ngjB+
 9ra3OS0tjmaoz4aeChGke5yaugWPw4DwC92JHHyPLG/3TRT8UeTxDn3KmbTU5nxHL9RJ
 C5RGB4PsoBmOROlbmCWDroZCwYhXp8hr9k1U766/fQHMX37LHQs6C9LFNDItYSj4KPqr
 Kh3cDQrXwH/IJEIQhCMXXo88784ZKyQeuJs+TPHy1yrwRJ/5KvIMvrAx7txmf6xG8w4/
 bKxnlSiWjucYlH5x7GOPIoklYucSDpEVEtsGEFYbRhPa1CZAZ1YIWVesMSzRmBN8AuDb
 wyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677656284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUpEQ/uHIC4kK9X3lf1DvjLD7Irehy2VfpQRNjmVuAs=;
 b=nhx2d0TfxHjMgpGrI1+l1vZ2v/aWBbt+f19XPeDjEax2hN048pi3KiDPCABp6R5IIY
 ABdmrpcLSeec6JuawTMgqCPeg/6CLCqDJT5BA8+LiQ6s9utlDfiUKzlUwwA+fq3Ez3Rz
 aU7cIvCWYLtTDA/CrpEi4A3ZaithhPDiX+IJVNZibl4wDhbewVyIBZmIsvkJ1i5UNRUS
 E6dys/JW8jHlKTQLmtFfB7DIYpNeatRLcdYtaoHEO+euFTcGj3Bu2KIRf/7oq8C1uueT
 LiijFZjGOnKyTfjAXtxeu7pPyZE0ACAwdEXRk9VuznmtKEX4mpHUyOHQWZXhCSOHEAjY
 DHoQ==
X-Gm-Message-State: AO0yUKVH4S3XGQYnF+a72h50QDzVQPTCHE0m4Qc0thv6nbkOJdjkaBlh
 /gjN2f27n3n/7Y0GbJcSX/uHNA==
X-Google-Smtp-Source: AK7set+rXwvHDB1VgYk4qgSRVgkEWkfsYaTY0AHsrala+3ya5lCvJOOtfFyhWYGrZixe9aBZeGZxCA==
X-Received: by 2002:adf:f44b:0:b0:2c8:5f9d:9f6f with SMTP id
 f11-20020adff44b000000b002c85f9d9f6fmr4938814wrp.10.1677656284511; 
 Tue, 28 Feb 2023 23:38:04 -0800 (PST)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adffa52000000b002c55efa9cbesm11643744wrr.39.2023.02.28.23.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 23:38:03 -0800 (PST)
Message-ID: <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
Date: Wed, 1 Mar 2023 08:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/2/23 20:06, Alex Bennée wrote:
> To avoid lots of copy and paste lets deal with artefacts in a
> template. This way we can filter out most of the pre-binary object and
> library files we no longer need as we have the final binaries.
> 
> build-system-alpine also saved .git-submodule-status so for simplicity
> we bring that into the template as well.
> 
> As an example the build-system-ubuntu artefacts before this patch
> where around 1.3 GB, after dropping the object files it comes to 970
> MB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index cb96b55c3f..a6cfe9be97 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -25,6 +25,22 @@
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> +# We jump some hoops in common_test_job_template to avoid
> +# rebuilding all the object files we skip in the artifacts
> +.native_build_artifact_template:
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +      - .git-submodule-status
> +    exclude:
> +      - build/**/*.p
> +      - build/**/*.a.p
> +      - build/**/*.fa.p
> +      - build/**/*.c.o
> +      - build/**/*.c.o.d
> +      - build/**/*.fa
> +
>   .common_test_job_template:
>     extends: .base_job_template
>     stage: test
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 43f9e4a81d..44b8275299 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -2,7 +2,9 @@ include:
>     - local: '/.gitlab-ci.d/buildtest-template.yml'
>   
>   build-system-alpine:
> -  extends: .native_build_job_template
> +  extends:
> +    - .native_build_job_template
> +    - .native_build_artifact_template

I'm confused... Apparently this doesn't work:
https://gitlab.com/stsquad/qemu/-/jobs/3847747681/artifacts/browse

