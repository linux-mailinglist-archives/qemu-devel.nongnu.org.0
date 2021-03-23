Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173834628D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:15:20 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOikZ-0008UB-Ma
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOiim-0007Pv-UG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOiif-0007HU-Qm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616512400;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hzyy/awcdv7H5uUh22LtX97WCPic72BG28hngTJpVIg=;
 b=I7m1b9fL2qwRf3cTU/E+oSfOTFlNDb/6i51Mky5rwlWINvDTwIk99xv4SmmZy7sPI51fxX
 ze3czkuSqemKvRBKfQ1zeb3pCwJT6QBeGEZj1yT4w89yGE5De1X3MIxA5QzzAVurURg1x1
 DVCQ4jUicg18CEriPVndwjSfP4LOIXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-fJMteKRVO-SLKEBlzU05Yw-1; Tue, 23 Mar 2021 11:13:15 -0400
X-MC-Unique: fJMteKRVO-SLKEBlzU05Yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75F21034B04;
 Tue, 23 Mar 2021 15:13:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C233A6087C;
 Tue, 23 Mar 2021 15:13:12 +0000 (UTC)
Date: Tue, 23 Mar 2021 15:13:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2] meson: Propagate gnutls dependency to migration
Message-ID: <YFoFheBimYMEnqHP@redhat.com>
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <20210320171221.37437-1-jrtc27@jrtc27.com>
 <87mtutewrz.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87mtutewrz.fsf@secure.mitica>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: qemu-trivial@nongnu.org, Jessica Clarke <jrtc27@jrtc27.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 04:04:48PM +0100, Juan Quintela wrote:
> Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> > for softmmu configs, which pull in migration's use of gnutls.
> >
> > This fixes the following compilation failure on Arm-based Macs:
> >
> >   In file included from migration/multifd.c:23:
> >   In file included from migration/tls.h:25:
> >   In file included from include/io/channel-tls.h:26:
> >   In file included from include/crypto/tlssession.h:24:
> >   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
> >   #include <gnutls/gnutls.h>
> >            ^~~~~~~~~~~~~~~~~
> >   1 error generated.
> >
> > (as well as for channel.c and tls.c)
> >
> > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> I would preffer to be the other way around, i.e. modularize tls out of
> migration, but a fast look at it shows it as a big job.  As said on the
> commint message, channel.c & tls.c both use tls not conditionally.
> Once there, multifd.c also requires tls compiled in.
> Can we realistically build qemu without tls nowadays?

The intention is that use of TLS is conditionalized *only* in the
crypto/tls*.c and include/crypto/tls*.h files.

The rest of QEMU is supposed to use TLS unconditionally, and will
simply get an error message at runtime if it was unavailable. This
is precisely to avoid littering the whole codebase in QEMU with
conditionals on GNUTLS.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


