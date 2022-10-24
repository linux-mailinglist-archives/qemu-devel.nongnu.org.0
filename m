Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB660BE36
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6SZ-00053y-NA; Mon, 24 Oct 2022 19:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6S4-0004kW-8k
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:02:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6S0-0004L1-7H
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:01:47 -0400
Received: by mail-pf1-x430.google.com with SMTP id m6so10284801pfb.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7/+UkNSsmpoojmhzrOYLKSOojUhsOTEEGdnVXOWyxLo=;
 b=GXkpqmglzj1fge925ztnxuKwh55RHlHeanMbRQRJJS66F0l6D+MfjuPRKCGpDn4JyD
 6GGxOP4tkpBR6txrvlbM7+zn+5N0Yl79JLg+ICyngRIJIsAOx3PAukTFGBjm/t7AdM4P
 nrqGN9xVLSurusU3DhojZwWRH6wiEl6TMZSdJCTEsVlY3SS2MIXVElRB2+zFX4a0ZLIy
 zAQ93ejoRtXsV4XNfVw7LULtqnOcW7kMfH9MdxILsNMS3xuXbh0p3DVxG4K8N5+cU1sP
 FjgqxJaZsNgWMEi8LVIZ5XEc1+IF3EOaRU35puZ3R9NMMbmiMhprqEspQq6nCW1QbCYA
 sWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/+UkNSsmpoojmhzrOYLKSOojUhsOTEEGdnVXOWyxLo=;
 b=DDHYPp2NaVt3zBIGJ4vRq9oIeU/F2CZOx5NWcK13iW+ELOFxKRcQ0OEG+j7GGmoUbF
 nuo0FlHGuJamS4241AVosbdMMLEGPAlqKIbI3ntAvsqRyHphSKGwOhAG7IVMCvia2G9r
 0/wDlnJsuv1jMgoVIg/kdJUvj7R7km71RhdCVVDFATNHRnUZ3zXstBmeU94GE+Aboh+O
 9qL728wI9YJKh6gOttXVJNLXH3e3f2NL4bORBcgh/pPJiwZFmZaORRdnvsAEAMnt8ZDH
 ghv7HOf/aZkraQizsO69utRULCQ59ZUsYIs/WqOvPXUkNcWbzJfwj7JSnQVCAhdyr2lu
 VxDg==
X-Gm-Message-State: ACrzQf2zlqaovOpNjDDD8CYiOGBVqyyNHsJcw65KfLdo3HmCu2NDVBRg
 33HOhgQS8ZXqWF6HLStUGhuYmw==
X-Google-Smtp-Source: AMsMyM7Q9poSctPg2eavHWY8FnMLtBexgOROzuhiGAj7QCljPtFxq2lLv6IhAdnBzZHG7u2hz7uhmA==
X-Received: by 2002:a05:6a00:1912:b0:564:f6be:11fd with SMTP id
 y18-20020a056a00191200b00564f6be11fdmr34983242pfi.32.1666652501658; 
 Mon, 24 Oct 2022 16:01:41 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 jx13-20020a17090b46cd00b0020d39ffe987sm338027pjb.50.2022.10.24.16.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:01:38 -0700 (PDT)
Message-ID: <92792307-3551-4965-873d-0af4fcd75bb3@linaro.org>
Date: Tue, 25 Oct 2022 09:01:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20221024171909.434818-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221024171909.434818-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 03:19, Alex Bennée wrote:
> This helper intends to ape our other auto-unlocking helpers with
> WITH_QEMU_LOCK_GUARD. The principle difference is the iothread lock
> is often nested needs a little extra book keeping to ensure we don't
> double lock or unlock a lock taken higher up the call chain.
> 
> Convert some of the common routines that follow this pattern to use
> the new wrapper.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/qemu/main-loop.h | 41 ++++++++++++++++++++++++++++++++++++++++
>   hw/core/cpu-common.c     | 10 ++--------
>   util/rcu.c               | 40 ++++++++++++++++-----------------------
>   ui/cocoa.m               | 18 ++++--------------
>   4 files changed, 63 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

