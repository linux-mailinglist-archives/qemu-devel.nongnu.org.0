Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BC4CEABB
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:12:05 +0100 (CET)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoo1-0007mP-1w
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQomY-00070t-HN
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:10:34 -0500
Received: from [2607:f8b0:4864:20::1034] (port=40713
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQomX-0007v5-06
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:10:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so4875711pjb.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HhU0TH37D4DGh4VV37a7tH6CInztJjRQepGmsd8NhFk=;
 b=a9W+S0lkqOnv0KJ1OMZ3O/Wqb+uBo6O3BCPEfs6BMf12Godc3EU6J2ZU53dR9Q5l61
 2hkslymC4xVHAy3qBWMJ1jIMCm/dkP7ouNToV2iwH/maLhF6VmMfRksCJF8CrqtpKhfb
 FsfzkZ9RQ2dMV5wis2f4QK9kYrM+NIxh7kXnBaRBMTyL5XLTFiemTUDBAiLZwtqnYitE
 x7EkuIBSzu/7Kd85jBrdy/KaxeGRLrIKebU/Yjs73xQrXQ9vI6nHF/ZRNroxOpzqDiIX
 1Cn3r12ZMCgKxyaFtVuEbfc4ZS84pNHAXUSbFAExgedmyS3F0k3cmNMHP2N2HrJXeCjk
 MEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HhU0TH37D4DGh4VV37a7tH6CInztJjRQepGmsd8NhFk=;
 b=bVNt2GCJ85csOG9k8crECZvE+0OlriOIF6BC37pcOX4WaQaJ9xl0irpWi7uWdui7qR
 i0KmN9Pd26s3UnACgy+b9Gd4+aukbX1OCpkp5fZwBpokGi9OoB/MEFfVIG7rbVLNsJxU
 fKzjXsDW2FU10JcBcyuTuaQ9UY0eXx2CL2adzDsYYawLDw2WRDoOiz+LeDEnv3cPM+Q8
 02GsldH9KeOEhb1eDz0wsFDncwzfFZDwGN6dpVcTGHZ+nOfzHp0RxmmZs4Q0iovEwxUN
 qfHGTEzVHGSCjwsi9F4YVon4w2bJbI6SVo4Dlc1SAQIRgvexWo7vxAB6WiuBqamYa8Kz
 8r4Q==
X-Gm-Message-State: AOAM532AQeQIFNgveedMlp3xZCdDVWoF5fRClhE9x1m+JOgYdGFqoAcO
 OgJGhP/YGdEQRxbeHEq0Ntw=
X-Google-Smtp-Source: ABdhPJxoZxXbMlas4juhyivH4MIFQaSoXVwdIBLYFWaV5fSGsjXGnqYwTCmuLP/rUQrMQhHLqzKrVA==
X-Received: by 2002:a17:902:bc83:b0:14f:d9b7:ab3 with SMTP id
 bb3-20020a170902bc8300b0014fd9b70ab3mr7040428plb.23.1646565031008; 
 Sun, 06 Mar 2022 03:10:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f669806cd9sm12292706pfo.87.2022.03.06.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 03:10:30 -0800 (PST)
Message-ID: <41165fcb-7ef1-3fb4-0655-24642f8fa0e1@gmail.com>
Date: Sun, 6 Mar 2022 12:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 00/21] softmmu: Make various objects target agnostic
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220207075426.81934-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/22 08:54, Philippe Mathieu-Daudé wrote:
> This is a re-org accel/ and softmmu/ to have more target-agnostic
> objects.
> 
> Series fully reviewed. Paolo, Richard, do you want me to send a
> pull request for this and the 'Remove "qemu/log.h"' series?

Since soft-freeze is soon, I'm going to send a pull request for
this cleanup. Queuing as 'abstract-arch-cpu'.

> Philippe Mathieu-Daudé (21):
>    accel: Restrict sysemu stubs to system emulation
>    accel/meson: Only build hw virtualization with system emulation
>    exec: Declare vaddr as a generic target-agnostic type
>    exec: Make cpu_memory_rw_debug() target agnostic
>    sysemu/memory_mapping: Become target-agnostic
>    sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu() target
>      agnostic
>    accel/kvm: Simplify user-mode #ifdef'ry
>    accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
>    softmmu/cpus: Code movement
>    accel: Introduce AccelOpsClass::cpu_thread_is_idle()
>    accel: Introduce AccelOpsClass::cpus_are_resettable()
>    softmmu/globals: Remove unused 'hw/i386/*' headers
>    softmmu/runstate: Clean headers
>    softmmu/physmem: Remove unnecessary include
>    softmmu/cpu-timers: Remove unused 'exec/exec-all.h' header
>    misc: Remove unnecessary "sysemu/cpu-timers.h" include
>    misc: Add missing "sysemu/cpu-timers.h" include
>    exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu() target agnostic
>    exec/cpu: Make address_space_init/reloading_memory_map target agnostic
>    softmmu: Add qemu_init_arch_modules()
>    softmmu: Build target-agnostic objects once

