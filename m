Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE954498E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:58:12 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFrf-0007LW-D9
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzERr-0008Ub-LT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:27:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzERq-0000aq-12
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5XI5suyby+/GeRvV84EdopcSlk8+hltCiDr2zvgpwc=;
 b=IQZrk1bNOojeyjmARERwTyXKiumV2U0Rc/P73Y4utQsfAhez3KskMwvc7EDX+qylB30ZgV
 i/lG2+HCQtYE9ZnQHVoo83/hLcZNZAeYGs6yigBskp3OPJAFCsrDomKPruoo62Ir/cIXIK
 gTzU4JxxXHtgQ88Xofums9UiXjwxiGo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-M4hrypNAOS20D6nOtSNykQ-1; Thu, 09 Jun 2022 05:27:22 -0400
X-MC-Unique: M4hrypNAOS20D6nOtSNykQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4B318E0043;
 Thu,  9 Jun 2022 09:27:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDF7492C3B;
 Thu,  9 Jun 2022 09:27:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E7D9A1800094; Thu,  9 Jun 2022 11:27:19 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:27:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH] ui/cocoa: Fix poweroff request code
Message-ID: <20220609092719.tibrgqefqc4i4xhp@sirius.home.kraxel.org>
References: <20220529082508.89097-1-akihiko.odaki@gmail.com>
 <30afbc95-4e8e-ade0-da24-e85ec1f98397@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30afbc95-4e8e-ade0-da24-e85ec1f98397@amsat.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 29, 2022 at 12:45:06PM +0200, Philippe Mathieu-Daudé wrote:
> On 29/5/22 10:25, Akihiko Odaki wrote:
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> >   ui/cocoa.m | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 09a62817f2a..84c84e98fc5 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -35,6 +35,7 @@
> >   #include "ui/kbd-state.h"
> >   #include "sysemu/sysemu.h"
> >   #include "sysemu/runstate.h"
> > +#include "sysemu/runstate-action.h"
> >   #include "sysemu/cpu-throttle.h"
> >   #include "qapi/error.h"
> >   #include "qapi/qapi-commands-block.h"
> > @@ -1290,7 +1291,10 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
> >   {
> >       COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
> > -    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> > +    with_iothread_lock(^{
> > +        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> > +    });
> >       /*
> >        * Sleep here, because returning will cause OSX to kill us
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Added to queue.

thanks,
  Gerd


