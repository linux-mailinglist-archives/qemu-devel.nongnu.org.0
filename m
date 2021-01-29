Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894F308848
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:31:21 +0100 (CET)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rzk-0002mG-97
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rg7-0003K9-OI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rg5-0002y6-Uq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611918660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p75THqUGXRXLmi7AhDWvVXHVbsJtDa1C3uqZGY5gbQA=;
 b=jOmaVMmd/C+2xOpuhw33FKR0vsH/cHtKVETz2vGuG/FMDPdTqnRm9vbjL0oD7BmLw5q6hO
 k5yuugnbHsqW7nXf4B6nvz9tc1mW3eu89VxPNRx3Od86k80kEUNDq5/ZVy0Bu8aT1YzdXz
 6KMgnoagweeajLxobVEz7heAz0/NHvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-DlF4y-ntOq2aepWF4z4xQA-1; Fri, 29 Jan 2021 06:10:59 -0500
X-MC-Unique: DlF4y-ntOq2aepWF4z4xQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B3EC80A5C4;
 Fri, 29 Jan 2021 11:10:58 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 366FB1945C;
 Fri, 29 Jan 2021 11:10:54 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:10:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129111051.GG4001740@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129082758.vx6ebmqhk7e332g4@sirius.home.kraxel.org>
 <CAJ+F1CKLO=kBZy32e0kgh26K_9nv3c16hBJmKO+tWzr3wqOFNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKLO=kBZy32e0kgh26K_9nv3c16hBJmKO+tWzr3wqOFNA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 12:34:32PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Jan 29, 2021 at 12:28 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >
> > Well.  That is a completely different level of desktop integration.
> > It surely makes sense to have that, and dbus-over-vsock looks like
> > a reasonable choice.
> >
> 
> (using vsock & dbus also goes in the direction where UIs and remote server
> can run in different processes and come and go btw)
> 
> But I'm more after a solution for the "paste that long link into the
> > guest firefox" problem, without putting everything upside-down 😊
> >
> 
> In this case, I would say an agent-less text-to-type solution (even with
> its very limited scope) is quite attractive.

If you want to implement clipboard paste using text-to-type, then there
is no work required at all in QEMU. That can be done in the VNC client
simply by sending keystrokes. Even for something moderately short like
a URL though this is quite painfully slow because you need a sleep
between each keystroke to avoid overflowing the keyboard driver input
buffers


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


