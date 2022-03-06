Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BFC4CEAF6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:18:00 +0100 (CET)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQotj-0007NQ-Mh
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQooI-0000uJ-In
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:12:22 -0500
Received: from [2607:f8b0:4864:20::436] (port=34622
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQooH-00086D-6N
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:12:22 -0500
Received: by mail-pf1-x436.google.com with SMTP id g1so11419453pfv.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z9lFVzo5SCCVnxH4E1f0v+mGhJkRMrn7P6USrMVRniE=;
 b=Vra3rLEyZlpMpbMscj5Lw687fye85iIEHUuiAIkBHTo/qtxjuhNgzcbDhuq/eOOZJ2
 PkTAYUk8bZRoWXYk7d3P1TnlPwDIxYPnTXRH7ZZ5DHMJBVL2QXD+lfC+dKfrIgYoLjqh
 MQZ8wrCMK1S+CzZfKo3s6Vau7FWtk1gh0bbliiU2xX4wGnP826ZMMDoeBRwfCyFAK5PW
 rgwE/Cbkzle3XYGxufHIS91Qt9NPw5I7O9OfaUdKMX71Odcs8Q6L4isbSyOxicGaIlS7
 nkqlXVK1pAXR/NcuwYPO41zOfpx0wQH/fyTgmodiC9CbJWijybXHiGTmoZT+63bdCD9x
 2dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z9lFVzo5SCCVnxH4E1f0v+mGhJkRMrn7P6USrMVRniE=;
 b=q3DQhO9MXtMIWiTzjpgv/F9kGS8GNoEdU1HP9cpazCQusDLZUUStsSh8uPxmyBXyh3
 Wn8DWTP6g9Ph1yJzgpSrzzHuMMi3wzcxr6LBNLKSYkI2FDiWCfZuu2w5xms6nJd9Eeo1
 n1d1WScXLXtVAqj95FDhcFE2a2AXGKbqYBlrnPFFBwTrqbsd0sQsZzJZhZ1bnx2qoiPQ
 XHocKt4WoeuiCaD+AFuqxLgf1xSpFr+NbPsuWFc8GBFD/F1o8t69K2C286lScvQJNzLL
 pNGgk1V1aRTXqwKEIXfHjWeD0wVPTC6H4/YtLjd/eKKFhve8xu9OtFadaBfVTKUB4XOD
 parQ==
X-Gm-Message-State: AOAM530xsGCeHX/jJYMLbarctrEHOeztIDINmYyMrOnVfwt1rzJcM0W+
 KFdwC8gKybK58ERprFj/SyA1jFUCCos=
X-Google-Smtp-Source: ABdhPJyJHditW+rj1/YYOHTskQ6T/YwVXsXOiPsGyx5RWcWFR74DkiJ3nQhNYVPuaUipcdcsj5uIfQ==
X-Received: by 2002:a05:6a00:244b:b0:4c9:319e:ecb7 with SMTP id
 d11-20020a056a00244b00b004c9319eecb7mr7758034pfj.58.1646565139389; 
 Sun, 06 Mar 2022 03:12:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0010c500b004e1b283a072sm12492278pfu.76.2022.03.06.03.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 03:12:18 -0800 (PST)
Message-ID: <c543869e-812b-6d2f-1fd9-213abb133e03@gmail.com>
Date: Sun, 6 Mar 2022 12:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/14] target: Use ArchCPU & CPUArchState as abstract
 interface to target CPU
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/2/22 19:31, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (13):
>    meson: Display libfdt as disabled when system emulation is disabled
>    hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
>    hw/tricore: Remove unused and incorrect header
>    exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
>    cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h' headers
>    target/i386/cpu: Ensure accelerators set CPU addressble physical bits
>    target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
>    target: Include missing 'cpu.h'
>    target/hexagon: Add missing 'hw/core/cpu.h' include
>    target: Use forward declared type instead of structure type
>    target: Use CPUArchState as interface to target-specific CPU state
>    target: Introduce and use OBJECT_DECLARE_CPU_TYPE() macro
>    target: Use ArchCPU as interface to target CPU
> 
> Taylor Simpson (1):
>    Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE

Since this series is fully reviewed and soft-freeze is soon,
I'm going to send a pull request for this cleanup.
Queuing as 'abstract-arch-cpu'.

