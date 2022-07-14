Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBD57569C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:52:22 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5or-0003dq-I2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5lh-0006o0-0u; Thu, 14 Jul 2022 16:49:05 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5lf-0004vf-HL; Thu, 14 Jul 2022 16:49:04 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so3913034fac.9; 
 Thu, 14 Jul 2022 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k048gjqJbzuH1k7sq+F85qcFbxhmrflH3nno6hME6RE=;
 b=C+FOIzoOzw3AQSYKru0DlNg3niknAacq1MHAvjFPNLMoc31Lm1hatT/wz3SNEp5v78
 Syj43G1oBwQ5c/42qs5FRbW7PV+CydrGvY+9Rf1tFU+/3U63Pm4R4dPDoWVKZCmyXMJk
 uG1K7rJYlMA0J1q5f1W1j5joZ//dI6vL7R8Hj8ptvTCliErfq9hI0QaSVyustW7ivZ3w
 5GM2Oyo+ya69ztnXZ4TD7GLvyQtmqyOXoNa8ECMM4xJpXb+GBHvjjFeRCtXh/GzfFZwS
 8TFTh1iZrySA4jgNFBhPF9L1y0V6TCoOvHX94ZZLpDTytmpPFQZmRFic3xDRTTsyZWpe
 9OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k048gjqJbzuH1k7sq+F85qcFbxhmrflH3nno6hME6RE=;
 b=EHt/POaPxwNpm67v5znsOJnS1OykqTWJZNhkDz7sneL5hdlWjMn67uRYqseoQf2IYR
 6fR/7krHM2N5TER01uPd/Tl7HU0VlTelyX6s2Qn9p7RceJy0/wHSBWcu1R5HHnQCHBNJ
 RGqGia5rhQwFBoFOj1AC/c5MrruCw9icgoVMDwqtJzWKa69nr0H+aRaa6eQ6mN13bGaA
 ov0gUmY0KJ7URxiwaV4F/2U2mTLfe37CAUhbGSCyYX/m/i/KIJqWm4eqOOmsLZQ3TRrP
 B3Rd53L0XJ7/3QhJpInmf71zGFRGOdE1Dhdbgdzazk/h4/REuA8rolUM7Vu3KIMaeBfA
 l3SQ==
X-Gm-Message-State: AJIora8tnfhqvz79MItsx9gJidMamwdSGYaBCLp7rAL9qj1SmvUBdoXq
 YT6GyKXfnYfiGvCdCnIwjghyq/PTlt0=
X-Google-Smtp-Source: AGRyM1sbJRsSsXl+pAjOF/EwOsxlRU21uDeL1t2nd+5OB7VYxFL3bx5s9Q6q78Rg9DW8JcnBxPgYgg==
X-Received: by 2002:a05:6870:61ca:b0:10c:1358:4eaf with SMTP id
 b10-20020a05687061ca00b0010c13584eafmr8366119oah.111.1657831741666; 
 Thu, 14 Jul 2022 13:49:01 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056870b40d00b001089aef1815sm1457828oap.20.2022.07.14.13.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 13:49:01 -0700 (PDT)
Message-ID: <e342895e-f8ef-a759-a9b5-79aec946ac1d@gmail.com>
Date: Thu, 14 Jul 2022 17:48:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/2] target/ppc: Implement ISA 3.00 tlbie[l]
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, richard.henderson@linaro.org
References: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 7/12/22 16:37, Leandro Lupori wrote:
> Changes from v2:
> - Moved TLBIE defines from helper.h to mmu-book3s-v3.h
> 
> Leandro Lupori (2):
>    target/ppc: Move tlbie[l] to decode tree
>    target/ppc: Implement ISA 3.00 tlbie[l]
> 
>   target/ppc/cpu_init.c                        |   4 +-
>   target/ppc/helper.h                          |   2 +
>   target/ppc/insn32.decode                     |   8 +
>   target/ppc/mmu-book3s-v3.h                   |  15 ++
>   target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
>   target/ppc/translate.c                       |  64 +-------
>   target/ppc/translate/storage-ctrl-impl.c.inc | 104 +++++++++++++
>   7 files changed, 287 insertions(+), 64 deletions(-)
>   create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc
> 

