Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067EE60DED9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 12:27:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ondbJ-0004TQ-O2; Wed, 26 Oct 2022 06:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ondbB-0004KB-Mq; Wed, 26 Oct 2022 06:25:26 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ondb6-0007RW-7J; Wed, 26 Oct 2022 06:25:24 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so9556033otp.10; 
 Wed, 26 Oct 2022 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rXuVensDPnRsGIq3VtL5tphlDz+Tk9Pe0cp5jSNEuOw=;
 b=hHxJVrOPesyDfQJuzi6S7Ds7MjcQJI5cxqjAyJTT03q0ybwrW+wGbzvrym2SfkKVnY
 3MTijEv1XcVSuY6g1kAS+dyCUXBn61GkvIBOD3TjDqwGnLc7wK/wWe3e9ZmumXtQ2zff
 6TKqPjjira/5pY5IHAxrBjW0p1znqhiJPyTtoPoTvxzD7mb+aTCPcAa21LYAHfZX4Y5a
 lmS1qvNmZPdZZvf/Ea2jYSmaifplWdL13F2leVwuMEky4fLOXnYi/hmtj4t9ym/yfsX4
 kl7YQ4INf7WcJH+2lWxaNiDAcn8GOvnykogeAPz7t7ej3ssQxSCkyb6cFeWS5L2aCrrt
 LpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rXuVensDPnRsGIq3VtL5tphlDz+Tk9Pe0cp5jSNEuOw=;
 b=Qx0aFFYvHfMDdFBhZi0+7CHL+B7TbaCh6+b4J1Y1ZgPNFOgR6jcq1XGM9QWlh3h93N
 aZSlj89p/YVetNOpC1PKBiqFsIZcSZLg6zrWeVY9+SrypyzbfjYd7vILeFUoPTpRy37A
 yKVxc/Tck0Ss+okgS1uKg6YVgUM3/fiVrebkIPBx00MQ84dk9WoBvh2LGwb+9a7edO6F
 +WgSfhExYDgoFXmRy9wFKyK6gDV+baHCIS2AHPUI87wDA1iuwP9eAaRAsp/ndy/XxjlY
 Kpic6RJKXxXjGQiuUsF02uOSMhvB5Wcp7elsOPmUsxtcaeN9pI8RhTie1Dyn1qPM9v3n
 s6TQ==
X-Gm-Message-State: ACrzQf16YqC01/LdKQy+wE+F9w9SoVRdETE5dwQPMzLLMLyDiEPJBQC1
 EXwXu1LaEl6nFlfJxtn+eUA=
X-Google-Smtp-Source: AMsMyM5Vh+SZFLbiNeMZ/VCBvYqweW/95f/XdPiNYD3MXWCmkhGG82P6+JQKLLvS1amfA/D3ab70DA==
X-Received: by 2002:a9d:12ca:0:b0:661:b4b7:349d with SMTP id
 g68-20020a9d12ca000000b00661b4b7349dmr21155409otg.47.1666779914285; 
 Wed, 26 Oct 2022 03:25:14 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 y91-20020a9d22e4000000b006393ea22c1csm2016074ota.16.2022.10.26.03.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 03:25:13 -0700 (PDT)
Message-ID: <5709310e-983f-e47d-de84-7ebfce16e491@gmail.com>
Date: Wed, 26 Oct 2022 07:25:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/3] Performance optimizations for PPC64
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221025202424.195984-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221025202424.195984-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patches 2 and 3 queued in ppc-next (Richard is queueing patch 1 via
tcg-next).


Thanks,

Daniel

On 10/25/22 17:24, Leandro Lupori wrote:
> Changes from v1:
> - Turn macro into an inline function
> - Rename functions
> 
> Leandro Lupori (3):
>    accel/tcg: Add a quicker check for breakpoints
>    target/ppc: Add new PMC HFLAGS
>    target/ppc: Increment PMC5 with inline insns
> 
>   accel/tcg/cpu-exec.c     | 15 ++++----
>   target/ppc/cpu.h         |  4 ++-
>   target/ppc/helper.h      |  1 +
>   target/ppc/helper_regs.c |  6 ++++
>   target/ppc/power8-pmu.c  | 74 +++++++++++++++++++++-------------------
>   target/ppc/power8-pmu.h  |  3 ++
>   target/ppc/translate.c   | 32 +++++++++++++++--
>   7 files changed, 89 insertions(+), 46 deletions(-)
> 

