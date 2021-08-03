Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C753DF056
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:32:26 +0200 (CEST)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvSz-0000LO-Ox
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mAvQZ-0006p5-Qe
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:29:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mAvQW-0004WE-Hd
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:29:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id n12so25556830wrr.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1u6HqaD+S/7zzcgUis3rWPi6+PwMjWURSVTw3EyBDzk=;
 b=2Q5SrePKF44CZNKGX2f2FGjFjJtLTGHPSY+nppX/ue4ryiuvVugEzfuGjDlPdmjvhX
 mXqQJGKkaxwK7GmNKwX1ejdeWRXxyYfRTKgZD2QANODZaiHKQXXEtYinXiKqVdudQOEn
 vf4Vpe2Tej9jR/y/FWgseFPEKotoiB3a80wsklc3eQ7xz6MJJ9647tTryLRWu6bqf2Gz
 hQ+Tv/Ma/TUrXJmIKuVz295wCgVl0/AgW2glRl6tYZJdJfok1lthSo7Mc1dEFMu6ins8
 Ib4YbHx0P4Kt23WV3q+gRiGlv4ZrvY0DAwMUPSFZ1sTNVd/0aVvcyEOp1tKwlX/GQfU0
 IOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1u6HqaD+S/7zzcgUis3rWPi6+PwMjWURSVTw3EyBDzk=;
 b=Ne/TC4ePf+zqySm/QCUzO6kuinoydyks4wQCj4WA75qarFwJG+KDlmuXGiQkbx46G8
 gWoq18XGDqW4WbEHeqhHjQLhS99KBjX4dDI0MsEX0D2UYDbn6ABHrkJLFQXC5e8ja6fb
 HBNBlGveCFI1NVKvYYBoe65WlTWoT71vZP/c08Mkvobe20l729GKLBfI0356jMYwLiIp
 k4UgjvIKBO/r4NptWUL5mM9ldaHl6zH0TGxoLf+CcJ3ihkuRH//wzZgLdiLlUqNq7YMy
 vQ5wMFwZ2fZhzdEw001cNlYPMS7J+AHbxc1DGipSooMx8liScYY8GN+YC+THJzcXDjdc
 laEg==
X-Gm-Message-State: AOAM532IRMtkUjufoKNW6U7QgPy7CgMAke3KTo3jL6nOTnYEP1WxoS+Q
 MOeLv8rKDG+ZdXbagtC0iwh0Gg==
X-Google-Smtp-Source: ABdhPJzgn42J+lTZrcOnToTYDZKqRh4ufpsFYj2Dl5HxJOo4PYrSQTzAh2HlB/rjFcGrfmQb7vS/Bg==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr23939980wrp.53.1628000990513; 
 Tue, 03 Aug 2021 07:29:50 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id i29sm13595244wmb.20.2021.08.03.07.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:29:49 -0700 (PDT)
Date: Tue, 3 Aug 2021 15:29:47 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
Message-ID: <20210803142947.etblpkgynnna3mvf@leviathan>
References: <20210726163351.32086-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726163351.32086-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 17:33:51 +0100, Peter Maydell wrote:
> If the user provides both a BIOS/firmware image and also a guest
> kernel filename, arm_setup_firmware_boot() will pass the
> kernel image to the firmware via the fw_cfg device. However we
> weren't checking whether there really was a fw_cfg device present,
> and if there wasn't we would crash.
> 
> This crash can be provoked with a command line such as
>  qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> 
> It is currently only possible on the raspi3 machine, because unless
> the machine sets info->firmware_loaded we won't call
> arm_setup_firmware_boot(), and the only machines which set that are:
>  * virt (has a fw-cfg device)
>  * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
>  * raspi3 (crashes)
> 
> But this is an unfortunate beartrap to leave for future machine
> model implementors, so we should handle this situation in boot.c.
> 
> Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> before trying to load files into it, and if it doesn't exist then
> exit with a hopefully helpful error message.
> 
> Because we now handle this check in a machine-agnostic way, we
> can remove the check from sbsa-ref.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Leif Lindholm <leif@nuviainc.com>

However, the subject line threw me slightly. How about:?
"Report error if trying to load kernel with no fw_cfg"

> ---
> I didn't reuse exactly the same wording sbsa-ref used to have,
> because the bit about loading an OS from hard disk might not
> apply to all machine types.
> ---
>  hw/arm/boot.c     | 9 +++++++++
>  hw/arm/sbsa-ref.c | 7 -------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d7b059225e6..57efb61ee41 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1243,6 +1243,15 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
>          bool try_decompressing_kernel;
>  
>          fw_cfg = fw_cfg_find();
> +
> +        if (!fw_cfg) {
> +            error_report("This machine type does not support loading both "
> +                         "a guest firmware/BIOS image and a guest kernel at "
> +                         "the same time. You should change your QEMU command "
> +                         "line to specify one or the other, but not both.");
> +            exit(1);
> +        }
> +
>          try_decompressing_kernel = arm_feature(&cpu->env,
>                                                 ARM_FEATURE_AARCH64);
>  
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 43c19b49234..c1629df6031 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -691,13 +691,6 @@ static void sbsa_ref_init(MachineState *machine)
>  
>      firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
>  
> -    if (machine->kernel_filename && firmware_loaded) {
> -        error_report("sbsa-ref: No fw_cfg device on this machine, "
> -                     "so -kernel option is not supported when firmware loaded, "
> -                     "please load OS from hard disk instead");
> -        exit(1);
> -    }
> -
>      /*
>       * This machine has EL3 enabled, external firmware should supply PSCI
>       * implementation, so the QEMU's internal PSCI is disabled.
> -- 
> 2.20.1
> 

