Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E2162621E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 20:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otZoR-0001O3-5u; Fri, 11 Nov 2022 14:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otZoI-0001NP-SO
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 14:35:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otZoG-0004R6-Ez
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 14:35:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d9so3009513wrm.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 11:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5xx31uYR0RAeSHjpFEA0WDS28ql/ROYeNKHPsuDwBg=;
 b=M/LeGOtkiLYU6S82vk2yH7J0bMHjSRhDxjIGDkQEmo9uKmMsZqDVltnvybrWSz9cjE
 q2uUrcGcDpmz4jU0ezFyLV4hzbPYuvWwRUmpDJbS75bHYn0XHjUPjwp1zzn53CHa21oa
 t2GqQsWNA9qrB79ym2C3eymYwEsUdVmahExqefRraj/N5x5bPBzU2j+VfEjFHaeHGf2T
 KmSrSYctFbm1gRMfQWNNu+qhyeU2cOFD9LdB80Q5oK1aCWa5uoHHicxs9+eayzpcW9le
 A9O4YLKsVLRQl9ctG/m5LNdn4hDckkRQuK31DTTqkdNSmE8OSfj1l2fitymwQT9HG5wZ
 Y44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I5xx31uYR0RAeSHjpFEA0WDS28ql/ROYeNKHPsuDwBg=;
 b=Lkhl//pXJzz54RR+KN4/lj6cBwS5aT6Jehds6LtiMC+wPMS0aBR5VYlAhW3NYX5rph
 LgPhHtMeIjiRaUSYM8vq8AdKzyp2ABTrSd6iLXMon1XsP8QP1v41oidRx2N4u1KbAC1L
 cvwRe7Tqo41hWBoGcIGDPcnK4JX2iY0LMSb6GsmGuHrNLIq/29Qv95k7eUEgjnKUzBJ+
 M7+xCOF6yJmqyBv9MZnQManto6y4lSQltNGZvvBaXAWfzhRXR/M9oKTzbEd+pmA/OpCb
 8dFUH/dzeluK+Z43FSRgBsdBsyCV3bMr3D2Qj/t/AzjgQ+BwezcCFzDPUX2CsrEF2wkY
 +Kiw==
X-Gm-Message-State: ANoB5pn2fsFo8WqAFlqETzSUm5MaQAoHC2KwL6rwFuy42B62QljIHKG3
 8mwN8LQ3Fs2Smjgl701Q+V41JQ==
X-Google-Smtp-Source: AA0mqf48WOzNHw7fJG8TFP2hEdnAG4U/2H/RL9wpvyBa+H+6MXXJU+MOvFWbINh6cp0ERsph1yXofQ==
X-Received: by 2002:a5d:4807:0:b0:236:599b:d09c with SMTP id
 l7-20020a5d4807000000b00236599bd09cmr2115210wrq.433.1668195326230; 
 Fri, 11 Nov 2022 11:35:26 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1c7707000000b003cfa80443a0sm3924455wmi.35.2022.11.11.11.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 11:35:25 -0800 (PST)
Message-ID: <b2240740-385b-772e-4342-e19e5cea4092@linaro.org>
Date: Fri, 11 Nov 2022 20:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 11/12] gitlab: integrate coverage report
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111145529.4020801-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 15:55, Alex Bennée wrote:
> This should hopefully give is nice coverage information about what our
> tests (or at least the subset we are running) have hit. Ideally we
> would want a way to trigger coverage on tests likely to be affected by
> the current commit.

IIUC per [*] this will not appear in the pipeline but in 
https://gitlab.com/qemu-project/qemu/-/graphs/master/charts under 'Code 
coverage statistics', right?

If so, can you document this in this description? Also maybe this can
be linked in some docs/devel/ci*rst file.

[*] 
https://docs.gitlab.com/ee/ci/pipelines/settings.html#view-code-coverage-history

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 7173749c52..d21b4a1fd4 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -494,7 +494,17 @@ check-gprof-gcov:
>       IMAGE: ubuntu2004
>       MAKE_CHECK_ARGS: check
>     after_script:
> -    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
> +    - cd build
> +    - gcovr --xml-pretty --exclude-unreachable-branches --print-summary
> +        -o coverage.xml --root ${CI_PROJECT_DIR} . *.p
> +  coverage: /^\s*lines:\s*\d+.\d+\%/
> +  artifacts:
> +    name: ${CI_JOB_NAME}-${CI_COMMIT_REF_NAME}-${CI_COMMIT_SHA}
> +    expire_in: 2 days

Hmm do we need the 'name' and 'expire_in' keys? That would be to keep 
the coverage.xml file?

> +    reports:
> +      coverage_report:
> +        coverage_format: cobertura
> +        path: build/coverage.xml
>   
>   build-oss-fuzz:
>     extends: .native_build_job_template


