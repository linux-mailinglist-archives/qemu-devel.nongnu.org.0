Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22128370E0F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:50:40 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFIl-0008Ga-74
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldEzv-0003Zg-A3
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:31:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldEzt-0003GG-4b
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:31:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n16so1450337plf.7
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3zBz/9rdoMLCXOcO7/aNngWVdi3ezVzH/VwgPhxsp6g=;
 b=Tni7W2fi+ofBtq9zY6uv1oHruBQAu9vqT6+Orq93G3QhsYbsT1iZlWent0kNoLxFbB
 lvM7cDQ3w1tFtQnDCp0fWDDXUEtFtkxrl79imwSOCqKsu1PT5xyDz/vq71O1+YeX0lwl
 ArX/tZOQBMm+XTgpOVxsbis9usDkJmYZu2X1adzg6axyl+/5zL7RqlKHWgzeSb0KuYhE
 5fH0LhX7B9QNuk9S5kCtOSRKzVtxP+/UJxLnKPVAvHXwv1QJHvjPM2Y4X+JiGSYMtHg5
 FsIIc+Ux1qzgtcnWyMlS6GzHRAW6ztIzviqR7lz0Cx22sfaE7WgmqKAEPfRcMMthaR8y
 MJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3zBz/9rdoMLCXOcO7/aNngWVdi3ezVzH/VwgPhxsp6g=;
 b=PZSyZKjVAgjGzEZaZ5Vy93SuDQKd4OMouSQxohjVeCLvl3pwAag6v4JMn1rKKZbe3h
 tN2O7OAYm2+wcttCcnGCllsRp3E5qwLp5iGPJNdfBjRIoHLxYlbJqJX2jgcmj4AiDO4o
 McJSolL/8M/zWhgOZEXnu8dUuGhiKKsaSxAWRw1qdMwjyfQF/rhb+EcppRhcLqjADEsY
 6hP45/cUIEQhUD8feaxT/0zvcODBOhwzeveqOp4rjM9FjeoYGqWUkYW65Pj/JWm1G7CI
 SUxlQXO27M9ThNzlrQuI9nllvaZv55ZT3vgTM9zusa4Y/LkXMIBvgZZGsel8544pwtjN
 EtAg==
X-Gm-Message-State: AOAM5300cp+GWEzSS7Ds662WHIno9dLXS7tlSFWup8chgqUg1DVAwzDG
 buROUIVlU/mgQe9H3qaDwUY/vA==
X-Google-Smtp-Source: ABdhPJzgMDW6wQb3Tkw0WIABw4Vz8tDMALbhCsA6OnYqwMyDeLOoUSdNUqpA7ySvrj+ZZr5TDMEmTA==
X-Received: by 2002:a17:90a:af91:: with SMTP id
 w17mr26374693pjq.205.1619973066790; 
 Sun, 02 May 2021 09:31:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id v2sm7590542pgs.19.2021.05.02.09.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:31:06 -0700 (PDT)
Subject: Re: [PATCH 0/2] exec: Cover gen-icount.h in MAINTAINERS, add missing
 exec-all.h header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422064128.2318616-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af351aa1-a093-8724-8a68-a2d11a2a4b97@linaro.org>
Date: Sun, 2 May 2021 09:31:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422064128.2318616-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 11:41 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>    MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop' section
>    exec/gen-icount.h: Add missing "exec/exec-all.h" include

Queued, thanks.

r~

