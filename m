Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26E4AE527
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:03:19 +0100 (CET)
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZW2-0000FZ-7t
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZTG-0006tY-K0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:00:27 -0500
Received: from [2607:f8b0:4864:20::62b] (port=36720
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZTC-0000qh-LR
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:00:25 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x3so629692pll.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UyIHhgA2d3HbDHUhHIW6N1dWut2OXN/1qYL4lq0XmJc=;
 b=wAibGe54imtyVxsEs4V+G5DRnVZwj42H9BPvmI6s2S0nD5KOYhlv4FGi9/ws/iyjPi
 SgqBiZ0w8TM/YJ342NobuJc7KlASGPhRWDd3asDB5mhEmCKriThDHTPk76R9mU/Z8QKK
 Z+9t0AuXF+NaMsU/DMIFkV1HFziXFolwiLfmAFCLVqUT1GaY6nUEsgqVm3cL3Y/ZviZy
 JCNzYuNsMJ7WtrSMeq85rCSi0ptHYpH5PiHydH1UjZDiqdP/CF/DdHKdoxKrWadA9ZEG
 ypiApnrRqxzjJ16xp14cwLhFPTrQTnawuAdUWgZpAp5hKakWqxfOcmaF+SOsPHeg3lEz
 O0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UyIHhgA2d3HbDHUhHIW6N1dWut2OXN/1qYL4lq0XmJc=;
 b=AxapapTg/HnOLsjkrunz17Ytqi+DQlNXA/Om9wrdbcYpUAaGCTQ6Xp1KXUqI2I/oQm
 a0+njyfzNAMY/+t2Vc/S6NIdDYo76kxWTrQ7Y+RGI2aqVQxpk344SYvIU2tsTqXGZPbj
 rXwec9G3V8A0XrNgSqG7d9++D5ZZdachidsNxIFpHCaULkvFmghIIvOTuEpmDb2uhQpD
 /FZAiS1YP6kB6N29UhO3GjN9Hkr/Nw13SBNzAwNcPN2dLIR+fzzH+nRnJAwmRlh4P6a3
 X0gD14417GSo5IO1vAe6uBJ6Pyd3/fFqGV7pq4fhNPdrku5bf29D4H29+GrwSvn0THti
 cB7Q==
X-Gm-Message-State: AOAM533AEhksZDUobb4vKP+DaWld9NP5KhJTS9Vw76EG2u3zLGR9fl2V
 4Vtb7Mcpgnn+sQB1V8yoOpMv9A==
X-Google-Smtp-Source: ABdhPJwzpxFVpqnUKPLIj0WG1d7C2SO3pCLq8ClkRpm/TGab0o+XGGFqPIum4rcZP0zuX+raXdUJUA==
X-Received: by 2002:a17:902:8f8a:: with SMTP id
 z10mr6460490plo.59.1644361216376; 
 Tue, 08 Feb 2022 15:00:16 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id y8sm12377385pgs.31.2022.02.08.15.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:00:15 -0800 (PST)
Message-ID: <fb446c38-a992-0c4a-dd26-10aa8140833f@linaro.org>
Date: Wed, 9 Feb 2022 10:00:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/13] exec: Move translation declarations to
 'translate-all.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-14-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> Translation declarations are only useful to TCG accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Ug.

So, like, what's you vision of exec-all.h vs translate-all.h? Certainly there's not much 
in translate-all.h at the moment. Taking a case at random, what has gdbstub.c got to do 
with "translation" as opposed to "execution"?

I would expect some documetation updates to the top of these headers.  I don't see why 
everything has to move all at once, especially since translate-all.h already includes 
exec-all.h.

I can see that exec-all.h is currently a garbage bag, but I strongly suspect that you're 
moving too much here.


r~

