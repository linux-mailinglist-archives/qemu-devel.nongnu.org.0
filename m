Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1F442A38
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:17:45 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpvL-0002Eh-RB
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhptr-00016K-G7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhptp-0003Nt-Bx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635844568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ad+Z6H6w5PHkl61PFxoSBiv61aXvXOBzp8hV/uMi1iI=;
 b=EyXP4hZ7Z2NOE/Fb6dlTaIjUHDj++1CNpSuVIFZp/pnxMroObqv+Ohsl54+dSMUvY9a2FG
 wNra8bk0Z/wbvIfBN82fZoeX67yPm/d9fGSJtplPLeHaZ9NNHK2FNYceSdE4WkL80D4xwL
 ajBinZiWMA/YE3CBRoyZvpw1Gn+AR/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-QUcVI7QtOPShKIEfWaLyDg-1; Tue, 02 Nov 2021 05:15:59 -0400
X-MC-Unique: QUcVI7QtOPShKIEfWaLyDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AEBD1808304;
 Tue,  2 Nov 2021 09:15:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1942269FA2;
 Tue,  2 Nov 2021 09:15:10 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:15:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
Message-ID: <YYEBnSoSi4Gcs8ki@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
 <20211029130717.fy3t5qqvy5u3iphg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029130717.fy3t5qqvy5u3iphg@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, Markus Armbruster <armbru@redhat.com>,
 libvir-list@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.10.2021 um 15:07 hat Eric Blake geschrieben:
> On Mon, Oct 25, 2021 at 07:25:25AM +0200, Markus Armbruster wrote:
> > Add special feature 'unstable' everywhere the name starts with 'x-',
> > except for InputBarrierProperties member x-origin and
> > MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
> > because these two are actually stable.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> > @@ -2495,27 +2508,57 @@
> >  #
> >  # Properties for throttle-group objects.
> >  #
> > -# The options starting with x- are aliases for the same key without x- in
> > -# the @limits object. As indicated by the x- prefix, this is not a stable
> > -# interface and may be removed or changed incompatibly in the future. Use
> > -# @limits for a supported stable interface.
> > -#
> >  # @limits: limits to apply for this throttle group
> >  #
> > +# Features:
> > +# @unstable: All members starting with x- are aliases for the same key
> > +#            without x- in the @limits object.  This is not a stable
> > +#            interface and may be removed or changed incompatibly in
> > +#            the future.  Use @limits for a supported stable
> > +#            interface.
> > +#
> >  # Since: 2.11
> >  ##
> >  { 'struct': 'ThrottleGroupProperties',
> >    'data': { '*limits': 'ThrottleLimits',
> > -            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',
> 
> > +            '*x-iops-total': { 'type': 'int',
> > +                               'features': [ 'unstable' ] },
> 
> This struct has been around since 381bd74 (v6.0); but was not listed
> as deprecated at the time.  Do we still need it in 6.2, or have we
> gone enough release cycles with the saner naming without x- that we
> could drop this?  But that is a question independent of this patch.

There is no reason any more to use the x- options, and I think libvirt
never used them anyway.

I actually have a commit in my QAPI object branch that removes these
properties, but I think it still broke some tests.

Anyway, something for a separate patch.

Kevin


