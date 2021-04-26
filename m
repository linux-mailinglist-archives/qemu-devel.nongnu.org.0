Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E836B4BA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:19:56 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb25b-0005EF-93
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb24M-0004o8-5J
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb24K-0004ks-KP
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619446716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nGcV6wXBg9OmKBdZAxPz3ASV6NRGeoMVPmyxe/a/zk=;
 b=QQ47kKfxefKclhBSrrbdz+vyIinruk82pQXRlm87V58u5kTMy3Xs9pAVA57dJjTe6eliL1
 RwzHBPtVcA+QRVqk+qfytWSDNUajoRwwLUGikHjtvPGBbyzhwZ0ogWMOWEUNofnw4jRKGZ
 JRRBfCOUY3RgwwuS4uHcMBI5HGeN8S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-Tqj88F-lMXe39_4sPYtc3A-1; Mon, 26 Apr 2021 10:18:32 -0400
X-MC-Unique: Tqj88F-lMXe39_4sPYtc3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E4518397A7;
 Mon, 26 Apr 2021 14:18:31 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20BD05D6BA;
 Mon, 26 Apr 2021 14:18:25 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:18:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: X on old (non-x86) Linux guests
Message-ID: <YIbLr64oju1ZZnXQ@work-vm>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <94728962-8306-4849-7e54-e01b04f3ddc4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <94728962-8306-4849-7e54-e01b04f3ddc4@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: kraxel@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 26/04/2021 12:01, Dr. David Alan Gilbert wrote:
> > Hi,
> >   Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> > under QEMU which was pretty neat.  But I failed to find a succesful
> > combination to get X working; has anyone any suggestions?
> > 
> >   That distro was from around 2000; the challenge is since we don't have
> > VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> > doesn't want to play with any of the devices.
> > 
> >   I also tried the ati device, but the accelerated mach64 driver
> > didn't recognise that ID.
> > 
> >   Has anyone found any combo that works?
> > I suspect using one of the existing devices, lying about PCI ID, and
> > then turning off all accelerations might have a chance but I've not got
> > that far.
> > 
> > [Alpha took a bit of a fight; none of the SCSI controllers were
> > happy, but the CMD646 worked well enough to install off a CD image
> > from a -kernel passed in ]
> > 
> 
> Did you try to use kernel framebuffer with X fbdev driver?

I hadn't, but how do I get it into fb mode - vga=ask doesn't work, so
again I don't think I can get into graphics.

Dave

> Thanks,
> Laurent
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


