Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBF2F3C78
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:49:14 +0100 (CET)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzSTR-00044A-2G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzSR2-0003Qp-75
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:46:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:32802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzSR0-0002nS-FX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:46:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t30so138873wrb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AZ/shsSriOu99emqyJXr7o78dUsIal8F9HD+es97O38=;
 b=iW+e1E0LAvlA9/AgLrQs/bvCEvkYDaKw0Fi96EXxmzbOOEqcsKj8qK+9iWrRZCBa1F
 f73I9NNpwSJs1mkUDo7kCFq04rftfGrV00TaWVQ6an12NJ5l74I27sARuu7uKB8+pOqJ
 E5kYCq8rkzrMcxpDwP9/r49OPqPRjrajNKvvl9E+eq9kIyoXI9K2F2mrbzczgf8qj9No
 BcsFAujVZ3rDuVCO0/h+1SWp5vCGxL5+BLUuvmlyKaO1jNzt8Mux0R6JbPw5lqhhYMfj
 S6yvnJv/kHZ6NF9vENc8ipu6+5NhQVnhWCurVAwrXd55eG7j1jfUhb1N5GRY+oeW136y
 opeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZ/shsSriOu99emqyJXr7o78dUsIal8F9HD+es97O38=;
 b=tLxouA9JAxImIK/iLXKCSFClAF4f07stDAhBAInN96zwQ+g2E0ZoUbcAuBh1JJ4+9k
 rH/9ioplpZXH7r+xf9C6Gep8cFXTEjoO9cFjilXjuB7NxWAWaEGhKFjIilIfm3n7wZxj
 oOH2xmQ8JCM4eFjOR95z2rBemr5/1lTic5omvCfsa22Fh+XaQevdE1EO2+Lox+W1Cem2
 uk/hPjYlrj5wAJzd7w+Il6M0yQAy2gQNXOukDMUSl0hUQro7Y7n5EsFxiK0cRXX/3yeE
 42Z2Qajpqw15+1IUpJuFFLjywwtoOddiDbDF6cDJtJb+gMEBKnxD0RGv9vLdoZ1MaF+S
 L8wQ==
X-Gm-Message-State: AOAM531SEnqETrCiUEZv1HOZM+/IUxUAn0RbBlQaGCi8sNZfWvH0Ux1o
 VQTkr1BBJ61x2Z65rP7Ox+M=
X-Google-Smtp-Source: ABdhPJyfA/FVy2PHFx/vFeUktb6+3T8B3hLeMPIGUfnDqlMfoWsMsZKgglpzKGNbuddn6SrOk/8fcw==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr934214wrq.353.1610491600895;
 Tue, 12 Jan 2021 14:46:40 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id f7sm7378813wmc.1.2021.01.12.14.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:46:40 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210112184156.2014305-1-f4bug@amsat.org>
 <7fd434f1-aa6d-f4db-b741-564a33a8540a@linaro.org>
 <2d6ffc43-51b1-e565-6dc5-6985ed43ccc5@amsat.org>
 <20210112222809.GD4161@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb05a6b3-0a2b-f794-1525-c44ed48fc8f6@amsat.org>
Date: Tue, 12 Jan 2021 23:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112222809.GD4161@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:28 PM, Eduardo Habkost wrote:
> On Tue, Jan 12, 2021 at 11:15:38PM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/12/21 9:44 PM, Richard Henderson wrote:
>>> On 1/12/21 8:41 AM, Philippe Mathieu-Daudé wrote:
>>>> Some ISA use a dot in their opcodes. Allow the decodetree
>>>> script to process them. The dot is replaced by an underscore
>>>> in the generated code.
>>>
>>> Given that you then have to remember to use '_' on the C side, what advantage
>>> does this give?
>>
>> The direct advantage is you can copy/paste the opcode in a PDF viewer
>> without having to edit it :)
>>
>> See i.e. some Loongson opcodes [*]:
>>
>> MULT.G          011100 ..... ..... ..... 00000 010000   @rs_rt_rd
>> DMULT.G         011100 ..... ..... ..... 00000 010001   @rs_rt_rd
>> MULTU.G         011100 ..... ..... ..... 00000 010010   @rs_rt_rd
>> DMULTU.G        011100 ..... ..... ..... 00000 010011   @rs_rt_rd
>>
>> DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
>> DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
>> DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
>> DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd
>>
>> MOD.G           011100 ..... ..... ..... 00000 011100   @rs_rt_rd
>> DMOD.G          011100 ..... ..... ..... 00000 011101   @rs_rt_rd
>> MODU.G          011100 ..... ..... ..... 00000 011110   @rs_rt_rd
>> DMODU.G         011100 ..... ..... ..... 00000 011111   @rs_rt_rd
>>
>> The other - remote - advantage I see is when using a disassembler
>> based on decodetree (as AVR does), the opcode displayed also matches
>> the specs. We are not yet there with MIPS, but I have something in
>> progress...
> 
> Interesting.  So, the decodetree format is not used exclusively
> inside the QEMU source tree, but also by other projects?  Is
> there a specification somewhere else?

"as AVR does in QEMU", see commit 9d8caa67a24
("target/avr: Add support for disassembling via option '-d in_asm'").

What seduces me with decodetree is we don't need to match QEMU
instruction class with each CPU capabilities. IOW we can use the
same decoder for TCG and disassembly, and the disassembly matches
the instruction set of the CPU (with all the specific instructions).

Currently some specific opcodes are displayed as generic ones (or
as unknown via hexadecimal value). Unfortunately not something we
can show with QEMU AVR target because the ISA is very simple.

Regards,

Phil.

