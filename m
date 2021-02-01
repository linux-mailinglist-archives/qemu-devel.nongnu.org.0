Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9530AE11
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:39:02 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dAC-0004A2-Ub
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6d9D-0003T3-W2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:38:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6d99-00016h-Rp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:37:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c4so14818201wru.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+/N4KgN5C2monjE5twfqaeTpOba08XYKc+5/16GV+SA=;
 b=jFPHDIHoSoM/6p0pc3TfyjxWVOA/WyRLnxnUphvxcbQYPweRT0GBKeytGG3iOROjGU
 /hibUUkX5IPCmuzE1TyFDUQ3zFUFKnEwLCVRklQxBhfgcj80m5wXEcb68+cyHBoofRbZ
 7ZkS+nX+ttr9YaFAr5gBfz81CEBDkK/II5vx9QNirKTJStvbGn0Dzf9WulDEd6B/lA9a
 X+yGwnaj8d4vLi5Xbv3sub5OnRumdu/BNsW8GdVOhfPFD7J9Aole4CGV6ziz7yP8IBkj
 Xcz6RRtQ2euGC25jboYXM33MwCbJFW7/yPBM2h/WeBRSo0CYpqJV428OV+qd3LeDK3x6
 x27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+/N4KgN5C2monjE5twfqaeTpOba08XYKc+5/16GV+SA=;
 b=Jc6MdWqK1IRRgD6kbCAE0ncm4cGqpfJ38f18z45vlCORMyMr0zEIS20wXPnawKcSog
 tHhm8bzFDG9Yua6JLHz8Dae0gRhe/xl6n/NoOCB1KHrr1GJ6XFfLy4y9t9m/OxS+FHsd
 hXDNqu66xQtw42yEyWsMTbvx0oUcVmMwzk6HSEGaGp9wRWtaqJx1CqGyBckCaJK1ZF5p
 UTbMuPH1Rp/bavYd0jAZYJsN4msjXut40C1oyNtwRdqT0oCclxV2fj3kfhHc01mkMS+k
 a20bvcvczwenHZdWe8T4evbFMKWnOojrSRLkDdP3qe1CzGi84nlvxDodkNP4+NULX1Ms
 4k/g==
X-Gm-Message-State: AOAM532d9ouQIuFI9XGD8CbmHegdBdWXai8DbmR5/iLayekJRqRRjNcA
 vZd/6V88+wIMzPKxwrpF3yjjOw==
X-Google-Smtp-Source: ABdhPJzJuYH3FM16GowHSyY9NWbraoztT9aumlPZDlqHl1ixDPQE1vRjYRFS6ktS9KgQmKzrW2MYDQ==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr19731450wrd.118.1612201074212; 
 Mon, 01 Feb 2021 09:37:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d30sm30226980wrc.92.2021.02.01.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 09:37:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 507551FF7E;
 Mon,  1 Feb 2021 17:37:52 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-7-f4bug@amsat.org>
 <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to
 TCG accel
Date: Mon, 01 Feb 2021 17:37:22 +0000
In-reply-to: <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
Message-ID: <874kivvgcv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/31/21 12:50 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> KVM requires the target cpu to be at least ARMv8 architecture
>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>=20
>> Beside, KVM only supports A-profile, thus won't be able to run
>> R-profile cpus.
>>=20
>> Only enable the following ARMv7 R-Profile CPUs when TCG is available:
>>=20
>>   - Cortex-R5
>>   - Cortex-R5F
>>=20
>> The following machine is no more built when TCG is disabled:
>>=20
>>   - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5=
Fs
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  default-configs/devices/aarch64-softmmu.mak | 1 -
>>  hw/arm/Kconfig                              | 2 ++
>>  target/arm/Kconfig                          | 4 ++++
>>  3 files changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-confi=
gs/devices/aarch64-softmmu.mak
>> index 958b1e08e40..a4202f56817 100644
>> --- a/default-configs/devices/aarch64-softmmu.mak
>> +++ b/default-configs/devices/aarch64-softmmu.mak
>> @@ -3,6 +3,5 @@
>>  # We support all the 32 bit boards so need all their config
>>  include arm-softmmu.mak
>>=20=20
>> -CONFIG_XLNX_ZYNQMP_ARM=3Dy
>>  CONFIG_XLNX_VERSAL=3Dy
>>  CONFIG_SBSA_REF=3Dy
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 6c4bce4d637..4baf1f97694 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -360,8 +360,10 @@ config STM32F405_SOC
>>=20=20
>>  config XLNX_ZYNQMP_ARM
>>      bool
>> +    default y if TCG && ARM
>
> The correct line is:
>
>       "default y if TCG && AARCH64"

Ahh yes, TIL we had some R-profile cores in QEMU ;-)

with the fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

