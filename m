Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8F48D536
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:01:40 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wvJ-0005oe-VT
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7wrH-0004RI-Em
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n7wrE-0003hm-JN
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642067844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SO0+GsYBjIrc7F9d81bec6FPwWmwt6Y67NekeL8BFvw=;
 b=AE3hUqgzHi4N94kGZER8xOKJCtL5m/DKvSkkDfl12ozsciS0DsSlgU7bnoOXvQ2wl+d9ar
 6uVBqbtzcXWLamyikIWcyTf3Wcr5Hh7On0rLXxEZHLygSmKC34NVmI/A+ucFTo4HDT4/JB
 Aj7HoJjCDexc0Ez2J7vFzHWXG1XAjtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-e0c0ec2_PUmwqXZB22bn2g-1; Thu, 13 Jan 2022 04:57:18 -0500
X-MC-Unique: e0c0ec2_PUmwqXZB22bn2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F5683DD20;
 Thu, 13 Jan 2022 09:57:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9824BC4D;
 Thu, 13 Jan 2022 09:57:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11FFE1800091; Thu, 13 Jan 2022 10:57:15 +0100 (CET)
Date: Thu, 13 Jan 2022 10:57:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] audio: Add sndio backend
Message-ID: <20220113095715.luzvbinwhgwfiuzj@sirius.home.kraxel.org>
References: <YbxamMLKHp3IbtlW@moule.localdomain>
 <2493750.jclyaLVk8g@silver>
MIME-Version: 1.0
In-Reply-To: <2493750.jclyaLVk8g@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brad <brad@comstyle.com>, qemu-devel@nongnu.org,
 Alexandre Ratchov <alex@caoua.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 04:41:31PM +0100, Christian Schoenebeck wrote:
> On Freitag, 17. Dezember 2021 10:38:32 CET Alexandre Ratchov wrote:
> > sndio is the native API used by OpenBSD, although it has been ported to
> > other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7543eb4d59..76bdad064f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2307,6 +2307,7 @@ X: audio/jackaudio.c
> >  X: audio/ossaudio.c
> >  X: audio/paaudio.c
> >  X: audio/sdlaudio.c
> > +X: audio/sndio.c
> >  X: audio/spiceaudio.c
> >  F: qapi/audio.json
> > 
> > @@ -2349,6 +2350,10 @@ R: Thomas Huth <huth@tuxfamily.org>
> >  S: Odd Fixes
> >  F: audio/sdlaudio.c
> > 
> > +Sndio Audio backend
> > +R: Alexandre Ratchov <alex@caoua.org>
> > +F: audio/sndio.c

[ ... wading through my patch mail backlog ... ]

> Thanks Alexandre for volunteering as reviewer!
> 
> Gerd, would it be OK to set you as maintainer for now until new maintainer(s) 
> adopt audio sections? Or should this start with "S: Orphan" instead?

Yep, adding me is fine for now, although I can't promise timely
responses due to being quite busy with tianocore.

take care,
  Gerd


