Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80484331394
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:39:19 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIuc-0005zE-HH
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJIqo-00034R-9J
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:35:22 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJIqm-0007wy-01
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:35:21 -0500
Received: by mail-ej1-x630.google.com with SMTP id e19so21657631ejt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6/gXrf0AmhmmSmXt9zjxJwOacQr8G8EZFeORvnPuSxY=;
 b=u39/eBkmDQ5Z2RG8GjwnH5ms+R2CwghStdYRt3yOsbqOHmPN2AwUxl+RjUoMC6CQJz
 b5PsqvkY+mpfPKd5e84OKu9ZbFOf0l8REi2gvG1EjcJH+Dvtk8N63EUGk7xAG4FbMfh/
 PQfQTV7ofVWvHgOQq2x4gKeoVPr/dJGQFYGIiMclunhWJrWUwk56GNUBHwEW2aOohZ7X
 t4twXCCQckfIvRfNdSUdmvjZf4iRd0/IBhrwGJLVhqdNlLLOlR5QI9IFezIGfkKrFNx3
 hLtHPXc94m8r3St7KQJsB85K/X3YVHrBUzROirDV7dKrpGQ1LToIymjw9Ji5nKLpzJwH
 am6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6/gXrf0AmhmmSmXt9zjxJwOacQr8G8EZFeORvnPuSxY=;
 b=YGepuetXFb3IGTCpjwALN//pCcouEdHItES4frLuiVrIL07THXJ0sZePYI1hT8IsAp
 /N2P5Vxx/UFTW8IWoNaTTV+lNxh0vBsJVOWwtq/I5nbPvisifRn4uhgcqxzyiRYUKPSx
 IdWs2CehLAUyZBJfOhAwO/dq0W5BWGByZIK1B1mPh8egat7egxrBFXV1LZM2NsbiA9L5
 tQReN31v3s3PAjepPBg7yVq4HWd1MLYNyRUEJR0mYbBqmpEMsGrb9YtUcFH9wGPWNKA4
 V0oa6zF7itoXCZJkc+fcAdE02myj8HgGrE61ruJzv+HdatjCGAEnHEWAJtPuELxI8z1m
 0gig==
X-Gm-Message-State: AOAM531/V1vGjtYbfl9o8bCmpkNetKKNZz7zhbd62vfKfeQwn9H6oogC
 g46WJk8wJHj8wrWbGghWYvM=
X-Google-Smtp-Source: ABdhPJxn4YXi4L6AA/pIQpYjLt5XXFdYiWtB8V9zth3+xNsb81R06kfIjc31s4QlxPDmn+bqpLEwDA==
X-Received: by 2002:a17:906:5849:: with SMTP id
 h9mr16093537ejs.551.1615221317945; 
 Mon, 08 Mar 2021 08:35:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c2sm6799341ejn.63.2021.03.08.08.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 08:35:17 -0800 (PST)
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210308154633.158915-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <78fb219e-fba5-0dfc-b21e-0cc657a9c372@amsat.org>
Date: Mon, 8 Mar 2021 17:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308154633.158915-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 4:46 PM, Thomas Huth wrote:
> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
> 
> While we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again.
> 
> Now to avoid that Alex is listed here alone, Philippe and I agreed to
> help as backup maintainers here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Keep Philippe and myself as maintainer instead of reviewer
> 
>  MAINTAINERS | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..5c4c179abb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>  
>  Build and test automation
>  -------------------------
> -Build and test automation
> +Build and test automation, Linux Continuous Integration

I'd rather not limit it to Linux hosts...

>  M: Alex Bennée <alex.bennee@linaro.org>
> -M: Fam Zheng <fam@euphon.net>

I'm not sure about Fam removal, he is the one maintaining patchew
(see [*] below)... Maybe we need an Ack from Paolo?

> -R: Philippe Mathieu-Daudé <philmd@redhat.com>
> +M: Philippe Mathieu-Daudé <philmd@redhat.com>

Erm I don't have green light at work, so please use my personal email:

M: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +M: Thomas Huth <thuth@redhat.com>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>  S: Maintained
>  F: .github/lockdown.yml
> +F: .gitlab-ci.yml
> +F: .gitlab-ci.d/
>  F: .travis.yml
>  F: scripts/ci/
>  F: tests/docker/
>  F: tests/vm/
>  F: scripts/archive-source.sh
> +W: https://gitlab.com/qemu-project/qemu/pipelines
>  W: https://travis-ci.org/qemu/qemu
>  W: http://patchew.org/QEMU/

[*]

> @@ -3289,17 +3293,6 @@ S: Maintained
>  F: .cirrus.yml
>  W: https://cirrus-ci.com/github/qemu/qemu
>  
> -GitLab Continuous Integration
> -M: Thomas Huth <thuth@redhat.com>
> -M: Philippe Mathieu-Daudé <philmd@redhat.com>
> -M: Alex Bennée <alex.bennee@linaro.org>
> -R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Maintained
> -F: .gitlab-ci.yml
> -F: .gitlab-ci.d/crossbuilds.yml
> -F: .gitlab-ci.d/*py
> -F: scripts/ci/gitlab-pipeline-status
> -
>  Guest Test Compilation Support
>  M: Alex Bennée <alex.bennee@linaro.org>
>  R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

