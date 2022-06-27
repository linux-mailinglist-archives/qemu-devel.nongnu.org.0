Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59655B832
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:29:10 +0200 (CEST)
Received: from localhost ([::1]:45562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jBE-0001TJ-Qw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5j2v-0001Cj-Ce
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:20:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5j2p-0004WT-I2
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:20:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 184so8267644pga.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TMaTdOHtpn/LSRLUxa5FqEM8u5tTx7XeGNkZ51ZC4iI=;
 b=WvqYj0Ozg8nddMso5Aigb1u4S7ysh64nVcbj4jmhcSwg5/aZNwGaJzcAk1ijGNcQyf
 ScEx01yaNztbCjlAT0ItBiyg2aKNr6MpAUJHfXWfrVBW9qOlTR5auvIY7I0g+8PfbhpU
 YtyT31hSlwyDVIDMqVPr5ZNHqgIrMfPG3eaRqUJHJwyN/aSwM5YYtbDwSGm70+QU2BuB
 R/mK2KYiCYlE1WUvL9kpaBxs2kokVrQKd9EhOHnzKM4nP8nuolhMtYP5EXbcG0n6RH+m
 pv3nUpPe1qjzNNbo6rynVHrMrei0LVpN0dKvTD6ylVw0g9cfTgJ1+nyoqssmn/57N5yY
 rb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TMaTdOHtpn/LSRLUxa5FqEM8u5tTx7XeGNkZ51ZC4iI=;
 b=HSeeVooBgcbd6ixKPCcLVjfaIQZbELzMndsMFlJ4kjdHQ07w8cGvEzb4+xYSlWDhR+
 En+AWu1ScxktkuYt5462fTjbwy4PSRo5KzmgCLfhgh4WoWvFHS3+bV6Bs0XVtjp+txYk
 /c12PGrFUYZpzW/R3xMThOaMBv3sI3JJExmuUH1jaIOTTnSTOCpVU90Fa7NuiI8mOTLG
 xvwtiYmLTy3TKesV1EIKoGxxnCvGExr3mbBUZ1J5xd8Ddd/klqYQ5OmVU07ft3e6J34T
 BB7UTvqwkvOM4gDbNWE/ZjmTo+Z4Jv3xtUdguqBN0Gk8kKb9YO5nmENlRxXIlZAjDEqJ
 1wLg==
X-Gm-Message-State: AJIora+lHORinyM0gFiP5f1U2x2spcFLEfbAKSEJzftCXapFtIVKpDef
 5tRBGrcFgrm4eZAxRbu3zBQNug==
X-Google-Smtp-Source: AGRyM1sABh7PMC+N9ySpScZQeiCTHX0GGNQFSQecC5zWKGbt1BGNwub41MviwFKsaGzMW+LTOdA+9g==
X-Received: by 2002:a63:1619:0:b0:40d:37aa:9ace with SMTP id
 w25-20020a631619000000b0040d37aa9acemr11380698pgl.609.1656314425932; 
 Mon, 27 Jun 2022 00:20:25 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902650300b001637529493esm6411710plk.66.2022.06.27.00.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 00:20:25 -0700 (PDT)
Message-ID: <4986d31e-00b3-bb94-654d-9659af8ae09f@linaro.org>
Date: Mon, 27 Jun 2022 12:50:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: QEMU Disassembler
Content-Language: en-US
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp-2qVkc_G_OsfF=nCp2VfpOHjvRZR=tevN0fOSsgFpZYw@mail.gmail.com>
 <CAK7rcp_qq1GC-Mtp8FW9KhVbtUKehweLCOTv-sB8deODrbBgfQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAK7rcp_qq1GC-Mtp8FW9KhVbtUKehweLCOTv-sB8deODrbBgfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/27/22 12:10, Kenneth Adam Miller wrote:
> Actually, I have gotten the QEMU disassembler to run with some short customization. But I 
> am having trouble understanding the output. I see lots of lines like this:
> |
> OBJD-H: 06040102a83507000cd8027620272573004c000004c0000d20c100782244038c

You want --enable-capstone, and to have libcapstone-dev installed.

But for the record, these lines can be decoded by e.g.

./scripts/disas-objdump.pl -h i386:x86-64 <dumpfile>

to turn

PROLOGUE: [size=45]

0x7f5010000000:

OBJD-H: 55534154415541564157488bef4881c478fbffffffe633c04881c488040000c5

OBJD-H: f877415f415e415d415c5b5dc3


into

PROLOGUE: [size=45]

0x7f5010000000:

     7f5010000000:       55                      push   %rbp

     7f5010000001:       53                      push   %rbx

     7f5010000002:       41 54                   push   %r12

     7f5010000004:       41 55                   push   %r13

     7f5010000006:       41 56                   push   %r14

     7f5010000008:       41 57                   push   %r15

     7f501000000a:       48 8b ef                mov    %rdi,%rbp

     7f501000000d:       48 81 c4 78 fb ff ff    add    $0xfffffffffffffb78,%rsp

     7f5010000014:       ff e6                   jmp    *%rsi

     7f5010000016:       33 c0                   xor    %eax,%eax

     7f5010000018:       48 81 c4 88 04 00 00    add    $0x488,%rsp

     7f501000001f:       c5 f8 77                vzeroupper

     7f5010000022:       41 5f                   pop    %r15

     7f5010000024:       41 5e                   pop    %r14

     7f5010000026:       41 5d                   pop    %r13

     7f5010000028:       41 5c                   pop    %r12

     7f501000002a:       5b                      pop    %rbx

     7f501000002b:       5d                      pop    %rbp

     7f501000002c:       c3                      ret



r~

