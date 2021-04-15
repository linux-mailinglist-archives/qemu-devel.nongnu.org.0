Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93936058B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:22:20 +0200 (CEST)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyCZ-0007Iu-7N
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWyBP-0006nP-Vt
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWyBM-0003w0-Pr
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618478463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxv418U1vvcptsM4p1qBggKL1PKoJ/e3cUwUNMXAI1g=;
 b=S5SZghDAVE2cQUN/iJ2wzoIuKRjQb8PFVY5cKlK/rV6NrDL5rE/2ghtuqMNbxj1p2X/nVY
 yMuDqqyy3fcgh52d0rXwmMszO9t6WCkvnYgTq1DhuiPvicPCNEiiGJduVkLx63uVaRIEwC
 vIomFr/dvWGYelsHB/BGl4xK97stv8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-IZomErASMTa9Nr9KvJI10g-1; Thu, 15 Apr 2021 05:21:02 -0400
X-MC-Unique: IZomErASMTa9Nr9KvJI10g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DC438030A1;
 Thu, 15 Apr 2021 09:21:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42B441037EAF;
 Thu, 15 Apr 2021 09:21:00 +0000 (UTC)
Date: Thu, 15 Apr 2021 10:20:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 2/3] osdep: protect qemu/osdep.h with extern "C"
Message-ID: <YHgFeeQaNDV5uiL0@redhat.com>
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <20210413160850.240064-3-pbonzini@redhat.com>
 <YHchNfXnhyzZBTg5@redhat.com>
 <CAFEAcA-Wu8c=TyNd0T4mocvy4=Fh=xqoAAuOtg7NcF2i38YiqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Wu8c=TyNd0T4mocvy4=Fh=xqoAAuOtg7NcF2i38YiqA@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 07:50:41PM +0100, Peter Maydell wrote:
> On Wed, 14 Apr 2021 at 18:26, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Apr 13, 2021 at 06:08:49PM +0200, Paolo Bonzini wrote:
> > >  #ifdef _WIN32
> > >  #include "sysemu/os-win32.h"
> >
> > This and os-posix.h both include other system headers. We don't currently
> > have problem, so this is ok as the minimal fix for 6.0, but long term we
> > need more work on this header to further narrow the extern {} block.
> 
> Maybe we should just move all the system header includes out of
> both os-posix.h and os-win32.h ? We already have one header file
> we've treated that way (sys/wait.h).
> 
> Alternatively we could leave os-win32.h and os-posix.h outside
> osdep.h's extern block, and require that they both use an
> extern block themselves for their declarations.

I'd be inclined towards the latter as I tihnk its reasonable for
os-win32/posix.h  to want to include system headers.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


