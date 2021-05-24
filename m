Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90D38F477
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 22:38:16 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHL5-0001i7-Cb
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 16:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1llHJj-0000po-Od
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1llHJf-0001qm-Ew
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621888605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWkFrnPQJwMYpfDNde9vQaW3DoyBMEWUXPZZEnr5prc=;
 b=Sl5lwaev6mqIXZ4hnYRjKFtrP559jtMrtfh1OkydtjOgZf3I/bPfLN4r+sGRGFFKV1Wde9
 +Wth0ssZA/tA1k0SfyInK5RdX7K/AS/SvhqHYPh44TgVRpEm1lNdhlrSoG2AZz8V4PqLhF
 a1O22sRNTKSiGXLOIWsPxXcXDXqqVdI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-iuzfHCf_N8GdYJoVHUWutQ-1; Mon, 24 May 2021 16:36:43 -0400
X-MC-Unique: iuzfHCf_N8GdYJoVHUWutQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 b72-20020a1c804b0000b02901872ca24869so557355wmd.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 13:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QWkFrnPQJwMYpfDNde9vQaW3DoyBMEWUXPZZEnr5prc=;
 b=h9zSzZwF/tncjIHXnP2naWNfRhEFI/ObUoZhoak91Uu+kyYYmrO6oMEJdJLkRAYnnq
 81nGZoiFobC9cPCRJZcGfYpvAxGQAGkpjynRux0ASh/teM5p2kZy/CTqTeMy3+k9W0Y4
 1G6EixGjCui1z3+CQjcrHYtfPDRl4+xswaBMsXAGub8HMvtpFK+/KAEcZ1cQbnP/F8Jp
 +0aL3kYQTAUSXui6mU3KE4FQn2hnU2XfeUIyJZNlPsyqzR4YeFqJfFRN+8ncAG/5RZmF
 IkaMOaew6Fdcsh2PA62417GYvjNDByCzUARlQg0Ijrfm5Li3SMXDooDLKnS1d8BqOKvl
 ZHhw==
X-Gm-Message-State: AOAM533/rL9WgCCP/jW14LFJmiIeDTcTGAiT/++pUT5yox3RphoVOsn+
 Rumv2ssILzLkwozLa/YIO49QEBU5DnnsgHcPXx33sXN13WeU0i2DsdNJRjse0ZJrcZtuv3syBDC
 ErTeDQ3JlZe0jqjk=
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr23863944wrr.393.1621888602708; 
 Mon, 24 May 2021 13:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq/+Yqv6XLbvG4K629dD46D5Ps0kIjuNPu6zXwvAdorFF/Y10kEHOycXIQ7BSVEhbUe2KwJQ==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr23863931wrr.393.1621888602506; 
 Mon, 24 May 2021 13:36:42 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id i12sm7280263wrr.1.2021.05.24.13.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:36:41 -0700 (PDT)
Date: Mon, 24 May 2021 16:36:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Have virtio_bus_get_vdev_bad_features()
 return 64-bit value
Message-ID: <20210524163604-mutt-send-email-mst@kernel.org>
References: <20210520102822.2471710-1-philmd@redhat.com>
 <20210523040632-mutt-send-email-mst@kernel.org>
 <71329505-7dd7-506f-be64-c366ab6931b6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <71329505-7dd7-506f-be64-c366ab6931b6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Jason Wang <jasowang@redhat.com>, Frederic Konrad <konrad@adacore.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 08:21:48PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/23/21 10:07 AM, Michael S. Tsirkin wrote:
> > On Thu, May 20, 2021 at 12:28:22PM +0200, Philippe Mathieu-Daudé wrote:
> >> In commit 019a3edbb25 ("virtio: make features 64bit wide") we
> >> increased the 'features' field to 64-bit, but forgot to update
> >> the virtio_bus_get_vdev_bad_features() helper. The 'bad features'
> >> are truncated to 32-bit. The virtio_net_bad_features() handler
> >> from the virtio-net devices is potentially affected.
> > 
> > I'm fine with increasing it for consistency, but bad features
> > are all legacy things aren't they? So there isn't a functional
> > issue ... or did I miss anything?
> 
> Are you saying all bad legacy features are < 32-bit and there is no
> potential problem?

I think so yes. I agree with the change, I jus think
it's cosmetic and the commit log should say so.

> > 
> >>
> >> Have the virtio_bus_get_vdev_bad_features() helper return the
> >> full 64-bit value.
> >>
> >> Cc: qemu-stable@nongnu.org
> >> Fixes: 019a3edbb25 ("virtio: make features 64bit wide")
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  include/hw/virtio/virtio-bus.h | 2 +-
> >>  hw/virtio/virtio-bus.c         | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> >> index ef8abe49c5a..f9955ff577a 100644
> >> --- a/include/hw/virtio/virtio-bus.h
> >> +++ b/include/hw/virtio/virtio-bus.h
> >> @@ -122,7 +122,7 @@ uint16_t virtio_bus_get_vdev_id(VirtioBusState *bus);
> >>  /* Get the config_len field of the plugged device. */
> >>  size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus);
> >>  /* Get bad features of the plugged device. */
> >> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
> >> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
> >>  /* Get config of the plugged device. */
> >>  void virtio_bus_get_vdev_config(VirtioBusState *bus, uint8_t *config);
> >>  /* Set config of the plugged device. */
> >> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >> index 859978d2487..25a2b68a234 100644
> >> --- a/hw/virtio/virtio-bus.c
> >> +++ b/hw/virtio/virtio-bus.c
> >> @@ -134,7 +134,7 @@ size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus)
> >>  }
> >>  
> >>  /* Get bad features of the plugged device. */
> >> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
> >> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
> >>  {
> >>      VirtIODevice *vdev = virtio_bus_get_device(bus);
> >>      VirtioDeviceClass *k;
> >> -- 
> >> 2.26.3
> > 


