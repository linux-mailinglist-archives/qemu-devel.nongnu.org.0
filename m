Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345360688C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 20:58:15 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZHP-0002Zu-9q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYrL-0004Sn-Ad
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXnN-0000zF-OF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:49:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXnL-0002Lu-Q3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:49:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so2552371wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lk5qRE/pmVflzUsX3HXq0oYb/H6wH9oUUbRaWEJ9isw=;
 b=O8oUVOkgCOuJtK779CisOaupw2zT325R4290C+0dftL/9PkgvXxsCP0eGRUMK2tgjP
 HHekvtXlJQL+Ve3mSD4P9UQb28q89R2UJJ6cGsef6ALmxLwz8LogP/yCmhey0hbuRJQu
 EexeVWjH6oVdJQkPbicW52MzvDDecx9TtfSCbi8hISaK/mS+nuQDQKAnVZnwjkwrutGQ
 SziYKz/LaEA4rhcHOO9e/kx792uvsVUM2LCo5Q57oSLMRa9gCBwaboNcIYn7iSw4/vt6
 4J+qYoNRdW75Ms4aiFN9un2CdQd/Ik5EwSwawkMRFn02ZJtMgPi07QsfTIWVmpEexntk
 bDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lk5qRE/pmVflzUsX3HXq0oYb/H6wH9oUUbRaWEJ9isw=;
 b=RIJu9Is1E+d67Q0/nY7PpXe28TeJDpHmmXR5rIMpsEj7v9lOc/5lqyyqGSSKwNXpXI
 n7OzNBoWQIzMP/+DDfMf+frRbDyuvDHhRKfUF/AA9/eeoAX5LY9X7rt9bMF5jcEZLhty
 g0KW9KHh8+idM77T66E9ia9HJzA5uxWgaJprd03pa4AfI0d2vTpBnFWjEkpIe05HsvWi
 RIBE8wOnUJ5F9XsOrcTIv4y/9AoJzejJIGqRpq5iF1/qkxmdUNzLgkXKC8gz9UZeBD6n
 Y2X2vihTSkgkPsnENRVWQkwxNs1AsMJjpNEI0vVf8A70DHZMTz6qkKMcmvxSC1H5L6t7
 DrTA==
X-Gm-Message-State: ACrzQf1fn7R/g6kUu9bnFHFbXE5HicJ8mECqaOA2iEyCdAs+ZBMfIIEr
 9Og9lKwjJKheLjhLYBXuvvrtGQ==
X-Google-Smtp-Source: AMsMyM5jazbhX9QC3chba+ltNMyL01sv6+ltJuFRoBjXnIPmkKgMteTSw8qEF+QbtpU2QfLG4RyVXw==
X-Received: by 2002:a05:600c:3d08:b0:3c6:fb56:ac9f with SMTP id
 bh8-20020a05600c3d0800b003c6fb56ac9fmr12862709wmb.193.1666280958000; 
 Thu, 20 Oct 2022 08:49:18 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 v67-20020a1cac46000000b003b47ff307e1sm135834wme.31.2022.10.20.08.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:49:17 -0700 (PDT)
Message-ID: <180bff79-8512-9794-373e-57f23c7e912b@linaro.org>
Date: Thu, 20 Oct 2022 17:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 20/26] tests/avocado: disable sh4 rd2 tests on Gitlab
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-21-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 13:52, Alex Bennée wrote:
> Running repeated invocations on a number of test boxes show a fairly
> high error rate:
> 
>    $ retry.py -n 100 -c -- ./tests/venv/bin/avocado run tests/avocado/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d
>    retry.py called with ['./tests/venv/bin/avocado', 'run', 'tests/avocado/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d']
>    Results:
>    Run, Ret, Pass/Fail, Time, Total Pass, Total Run
>    ...
>    Results summary:
>    0: 94 times (94.00%), avg time 2.254 (0.00 varience/0.04 deviation)
>    1: 3 times (3.00%), avg time 1.837 (0.02 varience/0.14 deviation)
>    8: 3 times (3.00%), avg time 91.288 (0.02 varience/0.15 deviation)
> 
> Examining the logs they fall into various categories of un-handled
> unaligned access by user space and unexpected FPU usage by the kernel
> which ultimately lead to the failure to reach the login prompt. This
> could be bugs in the translator that only get hit occasionally or just
> a flaky kernel - its hard to tell. To avoid these failures gating CI
> lets skip on GitLab.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> ---
>   tests/avocado/boot_linux_console.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


