Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29754B64CA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:53:32 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJseR-0002fp-Nh
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsaP-0000Gl-7U
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:49:21 -0500
Received: from [2607:f8b0:4864:20::102d] (port=54192
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsaN-00007b-41
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:49:20 -0500
Received: by mail-pj1-x102d.google.com with SMTP id qe15so16730662pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YjRQIehuFvyT/HOncd6ACeyQd4ptT3JFYBV/nbI2IEk=;
 b=BnfBabgbAphjC3SVa7hQI9FzjTJuFapnRkYYJSohddbQDjKgKEif83uqH5zkjRD/ud
 k7m1qyuOqwqVrv1tcJTcDyfZiSmiGsvSVAUyvqERXktWt4FFbbkxbPxjjbhCD7UC0gzp
 Y+BiKl/LfXKm1onyQdUFZCOB1zdRD9OTNMOaUN9GMMTG4cIrlVQbnVr3tvndQkK5v9Fv
 y//koLNitej9yAvEHRYtBSKqlUkJ7+3oLx0fNddFcNvq76wsrVQhOqhzhqRMZJclMq6O
 PJUX2Etdvxmct7IOmUwQ55temRHnQKSkZhiuj8etptQ1hjFQZsz6kgqCtKa0wwsB3jN8
 9Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YjRQIehuFvyT/HOncd6ACeyQd4ptT3JFYBV/nbI2IEk=;
 b=MQ8o6oWOsWLJ/JdJBuePQ34IImeaGa/6JGHzHAeQl1LO+gd65yByUzqY+D5WzZLaKL
 TTHZCJDyPtpIDnzWkKRuZh5qZydqg/mt3rKZQKnCHlin5H9WoEQmVKolS9JkOTUX+FNg
 q7uJ0RR/dFs7dzsKijgBqNsFC+P85W5CcFYyi7P+fQhF0VN8GlExDkvrUd98Blv8JJGz
 ZGKn9KkF5S6YRuGuuFQBIOcDiCjmmste+72nW7bN9uAIYaqVwX20BFbmLCl6mgrBZ8O0
 q8ADA5avivi7rYSbvLVFT2HyaQUonjx5+W53j54zKUc1MHp7QT65ZS9ASX1gyQCEMWZw
 h/Cw==
X-Gm-Message-State: AOAM531BVDGcXVRTussL5+rIHmPHsY+vSvwlVL3MYRZPLxI43K9eBlKI
 5ivoCx9oM6Ks8KLdPCdUfLk=
X-Google-Smtp-Source: ABdhPJwdKcvosLMb+LkA1kq3jGtc0b3AyNnIk+tWsGhNoSjM6I1Dptqjcp2DXQp15EyP8d4hMZv+PQ==
X-Received: by 2002:a17:90b:4a11:b0:1b9:9685:eea4 with SMTP id
 kk17-20020a17090b4a1100b001b99685eea4mr3051469pjb.136.1644911354397; 
 Mon, 14 Feb 2022 23:49:14 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id iy13sm16042673pjb.51.2022.02.14.23.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 23:49:14 -0800 (PST)
Message-ID: <f340c859-3b20-98bc-a3eb-e7da207493eb@amsat.org>
Date: Tue, 15 Feb 2022 08:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PULL 15/28] tests: Update CentOS 8 container to CentOS Stream 8
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
 <20220209141529.3418384-16-alex.bennee@linaro.org>
In-Reply-To: <20220209141529.3418384-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Thomas,

On 9/2/22 15:15, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Support for CentOS 8 has stopped at the end of 2021, so let's
> switch to the Stream variant instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220201101911.97900-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220204204335.1689602-16-alex.bennee@linaro.org>
> 
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 3abac7a8b1..3ede55d09b 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,10 +1,10 @@
>   # THIS FILE WAS AUTO-GENERATED
>   #
> -#  $ lcitool dockerfile --layers all centos-8 qemu
> +#  $ lcitool dockerfile --layers all centos-stream-8 qemu
>   #
>   # https://gitlab.com/libvirt/libvirt-ci
>   
> -FROM docker.io/library/centos:8
> +FROM quay.io/centos/centos:stream8
>   
>   RUN dnf update -y && \
>       dnf install 'dnf-command(config-manager)' -y && \
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 25301f2ef0..4ab90a310a 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
>   ]
>   
>   try:
> -   generate_dockerfile("centos8", "centos-8")
> +   generate_dockerfile("centos8", "centos-stream-8")
>      generate_dockerfile("fedora", "fedora-35")
>      generate_dockerfile("ubuntu1804", "ubuntu-1804",
>                          trailer="".join(ubuntu1804_skipssh))

I don't understand, I don't get the same output.

This hunk is missing:
https://lore.kernel.org/qemu-devel/20220211163434.58423-2-f4bug@amsat.org/

Should we add a gitlab job that runs 'make lcitool-refresh' and
fails if tests/docker/dockerfiles/ mismatch?

