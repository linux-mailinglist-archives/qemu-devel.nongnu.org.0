Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B846347781
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:37:30 +0100 (CET)
Received: from localhost ([::1]:60414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1pI-0008Li-Qj
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lP1oU-0007vx-EO
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lP1oJ-0005mr-Qq
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616585784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7cA28A6YJOQT/dExBgT6p5uwd7T/PUKtqrtOe4UYb8=;
 b=Z16GYfM65iS4WlWVEvereWCxmhxbjC/aofIQRB0HDRLjMUiDdlM5gTfmqSx3qUgV5LZhWO
 4sUa4Ep2Lr4m/4Qe8iTScQexOkkW5/It8/Af08Ma5Eaf9Z6mxsXq1TqPlXhz3bFDuyvOv+
 ixeGZq3o1HZbgfAtZyJy0ltOpWwLFdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Nrrp3NspNRuee98Alu-o5A-1; Wed, 24 Mar 2021 07:36:18 -0400
X-MC-Unique: Nrrp3NspNRuee98Alu-o5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD40481622;
 Wed, 24 Mar 2021 11:36:17 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A725D9D0;
 Wed, 24 Mar 2021 11:36:15 +0000 (UTC)
Date: Wed, 24 Mar 2021 11:36:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 0/2] yank: Always link full yank code
Message-ID: <YFskLauf5ZZ4RJwi@redhat.com>
References: <cover.1616521341.git.lukasstraub2@web.de>
 <YFo82zpHQf+zQ8+Q@redhat.com>
 <20210324122242.6843f29e@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210324122242.6843f29e@gecko.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 12:22:42PM +0100, Lukas Straub wrote:
> On Tue, 23 Mar 2021 19:09:15 +0000
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Tue, Mar 23, 2021 at 06:52:19PM +0100, Lukas Straub wrote:
> > > Hello Everyone,
> > > These patches remove yank's dependency on qiochannel and always link it in.
> > > Please Review.  
> > 
> > It would be useful if the cover letter or commit messages explained
> > to potential reviewers why this is being changed... The first patch
> > feels like a regression to me, without seeing an explanation why
> > it is desirable.
> 
> Yes, sorry. There are two reasons for this patchset:
> -To exercise the full yank code (with checks for registering and unregistering
>  of yank functions and instances) in existing tests and in the new yank test
>  (https://lore.kernel.org/qemu-devel/cover.1616521487.git.lukasstraub2@web.de/)
> -To replace "[PATCH] yank: Avoid linking into executables that don't want it"
>  (https://lore.kernel.org/qemu-devel/20210316135907.3646901-1-armbru@redhat.com/)
>  Now we always link in yank, but without pulling in other dependencies.

Conceptually, the real world usage of yank is in combination with parts
of QEMU doing I/O, and so they will always have the "io" subsystem
available. Thus it feels wrong to be refactoring this to avoid an
"io" dependancy.  I think this probably suggests that the yank code
shouldn't be in libqemuutil.la, but instead part of the "io" subsystem
to make the association/dependency explicit


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


