Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67551D6B9F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 19:54:02 +0200 (CEST)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaNU9-0000ye-Om
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaNT2-0000Bb-Dv
 for qemu-devel@nongnu.org; Sun, 17 May 2020 13:52:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaNT1-0004L6-Q9
 for qemu-devel@nongnu.org; Sun, 17 May 2020 13:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589737970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=QqauE12chVz8judRHlrYZo/VTwCcSh9tKo6YM3FVs2I=;
 b=hIRtPH9LXOnknwZX71d9ZxYgz7hOuroaLyCloGW9YlBpmjCVLZmCatRZlaEYVCQ9NLLne/
 E7wdiCvkx9QRsstgKfGAjJTuuIaT8y0VwmY3wa9OsUuGCcO1gSMRE2dijvQ0g+mXZjewTQ
 v/osQiM8M3hEp7p/7Jmx4O3o++niY0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-XLQwx9HVNeKxVGbgwqEgCw-1; Sun, 17 May 2020 13:52:47 -0400
X-MC-Unique: XLQwx9HVNeKxVGbgwqEgCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26BEC8014D7;
 Sun, 17 May 2020 17:52:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA555C1B2;
 Sun, 17 May 2020 17:52:45 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] docs/s390x: document vfio-ccw
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
References: <20200515151518.83950-1-cohuck@redhat.com>
 <20200515151518.83950-4-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <290bcced-fac8-cc9b-5a63-deab895b3ffd@redhat.com>
Date: Sun, 17 May 2020 19:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515151518.83950-4-cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 13:23:43
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/05/2020 17.15, Cornelia Huck wrote:
> Add a basic example for passing a dasd via vfio-ccw.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/s390x/vfio-ccw.rst | 72 ++++++++++++++++++++++++++++++++++
>  docs/system/target-s390x.rst   |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 docs/system/s390x/vfio-ccw.rst
> 
> diff --git a/docs/system/s390x/vfio-ccw.rst b/docs/system/s390x/vfio-ccw.rst
> new file mode 100644
> index 000000000000..4cfd22c3b789
> --- /dev/null
> +++ b/docs/system/s390x/vfio-ccw.rst
> @@ -0,0 +1,72 @@
> +Subchannel passthrough via vfio-ccw
> +===================================
> +
> +vfio-ccw (based upon the mediated vfio device infrastructure) allows to
> +make certain I/O subchannels and their devices available to a guest. The
> +host will not interact with those subchannels/devices any more.
> +
> +Note that while vfio-ccw should work with most non-QDIO devices, only ECKD
> +DASDs have really been tested.
> +
> +Example configuration
> +---------------------
> +
> +Step 1: configure the host device
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Note: it is recommended to use the ``mdevctl`` tool for this step.
> +
> +To define the same device as configured below to be started
> +automatically, use
> +
> +::
> +
> +   [root@host ~]# driverctl -b css set-override 0.0.0313 vfio_ccw
> +   [root@host ~]# mdevctl define -u 7e270a25-e163-4922-af60-757fc8ed48c6\
> +                  -p 0.0.0313 -t vfio-ccw_io -a
> +
> +If this is not possible or wanted, follow the manual procedure below.
> +
> +* Locate the subchannel for the device (in this example, ``0.0.2b09``)::
> +
> +    [root@host ~]# lscss | grep 0.0.2b09 | awk '{print $2}'
> +    0.0.0313
> +
> +* Unbind the subchannel (in this example, ``0.0.0313``) from the standard
> +  I/O subchannel driver and bind it to the vfio-ccw driver::
> +
> +    [root@host ~]# echo 0.0.0313 > /sys/bus/css/devices/0.0.0313/driver/unbind
> +    [root@host ~]# echo 0.0.0313 > /sys/bus/css/drivers/vfio_ccw/bind
> +
> +* Create the mediated device (identified by a uuid)::
> +
> +    [root@host ~]# uuidgen
> +    7e270a25-e163-4922-af60-757fc8ed48c6

Maybe the uuidgen lines should now be moved before the mdevctl example
already, so that it is already clear there where the uuid comes from?

 Thomas


