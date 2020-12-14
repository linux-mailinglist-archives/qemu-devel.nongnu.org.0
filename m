Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A92D9DFC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:43:54 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kort2-0003e1-R6
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1korqC-0002D3-SR
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:40:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1korqA-0004tt-SG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607967653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/FiIws7prMebdjWEPduqnz1tix7R3frT153k4cWT7O4=;
 b=IMJj4gHKTdH/LglPnrRIXnDJUJNRWBg1dd0YVHffkNTU7oYov3CF/Zbv35r7q/YunE9yxE
 lA+9qu6xKqHaP1UGuCVMaaxolHDRU7QBEOSPfpivzlxkS/E9TT2wqPqJehhrXbTBqTRPx9
 EPyaFu1FapCq+UWGbIqNkzb6WCkTH5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-ftIp1-oaPk68QHZreITIGQ-1; Mon, 14 Dec 2020 12:40:51 -0500
X-MC-Unique: ftIp1-oaPk68QHZreITIGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3043100558A;
 Mon, 14 Dec 2020 17:40:50 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0CEA5C23D;
 Mon, 14 Dec 2020 17:40:46 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:40:41 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 15/32] qdev: Move softmmu properties to
 qdev-properties-system.h
Message-ID: <20201214174041.GM1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-16-ehabkost@redhat.com>
 <20201214152541.1a7d4b36@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214152541.1a7d4b36@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 03:25:41PM +0100, Igor Mammedov wrote:
> On Fri, 11 Dec 2020 17:05:12 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Move the property types and property macros implemented in
> > qdev-properties-system.c to a new qdev-properties-system.h
> > header.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Changes v1 -> v2:
> > * Move UUID property type too, as it was moved to
> >   qdev-properties-system.c in the previous patch
> > ---
[...]
> > diff --git a/audio/audio.h b/audio/audio.h
> > index b883ebfb1f..21fe3226ae 100644
> > --- a/audio/audio.h
> > +++ b/audio/audio.h
> > @@ -28,6 +28,7 @@
> >  #include "qemu/queue.h"
> >  #include "qapi/qapi-types-audio.h"
> >  #include "hw/qdev-properties.h"
> it's already included into new header
> so maybe s/old/new/ here and in other such places?

There's no guarantee that qdev-system-properties.h will always
depend on qdev-properties.h.  If a file depends on definitions
from qdev-properties.h, it should include qdev-properties.h
explicitly.

> 
> > +#include "hw/qdev-properties-system.h"
> >  
> >  typedef void (*audio_callback_fn) (void *opaque, int avail);
> >  
> > diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> > index 1e8b6253dd..c172cbe65f 100644
> > --- a/include/hw/block/block.h
> > +++ b/include/hw/block/block.h
> > @@ -13,6 +13,7 @@
> >  
> >  #include "exec/hwaddr.h"
> >  #include "qapi/qapi-types-block-core.h"
> > +#include "hw/qdev-properties-system.h"
> 
> what for it is included here?

hw/block/block.h has references to DEFINE_PROP_BLOCKSIZE,
DEFINE_PROP_DRIVE, and others.

> 
[...]

-- 
Eduardo


