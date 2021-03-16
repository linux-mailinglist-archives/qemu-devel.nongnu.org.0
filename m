Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46033D864
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:56:33 +0100 (CET)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC3c-0005TG-5A
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBzG-0001rY-Hw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:52:02 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBzE-00040G-2w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:52:02 -0400
Received: by mail-qk1-x72a.google.com with SMTP id s7so35677089qkg.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUIIJ024tvjt9xLUvTB694f6LgQ00/XZ3b954DSCF5w=;
 b=g/4K8Eord8HHYZcD16H16UtYfKqXE0EX54mVgwc4MltVw9N6bclqJn2oFrBbmSz2c6
 JGLuR4eUuwr+UGHmi7NpafK440C6O9xWOQ27qAHiqGRgB+J9A57Exz+P4K0bHkunSVYa
 IIiT/PaWQw09IHIvPdndYoXzEKdhtIV4DighNwAPnqEXS4anxMTDrgxeMX1RC9K/VYhZ
 fQ/V0PeRBchmShQywhEhK6InqePYV58gW9mPImbrmwjn3aV6c2qFCriXaf1Vp/o34V5k
 zvA74+hgGGdLhy5HeoK25qwkoH6CrXXbqjh07wE7TYoasMUXGhYw6LqZF2W13yRwHzJB
 /Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUIIJ024tvjt9xLUvTB694f6LgQ00/XZ3b954DSCF5w=;
 b=gXi6xZFNOt288sTXkd6LoLmy/m6JRRqEQPKTBBN3v/YqEAilTO/VHx2UfT4m3ZMBa9
 v6V2FLXUcIoBX3PGxU8pamUgUXvs201YwajcziSYJYwY02bLpwhULq3rEeXa2SZLpjTn
 5dhVn/tPXFgN+q4Hz4663bx2VyxJYAw5J+bEUiMfz1/iHvgLSVVqxfxL0YQAKO8ULUOO
 BHlKpEb7zVpmdm7ziN0FCA3UU3Ke6M1sP4lNbcZ7d4mWFKvGN82fYET+C9OJxNOX/kkk
 FXi4SZFI0WFP5RraOzZbBbqAzl5vd/nIJdeN01WiSSKyX3bjvjSXhyVEFLLooefs0QQs
 SnHQ==
X-Gm-Message-State: AOAM5308Ld+itE32SHQ3rS/u/uIHQoys0P77BXHinFXA6mZMlQK2Ysty
 HjFRNSlGytxmvs7NxH40ME0gHBWNe6HzoLr+x/hdmH0sLuKzHd3cKn+kqHGRrBUnpO6I3v0wOdV
 ++g6oNAu39tlc5HQGQLcPgR3jDkkWV4qEBW+ZEzFW/t9Z759K8UswDwkzxomsZU/c36QaWsM=
X-Google-Smtp-Source: ABdhPJyUPV7gU+dRyXS0/+rmoUNkFg/6yXJuP7ENSLiCvA6+8f9DXnoiWOUo2HZV7PMi6Ltvkw4r8w==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr262957qkj.382.1615909918990; 
 Tue, 16 Mar 2021 08:51:58 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id e15sm13966861qtp.58.2021.03.16.08.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:51:58 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
 <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
 <b57d6395-8487-6b1e-f202-856ae13614af@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d40c4ac2-5aa0-ce3b-28bc-1b807b16c64f@nuviainc.com>
Date: Tue, 16 Mar 2021 09:51:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b57d6395-8487-6b1e-f202-856ae13614af@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:09 AM, Richard Henderson wrote:
> On 3/16/21 12:20 AM, Rebecca Cran wrote:
>> On 3/10/21 12:24 PM, Richard Henderson wrote:
>>> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>>
>>>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
>>>
>>> The manual does not explicitly say, but I'm certain that this should 
>>> be a signed address, when regime_has_2_ranges().  Otherwise it would 
>>> be impossible to flush a range of kernel addresses.
>>
>> I see other functions have
>>
>> uint64_t pageaddr = sextract(value...);
>>
>> Would that be sufficient here too, or do we need to check 
>> regime_has_2_ranges()?
> 
> We need to check the regime.

Thanks. I've just sent out a v4 patch, which I hope is closer to being 
correct.

-- 
Rebecca Cran

