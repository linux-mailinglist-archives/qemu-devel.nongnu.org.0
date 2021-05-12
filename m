Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434637C820
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:39:25 +0200 (CEST)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrtM-0006ie-9b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgrs0-0004h8-L1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:38:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgrry-0000Il-Sk
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:38:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s8so24290176wrw.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xlkjhiZwhd+oBW1kqZXMIqWWxtgtu4dt13SWsyKDLvs=;
 b=FRnPGcRTROwdgoe/N+5hSUYq9XybiwwkrQ1TKhuLjoROAiTrIjXao9Xw3eYO25j+IP
 C3o/dHLvWeHXX7LDsaJJPKlIKPoK1kSKvlaZaXVBOWWd8WYfth89szui2LQmP+CNG+wT
 ZEJCeOCY+DnxZtDvVE8siZ9gs2udWsmmR/bnQ30C5HMAGuU54FJRJ2BSGK6Ly7+Fm8Lk
 BfFccF4h3NgVGIQQcFJZd5wpYd9duDSITwdfWskP6X2bLfs7VtwLY3xQjD4PMPUTlAiL
 Jsy80Le29b20WWmop7DOb6JC+2Hp32G8Hnb4M7aStSghkQHRE8P3T5SihnE8YBkr0E1z
 Cf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xlkjhiZwhd+oBW1kqZXMIqWWxtgtu4dt13SWsyKDLvs=;
 b=q87vTKXbD9dBD8n8BSis6XYPIbZPsjsefO2Lr4TfIciE3RU2nmqmf1cJ348ENh8QJl
 A1Qzzw42hM/6Cy3mc6ilcfGuoK/haEGvXxZw4QiXCFf5ggAslZeLDpA4doal//YcjZoC
 CxGZeekwIYH1ZD9Jg0ugXKko+Q8vMqqIX7JYkoTJEsIKnarEJTpCv5EM2evzsA4sE57L
 9FgmUpGKaYCjFoWXnViPrIa2SwmRwHAZqeHo5iYB9OHV/hHSVTiHNn19d6KveFQ+NI01
 a9ZksNLy96bTEyRCVsn8Ht86fEOKYQuoRzzZmPtzKsga/Md2mQa8+xp1iAfSOQhiWeWT
 yhrA==
X-Gm-Message-State: AOAM5315EG4e7VViRloa7unUxHGSadyMZTMxdvnqo14eiJKTlflbzz3h
 EJ4sG+jx+fnNRdnieLYFBC0=
X-Google-Smtp-Source: ABdhPJxaW8VNSFF1qoqOUYbysrxaPJWXmqw9zXODceDNdSTzBc4OWH2Ty1N7wPNZ+6xxnUSVBT5CsA==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr46366673wro.3.1620837477230; 
 Wed, 12 May 2021 09:37:57 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f8sm148148wmg.43.2021.05.12.09.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:37:56 -0700 (PDT)
Subject: Re: [PULL 2/5] Remove the deprecated moxie target
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210512162412.338120-1-armbru@redhat.com>
 <20210512162412.338120-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a8c579c8-e361-e3ef-0f4d-d902e12c7525@amsat.org>
Date: Wed, 12 May 2021 18:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512162412.338120-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 6:24 PM, Markus Armbruster wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> There are no known users of this CPU anymore, and there are no
> binaries available online which could be used for regression tests,
> so the code has likely completely bit-rotten already. It's been
> marked as deprecated since two releases now and nobody spoke up
> that there is still a need to keep it, thus let's remove it now.

Isn't it already in a pull request sent by Thomas last week?
(I ask because I based a pair of branches on it)

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20210430160355.698194-1-thuth@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> [Commit message typos fixed, trivial conflicts resolved]
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst                |   8 -
>  docs/system/removed-features.rst          |   7 +
>  default-configs/devices/moxie-softmmu.mak |   5 -
>  default-configs/targets/moxie-softmmu.mak |   2 -
>  meson.build                               |   1 -
>  qapi/machine.json                         |   2 +-
>  qapi/misc-target.json                     |   2 +-
>  include/disas/dis-asm.h                   |   1 -
>  include/elf.h                             |   3 -
>  include/exec/poison.h                     |   2 -
>  include/hw/elf_ops.h                      |   8 -
>  include/sysemu/arch_init.h                |   1 -
>  target/moxie/cpu-param.h                  |  17 -
>  target/moxie/cpu.h                        | 123 ---
>  target/moxie/helper.h                     |   5 -
>  target/moxie/machine.h                    |   1 -
>  target/moxie/mmu.h                        |  19 -
>  disas/moxie.c                             | 360 ---------
>  hw/moxie/moxiesim.c                       | 155 ----
>  softmmu/arch_init.c                       |   2 -
>  target/moxie/cpu.c                        | 161 ----
>  target/moxie/helper.c                     | 120 ---
>  target/moxie/machine.c                    |  19 -
>  target/moxie/mmu.c                        |  32 -
>  target/moxie/translate.c                  | 892 ----------------------
>  tests/qtest/boot-serial-test.c            |   8 -
>  tests/qtest/machine-none-test.c           |   1 -
>  fpu/softfloat-specialize.c.inc            |   2 +-
>  .gitlab-ci.yml                            |   6 +-
>  MAINTAINERS                               |   8 -
>  disas/meson.build                         |   1 -
>  hw/Kconfig                                |   1 -
>  hw/meson.build                            |   1 -
>  hw/moxie/Kconfig                          |   3 -
>  hw/moxie/meson.build                      |   4 -
>  target/meson.build                        |   1 -
>  target/moxie/meson.build                  |  14 -
>  tests/qtest/meson.build                   |   2 -
>  38 files changed, 13 insertions(+), 1987 deletions(-)
>  delete mode 100644 default-configs/devices/moxie-softmmu.mak
>  delete mode 100644 default-configs/targets/moxie-softmmu.mak
>  delete mode 100644 target/moxie/cpu-param.h
>  delete mode 100644 target/moxie/cpu.h
>  delete mode 100644 target/moxie/helper.h
>  delete mode 100644 target/moxie/machine.h
>  delete mode 100644 target/moxie/mmu.h
>  delete mode 100644 disas/moxie.c
>  delete mode 100644 hw/moxie/moxiesim.c
>  delete mode 100644 target/moxie/cpu.c
>  delete mode 100644 target/moxie/helper.c
>  delete mode 100644 target/moxie/machine.c
>  delete mode 100644 target/moxie/mmu.c
>  delete mode 100644 target/moxie/translate.c
>  delete mode 100644 hw/moxie/Kconfig
>  delete mode 100644 hw/moxie/meson.build
>  delete mode 100644 target/moxie/meson.build

