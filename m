Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B595559EE45
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:36:00 +0200 (CEST)
Received: from localhost ([::1]:34044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbZ1-0000Qf-G2
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbWj-0007JV-Mp
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:33:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbWh-0005Oa-Ll
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:33:37 -0400
Received: by mail-pg1-x535.google.com with SMTP id l64so13379732pge.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=vn9c6DCx+F42jVvsBvFfnmyKD+G74yurvei0y62W7Qg=;
 b=zTkY3MBJctsfGdT+EOXK+4J7O518sgoQ2Po5F5jRV4xMVYOAtFGNka7UwlyvTRp2iF
 XvOK1IXxZrdxYdwAo3lgp+n6nejj5WCtZ9deLCM2Z3DMQU4c1NpQ5VG8oBFMSDFdoKQA
 +yTUT4oLfr+Ar1t2MBtUU6zS79x5T9NSiO7fl5J2dWiRlfZWUIAD1LSE04wovhNYnffZ
 TC0uJ9RcCb1sd57By/W+RqZpnXJi+abbAL9+voPUjuqOQZP+F1QizjXCvKIJyMICyh0+
 S5dIKbuO5PhSucj+I08VPPrC6Q6PrjHLMLlL9+5gA117IhelZNg6ao83GX8roCGNq/hu
 M1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vn9c6DCx+F42jVvsBvFfnmyKD+G74yurvei0y62W7Qg=;
 b=5cQmCtOm2xpdaD7R3NUI/7eNX8L/39AnMGki9XvTneZ18kQyqLI+V3B8C54N4zrNT1
 XxqveQIjJG2jgezVWHe23J8SOL71GqNCMLGH9ZTXRXvwafDyvSY3JltiI5lQYNsnZgt6
 0dfhEdL6HQPql7xRg/IeyBeLem8c1xx+uOkmw7cHkc9ULIzr2BGL3br/Spwb9/2ggFve
 n1ufgaTNbCXqeSBUHOtPMKAhS/AHnRndwSI0UkOWuV/A43HuTQmGmHBdcVltp2aVnYzo
 OOKhDd41mkR8p3mpsgsE+XgugceW9dpxfmGpSyud7xrV3bHS6oiktnbURheja78ubdPo
 tvuw==
X-Gm-Message-State: ACgBeo1vE9DVSX9KNX94AChbk5cl1jn67aPQjW8/SzhXCLlhilDfUw/w
 UK+704yyIKWlFWJu4UemcIJ4ng==
X-Google-Smtp-Source: AA6agR54Ujr/jgL/LbyKOSIp3DEwfqMhbGwUOKsV2ADu31pyz6NfTQVP6n9DffYrOI4aJH9xJDHoWA==
X-Received: by 2002:a63:4802:0:b0:41c:ac9e:1950 with SMTP id
 v2-20020a634802000000b0041cac9e1950mr22082287pga.376.1661290414225; 
 Tue, 23 Aug 2022 14:33:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a1709027fcb00b00172a1f6027asm5570587plb.235.2022.08.23.14.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:33:33 -0700 (PDT)
Message-ID: <13926833-3ce7-dc1a-33a4-ac6691eda763@linaro.org>
Date: Tue, 23 Aug 2022 14:33:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 1/6] tests/avocado: push default timeout to QemuBaseTest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
 <20220823152558.301624-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823152558.301624-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 8/23/22 08:25, Alex Bennée wrote:
> All of the QEMU tests eventually end up derrived from this class. Move
> the default timeout from LinuxTest to ensure we catch them all. As 15
> minutes is fairly excessive we drop the default down to 2 minutes
> which is a more reasonable target for tests to aim for.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220822165608.2980552-2-alex.bennee@linaro.org>
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index ed4853c805..0efd2bd212 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
>       _console_interaction(test, success_message, failure_message, command + '\r')
>   
>   class QemuBaseTest(avocado.Test):
> +
> +    # default timeout for all tests, can be overridden
> +    timeout = 120
> +
>       def _get_unique_tag_val(self, tag_name):
>           """
>           Gets a tag value, if unique for a key
> @@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>       to start with than the more vanilla `QemuSystemTest` class.
>       """
>   
> -    timeout = 900
>       distro = None
>       username = 'root'
>       password = 'password'

Bah.

https://gitlab.com/qemu-project/qemu/-/jobs/2923804714

  (001/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:  INTERRUPTED: 
Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: 
ERROR\n{'name': '001-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg', 
'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2022-08-23T21.03-6d06db2/t... 
(120.85 s)
  (003/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:  INTERRUPTED: Test 
interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: 
ERROR\n{'name': '003-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg', 
'logdir': 
'/builds/qemu-project/qemu/build/tests/results/job-2022-08-23T21.03-6d06db2/test... (120.81 s)

The previous successful run had

  (001/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:  PASS (257.00 s)
  (003/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:  PASS (238.67 s)


r~

