Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF993BEAAA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:28:28 +0200 (CEST)
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19TO-00071q-R3
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19SR-0006MD-Ee
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19SP-0000iV-SV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625671645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhIkJmIh/8Isi/XWCtnThe517k4LP8oeoqqPyxQquoo=;
 b=Uvd+JvaCA6LVa3MYqoXPB90/+en5AkqNbWbMQasf9PUxCuS0T4DHBEZpT3HX1fmkWHbsWq
 0AEo3N0puUqhU99uy5RQ1RvQiwRhiJPNMyXlPKmbvVu2giZSd87uojGAgoVXaW4Siquidf
 0gQYy4pKa2qD8u5LUCKHY0RDAQEcPZ0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-U2WcQKmnPlSIje2pKC0h3A-1; Wed, 07 Jul 2021 11:27:24 -0400
X-MC-Unique: U2WcQKmnPlSIje2pKC0h3A-1
Received: by mail-qv1-f71.google.com with SMTP id
 y35-20020a0cb8a30000b0290270c2da88e8so1844494qvf.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qhIkJmIh/8Isi/XWCtnThe517k4LP8oeoqqPyxQquoo=;
 b=qdWEdwi1G2hg9T+ksssNI13TsPp0EMfFutyGyS8wsIr+Y9OLxHjDk0aHb+vw0pDG8N
 L6L3mkrkv7NbhunH1TCDd9lJs/QwAnIe/sDbmhLCrFpRISwLO84ortf6fP++y8UiR5yb
 VXI38HZYuITByWImitcwLVxrA0aj1SE/YQuPvtSGBIFod0saJQsL03K5HLO6EqTWc9dC
 WthHmzS3C9qWF6c7Dstnkn2LwsA0n5vQ5+SMxEnyH6Hi/JHqnC/P/WroQaA2i0HXllaN
 ArYs7H1hXhKvJh3UdYZN+t6Ps23Y4mSuJNp28e7fOx3YOCMjiiyVhMGEqA9py0p8hsnO
 ao5A==
X-Gm-Message-State: AOAM531OFgaOerD0hh5IWf1OvqeyNcK7LsvGGzMpSV2ra/IpVxTJV8r9
 xTqXOAL5fbiGIywnN2k/cljrj1pmIQc/F/SU+L4M9Geyobx+W0dG/ypWlaesiikL2qaXE5EWw/c
 ctqb9flR7ayw6VEw=
X-Received: by 2002:a37:4388:: with SMTP id
 q130mr25809099qka.460.1625671643729; 
 Wed, 07 Jul 2021 08:27:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRBU6/nVEGGKRiZ51Pvm+E+n3wFwq9O7scN8ZHHjvIGmea9mhZbJ8WhiHWG0L9PTy2Y+I+Zg==
X-Received: by 2002:a37:4388:: with SMTP id
 q130mr25809071qka.460.1625671643485; 
 Wed, 07 Jul 2021 08:27:23 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s81sm8501165qka.82.2021.07.07.08.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:27:22 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:27:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
Message-ID: <YOXH2cvPhidPTrkJ@t490s>
References: <20210611185500.343525-1-peterx@redhat.com>
 <5391f6ca-57de-473d-beee-408455ef70e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5391f6ca-57de-473d-beee-408455ef70e3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 11:35:43AM +0800, Jason Wang wrote:
> 
> 在 2021/6/12 上午2:55, Peter Xu 写道:
> > The parameters of intel-iommu device are non-trivial to understand.  Add an
> > entry for it so that people can reference to it when using.
> > 
> > There're actually a few more options there, but I hide them explicitly because
> > they shouldn't be used by normal QEMU users.
> > 
> > Cc: Chao Yang <chayang@redhat.com>
> > Cc: Lei Yang <leiyang@redhat.com>
> > Cc: Jing Zhao <jinzhao@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 14258784b3a..4bb04243907 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -926,6 +926,38 @@ SRST
> >   ``-device pci-ipmi-bt,bmc=id``
> >       Like the KCS interface, but defines a BT interface on the PCI bus.
> > +
> > +``-device intel-iommu[,option=...]``
> > +    This is only supported by ``-machine q35``, which will enable Intel VT-d
> > +    emulation within the guest.  It supports below options:
> > +
> > +    ``intremap=on|off`` (default: auto)
> > +        This enables interrupt remapping feature in the guest.
> 
> 
> I think we don't need "in the guest" here.

Sure.

> 
> Other than this:
> 
> Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks,

-- 
Peter Xu


