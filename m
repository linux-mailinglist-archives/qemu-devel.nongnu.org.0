Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBADDF6C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 22:31:04 +0200 (CEST)
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMeKU-0005jf-U4
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 16:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iMeIp-0005Hi-HE
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:29:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iMeIm-0000H1-ID
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:29:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40056
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iMeIm-0000Fl-C9
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571689753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8xy8RzXx7PiD+PTi0V/fXZQuAkgByYbbU3JKVO99NA=;
 b=Yan6nijMR/ZagEb/vZyaTyzPxYRJcqbJ+MxCiCrcIs0QGoH9nSrtvSM8HQHARfHuNFBB98
 rFOSPSvuani5lTK+QxFZO6hiGkiVbRDZrBEbnXIg0zu1a/AQxnXKxRpF9Cgz3ya6Jh3L13
 l4YhzvKuiRNBbdKLfz1ySKAOqiT0pQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-KA3FWAtHPeWb_EMAeN-p2g-1; Mon, 21 Oct 2019 16:29:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C02E100550E;
 Mon, 21 Oct 2019 20:29:07 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0312194BE;
 Mon, 21 Oct 2019 20:28:59 +0000 (UTC)
Date: Mon, 21 Oct 2019 22:28:57 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 02/11] pci: add option for net failover
Message-ID: <20191021202857.xacalrfr3olhaj22@jenstp.localdomain>
References: <20191018202040.30349-1-jfreimann@redhat.com>
 <20191018202040.30349-3-jfreimann@redhat.com>
 <20191021085823.72ac4b37@x1.home>
 <20191021184546.n5iddctnnlxe3tay@jenstp.localdomain>
 <20191021130122.2787245f@x1.home>
MIME-Version: 1.0
In-Reply-To: <20191021130122.2787245f@x1.home>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KA3FWAtHPeWb_EMAeN-p2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 laine@redhat.com, ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 21, 2019 at 01:01:22PM -0600, Alex Williamson wrote:
>On Mon, 21 Oct 2019 20:45:46 +0200
>Jens Freimann <jfreimann@redhat.com> wrote:
>
>> On Mon, Oct 21, 2019 at 08:58:23AM -0600, Alex Williamson wrote:
>> >On Fri, 18 Oct 2019 22:20:31 +0200
>> >Jens Freimann <jfreimann@redhat.com> wrote:
>> >
>> >> This patch adds a net_failover_pair_id property to PCIDev which is
>> >> used to link the primary device in a failover pair (the PCI dev) to
>> >> a standby (a virtio-net-pci) device.
>> >>
>> >> It only supports ethernet devices. Also currently it only supports
>> >> PCIe devices. QEMU will exit with an error message otherwise.
>> >
>> >Doesn't the PCIe device also need to be hotpluggable?  We can have PCIe
>> >devices attached to the root bus where we don't currently support
>> >hotplug.  Thanks,
>>
>> How do I recognize such a device? hotpluggable in DeviceClass?
>
>I wouldn't expect it to be a device property, it's more of a function
>of whether the bus that it's attached to supports hotplug, so probably
>something related to the bus controller.  Thanks,

IIUC this is checked for in qdev_device_add() by this:

  if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
        return NULL;
  }

So qemu will fail with 'Bus pcie.0 does not allow hotplug' when we try=20
to hotplug the device. I tried a primary with bus=3Dpcie.0 and it aborted.
Aborting qemu is not nice so I'll make it print a error message
QERR_BUS_NO_HOTPLUG instead but let it continue. This will be
a change in the virtio-net patch, not in this one.=20

regards,
Jens=20


