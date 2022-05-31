Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7395391AB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:21:04 +0200 (CEST)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1nx-0000DP-BF
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nw1i1-0005yn-6e
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:14:53 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nw1hz-00080Z-CI
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:14:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id j6so13134326pfe.13
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WYNjlytptd7Xpv5NBvnmevZxsrxWaoHwUtwY+G++ZJA=;
 b=NYkQMb/PYYH1oa3oHmGx70t6QS5EaoJSLYgDr+6m8t+LGfjL9qupgYrjbyHfMt4QDX
 fj4WC3IgZaczK6t3HvTrC40SEwKFehs+IIaGR6JvtRVzjhWvRry/miYFKobn5Ras9Eos
 op06V+WYjCExB2aRZIfWBWDH62yCXKr81m1T75hnFAWWdsPgg/KOhxKYyYtMKFCXvUOB
 gDw+ie0ulQBkf+hNyqDAc8Ks62Fn/5CjqMYb6Cu3VlRL/hYHg6IqbFyRaGyFe6FfMP51
 R+2YonPAACWbMFPnDRMHgDkc3z49alqdOJc7PDwXbxX+mjLVNlj2WwUMlmYcymnWOHuB
 k2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WYNjlytptd7Xpv5NBvnmevZxsrxWaoHwUtwY+G++ZJA=;
 b=L2ky5UEQSiQlDWAx6pSTxkFKltPOWbcdvImCotKZYp3Hf4zn0XSMnS5cYYqF6mON//
 8sAYN61lJMDPHw2P+xs0Q1u6vhvSXMrlswP/SvxahN4k162cWXDj6N1vSDbCf1Tp7D4p
 lYlhRf6wRfEvDtz5KGPAQlf/IarYCrWP3wAVnDM0hf9l6ZCLQmEz1LIDZYLVD/fbRPXv
 C5qSky7WidRp08l/yfT59tlqUOvXrqknUMQ6ag/BEF8u15u6Rzty4BWFyVyRoTHYhuQS
 vLLHsdeEJshzmjHzgAGkvLTZJOsqeOXaB2FxVaH7jzQYHHxBw1ch0M1jXcKYzLlzupgJ
 ErAg==
X-Gm-Message-State: AOAM532LpXDxsUrjYSLIZGV9/O/fqtwr55SPePiqZN+JvuuEh8KwBrct
 hrsqFfiIcATCHnG6wZBugGA=
X-Google-Smtp-Source: ABdhPJzv0pMF4f1RXiXNVS0nbuONGLdT3LZO/rEuhHjIgp71WnQICHU4K5cWHxcohKhibtI9xCmYTg==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id
 h12-20020a65404c000000b003c64018ffbfmr53146488pgp.408.1654002889630; 
 Tue, 31 May 2022 06:14:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902e0ca00b00163cb0a8392sm5124972pla.168.2022.05.31.06.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 06:14:49 -0700 (PDT)
Message-ID: <10b8d473-c299-8070-e8d4-3d41b67af467@amsat.org>
Date: Tue, 31 May 2022 15:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 7/7] target/mips: Undeprecate nanoMips ISA support in QEMU
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-8-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-8-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
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

Hi Stefan,

On 4/5/22 13:04, Stefan Pejic wrote:
> nanoMips ISA support in QEMU is actively used by MediaTek and is
> planned to be maintained and potentially extended by MediaTek in
> future.
> 
> Un-orphan nanoMips ISA support in QEMU by setting a mainainer from
> MediaTek and remove deprecation notes from documentation as well.
> 
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   MAINTAINERS               |  3 ++-
>   docs/about/deprecated.rst | 26 --------------------------
>   2 files changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 294c88ace9..f1e0dee8a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -240,7 +240,8 @@ F: docs/system/cpu-models-mips.rst.inc
>   F: tests/tcg/mips/
>   
>   MIPS TCG CPUs (nanoMIPS ISA)
> -S: Orphan
> +M: Stefan Pejic <stefan.pejic@syrmia.com>
> +S: Maintained
>   F: disas/nanomips.*
>   F: target/mips/tcg/*nanomips*
>   
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 896e5a97ab..4b0868886f 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -276,13 +276,6 @@ System emulator CPUS
>   ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
>   Models instead.
>   
> -MIPS ``I7200`` CPU Model (since 5.2)
> -''''''''''''''''''''''''''''''''''''
> -
> -The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
> -(the ISA has never been upstreamed to a compiler toolchain). Therefore
> -this CPU is also deprecated.
> -
>   
>   QEMU API (QAPI) events
>   ----------------------
> @@ -382,16 +375,6 @@ The above, converted to the current supported format::
>   
>     json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
>   
> -linux-user mode CPUs
> ---------------------
> -
> -MIPS ``I7200`` CPU (since 5.2)
> -''''''''''''''''''''''''''''''
> -
> -The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
> -(the ISA has never been upstreamed to a compiler toolchain). Therefore
> -this CPU is also deprecated.

Thanks for contributing all these fixes! I'm glad to see this code used
and soon maintained again. Last time I tried to run a user-mode binary
it wasn't loading due to incomplete nanoMIPS ABI support. What kind of
tests are you running? Would it be possible to contributing them, to 
avoid code bitrotting?

Thanks,

Phil.

