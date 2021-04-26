Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DD36B496
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:16:22 +0200 (CEST)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb229-00048i-1X
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb20R-0003NM-RK
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb20P-00029i-5x
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619446472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+SUi6wlhWSB1/RiNNmLUogSk1NQvxEu8qgq5CnmOhNw=;
 b=awnitE/HWMvB1W1cNjn5LuCN8rceX8CxxYFX7eOf3rnJMv0x7Q+y6CTeE1vVGIwioB8V86
 gOWapy5n3OFeaSsAU80j7LXks/hJY10wk6vMsw3TnOik010YGde8oPnMPtTA6iXqud8zlm
 EcKHXYx7FFnoywZHhL+qcxI+32CD4KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-fPqh8GjaP8aMlWG92lEABw-1; Mon, 26 Apr 2021 10:14:28 -0400
X-MC-Unique: fPqh8GjaP8aMlWG92lEABw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D406D587;
 Mon, 26 Apr 2021 14:14:27 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 451395D740;
 Mon, 26 Apr 2021 14:14:20 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:14:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <th.huth@posteo.de>
Subject: Re: X on old (non-x86) Linux guests
Message-ID: <YIbKukgZtdiXslMN@work-vm>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <dc3bad6e-3a44-f5c1-e9d4-0bf51a682215@posteo.de>
MIME-Version: 1.0
In-Reply-To: <dc3bad6e-3a44-f5c1-e9d4-0bf51a682215@posteo.de>
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
Cc: Thomas Huth <thuth@redhat.com>, kraxel@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (th.huth@posteo.de) wrote:
> On 26/04/2021 12.01, Dr. David Alan Gilbert wrote:
> > Hi,
> >    Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> > under QEMU which was pretty neat.  But I failed to find a succesful
> > combination to get X working; has anyone any suggestions?
> > 
> >    That distro was from around 2000; the challenge is since we don't have
> > VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> > doesn't want to play with any of the devices.
> > 
> >    I also tried the ati device, but the accelerated mach64 driver
> > didn't recognise that ID.
> > 
> >    Has anyone found any combo that works?
> 
> Not sure if it is of any help, but IIRC the advent calendar image #4 from
> the 2014 edition also uses an ancient Red Hat image with X, and it still
> seems to be working with recent versions of QEMU:
> 
>  https://www.qemu-advent-calendar.org/2014/#day-4
> 
> Maybe you could copy the config from that image?

That's using the VESA driver, which we generally don't have on non-x86.

Dave

>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


