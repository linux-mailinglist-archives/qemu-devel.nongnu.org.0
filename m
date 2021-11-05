Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC444692C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 20:30:53 +0100 (CET)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4vM-0008RR-EX
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 15:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj4tF-00074R-Ud
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj4tE-0007oy-B3
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636140518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oL1lgovSJ5epaRYywkYhzYBJcv+b6ccpNelucXYRk00=;
 b=W03EbUqvR2jfrW2rvBDgWzH1whmOPS8BFkMFoRi+Ooc04rX0zmgqXCYIrjPNuaVTqf2aBZ
 pCHfasFOdonWem9FNVTy54tOeVGXUIDBiWN1E3m61hw0rcMBYtQYw+DkIYGQ0HNgbJQ8OG
 4Zz/UbyHr/CDlXml50liMpDzHSeLy5A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-jFg5uq6gPkGWV1lfGaIV9g-1; Fri, 05 Nov 2021 15:28:37 -0400
X-MC-Unique: jFg5uq6gPkGWV1lfGaIV9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so6146202wmc.7
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 12:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oL1lgovSJ5epaRYywkYhzYBJcv+b6ccpNelucXYRk00=;
 b=iEUZ9xfyEI5TxhV0dI1VD2XKPG4iUBZ8MrAcg0G2OLshm4W/xRkRHR2FA+CgyD0X57
 q5Gc0IOSTdEDoIsLGsMwpzwNcQuvm7uwSL46oXzabXCRL1tPxJjMZVpH0wohpuzq6CCW
 dcfqFfGVKi9sTi5ZK6EXAqXwpxtzyCMgvvi32XmI06DYbfWq51qtmRV53+BKcT7jARZ5
 RllVfQug4+7O9OC7GikvrWV+Qwasnz38Zg54Kh7SEQOwwOSXSjElByCnS536VdkufARS
 iOBXSAa6GszStllL+svITO0uaxL3Z3b2WVuOSffboNrZZQAL7KIV5Rzy2Ob+qCABzExO
 OL0w==
X-Gm-Message-State: AOAM5331JVqqEaL5V3T9G3IxaiZjIZS0NBXHvXYVttPlxFKJA85xhAUy
 vFNhntbYgoJiQBhM2U4berhyifwcWtd9wpiUSuteg09ft+udt7Ee856975X2jwkx/Arwdk7mbdV
 gzWwe0S4R6WQLYTw=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr46887575wrw.57.1636140516677; 
 Fri, 05 Nov 2021 12:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCXW6uhUJw4vRzPJ9Q/xzKvjJLNje7L+ZUrDeTc/zLooA2Ld+k12chNP8MPpNNMNklTXM5vA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr46887548wrw.57.1636140516466; 
 Fri, 05 Nov 2021 12:28:36 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b197sm8351472wmb.24.2021.11.05.12.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 12:28:36 -0700 (PDT)
Message-ID: <9b842841-94e8-374b-14ef-a8e20062f948@redhat.com>
Date: Fri, 5 Nov 2021 20:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] trace-events,pci: unify trace events format
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211105192541.655831-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105192541.655831-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 20:25, Laurent Vivier wrote:
> Unify format used by trace_pci_update_mappings_del(),
> trace_pci_update_mappings_add(), trace_pci_cfg_write() and
> trace_pci_cfg_read() to print the device name and bus number,
> slot number and function number.
> 
> For instance:
> 
>   pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
>   pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
>   pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
>   pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
> 
> becomes
> 
>   pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
>   pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
>   pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
>   pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/pci/pci.c        | 4 ++--
>  hw/pci/pci_host.c   | 6 ++++--
>  hw/pci/trace-events | 8 ++++----
>  3 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


