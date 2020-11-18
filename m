Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BB2B7D1C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:57:53 +0100 (CET)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfM5u-0000pt-M9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfM4a-0008RN-Ix
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfM4X-00080w-BZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605700583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XDMRFPzZBoE952IPEnR3D66GBAcCr7QVyKMjbr0SB+U=;
 b=IlSyhbVO/tSHJTjtUg2A+Ys8q2SrzWfJZS3WjbYhApd8yJIgJ+GjkwSE9r6nFxFvyxm9eg
 +j9erwdvuyA4WGsxMRYvmZgmfvD7JSoP2z/T06Zc+e6XrSLhTbxkQD8X8JHZUYPrhSlhL/
 V7Uygu6cg/M0owWCffLUwcQ3Qymz6+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-CVZFVieYPQej6KyXV1_rMQ-1; Wed, 18 Nov 2020 06:56:17 -0500
X-MC-Unique: CVZFVieYPQej6KyXV1_rMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9588018B9F85;
 Wed, 18 Nov 2020 11:56:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-41.ams2.redhat.com [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E6FB60C05;
 Wed, 18 Nov 2020 11:56:14 +0000 (UTC)
Date: Wed, 18 Nov 2020 11:56:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118115612.GD229461@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201118112845.GA11988@merkur.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 12:28:45PM +0100, Kevin Wolf wrote:
> Am 18.11.2020 um 09:36 hat Markus Armbruster geschrieben:
> > >> >>                                       [...]  Even better would be
> > >> >> returning an array of KvmInfo with information on all supported
> > >> >> accelerators at once, rather than making the user call this command once
> > >> >> per name.
> > >> >
> > >> > Maybe.  It would save us the work of answering the question
> > >> > above, but is this (querying information for all accelerators at
> > >> > once) going to be a common use case?
> > >> 
> > >> I recommend to scratch the query-accel parameter, and return information
> > >> on all accelerators in this build of QEMU.  Simple, and consistent with
> > >> similar ad hoc queries.  If a client is interested in just one, fishing
> > >> it out of the list is easy enough.
> > >> 
> > >
> > > Works for me. I'll then leave KvmInfo as is and will introduce AccelInfo
> > > with two fields: name and enabled. enabled will be true only for
> > > currently active accelerator.
> > 
> > Please document that at most on result can have 'enabled': true.
> 
> This doesn't feel right.
> 
> If I understand right, the proposal is to get a result like this:
> 
>     [ { 'name': 'kvm', 'enabled': true },
>       { 'name': 'tcg', 'enabled': false },
>       { 'name': 'xen', 'enabled': false } ]
> 
> The condition that only one field can be enabled would only be in the
> documentation instead of being enforced.
> 
> Instead, consider a response like this:
> 
>     { 'available': [ 'kvm', 'tcg', 'xen' ],
>       'active': 'kvm' }
> 
> This is not only shorter, but also makes sure that only one accelerator
> can be reported as active.

I guess this can be extended with a union to report extra props for the
accelerator, discriminated on the 'active' field eg

     { 'available': [ 'kvm', 'tcg', 'xen' ],
       'active': 'kvm',
       'data': {
           "allow-nested": true,
       }
    }


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


