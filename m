Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF46421FC8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:54:50 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfHk-0002vl-VZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfGT-0002Ez-3M
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfGP-0008GU-Tt
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633420403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8MQQUBfg6gmlUyb1M/tqnYV/yKo2UEgU362rTr4iyf0=;
 b=BFBKEOpsNDaRGKjh7P5EZ57QM1trx5aQbj5F0mvCSlBBPZKLdoXKih9GIdRra1Jj/g87K6
 6vP+ZlWah7pLHaa2ZBWKzO1bhspO9h3YR5gfTQpdLATlQPphI0Rj0rvxH0lRw0dsn4l9zH
 7ewcxTACYB2Pk7MFSb1Wxl6J2DfR6KU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-7O_jNNolPZK4MIMYE5_sag-1; Tue, 05 Oct 2021 03:53:22 -0400
X-MC-Unique: 7O_jNNolPZK4MIMYE5_sag-1
Received: by mail-ed1-f69.google.com with SMTP id
 n19-20020a509353000000b003dad185759bso11882344eda.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 00:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8MQQUBfg6gmlUyb1M/tqnYV/yKo2UEgU362rTr4iyf0=;
 b=dcTVZ4d0E6jLhydENLQVSjRoxEC7ApgGkpjb4a6pF0PvVFY4BeFtv2vhgwNTFcFzsZ
 r3Xo52p4kpM49qGRaOF5JoOG/HZh9wVMnBEf8nD5s3PU1EydDIZQntJO8NMP4AGmMK3y
 IU+HHUZw5IyDSxJIrQxtuPhFJtiQ90GUK5M+nnfFgG75S6BISXoC4X5FV37mdI87jB0v
 egZA4ksujpUsZbO9Ys4AmbNu1jhLw7wKCf/MgxQEadyTHiGiXRjAiYeHTWCi51gLNnPZ
 eq6t4TBGoZtCb9Px+12ltn7m7YsQwtntrvi7YNiv9AG6eVlwv9yHP9bq8sLORG8qwrHd
 TTeA==
X-Gm-Message-State: AOAM533nuA7eMnHNuFj7le/dSS37Ev91QTJEcnOhUTYWIGdVM/HBFPgB
 XBZeIQ/FUtG7jxUcffjG975gKgm7b/aU9qztVG+aGhDN70IqWEY/jmBRLkMK+AJRduI04q2+KUW
 hARFEPKrXw+wy6iw=
X-Received: by 2002:a05:6402:35cb:: with SMTP id
 z11mr14610273edc.252.1633420401512; 
 Tue, 05 Oct 2021 00:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOHxXYAke10DbjPKeGoglSdZPOuPMBgTSaN3r5HKwcc031+p/zWsEEMu11Yvb7QTyz4BzKrw==
X-Received: by 2002:a05:6402:35cb:: with SMTP id
 z11mr14610244edc.252.1633420401312; 
 Tue, 05 Oct 2021 00:53:21 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id u6sm8260227edt.30.2021.10.05.00.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 00:53:20 -0700 (PDT)
Date: Tue, 5 Oct 2021 03:53:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005035014-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <20211005092539.145c9cc4.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211005092539.145c9cc4.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 09:25:39AM +0200, Halil Pasic wrote:
> On Mon, 4 Oct 2021 09:11:04 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> > > >> {
> > > >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> > > >>     return virtio_is_big_endian(vdev);
> > > >> #elif defined(TARGET_WORDS_BIGENDIAN)
> > > >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
> > > >>         return false;
> > > >>     }
> > > >>     return true;
> > > >> #else
> > > >>     return false;
> > > >> #endif
> > > >> }
> > > >>   
> > > >
> > > > ok so that's a QEMU bug. Any virtio 1.0 and up
> > > > compatible device must use LE.
> > > > It can also present a legacy config space where the
> > > > endian depends on the guest.  
> > > 
> > > So, how is the virtio core supposed to determine this? A
> > > transport-specific callback?  
> > 
> > I'd say a field in VirtIODevice is easiest.
> 
> Wouldn't a call from transport code into virtio core
> be more handy? What I have in mind is stuff like vhost-user and vdpa. My
> understanding is, that for vhost setups where the config is outside qemu,
> we probably need a new  command that tells the vhost backend what
> endiannes to use for config. I don't think we can use
> VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
> according to the doc. So for vhost-user and similar we would fire that
> command and probably also set the filed, while for devices for which
> control plane is handled by QEMU we would just set the field.
> 
> Does that sound about right?

I'm fine either way, but when would you invoke this?
With my idea backends can check the field when get_config
is invoked.

As for using this in VHOST, can we maybe re-use SET_FEATURES?

Kind of hacky but nice in that it will actually make existing backends
work...

-- 
MST


