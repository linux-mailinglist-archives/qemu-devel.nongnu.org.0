Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3752E314B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 14:22:16 +0100 (CET)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktVzz-000342-2c
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 08:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktVxk-0002R7-DO
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 08:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktVxi-0003if-4d
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 08:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609075192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kmEtzjZIrAKfMvOafRh/u21Y0yMWRrFTVXgle0/wtvQ=;
 b=Vr6RnOETpiml6kVketP8MCeWrE5cDYzpgaGRvZa+QZBFs/zvCPK8dzJRDpPs+vyUk53nYB
 g1PzSyN+5kvWNbo5PjswYDsB04eenH8wq7hATCYRPXZHGoEFi0DWgh847ATAdsUzyeFwzV
 atT32YVfmp7Lu2TPhQ3pI9/y+bjFM5c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-HtslVmgNPq6PybSqRpY1xw-1; Sun, 27 Dec 2020 08:19:50 -0500
X-MC-Unique: HtslVmgNPq6PybSqRpY1xw-1
Received: by mail-wr1-f69.google.com with SMTP id u29so5128933wru.6
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 05:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kmEtzjZIrAKfMvOafRh/u21Y0yMWRrFTVXgle0/wtvQ=;
 b=KFCjsrmOg9wpxs4CLSdO0rzCVmXPVNsWuLJ256A+6Wd5VkklzSBVQ6V2WB0SASajOF
 8l7A5yUYG2CzAXzv8Wk07bc32snYc3vwa7k1b3WnKYPS7GIFtQ2l/PiuBaQuSBflxSRt
 +ATtAHGTuo3ttErW79uXDeed8Tah8cQUWf7K7hYBH1TZsPqJbhxQDVagpGuWH6rjT7xl
 IMUb8kIy4CfE8NhVl+4QSGHZzOK6asSwKjKLjYdLwAPYsv8bJx0NywYtsDRJ7yeLGY/X
 h/JiasVduomK9RZJWVwsaQ279dw4XgxdD3sGgO8R+xvsfVjZaTPLGJyTC1R9vsqvEavC
 Rp0w==
X-Gm-Message-State: AOAM53077UnoQz9M/DBmYo5PyXpC3cINip0LJu6nAFyLTZErdvAB4uzs
 qlEVBhIyjVlkebkLVMEnV3ybx0XQUII0LmwBN/4cGo5cHbiZEFXh8RIvbD62Ok2ddohcXTIjhAb
 W59/ufk+fvKlhdFs=
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr16593286wmf.44.1609075189082; 
 Sun, 27 Dec 2020 05:19:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Yv1wCnFuKpHPOrNz/H81440fPGWxdMpJIkA0nelUFa4LAl7WiqnCJf+ulf2uYxj8BUUA2g==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr16593261wmf.44.1609075188859; 
 Sun, 27 Dec 2020 05:19:48 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id w18sm54296419wrn.2.2020.12.27.05.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 05:19:47 -0800 (PST)
Date: Sun, 27 Dec 2020 08:19:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: g00517791 <gaojinhao@huawei.com>
Subject: Re: [PATCH 0/8] Fix memory leak of some device state in migration
Message-ID: <20201227081620-mutt-send-email-mst@kernel.org>
References: <20201226103347.868-1-gaojinhao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201226103347.868-1-gaojinhao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 26, 2020 at 06:33:39PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
> 
> For some device state having some fields of VMS_ALLOC flag, they don't
> free memory allocated for the fields in vmstate_save_state and vmstate
> _load_state. We add funcs or sentences of free memory before allocation
> of memory or after load of memory to avoid memory leak.
> 

Isn't there a way to handle it centrally?
IIUC the issue is repeated loads in case a load fails, right?
So can't we do something along the lines of:

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

diff --git a/migration/vmstate.c b/migration/vmstate.c
index e9d2aef66b..873f76739f 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -70,6 +70,7 @@ static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
         gsize size = vmstate_size(opaque, field);
         size *= vmstate_n_elems(opaque, field);
         if (size) {
+            g_free(*(void **)ptr);
             *(void **)ptr = g_malloc(size);
         }
     }

-- 
MST


