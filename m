Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641E25291E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 10:23:48 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAqig-0003ZA-Mp
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 04:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAqhs-00037j-Or
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:22:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45932
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAqhq-0006rp-9n
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598430173;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWzf37gOBh8WaI/bN+D7uwyLj1MmV6OcRCt/QeobWPc=;
 b=ahqubP3p8ujkamM/cT502itdXVRpetjjZUkZz4KX/ILV4jd1T7eovGK9t/Fg2pMYQUSqsa
 I6UNpGiRf6E2Uf79l2c1tehcf3w2wOqB3DJH5hphaflsOn4LfTRiaZg3dWw/6bGhuH7xEp
 kdFs/btfcHzh3un4gjxqFqp7Xg0N0Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-sNmFAgVaPkqdSKkhLUPcUg-1; Wed, 26 Aug 2020 04:22:51 -0400
X-MC-Unique: sNmFAgVaPkqdSKkhLUPcUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370FB1DDFF;
 Wed, 26 Aug 2020 08:22:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C504A5D9E4;
 Wed, 26 Aug 2020 08:22:48 +0000 (UTC)
Date: Wed, 26 Aug 2020 09:22:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] meson: Mingw64 gcc doesn't recognize system
 include_type for sdl2
Message-ID: <20200826082245.GB168515@redhat.com>
References: <20200825165341.520-1-luoyonggang@gmail.com>
 <20200825165341.520-3-luoyonggang@gmail.com>
 <b4d17b13-2a11-58b4-0e5d-8ca95ec3068b@ilande.co.uk>
 <CABgObfZ49Y2nJCx9jOdUsDe1SPGd5NBcSVOdxf5fpnWxSU15sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfZ49Y2nJCx9jOdUsDe1SPGd5NBcSVOdxf5fpnWxSU15sA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 01:10:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 luoyonggang@gmail.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 26, 2020 at 08:48:22AM +0200, Paolo Bonzini wrote:
> On Tue, Aug 25, 2020 at 11:38 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
> > Marc-André had a query about why this is marked as a system include, however I can
> > confirm that it fixes the missing "SDL.h" issue during build.
> 
> It was marked as a system include in an attempt to work around the SDL
> 2.0.8 bug that requires -Wno-undef. In general we enable lots of
> warnings and sometimes they trip dependencies, so using include_type:
> 'system' in principle makes sense. But if it doesn't work with
> Windows, it's not a regression to remove it.

SDL code is isolated to just a couple of files, so if we nede to squelch
a -Wno-undef warning, we can just use pragma push/pop to disable the
warning selectively in the code.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


