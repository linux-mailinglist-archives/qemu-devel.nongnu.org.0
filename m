Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DE44AD45
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:15:12 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQ1v-0003HV-AJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPz8-0001CP-W0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:12:22 -0500
Received: from [2a00:1450:4864:20::42e] (port=42651
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPz5-0003Tt-Oi
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:12:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c4so32617983wrd.9
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 04:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lRE2zZ18/cc1dhzx3rnZDaP6FKD6dYcwLf/z9SDH8pw=;
 b=IIyCgqIIVGDI0+caMvCRJr6oEMOxoVvItrdscFWdeZ4Z56H2M2aaW00LIMLuuHqXXS
 M7L4BHUUVc9aXqvgY/+/sOMiJcL2fCIZc/sNspPMTmRWZwFBCGVyTKqJeq0X6B1sUIaP
 8eUZQRn8pmp5WT7XpFhOVkeN6QeQm6FEzoxZX+tw+CJPoh5DIcZ6ggJMerJU/04KFtjk
 QaUMzW97uL0D4oDQZ1pH+CzP7lr6o7TL93Yvjxf1a7NKD1udWT5UHYK50oztZ5+heWOh
 H8wEMKMuU8I+qcaBRdJClz1fo1hgSEZ+8w3x+x/1MA6lvfP08imU3RbfuO1C5YER9oeT
 dB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lRE2zZ18/cc1dhzx3rnZDaP6FKD6dYcwLf/z9SDH8pw=;
 b=DsK07LN/PRG8SSCT7s3YonJ4n8EWKxtvoNFonuPGQd3svaAEa3/D7kxvF8apsEsHq+
 ecz/6Urbr2DefkLe0x3Eu6k2vB1Pd+qZ4nAPfgVrnwf9WBTSUBfGXGKRiiFo99N+c1IB
 GL/nJ27rCuZExSu1NWg7vj8yHxRBLU2Czl09Btz5VOgLGuMUstO6zVjCxd8A3bpeIJpo
 VE9AUNwqnPnw63YdpwygmynlMnUdr8GRU7xYWJpmMhCEtyz80UBC8bgYMMAl0P1All1j
 21hl4sBmUMmuNJTm+e1+uDfETXbPQqszTxDGOQjOOxpRzw1V3HzkNneS93tqPmJcJgpI
 MqpA==
X-Gm-Message-State: AOAM530qhs1bBSAhwuZI3PLNaMPmqZAhx08B0txOfdMv9fSubvXiQ8or
 1hcG6cr8jkosd2CoAsvUMbZi1WWjFQQumxSa0Ks=
X-Google-Smtp-Source: ABdhPJxI0qKe3NVPe1tfOSaPe4+PqDQS7vk3FPUyoxY9CZAf/rzGipW5mWyk3eCnPqh1qcKRdmMarw==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8403653wrd.179.1636459934236; 
 Tue, 09 Nov 2021 04:12:14 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id f19sm3227279wmq.34.2021.11.09.04.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:12:13 -0800 (PST)
Subject: Re: [RESEND PATCH v9 00/28] Add LoongArch linux-user emulation support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcf00c11-581d-feb3-f97d-497127ccd9aa@linaro.org>
Date: Tue, 9 Nov 2021 13:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/8/21 4:07 AM, Song Gao wrote:
> Patches need review:
>    * 0002-target-loongarch-Add-core-definition.patch

Why are you listing a patch to which I have given review, and you have in fact picked up?

>    * 0028-linux-user-host-loongarch64-Populate-host_signal.h.patch

Likewise.

That said, the final two patches belong to Wang Xuerui's tcg/loongarch64 patch set, and 
have no bearing on compiling target/loongarch64.

Aside from the disassembler, I think the target/loongarch64 parts of this are in good shape.

We cannot include the linux-user/loongarch64 parts until the kernel patches are upstream. 
  I hope that can make progress during the next qemu development cycle so that this code 
can be included in qemu 7.0.


r~

