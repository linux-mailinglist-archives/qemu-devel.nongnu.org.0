Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA60394EDE
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 03:11:00 +0200 (CEST)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln9yl-0007Vh-Ce
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 21:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln9xK-0006Lt-3x
 for qemu-devel@nongnu.org; Sat, 29 May 2021 21:09:33 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln9x7-0005cF-8y
 for qemu-devel@nongnu.org; Sat, 29 May 2021 21:09:29 -0400
Received: by mail-pf1-x436.google.com with SMTP id p39so6211483pfw.8
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 18:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rClwGroFihgmIk5p6ln6mQGfqi/mNQ7+kzEFEzMlPZE=;
 b=xE1KXOILtF4IRLej/B+VE9RWWI0Yumjht+1ilgxVSBny13U6x2BWRKi3ouprijOQtt
 BQjUb3Gq9SZDhUd78brBrUbva36w+uX4wkfnE30yVrIlPM1XNV6R2YQGTNrcSxie6tBA
 arWKscLIQPeL3imihym8G/e4DkQ2XMGPqgVnRrEnGzOQTbr1kc+VyF/GOr0Duhhv0WG9
 1ImrcZ8incwrSBSf7hnTiFaLaZ+HZ34bcnrRSqDtxVJG1tH+zEz84l085VtFgN6JCLVT
 EovuNsSNXjZbCJZdTj5bkqntY+SLot75Y5oOtuYDEuFpKZLfmG0db6VYiZ0zsbmVGdD0
 6JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rClwGroFihgmIk5p6ln6mQGfqi/mNQ7+kzEFEzMlPZE=;
 b=oiBJaVsY6N+5a4ROCPKfIfVifE2coaQ3YeyPBjJriK6A3FtFsLzPSqJtg+ck/GA0ut
 O2FNHIpjlmpwRsAdMzKuv1fWbzX9Rv2U/7zH8hOGYCoXAbtKW8mKNU+z6/laUNt2eo9x
 HVovu4T3xShcloh198laCB214uSYq8Jh7hYu/j1sMRdKw2JUGSRXBTjUJmes5bXfZBO7
 ZR7yqEVY4+9DlJU7PWDMDa6o5PJ6wCeO+MAweFRREkqZEHUKPnrxg6fEbJqnWR4A89PP
 RJxMxqTWzoM0wi0dFwMLznUEJmd98DlXEQnhjmZT6o5hK9Pq/sqYZQs+Ara79os+D366
 YaPQ==
X-Gm-Message-State: AOAM531ZTJJlXEvGq2b0E4DNrQPcsthnHmD3IusjAn8UoKzRgM3cscgG
 /RTjela06qwS44tl/Mpf4jP46Q==
X-Google-Smtp-Source: ABdhPJxMA3GWB0XPn6nDEMPWAYuwk3MAXZFPLrCzGFJzRc3Ahsw+yvtS5b1VXc83cxBXX4D1/xK4Bg==
X-Received: by 2002:a63:6f8e:: with SMTP id
 k136mr16384846pgc.326.1622336953618; 
 Sat, 29 May 2021 18:09:13 -0700 (PDT)
Received: from [192.168.172.34] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id d5sm344942pfd.115.2021.05.29.18.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 18:09:13 -0700 (PDT)
Subject: Re: [PATCH] docs/devel: Explain in more detail the TB chaining
 mechanisms
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210528123029.143847-1-luis.pires@eldorado.org.br>
 <5690d0be-1e3b-a9f7-060a-8d08d9cd6c35@linaro.org>
 <CP2PR80MB3668626182F8BA3A3E170667DA229@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ca93ebf-ab19-88d9-1b29-1ec73384cbbc@linaro.org>
Date: Sat, 29 May 2021 18:09:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668626182F8BA3A3E170667DA229@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/21 1:15 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> More completely, update the CPU state with any information that has been
>> assumed constant.  For most guests, this is just the PC.  But e.g. for hppa
>> this is both iaoq.f (cip) and iaoq.b (nip).
>>
>> It is very much up to the guest to determine the set of data that is present in
>> cpu_get_tb_cpu_state, and what can be assumed across the break.
> 
> I’m not sure I understand what “assumed constant” means in this context.

The pc of the branch destination is a constant, for instance.
As would be the enabled instruction set (consider arm's blx, which toggles 
between arm and thumb isa).


> Would
> it be fair to say that step 2 should update any CPU state information that is
> required by the main loop to correctly locate and execute the next TB, but not
> anything that would be needed if we were to jump directly from step 1 to the first
> instruction in the next TB without going through the main loop?

The information written in step 2, omitted by step 1, must be inferable from 
cpu_get_tb_cpu_state (via tcg_ops->synchronize_from_tb) and from cpu_restore_state.

One of the two forms is how we return to the main loop after escaping from the 
chain of TB via interrupt or exception, respectively.


r~

