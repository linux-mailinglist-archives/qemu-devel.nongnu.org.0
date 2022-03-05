Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1484CE3F7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 10:30:16 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQQju-00033z-VE
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 04:30:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQQiD-0002AG-QX
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 04:28:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQQiA-0001cA-Cm
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 04:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646472504;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5v+lxzzzYjXAWwcj6FNe/edp16R/z7uYzjkD8sfpFjQ=;
 b=Bm7w2vWydJSP5fRjwbJB/agMKI+I4+MhyIy7RLp88Fc3kSL6mVt8JARqXaK7js+DN9Qpd/
 xnh14jav9di+NOoIqr6JDeK0mEiTuP+JGBvCKtSy6gpCh+0E6SOPcOM5y/5r4n23Bi7jnK
 elGclRltyppV8ujrqYILT2GIlU8U/hM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-HHVMYfmVOVGZjIcC8JauWA-1; Sat, 05 Mar 2022 04:28:23 -0500
X-MC-Unique: HHVMYfmVOVGZjIcC8JauWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so2078872wmc.3
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 01:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=5v+lxzzzYjXAWwcj6FNe/edp16R/z7uYzjkD8sfpFjQ=;
 b=BIhV7K7DYun1dtZJOgKXTB0NVgdatvVIX/JJdMUGLIw5cwrlEWMl+o4vpYIfelvUMX
 r8Fu+91ds2mpdVSzjH0rgcCEjlVPRPjSWN0GtopJAF1m7d5NEOoa6M7l44+E63+GbLn8
 lRELU408a1e397A4u7fxziHElXVQXuFg4dX8GnRATZYm/J8kYZwYMM0dK99ZKz3s6r8c
 ycrP82XJoNUdkX9up9ZMl5NxNHYPzXTH1gpAr9S1U+0Ef9GZa78YW8hn1FYvd3Vk7WcT
 RsA0Df/+TNkimQ0I7puCyXe+okwqZQVtzZDUih4HUN3wR2yG4y68hqhI5CZZo5feto/9
 L5ew==
X-Gm-Message-State: AOAM533IKH9744xVIY8abRhiM0s+j1vhlP/HwrXWUHzdb7wfYPDeAjQW
 T2GTb5j8fz9qCdP3p4uP2WBBwcD1tP5OxXpyULZhzkKPm/+6GydVslFCQSWJ86KSZwGx3zvDFQF
 5/PjmiPm8ivduf13N7c79zn8+PWRNcVAmhozxJh0UoWkz3F9fYMxoLpB26puAodBeqKpIVg==
X-Received: by 2002:a05:6000:2a2:b0:1f0:4c22:9380 with SMTP id
 l2-20020a05600002a200b001f04c229380mr1819099wry.139.1646472502065; 
 Sat, 05 Mar 2022 01:28:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk3LKvsWIlXE6ugyc7J67ro0WDSSyC8rahVeV16UNRx87tNLjwj+yXt+hOoBJbR8LRqFfF+A==
X-Received: by 2002:a05:6000:2a2:b0:1f0:4c22:9380 with SMTP id
 l2-20020a05600002a200b001f04c229380mr1819076wry.139.1646472501614; 
 Sat, 05 Mar 2022 01:28:21 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm7760908wms.15.2022.03.05.01.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 01:28:20 -0800 (PST)
Subject: Re: [PATCH v2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GIC_TCG is unset
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220304174559.55645-1-eric.auger@redhat.com>
 <CAFEAcA9_Kiu4mhaS6Sji4-aqcMAOQ3U3AYWm5mdSthBhFxK=ew@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <366332d6-c44b-9bd2-1aa4-ea3b40205ff1@redhat.com>
Date: Sat, 5 Mar 2022 10:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_Kiu4mhaS6Sji4-aqcMAOQ3U3AYWm5mdSthBhFxK=ew@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, drjones@redhat.com, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/4/22 7:36 PM, Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 17:46, Eric Auger <eric.auger@redhat.com> wrote:
>> In TCG mode, if gic-version=max we always select GICv3 even if
>> CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
>> This also brings the benefit of fixing qos tests errors for tests
>> using gic-version=max with CONFIG_ARM_GIC_TCG unset.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
>>
>> ---
>>
>> v1 -> v2:
>> - added Drew's R-b
>> - dropped PATCH 2/2 for the time being (requires more discussions)
>> ---
>>  hw/arm/virt.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 46bf7ceddf..f29779c951 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
>>          vms->gic_version = VIRT_GIC_VERSION_2;
>>          break;
>>      case VIRT_GIC_VERSION_MAX:
>> +#ifdef CONFIG_ARM_GIC_TCG
>>          vms->gic_version = VIRT_GIC_VERSION_3;
>> +#else
>> +        vms->gic_version = VIRT_GIC_VERSION_2;
>> +#endif
>>          break;
>>      case VIRT_GIC_VERSION_HOST:
>>          error_report("gic-version=host requires KVM");
> This doesn't look right, because the correct condition for
> "should 'max' be 2 or 3" is "do we have a GICv2 or a GICv3
> compiled in", which is nothing to do with "is the GIC a TCG
> GIC or the KVM GIC". Indeed at this point in the code we
> know we're dealing with TCG, so the right response to
> "we don't have a TCG GIC" is "give up entirely".
>
> I think fundamentally CONFIG_ARM_GIC_TCG is either misnamed
> or selecting the wrong files to compile.
Yes CONFIG_ARM_GIC_TCG is misnamed and as far as I understand selects
GICV3 TCG specific files. So I will respin and change the name of the
config.

Thanks

Eric
>
> thanks
> -- PMM
>


