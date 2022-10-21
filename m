Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF7606E20
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:06:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliN0-00085B-LW
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:06:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliLi-0006re-W5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliLY-0006hK-OV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliLX-0007o3-AG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666321518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipdHTENpFM6i8gCV5vd/hSC7LhUzPD3+QjJzNqS4gBo=;
 b=MRcCVzT7RJU4EOjfCCtBFCZvT9hGAwpvRYN6gZm+okT4UtZM1V2p4YUBv004nfAspmloFu
 V9cjO+XADFbrAxbgi3QNtX+h++lbWcPjkhEwvYLlOkCNOCrrQ4TAfuo1y4Y7odziG7441F
 EvvVGwIXZ9+67om5uNC2yXn+JWEaPv4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-MhtUHIHINbaI8RmwaYzVAA-1; Thu, 20 Oct 2022 23:05:17 -0400
X-MC-Unique: MhtUHIHINbaI8RmwaYzVAA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso1112316edb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 20:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipdHTENpFM6i8gCV5vd/hSC7LhUzPD3+QjJzNqS4gBo=;
 b=0cOdS4dzbEU7tqZYDI3oFS7f7tqdCBVbE0XQsM8RYe1hjeAphQuqEVPXct7uShEnuQ
 reTlANb1eZ0SU5OadUBwdIoTA0IcWoLtPjQ15/uayvOvsbseFRjVanD4jO7PlL5nVH+c
 Zu427zf7xAzrz6kXjArWNbQrCqXA6Qv/trMQykQwxixSc5Xe6HAkDklVSF8XiFO/vgm+
 Cc2MaiRWm/TEK7OESQ+2SHcyqCNbkl0I3BHospWF5SSo79yZX1ccAHt9Akr24NqedLig
 SqTzM/MKcTbiE5T3S7N3vOuzTHBev38Nt0cmx4MRQ4HZs4oMJq3SWbDS1vWaH7HuHLFm
 YPxA==
X-Gm-Message-State: ACrzQf2eqrWT1y+zbjTOWV4ttUgo8opIBmazQLgnzMe2xoscLJ1n/WIF
 6+DdW6znT1Szk4HNVSpEG3Ioca6x1TlC7Gg+JV686e4AT3rr4tKtK8qXrQqha1MQg/wMRXs73Sf
 /KbyCHlSS/uG7izL7Ldl+G3Z9b7ZHULU=
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id
 xj14-20020a170906db0e00b0077b82cf54a6mr13405242ejb.691.1666321516200; 
 Thu, 20 Oct 2022 20:05:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cwBchPeA8en+MwtT9TkujeGNQ/WHL8yUbVsh1i3l/iyzwo9LSk2kUFuG5X+MeYOa6KuJPDtgtfA9dHN8Ghbg=
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id
 xj14-20020a170906db0e00b0077b82cf54a6mr13405231ejb.691.1666321515993; Thu, 20
 Oct 2022 20:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221020095846.63831-1-lvivier@redhat.com>
In-Reply-To: <20221020095846.63831-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 11:05:03 +0800
Message-ID: <CACGkMEsmAKxoU=tf6e57zSexBAqX7pqiQM3Xu2ZyHfXAohH+dg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] virtio-net: re-arm/re-schedule when tx_burst stops
 virtio_net_flush_tx()
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 5:59 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> When virtio_net_flush_tx() reaches the tx_burst value all the queue is
> not flushed and nothing restart the timer or the bottom half function.
>
> For BH, this is only missing in the virtio_net_tx_complete() function.
> For the timer, the same fix is needed in virtio_net_tx_complete() but
> it must be also managed in the TX timer function.
>
> v3:
> - keep "} else {"
>
> v2:
> - fix also tx timer
>
> Laurent Vivier (2):
>   virtio-net: fix bottom-half packet TX on asynchronous completion
>   virtio-net: fix TX timer with tx_burst

Applied.

Thanks

>
>  hw/net/virtio-net.c | 59 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 8 deletions(-)
>
> --
> 2.37.3
>
>


