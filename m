Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630A36B13A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:07:03 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lay8r-0006Ej-Vw
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lay3k-0002mW-Cz
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lay3i-0000XU-Cc
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619431298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=demjBR19X23IowIjNsz0OWEkbTMMEinzPyVrBekK51k=;
 b=FReS/0BrzJqbq5SfprrLCkYxPIOCxuitVGIJoeShlqUdtkaNhrORX0qLk0RIA8xgALpQLK
 L+MQAS/SITAKpg7JSsPdGDJj7ssvRxiDdMUmptMLq7MZZFIqvYC03srwIztYm/cKW4DzLw
 vCPj67En0Yc7Y/b+lFAVq4P5oAeuI0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-n49Xm32FMXilBjewD8izdg-1; Mon, 26 Apr 2021 06:01:36 -0400
X-MC-Unique: n49Xm32FMXilBjewD8izdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9987F8026AD;
 Mon, 26 Apr 2021 10:01:35 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E2C5D9D0;
 Mon, 26 Apr 2021 10:01:29 +0000 (UTC)
Date: Mon, 26 Apr 2021 11:01:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 kraxel@redhat.com
Subject: X on old (non-x86) Linux guests
Message-ID: <YIaPdjz7PpvwVPP/@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
under QEMU which was pretty neat.  But I failed to find a succesful
combination to get X working; has anyone any suggestions?

  That distro was from around 2000; the challenge is since we don't have
VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
doesn't want to play with any of the devices.

  I also tried the ati device, but the accelerated mach64 driver
didn't recognise that ID.

  Has anyone found any combo that works?
I suspect using one of the existing devices, lying about PCI ID, and
then turning off all accelerations might have a chance but I've not got
that far.

[Alpha took a bit of a fight; none of the SCSI controllers were
happy, but the CMD646 worked well enough to install off a CD image
from a -kernel passed in ]


Dave
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


