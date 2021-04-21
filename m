Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B4366975
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:49:51 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZAQX-0003F9-Nd
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZAPd-0002i5-Ks
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZAPa-0000kk-81
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619002129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z36AIeQEXZ3R1Hq1/daFmZsJKwXhyk0tQmpJ9nI9AaQ=;
 b=IB7HHXZGCt11/7VGmeF0fj3bAS7bbFU6AzzNlZ1mDpNmYu/Bd+MvgnIDdh6u408BEf+jOV
 HsG+JpyAhHIGp8i3eIbIwN/KRXmDMrTXC2ugemHPkfrwsJwJrnLKiCFI9RkxwvJc7mqOTw
 Zqnob3jx/Vv70nLUBWl0GoGL6SkGysg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-sTK5-7QEPoibzz7aCq_BUg-1; Wed, 21 Apr 2021 06:48:47 -0400
X-MC-Unique: sTK5-7QEPoibzz7aCq_BUg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z3-20020a05640240c3b029037fb0c2bd3bso14921340edb.23
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 03:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z36AIeQEXZ3R1Hq1/daFmZsJKwXhyk0tQmpJ9nI9AaQ=;
 b=L3iXHXxYRt7byFofhef9c4TojOtAT1Jg5ePBcB9GK5lOHDE9M1hWpzIN36+1oRWG5S
 hR0xveWm36QZTfJIxDDIGfElmwuVWkMK+NdOYfFcJKgw6NDI7o8C7gekSL4OuAEFYQRs
 YVRiT7ALRKQn2fCokK3xH/hx9c9pi7lTMqMROYX56jKmMYC/nCGrrpKDa/ETcVNj2+qH
 ByaqTIkvbOLAXrCvVQ+fu6fBRnjocZrf1SLHQR4+/eFEvA4ilsLKP6MpSHmhcrGaGkr1
 CMcTAGn+ETkQSvcwH3OvmqL4ID0FXqMgX31dqOGjPEHtW+ODG6ct2Y2v0dcadJc8oPrQ
 lqLw==
X-Gm-Message-State: AOAM532ihl4mr8EIbV290hp5rGv+QBUXaqAxxDQvKPMjbiEkPgRR+jxk
 urnKHYqysjPz0dYHHO8RAovGo86idPTS0w0ZlUK9ig6bPtyOTan2P9fCdgelkFAUxgYhFCwDfVH
 JnPmtO0Ves14eopc=
X-Received: by 2002:a17:906:fb19:: with SMTP id
 lz25mr31290555ejb.544.1619002126433; 
 Wed, 21 Apr 2021 03:48:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwf5g9HlR6KF/UF3Qtug6JjDGZqsrP+APmvIWEQbZ3BCr+ENRWBC0g8DO15ojgILwfW4JGoA==
X-Received: by 2002:a17:906:fb19:: with SMTP id
 lz25mr31290534ejb.544.1619002126142; 
 Wed, 21 Apr 2021 03:48:46 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id m10sm2021733ejc.32.2021.04.21.03.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:48:45 -0700 (PDT)
Date: Wed, 21 Apr 2021 12:48:43 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH v3 1/2] iotests/231: Update expected deprecation message
Message-ID: <20210421104843.k2wpmtzbict2xw4g@steredhat>
References: <20210409143854.138177-1-ckuehl@redhat.com>
 <20210409143854.138177-2-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210409143854.138177-2-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 09:38:53AM -0500, Connor Kuehl wrote:
>The deprecation message in the expected output has technically been
>wrong since the wrong version of a patch was applied to it. Because of
>this, the test fails. Correct the expected output so that it passes.
>
>Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>Reviewed-by: Max Reitz <mreitz@redhat.com>
>---
> tests/qemu-iotests/231.out | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
>index 579ba11c16..747dd221bb 100644
>--- a/tests/qemu-iotests/231.out
>+++ b/tests/qemu-iotests/231.out
>@@ -1,9 +1,7 @@
> QA output created by 231
>-qemu-img: RBD options encoded in the filename as keyvalue pairs is deprecated.  Future versions may cease to parse these options in the future.
>+qemu-img: warning: RBD options encoded in the filename as keyvalue pairs is deprecated
> unable to get monitor info from DNS SRV with service name: ceph-mon
>-no monitors specified to connect to.
> qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
> unable to get monitor info from DNS SRV with service name: ceph-mon
>-no monitors specified to connect to.
> qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
> *** done
>-- 
>2.30.2
>
>


