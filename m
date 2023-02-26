Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627046A344E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 22:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWOuD-0007b7-Tb; Sun, 26 Feb 2023 16:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWOuB-0007ap-89
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 16:50:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWOu9-0000nS-7r
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 16:50:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id p16so3094562wmq.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5YgHt+Jvr9/26xPahxgwytEvqsWmdlbHjdKBanwHPo=;
 b=QWaQZMYjvfC583OnRu6NnQLzYFlVjCYPNsTl/JNh+POUFDpbqgpUVmAvjn2Dctb3BO
 87u1bgrXUvu/FJX+y2rMo8xeoYdQDA6ojJfA7d+9QGc64kYnvXZdEW6OwgYicCBdMUFG
 s1sW4php071n9U/cwK+rYlXqk5t4hSgVT2PfNZHsv8ZndCwY5d8QWqm2edE+nBbXAii5
 5Un25e5WT0tnZ3obB7CCOBiUDH9URKid63XSeID8peRS87zMsre0L8BreBDTtGC1CKZA
 Su+fQGHpqIUQOJTLD5v7dK9Xan8Dm00b3xlw9SO3hNlPczyhqS+4ke9UJ7ZYtvS/EqBR
 qg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5YgHt+Jvr9/26xPahxgwytEvqsWmdlbHjdKBanwHPo=;
 b=Uq8Codv0d9lWTpSrxi8pAnh+Bk8gBnp9ldFYDMKmqqLYjXaSaFbvrSaCy6JV8QiCBm
 PTdGC1YSmgC7fpgVmJ+lqYIBl15eS8lYoqwouEl5EyqyDStVHk3/1dZn51K5EpsjK2nN
 ZAH1qgigjfzH7sV+KlHhpXNiMk3OqCxhU6tcij6kyMW3aACOIY8z0fXt0Xp0G82s8G4f
 4ZL9OplYHGWDLUtzwG15xXM20GpqIzHMLKepAMR1WaKGHLkHRVyJ1jjY5HA66niDD62m
 zNor2taNOO/Pmb3jnsgrg1pRm1VYc75Y3/sLLIQ6Kk4BfHAXBEIlE8yZQbeXeMBgyCUH
 5nbA==
X-Gm-Message-State: AO0yUKUp78zS8kPsn1WQSNXOJyIEl/jdqAKH3Bqm8Ab0D7onKgHsfH4W
 HRUouuqr2YQFrkxeHlYs2nG80Q==
X-Google-Smtp-Source: AK7set8kAUOfwxUGPuE4PGdkdbOSVaDoyR5bxIsCcxVDLz0ek+uMFVLwc3g//qODVEjA3ETQL/MUaA==
X-Received: by 2002:a05:600c:746:b0:3eb:38e6:f652 with SMTP id
 j6-20020a05600c074600b003eb38e6f652mr4653861wmn.13.1677448198156; 
 Sun, 26 Feb 2023 13:49:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c441a00b003e21638c0edsm7101430wmn.45.2023.02.26.13.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 13:49:57 -0800 (PST)
Message-ID: <dada6e29-e65c-ec19-2b21-68823f13c9ff@linaro.org>
Date: Sun, 26 Feb 2023 22:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v6 0/5] dump: Make most of it target agnostic (build once)
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230225094903.53167-1-philmd@linaro.org>
 <CAMxuvazgMMtduim4rHPO__VteFJTa2BKtRd4Vg9i+01uKLed1A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAMxuvazgMMtduim4rHPO__VteFJTa2BKtRd4Vg9i+01uKLed1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/2/23 13:39, Marc-André Lureau wrote:

>     Philippe Mathieu-Daudé (5):
>        dump: Replace tswapN() -> cpu_to_dumpN()
>        dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
>        dump: Clean included headers
>        dump: Simplify compiling win_dump.o by introducing
>          win_dump_available()
>        dump: Add create_win_dump() stub for non-x86 targets

> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com 
> <mailto:marcandre.lureau@redhat.com>>
> 

Thanks, I'm going to queue this series with various qdev cleanups.

