Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F029A1D493E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:16:52 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWSa-0002ol-08
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jZWQz-0001Mn-SK
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:15:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49502
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jZWQy-0004OE-L6
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589534111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7igWknBSuzQCUC39j5k5ojzyzBP37dzEvLf2r/InQA=;
 b=LUAAzpAGze8hs5Ri2r9JWXj0oVCBhe4Kkw4xEBM9iXgJKg7SOvYbHSuCzHqF+cPcoPEHO4
 8SOsEpxZezboRv92CwlOZQr4Ln3l4ueQCxOAP5v9S1yA3eUzRg8k6Wg/Ggwp0904QC6UQQ
 OKbwNzNWoCyQNFAvaqyHoE/4mqzCzpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ehThMSl4NPCx6WtUYGI9Zw-1; Fri, 15 May 2020 05:15:09 -0400
X-MC-Unique: ehThMSl4NPCx6WtUYGI9Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 035448005AD;
 Fri, 15 May 2020 09:15:09 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22C1D579A0;
 Fri, 15 May 2020 09:15:07 +0000 (UTC)
Date: Fri, 15 May 2020 11:15:05 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] docs/s390x: document vfio-ccw
Message-ID: <20200515111505.06699d91.cohuck@redhat.com>
In-Reply-To: <3326e2c5-d569-57f4-0bd0-615a4fa289f8@redhat.com>
References: <20200505135025.14614-1-cohuck@redhat.com>
 <20200505135025.14614-4-cohuck@redhat.com>
 <3326e2c5-d569-57f4-0bd0-615a4fa289f8@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 May 2020 09:54:44 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 05/05/2020 15.50, Cornelia Huck wrote:
> > Add a basic example for passing a dasd via vfio-ccw.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  docs/system/s390x/vfio-ccw.rst | 58 ++++++++++++++++++++++++++++++++++
> >  docs/system/target-s390x.rst   |  1 +
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 docs/system/s390x/vfio-ccw.rst
> > 
> > diff --git a/docs/system/s390x/vfio-ccw.rst b/docs/system/s390x/vfio-ccw.rst
> > new file mode 100644
> > index 000000000000..3b465578971f
> > --- /dev/null
> > +++ b/docs/system/s390x/vfio-ccw.rst
> > @@ -0,0 +1,58 @@
> > +Subchannel passthrough via vfio-ccw
> > +===================================
> > +
> > +vfio-ccw (based upon the mediated vfio device infrastructure) allows to
> > +make certain I/O subchannels and their devices available to a guest. The
> > +host will not interact with those subchannels/devices any more.
> > +
> > +Note that while vfio-ccw should work with most non-QDIO devices, only ECKD
> > +DASD have really been tested.  
> 
> s/DASD/DASDs/ ?

I've seen 'DASD' used both as singular and as plural. Can use 'DASDs'
if that is less confusing.

> 
> > +Example configuration
> > +---------------------
> > +
> > +Step 1: configure the host device
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Note: it is recommended to use the ``mdevctl`` tool for this step.  
> 
> Can you also give an example on how to use it?

Maybe

"To define the same device as configured below to be started
automatically, use

::

   [root@host ~]+ driverctl -b css set-override 0.0.0313 vfio_ccw
   [root@host ~]# mdevctl define -u 7e270a25-e163-4922-af60-757fc8ed48c6 \
                  -p 0.0.0313 -t vfio-ccw_io -a
"

> 
> > If this
> > +is not possible or wanted, follow the manual procedure below.
> > +
> > +* Locate the subchannel for the device (in this example, ``0.0.2b09``)::
> > +
> > +    [root@host ~]# lscss | grep 0.0.2b09 | awk '{print $2}'
> > +    0.0.0313  
> 
> I'd remove the "[root@host ~]" part from all examples.

I'd rather keep them, just to make it clear where each command is
issued (there are commands issued in the guest in step 2.)

> 
> > +* Unbind the subchannel (in this example, ``0.0.0313``) from the standard
> > +  I/O subchannel driver and bind it to the vfio-ccw driver::
> > +
> > +    [root@host ~]# echo 0.0.0313 > /sys/bus/css/devices/0.0.0313/driver/unbind
> > +    [root@host ~]# echo 0.0.0313 > /sys/bus/css/drivers/vfio_ccw/bind
> > +
> > +* Create the mediated device (identified by a uuid)::
> > +
> > +    [root@host ~]# uuidgen
> > +    7e270a25-e163-4922-af60-757fc8ed48c6
> > +    [root@host ~]# echo "7e270a25-e163-4922-af60-757fc8ed48c6" > /sys/bus/css/devices/0.0.0313/mdev_supported_types/vfio_ccw-io/create  
> 
> Maybe break the long line with a backslash?

Makes sense.

> 
> > +Step 2: configure QEMU
> > +~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +* Reference the created mediated device and (optionally) pick a device id to
> > +  be presented in the guest (here, ``fe.0.1234``, which will end up visible
> > +  in the guest as ``0.0.1234``::
> > +
> > +    -device vfio-ccw,devno=fe.0.1234,sysfsdev=/sys/bus/mdev/devices/7e270a25-e163-4922-af60-757fc8ed48c6
> > +
> > +* Start the guest. The device (here, ``0.0.1234``) should now be usable::
> > +
> > +    [root@guest ~]# lscss -d 0.0.1234
> > +    Device   Subchan.  DevType CU Type Use  PIM PAM POM  CHPIDs           
> > +    ----------------------------------------------------------------------
> > +    0.0.1234 0.0.0007  3390/0e 3990/e9      f0  f0  ff   1a2a3a0a 00000000
> > +    [root@guest ~]# chccwdev -e 0.0.1234
> > +    Setting device 0.0.1234 online  
> Here I'd add a sentence saying that you could run "dmesg -t" now to
> check the kernel log. Then omit the timestamp in the example output
> below, that will shorten the lines quite a bit.

Makes sense as well.

> 
> > +    [  197.011652] dasd-eckd 0.0.1234: A channel path to the device has become operational
> > +    [  197.014468] dasd-eckd 0.0.1234: New DASD 3390/0E (CU 3990/01) with 10017 cylinders, 15 heads, 224 sectors
> > +    [  197.045606] dasd-eckd 0.0.1234: DASD with 4 KB/block, 7212240 KB total size, 48 KB/track, compatible disk layout
> > +    [  197.049034]  dasda:VOL1/  0X2B09: dasda1  
> 
>  Thomas


