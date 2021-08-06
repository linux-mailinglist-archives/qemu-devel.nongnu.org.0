Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C213E2E71
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 18:42:01 +0200 (CEST)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2v2-0008Or-OV
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 12:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2u5-0007jz-GJ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:41:02 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2u2-0005mC-S7
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:41:01 -0400
Received: by mail-lf1-x131.google.com with SMTP id f42so19047268lfv.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TDy5yf546EIG9pod2af33uFr57n4WHWsymDZf8CpLqo=;
 b=MtWUHXTSgMalORYrbjuvnr3XTVDhCVR+Pm0xx1tbAPptUCH6+gk42RbrVoFKEXyVid
 L7YA5sTQwCVAk0IqcodKdmbjEC8030dUPutjxml0wbzjvOQubSEffXxzvdhwcACtiwVp
 wUgAxsWYDHxEEmPvWBaH2PbNxTLoDPFZcpzwQ0+JIgarxImYssQUb5kFq+iTVz0a11Rh
 06S6q1c/6yfocseWoUtP6mTncnnjvCi2dsw8IlNuxKs3/XTvPdKqzRJYqKe4dook96Dh
 dt4NpNnFhkTuuEOMgODAGQmfLo4jZRKPB+VphT4R3vsTxq+e2IdjEe4uvmcr2dvzTkhs
 AsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDy5yf546EIG9pod2af33uFr57n4WHWsymDZf8CpLqo=;
 b=cxQjcqxvwnsDxwd67vHVM0vXXIHvLD3OWga3IO4sf8amCjYgzLdg4nSwtfe+wjtCNt
 1MRgk3XpAfitZMEurXDlLK7nn7nLLOMZCJ8Z8PpvtlDwjVqXP4b+DNWdbRclxI8UTHK4
 tRZe6+fe3haE0Gg3SaiSo9aI3lD1dGR9bWcAgPvGvJxwuit42AsdoeVBh6y0szXtclsO
 4L87/MjevlB1gH5RacwGbYC0SwtIaJ5CoOnhziSqK54i2jMVJAVKhQ5kl7agMtDgLz8m
 JLfKz9eOqu1btyL6BNKwa0t0OUCamfHYUTo4BTh+fE5c5BVuQnk/504OS1jgLuK0mx7K
 arnw==
X-Gm-Message-State: AOAM53015d7g8ts0u4jdZ0hTlaazy/FzLltuZ9B2KMuXS+f2yWger8wP
 ZADsjIXr6zAmkZkqgsQWJLM=
X-Google-Smtp-Source: ABdhPJznn11CBLAmt89RHZueCYGfB0kNDRmgcDOQSqDiSLIkoFqBwwFW7/3rkeB+tXVu1QQHOJwKHw==
X-Received: by 2002:a05:6512:314a:: with SMTP id
 s10mr8101193lfi.57.1628268057251; 
 Fri, 06 Aug 2021 09:40:57 -0700 (PDT)
Received: from [10.101.1.184] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id 4sm715497ljf.127.2021.08.06.09.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 09:40:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] docs/devel: create "Developing QEMU" subsection
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210806155132.1955881-1-jsnow@redhat.com>
 <20210806155132.1955881-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6a221103-09f6-7a5d-5739-143818b67514@amsat.org>
Date: Fri, 6 Aug 2021 18:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806155132.1955881-3-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 5:51 PM, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/index.rst               |  6 +-----
>  docs/devel/section-development.rst | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 5 deletions(-)
>  create mode 100644 docs/devel/section-development.rst
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 008d489d751..57016edd841 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -10,9 +10,7 @@ modifying QEMU's source code.
>     :includehidden:
>  
>     section-community-governance
> -   build-system
> -   style
> -   kconfig
> +   section-development
>     testing
>     fuzzing
>     control-flow-integrity
> @@ -20,11 +18,9 @@ modifying QEMU's source code.
>     memory
>     migration
>     atomics
> -   stable-process
>     ci
>     qtest
>     decodetree
> -   secure-coding-practices
>     tcg
>     tcg-icount
>     tracing
> diff --git a/docs/devel/section-development.rst b/docs/devel/section-development.rst
> new file mode 100644
> index 00000000000..bba4fea30cb
> --- /dev/null
> +++ b/docs/devel/section-development.rst
> @@ -0,0 +1,12 @@
> +Developing QEMU
> +===============
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :includehidden:
> +

Could we order from generic to specific?

> +   style
> +   secure-coding-practices

> +   stable-process
> +   build-system
> +   kconfig
> 


