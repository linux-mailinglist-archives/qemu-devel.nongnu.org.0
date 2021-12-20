Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1347B266
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:55:58 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMtB-0007Da-Nh
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzLiJ-0000Ke-Rb
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzLiF-0007AS-2M
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640018432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTpIePS9+JnykOcBa1pH/9q0otuaXWVQ2yJJtoRzHik=;
 b=XzSkPPwDmgRCkvayGRI8qNCu2uYc8z+0FT+adEzDStemuBz7rvxvF1azOKJMsJQJ+PumLu
 24cDB40A8cYJsFrSITXREthjzWvHiLIeAGcBmNoC14gdWf6xGCdXF3fvUtZRgy9GwJ7eGo
 cDl6fEXMOLvFG0ZVpdmcHZsIGT3/Tqk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-2mpw8orgPOyH8H4ak2_ldw-1; Mon, 20 Dec 2021 11:40:07 -0500
X-MC-Unique: 2mpw8orgPOyH8H4ak2_ldw-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a05600c1d9600b00345a25ea8cfso176016wms.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MTpIePS9+JnykOcBa1pH/9q0otuaXWVQ2yJJtoRzHik=;
 b=lLWRLHoCbhBroNYgVUwlM1q3rRcI7sNcZV6yD+Oh50TVfCYCfv4L/OOsXwXHrO3O/O
 1zQq61qR+XsDp1h9aMAtcYEL0LJzSZOqPPzWjggFY0lPWegq9VMzXCfeSZ3XAVWdjkBf
 Hsx5CtLGxBlKaIJ/3zyhb4Of9UkM1nF69zc70V3fNBVw/MLl7MRCxPIk1dJyHalJ0mB8
 82G7EMsmd+i/X0ozVKF6Yq/7brvvq4smqSjABZVbgLy2F35kEtDmandokdFpsyELsnB+
 gMTHs3pt1nI+H+XGI1cQ8Mm2QdVWOpkQT2VNViohrsqDPRgYie/vm0/OKM2XcnRNShVL
 jxbg==
X-Gm-Message-State: AOAM533l8JXVa0gKedZcKbFFELh0yfVnu7GmWt8RCHaH5Lr36o2cOvSb
 rP3oU7l74BVGsazuTw75eAu0BROmXZRyfr9vA8a68t8I7anNiX3BgYa/JNfvkH7lqMm6uGmSN8S
 DnBAXZODEeQtYVtM=
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr15218421wmg.102.1640018406602; 
 Mon, 20 Dec 2021 08:40:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfkeqNe77FT3slqOlD5qQfc8IhZz6mLj91+A/+y4K6NoW1G/K48vHGX/w1/R8ua6SbPU5RYw==
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr15218398wmg.102.1640018406393; 
 Mon, 20 Dec 2021 08:40:06 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g7sm15701645wrx.104.2021.12.20.08.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 08:40:06 -0800 (PST)
Message-ID: <5f1797be-dfc2-258d-b436-8de1fe2e2abe@redhat.com>
Date: Mon, 20 Dec 2021 17:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] failover: Silence warning messages during qtest
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211220145314.390697-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220145314.390697-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 15:53, Laurent Vivier wrote:
> virtio-net-failover test tries several device combinations that produces
> some expected warnings.
> These warning can be confusing, so we disable them during the qtest

Typo "warnings".

> sequence.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/net/virtio-net.c   | 3 ++-
>  migration/migration.c | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


