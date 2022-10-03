Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A15F3064
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 14:41:52 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofKlb-0004ez-Kg
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 08:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKcW-0006jE-1i
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:32:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKcS-0006Tc-UM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:32:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id j16so4570493wrh.5
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=6U9AukISGNaP8Y8Q79iqTXHBUM9+xawYkjoVVPHHQgE=;
 b=qXWxslr5LSQEwhL2Dsdl6k0jumJAeJQsYEuTu2KVDyacJAjQMWQlZCFxJQwNGggtEt
 LsHCMOOYi3nKGnDohVyxqpdAlO47wrWnuzUsMOPfbsodh90LrJCHzDeohpfYVGE2hpck
 N9nAhqEFFYPc7IPxafcq/PjTKNSC36CiNDvRD0hN6eZk3KFtjfiMz4Ka8ubTkWzyeUml
 fu95ASe4xFnLas12VsiasoQwQQTYTnxru8YQ+zCjIJh87BjxTEIchmdaPzPExmvihhOL
 NHkQV7oNR4vpWVqYUDjAH2UP1Mw55s73cKrAuH13QB8Jt2zd8E8z/0ZAYeWmCnNljVtp
 djEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=6U9AukISGNaP8Y8Q79iqTXHBUM9+xawYkjoVVPHHQgE=;
 b=T7vcE8UK3yfmJ+MJ0l21EQClGgngwAvv+i8u5Y/vLJWO0YNJtSimIyBr2IwxXV6czi
 HCHlD2fXJRJgAaTkQ3qUOs/IUMapYMj/upROmHesZD6dBUpg2iEFKVAWEkYpIlkfVG4Y
 ncWJ/+l+HyO5EJskEH7nkQ+CAs7JqCeWaVqC6PIUvKbQRjjJqoLOOKY4IFwPog5THvn8
 esCJErifpZfuD5+M69xfH6MHKBlT7UQ1vNDDppBh5t2hQKwjPyZIFQn/hxTIWDRed3S8
 eP1DvGnN1uentb/IbXgznng2vekbs1GO3tMtPwV45k49cZTbZk1lQ09M/12WNKkyE4nU
 6/kQ==
X-Gm-Message-State: ACrzQf3szbaGloW6f9rs5r4RB+3pHnV3w2K4hk73zseV8Mpy6RfQimnb
 2Y0VmwVCvEPmI/ik1nuFAdU=
X-Google-Smtp-Source: AMsMyM4Wq05lCfZUHA7RxGfGSpMRltXlVFg+TgrHWTRZT+ofpfzmP9GSaEAxOWu+9Yn1XnooyGh4GA==
X-Received: by 2002:a5d:46d0:0:b0:22c:de2a:23e with SMTP id
 g16-20020a5d46d0000000b0022cde2a023emr11262648wrs.12.1664800341599; 
 Mon, 03 Oct 2022 05:32:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c350500b003b491f99a25sm17458195wmq.22.2022.10.03.05.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 05:32:20 -0700 (PDT)
Message-ID: <84e9db71-7c59-c92b-4640-af0b7e679dab@amsat.org>
Date: Mon, 3 Oct 2022 14:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] tests/avocado: Add missing require_netdev('user') checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221001195224.2453581-1-peter.maydell@linaro.org>
In-Reply-To: <20221001195224.2453581-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/10/22 21:52, Peter Maydell wrote:
> Some avocado tests fail if QEMU was built without libslirp. Add
> require_netdev('user') checks where necessary:
> 
> These tests try to ping 10.0.2.2 and expect it to succeed:
>    boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
>    boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>    ppc_bamboo.py:BambooMachine.test_ppc_bamboo
> 
> These tests run a commandline that includes '-net user':
>    machine_aspeed.py:AST2x00Machine.test_arm_ast2500_evb_builroot
>    (and others that use the do_test_arm_aspeed_buidroot_start()
>    or do_test_arm_aspeed_sdk_start() helper functions)
> 
> These changes seem to be sufficient for 'make check-avocado'
> to not fail on a --disable-slirp build.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 4 ++++
>   tests/avocado/machine_aspeed.py     | 3 +++
>   tests/avocado/ppc_bamboo.py         | 1 +
>   3 files changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

