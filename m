Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6244E9AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:14:27 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYr4c-0003Ge-BT
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:14:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYr2Z-0001c5-D9
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYr2V-0007fP-TD
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:12:17 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-Pf1iRFhFMMyqIm-q3hF_jg-1; Mon, 28 Mar 2022 11:12:10 -0400
X-MC-Unique: Pf1iRFhFMMyqIm-q3hF_jg-1
Received: by mail-qk1-f198.google.com with SMTP id
 m23-20020a05620a221700b006809e1fa4fdso7209967qkh.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6EaDOMK7cqKmbKLZ8CEyYYvZhndOBX3mR1WACfNztNI=;
 b=phHpQDz/suc2F9N8PeaBqsotXUdAhTYOm0xzi7VVNIYYHHXXxEYn3X7zRzXo/tANp3
 SgZtTetbkI6ZvSlQsPRCsq4WSlV1KIQ82n7yv5ilF1LfxHgnwWRrJ3jvjhROdgDW2yF3
 pFajrXvYAxtKhO6h7VIwLFvuUst0mBcHcDiRQyLAVflfROVN0vLnO4/VqoT0E+szbq/+
 iPIHYyXptzPFHiW8E4dcfcKk0QKCDdVFJHidFxNms0XAmXJeTaYROkeG3zPUp+WB80J0
 Ug1fhTuskoUj4DCOx+Hx6qIqfS1fxF3BDz6gIhyHzhKULm+q13PTs6UysI96Fo7ZpGK2
 Pi8Q==
X-Gm-Message-State: AOAM533je036mRUPIxi8XHin4tZRn7cS31Znvx7tZTzg7245BkgrEJlt
 fVR7jevGARTUIGDDTc3sacdjuVDRS8hjtENlQo7iUfcQgPRcOS/I7BU2ygYsrknTh+onR6yJKgw
 3dGUOGxJFS8bNegA=
X-Received: by 2002:a05:620a:2889:b0:663:8d24:8cad with SMTP id
 j9-20020a05620a288900b006638d248cadmr16643538qkp.662.1648480330434; 
 Mon, 28 Mar 2022 08:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFD8KisBUAxG9eg3ObqTMbX0Ythp+6dz7gSpu1h1qvOha5/R6w0sTtpNU/P2rDBHodLPPwCg==
X-Received: by 2002:a05:620a:2889:b0:663:8d24:8cad with SMTP id
 j9-20020a05620a288900b006638d248cadmr16643510qkp.662.1648480330093; 
 Mon, 28 Mar 2022 08:12:10 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 a9-20020ac85b89000000b002e2072c9dedsm13333584qta.67.2022.03.28.08.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:12:09 -0700 (PDT)
Date: Mon, 28 Mar 2022 17:11:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 00/10] add generic vDPA device support
Message-ID: <20220328151156.gr6bzybthgs2kop6@sgarzare-redhat>
References: <20220319072012.525-1-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220319072012.525-1-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 19, 2022 at 03:20:02PM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Hi guys,
>
>With the generic vDPA device, QEMU won't need to touch the device
>types any more, such like vfio.
>
>We can use the generic vDPA device as follow:
>  -device vhost-vdpa-device-pci,vdpa-dev=/dev/vhost-vdpa-X
>
>I've done some simple tests on Huawei's offloading card (net, 0.95)
>and vdpa_sim_blk (1.0);

The whole seems almost okay, I left you some comments, but for the next 
version maybe it's better to reorganize the series differently.

Instead of adding vdpa-dev and vdpa-dev-pci incrementally, with stub 
functions and untestable parts, I would make a patch that adds vdpa-dev 
in full and then one that adds vdpa-dev-pci.
The first 2 patches on the other hand are okay, maybe patch 2 won't be 
needed since I think we will sync the headers after the 7.0 release, but 
is better to keep it for now to simplify the review.

Thanks,
Stefano


