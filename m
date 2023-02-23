Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA996A1123
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI87-00063X-5P; Thu, 23 Feb 2023 15:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVI84-00060J-QX
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:23:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVI83-0002up-4c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:23:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so444878wms.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Af2Za+8irjF66X5bdpmsd4og6QP7aT/Ry2xmqr2qtm8=;
 b=QrnwPInO2JPlvPLAaqWZL6pHeedE304fBGtUSP9qHek5DsS8w1Oj59gGRz2QgtxH84
 XxbvyLZ04Q5bgnUY7TPrWzudUhatt3/e6JXW0egkFqD4h2UnH8vtenlDmVSIUXmUHLMA
 yWUr7XgsYKrEgL2S4AXokt6yAQnB+XS51rZ2BNJmF0qXTtgyFYcFZ1CGC429KJJyoONN
 aCOhfsmTH3Mi1FFEkN4IpousjcNZrGfL8pUOkMY3iHXhu9IZfHFpbEXzHac6KBIDxSst
 i5UvmGrAZaTFC/msuaGpiYheUrJVOPx+3VgocHY0xJOTs8BDqt+V3qGgGWnAfc29lVul
 HQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Af2Za+8irjF66X5bdpmsd4og6QP7aT/Ry2xmqr2qtm8=;
 b=BoPs1EMn01azrYgiWLex7+q0aclRagh/cg+VAkuGvgFVQaO47q7P2czyYzCaFJms8Q
 0IvAmqJvc2ZKVpBul62gpz109QwRTMrUUa9t/3P5jLGW+/+TMBPxK0Pq8BHHrcys+u3k
 6t7gulvJ9DhsuWEzkKzabZzP9OiSSMHdBvkVAcnq3gOlz4+mEvZXqZ6SbsbAocfU1r+q
 rjwYzRwFO9CaM8c4wuZMXztFmlb18lmz4sW/2A0HPM81Ot/InHfXrWmeyYgV+6z4pxiI
 PNTKDtrZYDh4wQetM/qmCV3P9m44zuROH7BrZjVufb+3Np6D62p2+tjADDrJB+ZK8G7/
 nlQQ==
X-Gm-Message-State: AO0yUKUaStZQo4iMkrw3Ssl2RARrlkL6azNoQgOSw1cT24CvG9xMRNu+
 WUKwPpgqJ/HakhA+N/gP6al36w==
X-Google-Smtp-Source: AK7set9/ddY67g3dqtuXGCVL1ThGnTQhIDOcDQLRn3OoYmZP8UHkivtbs+GaLH+vNH0xq8PYgsdvaw==
X-Received: by 2002:a7b:c446:0:b0:3df:e1e9:201d with SMTP id
 l6-20020a7bc446000000b003dfe1e9201dmr10441653wmi.40.1677183825460; 
 Thu, 23 Feb 2023 12:23:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b002c561805a4csm13089555wrt.45.2023.02.23.12.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 12:23:45 -0800 (PST)
Message-ID: <584c71cb-02e1-9386-44d7-ca2ce1c3253e@linaro.org>
Date: Thu, 23 Feb 2023 21:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
References: <20230223191343.1064274-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223191343.1064274-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 20:13, Thomas Huth wrote:
> When handling pull requests in the staging branch, it often happens
> that one of the job fails due to a problem, so that the pull request
> can't be merged. Peter/Richard/Stefan then informs the sender of the
> pull request and continues by pushing the next pending pull request
> from another subsystem maintainer. Now the problem is that there might
> still be lots of other running jobs in the pipeline of the first pull
> request, eating up precious CI minutes though the pipeline is not
> needed anymore. We can avoid this by marking the jobs as "interruptible".
> With this setting, the jobs from previous pipelines are automatically
> terminated when pushing a new one. If someone does not like this auto-
> matic termination, it can still be disabled in the settings of the
> repository. See this URL for details:
> 
>   https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/base.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 50fb59e147..0274228de8 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -11,6 +11,8 @@
>       # and show the duration of each line.
>       FF_SCRIPT_SECTIONS: 1
>   
> +  interruptible: true

It makes sense for mainstream, but seems counter-productive in forks.
At least in my maintainer use case.

Is it possible to add a 'default' in .gitlab-ci.d/qemu-project.yml,
so we can overwrite with a different namespace? 'interruptible' is
listed in https://docs.gitlab.com/ee/ci/yaml/index.html#default.

