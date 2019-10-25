Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72137E4912
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 12:59:26 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNxJV-0006Y9-Ad
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iNxDC-0007Q5-BJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iNxDA-00079P-Dx
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:52:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50468
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iNxD8-00075d-RV
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572000765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhpUIt5yIRBRg40E93itayqlpGzKp9Gcak/Qn5btJFI=;
 b=f+PVQx45TPn2xuwdnQCAL2jWpZZuUUOk1STEuEQQEJHcOV8K3U8MzWdhkxRz9q4RNkMkrf
 3+pFBcNXjpVcKGqbIjS8IPvt0hZRDScckBfQVUArOzIkoVxDYAAwp/oJsiNmuXwCeWYxlN
 jubGq3jNmbmxJJOJRgTPSNLCJQP1qtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-GblkZdmsPDOoPtore0DPJg-1; Fri, 25 Oct 2019 06:52:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE8F5F2;
 Fri, 25 Oct 2019 10:52:41 +0000 (UTC)
Received: from localhost (ovpn-117-235.ams2.redhat.com [10.36.117.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C1A5D712;
 Fri, 25 Oct 2019 10:52:33 +0000 (UTC)
Date: Fri, 25 Oct 2019 12:52:32 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 02/11] pci: add option for net failover
Message-ID: <20191025105232.gp22qlwjgpqsumie@jenstp.localdomain>
References: <20191023082711.16694-1-jfreimann@redhat.com>
 <20191023082711.16694-3-jfreimann@redhat.com>
 <20191023120648.57e50ae1@x1.home>
MIME-Version: 1.0
In-Reply-To: <20191023120648.57e50ae1@x1.home>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: GblkZdmsPDOoPtore0DPJg-1
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

On Wed, Oct 23, 2019 at 12:06:48PM -0600, Alex Williamson wrote:
>On Wed, 23 Oct 2019 10:27:02 +0200
>Jens Freimann <jfreimann@redhat.com> wrote:
[...]
>> @@ -2101,6 +2104,20 @@ static void pci_qdev_realize(DeviceState *qdev, E=
rror **errp)
>>          }
>>      }
>>
>> +    if (pci_dev->net_failover_pair_id) {
>> +        if (!pci_is_express(pci_dev)) {
>> +            error_setg(errp, "failover device is not a PCIExpress devic=
e");
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>
>Did we decide we don't need to test that the device is also in a
>hotpluggable slot?  Are there also multi-function considerations that
>should be prevented or documented?  For example, if a user tries to
>configure both the primary and failover NICs in the same slot, I assume
>bad things will happen.

I added this check

        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
            && (PCI_FUNC(pci_dev->devfn) =3D=3D 0)) {
            qdev->allow_unplug_during_migration =3D true;
        } else {
            error_setg(errp, "failover: primary device must be in its own "
                              "PCI slot");
            error_propagate(errp, local_err);
            pci_qdev_unrealize(DEVICE(pci_dev), NULL);
            return;
        }

When I first add a vfio-pci with net_failover_pair_id=3Dx,multifunction=3Do=
n
and addr=3D0.0 I will now get an error.

(qemu) device_add vfio-pci,...,bus=3Droot2,net_failover_pair_id=3Dnet1,mult=
ifunction=3Don,addr=3D0.0
Error: failover: primary device must be in its own PCI slot

If I put in a virtio-net device in slot 0 and then try to add a
vfio-pci device in the same slot I get the following error message:

-device virtio-net-pci,...id=3Dnet1bus=3Droot1,failover=3Don,multifunction=
=3Don,addr=3D0.0
(qemu) device_add vfio-pci,id=3Dhostdev1,host=3D0000:5e:00.2,bus=3Droot1,ne=
t_failover_pair_id=3Dnet1,addr=3D0.1
Error: PCI: slot 0 function 0 already ocuppied by virtio-net-pci,
   new func vfio-pci cannot be exposed to guest.


regards,
Jens


