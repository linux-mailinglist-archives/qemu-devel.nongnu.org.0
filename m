Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D126918F5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQNU8-0002pX-BC; Fri, 10 Feb 2023 02:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQNU4-0002p7-7d
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:06:13 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQNU2-0005eO-C3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:06:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id ba1so4088361wrb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jm3sv4eVeuyImKKo45ao+Q0+xFzcEAJla3CQ4KaMX8s=;
 b=tHrAAOIMumWcfqh0z/oWYQL1gQslbHocqLqzaengEYm8rotMgW25wbCQ3WMf4pG6m2
 cQ5Rt+IudDC8QLhe6rV6ht/A8ZubyOH6e3sxIu2Bnvgu0lQnmg4X1RbMfmU617J5h+rk
 SGEILw48NSHaU0nafnbKWYjvHmKwfYA+XK2AeQJHHjt1JctEMTG4OT80NLFuomSANCPH
 l7iSuc99FEgxP2zULxGK9bs8NRCwZ48MXFTl9KIbjNmrl/RrlUTEmupVsG4rNFTyRpqe
 1f5U+Hl7xY5Z900pcwCGFg4Ov7UMGcr5DYFJ+yTUx3sMf/DPztu/KIQxmkMaal+Ee/fa
 p20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jm3sv4eVeuyImKKo45ao+Q0+xFzcEAJla3CQ4KaMX8s=;
 b=Di5clKMcY4SZuKSIswqSnU+h00jFtBD3IjU6R9GLoAyIWNJt1QYd8luire4kcXRO+9
 1PBlz3aDGAmQ5S3RjSiXMUm1A/X9KsZZ97eRX1ZMOFGJcrmwCXHE+J0ngRYT76xBJphr
 fbZiBzG2SbDRR7juFLdZlIOpNIDR/wx5+Ec9k7F37tJ6Yv8Qjw2SvMb3a4YGOAvL6wVE
 iITQT7g9rHxy46ZT81euNtyLtLEQpbO5jfh79VjJ+p97qkG9zd8cfucdwH2uH77IvwXC
 oZ53FXATx8eKqWOGm/0QzbuSMn5PMyDFMU4uf3flwWuhuGhEqDKMRrUq1I1T5gL2M5w9
 XM6A==
X-Gm-Message-State: AO0yUKV4hdu1sPjIJk5DxOQf6FxkGWZraiA/DbaXcJPZg/BHoqiIbhFg
 iuIk2I58un11jwL/FtvNMav7Ww==
X-Google-Smtp-Source: AK7set/LjB8Mg0cWZRRGbK1Pl+0RKZa1K7h9w8sa/cvIFy/q7G0mpB/p880r7cL0mmftbmd1jTjeYg==
X-Received: by 2002:adf:dc0f:0:b0:2c4:54c:504d with SMTP id
 t15-20020adfdc0f000000b002c4054c504dmr8291633wri.42.1676012767897; 
 Thu, 09 Feb 2023 23:06:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a056000004a00b002c3d814cc63sm2890078wrx.76.2023.02.09.23.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 23:06:07 -0800 (PST)
Message-ID: <fdca9d2e-a0f6-e0de-9564-dc6e61e70629@linaro.org>
Date: Fri, 10 Feb 2023 08:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210003147.1309376-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/2/23 01:31, John Snow wrote:
> CentOS 8 does not ship with a sphinx new enough for our purposes (It
> necessarily uses Python 3.6), so drop this from this build. We can
> resume building docs on CentOS 9 if we wish, but we also currently test
> and build docs on Fedora, Ubuntu, Alpine and Debian.

This wish ...

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

... can be remembered by adding a "Please add --enable-docs when
upgrading to centos9" comment here.

>       CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
> -      --enable-modules --enable-trace-backends=dtrace --enable-docs
> +      --enable-modules --enable-trace-backends=dtrace
>         --enable-vfio-user-server
>       TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>         x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu


