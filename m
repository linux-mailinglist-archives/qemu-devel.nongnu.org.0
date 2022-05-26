Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF69534F07
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:20:43 +0200 (CEST)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCTq-0000uX-Dq
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPs-0005br-Gu
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPq-00013p-Vr
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwkZsBr6nPtdDdJQeJICtiyME3UPLdRe+x/COZZvPos=;
 b=HUSWEb+NaGUEALjIRJ1Mv3/PWQzVvwQZekXOFEvcZAbIrVby4eKcLsm/vyjQhKWXtfOUn/
 h+Z4Bs/U+6DXFRNfUlid6HMiWTRb39FFX+PeUF81/9wGYn2vnoGdrg10QfPTdThvIrkBhS
 jj6XD5T7hLfI00thjwiROvxDQbaPg1I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-LHQehBlJO1GXh_4C0BCuRw-1; Thu, 26 May 2022 08:16:33 -0400
X-MC-Unique: LHQehBlJO1GXh_4C0BCuRw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f24-20020a50ee98000000b0042bd2c1060dso943079edr.23
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kwkZsBr6nPtdDdJQeJICtiyME3UPLdRe+x/COZZvPos=;
 b=U8OnOAeXyvFmRjrszFtwFRN7XnJvFLqN93OaJewAelKbgZxHpmwvP+S9AIMnVy/sQJ
 Xn4hwbZJfH3hFtZdK8+IkxJqScsnWxgQwAW5s0XLjNSEbC1P9N825cRIJooCXjt3SSJ/
 LiOD8Wil7EE0xsCnVyzxbvHT0GfBxJe7eyoj2mzUBp2G30hRdga57ot/Xgy6Bu0Zz1WO
 9Nk2YZZTbJr0wfVxTDfGU1BvCNuU3MfqmZS7lsLV/BPVUhjTRiJzFE5LznyTLztu3pdq
 7fG2YuuYR9IxKpBi40Q1tNl0KiTX/xWC7l6xyh42IZusOu4q/LMqGO8BEdFf5igy1tyk
 mzXg==
X-Gm-Message-State: AOAM533TnqLLUVgcKBNawEzsy9aYYv6fnx2AvD7LNcvMIQSn+O72M+IF
 tthgwfudmOEH52VsIiU5FXra59EZirKncMU9yGIX0j/ugMWzR0eZwqYqsElsnAODb8DSDMTJnIs
 qzMDJSuiIdjTq2BI=
X-Received: by 2002:a17:906:b7d6:b0:6fe:a34a:a813 with SMTP id
 fy22-20020a170906b7d600b006fea34aa813mr28167540ejb.551.1653567391572; 
 Thu, 26 May 2022 05:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzklT84b91N/ZR/eEpbPcgReLzq3TRdr/nYYWueDyJN05uvALquogQS7jx3vA8As5/MRMTJkA==
X-Received: by 2002:a17:906:b7d6:b0:6fe:a34a:a813 with SMTP id
 fy22-20020a170906b7d600b006fea34aa813mr28167522ejb.551.1653567391352; 
 Thu, 26 May 2022 05:16:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j22-20020a170906051600b006ff0b457cdasm463543eja.53.2022.05.26.05.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:16:30 -0700 (PDT)
Message-ID: <7f6866aa-32f7-e2f8-dfaa-04f051a24a01@redhat.com>
Date: Thu, 26 May 2022 14:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/9] tests: use python3 as the python executable name
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-4-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Use "python3" instead of "python" as per PEP0394:
> https://peps.python.org/pep-0394/
> 
> This should always be defined (in a venv, at least!), matching the
> preferred python shebang of "#!/usr/bin/env python3".
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 146aaa96a00..f68adda0650 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -89,7 +89,7 @@ TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
>   TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>   TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
>   TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
> -TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python
> +TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python3
>   ifndef AVOCADO_TESTS
>   	AVOCADO_TESTS=tests/avocado
>   endif

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


