Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B792EF990
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 21:42:47 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxyas-0002bJ-EQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 15:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxyZk-00027q-C4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:41:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxyZe-0005bi-Ji
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610138488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoKD2V1Ueh+o5O7PWM3rzdFQ6t91jGdeDoylJA134K8=;
 b=VagpyQTufwKhMteAjt/LiPgAuv36nkLg4F8fnEM8++uS7EG1hXHhX0zC2iSVj9jMSWBmwi
 UCB5MaLp7fjyDhVtL4hbjwe9fL+HiIwJMDRyvqC3E6gPQiVJZTdgari5evKuOa7RoZLrrk
 9WwrXe+di3DBKiUhzJTV1mp08r76XRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-uGwb924VPji-q_5q3YjdXA-1; Fri, 08 Jan 2021 15:41:25 -0500
X-MC-Unique: uGwb924VPji-q_5q3YjdXA-1
Received: by mail-wm1-f72.google.com with SMTP id s130so3660676wme.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 12:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoKD2V1Ueh+o5O7PWM3rzdFQ6t91jGdeDoylJA134K8=;
 b=ghBHKrU+x3XjWmGIxRkz0g43M2X5Iqj6qAWTqUrIyp6haJGKcw3lS1rNAo7s83k1Zs
 E/j0BspB1m+kN2WargjuTIrJHKwVO2LkjGfBSjWMB2TWFDnBagxOZEx0YVsEc19189gO
 NgyPiazbpKmaBo1ho3dWb2PaNsgMb1WzrOR2K8/ry7iBB4BaAOyaJzQbjMQhmzcQsvr2
 t6N+LRyVzOfdJMtOewEs0XiX7Lfc5ryxt7SzoD6Hmr+H/lcu7VWNFd4D4rrDKmh4hZwz
 SkwJT7c269DLY7OMB+MxsIOs0+UKE1opPHgy8wTFG6l7G4EdctSCt90Exwbkb4Gxz/FJ
 VfOg==
X-Gm-Message-State: AOAM53261hKN9r9JfNqmZYEuyNPnsLfYefl7t2/zm8R48DNqGBSBP1X6
 aUJCutAFF77Vs1J9yTUzyfABJFrmDrvNRF/offCQBZhrSa6u8a34ZIMhisLIysgVkoS/Ylwx0hw
 1uzBzZoFDUBg3Umk=
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr4511334wml.138.1610138483801; 
 Fri, 08 Jan 2021 12:41:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuqADKhAhn95zIUCfyvUOjJ601o6hUoARpVcuHd7VhGQbkEbwlGo5jSYuJbXLz3kvkFnM9/Q==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr4511322wml.138.1610138483557; 
 Fri, 08 Jan 2021 12:41:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o74sm14993554wme.36.2021.01.08.12.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 12:41:22 -0800 (PST)
Subject: Re: [PATCH] kvm: mirror "-machine dirty_gfn_count" to the accelerator
 property
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <1610132911-33839-1-git-send-email-huangy81@chinatelecom.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3aa73987-40e8-3619-0723-9f17f73850bd@redhat.com>
Date: Fri, 8 Jan 2021 21:41:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1610132911-33839-1-git-send-email-huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peterx <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/21 20:08, huangy81@chinatelecom.cn wrote:
> QEMU enable the dirty ring feature by specifing the "-accel" sub-parameter.
> https://lore.kernel.org/qemu-devel/20210108165050.406906-10-peterx@redhat.com/
> Libvirt use "-machine accel=kvm" option to specify the accelerator by default,
> which is incompatible with above option.
> 
> This patch introduce the "dirty_gfn_count" sub-parameter of the "-machine"
> in the way that the commit "23b089" has done. So that Libvirt can enable this
> feature by adding "-machine dirty_gfn_count=xxx" to the QEMU command line.
> 
> Signed-off-by: Hyman <huangy81@chinatelecom.cn>

Libvirt should switch to "-accel kvm" instead.  The "-machine" options 
for accelerators are legacy and now there is a better mechanism.  There 
will never be a version of QEMU that supports dirty ring and doesn't 
support "-accel kvm", so it's easy for Libvirt to detect when to use 
"-accel".

Paolo

> ---
>   softmmu/vl.c       | 3 ++-
>   util/qemu-config.c | 4 ++++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7ddf405..d8e3dec 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1666,7 +1666,8 @@ static int machine_set_property(void *opaque,
>           object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
>           return 0;
>       }
> -    if (g_str_equal(qom_name, "kvm-shadow-mem")) {
> +    if (g_str_equal(qom_name, "kvm-shadow-mem") ||
> +        g_str_equal(qom_name, "dirty-gfn-count")) {
>           object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
>           return 0;
>       }
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index e2a700b..70f1b50 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -234,6 +234,10 @@ static QemuOptsList machine_opts = {
>               .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
>                       " converted to upper case) to pass to machine"
>                       " loader, boot manager, and guest kernel",
> +        },{
> +            .name = "dirty_gfn_count",
> +            .type = QEMU_OPT_NUMBER,
> +            .help = "KVM dirty ring GFN count",
>           },
>           { /* End of list */ }
>       }
> 


