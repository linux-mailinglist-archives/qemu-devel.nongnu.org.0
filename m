Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410B350074
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 14:36:09 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRa4u-0005d4-AH
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 08:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRa1J-0003Of-Md
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:32:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRa1H-00039v-Tl
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:32:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id x7so19480118wrw.10
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LZj6aje8euFkcZr3uYandwiIPzcXGr7NpmC72vYzoFs=;
 b=qivSbljzOr2D4U7JdLAOSSOLgph0U3xatvWo0wkxqxo8c4YhKaA6pk6sVWzMCrEU33
 6MVPbDT26g6SwsRlmrDNTP0Q+x75rcMhEfuqvZ1mTPbLM8Oh4gTxA8HN6LGeOuj3azyd
 LQ69qLUqUNmXsH9e7uQfTXn+iqOGPrV580WYpl5uq7W3W78D6JMQSaM9E1bR1LPtjkig
 pSLxWReZxtOj2y0oUIXskjFISZY0tlgepAhOWEmyD+qnIYbFwmRROqJUYz2aqReL3jOX
 Ok7zyV/H3oTT9Aw3GZdlbBmKbIDxcHjOAkD3xPrcbdY/cHi7HFdYPISjnGD73g6NjM6D
 9i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LZj6aje8euFkcZr3uYandwiIPzcXGr7NpmC72vYzoFs=;
 b=kSkkhYmrhJL2qBP8DcDZ4axJqRcjErg5FzVVKhLJPGKDtltkuNXvISoDTQrWROlftw
 hhCNF8Cm2Tk4of/w5lDyociP4GjXirpYnNLvdIJAZZW+Ya6IF8u1x0ZX8VhVl5BC6YOZ
 LeGhFnYW7JZOcn4K9n89QRx8rzA20SlZr1LmygWYmYiVnsd9Z7bHgvYNE6b67l04YgBZ
 vMuvI9d/kyY6ww5ioo6+Y9mDJTAlDfEUOxA5x7PVQgJcIC3nRBcKDKBmR1fLtIJTUrTj
 EvS9hYL+BAH+aT8mV6B8hX+8hXh49yB3T5DnEAqMn3pM+9pQKQHwz2mNgN6ntXcLzM2m
 gm6g==
X-Gm-Message-State: AOAM532gta6RRckhSKXuILAu6DiX/mIngNk2v7hSzjwwGJ0VqtaPS7mN
 4VpXq6kOIizPeyIeAM+KkyQ=
X-Google-Smtp-Source: ABdhPJw4Yyq+llXakgLPhAMbrY3tZSizI/pP0JE93bLKk1JjFx/tRMADHRbZow7nw6w/d7hg3XWRGA==
X-Received: by 2002:a05:6000:1b0f:: with SMTP id
 f15mr3476848wrz.171.1617193940538; 
 Wed, 31 Mar 2021 05:32:20 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t1sm5428010wry.90.2021.03.31.05.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 05:32:19 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on
 non-x86_64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <willianr@redhat.com>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1db2987-b9d2-c4a0-d96e-441c182a6c5a@amsat.org>
Date: Wed, 31 Mar 2021 14:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex, Willian,

On 3/29/21 1:02 PM, Alex Bennée wrote:
> Currently our gitlab registry is x86_64 only so attempting to pull an
> image from it on something else will end in tears.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 7cab761bf5..9f464cb92c 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -16,7 +16,10 @@ DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.doc
>  DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>  # Use a global constant ccache directory to speed up repetitive builds
>  DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
> -DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/qemu-project/qemu)
> +ifeq ($(HOST_ARCH),x86_64)
> +DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
> +endif
> +DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))

I remember we chatted about Docker multiarch on IRC.

It doesn't look going into the right direction. IMO the problem
you are having is because we push an amd64 docker image into the now
multiarch namespace, so it is obviously failing on all non-amd64 hosts.

I think the correct way is to remove the images stored in the multiarch
namespace (they are amd64, not multiarch); and store the amd64 images
under the amd64 namespace.

IOW prepend amd64/ in our amd64 specific images.

Then you could push a aarch64 image using the arm64v8/ prefix namespace
and the buildsys machinery will work with the registry.

FWIW I tested it with mips64le/ prefix on the mips64le runner.

Willian, can you have a try with ppc64le/ (eventually s390x/) prefix
for similar hosts?

Related info:
https://github.com/docker-library/official-images#architectures-other-than-amd64
https://github.com/docker-library/official-images#multiple-architectures

Regards,

Phil.

