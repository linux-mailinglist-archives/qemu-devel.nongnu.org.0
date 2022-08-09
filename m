Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A658D48D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:31:56 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJiU-0002pA-Sr
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oLJf4-0008OI-1x
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oLJf1-0007JZ-OC
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660030099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eYIHSjgpN14ZWeJrEMAoluy8ZGE7qWsgg/45/Ai/to=;
 b=Vdmp0GkENv1hSKQ735ZSQCogQsB3rGERbkYUB4EAIyYqcgAJfbOY/nHcBSC6PXRHBuIGJt
 WHBjVuPL79hV5CF4x91wr/HDFpT7oY57yY7ddtxqMEH3W4u7PRQ9UFldM9lcB7gQvvJ1oq
 ORyP0Sa6zjEI0Sg9Od7bAy5lOBh3GpE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-viMPbKO6PUS0ViQRbLOUqQ-1; Tue, 09 Aug 2022 03:28:17 -0400
X-MC-Unique: viMPbKO6PUS0ViQRbLOUqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n30-20020a05600c501e00b003a3264465ebso327029wmr.1
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4eYIHSjgpN14ZWeJrEMAoluy8ZGE7qWsgg/45/Ai/to=;
 b=ROBoH0+8G6upIPme/XvyH4u2MLKvySOVOKD+H9nlSQHw4XiBLh5GGIf8jRUazUm31D
 aLPe3AcnTt9KZDF5aHDsymG59cXzMjDop2iKbCW9efJ9w+nJuGfRjMSrdymii42+32RE
 Ae9O0NuBH0UfCR+CA9QWSnrpunhzRMbnEhBZ5xdZL3qOG+wzFRi1n990jGQkn9IUtqXQ
 kw+1t7P+wTci0ePQARedjp/Su5yffokrrO4oQiDKWCzGHuHMekzlc6O93974uEEc/l+9
 UBOSBSO9tNHGi1S6msvxuycbFwRoID/bUi8bZsxT70oobjkLA33bQyQSyO4t7fAoo80J
 cizw==
X-Gm-Message-State: ACgBeo0FmY5Tv5+YuLKxG2SC82rfcHX2J+pd4sy1f+99uZeDZ8jUZDlJ
 +/HPqJkAHSZpTdxcJ0RUW02aqxHigb2j1VVodlDDHLMS8mo7wwACyw9sjRmWcZohh4c30fnAW7u
 HDJqzTVLvwLo2wj8=
X-Received: by 2002:a05:600c:6009:b0:3a3:1506:f60f with SMTP id
 az9-20020a05600c600900b003a31506f60fmr19212094wmb.144.1660030096159; 
 Tue, 09 Aug 2022 00:28:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4DjPC4QReKjrPApZpQbIPwPy9CkeV6ow37obmdlGvEyQKMc921qogs59pg+Np4ygcmt+P4Vw==
X-Received: by 2002:a05:600c:6009:b0:3a3:1506:f60f with SMTP id
 az9-20020a05600c600900b003a31506f60fmr19212081wmb.144.1660030095975; 
 Tue, 09 Aug 2022 00:28:15 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c1c0400b003a31fd05e0fsm1399375wms.2.2022.08.09.00.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 00:28:15 -0700 (PDT)
Message-ID: <9e93f883-10c2-172b-698d-0546eacf15c9@redhat.com>
Date: Tue, 9 Aug 2022 09:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, pbonzini@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, kwolf@redhat.com,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Qing Wang <qinwang@redhat.com>
References: <20220808162134.240405-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220808162134.240405-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



Am 08/08/2022 um 18:21 schrieb Stefan Hajnoczi:
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
> does not need to be started. This fix is taken from the virtio-blk
> dataplane code and it's worth adding a comment in virtio-blk as well to
> explain why it works.
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

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


