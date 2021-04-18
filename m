Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44B363788
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:22:06 +0200 (CEST)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDvf-0003Gy-T2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDuR-0002U8-9P
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:20:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDuP-00017W-NZ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:20:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e7so22877286wrs.11
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2YoAYXpLUj0mTF7ivQjLncWpRXjl5q0TuUTp6E2oybw=;
 b=X3ziybwXEdcjLAIbw1nVMNlD3ZRokvBPcC+qLow1ENQkQg0iQs8GrVOIkCQg6SQ8+I
 SvxYRX4nf5OoLRWpc7egAgLbWunL1eqLW3IBysFb/H6FK7nedJp5Vq0gtagbwtmMrfEd
 6AquYpsh9HMdOE7Gk8WKVRQman+U9NQ3m28FOi1Nup8YsRxf6vlmbM8Ey4NrlHIuzuSl
 ItE6FVantrocXfZkjQAj/JtpTxt6SpQaiMX5vT6b7Ab9LYvzS1j2fSx1ghRS9s1ERa1n
 QVg+DjOJlbQtIc2lQsoafMNU/lfcl1lPa44XQqMDgGciKVpT/TUmafplkcG2Jn3W0c4C
 Xmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2YoAYXpLUj0mTF7ivQjLncWpRXjl5q0TuUTp6E2oybw=;
 b=s8ptcmJL+GBXxaC/E600iakrZG/K2xz3Ij9t8xsyuIkupYzFAMpHdCePk7AQRxUoJ1
 OvGcpcaiZtdgM4fWG9RLEGwsUIJLOFAKXrJ7bH6n5GMOyllEi0MspnPw/6gfsPImMXzj
 EY73ol/o3iUAL7KkSXIFDfovRJNpR08lzXYN4363eJcuBckDf+IZJjPj7b6xSrMdQFRx
 8y40Hzhb6GurPePKrj6rIFJwfIE6/M+lZM5KvVachoKPwHWxS7OlMdvXwD/wXgAPr7lI
 mAdeW6/ZyULFV+OD4LfaTylWDRsQZ+hS5DMkXE9LZhZl2ijGKLU0diW0RNLoQJBr8Yvy
 KyrQ==
X-Gm-Message-State: AOAM532+64v3iNZeraNYHrsO1xu0p6bvKZn+81xJNLScaP/52LYwTrhc
 L3ElHhU09aFbQXa+zKbvc7I=
X-Google-Smtp-Source: ABdhPJz7ENTeFJglhhzacnfuNQ3dnl9GKQq4qqlNB1kW9MQT1RHS+CRGfVtJ6qIBn9sZxNDSFRx2vQ==
X-Received: by 2002:adf:e741:: with SMTP id c1mr10503467wrn.49.1618777244301; 
 Sun, 18 Apr 2021 13:20:44 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j12sm19504194wro.29.2021.04.18.13.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:20:43 -0700 (PDT)
Subject: Re: [PATCH 19/26] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-20-f4bug@amsat.org>
 <9ac752b7-8cab-2324-7086-41f1dfe17c85@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <76d990fb-dae3-2a19-ce86-98d172b48c34@amsat.org>
Date: Sun, 18 Apr 2021 22:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9ac752b7-8cab-2324-7086-41f1dfe17c85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:52 PM, Richard Henderson wrote:
> On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
>> Move helper_cache() to tcg/sysemu/special_helper.c.
>>
>> The CACHE opcode is privileged and is not accessible in user
>> emulation. However we get a link failure when restricting the
>> symbol to sysemu. For now, add a stub to satisfy linking, which
>> abort if ever called.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/mips/op_helper.c                 | 35 -------------------------
>>   target/mips/tcg/sysemu/special_helper.c | 33 +++++++++++++++++++++++
>>   target/mips/tcg/user/stubs.c            | 29 ++++++++++++++++++++
>>   target/mips/tcg/user/meson.build        |  1 +
>>   4 files changed, 63 insertions(+), 35 deletions(-)
>>   create mode 100644 target/mips/tcg/user/stubs.c
> 
> You could add a different stub to translate.c instead.  See
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08595.html

Great!

I think STUB_HELPER() belong to include/exec/helper-*.h.

Thanks,

Phil.

