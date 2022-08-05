Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4858A83B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:43:39 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsvi-0007wZ-JA
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJsk1-0005nL-MH
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJsjy-0007Ll-R0
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659688289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIwfnt7d9F+48XSWv1JsGbMg5ceT04y/lUcbb5s3BrU=;
 b=XJwsWjhJByEeBnK8phT/EbEpSyNwLKjqslFCNrRc4EWpKPtA+RhLzqmlEMCg+nRkWCvkAb
 m8mAFph9y2GnS5l09LbfvwL/BszjpEZEC3kQIC8tNZSq6lErA0HU7ScpFsCEzPUfTv7NtE
 OPAXufQDVQhPYZwlPSvdH8d9veDQoAs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-Wwir-cZcP9u_4QH1HYyy1Q-1; Fri, 05 Aug 2022 04:31:28 -0400
X-MC-Unique: Wwir-cZcP9u_4QH1HYyy1Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 m17-20020a05620a291100b006b6590830feso1487137qkp.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TIwfnt7d9F+48XSWv1JsGbMg5ceT04y/lUcbb5s3BrU=;
 b=BQtCv9X3R2yPPEBFSxPXngJMWCrezPRYwGEZ1EdFal6zak5w4J384OZ95UQ3FRGb/A
 BoC75eKzJ8tC5faNMai8U0+qeXOVHSXwFMZPPEXj5UmExm8n61MGWWiEicQ1CFEuL/z9
 woefwVFTMRItMbiwqlYxsH8s+Hs/VtAzHcWoW7xjReikrjL0NsDkKJK0WR4wXZf4kR+e
 cu+95IrnrVKu91gVk6f7DSb+3L3LJH/kTH3vAH25BX+xIy5LDhbAGwgHDaVyscCdXRq1
 s3OE5SPSRnaN563J0kATvxCRkY8wiS72Ge+UM4iHzuGO6q2Zd6ovgpzMaoMUGwAVnKpo
 32GA==
X-Gm-Message-State: ACgBeo1dRpL/9LqJ/mef0oxmP9DFx67SbHAsKY3zoydEI8cggZX1piCS
 1a8bC18FW/sLER3BwQkZlASy7uakBdNSeNHulxH5ApUPcNI/wZMX2SQTMZZwhthX6OCF4otlAnX
 fZD7dUe0b9ZM9WaY=
X-Received: by 2002:ac8:7fd3:0:b0:340:3391:d9bd with SMTP id
 b19-20020ac87fd3000000b003403391d9bdmr5016099qtk.241.1659688287788; 
 Fri, 05 Aug 2022 01:31:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7mMjwZMquvpGoyg+YLizJGiAFTjsnJBTdLxobx3RQeg5dr52CeloA/WEYUbrqYuirYuvLVTA==
X-Received: by 2002:ac8:7fd3:0:b0:340:3391:d9bd with SMTP id
 b19-20020ac87fd3000000b003403391d9bdmr5016090qtk.241.1659688287609; 
 Fri, 05 Aug 2022 01:31:27 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05622a188a00b0031ee9afafccsm2443701qtc.14.2022.08.05.01.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 01:31:27 -0700 (PDT)
Message-ID: <f6ae23da-8575-be3f-eacf-ca27731fe210@redhat.com>
Date: Fri, 5 Aug 2022 10:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: sgarzare@redhat.com, kwolf@redhat.com, "Michael S. Tsirkin"
 <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Qing Wang <qinwang@redhat.com>
References: <20220803162824.948023-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220803162824.948023-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 03/08/2022 um 18:28 schrieb Stefan Hajnoczi:
> As soon as virtio_scsi_data_plane_start() attaches host notifiers the
> IOThread may start virtqueue processing. There is a race between
> IOThread virtqueue processing and virtio_scsi_data_plane_start() because
> it only assigns s->dataplane_started after attaching host notifiers.
> 
> When a virtqueue handler function in the IOThread calls
> virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
> attempt to start dataplane even though we're already in the IOThread:
> 
>   #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
>   #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
>   #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
>   #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
>   #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
>   #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
>   #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
>   #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
>   #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
>   #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
>   #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
>   #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
>   #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
>   #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
>   #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
>   #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
>   #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)
> 
> This patch assigns s->dataplane_started before attaching host notifiers
> so that virtqueue handler functions that run in the IOThread before
> virtio_scsi_data_plane_start() returns correctly identify that dataplane
> does not need to be started.
> 
> Note that s->dataplane_started does not need the AioContext lock because
> it is set before attaching host notifiers and cleared after detaching
> host notifiers. In other words, the IOThread always sees the value true
> and the main loop thread does not modify it while the IOThread is
> active.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/scsi/virtio-scsi-dataplane.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


