Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B1564060
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:31:11 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dDK-0003Er-SF
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dB7-0001ES-CX; Sat, 02 Jul 2022 09:28:53 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dB5-00009f-R0; Sat, 02 Jul 2022 09:28:53 -0400
Received: by mail-oi1-x230.google.com with SMTP id h65so7117599oia.11;
 Sat, 02 Jul 2022 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q+HFFCz+qq/vCwZHOc3oYdQjmCyNUleQKZgBgaEY2T8=;
 b=KfN07DzczliNOWRtCDdWyLl7Lf30ucc0ed42HrnPXhQE7v7mirTOOgkrc9It1/BGOO
 2sTiWuynozDNM9VQAZtmZ8VcdN+1tlfzHvIbZYrLEod4RehY//enytorBBbY0d478fGy
 33z+ogu4gpLaue1oJ6IcRtjMwcUWFAQ95kfNl25aJ8c42Mrf9YWLv/UVaT/51Zvz7hFK
 psgfKBqP6z+4hdFd8vHKihmsbxZds/XoKKd5KTl5o7qE7WF3b2ClS5GpFTaq13Pc6cxF
 v7boDb3yV2d4Fc/2KgugfcyJiwvbysUiblImXEONLAU7PBjxl6aCkzvqkXlNZajpzFds
 Zr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q+HFFCz+qq/vCwZHOc3oYdQjmCyNUleQKZgBgaEY2T8=;
 b=A1qPaEuKH+LF0Cb/AYuV/2CiPNqjjn01ajQTSSNc7QVXtbcfUyjR0+3JoDL1l05cOV
 uyi+YihRUI+AKX2xvdSJ2erWJMzAa2mOZ4xEnhAojbjcthYkRgXgsdXLZOSPB/jwMFfq
 JXIC51X0TxciQgTFdGanUiygRwSbvEyuVjbj+0TbVQmLRuChZbiuSzk5usXw+Zad29wn
 YuBvabRwYGsjYfdLSt75qORZFOEPUk4S8XbnfSLDzfQyW9iPcP3JpCFl1BNF7rr0ESEO
 78OP4jYqKFchqrBxfmkkBFdKkkNuO+F0LnZrM/rbP+EPK0cH9hVI+pn8UHeHJoqxxQgQ
 6IzA==
X-Gm-Message-State: AJIora8NFc740FlKQWVSmdjSOpHRxCCM9pugfDOJG7a3rVRLbpEFL8S7
 gdDEugf0BEaVQOploCyYaw4=
X-Google-Smtp-Source: AGRyM1tbaGzqJHA3W2M+YtSAcP2Q9h/K6Tn4U6sb5riOxmxx2rf8o7fsO2/Up1nJEpNgdYTHD687pA==
X-Received: by 2002:aca:b744:0:b0:32f:4c19:cec1 with SMTP id
 h65-20020acab744000000b0032f4c19cec1mr11676748oif.43.1656768530271; 
 Sat, 02 Jul 2022 06:28:50 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a544106000000b0033353cfd4acsm12225007oic.52.2022.07.02.06.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:28:49 -0700 (PDT)
Message-ID: <d6292a36-2636-f089-035d-f9a88ba3c5f3@gmail.com>
Date: Sat, 2 Jul 2022 10:28:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 00/11] target/ppc: BCDA and mffscdrn implementations
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br
References: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 6/29/22 13:28, Víctor Colombo wrote:
> Hello everyone,
> 
> Set of patches containing implementations for some instructions that
> were missing before. Also, moves some related instructions to
> decodetree. Add mffsce test.

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
> v3:
> - Rebase on master
> - Add r-b
> 
> v2:
> - Added R-b on patches 1, 8, 10, and 11. Dropped the R-b on some
>    of the patches as there were big changes on them.
> - Fixed addg6s issues
> - Separated do_mffsc in two different, more specialized functions
> - Changed mffs* patches order to make it more readable, as suggested
>    by Richard
> - Added a new patch with a test for the mffsce instruction
> 
> Matheus Ferst (4):
>    target/ppc: Add flag for ISA v2.06 BCDA instructions
>    target/ppc: implement addg6s
>    target/ppc: implement cbcdtd
>    target/ppc: implement cdtbcd
> 
> Víctor Colombo (7):
>    target/ppc: Fix insn32.decode style issues
>    target/ppc: Move mffscrn[i] to decodetree
>    target/ppc: Move mffsce to decodetree
>    target/ppc: Move mffsl to decodetree
>    target/ppc: Move mffs[.] to decodetree
>    target/ppc: Implement mffscdrn[i] instructions
>    tests/tcg/ppc64: Add mffsce test
> 
>   target/ppc/cpu.h                           |   5 +-
>   target/ppc/cpu_init.c                      |  10 +-
>   target/ppc/dfp_helper.c                    |  65 +++++++
>   target/ppc/helper.h                        |   2 +
>   target/ppc/insn32.decode                   |  55 ++++--
>   target/ppc/internal.h                      |   3 -
>   target/ppc/translate/fixedpoint-impl.c.inc |  51 ++++++
>   target/ppc/translate/fp-impl.c.inc         | 203 ++++++++++++---------
>   target/ppc/translate/fp-ops.c.inc          |   9 -
>   tests/tcg/ppc64/Makefile.target            |   1 +
>   tests/tcg/ppc64le/Makefile.target          |   1 +
>   tests/tcg/ppc64le/mffsce.c                 |  37 ++++
>   12 files changed, 322 insertions(+), 120 deletions(-)
>   create mode 100644 tests/tcg/ppc64le/mffsce.c
> 

