Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95B399B2E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:00:54 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohLY-0005Zy-Vz
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lohJP-00041a-Nq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lohJL-0003wF-CF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622703512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHCRlmQbBjQZ9i+5R3hKiK/bO/i1lIzg1aZPCypSI0w=;
 b=LwzwttW1Ru0lCtPVGtQ/4/VDojS6+asokNVJ9aW3o2HIeFrAHIEMDRu1w3BOSUFVcIb96W
 Jv8ZT8UgkG3dervuUQ6V2yXJUzQp18FMSjXCNn6DL7h69G6mbJAvsxkuEFiOYMcog1vHux
 llmQhUK6xfUQZJlWm1CLTS527yxlNsA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549--Xas3UajOAqkSwJJmQ-ehQ-1; Thu, 03 Jun 2021 02:58:30 -0400
X-MC-Unique: -Xas3UajOAqkSwJJmQ-ehQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 p7-20020a170902e747b02900ef00d14127so1472677plf.23
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wHCRlmQbBjQZ9i+5R3hKiK/bO/i1lIzg1aZPCypSI0w=;
 b=iqZU0I0f/JKSqoRT4/3VhZG6axwhQs2igUytUMQYiziTzW9z97CpXzFa36dPpQmIDS
 JKWgu1Pl92WCgMOqXhJmQfwy6ca2Qjl45tGl5Ec6EAsUpJwuR0nMGQbOBfvp1sRvrmOp
 Jtfih1inDYIO6RuzIy7CEcTn4KyasGm1lZeyP1uSJOHV5OI1699qIyBINw8Oisf0ejee
 WTKxdbsIL8jlwFseK5xGuY6Fp2J7JEP+l42nHLHaVjjCrx8u3j6tIeUS/QFJkQl/ZMzQ
 rzAeAyexz1zzCHUGzyz5hrAMub0uppQA53H+Tm5pLGsRjRnBdCWsSX2k2aAOiDdRGQMy
 UkBw==
X-Gm-Message-State: AOAM5301mhN3iD9rWCOwwtGrdnv4n1xQ4q4NElMpZ3IcwI+vFjrZ97Ri
 /keRJ1gmxzJME3eIofYmZjJZub+u3pi582gQ06jlsMajpJ+H6bjxsZONvSpFmAQgQQCHKE9qShe
 8IIwsITfqOiG7uZMFUzJcMdKD9JKSBE47jUJ8f6rOkcLFqQQkD2PN4tapzmU5ACyWihM=
X-Received: by 2002:a17:902:b94a:b029:10d:6f56:eeac with SMTP id
 h10-20020a170902b94ab029010d6f56eeacmr3147398pls.54.1622703509437; 
 Wed, 02 Jun 2021 23:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwryWN3sb2SnK+Skd4w9aEZRewIWORIIjF/XkoAOL6//RLYjlnn7hQ3jmivbaMaDqhNUdpcfw==
X-Received: by 2002:a17:902:b94a:b029:10d:6f56:eeac with SMTP id
 h10-20020a170902b94ab029010d6f56eeacmr3147376pls.54.1622703509014; 
 Wed, 02 Jun 2021 23:58:29 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u20sm1388028pfn.192.2021.06.02.23.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:58:28 -0700 (PDT)
Subject: Re: [PATCH v7 10/10] virtio-net: add peer_deleted check in
 virtio_net_handle_rx
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-11-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <08a7316a-688a-faca-df7d-938e522a2423@redhat.com>
Date: Thu, 3 Jun 2021 14:58:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-11-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> During the test, We found this function will continue running
> while the peer is deleted, this will cause the crash. so add
> check for this. this only exist in  machines type microvm


Any idea why it only happens on microvm?


>
> reproduce step :
> load the VM with
> qemu-system-x86_64 -M microvm
> ...
>      -netdev tap,id=tap0,vhost=on,script=no,downscript=no \
>      -device virtio-net-device,netdev=tap0 \
> ..
> enter the VM's console
> shutdown the VM
> (gdb) bt
>
> 0  0x000055555595b926 in qemu_net_queue_flush (queue=0x0) at ../net/queue.c:275


So which piece of code trigger this? When the nc has a NIC peer we don't 
free it until the NIC is freed.


> 1  0x0000555555a046ea in qemu_flush_or_purge_queued_packets (nc=0x555556ccb920, purge=false)
>      at ../net/net.c:624
> 2  0x0000555555a04736 in qemu_flush_queued_packets (nc=0x555556ccb920) at ../net/net.c:637
> 3  0x0000555555ccc01a in virtio_net_handle_rx (vdev=0x555557360ed0, vq=0x7ffff40d6010)
>      at ../hw/net/virtio-net.c:1401
> 4  0x0000555555ce907a in virtio_queue_notify_vq (vq=0x7ffff40d6010) at ../hw/virtio/virtio.c:2346
> 5  0x0000555555cec07c in virtio_queue_host_notifier_read (n=0x7ffff40d608c)
>      at ../hw/virtio/virtio.c:3606
> 6  0x00005555560376ac in aio_dispatch_handler (ctx=0x555556a857e0, node=0x555556f013d0)
>      at ../util/aio-posix.c:329
> 7  0x00005555560377a4 in aio_dispatch_ready_handlers (ctx=0x555556a857e0,
>      ready_list=0x7fffffffdfe0) at ../util/aio-posix.c:359
> 8  0x0000555556038209 in aio_poll (ctx=0x555556a857e0, blocking=false) at ../util/aio-posix.c:662
> 9  0x0000555555e51c6f in monitor_cleanup () at ../monitor/monitor.c:637
> 10 0x0000555555d2d626 in qemu_cleanup () at ../softmmu/runstate.c:821
> 11 0x000055555585b19b in main (argc=21, argv=0x7fffffffe1c8, envp=0x7fffffffe278)
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/virtio-net.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 02033be748..927a808654 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1397,7 +1397,9 @@ static void virtio_net_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
>       int queue_index = vq2q(virtio_get_queue_index(vq));
> -
> +    if (n->nic->peer_deleted) {
> +        return;


This needs to be fixed in the network core instead of virtio-net.

Thanks


> +    }
>       qemu_flush_queued_packets(qemu_get_subqueue(n->nic, queue_index));
>   }
>   


