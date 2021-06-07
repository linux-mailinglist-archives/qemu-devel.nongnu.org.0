Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5AD39E6C9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:42:56 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKD9-0005YY-Me
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqKBs-0004N1-DB
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqKBq-0004Rj-UC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623091294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vr5r/ZFiEeOGlhdmFRCfxRBGHe5jkndAKQvrDK2jWXs=;
 b=FPAqBSuMAWlajzny5mYTjGML3beX4eKfmZ3RquoLBX2qQlv6UaROYENKEm1n3NbZ6OoboQ
 2Efblk2BxVcawstjySGA7tJDEX4m/JXuHtm+JYBNjYt+9JVtcLBa8kDWxoP2tEVPQ/RlAO
 r92QbdVBNlnXqhiFjNGMNMCgoIGzgSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-pqs0KWObNR2M2X1qU0TzBg-1; Mon, 07 Jun 2021 14:41:31 -0400
X-MC-Unique: pqs0KWObNR2M2X1qU0TzBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C1881843F;
 Mon,  7 Jun 2021 18:41:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C205C1C2;
 Mon,  7 Jun 2021 18:41:28 +0000 (UTC)
Date: Mon, 7 Jun 2021 13:41:27 -0500
From: Eric Blake <eblake@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI
 event
Message-ID: <20210607184127.4opm5wiiwcsu4kop@redhat.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-2-danielhb413@gmail.com>
 <YL2DDOkbk+6gpjpF@yekko> <YL2DOSnT0q7tyANl@yekko>
MIME-Version: 1.0
In-Reply-To: <YL2DOSnT0q7tyANl@yekko>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: groug@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 12:23:53PM +1000, David Gibson wrote:
> On Mon, Jun 07, 2021 at 12:23:08PM +1000, David Gibson wrote:
> > On Fri, Jun 04, 2021 at 05:03:52PM -0300, Daniel Henrique Barboza wrote:
> > > At this moment we only provide one event to report a hotunplug error,
> > > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> > > machine is now able to report unplug errors for other device types, such
> > > as CPUs.
> > > 
> > > Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> > > create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> > > unplug errors in the future.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > 
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Markus, I'm happy to take this through my tree if that's convenient
> for you, but I'd like to get an ack.

I'm not Markus, but if you're happy with my interface review,

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


