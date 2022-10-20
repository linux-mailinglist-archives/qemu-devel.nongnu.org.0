Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA746060C4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:58:58 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV8G-0007mx-Cz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:58:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUxk-00009T-GD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olTqX-0002pu-FD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olTqR-0003Z2-Ss
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666265770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIp+pNpNCSnqQRDELMwmAYhK+dA7uAt3E7HZBLEidQo=;
 b=ijLk4HWpAtAQfHL3mW7DBNDSmWsUfCuPfFncmG7IvuT7FTR+idJnLXVl3wpgzp0mDK2gRa
 7j7XKthjhSZO+djMFkLhQnXvEh6xOEr518TrYXH5eQCaVja3ZdlwQreBltXue4xot4XsCi
 rwUKOZayb3OhVpe1B768Kbo0Za2t99g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-jCpZuxQsO1C9XWeQwsd_PQ-1; Thu, 20 Oct 2022 07:36:09 -0400
X-MC-Unique: jCpZuxQsO1C9XWeQwsd_PQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k34-20020a05600c1ca200b003c706e17799so2083380wms.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wIp+pNpNCSnqQRDELMwmAYhK+dA7uAt3E7HZBLEidQo=;
 b=Q9yvRSri/a6Fk49hC48k7DLd2H6SCiTbh2O7ZbWxvfCLiCr6++TLMGxUNFouknJbST
 LUmXy1l9kZ2BKeDQnfJ6JezrrZTSyfkZKTHVMR7qiO73WPjNxzzr56Q8qEEIe/Oz2uX8
 C1tRbwDNPUJbsK8wvaQQiPPIEUeXeJycukGGikazZRsqc3Dyo5PoTsuF8667P10ywhML
 Olw+D7gOSFQLJbPXFUMksspBqrAKPQgRqNz/d6cxs5Flo5Qq/Gar1eFCTIThi+Z5kCN7
 5PtKX14xH6jbCukn7/Q5B73rcOJdx04jiIC/jlDpyIHZX/ofQhAT6oK0fY2Zp6pmduv3
 O85w==
X-Gm-Message-State: ACrzQf1raT2cKJe1SH+2J0XacWLYvtO7EM34IlQhJkuLtSelFHjVSp+n
 AhF8Yuvd7vspX/ojpGO2S4oVjDW/ZNmt2ePhBYLC9mz2t2VYEZvBdxc3z3fWms4XxXLJYxG2saG
 Ol5bYpYO68PlTk1w=
X-Received: by 2002:a7b:c051:0:b0:3a6:36fc:8429 with SMTP id
 u17-20020a7bc051000000b003a636fc8429mr8825873wmc.78.1666265768504; 
 Thu, 20 Oct 2022 04:36:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60xc6CdzqQIE1fEO9gyvAb7sw2Hn9Q8+XEF7pSWfTOcB7iaYtMhHBg3uJgyqwKg/UEqfTdjw==
X-Received: by 2002:a7b:c051:0:b0:3a6:36fc:8429 with SMTP id
 u17-20020a7bc051000000b003a636fc8429mr8825856wmc.78.1666265768260; 
 Thu, 20 Oct 2022 04:36:08 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 u11-20020adff88b000000b0022e2eaa2bdcsm15996176wrp.98.2022.10.20.04.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:36:07 -0700 (PDT)
Date: Thu, 20 Oct 2022 07:36:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v3 0/2] virtio-net: re-arm/re-schedule when tx_burst
 stops virtio_net_flush_tx()
Message-ID: <20221020073544-mutt-send-email-mst@kernel.org>
References: <20221020095846.63831-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020095846.63831-1-lvivier@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Oct 20, 2022 at 11:58:44AM +0200, Laurent Vivier wrote:
> When virtio_net_flush_tx() reaches the tx_burst value all the queue is
> not flushed and nothing restart the timer or the bottom half function.
> 
> For BH, this is only missing in the virtio_net_tx_complete() function.
> For the timer, the same fix is needed in virtio_net_tx_complete() but
> it must be also managed in the TX timer function.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


Jason your area to merge I assume?

> v3:
> - keep "} else {"
> 
> v2:
> - fix also tx timer
> 
> Laurent Vivier (2):
>   virtio-net: fix bottom-half packet TX on asynchronous completion
>   virtio-net: fix TX timer with tx_burst
> 
>  hw/net/virtio-net.c | 59 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 8 deletions(-)
> 
> -- 
> 2.37.3
> 


