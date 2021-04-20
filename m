Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E85365945
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:52:05 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYprI-0006AL-7I
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYpp8-00058Y-Df
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYpp6-0005lW-Uc
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618922988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WzuW8ARtrZKcpf6Ea9sLVdjRmpk2yq+ywpVVYOvjaI=;
 b=b8Iavjg0c53bqSD8t0D6RS9LuN7E+mx6gLuTnq03GQdF2i9sGNdi7Ln/nzmy2522nakm7U
 0Hn6L+nxng/SGwNhwRvTnuFDstS5kqC2aiiHv78540AHr2Nth6nteIvU8foW8Py/HWafM5
 jp7QcjD965Z8SuGkL11iCfFzuIo97E8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-D05bgZpzNNu6sO4_44njuA-1; Tue, 20 Apr 2021 08:49:44 -0400
X-MC-Unique: D05bgZpzNNu6sO4_44njuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 y7-20020a1c4b070000b02901357a988015so1637362wma.5
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2WzuW8ARtrZKcpf6Ea9sLVdjRmpk2yq+ywpVVYOvjaI=;
 b=OpBOzEScaEtyhlfb3hfxKUomZ+pUN1AVT1wxyKbfUZRPa19297rnOdd86a4xuuScCr
 0Ng0YP8sEpHPk63G+S4baOas/T9PiwKbDduhlHnaqiP6HKWtdSEkRUPy2twNJ8qN+Gjo
 ylZOiaBMbkRXbPlfmetmPw3+WhQdiFOQvOyqGC7f0btawJAjlQkA84EKpWm4KcISd0XT
 6ui0vYvwxEZEGA3iQUACfTq6rxBN9efxmRFxH//XtQbqQ4cagCo5woImqqLROpZ3wYbN
 HpI3QdY9yIVWjK5KE9wLUDnlOFGwodH35JBmZqa+zPpSB/pP6PgqwekXwANY+YXLopfI
 cKUg==
X-Gm-Message-State: AOAM533T7a3slMSy2cnOjYmztBVcRYMIJYXeaiLPW6wc5mqkUTskPh8/
 zoWspWjtyIUYcCJi5/FGdQDvYrE4HJHKxwOHOc4sOgRbqjcm7LAS8FZsUOSC9xclqCe3c5QdHgd
 GerQ5YAIh/YebKZ8=
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr4487237wmh.48.1618922983282;
 Tue, 20 Apr 2021 05:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMAC9TGzJIi4RtJE8a0FNHYkUSjkMF+tXiwQZSuodgg+rJVYGNFuajsJPvaCX5FzXenSZ4TQ==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr4487218wmh.48.1618922983100;
 Tue, 20 Apr 2021 05:49:43 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 l13sm10616998wrt.14.2021.04.20.05.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:49:42 -0700 (PDT)
Subject: Re: [RFC v2 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-3-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2f05cdb6-ecf4-8af9-dd05-acb17e3d1314@redhat.com>
Date: Tue, 20 Apr 2021 14:49:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-3-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> we stop short of renaming the actual qom object though,
> so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   hw/s390x/{tod-qemu.c => tod-tcg.c} | 0
>   hw/s390x/meson.build               | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename hw/s390x/{tod-qemu.c => tod-tcg.c} (100%)
> 
> diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
> similarity index 100%
> rename from hw/s390x/tod-qemu.c
> rename to hw/s390x/tod-tcg.c
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index a4d355b4db..72f48635cb 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -25,7 +25,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     'pv.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> -  'tod-qemu.c',
> +  'tod-tcg.c',
>   ))
>   
>   s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
> 

I'd just swap this patch with #1 -- or even squash them.

-- 
Thanks,

David / dhildenb


