Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919F3A1616
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:49:46 +0200 (CEST)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyaX-0004cY-3K
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqyZN-0003dE-7w
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqyZJ-0000ht-83
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623246501;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSt4vP+bHRcLuGbf0X4xiF4b+gqdBzUu6twwpNv17rU=;
 b=ErE/Fe9LX8/GF6Ko3FqAGL2br8QHNgrwwrucGkOXzc91/eMx0vQJ/V7dOIS0G2JVAGxmYp
 0kOLbB+4K/xQ3pTuaF02PALApGcmDzORHZI69OimGehInT0pD9P3IwQuSZReXToKqeiBCg
 fSKTKZCQYeQicMHRsn1sBCuqrr6iPRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-ik4Sx_DOPdKaVZ-C7jKbIw-1; Wed, 09 Jun 2021 09:48:14 -0400
X-MC-Unique: ik4Sx_DOPdKaVZ-C7jKbIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A56195D562;
 Wed,  9 Jun 2021 13:48:13 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52DC418A69;
 Wed,  9 Jun 2021 13:48:12 +0000 (UTC)
Date: Wed, 9 Jun 2021 14:48:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: map x32 to cpu_family x86_64 for meson
Message-ID: <YMDGmRRx89bCA7ds@redhat.com>
References: <878s3jrzm0.fsf@gmail.com> <YMC38baIdFTL/q+f@redhat.com>
 <CAFEAcA-4cakv+K2D0Fy67kFrY3J4SdDUJJ=J89Pp-YX5n=3WvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4cakv+K2D0Fy67kFrY3J4SdDUJJ=J89Pp-YX5n=3WvA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Michael <fedora.dm0@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 02:30:09PM +0100, Peter Maydell wrote:
> On Wed, 9 Jun 2021 at 13:48, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jun 09, 2021 at 08:28:39AM -0400, David Michael wrote:
> > > The meson.build file defines supported_cpus which does not contain
> > > x32, and x32 is not one of meson's stable built-in values:
> > > https://mesonbuild.com/Reference-tables.html#cpu-families
> > >
> > > Signed-off-by: David Michael <fedora.dm0@gmail.com>
> > > ---
> > >
> > > Hi,
> > >
> > > QEMU fails to build for x32 due to that cpu_family not being defined in
> > > supported_cpus.  Can something like this be applied?
> > >
> > > Alternatively, maybe it could be added to supported_cpus and accepted
> > > everywhere that matches x86 in meson.build, but upstream meson does not
> > > define a CPU type for x32.
> >
> > "supported_cpus" serves two distinct purposes in meson.build
> >
> >  - Identifies whether TCG supports the target
> >  - Identifies whether QEMU maintainers consider the target supported
> >
> > The change proposed below makes x32 be treated the same as x86_64.
> 
> I feel like it's more "fixing a regression we introduced by accident
> at some point". Looking at the 5.1 configure script (which predates
> the meson conversion) x32 is marked as a supported cpu. Currently it
> isn't, so that's a regression. (I don't have the setup to bisect that
> right now, but it would be interesting to confirm where it stopped
> working.) Whether we feel that we no longer want to support x32 is
> a separate question and we'd need to go through our usual deprecation
> process if we did want to drop it.

Ah, I missed that it was previously working.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


