Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB7652E54
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:16:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vD1-0007uP-Ho; Wed, 21 Dec 2022 04:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vCu-0007qS-3f
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:16:15 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vCs-0002Gv-AH
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:16:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id f18so14275970wrj.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/CeYpa31rYPj/AvulX/QrAwFix2rlSrEY28abmGRG0=;
 b=Lu2n/z3je+1gcXb49WpbM4VglWppZ7n6hxyGruiTVJ+4icGaCix2j8vPfmhkhztol6
 to91K06bn6moVmB2V1MP/M8CNFIHEgzMo63bbUSROrOmISLgrvRO4dXaKeW+REfjvga8
 oB6grsPfDQCDj70JE8aT/ye9Psce8noJiLUaZa/hkFb4ZxvCcS1LjiKZpl8ob5rDOBnM
 7Lf1QvvIv8VyNZnin53494MMtGnuAF9FPWJvYsci5b5ldippy+cP7oJw5SMtCImfV2JS
 vndXxfz0HML9R+rhpsqsG5X9Kxq7G5vWehiNfDsC2JdJGheIayTMqEgKNfIgp7ygmwa+
 g6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/CeYpa31rYPj/AvulX/QrAwFix2rlSrEY28abmGRG0=;
 b=cCfRL/A5LXOitxUC6mCUXAKHDcDfNFCWLntMfIoPmMPd8FZRTn/Ro0NzlIfv0ukK+s
 N1KXxMoLYSYjqURc/zJ2yquanyCp8dM1Ts+mermhCQ0MbgchxcGMknKyWJWJLhXQutlp
 PQbhDEJOgusl6PkfXkc46Xh8JECyctzFDMjtx0gJ+mRL7vK24Sew0nCIJAtiYsOnEBrQ
 B1zPypxr862Xx3cVDSaRGSBF7nT9SHMeMrjbo+mPkDZWx7xQEZD0ALiKec3sPR+UN/l7
 G20d9iFP7BQkT2MZDKY+EIb7MK3ytOqYtT4orcpBufDanIanvF/TvltNCxZ9QGGj37lJ
 U8Vw==
X-Gm-Message-State: AFqh2koeTY3bJ/FOONtOYbIBr5CB+ry99hBuJS2ZrP+AZcXHd0+l7DzF
 rd791rg8Fp43/5Zgm/zB2D47zw==
X-Google-Smtp-Source: AMrXdXsPKhCKtjjdUsmW46kuXXxG+mtuFTrh5wV47RNHkhOo/mgLqAEagu0/CLrNwMYVwNaEQINtsQ==
X-Received: by 2002:a5d:5050:0:b0:26a:ec47:210f with SMTP id
 h16-20020a5d5050000000b0026aec47210fmr604883wrt.3.1671614168265; 
 Wed, 21 Dec 2022 01:16:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm17498235wrt.36.2022.12.21.01.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:16:07 -0800 (PST)
Message-ID: <2c7e81ce-fd51-e005-353f-d3bd6e37e2bc@linaro.org>
Date: Wed, 21 Dec 2022 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] tests/docker: use prebuilt toolchain for
 debian-hexagon-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
 <20221221090411.1995037-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221090411.1995037-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 10:04, Alex Bennée wrote:
> From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> 
> The current docker image for cross compiling hexagon guests
> is manually built since it takes >2 hours to build from source.
> 
> This patch:
>   1. Solves the above issue by using the prebuilt clang
>      toolchain hosted on CodeLinaro [1] and maintained by QUIC [2].
>   2. The dockerfile is also switched from multi-stage to single stage
>      build to allow the CI docker engine to reuse the layer cache.
>   3. Re-enables the hexagon-cross-container job to be always run in
>      CI and makes it a non-optional dependency for the
>      build-user-hexagon job.
> 
> The changes for 1 & 2 together bring down the build time to
> ~3 minutes in GitLab CI when cache is reused and ~9 minutes
> when cache cannot be reused.
> 
> [1]: https://github.com/CodeLinaro/hexagon-builder
> [2]: https://github.com/quic/toolchain_for_hexagon/releases/
> 
> Based-on: <20221215095820.13374-1-quic._5Fmthiyaga@quicinc.com>
>   tests/tcg/multiarch: remove unused variable in linux-test

Please remove this tag before sending the pull request ^

> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> [AJB: also tweak MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
> ---
>   .gitlab-ci.d/buildtest.yml                    |   4 -
>   .gitlab-ci.d/container-cross.yml              |  19 +--
>   MAINTAINERS                                   |   1 -
>   tests/docker/Makefile.include                 |   4 -
>   .../debian-hexagon-cross.d/build-toolchain.sh | 141 ------------------
>   .../dockerfiles/debian-hexagon-cross.docker   |  53 +++----
>   6 files changed, 20 insertions(+), 202 deletions(-)
>   delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh


