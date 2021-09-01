Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948ED3FD4F1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:10:39 +0200 (CEST)
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLKQ-0007vJ-NM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLLIh-0006D7-LG
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLLIf-0005Qn-7S
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630483728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhY85mgKT2w6kezqC9Rh2DH+ypHWLJYfSggJov8hoEQ=;
 b=PwKRuZyGNmWgZxhb+9j2+2vn3wahNlXpiMQW3kYFePa+cysZ+BIxixiT2gzLRbddl4KVSL
 +x2Qv69BHYlxHDTHz+i+iGM2pMDc4WgJYIIPE2+QzqHRiFFYhvjVsJKW3PRg9E07InPndk
 vG/kNA3UHusEQoK4QeFI4KIT7AMpJ/I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-uZK-WVxPPvKvqWFG3euD4w-1; Wed, 01 Sep 2021 04:08:46 -0400
X-MC-Unique: uZK-WVxPPvKvqWFG3euD4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso744849wmr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 01:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UhY85mgKT2w6kezqC9Rh2DH+ypHWLJYfSggJov8hoEQ=;
 b=OpJsZ14thIC+N5PaJPmD8doWYK6MOhFi1XwnI+WgPsP9ySc0p+3CljLWhaNapqrVPf
 gQQx4OtpWUUrUE3mIPL6ep9808Oiak+kv27KeYWaos7jGuRX/wwlBF12jphLT15owtKo
 Ei1UlcB4G4xIMd6auI+kAz6igrDNvMDaoevpHCm8jYyNLhzZXUw7g8RXL9h4iPR7cQiP
 fWZBC4ea3R4Yj8fMTg4wttUpxhYJ9uNNiW0TSBOs5M7hbeR/6MKVCnbEhnXSmFwBKhZn
 BHq9ydqrNGQbB6SLBpRN6fH18bHSYrD1TnRSHSuKBPqsziJISYzAZKQMjDwVMFJKP5ef
 urqw==
X-Gm-Message-State: AOAM5326vkbwjfRDwW32LImngHGHfCYLmXkgoVneqO3UGzxxVAq/RVJV
 ill7+i7YhuW8JsuX2xHMmTuCikuDwiLBhbKl+FB+ehuz2j78v3ey3Ug2/FBqfZbfMkAza9MiUSu
 dyhU4r0sWYo8ac0Y=
X-Received: by 2002:adf:b789:: with SMTP id s9mr25620018wre.315.1630483725552; 
 Wed, 01 Sep 2021 01:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdjvEZfw+qVskTX9iJE6O42Q5Rzx3sKoIq73jE+q5Wzf2fdYigkXSs/okXWS+1GNmWdogvwg==
X-Received: by 2002:adf:b789:: with SMTP id s9mr25619990wre.315.1630483725320; 
 Wed, 01 Sep 2021 01:08:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832f4.dip0.t-ipconnect.de.
 [217.232.50.244])
 by smtp.gmail.com with ESMTPSA id m186sm4742695wme.48.2021.09.01.01.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:08:44 -0700 (PDT)
Subject: Re: [PATCH 1/1] hw: Add compat machines for 6.2
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20210831015426.101188-1-wangyanan55@huawei.com>
 <20210831015426.101188-2-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <53f7e1e9-8394-e606-26a4-c559479a4f25@redhat.com>
Date: Wed, 1 Sep 2021 10:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210831015426.101188-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2021 03.54, Yanan Wang wrote:
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
[..]
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..4d25278cf2 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_6_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
> +    ccw_machine_6_2_instance_options(machine);
>   }
>   
>   static void ccw_machine_6_1_class_options(MachineClass *mc)
>   {
> +    ccw_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>   }
> -DEFINE_CCW_MACHINE(6_1, "6.1", true);
> +DEFINE_CCW_MACHINE(6_1, "6.1", false);

For the s390x part:
Acked-by: Thomas Huth <thuth@redhat.com>


