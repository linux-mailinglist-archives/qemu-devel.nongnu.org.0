Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11C82BD9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 08:41:38 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hutA9-0007gM-Gz
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 02:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hut9V-0007I0-1H
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:40:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hut9U-00070C-32
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:40:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hut9T-0006zw-Ts
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:40:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4377CC059B6F
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 06:40:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9BCAF6DB;
 Tue,  6 Aug 2019 06:40:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D56116E08; Tue,  6 Aug 2019 08:40:52 +0200 (CEST)
Date: Tue, 6 Aug 2019 08:40:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190806064052.vys5qvm2jvjfr24z@sirius.home.kraxel.org>
References: <1565042940-8837-1-git-send-email-pbonzini@redhat.com>
 <87imrasv8m.fsf@dusky.pond.sub.org>
 <877e7qsv2c.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877e7qsv2c.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 06 Aug 2019 06:40:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] Makefile: remove unused variables
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 06, 2019 at 07:48:43AM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> >
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>  Makefile | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 73fbba0..7b0e2f4 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -429,10 +429,6 @@ dummy := $(call unnest-vars,, \
> >>                  io-obj-y \
> >>                  common-obj-y \
> >>                  common-obj-m \
> >> -                ui-obj-y \
> >> -                ui-obj-m \
> >> -                audio-obj-y \
> >> -                audio-obj-m \
> >>                  trace-obj-y)
> >>  
> >>  include $(SRC_PATH)/tests/Makefile.include
> >
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> Hmm...  the two go back to
> 
> commit 08a05b379ac56430cbb748882ff1b48dc9fe8729
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Mar 6 08:40:49 2018 +0100
> 
>     build: enable audio modules
>     
>     Add audio/ to common-obj-m variable.
>     
>     Also run both audio and ui variables through unnest-vars.
>     This avoids sdl.mo (exists in both audio/ and ui/) name clashes.
>     
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Message-id: 20180306074053.22856-4-kraxel@redhat.com
> 
> Gerd, anything funny going on here, or is Paolo's patch okay?

Well, the commit message pretty much says it.  We have sdl.mo in both
ui/ and audio/ (final module names are audio-sdl.so and ui-sdl.so).

This certainly was needed back when I added it.  Possibly it can be
removed now, I don't follow build system changes that closely.  But
it should be build-tested both ui/sdl and audio/sdl enabled.

cheers,
  Gerd


