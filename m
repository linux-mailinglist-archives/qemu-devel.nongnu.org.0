Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78428AE62
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 08:51:05 +0200 (CEST)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRrfk-0003wn-64
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 02:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kRreg-0003GN-6K
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 02:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kRree-0004HJ-5t
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 02:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602485395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+zd0PE6T2aczaUdNrh8pOUCwaJ9bS6ZmfN4Ku0UJ9Y=;
 b=XAXkIhB3Yq0hSEnh/86hSgsh1zCRFmPFx2473mZPkaGP3v0yJrkimqHjRfnI7a/2zVstV3
 eciZpOhgbyHnBkiV8I6A0IjdglcrLKEQLcBHJqhCDtb075cluXN4VlNghFN2BUa4k2pbSu
 iiE4yOQgqFkf3TtqLp/POL1k2NN9ZrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-0aQ1k338OhmSZsPRKWMigg-1; Mon, 12 Oct 2020 02:49:53 -0400
X-MC-Unique: 0aQ1k338OhmSZsPRKWMigg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAFF107ACF8;
 Mon, 12 Oct 2020 06:49:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C718D19C78;
 Mon, 12 Oct 2020 06:49:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A81CF17538; Mon, 12 Oct 2020 08:49:50 +0200 (CEST)
Date: Mon, 12 Oct 2020 08:49:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v6 0/4] Fixes curses on msys2/mingw
Message-ID: <20201012064950.rbudmzrcbtub6a6i@sirius.home.kraxel.org>
References: <20201001173230.829-1-luoyonggang@gmail.com>
 <89710921-1d64-14fd-f8ce-05ee58f412c5@redhat.com>
 <20201002124744.whdgh4xtmvifi72y@sirius.home.kraxel.org>
 <20201002153801.GL2338114@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201002153801.GL2338114@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Yonggang Luo <luoyonggang@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 02, 2020 at 04:38:01PM +0100, Daniel P. Berrangé wrote:
> On Fri, Oct 02, 2020 at 02:47:44PM +0200, Gerd Hoffmann wrote:
> > On Thu, Oct 01, 2020 at 07:39:33PM +0200, Paolo Bonzini wrote:
> > > On 01/10/20 19:32, Yonggang Luo wrote:
> > > > And also convert related configure script to meson.
> > > > V5-V6
> > > > Dropping configure: Fixes ncursesw detection under msys2/mingw by convert the=
> > > > m to meson first.
> > > > That need the meson 0.56 upstream to fixes the curses detection.
> > > > Add
> > > > * configure: fixes indent of $meson setup
> > > > 
> > > > Yonggang Luo (4):
> > > >   configure: fixes indent of $meson setup
> > > >   curses: Fixes compiler error that complain don't have langinfo.h on
> > > >     msys2/mingw
> > > >   curses: Fixes curses compiling errors.
> > > >   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
> > > >     are defined on msys2/mingw
> > > > 
> > > >  configure                 | 42 ++++-----------------------------------
> > > >  include/sysemu/os-win32.h |  4 ++--
> > > >  ui/curses.c               | 14 ++++++-------
> > > >  util/oslib-win32.c        |  4 ++--
> > > >  4 files changed, 15 insertions(+), 49 deletions(-)
> > > > 
> > > > --=20
> > > > 2.28.0.windows.1
> > > > 
> > > > 
> > > 
> > > Looks good (though there is no conversion to meson yet in this version).
> > > 
> > > Not trivial, but perhaps Gerd can take it?
> > 
> > Sure, series looks good.
> > 
> > Can't finish this today due to -ENOTIME and I'm offline next week so
> > this has to wait a bit in the UI patch queue ...
> 
> Patch 2 needs more work I think, as its missing the corresponding
> configure change.

Also the series must be adapted to latest master, auto-rebase didn't work ...

take care,
  Gerd


