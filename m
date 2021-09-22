Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE75415065
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:17:32 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7kJ-0007h4-8k
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT7br-0004NQ-AK
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT7bl-00054w-1d
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632337720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gjVXhbzQq0tV6lMoFHw6DErK4JR9+I+6GxdaDmlybk=;
 b=KvFe0A+D3+xqzaFlo0g4BB3/+otjv25Hsgxknu683Pa4TT7ZJDA2HREhjciRXs1ny3J6h5
 O6mbpkPQttLmBb3a0o+H1Rrgk90ZnPCbT4hrS3u3EUzJSOttY1oA8G1gr904g8cNNcKDVA
 N3NxOF7f//iIFaTvXyNhyTvxEYG0MI4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-uB5alimKONOtRptS2U4MyQ-1; Wed, 22 Sep 2021 15:08:35 -0400
X-MC-Unique: uB5alimKONOtRptS2U4MyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so3028870wru.15
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8gjVXhbzQq0tV6lMoFHw6DErK4JR9+I+6GxdaDmlybk=;
 b=E0U3wuw8uS7321JIY7KC09sdS85Ov6nUTWFam3U7CO6W4QSG/nsCKk1rh8y+CSE5z5
 20O0GgtS0Xu35fqciKLxdr+/hA5k0Uoj+sJ+yLbYgktJPlQl7P/N8tfHw7HLwOPnajBI
 Zhn4yL1O+F6kaFWcJaVpueC0a+j+Ux9PNsOGQg4g5+k70ZoiDnArC34L1pSOY13mePJc
 sWR70cFcecaGasQkjFG6hRYfR99VWtNlLkFWswJEIfg1q4/r65lmVVl/ef2fIogdb/hK
 eHyHyHS11IlVtXA0CTby1arPHGaAXI5arohypXLV+yBIOyBL+mEllZUQ/lAVsoHRdb4O
 y0xA==
X-Gm-Message-State: AOAM533R1ZlkHQqL4EBqt4Uq/utYV+Ny8sysrhuVnKeQD3eGcgvuHt3S
 HoUdH2ZDkO27Z33aaZHkJregAMaV7c1kuZKc+Umu++GMjovEVX2AqtxIaZoAcJ1eEDDWrCjL/Cz
 bYzeMgMqfrve0aXg=
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr588722wrn.389.1632337714438; 
 Wed, 22 Sep 2021 12:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDmC2pyJQiG2zgKi6SWaqaqnHBDHGieIXzosPSAL9epaDUjIlJDjRQmz7Cr9I8WaAnn6BVog==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr588693wrn.389.1632337714213; 
 Wed, 22 Sep 2021 12:08:34 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f1sm3100809wri.43.2021.09.22.12.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:08:33 -0700 (PDT)
Message-ID: <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
Date: Wed, 22 Sep 2021 21:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922190324.190227-3-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 21:03, Willian Rampazzo wrote:
> Add the possibility of running all the tests from a single file, or
> multiple files, running a single test within a file or multiple tests
> within multiple files using `make check-acceptance` and the TESTFILES
> environment variable.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
>   tests/Makefile.include |  5 ++++-
>   2 files changed, 31 insertions(+), 1 deletion(-)

> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 6e16c05f10..82d7ef7a20 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>   TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>   TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
>   TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
> +ifndef TESTFILES
> +	TESTFILES=tests/acceptance
> +endif
>   # Controls the output generated by Avocado when running tests.
>   # Any number of command separated loggers are accepted.  For more
>   # information please refer to "avocado --help".
> @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>               --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
>               $(AVOCADO_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \

Since this is Avocado specific, maybe call the variable
AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?

>               "AVOCADO", "tests/acceptance")
>   
>   # Consolidated targets
> 


