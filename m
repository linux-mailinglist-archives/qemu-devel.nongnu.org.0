Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8F11F2C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 17:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMDzA-0000BZ-36
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 11:51:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hMDxB-0007Uc-Px
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hMDxA-0002rk-Ma
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:48:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hMDxA-0002rQ-Gf
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:48:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 569403092645;
	Thu,  2 May 2019 15:48:55 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6996608B9;
	Thu,  2 May 2019 15:48:51 +0000 (UTC)
Date: Thu, 2 May 2019 16:48:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20190502154849.GH15718@redhat.com>
References: <20190412121626.19829-1-berrange@redhat.com>
	<20190412121626.19829-4-berrange@redhat.com>
	<a0e3bdd6-6003-1fb9-4d52-315b6441e966@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0e3bdd6-6003-1fb9-4d52-315b6441e966@vivier.eu>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 02 May 2019 15:48:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/5] sockets: avoid string truncation
 warnings when copying UNIX path
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 02, 2019 at 05:45:30PM +0200, Laurent Vivier wrote:
> Dan,
> 
> do you want I take this through the trivial branch queue or do you add
> it into the Sockets branch queue?

I'm fine with you sending it via trivial queue since there's nothing
else pending for the sockets code.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

