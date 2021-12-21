Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB547BFBE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:32:50 +0100 (CET)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzeK0-0000Zk-Ob
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:32:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzeHj-00089R-0J
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:30:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzeHb-0000Z1-Lj
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640089818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fa2Q/gJSoQP0iWesfM1DchLowBdt3ByBqWaE/3MJa58=;
 b=OB9eOLw+ryP1TwNJHYAabjp5ncb1f+QgGTocBxgI4dtNRW5BfOsuxK2mVrniKWOl8eIdkX
 EnT5EZJgagmahoWCDkvUOWXxfnaQNZhxRmdg0wCas7o4avl82lfzsDaPeNOElt/ZdaklTF
 zLUqsLfB8+SqU7SZihB+zrcoTB7/4j0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-wG7-CxQsPXiNxWhajqUn3w-1; Tue, 21 Dec 2021 07:30:17 -0500
X-MC-Unique: wG7-CxQsPXiNxWhajqUn3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so2797108wme.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 04:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fa2Q/gJSoQP0iWesfM1DchLowBdt3ByBqWaE/3MJa58=;
 b=wz8yJ+Rfi1uvipoWFim+CmRtzwNMY3ESF4t5A9AAa1qc2+rDzdk/3NeqVeDUhErSkt
 wo51ZVSRGbljwbjCEKo4KlN9yhrFbeTHyR9O3LkYkdcTRIioK4cXBXQZcWEXFRDV8Nvv
 1Y27LFRK+6raKof0tmVler6Kvmy72724yqJQt1RthzE9nRw8wN9e0xs+xWV/47thdPQ/
 ODIm5nVDD3OrK1VEuAk+BXg9NO0Gj5eWp8WfaqkFyIRXvu2Wdy8YlaXlXFUqwF6su6oR
 jINI/zm42IVSyYuwWp8cotSwDwN3NMyvK5nPAXdu+IVU5Bz8vb7N6/pUbbvf9B/3xS4N
 6LqA==
X-Gm-Message-State: AOAM533t7e2SZt0hW5cWiDRpUio+QzMAWuJHPKu9lGCju9nbFPnIkUmV
 wPvbeNwY22MUWZz8xfQLGeRDZt+VvykomIgTBctGLICunygxkJ78FzeGpI2I1gEizyywaSIg6Tk
 3WmEAvK/lrGdaNug=
X-Received: by 2002:a05:600c:1e01:: with SMTP id
 ay1mr2562093wmb.152.1640089815909; 
 Tue, 21 Dec 2021 04:30:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9ht6IjYcE+bRwbXKHIH7lecQjiCNp1kpFlJG7PljaZQEiEGB1RF3FpPt7DBRvfuCxfNhViQ==
X-Received: by 2002:a05:600c:1e01:: with SMTP id
 ay1mr2562071wmb.152.1640089815701; 
 Tue, 21 Dec 2021 04:30:15 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id j17sm10810364wrp.68.2021.12.21.04.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 04:30:15 -0800 (PST)
Message-ID: <bac44c19-7e63-919e-6491-9c50f1933abc@redhat.com>
Date: Tue, 21 Dec 2021 13:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] failover: Silence warning messages during qtest
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211220145314.390697-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211220145314.390697-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 15.53, Laurent Vivier wrote:
> virtio-net-failover test tries several device combinations that produces
> some expected warnings.
> These warning can be confusing, so we disable them during the qtest
> sequence.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/net/virtio-net.c   | 3 ++-
>   migration/migration.c | 4 +++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0b3..c64a6b9d1745 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -44,6 +44,7 @@
>   #include "hw/pci/pci.h"
>   #include "net_rx_pkt.h"
>   #include "hw/virtio/vhost.h"
> +#include "sysemu/qtest.h"
>   
>   #define VIRTIO_NET_VM_VERSION    11
>   
> @@ -925,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>           qapi_event_send_failover_negotiated(n->netclient_name);
>           qatomic_set(&n->failover_primary_hidden, false);
>           failover_add_primary(n, &err);
> -        if (err) {
> +        if (err && !qtest_enabled()) {
>               warn_report_err(err);
>           }

This trips the sanitizer build now:

  https://gitlab.com/thuth/qemu/-/jobs/1907374419

I think you have to error_free(err) in case qtest_enabled() ?

  Thomas


