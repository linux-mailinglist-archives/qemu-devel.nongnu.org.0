Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D163A2828
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:19:50 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGqr-00080b-9N
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGpW-000771-FU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGpT-0005mF-C1
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6DnKYYZTfBefPnZWtd6voBCBTIR3xby6X84E2unql8=;
 b=PxBegSmp1IKdhQIKe6aYyeOayewOFa6Hia6CxCH6ZtMVxxH5zEk3GcWfzVD1mj0//HVkoQ
 xMe8gfKbDc4dtq8wVpkzpyASXMuSvojBIn4Auw1ys1HfJg5YDvBfbkA7C8o0YUueQQ1RqY
 Pc0/a89iuEFTuC1sSzeuRdxdCsH+9bU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ELznpL4dMImLsgwx7hOGuw-1; Thu, 10 Jun 2021 05:18:21 -0400
X-MC-Unique: ELznpL4dMImLsgwx7hOGuw-1
Received: by mail-ed1-f72.google.com with SMTP id
 s25-20020aa7c5590000b0290392e051b029so8848089edr.11
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t6DnKYYZTfBefPnZWtd6voBCBTIR3xby6X84E2unql8=;
 b=chFkfc6SJVh5FCl6KGhb6y8yl2lGHwHdj2mGPMHuDCUYHFx3h2XT0/8twqRPeEtfVb
 WrYxt637+0KPR1Bl6y3jjmPaQMwegCfcPYMQslQZ9lNZGiZx7hAsdrYeJxwvhMuX+AXJ
 GtAYTAygDyARHvG4u+ndKIvNjrTaVJcYy4pi7iYz5+ra0z1fcQQxyJoKXr6TvfA1AN38
 ycWC7hJVKX0RniMWtOE3U5Q0OIhxR19k3+kDy5n8HIINUoK8DHF4aecqrsHmNhVgsdVT
 C+RJDdVj4p+I8vJLyEPAVgE2bNxL46ZGWIlQMi9dMXxkZ/MOHxOkRv1hPA7WCiRZHJvA
 a+HA==
X-Gm-Message-State: AOAM5308LhE88NcLtuMxUu0R69+vtQGKAUTQ2eoZXRaZ5NONOCgZ9vxq
 4rnw4bVaPyDRDkYI2XgLbVBEcloDz1M4Syb4fZdwRilNiOr/+8OXygC3wrOKkRKpW4uPPtC1pSd
 7bJtyR2oHIpmrw8c=
X-Received: by 2002:a17:906:264c:: with SMTP id
 i12mr3530062ejc.101.1623316700470; 
 Thu, 10 Jun 2021 02:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzseFIlwF5rrL5r1dMuhDUNUtNCvNo8T9gVsZjwY7ge7Brehdq4RqLULVYZjH24RNigliXGQ==
X-Received: by 2002:a17:906:264c:: with SMTP id
 i12mr3530045ejc.101.1623316700289; 
 Thu, 10 Jun 2021 02:18:20 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id t18sm1044207edw.47.2021.06.10.02.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:20 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:18:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 6/7] vhost-user-blk: Factor out
 vhost_user_blk_realize_connect()
Message-ID: <20210610091817.ijuuyt7n5hreiupi@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-7-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-7-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:57PM +0200, Kevin Wolf wrote:
>This function is the part that we will want to retry if the connection
>is lost during initialisation, so factor it out to keep the following
>patch simpler.
>
>The error path for vhost_dev_get_config() forgot disconnecting the
>chardev, add this while touching the code.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> hw/block/vhost-user-blk.c | 48 ++++++++++++++++++++++++++-------------
> 1 file changed, 32 insertions(+), 16 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


