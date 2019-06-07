Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD238BC1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 15:36:20 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZF2Z-0001pU-PA
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 09:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38181)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZEyA-0007q1-5Z
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZEy8-0001mM-Q7
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:31:46 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZEy8-0001ko-Im
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:31:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so2115774wmf.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 06:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9vhat97mhXZjQ1mDeHUEXD2+NSwu+voNVkuIU2cENj8=;
 b=WAjJLfFCgAG6GWUxgSu62c8LERh+g3DEYIK1fkWP3/IrOTgU4g50lerXA8Ie/J9S51
 RSjoY4ixy6q0NcAd6l8LxWqjdeMf5+4QVRWfIXWFK3IAmFEDOR9xgC7WgXREQiGShtdO
 3UuK1po6OnK9vCK4SDL4QP3cv9+fsIYPPnmTm0nxGCToJOvv+8ZsPpGkkwfGTPYRXu3k
 IML12Zwb9Z1322JCOB9JGHI54MX9e7x6MOSZHqacak2Z2NfqDzb1cE8IECpbNg+y1T0s
 2KhbUZZYEO4EiWH9iwgrrcAwUVmQXlXEHuXmqYcM/xlQV0vAEK+A6FAMFvtXb4eoaxL+
 TWVg==
X-Gm-Message-State: APjAAAU2uGOZPIaF31WK/ZCd8c+3Ft3bkbYy4LgMQh4KTpLka2hGyyKR
 xNX5xRnkfulnuvAOkIFbTc20hyA3Lmc=
X-Google-Smtp-Source: APXvYqy6ctX0yWXNbbuRm7hbhgcwahuwE/lb2KBBQYsogUYICdSMSxR+YnCqoGt4aaS6K+RwItNXYw==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr3529122wmg.177.1559914303358; 
 Fri, 07 Jun 2019 06:31:43 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id l7sm1672326wmh.20.2019.06.07.06.31.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 06:31:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190517174046.11146-1-peter.maydell@linaro.org>
 <20190517174046.11146-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a96d429f-f61e-c550-dc6a-cd08ef4d2d53@redhat.com>
Date: Fri, 7 Jun 2019 15:31:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517174046.11146-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 2/4] target/arm: Allow M-profile CPUs to
 disable the DSP extension via CPU property
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/19 7:40 PM, Peter Maydell wrote:
> Allow the DSP extension to be disabled via a CPU property for
> M-profile CPUs. (A and R-profile CPUs don't have this extension
> as a defined separate optional architecture extension, so
> they don't need the property.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h |  2 ++
>  target/arm/cpu.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 778fb293e7c..b1c7ab3ee94 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -801,6 +801,8 @@ struct ARMCPU {
>      bool has_vfp;
>      /* CPU has Neon */
>      bool has_neon;
> +    /* CPU has M-profile DSP extension */
> +    bool has_dsp;
>  
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 406fd360a2a..c43139ba897 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -769,6 +769,9 @@ static Property arm_cpu_has_vfp_property =
>  static Property arm_cpu_has_neon_property =
>              DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>  
> +static Property arm_cpu_has_dsp_property =
> +            DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
> +
>  static Property arm_cpu_has_mpu_property =
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>  
> @@ -881,6 +884,12 @@ void arm_cpu_post_init(Object *obj)
>          }
>      }
>  
> +    if (arm_feature(&cpu->env, ARM_FEATURE_M) &&
> +        arm_feature(&cpu->env, ARM_FEATURE_THUMB_DSP)) {
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property,
> +                                 &error_abort);

TIL qdev_property_add_static, clean.
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
> @@ -1100,6 +1109,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->isar.mvfr0 = u;
>      }
>  
> +    if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
> +        uint32_t u;
> +
> +        unset_feature(env, ARM_FEATURE_THUMB_DSP);
> +
> +        u = cpu->isar.id_isar1;
> +        u = FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
> +        cpu->isar.id_isar1 = u;
> +
> +        u = cpu->isar.id_isar2;
> +        u = FIELD_DP32(u, ID_ISAR2, MULTU, 1);
> +        u = FIELD_DP32(u, ID_ISAR2, MULTS, 1);
> +        cpu->isar.id_isar2 = u;
> +
> +        u = cpu->isar.id_isar3;
> +        u = FIELD_DP32(u, ID_ISAR3, SIMD, 1);
> +        u = FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
> +        cpu->isar.id_isar3 = u;
> +    }
> +
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          if (arm_feature(env, ARM_FEATURE_M)) {
> 

