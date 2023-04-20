Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D506E8E21
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQg4-0000dZ-3W; Thu, 20 Apr 2023 05:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQfz-0000cg-S1
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:34:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQfy-0002rN-A6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:34:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id n31so334833wms.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681983240; x=1684575240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dsFbdoeoUjaqGngsW7Gz+bwcV48TuDbxM49TKqXoUKI=;
 b=kTfU4rBmq68Ou9EgPSYVKU2uD4iD+r4hFZVwxgKq9Avk8ee4V04ibk2tR1xgaxSiM5
 cRL6ARlt/yJMhmPBc6M4QgbGt5tAEdK4l1CtElLFctLdr3v+qxxKpvDQYsVlsdi8D51K
 wqmWJMjqVlHE6JqmI2ZUuDsVRGrFUbBEq8fhdaJvTemaQR+2UTpm6R7Lou6SPCQHWXCX
 5xYGCOt2EmaBGfCAep6yp/BcH7M6HutejbqXTpAZWYvquxom04qp0NddoiyIKF13ks/a
 i/BEPDywTaM8GiAgIw+U6h5yULCVTY6SV9RHEpWLSeTnWVSyMeuz4i3qosveMJCWQ5hR
 ZPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681983240; x=1684575240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dsFbdoeoUjaqGngsW7Gz+bwcV48TuDbxM49TKqXoUKI=;
 b=FVFQpO+4aMm/sH4GO5SH73C1AubdMlEjgmrl03d0Qr05vTeFEjYVaJ20D5ayLZjEJw
 naMphey7/a60ZNKETVgxuKxmh22aNesqNBe4r1Adh5MQFoqRueKCY9tgXt9bzFC9XD3I
 dVDZcb8hQkgPi4NMVBTkIDs4xoQgHYGLvr6PNvOeqmet7zBoQkMgIKAg36ENANybYa30
 H01eMsEuUmg40TAKV+AzwvspsuKS/5YQ2SiJWZ4DTPtXltYq8oFPulcY35/CY0WSYONl
 /AZL/sZdJzo09etbn5Tqr5xg47hZrmNkjMFrRCASZTC+Y0g6MZ02s/6OqV9mcFgQ9IX7
 eDGQ==
X-Gm-Message-State: AAQBX9eTOwQ3iWkuHM2NBhtKe0MZ05gYmlgCdftmNfCAu2sR8P5cDGJ7
 Poz2kInhY66LO7J3Akt8oYh+7A==
X-Google-Smtp-Source: AKy350YEkOt25EJFuLCBLvzdDAQi0dS9JFZjHnCMQbm00u/kgityEkOkAf7Bdhxd+BKQTu/eyGF1QQ==
X-Received: by 2002:a1c:4b1a:0:b0:3f1:8167:dc30 with SMTP id
 y26-20020a1c4b1a000000b003f18167dc30mr876837wma.2.1681983240377; 
 Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003f17b96793dsm4760001wmk.37.2023.04.20.02.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
Message-ID: <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
Date: Thu, 20 Apr 2023 11:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon
 hosts
Content-Language: en-US
To: francesco.cagnin@gmail.com, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
 <20230403191600.43487-3-fcagnin@quarkslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403191600.43487-3-fcagnin@quarkslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Francesco,

On 3/4/23 21:16, francesco.cagnin@gmail.com wrote:
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
> 
> Guests can be debugged through the gdbstub.
> 
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>   accel/hvf/hvf-accel-ops.c | 115 +++++++
>   accel/hvf/hvf-all.c       |  23 ++
>   include/sysemu/hvf.h      |  34 ++
>   include/sysemu/hvf_int.h  |   1 +
>   target/arm/hvf/hvf.c      | 709 +++++++++++++++++++++++++++++++++++++-
>   target/i386/hvf/hvf.c     |  33 ++
>   6 files changed, 913 insertions(+), 2 deletions(-)

Huge patch (hard to digest).

>   static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
>   {
>       AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
> @@ -473,6 +582,12 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
>       ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
>       ops->synchronize_state = hvf_cpu_synchronize_state;
>       ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;

Consider splitting in 3;

1: add registers,

> +    ops->insert_breakpoint = hvf_insert_breakpoint;
> +    ops->remove_breakpoint = hvf_remove_breakpoint;
> +    ops->remove_all_breakpoints = hvf_remove_all_breakpoints;

2: breakpoint handlers (and stubs)

> +    ops->update_guest_debug = hvf_update_guest_debug;
> +    ops->supports_guest_debug = hvf_arch_supports_guest_debug;

3: guest_debug handlers (and stubs).

>   };
>   static const TypeInfo hvf_accel_ops_type = {
>       .name = ACCEL_OPS_NAME("hvf"),

Regards,

Phil.

