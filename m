Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9DC534F24
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:31:02 +0200 (CEST)
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCdp-00045p-Mm
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPm-0005Tm-DJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPk-00013B-UH
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2PY68pzE0zQCzG9F4aUId8IbqOP43U5BFgD+m0L6dU=;
 b=REjgknjQ3HNLRVGTH6FeBDnmWQeV3ZCpmPUAm6tPA5D3mc3WrdyCtzxBt9p4y8d3fZQa2h
 VEtUuDd+j+gdwi8x2DJowflgXNL+Ek6m7am3vAhCw48v/QgYwKK5KKv5LAGkVJ+fg6WYw4
 MZM23kEPHU5Twe1thUzyt2MkNg4NK6k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-ykXwA1ImPk6L2U2WHvEnLw-1; Thu, 26 May 2022 08:16:27 -0400
X-MC-Unique: ykXwA1ImPk6L2U2WHvEnLw-1
Received: by mail-ej1-f71.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso738684ejc.18
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U2PY68pzE0zQCzG9F4aUId8IbqOP43U5BFgD+m0L6dU=;
 b=GPufjsUhX+hasJC+MFfcVQP3HHTi7v86h5sDjhdJ1FaYIFKzB0VkqPfo5wzSfvF++N
 oA4W4JebbZcuf3Dh2kKr/MYgLD+MzcIK9lmi7YhJufOGhbkVQbtZeWgGpouyHWFA4ssi
 UYbxcHJavtlanIdwSnUaSsImOVghHSeraoQepAi45yMomf894GXJSdxAQMHU2VnF6Yvh
 EoopZowBLGUNi0li2CCd4TL1zOY6apT617Pe5oaY03zSy274J4K6UmLxfmZ1o1T0Sed/
 jn4q2HDGb9PbsUwo0sfsz7wlap70/HNTGbWmvfUOmB+Exx4GunvGn3V/jpwklBJ7Dj4d
 O7LQ==
X-Gm-Message-State: AOAM533jbrLpR8QNfOsrXj1UtkfJqcQf6dVw5JlBhGZ76symXcznPU6R
 7H5FZF0ww1D44PXoD2HknJyuWru+5+OA9VVusOqM3TuvFoYVFRGK45eW8UYWaXHXoA53eIgYBK1
 fvT4pJocVMCIJXjQ=
X-Received: by 2002:a17:907:3f0d:b0:6ff:43e:bb1a with SMTP id
 hq13-20020a1709073f0d00b006ff043ebb1amr11716705ejc.52.1653567384994; 
 Thu, 26 May 2022 05:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy3N7PAeGBsMG+E/Ah1XnItEh5lrYIZdsNmZVe0ymf525BuiEslg9a+YcXRXUXRFDOpszcrA==
X-Received: by 2002:a17:907:3f0d:b0:6ff:43e:bb1a with SMTP id
 hq13-20020a1709073f0d00b006ff043ebb1amr11716684ejc.52.1653567384732; 
 Thu, 26 May 2022 05:16:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 x5-20020a170906804500b006fed99e1143sm479763ejw.61.2022.05.26.05.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:16:24 -0700 (PDT)
Message-ID: <7660d004-f7b8-580e-9721-4d56f1d2ce34@redhat.com>
Date: Thu, 26 May 2022 14:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/9] tests: silence pip upgrade warnings during venv
 creation
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-5-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/26/22 02:09, John Snow wrote:
> Turn off the nag warning coaxing us to upgrade pip. It's not really that
> interesting to see in CI logs, and as long as nothing is broken --
> nothing is broken.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index f68adda0650..839ffde876a 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -109,8 +109,8 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>               $(PYTHON) -m venv $@, \
>               VENV, $@)
>   	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
> -            PIP, $(TESTS_VENV_REQ))
> +            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
> +            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
>   	$(call quiet-command, touch $@)
>   
>   $(TESTS_RESULTS_DIR):

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


