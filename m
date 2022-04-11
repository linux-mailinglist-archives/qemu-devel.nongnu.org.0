Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09674FC425
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 20:33:51 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndyrG-00033v-M7
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 14:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndyof-000211-8E
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:31:09 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndyoY-00030B-Ke
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:31:08 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ll10so7634270pjb.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8KqR+wJoyDIpnPBc9cCQg8EyOH0SzXZ/VZjiz/N2330=;
 b=rTklHopX5JZoyLWyzv14NgfgZyvVvAEnTXsIOOlBXy02KDLodfYOTBBl3otLXVpzIu
 IjvuYRZQI+viQcOeMn2XOpOllQgStxwi7lzdE+54pIQgzUvr4bHA7zsBQGOWXgkbocVx
 hMUPygs95k65qIeXeNfKDIhCOIq5soH83X/7YmVbW9ZIfYvQNt+/WEzlXeUng7XMOtFS
 /rGp+qr9Me2f0p14gVceZ5/98wF7bCSFt1/WFuve0g6Qu9L6c/lkG32Jyzdz8Ob6+5m+
 Sbo7Y7gc/NPHaMOowOa+/UL6fw+lbsQOeTWwmUDFkzT9ZE8s4umieDQ7V3XArCDplyT9
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8KqR+wJoyDIpnPBc9cCQg8EyOH0SzXZ/VZjiz/N2330=;
 b=gc08S80Xn4a0i1EozB7LpYuO7crDPjNd5DUJNNJywU2QWBhkrrxFHFBWh+rx3aozPe
 pTO/+Ep3R7G+DU9lSgT3rzwzkUaO8P2KDPu+41mo3TU1p3PRB5hgyVuBAYiTA09W99xr
 CgBOiOW5jEZJ64S2zIiVDxdUAJ1aOPqSGYv6mhHkKF2jyebVVQez8sYv5CGEK6QrZ4av
 nJbF84MJWd+Dp3Aph3rIZit4X4/VYUoh7NE8Ecx2TxM3omm1blNUm0iml0rAc+yUZM+b
 Fa0zcnCEip5dbObQ1WOYM2cjxuSO8WK9VsvPbPkqLOE+tnpV9bxyeL3vweXAs2Grg8iG
 oOyg==
X-Gm-Message-State: AOAM531gT3gEuj4FRXA0MNwhUDImKMDRiaDdNxIqOdF1dRE6mypMnNU+
 97LPSkQq1c3PsjYaankelAML0Q==
X-Google-Smtp-Source: ABdhPJwXkEKR468xkoKDs6vhziSfQKrKAuh7SvkdF8E92p2tVxGfyktp2EQ0CPRSSBm2jT0itqhB7g==
X-Received: by 2002:a17:90b:1c8b:b0:1ca:1ff6:607b with SMTP id
 oo11-20020a17090b1c8b00b001ca1ff6607bmr553450pjb.244.1649701860171; 
 Mon, 11 Apr 2022 11:31:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 ga1-20020a17090b038100b001cac85761e5sm167477pjb.50.2022.04.11.11.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 11:30:59 -0700 (PDT)
Message-ID: <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
Date: Mon, 11 Apr 2022 11:30:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] target/arm: Define cortex-a76
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-7-richard.henderson@linaro.org>
 <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 11:09, Peter Maydell wrote:
>> +    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;
> 
> This has the GIC field clear. On the one hand this is true
> also of all our other CPU implementations. On the other hand
> if we wire up a GICv3 in the board code then we will be
> presenting the GIC CPU interface registers, which is what this
> ID register field is supposed to be telling software.
> I guess we should handle this by having gicv3_init_cpuif()
> arrange for the ID field to be set. Which is mildly painful,
> because that will mean the value for the cpreg isn't constant.

We already handle this via id_aa64pfr0_read().

>> +    cpu->isar.id_pfr1  = 0x10010000;
> 
> Here you have set the GIC field. We should at least be consistent :-)

Oops.  :-)  We have id_pfr1_read() for that as well.

>> +    cpu->midr = 0x413fd0b1;
> 
> This is r3p1; the r4p1 TRM is available so we might as
> well claim to be that.

Ok.

> Missing (just cross-checking what other CPUs are setting):
>    cpu->revidr
>    cpu->reset_fpsid
>    cpu->id_afr0

revidr and id_afr0 are 0 -- explicit zero required?  We certainly assume we begin with 
zero for other registers for other cpus...

FPSID is deprecated, and not mentioned in the a76 or n1 specs.  Presumably this is because 
it is not accessible at all: FPSID is not accessible from EL0 for VFPv3, and the A76 does 
not support aa32 at other than EL0.

>    cpu->isar.dbgdidr

"If EL1 cannot use AArch32 then the implementation of this register is OPTIONAL and 
deprecated."


r~

