Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C462816DB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:41:26 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kONBV-0002G4-Np
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kON8U-0007eV-KV
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:38:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kON8S-0003Zc-Ru
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 11:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601653096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RnDoRZRBmbeZRVYsgVot86SGZTyQh15C2T2gKq9v+HA=;
 b=NFBo0cJwZROOI+LrnhLP6dhrp28WLFDTXcYzf8QBqnzWq3I0LnwdlEAfssTZvQqo7ee4q0
 PeS8WxbEYytD8SXe2A1xOygKHnRxBczlf5xToaezW/2nIm/UiZL2qHtm/69s8bHBtWVabq
 yYMLHA64DNbAYBmtZ5A2rmCCeCJ81cA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-02DuSsemPVmd5sAdgURAdg-1; Fri, 02 Oct 2020 11:38:12 -0400
X-MC-Unique: 02DuSsemPVmd5sAdgURAdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1542800C60;
 Fri,  2 Oct 2020 15:38:10 +0000 (UTC)
Received: from redhat.com (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C36B910013D7;
 Fri,  2 Oct 2020 15:38:04 +0000 (UTC)
Date: Fri, 2 Oct 2020 16:38:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 0/4] Fixes curses on msys2/mingw
Message-ID: <20201002153801.GL2338114@redhat.com>
References: <20201001173230.829-1-luoyonggang@gmail.com>
 <89710921-1d64-14fd-f8ce-05ee58f412c5@redhat.com>
 <20201002124744.whdgh4xtmvifi72y@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201002124744.whdgh4xtmvifi72y@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Yonggang Luo <luoyonggang@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 02, 2020 at 02:47:44PM +0200, Gerd Hoffmann wrote:
> On Thu, Oct 01, 2020 at 07:39:33PM +0200, Paolo Bonzini wrote:
> > On 01/10/20 19:32, Yonggang Luo wrote:
> > > And also convert related configure script to meson.
> > > V5-V6
> > > Dropping configure: Fixes ncursesw detection under msys2/mingw by convert the=
> > > m to meson first.
> > > That need the meson 0.56 upstream to fixes the curses detection.
> > > Add
> > > * configure: fixes indent of $meson setup
> > > 
> > > Yonggang Luo (4):
> > >   configure: fixes indent of $meson setup
> > >   curses: Fixes compiler error that complain don't have langinfo.h on
> > >     msys2/mingw
> > >   curses: Fixes curses compiling errors.
> > >   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
> > >     are defined on msys2/mingw
> > > 
> > >  configure                 | 42 ++++-----------------------------------
> > >  include/sysemu/os-win32.h |  4 ++--
> > >  ui/curses.c               | 14 ++++++-------
> > >  util/oslib-win32.c        |  4 ++--
> > >  4 files changed, 15 insertions(+), 49 deletions(-)
> > > 
> > > --=20
> > > 2.28.0.windows.1
> > > 
> > > 
> > 
> > Looks good (though there is no conversion to meson yet in this version).
> > 
> > Not trivial, but perhaps Gerd can take it?
> 
> Sure, series looks good.
> 
> Can't finish this today due to -ENOTIME and I'm offline next week so
> this has to wait a bit in the UI patch queue ...

Patch 2 needs more work I think, as its missing the corresponding
configure change.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


