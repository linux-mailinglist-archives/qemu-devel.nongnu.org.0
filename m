Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEAE5711C5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 07:16:50 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB8GO-000669-8D
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 01:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB8CG-0003OH-MN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:12:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB8CF-0005zD-12
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:12:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso6872751pjh.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 22:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iUPxPkRB7DHjJYtMweRvOHG8QaTpmBRW/q2tLHlmkXs=;
 b=d/cbr4ZI4PhyNZa6BbITBJeCcGIgqLLgpq50mv60GUSqDWKxWBRV0cuX5fN3VcLnw7
 vUd0c9elpXE+hrAZLCbVOp1y2LbIrtE/bjc6ekMk0OG4Pu8HQoQSdV91Se+dJXfIIY7/
 uU0dNy/bmQeWo9kOdYSTM6TEJaT4IJJiOTEg8cl+spMDpnMZJgdesNPTe//DO4VO9FUp
 r/qEraz9ejSghQtcFh+wqOpB8anDco5+fR8u1O+GjIRsSvUBemFMBM8Hai+zbNYjXLHB
 Jcw9chSH48yPwIS21pUm2aa7CL4pqinKI50uuiVStNWm62DTzdaEAaBkPgBltgFfwIWb
 BS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iUPxPkRB7DHjJYtMweRvOHG8QaTpmBRW/q2tLHlmkXs=;
 b=6FAD0MKxh0kcpP0s/bgplmVDPSe9HsxBERTx+ppTPkGTt0a3zDCNNkQZFrOojFXsXf
 YIbuJOsyQQPH8t3ww6APJNo1+SxS8mVAiXKwFIlSnl2hqPcgXj3Z9fWP7TzxOyX1Mz0y
 Pt2nJVQUJry2TW4n9MhE0A/a+zugfTanEBncuRnl0sAUxwPe2jBLgXDbyRleexKRhHSh
 SkiGaK92nSL2l1t7q+fl4EE7BFYY7DdDQsGzndQBIJjNh4G0WYoo+cnRlWtXH0SfFy2M
 lercR7ixw1lXB5ZuwhcP/Wl7nsdSFpck57kZ4qs7N/hIm5c3BdAoLk52KgJoq1V2y6OO
 QyNQ==
X-Gm-Message-State: AJIora/buBdvLx5Gy5z/JzfO3vorY+Ge9fOFhPuGiaVkoJd9Ntgi+HgC
 Va7nVPRCjoqAGQl9v7d5EwWcAg==
X-Google-Smtp-Source: AGRyM1sdmnmMoCP6KZM31wyCsjlz/occIQX35KgCsUAcdqJ+2TO7XStf0II3F/9DJZU8yDIQy6tg1w==
X-Received: by 2002:a17:90a:be0c:b0:1ef:accb:23a5 with SMTP id
 a12-20020a17090abe0c00b001efaccb23a5mr2196051pjs.113.1657602749599; 
 Mon, 11 Jul 2022 22:12:29 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1709026ac500b0015f2b3bc97asm5699085plt.13.2022.07.11.22.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 22:12:29 -0700 (PDT)
Message-ID: <dd9d7b97-88c2-f1c3-8b0a-bb090059b180@linaro.org>
Date: Tue, 12 Jul 2022 10:42:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] hw/misc: Add mmio-debug-exit device
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711185640.3558813-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 00:26, Ilya Leoshkevich wrote:
> System tests on x86 use isa-debug-exit device in order to signal
> success or failure to the test runner. Unfortunately it's not easily
> usable on other architectures, since a guest needs to access
> address_space_io, which may not be as straightforward as on x86.
> Also, it requires adding ISA bus, which an architecture might not
> otherwise need.
> 
> Introduce mmio-debug-exit device, which has the same semantics, but is
> triggered by writes to memory.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

You shouldn't need this for s390x, as there are already (at least) two other paths to 
qemu_system_shutdown_request.

E.g. SIGP, which has a stop option.


r~

