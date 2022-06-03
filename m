Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95B53C18C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 03:00:29 +0200 (CEST)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwvfv-0008Gm-PD
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 21:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwvcH-0007Fh-5S
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 20:56:41 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwvcF-0001cM-EH
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 20:56:40 -0400
Received: by mail-pg1-x530.google.com with SMTP id d129so6062652pgc.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 17:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=N4iKEilBUycb04fvVeTuxaqUmEJvmGTSzXGMvpE5/UI=;
 b=GHCPEVQOpH+OUUfCs3wRVrNFaGQzDxQ0KvjmgDekD+me8hdE7dRnwoIVGoE8jX0fxi
 6sjBs38q7Xq6qSo0VD9shy4z5l4w0G2GID5QM2jSK9eDAJhVHCrzkdMoM5ZxvTlJiViB
 PIN/pOkEzFqztjsJeg1mqsCX3R6AOlN3D/9rrSgi7Nt4OkxVSVCL7w0dONNk1GdN5mc3
 CwzVMioaK7h8954rV1HCSFxJbhXBz1nt0fb3W/EYdVQQk5W1buhwE8cj/SnvTxuW3Qp6
 qKDW4mv993+u146IU3oUuBhdGNb6QEXAswgEL8V624xmema4v6MTAsl070+mCmHjwiPh
 ttYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=N4iKEilBUycb04fvVeTuxaqUmEJvmGTSzXGMvpE5/UI=;
 b=h7g23iGb12v4XpIwUBddIWpTkwgPdUqtMvtNZjeVXSs3SdGFLfxcJirlbESe5LmsBB
 gRXz8UPxaVboVHakLCYhADlRXZaE7f8A9lsCaqRzrfHZqAW/GvtQiuHUsQvPnH751GAP
 LqdBIMERW90XlBtX9JL+K4fywBC7HFU0LLsUzCX6YxG/7yeNT5ryMd9FV+WUZ3iSc6Kh
 NgENSbqxz26kmbsjvAuG7gdolI9e0qin7/+5j747GOySB8amBuJR9yBmGJIdWFjQvUtX
 3VJZxQmgoCL7JDiOB1qfp+r9EIuYNNlzWIY3KlX0c3W4cnsLDzcrfMJL/uf1PktTPNyS
 8aTw==
X-Gm-Message-State: AOAM533QIpmEojO7Yfi8rg5DJZGyfq5m8s9o1BvMhqh9UszKuOUWFlsR
 fUMBmWa8WkYOTAp+JFaI0P9Rdg==
X-Google-Smtp-Source: ABdhPJxvRrx7NYDOaOdFI0oFQYW0jpmz3BCCOXiYFbyD2tMKU3vfeMs3gwTxsXkDUkyyNlDmU/C3zQ==
X-Received: by 2002:a65:4803:0:b0:3fc:bc0:722c with SMTP id
 h3-20020a654803000000b003fc0bc0722cmr6522664pgs.317.1654217797577; 
 Thu, 02 Jun 2022 17:56:37 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 s68-20020a625e47000000b0051b9ecb53e6sm2971750pfb.105.2022.06.02.17.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 17:56:37 -0700 (PDT)
Message-ID: <5098180d-334f-7631-011f-6beb3a1434ac@linaro.org>
Date: Thu, 2 Jun 2022 17:56:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
 <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
 <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
In-Reply-To: <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 6/2/22 17:03, Richard Henderson wrote:
> Ho hum.  So... the first time I try to do any actual debugging after this has gone in, and 
> I am reminded exactly how terrible capstone 4.0.1 is for anything except x86.  There was a 
> reason I had chosen a development branch snapshot, and that's because it was usable.
> 
> Here, for instance, is how ubuntu 20.04 capstone disassembles
> tests/tcg/aarch64/system/boot.S:
> 
> 0x00000000400027b0:  10ffc280      adr x0, #-0x7b0 (addr 0x40002000)
> 
> 0x00000000400027b4:  d518c000      msr (unknown), x0
> 
> 
> 0x00000000400027b8:  d0000fe0      adrp x0, #+0x1fe000 (addr 0x40200000)
> 
> 0x00000000400027bc:  91000000      add x0, x0, #0x0 (0)
> 
> 0x00000000400027c0:  d5182000      msr (unknown), x0
> 
> ...
> 0x0000000040002850:  d5381040      mrs x0, (unknown)
> 
> 0x0000000040002854:  b26c0400      orr x0, x0, #0x300000
> 
> 0x0000000040002858:  d5181040      msr (unknown), x0
> 
> 
> And this is the extremely simple case of ARMv8.0 with no extensions.
> 
> I am very much tempted to re-instate the capstone submodule, or update disas/vixl and 
> disable use of capstone for arm.

Double ho-hum.  It would appear that this horrible disassembly *is* vixl, because I didn't 
double check that libcapstone was installed.


r~

