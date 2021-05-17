Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB96383B7D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:40:30 +0200 (CEST)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihED-0003aJ-RY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihA0-0007Ta-9a
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:36:08 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lih9w-000656-M9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:36:08 -0400
Received: by mail-oi1-x229.google.com with SMTP id u144so7195144oie.6
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Gd6Kc2K4mCON5iJ4aAi44SOAf51HJCpnBPr3YUrb+qI=;
 b=X2nNHiRNfPzZOfFj/IBOCjq8ffIqiHAuh5nikD3wLU1+xCuxowFYKskUpV2D3nALh7
 m7Qk9p1vUZdQ9MH0kH9jOV2upyH5nZQXrKxqjwtVInWfDMJJDTW2bo6E7vkjG0IuUOqo
 NlQqkjrDQTRYrKlzyy8hQyIR38TWanBAyTb35zc33uBs8Oo5OQTQM6onwrbjrXmgheKv
 h7/stqLiWTeqDJE/qIQJpqI0t3/M64WAn7Uc+fOtZDONmvjz/KbkD7kPMJsN1i8qcvCh
 fG8DcVgTOiKIUu5OhTbJqEAujsxecb09S/58uwi1/nDsKv4ixRD1sicWPIenYZIuvcch
 9nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd6Kc2K4mCON5iJ4aAi44SOAf51HJCpnBPr3YUrb+qI=;
 b=tqSJW2wpibOwJLwO0Bs4+KfnDjHimjDR8Dov3HzJU+zpeWeD2pow+K37P/VkA7GO65
 Kwo6oWALbMQrMvhZCSCKIUz/ekYp2XZ5s/5uUk1yng2NN3VmVGvmkJngg0rliQKZUMey
 zLNmCQeMcRER/AX8qe0vEpvHfSHDPZKzSMZS8f6we43EXoZtiOOo0CRAq8Dzm4hGRcY/
 4ILz4bGoF8fRkQOKbUN1/KBpMp87IPpTH+wLI084NZ1ZSjT1hB4qv4UT2NCeeM/JEMl1
 lGxjxUchRyI6+c9rFdtE/2C2BsC8+u3FYHiFuFglz2OcoapuDo6RAtiIC/QSLeBDaBCs
 S5Mg==
X-Gm-Message-State: AOAM533CEsLPma3EFfXU/ahOdC/JZBltcHKKIWR/SDrZzTn+FB37xKIb
 oZr/tz7tmpO0hiH6ghr0S9+f34Vp/kkBcdx0qY0=
X-Google-Smtp-Source: ABdhPJzU/raO9OLHsd7PN4EnIngq/fDhtzTM7GoikWmk88uFjfa+dRW1NKkfxwfR1COebvFYMgUNPw==
X-Received: by 2002:aca:bcc5:: with SMTP id m188mr185522oif.15.1621272963114; 
 Mon, 17 May 2021 10:36:03 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id y13sm3160169oon.32.2021.05.17.10.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:36:02 -0700 (PDT)
Subject: Re: [PATCH v2 07/25] linux-user/sparc: Merge sparc64 target_syscall.h
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
 <20210426025334.1168495-8-richard.henderson@linaro.org>
 <ee3cb591-d5e7-6a19-41f2-cf8bb0e59276@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33ea73ea-704e-3817-d32a-e01b71e4023d@linaro.org>
Date: Mon, 17 May 2021 12:35:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ee3cb591-d5e7-6a19-41f2-cf8bb0e59276@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 5:21 AM, Laurent Vivier wrote:
>> -#define UNAME_MACHINE "sparc"
>> +#ifdef TARGET_SPARC64
>> +# define UNAME_MACHINE "sparc64"
>> +#else
>> +# define UNAME_MACHINE "sparc"
>> +#endif
>>   #define UNAME_MINIMUM_RELEASE "2.6.32"
> 
> Is it intended to have now an uname defined to "sparc64" with sparc32plus?
> (it was "sparc" before this change).

I hadn't noticed before, but AFAICS, the change is correct.


r~

