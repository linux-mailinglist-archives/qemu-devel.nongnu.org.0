Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C555078F6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:38:46 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngskP-0005EZ-U7
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngshi-0002mT-EX
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:35:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngshg-0001Nv-TL
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:35:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id bg9so24891566pgb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZYDy/BJNtxcsIfaKwKjSrnrKMNVexDY4WEVPpOjjoR0=;
 b=IMEqwl6f+GKSlLpqdCpOrYRwvSDX2H4A2YrEPXIoVDZJ/llp0UVy5Lf16SIkUkDrKz
 7mcS9IDxzZhfkDnXH9qamdQhBsSgg29mDHL/UESCSy+Zn/sy+QAOSAoe3gQZ8BMLVc9q
 MGpgMeamyxQmKpzB8y0BNP71SP7uxBM4XIYlTAB79WHcoXYymiw1ULzQoVX3OVBURD76
 aOd6FiMfc5W3zEefDa7JD+lYbgXB+8fFaDEMqZBhSlWLZ2EOm6bKcS+C9t8w6TfdOUf2
 8hpXxXc75lOSu5yNB42PH/gAW3qodvs2iZXbrF5fCFr89T4ag9RquHMT68aiLf4wIkCQ
 1a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZYDy/BJNtxcsIfaKwKjSrnrKMNVexDY4WEVPpOjjoR0=;
 b=XuOyXjl0BUEkjgD8SZf0QihdacaZJflKL8vmbKcZCPig5xz+iKxTRN2oo1oaBD2jZG
 k7ffGG415YryOKOoQPwGIkdEwoxC2Nioc8E/eLA9zylVQP7JTp4MzPZo8BihZWc51Q0X
 yKfr0GTwl0wGUnKxGZozbddpsZS62zvM59htCcG9c6WbipC8NzT4+7NZbwLgCaOiN+l0
 OqS1EwD+5pERr9oq68XfKcpDjqQykqRmApCt0Gcde2MIVVENBSA+mqUe3xZhDVMT267Q
 cFRaS7mkzPdCe2+uPNOBvGj4ytMn9SaWrxhpr2mNTaieYXrBKSucVvNul6qIn0tghQH7
 pj7w==
X-Gm-Message-State: AOAM533ox5Yf8HaXUAfDtAanQdBKBlSPAewGB8l78iey5tVXAJ6bxOtY
 wKRVxD2QbklmT8sFRraRi4kbuw==
X-Google-Smtp-Source: ABdhPJy9UbXJD9MbDqPF/AEd88bSn+ldpNfOJcTl4+Adw3GlvD9AJ+91pebkRXdghOdE8QVkITRh6g==
X-Received: by 2002:a65:6e4d:0:b0:39d:a6ce:14dc with SMTP id
 be13-20020a656e4d000000b0039da6ce14dcmr15961083pgb.476.1650393355445; 
 Tue, 19 Apr 2022 11:35:55 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm17130593pfi.172.2022.04.19.11.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:35:54 -0700 (PDT)
Message-ID: <c0e8ce5b-ad73-e3b2-29f4-a6fd787b680c@linaro.org>
Date: Tue, 19 Apr 2022 11:35:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 05/25] tests/docker: remove test targets
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-3-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include         | 20 +-------------------
>   tests/docker/dockerfiles/empty.docker |  8 --------
>   2 files changed, 1 insertion(+), 27 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/empty.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

