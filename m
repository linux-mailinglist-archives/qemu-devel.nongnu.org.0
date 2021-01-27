Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5B305BF0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:48:02 +0100 (CET)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kEr-0007Nh-8k
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4kDX-0006fu-Pn
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4kDW-0004aw-B4
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611751597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIwJVP8XTwkEwGc2lclH4Er1kq3hZ3+j54OcUbnlBHg=;
 b=Pzp+aeXxBmBYV7mntgSMpqCyPFpyp3RKg37/9H4tZ0t8fs1PzXgUZxFc3LA+6mJqMUe5Fk
 fhVG3RkQIq/mYHkVFAljZJgTzbuW3/O8RJccH/gA2Q4YRKs3F4A7WqQ+fiDoZT2s+tadAk
 CnCj2GpubBnI6HoO1a18lumBfAalzNs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-kc-LJ2f2PAWhf2gOELiRUw-1; Wed, 27 Jan 2021 07:46:35 -0500
X-MC-Unique: kc-LJ2f2PAWhf2gOELiRUw-1
Received: by mail-ed1-f71.google.com with SMTP id u19so1297022edr.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 04:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CIwJVP8XTwkEwGc2lclH4Er1kq3hZ3+j54OcUbnlBHg=;
 b=jQV2gDU36esGZrwSETNVbckrL7+0SKwstgWoY8TlJS5LFZVQobkzP2E2E0n8k0L2tf
 puDREwgpII4ElaWNML8FjA9/0IpN5/aplKRmggJ57fj2JyM8ekgnYlmzjWZpvRuDg/Sj
 KvkelsU3xmRBToFNNMI0hLXXme2FfFmpc5VxHseWI2k9N50+hynFe7US064dRt60KLcX
 rF1yHdOy9GAX/1m0POfnXTUV34iyAVtzY/MLjGywb3TqI3j8gsLIDx/iq4HP8ouSKC07
 aosQc/VzDodcrmo0eVFm9fo5pFHOWkrYaY+GVlN6uxK8k0O1QGChiGD/iokSiJ55/+d5
 +t4g==
X-Gm-Message-State: AOAM530qEQS8UKHNgKtLuyIVltGIjdGMVwaXNvGiCJn70BDeOZXS6c6S
 8BJiAZd9WockwHPDOAOikRIawWHXL9ID6e74PecUMfcuJNZgZifnPEKPw+n8mlXSDincYtL4lKB
 XV9q9BSEws65txpw=
X-Received: by 2002:a17:907:abc:: with SMTP id
 bz28mr6621382ejc.395.1611751594530; 
 Wed, 27 Jan 2021 04:46:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoNhz1iXYRhUf4kCC7BjSULN/ZeQcsZzH2UDs+AKVcAfx8bgZUAv4L3XEkarx+Z1X5+Koukg==
X-Received: by 2002:a17:907:abc:: with SMTP id
 bz28mr6621359ejc.395.1611751594318; 
 Wed, 27 Jan 2021 04:46:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p27sm769172ejd.72.2021.01.27.04.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 04:46:33 -0800 (PST)
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: Keqian Zhu <zhukeqian1@huawei.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
Date: Wed, 27 Jan 2021 13:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111073439.20236-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, jiangkunkun@huawei.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 08:34, Keqian Zhu wrote:
> +static void vfio_listener_log_start(MemoryListener *listener,
> +                                    MemoryRegionSection *section,
> +                                    int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, true);
> +}
> +
> +static void vfio_listener_log_stop(MemoryListener *listener,
> +                                   MemoryRegionSection *section,
> +                                   int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, false);
> +}
> +

This would enable dirty page tracking also just for having a framebuffer 
(DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also 
be more heavyweight than expected.

In order to only cover live migration, you can use the log_global_start 
and log_global_stop callbacks instead.

If you want to use log_start and log_stop, you need to add respectively

     if (old != 0) {
         return;
     }

and

     if (new != 0) {
         return;
     }

before the calls to vfio_set_dirty_page_tracking.  But I think it's more 
appropriate for VFIO to use log_global_*.

Thanks,

Paolo


