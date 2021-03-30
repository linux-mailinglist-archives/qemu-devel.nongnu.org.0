Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B8934E58E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:37:06 +0200 (CEST)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBk9-0006WW-Go
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRBj2-00065w-I5
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRBix-0007Gq-Vu
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617100550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7NiLNLmCPmakhFQtO+N7GnlTCalkZohMXJVRHbqTEUA=;
 b=CG2mu+zfX1lp6zcdy0AJQI79bu9XRoEwzO1HZ4xrUJcrcGe5i4x7ufU9vBmcFiMe6ZxA91
 +qW2utNeuuXftAWmmO5cknmEQs2FRNYxpitS+r3m9ZRjSekp+6AH2MHp29clQenU5YNitY
 Hh+Nb63LBD9j8WtDfEWR0DA+owoeL6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-TDNFR3P9PoKRJZQoR9sZDw-1; Tue, 30 Mar 2021 06:35:45 -0400
X-MC-Unique: TDNFR3P9PoKRJZQoR9sZDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D636108BD12;
 Tue, 30 Mar 2021 10:35:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6259E679EE;
 Tue, 30 Mar 2021 10:35:41 +0000 (UTC)
Date: Tue, 30 Mar 2021 11:35:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [RFC v1] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <YGL++3NLdBeN7j4f@redhat.com>
References: <20210328205726.1330291-1-vincent@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <20210328205726.1330291-1-vincent@bernat.ch>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 28, 2021 at 10:57:26PM +0200, Vincent Bernat wrote:
> Type 41 defines the attributes of devices that are onboard. The
> original intent was to imply the BIOS had some level of control over
> the enablement of the associated devices.
> 
> If network devices are present in this table, by default, udev will
> name the corresponding interfaces enoX, X being the instance number.
> Without such information, udev will fallback to using the PCI ID and
> this usually gives ens3 or ens4. This can be a bit annoying as the
> name of the network card may depend on the order of options and may
> change if a new PCI device is added earlier on the commande line.
> Being able to provide SMBIOS type 41 entry ensure the name of the
> interface won't change and helps the user guess the right name without
> booting a first time.
> 
> This can be invoked with:
> 
>     $QEMU -netdev user,id=internet
>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet \
>           -smbios type=41,designation=Onboard LAN,instance=1,kind=ethernet,pci=0000:00:09.0
> 
> Which results in the guest seeing dmidecode data and the interface
> exposed as "eno1":
> 
>     $ dmidecode -t 41
>     # dmidecode 3.3
>     Getting SMBIOS data from sysfs.
>     SMBIOS 2.8 present.Handle 0x2900, DMI type 41, 11 bytes
>     Onboard Device
>             Reference Designation: Onboard LAN
>             Type: Ethernet
>             Status: Enabled
>             Type Instance: 1
>             Bus Address: 0000:00:09.0
>     $ udevadm info -p /sys/class/net/eno1 | grep ONBOARD
>     E: ID_NET_NAME_ONBOARD=eno1
>     E: ID_NET_LABEL_ONBOARD=Onboard LAN
> 
> The original plan was to directly provide a device and populate "kind"
> and "pci" from the device. However, since the SMIBIOS tables are built
> during argument evaluation, the information is not yet available.
> I would welcome some guidance on how to implement this.

I'm not sure I see the problem you're describing here, could
you elaborate ?

I see SMBIOS tables are built by  smbios_get_tables() method.
This is called from qemu_init(), after all arguents have been
processed and devices have been created.

It seems like this should allow SMBIOS tables to be auto-populated
from the NICs listed in -device args previously.


Note, if we're going to auto-populate the SMBIOS type 41 tabes
from -device args, then we'll need to make this behaviour
configurable via a property, so that we can ensure this only
applies to new machine types.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


