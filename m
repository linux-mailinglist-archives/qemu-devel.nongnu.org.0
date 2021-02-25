Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7458324C3C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:50:07 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCLW-0005Yt-7W
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFCKb-00059X-DB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFCKY-0007dy-9R
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614242944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuqRAHvPf+XwF+7+V1rYoA0GlPthocsXcLT6gLy4P1o=;
 b=GymOY3nobWaFZxfPp21Jc8gQRL3nb7dcdAj9ujZ+dDzlgvnxQ84niJfX+5gPAax0R1FHOl
 npfQv017xiEfJqRLy/mUcUlHYdCLI0+2XXPi2lfXbkhr7gtazkrODQI+id8RU0BWMleNOU
 d9RBXvLXnVt8irqZIm4F8YeeS9XlMJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-HbyAt_pSPVClror9TO6vwg-1; Thu, 25 Feb 2021 03:48:59 -0500
X-MC-Unique: HbyAt_pSPVClror9TO6vwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36CA650755;
 Thu, 25 Feb 2021 08:48:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E176A709B8;
 Thu, 25 Feb 2021 08:48:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB87818000A7; Thu, 25 Feb 2021 09:48:55 +0100 (CET)
Date: Thu, 25 Feb 2021 09:48:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Message-ID: <20210225084855.lfyv6ybkcctgulo7@sirius.home.kraxel.org>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <3407243.daszWApDLn@silver>
 <5694e258e36c6623aae5465aafeec951@hostfission.com>
 <31652865.Htn8XJslzA@silver>
MIME-Version: 1.0
In-Reply-To: <31652865.Htn8XJslzA@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org,
 =?utf-8?B?Sm9zw6k=?= Pekkarinen <koalinux@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 11:33:14PM +0100, Christian Schoenebeck wrote:
> On Mittwoch, 24. Februar 2021 23:04:47 CET Geoffrey McRae wrote:
> > This goes against how all standard jack clients work, a new jack client
> > should not auto-connect at all unless explicitly configured to as if
> > there is an existing audio diagram configured (which is 99% of the time)
> > it will cause unexpected/undesired behavior.
> > 
> > Jack is not supposed to be an 'automatic' system, it's the
> > responsibility of the patch bay software to route connections.
> > 
> > The auto-connect feature exists to allow the jack audiodev to re-connect
> > a broken connection when the jack device restarts/reconnects.
> 
> Well, that was also my idea first, and I would agree with you in case of a 
> regular music app of course, but then I thought QEMU is probably not an 
> average JACK client, and it simply lowers the entry level for new users who 
> probably just want to output to system out anyway.

Well, I guess there is more software like that, any music player for
example.  I don't think this is a good reason for qemu to have
non-standard behavior.  If you want qemu autoconnect, you can use the
connect-ports option.

Beside that I'd expect the patch bay software is able to remember the
routing configuration per application, so the setup would be a one-time
thing you don't have to re-do on every qemu launch.  Not fully sure this
is actually the case though, I'm not a regular jack user.

take care,
  Gerd


