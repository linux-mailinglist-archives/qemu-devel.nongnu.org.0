Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1896309D7F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 16:26:15 +0100 (CET)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6EcA-0002d6-3i
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 10:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EZH-0001Ih-4Y; Sun, 31 Jan 2021 10:23:15 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EZF-0002UW-Bh; Sun, 31 Jan 2021 10:23:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id p15so13828202wrq.8;
 Sun, 31 Jan 2021 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IlBA0xV68vxE5C5ct9JiYhm7IT1MEObF+rNNEQCxzM0=;
 b=N5QC32NJIPcvAJL62qyOJJi0CIMn/+eeOANJ4J366IyF2swlJQ+5aQAUbonTlT+mcf
 nFwxHWPoie6wSea1rMXw/484Wgntbb/3VdCOSV4sGPcaOWhUf80ExpfModyzg3zXnu1u
 KrERVi3EUYzhXajfTyzrzKP51iDg6VZC15U5XRy/UswLTmkdy3uigI0wzn4zO0dvGCdI
 zkYCqJxeTx0yjOtzYD+fcX3wtCeJdQRLpY0aKXJWa98YusX/QhrRzuWJQJzKcK+wR9/c
 /qtWr2q1nJKM+0awFprD8S5YnhkV2C+UwIiMCL76XMZc30X/KsAmk8ydVDFqsSGnQ7UA
 AFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IlBA0xV68vxE5C5ct9JiYhm7IT1MEObF+rNNEQCxzM0=;
 b=Rg8FKNnCcFNX/EXu1BMclBJcJQTEgbVgKJxsabk3SZsI3P3fCLGOpjpEGNQJPC3zbk
 SLY/dTA7DF6haiiqH2bVdOD3VZ8IAwPjX2s9ze8ErgO0ksHi2wn8o1UFwNeYnqBBjMUh
 Vj7oe2HsPluInGsoAeQb5efi3Mvn9nregFj1rKMIQ59i3QEeqDh1km4TnS49cs/1+6Y/
 Of1+co5kee6mIlQhtNFleX5Ts2ty0AysPAGyaMX9aEGHGs+tkSgcAmGijlZq5GPbCD/d
 sW9tVuShpXxtrJBbTwfroRe4GXDcdUBZlDiKGcf0IRTsdxt6Im0/jzsxpZ7mYixQIZGl
 A7Hg==
X-Gm-Message-State: AOAM530toJUmlry7wO20OWJQOdq9qftgBKcSL25jrwFN+GikYVmy3jyO
 wVpjHQyf3el3L+QV9KWQp4I=
X-Google-Smtp-Source: ABdhPJwtjiQDaBDfckhvRQWpQImJ+jTDy28yTiQVjN19SY0g2CmQtFk7CetPl883mcXCmJ3WhY806g==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr13517477wrn.223.1612106591243; 
 Sun, 31 Jan 2021 07:23:11 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l7sm18733011wmg.41.2021.01.31.07.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:23:10 -0800 (PST)
Subject: Re: [PATCH v6 00/11] Support disabling TCG on ARM (part 2)
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
 <9924223e-3aeb-5200-c7fa-f120a7ae30fe@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9e3503ce-0d01-8958-9f36-6892dfe80e93@amsat.org>
Date: Sun, 31 Jan 2021 16:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9924223e-3aeb-5200-c7fa-f120a7ae30fe@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 3:40 PM, Claudio Fontana wrote:
> On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
>> Cover from Samuel Ortiz from (part 1) [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. [...]
>>
>>   The rationale behind this work comes from the NEMU project where
>>   we're trying to only support x86 and ARM 64-bit architectures,
>>   without including the TCG code base. We can only do so if we can
>>   build and run ARM binaries with TCG disabled.
>>
>> Peter mentioned in v5 [6] that since 32-bit host has been removed,
>> we have to remove v7 targets. This is not done in this series, as
>> linking succeeds, and there is enough material to review (no need
>> to spend time on that extra patch if the current approach is not
>> accepted).
>>
>> CI: https://gitlab.com/philmd/qemu/-/pipelines/249272441
>>
>> v6:
>> - rebased on "target/arm/Kconfig" series
>> - introduce/use tcg_builtin() for realview machines
>>
>> v5:
>> - addressed Paolo/Richard/Thomas review comments from v4 [5].
>>
>> v4 almost 2 years later... [2]:
>> - Rebased on Meson
>> - Addressed Richard review comments
>> - Addressed Claudio review comments
>>
>> v3 almost 18 months later [3]:
>> - Rebased
>> - Addressed Thomas review comments
>> - Added Travis-CI job to keep building --disable-tcg on ARM
>>
>> v2 [4]:
>> - Addressed review comments from Richard and Thomas from v1 [1]
>>
>> Regards,
>>
>> Phil.
>>
>> [1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
>> [4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html
>> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html
>> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html
>>
>> Based-on: <20210131111316.232778-1-f4bug@amsat.org>
>>           "target: Provide target-specific Kconfig"
>>
>> Philippe Mathieu-Daudé (9):
>>   sysemu/tcg: Introduce tcg_builtin() helper
>>   exec: Restrict TCG specific headers
>>   target/arm: Restrict ARMv4 cpus to TCG accel
>>   target/arm: Restrict ARMv5 cpus to TCG accel
>>   target/arm: Restrict ARMv6 cpus to TCG accel
>>   target/arm: Restrict ARMv7 R-profile cpus to TCG accel
>>   target/arm: Restrict ARMv7 M-profile cpus to TCG accel
>>   target/arm: Reorder meson.build rules
>>   .travis.yml: Add a KVM-only Aarch64 job
>>
>> Samuel Ortiz (1):
>>   target/arm: Do not build TCG objects when TCG is off
>>
>> Thomas Huth (1):
>>   target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
>>
>>  default-configs/devices/aarch64-softmmu.mak |  1 -
>>  default-configs/devices/arm-softmmu.mak     | 27 --------
>>  include/exec/helper-proto.h                 |  2 +
>>  include/sysemu/tcg.h                        |  2 +
>>  target/arm/cpu.h                            | 12 ----
>>  hw/arm/realview.c                           |  7 +-
>>  target/arm/cpu_tcg.c                        |  4 +-
>>  target/arm/helper.c                         |  7 --
>>  target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++
>>  tests/qtest/cdrom-test.c                    |  6 +-
>>  .travis.yml                                 | 32 +++++++++
>>  hw/arm/Kconfig                              | 38 +++++++++++
>>  target/arm/Kconfig                          | 17 +++++
>>  target/arm/meson.build                      | 28 +++++---
>>  14 files changed, 196 insertions(+), 60 deletions(-)
>>  create mode 100644 target/arm/m_helper-stub.c
>>
> 
> Looking at this series, just my 2 cents on how I would suggest to go forward:
> I could again split my series in two parts, with only the TCG Ops in the first part.
> 
> Then this series could be merged, enabling --disable-tcg for ARM,
> 
> then I could extend the second part of my series to include ARM as well.
> 
> Wdyt? (Probably Richard?)

¯\_(ツ)_/¯

I respun because Richard unqueue your series, and it looks
there is no big clashing.

Anyhow meanwhile peer review is useful, and thanks for yours ;)

> 
> Thanks,
> 
> Claudio
> 
> 
> 
> 

