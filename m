Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54060A7F2D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:20:51 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RT8-0004ea-Co
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i5RR7-0002RK-Kt
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:18:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i5RR6-0000u5-7b
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:18:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i5RR6-0000ti-2K
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:18:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4A3F1CF19;
 Wed,  4 Sep 2019 09:18:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A91D31001284;
 Wed,  4 Sep 2019 09:18:20 +0000 (UTC)
Date: Wed, 4 Sep 2019 10:18:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Message-ID: <20190904091817.GE19582@redhat.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 04 Sep 2019 09:18:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v3 PATCH 00/45] Initial support of
 multi-process qemu
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, mst@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 john.g.johnson@oracle.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 03, 2019 at 04:37:26PM -0400, Jagannathan Raman wrote:
> Started with the presentation in October 2017 made by Marc-Andre (Red Hat)
> and Konrad Wilk (Oracle) [1], and continued by Jag's BoF at KVM Forum 2018,
> the multi-process project is now a prototype and presented in this patchset.
> 
> This first series enables the emulation of lsi53c895a in a separate process.
> 
> We posted the Proof Of Concept patches [2] before the BoF session in 2018.
> Subsequently, we posted RFC v1 [3] & RFC v2 [4] of this series. 
> 
> Thanks to the v1 & v2 review, we were able to incorporate the feedback into
> our goals.
> 
> In the summer of 2019, we participated in a conference with folks at RedHat,
> who provided us with feedback to improve the design of this project. 
> 
> We want to present version 3 of this series which incorporates the feedback
> we received for v2 & the enhancements suggested in the conference. Following
> are the improvements made in this series:

This patch series fails to apply to git master when I attempt and confirmed
by patchew's failed attempt too

  https://patchew.org/QEMU/cover.1567534653.git.jag.raman@oracle.com/

Can you do one of the following

 - Tell us what git hash it was based on instead of master
or
 - provide a pointer to a publically accessible git repo with it applied
or
 - Repost with based on current git master

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

