Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D9133EE32
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:18:52 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTGN-0007Qy-1l
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMTEe-0006Wa-QF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMTEa-00054V-6Q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Drg9G8LXBGimswTfbkZ4pWoj7bThSUhQYRn61vOl5c=;
 b=OdwKl13OmMLLedcMjW6ZYt1GSqTqHf9kKw25nHQuUi9kydPlOdDGg1v3t/oXHcDtybaYyp
 WG6/sG8O+RC9DHTzoMt32e1cBA68M0nJYNJ7DF38ey1sj8BDC3/9Ey/m2o7eVbP/wE8AQc
 KisQVcC8wlTPWDHCK1vKh9e7o6kPGNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-DesZLhIHPbeVM3qgb8ptig-1; Wed, 17 Mar 2021 06:16:57 -0400
X-MC-Unique: DesZLhIHPbeVM3qgb8ptig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD1680006E
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:16:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A03F5D74F;
 Wed, 17 Mar 2021 10:16:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C7E59180038B; Wed, 17 Mar 2021 11:16:50 +0100 (CET)
Date: Wed, 17 Mar 2021 11:16:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Half a usb-redir idea
Message-ID: <20210317101650.2jyc67vy7y7yasgo@sirius.home.kraxel.org>
References: <YFDo/oHikOEcXFcg@work-vm>
 <20210317062404.bkl5s4qmtaeg2yeo@sirius.home.kraxel.org>
 <YFHHm8CWwUUc2B7o@work-vm>
MIME-Version: 1.0
In-Reply-To: <YFHHm8CWwUUc2B7o@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: victortoso@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 09:10:51AM +0000, Dr. David Alan Gilbert wrote:
> * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > On Tue, Mar 16, 2021 at 05:21:02PM +0000, Dr. David Alan Gilbert wrote:
> > > Hi,
> > >   I've got a half-baked idea, which I thought might be worth mentioning.
> > > 
> > > How hard would it be to give qemu a usbredir server rather than client?
> > 
> > The usb part is probably not that hard.  The devices are not standalone
> > though.  Tricky is the integration with the rest of qemu, with the input
> > subsystem (hid devices), chardevs (usb-serial), network (usb-net), sound
> > (usb-audio), block (usb-storage), ...
> 
> As long as this was still the qemu binary would that be a problem?

Well, depends a bit on where you are heading to ...

If you just want move usb emulation to a separate process (using the
multi-process qemu infrastructure, or using something like "qemu
-machine none -device usbredirserver") then no, for the most part it
wouldn't be a problem.  You can just add chardevs, netdevs and blockdevs
to the usbredirserver qemu process then.  input + hid devices are still
a bit tricky though.

If you want refactor usb emulation to move it into a library and allow
reuse outside qemu (see vncviewer idea elsewhere in the thread) it would
be more of a problem of course.

> > ccid and u2f are probably easierst.
> > mtp should not be hard too.
> > maybe storage when limiting support to storage daemon.
> > then it'll be tricky.
> > maybe the multi-process qemu effort solves (some of) these problems.
> 
> It doesn't handle remote does it?

Not fully sure, but I think vfio-user depends on a shared mapping of
guest ram, so no remote support.

take care,
  Gerd


