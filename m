Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613FA22C95B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 17:36:54 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyzkj-0002mC-Dk
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 11:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyzji-0001sf-VB
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 11:35:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29130
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyzjh-0007TE-9B
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 11:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595604948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9huhVfqMPBTYARf2E7KOQ3UUt5p5pzZu3ITSEz/R4w=;
 b=ZUHtIa+ctXWLVjh2ug5Szf3/q+Y1huJ2XZ+S+ZqoqpBo/1pW1q+mi1YbfC8X798L02W9v1
 5ioQHRyWPXiua2lvvL9mn/1k+ryn/6u/6TqMlWtrnPdis8fxjyNqpfv01dbUAJxipH+FlG
 O/W9E3OXFWdDaO8/UwKrUpcBVbxDzLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-heTaJFuSMNmG3HINoV8-Og-1; Fri, 24 Jul 2020 11:35:47 -0400
X-MC-Unique: heTaJFuSMNmG3HINoV8-Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2B7491273;
 Fri, 24 Jul 2020 15:35:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41FB310013D9;
 Fri, 24 Jul 2020 15:35:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E3539D8F; Fri, 24 Jul 2020 17:35:44 +0200 (CEST)
Date: Fri, 24 Jul 2020 17:35:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Possible regression with VGA and resolutions in Windows 10?
Message-ID: <20200724153544.7lgxqp3ecv2i6nnz@sirius.home.kraxel.org>
References: <24909a16-be74-7516-b5c5-08bdc743a553@proxmox.com>
 <20200724094120.dptmucij4phzd3od@sirius.home.kraxel.org>
 <1ee13b41-3ed7-8dd4-99b7-e325e95878d5@proxmox.com>
 <20200724141032.jmub3zixekeyy3x3@sirius.home.kraxel.org>
 <20200724143123.GF3146350@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200724143123.GF3146350@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 08:23:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aaron Lauterer <a.lauterer@proxmox.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 24, 2020 at 03:31:23PM +0100, Daniel P. Berrangé wrote:
> On Fri, Jul 24, 2020 at 04:10:32PM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > The behavior is similar when setting a custom resolution with the xres
> > > and yres parameters. Setting it the first time works fine and it is
> > > shown along with the short list. Setting it to something different on
> > > the next boot will not be recognized unless the display adapter is
> > > uninstalled and the VM rebooted.
> > 
> > Interesting.  Seems Windows caches the list of resolutions (or the edid
> > blob) somewhere in the registry instead of loading it on every boot.
> > I've seen simliar behavior with usb device info.
> > 
> > [ something for the 5.1 release notes I think, thanks for testing this ]
> 
> Do we need to be disabling edid in the old machine types to prevent this
> change in guest ABI due to the changed BIOS ?
> 
> eg existing VMs using a versioned machine type shouldn't suddenly get edid
> enabled where previously it was not present. Only VMs using the new 5.1 or
> unversioned machine types should see the change in behaviour.

Well, the *device* feature actually is versioned, but it is present in
qemu for quite a while already.  Now the *vgabios* update makes the edid
available via bios interface.  We have two independent changes, so it
isn't that simple ...

take care,
  Gerd


