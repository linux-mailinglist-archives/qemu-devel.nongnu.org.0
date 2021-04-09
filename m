Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF7E35A15D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:46:17 +0200 (CEST)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsOm-00018l-RQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsMz-0000VY-BE
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:44:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsMw-0008WB-Es
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:44:24 -0400
Received: by mail-pf1-x42f.google.com with SMTP id n38so4401610pfv.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E/yxntug03GcgYoAnrUCpHsRYrZ+8+4wVlkXFzEW2UY=;
 b=oe4E4RfQsRE8VZvn1gJZYt76S5/gLOSpy7lwHnz7LWBJ2oye5wNJqGnShoimQw550J
 BS1UpoOk8bkJeKrR57/g27p01ZA4MTtLEEb5Ya1zFlyGAGBX2skIeKI5ctB56k3wJ4Kh
 0jFHJJ/vx4qGwwWTBnj9GfwA8szKyKCWxRNfD+3NyZtqyR7bus+tjZAHDfg0JdoG3gjB
 +GGz3FBCaY7r8zakguwuzuGQg1gCNBq3H2NiEW2aTriabPm71hNl/cGquTpv4zn0wts0
 oJrS1ag3xQzqFKd7J+jMNEOt6GfHvOsgamEGP3UGuaFh9PWPZqpy84z4Gdu8DrLBgolK
 034Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E/yxntug03GcgYoAnrUCpHsRYrZ+8+4wVlkXFzEW2UY=;
 b=pDVeZU5eo2Grc4PRWNM5gEuzSoTnPErVBp/cLcoxQwjfMTLPN1cfkoV15bzgDvDobl
 7AdgNL1BrlfAOM4P69e1adn47uVC3aboje5KsRYuD5D5Mdko+dhKHPh0g+V39zy/Nent
 a80XO7w1QTRrJ6yi6upJTyV09fACB+AyM0BhrLSFTF0yUAH3HPUc+CQP6KqTRwQIR0aV
 3p3+QGF7TP6Dua9Czw58jTq2nw4yOpQSfRWIzEFGoUepVi69TQj42C2plk1WZedCRmyl
 bzL4U3mncxh0BwMB4XLnWfHg24tlD0DzPMBT3OHdAD5D8/qr5xLfGTzbJbQGc41tfQBE
 MHCA==
X-Gm-Message-State: AOAM533h6ze7o6mr6BVT+ocaifcg5+lA+/03WgnYVCtNcy8crRqlIlLF
 SyGQ5wxjqnGJMhmlCC3eQcrnUQ==
X-Google-Smtp-Source: ABdhPJzEj+yP6wcoLUM3fckKTyR8EjT0ZfjpuZfhhXV4mCpfleP+gWyeuzN9H5Ld1YsNYEqXKfGFEA==
X-Received: by 2002:a62:6101:0:b029:215:3a48:4e6e with SMTP id
 v1-20020a6261010000b02902153a484e6emr13062959pfb.2.1617979457366; 
 Fri, 09 Apr 2021 07:44:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id fs3sm2305153pjb.30.2021.04.09.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 07:44:16 -0700 (PDT)
Subject: Re: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
 <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f011c7-3485-8630-c622-bf7a4bbf0651@linaro.org>
Date: Fri, 9 Apr 2021 07:44:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 6:10 PM, Vince Del Vecchio wrote:
>> I think we should retain the deprecation until you actually follow through with any of the upstreaming.
>> 
>> You didn't even bother to commit your changes to a code repository -- merely uploaded tarballs.  There have been no posts to the > gcc mailing lists about nanomips.
>> 
>> A mere code dump is not active development.
> 
> Maybe not, but we are in fact actively developing.  :-)

Good to hear.

> The nanoMIPS toolchain we inherited is based on gcc 6.3.  We’ve been working on upgrading to gcc trunk since late February, but it's not a trivial task.  As soon as we're done (hopefully before the summer), we'll propose the changes to the gcc mailing list.

Ouch.  I understand that's a big job rebasing to mainline.

> In sum, we're investing in open source nanoMIPS tools because it's an important technology for us, and QEMU is one of the key projects we want to have nanoMIPS supported in.

Well, hopefully that means you'll have made some progress by late summer, when 
qemu 6.1 is due.


r~

