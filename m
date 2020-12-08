Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949922D2B8A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:00:12 +0100 (CET)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcbD-0002gb-L5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcYx-000276-IO; Tue, 08 Dec 2020 07:57:52 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcYe-00018S-66; Tue, 08 Dec 2020 07:57:51 -0500
Received: by mail-ed1-x541.google.com with SMTP id h16so6153231edt.7;
 Tue, 08 Dec 2020 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RsToOGNSMKc+SW7eFn7Un/eXtDFMLk5aKj1iaigx1+g=;
 b=Tuv33gy9TPnO4bHq5CFNKuSK7CQVF9C7HiZ5wNrLuzm2oGWutu96zW1YjdxqvUz0o+
 0vyo/hH56kOLCilca56/JGDdO1X8d7XV93SdwdKc70jB5QAXcxHI0CpFTp4IcHhkkmya
 ebQRgcHdPeJ4wwdi3prnCeW8VfA5WKOCAQ3N10CPGdjxcABwGOeSLwh0t3EGWzUGYoVy
 ZgtLj9cUDPkRQhOhc7+NiDoNsvrY4gkJ7IpahjKOHIsvDmWuaumDeITbgWVHy8vBI6jk
 rIgnMd5o3/mw/n03M0hjedvNkB16PDjTB2Ch4X74FiyV322Knd9FXV5mkr5+aTaXq0zh
 Y+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RsToOGNSMKc+SW7eFn7Un/eXtDFMLk5aKj1iaigx1+g=;
 b=D1G+csRlc67ouUkny/tKomxVs3F6YrdVFgWEQ44shqGsB2R8xZKebjslL6Y2My2jmg
 0sYDkP6yKSS5n1mEPnv7hnAfzuRvrAxBXdRzZ66NdIHj7G5y+5J1qL8yondZZJ2wWtqx
 n9vvpgtIIb4ezxmiXfCkjgcShAo3QUjvWYQnmt1C5PaBtsKRIT4HP42og9DOlRlxTFye
 d97KVeEVAzJHmzL+rbeviXP3OxGLZBd+J5aLZWO8hSvwnUqNUQ/SfAZaR7DIPBFhwpkO
 5lDcF3hYGqJnmqeRu3ct0z7kKGPEY4BWPJu5RNcUAhx2i/9fsF6sN9kshH9KnWHMkiur
 kOyQ==
X-Gm-Message-State: AOAM532Kg/7BVF9BjUytnDiArm2p6evWhZrWhMKs4Wol2CmNb7HHmsgJ
 5SZ1aaUpqggNrglV1ydBj3v2/fMn8qQ=
X-Google-Smtp-Source: ABdhPJxr6ZJMk9skgE2jLtL7y28MRv4+qodNhYYCM5EhnhhTHcnycnl5tMLW9v04egEiFgqEoLqsQg==
X-Received: by 2002:aa7:cb0e:: with SMTP id s14mr16384165edt.122.1607432249166; 
 Tue, 08 Dec 2020 04:57:29 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id t26sm15584388eji.22.2020.12.08.04.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 04:57:28 -0800 (PST)
Subject: Re: [PATCH 2/5] target/arm: make ARMCPU.clidr 64-bit
To: Leif Lindholm <leif@nuviainc.com>, qemu-arm@nongnu.org
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-3-leif@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5f4c4ac-8b41-58ca-7e59-550bf5ac0281@amsat.org>
Date: Tue, 8 Dec 2020 13:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208122306.8933-3-leif@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 1:23 PM, Leif Lindholm wrote:
> The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
> 32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
> Extend the clidr field to be able to hold this context.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

