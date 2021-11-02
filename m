Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD964429D8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:50:05 +0100 (CET)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpUa-0001yf-A7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhpQr-0005sD-4a
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhpQm-00081x-Kr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635842767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HFgFIDnVJhYbyBrFgV6u1BRJUMu26RfhgosSEngKlo=;
 b=gK2qzVUqdBzjhqSw4Mmlr9TgL1xuPgj5pI0gZOvd9v5AqEaDmCd2J4eWU6dbtB0Kd3XIjr
 K7V3XWyPnlASpc9M62Q0g/zxeEwo+zv+rha+8WnMbaknq6rYQHYP2Uya/razs3UkGUG1/P
 Off+It/fZU2rAfJBO+4ZC0Z1a2YlA7E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-x1KrhqCDOoOPxRd2uQQa8w-1; Tue, 02 Nov 2021 04:46:04 -0400
X-MC-Unique: x1KrhqCDOoOPxRd2uQQa8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso777745wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6HFgFIDnVJhYbyBrFgV6u1BRJUMu26RfhgosSEngKlo=;
 b=S/3vUzorKlBHlbVmh5ECD/TuKyt55jQB+1jwICyuSWaFPVQuI8JKbYuvgVsUDsmYE0
 uxiIfAxLPE1jNVA/Unfazga1pJOgeor5P/iAUB3qZkkg2xC8kSouJy4YlR9Q2U+srjRG
 nVmWaY2ur0bJhupJSaUskYmE52PBYwVS0dvIRrNjKwFXOHQOHH10bcORmal2dObr+q5I
 KaWQ4ylNk8V3rxrgJO+NgVI3+B0pnGahW1rNSP6JuT3xtnhqS+AoPqy9uRglqmUvKfaP
 KCe30R9DmFZ6Rzm1Jn9JZEwXqF8wx1olbddM4mjfjUQRZUhcmcHCdS82Y+4zF/b/UOud
 hWMA==
X-Gm-Message-State: AOAM533LgaGCy4PInlW7EWqOY7tQQEqwVEke0wqMzzYW4sL11uGW+Xv9
 W5r3iFSILTOAAknNQaKETvc4etZnUW95kzjsVbAbes5Wg6Gq2nxuqOn+pG6ggVgqESjYXSy6hD5
 jW27TV2cE4dKKeUA=
X-Received: by 2002:a7b:c109:: with SMTP id w9mr5359506wmi.114.1635842763515; 
 Tue, 02 Nov 2021 01:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR6RCsVh1iN58CC0j7RKx+UOiBGqdIM5IW7JgW2PSKAtb1xMr+G2ZynCq2/HQnTxk9288UuQ==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr5359479wmi.114.1635842763264; 
 Tue, 02 Nov 2021 01:46:03 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:b499:edfc:9aad:137a:a971])
 by smtp.gmail.com with ESMTPSA id h22sm46247wmq.14.2021.11.02.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:46:02 -0700 (PDT)
Date: Tue, 2 Nov 2021 04:45:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] failover: specify an alternate MAC address
Message-ID: <20211102044223-mutt-send-email-mst@kernel.org>
References: <20211027095945.86710-1-lvivier@redhat.com>
 <20211101053105-mutt-send-email-mst@kernel.org>
 <913b4d85-9c05-0bb8-2dd5-02744a44b388@redhat.com>
MIME-Version: 1.0
In-Reply-To: <913b4d85-9c05-0bb8-2dd5-02744a44b388@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 09:14:51AM +0100, Laurent Vivier wrote:
> On 01/11/2021 10:39, Michael S. Tsirkin wrote:
> > On Wed, Oct 27, 2021 at 11:59:45AM +0200, Laurent Vivier wrote:
> > > If the guest driver doesn't support the STANDBY feature, by default
> > > we keep the virtio-net device and don't hotplug the VFIO device,
> > > but in some cases, user can prefer to use the VFIO device rather
> > > than the virtio-net one. We can't unplug the virtio-net device
> > > (because on migration it is expected on the destination side) but
> > > we can keep both interfaces if the MAC addresses are different
> > > (to have the same MAC address can cause kernel crash with old
> > > kernel). The VFIO device will be unplugged before the migration
> > > like in the normal failover migration but without a failover device.
> > > 
> > > This patch adds a new property to the virtio-net device:
> > > "failover-legacy-mac"
> > > 
> > > If an alternate MAC address is provided with "failover-legacy-mac" and
> > > the STANDBY feature is not supported, both interfaces are plugged
> > > but the standby interface (virtio-net) MAC address is set to the
> > > value provided by the "failover-legacy-mac" parameter.
> > > 
> > > If the STANDBY feature is supported by guest and QEMU, the virtio-net
> > > failover acts as usual.
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > 
> > Wait a second. What if config is read before features are set?
> > Are we going to provide a legacy or a new mac?
> We provide the new MAC and at this point the primary device is not plugged.
> 
> When features are set:
> - if STANDBY is set, the primary device is plugged, and secondary
> (virtio-net) uses the new MAC
> - if STANDBY is not set:
>     - if legacy MAC is provided:
>         the primary device is plugged and legacy MAC is used
>     - else
>         the primary device is not plugged and new MAC is used.
> 
> > I guess current guests do not do this, but the spec does allow this,
> > and then the mac will apparently change for the guests.
> 
> What I read in virtio 1.0 specs, "3.1.1 Driver requirements: Device
> initialization", is the virtio configuration space (step 7) is is accessed
> after the features are negotiated. I don't think the part in step 4 can
> involve the MAC address, and moreover the config is not read before, but
> during the negotiation (I guess we can see that as the config access is part
> of the negotiation).
> 
> 3.1.1 Driver Requirements: Device Initialization
> 
> The driver MUST follow this sequence to initialize a device:
> 1. Reset the device.
> 2. Set the ACKNOWLEDGE status bit: the guest OS has notice the device.
> 3. Set the DRIVER status bit: the guest OS knows how to drive the device.
> 4. Read device feature bits, and write the subset of feature bits understood
> by the OS and driver to the device. During this step the driver MAY read
> (but MUST NOT write) the device-specific configuration fields to check that
> it can support the device before accepting it.
> 5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature
> bits after this step.
> 6. Re-read device status to ensure the FEATURES_OK bit is still set:
> otherwise, the device does not support our subset of features and the device
> is unusable.
> 7. Perform device-specific setup, including discovery of virtqueues for the
> device, optional per-bus setup, reading and possibly writing the device’s
> virtio configuration space, and population of virtqueues.
> 8. Set the DRIVER_OK status bit. At this point the device is “live”.

OTOH

Device Requirements: Device Configuration Space
The device MUST allow reading of any device-specific configuration field before FEATURES_OK is set by the
driver. This includes fields which are conditional on feature bits, as long as those feature bits are offered by the
device.

now, we can maybe make an exception for mac.
But this is something to discuss on the virtio TC mailing list.


> > 
> > It might be cleaner to just add a PRIMARY_MAC feature -
> > would need guest work though ...
> 
> We can't add a new feature: the goal of this patch is to be able to use the
> primary device (VFIO) with kernel that doesn't support STANDBY feature. If
> we can add a feature, to add the STANDBY feature would be a better choice.
> 
> If changing the MAC address is not acceptable we can return to a mix of v1 and v2 of my patch:
> 
> "virtio: failover: allow to keep the VFIO device rather than the virtio-net one"
> 
> https://patchew.org/QEMU/20210729191910.317114-1-lvivier@redhat.com/
> 
> that disables the virtio-net driver on the module probe.
> 
> Thanks,
> Laurent


