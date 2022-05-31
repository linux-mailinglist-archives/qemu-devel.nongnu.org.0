Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29032538CA2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:19:54 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx6X-0006Rc-0Z
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvx3o-0005Av-HH
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:17:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvx3m-0005bS-Iz
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:17:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so1565060pjs.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=53lY8nwzkTMWTjVP3ZNxcXWTe4EbEctferM30Z4fRuM=;
 b=ZbjqGdQHILopJdQp4B/4dHX21C6omq9J1APJlAFd91xfHxKTrzhPMTAk3Aire8plGA
 YYl8nrhpEsqf43r4SGPY75MNDJhExZ8jIaJpo4QUFTjXgGPVtv0e5V/IyOJXS0x9bwyR
 7rCUKZqS5qwfNBsbafqVpUr/7aBUcP9XVghIicyDOzYZmzqI7gr2ywMfF08O7AdmnLrx
 KZySqKc25PWYGTzBlSItskbqCIHWG8DqcEvSfviBHZmL/p7VJ0LUYyIziQkt7ve9q2as
 xla8EI3LLwJ7dsimV6Tf0Jp9HJ96Uy8e7W0GJratXl8aTyWQhB0pFJtqX+eEe8SDhzjv
 fkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=53lY8nwzkTMWTjVP3ZNxcXWTe4EbEctferM30Z4fRuM=;
 b=B5PXHZaBvRBDUKipa2jymkC4e7NSoNg5f7b2rHcmTjnVrOh7ICPuKll8jxn3kCZo5T
 YBUIDZ9JeXekp+18HXXg5siQsVJZ1yxe1XK+rLordYSRAlfKNN9TKUMB7nC2vvE11Ygh
 fl5EVVHRODql7jWYMmiGHCP0JTEQDacg3iDMTCpMslLVn99Hu4X4edfSpvUeHogIZ3vv
 gjHsvkR3yihpFvN2rPqtNMvNsUPCE9u4G0UHE4w6oKQqhEHxCOGsUgT7Fpq4ybzG3rgV
 OiDLJZRhcfgg0RUZzJdO0S7HEnde3e55UFZKjAbQJ1jHYHv7f+7YNEfAp++5RMY9suzR
 E1pw==
X-Gm-Message-State: AOAM531ac1kze7Mo/9r+ZHa9GrXb9LCy6ywLE0rH18tBq/Z0QPXMfw++
 zxpmg0SlFDiuWBSjmJqDeds=
X-Google-Smtp-Source: ABdhPJx39zuDtQGFSUjGTNkct6Lz8653LlxGxCBgAxv9fEVuGK3YjF6JaqxQmU+OSdW3O3LONcvnyQ==
X-Received: by 2002:a17:90b:1c8e:b0:1dd:24f3:c6f6 with SMTP id
 oo14-20020a17090b1c8e00b001dd24f3c6f6mr27413167pjb.244.1653985020830; 
 Tue, 31 May 2022 01:17:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a170902d10300b0016152774878sm4273914plw.176.2022.05.31.01.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:17:00 -0700 (PDT)
Message-ID: <4540a11e-3550-1c47-f27d-0019515da0ca@amsat.org>
Date: Tue, 31 May 2022 10:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/Makefile.include: Fix 'make check-help' output
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <165366545439.6869.11633009118019728798.stgit@work>
In-Reply-To: <165366545439.6869.11633009118019728798.stgit@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 27/5/22 17:30, Dario Faggioli wrote:
> Since commit 3d2f73ef75e ("build: use "meson test" as the test harness"),
> check-report.tap is no more, and we have check-report.junit.xml.
> 
> Update the output of 'make check-help', which was still listing
> 'check-report.tap', accordingly.
> 
> Fixes: 3d2f73ef75e
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/Makefile.include |   30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index ec84b2ebc0..5caa3836ad 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -3,28 +3,28 @@
>   .PHONY: check-help
>   check-help:
>   	@echo "Regression testing targets:"
> -	@echo " $(MAKE) check                Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> -	@echo " $(MAKE) bench                Run speed tests"
> +	@echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> +	@echo " $(MAKE) bench                  Run speed tests"
>   	@echo
>   	@echo "Individual test suites:"
> -	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
> -	@echo " $(MAKE) check-qtest          Run qtest tests"
> -	@echo " $(MAKE) check-unit           Run qobject tests"
> -	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
> -	@echo " $(MAKE) check-block          Run block tests"
> +	@echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
> +	@echo " $(MAKE) check-qtest            Run qtest tests"
> +	@echo " $(MAKE) check-unit             Run qobject tests"
> +	@echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
> +	@echo " $(MAKE) check-block            Run block tests"
>   ifneq ($(filter $(all-check-targets), check-softfloat),)
> -	@echo " $(MAKE) check-tcg            Run TCG tests"
> -	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
> +	@echo " $(MAKE) check-tcg              Run TCG tests"
> +	@echo " $(MAKE) check-softfloat        Run FPU emulation tests"
>   endif
> -	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
> +	@echo " $(MAKE) check-avocado          Run avocado (integration) tests for currently configured targets"
>   	@echo
> -	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
> -	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
> -	@echo " $(MAKE) check-clean          Clean the tests and related data"
> +	@echo " $(MAKE) check-report.junit.xml Generates an aggregated TAP test report"
> +	@echo " $(MAKE) check-venv             Creates a Python venv for tests"
> +	@echo " $(MAKE) check-clean            Clean the tests and related data"
>   	@echo
>   	@echo "The following are useful for CI builds"
> -	@echo " $(MAKE) check-build          Build most test binaries"
> -	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
> +	@echo " $(MAKE) check-build            Build most test binaries"
> +	@echo " $(MAKE) get-vm-images          Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
>   	@echo
>   	@echo
>   	@echo "The variable SPEED can be set to control the gtester speed setting."
> 
> 
> 


