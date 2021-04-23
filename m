Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EB368A54
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 03:18:41 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZkSu-00007x-GH
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 21:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkR2-0007th-9y
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:16:44 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkQz-0003mY-Fo
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:16:44 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y62so345276pfg.4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=M3Lw0lUQne+7WlSZFuaG93xSzzfshNbxK4sDm20IwhQAZp4BF8hJ5C4MMCHhLjLvv8
 9jI6309DEIcsKgwyVxkLL5KVzT7do0OyODHC9ooahEAUqa8CAnMtxfF9ulPFnAfmorhz
 p5O+g6IpYRgvLSVkLJ2yTZHpaRpVC06zHv68efvHqpNysWbu/N3IQaIOZD6LstUlxz37
 20BC9X6Ch64VtyfEe6bld7yGO0FmCLMAmg/sCXZarghNQ6bO8HcoepSJDW3K5dOsx7Hn
 Ad9JzNsaqEC2iq9sN6iG2hpzfQ+aQ9HiS5QkaVutYWuEBcNgdZwy45sd/l176g03l1h1
 eFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=fEk6knNj1znkeFFQCjB9xek02n7fYn9QcCCOYjVJDdR1b198Wu0yEvqD8IJwadwRZE
 iTTKwLGnmk9icQzBvSGT0cOEfEHvcYOppTVkpqikP5Vor32Snk9ayVV2Z4tiYiHeSUAr
 Q62SeltVxvWREUWdSWDLDbcJ/FbQiK8wwfPHc2BWsEDgid52eAUtMBV5UpCw/WIQ7lQ3
 xazwV7LxliVihOd0Vg1v0F1dgb7b+T79L62vfnI0PN6zXTjrwd3SbpvuM85A2r3e8aax
 f5JM/OrN1O0oZ2yHJX5Rw2IyA3FOLfhFnCHlIwNnV+LQptNoqE0/m4hGPjuiREc8/koD
 6H3w==
X-Gm-Message-State: AOAM531ivyK31otessAYnlT7zr97Z9jv82aQAR8Q0J5o0odJ7u8c7nmF
 GsiGqrfup8Tr+tXsERmzFAx/CA==
X-Google-Smtp-Source: ABdhPJz3Wf9w+T/8dyk814laKSEVojaBGL+YfzQD3LTcq/vfJiXitDcCA4VerGfCJqP9dIAmW26mNw==
X-Received: by 2002:a63:231c:: with SMTP id j28mr1377352pgj.165.1619140600079; 
 Thu, 22 Apr 2021 18:16:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t21sm2988123pfg.211.2021.04.22.18.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:16:39 -0700 (PDT)
Subject: Re: [PATCH v6 08/18] cpu/{avr, lm32,
 moxie}: Set DeviceClass vmsd field (not CPUClass one)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeaa99ae-da4f-d76d-127e-18a8857de8df@linaro.org>
Date: Thu, 22 Apr 2021 18:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Anthony Green <green@moxielogic.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> avr/lm32/moxie targets, break the migration compatibility and set
> the DeviceClass vmsd field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.c   | 2 +-
>   target/lm32/cpu.c  | 2 +-
>   target/moxie/cpu.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Do you not have to increment the vmstate versions?

Though I can't see how the version numbers would even get compared, since we're 
looking for them in different locations?


r~

