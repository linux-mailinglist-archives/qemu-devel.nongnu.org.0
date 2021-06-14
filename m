Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E33A6ABF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:44:16 +0200 (CEST)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsol5-0007uV-DA
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsoPO-0007vd-Qk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsoPF-0005hW-7d
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623684097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bFv9QEIISsZtvJ/u9UG98oRb2ByPZZ+p+aghcaSK8TA=;
 b=Qpv7ItWgxPGjB+M2mkd0Yp7qRNnB6fIgeIcozqkj17afuVPrdJNZqqzr0WH5bsFZZFMpuF
 DW0B0hXiXkbmf2wuuGmbW81jfCQ2bJfm98s7mFs/qVxmeCFy3xIgGu//eGGEWtJh0Y7q3J
 jSEVfCcBmpvPud0RyHdS6pRI+qkwcsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-D5CZhNqeMLyD6KGzfj3r_Q-1; Mon, 14 Jun 2021 11:21:36 -0400
X-MC-Unique: D5CZhNqeMLyD6KGzfj3r_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB030802690;
 Mon, 14 Jun 2021 15:21:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A48EF5D9F0;
 Mon, 14 Jun 2021 15:21:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D68A18000B2; Mon, 14 Jun 2021 17:21:17 +0200 (CEST)
Date: Mon, 14 Jun 2021 17:21:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/18] qapi: add ModuleInfo schema
Message-ID: <20210614152117.kuj6qm4ocptzgonh@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-3-kraxel@redhat.com>
 <87im2g6g54.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87im2g6g54.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +# @arch: module architecture.
> 
> Semantics?
> 
> Should this be enum SysEmuTarget?

Probably, will check ...

> > +# @opts: qemu opts implemented by module.
> 
> Is this the name of a QemuOptsList?
> 
> Since this isn't a list, a module can only ever provide one
> QemuOptsList.  Sure that's okay?

For the current two in-tree cases yes, and I don't expect this to change
in the future.  We could turn this into a list though to make it
future-proof.

> > +{ 'struct': 'Modules',
> > +  'data': { 'list' : ['ModuleInfo']}}
> 
> This defines only types, no QMP commands or events.  Why do you need the
> types to be QAPI types?

Want re-use the code to serialize/parse json from/to structs.
(see patches #3 + #13).

> > --- a/qapi/qapi-schema.json
> > +++ b/qapi/qapi-schema.json
> > @@ -93,3 +93,4 @@
> >  { 'include': 'audio.json' }
> >  { 'include': 'acpi.json' }
> >  { 'include': 'pci.json' }
> > +{ 'include': 'modules.json' }
> 
> Is this the place you want the section to be?  Remember, generated
> documentation follows source order.

Ah, *this* the ordering is important for.  I'll check, was just
appending to the end of the list ...

thanks,
  Gerd


