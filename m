Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F054A1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:49:51 +0200 (CEST)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rwU-0007bA-SK
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ru0-0005Xu-R4
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:16 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0rtz-0004Lf-9Z
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:16 -0400
Received: by mail-pf1-x434.google.com with SMTP id bo5so6910315pfb.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yFIFRcSia0/VvPNcXln6N9ZxJSbliMPKqzN2sV2FjQI=;
 b=M+W0deaR5xk9QP2ALClItKQDEwPrAw7mKq9JtR9aVsgvxAOdHxTsSWuqg1pKQTvs7t
 eXS3AvEpu0FjiR/h8wBNqSX7JIO/v3p3dRf9h499EPKIhAjF7WEpv8URHfQ8F7Cf4JEs
 51SUtkF9mGQ+sZ9JEyMwagWWGwNvUqCS9vBOsweoypJpgpqrCqBlC/5V8chuTLir96wU
 SkwqH8o5ze8DSsEBn/4zi8dqDgqNbDKRzNr1Qrr/GjuLIHKfyqU/BgCtyyOIqEvZUAgb
 u8SDZ68iqbglP5rpRFEGqg1PmR4mFfFK/oD1VYFMi8UusmU41IEc7zSvdgXAiB7jRG70
 8glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yFIFRcSia0/VvPNcXln6N9ZxJSbliMPKqzN2sV2FjQI=;
 b=Pkm8WOCbK6cydcHgaELR7Z4eWzl/Y88Zs/Kv9zlb8rT5kcVNpxKxz0rdtoAn1O54xC
 5e/LcVXo0FrYb8eIwZpBH6zYKDCAqX2u5pZPIgbMfiMvCGbxNlwdtnHcvLucWSqEM8PP
 qI9HRvuJZJxa/yLeg4Tac0dmEWLT6qAxIcrmC59FuFrZCQU7PK6iPgbg0Dm5vJNyA6b9
 zDTNOZ2FVExBV18JvXPtDVKrcz1nQeQpfhNWAqxITbvVXwkbpvkSXVkMfzQiEuw83azZ
 58ZpKwh4nofOwA/Qt5aqPDX3w0NRerI3Hx+TzrvbiNHI2Tvxj/CsYyLXoUhACDPjQB3v
 yULw==
X-Gm-Message-State: AOAM533HBQiXCRLBDu2cg/yE7gQu3nuJ+/1bU8sbXGiT4kKaRjU3wZFF
 yu2Z3uiswUYfHJwLVS+eADGE+A==
X-Google-Smtp-Source: AGRyM1vKQuq5AY/IB6Yr2UGAp733cd61E0nN+9UCzkeJpQpNF56wKKpz0JJAzrU6qRsUVfmE73bBgg==
X-Received: by 2002:a05:6a00:2392:b0:51b:fe0e:2b8 with SMTP id
 f18-20020a056a00239200b0051bfe0e02b8mr1014217pfc.84.1655156833629; 
 Mon, 13 Jun 2022 14:47:13 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 2-20020a620602000000b0051844f3f637sm5892583pfg.40.2022.06.13.14.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 14:47:13 -0700 (PDT)
Message-ID: <607d63c3-8019-0775-4799-29ae8d0d3eca@linaro.org>
Date: Mon, 13 Jun 2022 14:47:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 4/7] tests/docker: fix the IMAGE for build invocation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613171258.1905715-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/13/22 10:12, Alex Bennée wrote:
> We inadvertently broke the ability to run local builds when the code
> was re-factored. The result was the run stanza failing to find the
> docker image with it's qemu/ prefix.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: d39eaa2266 ("tests/docker: simplify docker-TEST@IMAGE targets")
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index e68f91b853..ef4518d9eb 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -171,7 +171,7 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
>   $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
>   	$(foreach t,$(DOCKER_TESTS), \
>   		$(eval .PHONY: docker-$t@$i) \
> -		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=$i) \
> +		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=qemu/$i) \
>   	) \
>   	$(foreach t,$(DOCKER_TESTS), \
>   		$(eval docker-all-tests: docker-$t@$i) \

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

