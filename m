Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8083690DE3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9Q8-0003X3-O6; Thu, 09 Feb 2023 11:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9Q6-0003WN-Cv
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:05:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9Q4-0008C1-Gz
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:05:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1883798wmb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djgcyGsdOv6XxuAw6I3aTcwIRa4L5pY99ehSd8wV1UA=;
 b=BT1fHO3h0F4VHAJ21beahAjFZzOWAVPerHPoGFQ+TUEnSXKC+kLjLQO7AzXge7K/lP
 20Nik1Pu9typPgBK2tAfJ8wqhx91ULQexdb7Z05Dc06D1fK/9FrOhZ/97BsqpriZcExy
 2UDHogaivnt5X7cQCjBt2M2Msv289MaceSj69XdwswbvkzgSu7f0xfnla4sI8RbCpTE9
 wbhNxx6uJVlI9rZeKS6/x1fNLRfCaxVPH0PDB9jObgoBoaxqNcmNY9wjd9UcFffDQzFF
 bbnOw3ztwwz17cCLSi26jBn66nAUs0LtQlETM42OICXhf2gty7y1YfnMcrMtSrA1l4xf
 dOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djgcyGsdOv6XxuAw6I3aTcwIRa4L5pY99ehSd8wV1UA=;
 b=MUxoH8P4q4QtJvWga2SGY4GZc2OebsV0IoxI8s92NMqzvzyDbYvG/6Xr4CmH+edV7L
 utnf++p0rKzWlfsLn4SMxU+x0Em6u0Eqhz3j+V8J3uuzjRIiQs2hS+Rmw72Lqr/zYZ7x
 gaGSne5CNVmGkk1vhDS7SxXb0nDgZlMsFAfMzECwZvgG1CkZoWG02L+KRkj3pvxiFEZ+
 8Q/sLGibEfOLi0/rsLsg8707wwZzQCP3wXlqm5pIH9dHumtXjMciJCEg15gt2+nckD5a
 zFhfuP3B/Nw2Q+QuTt1Xfs4Ge0oiU/ex6skFXWh4gqN240/QuCT7ltcn/xZaeAT+k8rs
 zXxw==
X-Gm-Message-State: AO0yUKX2d6uqZyq6oXCJZw8odbJ12pwMmUcRrG9/rE8AimTgFc+mA+g6
 /wMiAiKuTM6fde0fVzcVY/1akA==
X-Google-Smtp-Source: AK7set98yLv1iMqztv5XsreK2s49SPvzXGErvm44IcODFrgKF+F1nFpJEjsgXn37WPG3zjPF7bgVlQ==
X-Received: by 2002:a05:600c:4d22:b0:3db:1200:996e with SMTP id
 u34-20020a05600c4d2200b003db1200996emr10431330wmp.16.1675958706724; 
 Thu, 09 Feb 2023 08:05:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003dc48a2f997sm5360203wmc.17.2023.02.09.08.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 08:05:06 -0800 (PST)
Message-ID: <c3981224-a637-249d-ff19-133b0f55c25b@linaro.org>
Date: Thu, 9 Feb 2023 17:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 6/7] CI: Stop building docs on centos8
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209154034.983044-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 9/2/23 16:40, John Snow wrote:
> CentOS 8 does not ship with a sphinx new enough for our purposes (It
> necessarily uses Python 3.6), so drop this from this build. We can
> resume building docs on CentOS 9 if we wish, but we also currently test
> and build docs on Fedora, Ubuntu, Alpine and Debian.

I guess remember this wide collection is on purpose, since sphinx
had different dependency versions and was failing differently on each
distrib. Peter might remember.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aa149a3524..0eb7f6606d4 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -166,7 +166,7 @@ build-system-centos:
>     variables:
>       IMAGE: centos8

If so (wide distrib collection), a "Please add --enable-docs when
upgrading to centos9" comment here.

>       CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
> -      --enable-modules --enable-trace-backends=dtrace --enable-docs
> +      --enable-modules --enable-trace-backends=dtrace
>         --enable-vfio-user-server
>       TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>         x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu


