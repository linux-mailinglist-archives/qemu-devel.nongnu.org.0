Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670B2B7CB3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:33:16 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLi7-00085F-7S
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfLdv-0003O9-Lh
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:28:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfLds-0004KF-Lz
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605698931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJgshEUIW99Tsl2vT6eo50usERexIvH1LzQeyXSsUHQ=;
 b=PfrS4O1O/RfYPex03qxFy9xybIJnXkapvFNAZtl1/okH7E0KzCgBs/oylgyLS30P20hKMB
 ZFwnfUKqiTKEx3p7ge1303e6ZwD9l6BAEeHeS7iw88MR764DYZ9i3UQ0yoZa3mvos71gFt
 bby2Ag1ffGA7Jx56HHHY4mjoWcWk19w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-trULShYKOAi6f3GVmW12pA-1; Wed, 18 Nov 2020 06:28:49 -0500
X-MC-Unique: trULShYKOAi6f3GVmW12pA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FEF41007B09;
 Wed, 18 Nov 2020 11:28:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-43.ams2.redhat.com [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC175196FB;
 Wed, 18 Nov 2020 11:28:46 +0000 (UTC)
Date: Wed, 18 Nov 2020 12:28:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118112845.GA11988@merkur.fritz.box>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft57oycu.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.11.2020 um 09:36 hat Markus Armbruster geschrieben:
> >> >>                                       [...]  Even better would be
> >> >> returning an array of KvmInfo with information on all supported
> >> >> accelerators at once, rather than making the user call this command once
> >> >> per name.
> >> >
> >> > Maybe.  It would save us the work of answering the question
> >> > above, but is this (querying information for all accelerators at
> >> > once) going to be a common use case?
> >> 
> >> I recommend to scratch the query-accel parameter, and return information
> >> on all accelerators in this build of QEMU.  Simple, and consistent with
> >> similar ad hoc queries.  If a client is interested in just one, fishing
> >> it out of the list is easy enough.
> >> 
> >
> > Works for me. I'll then leave KvmInfo as is and will introduce AccelInfo
> > with two fields: name and enabled. enabled will be true only for
> > currently active accelerator.
> 
> Please document that at most on result can have 'enabled': true.

This doesn't feel right.

If I understand right, the proposal is to get a result like this:

    [ { 'name': 'kvm', 'enabled': true },
      { 'name': 'tcg', 'enabled': false },
      { 'name': 'xen', 'enabled': false } ]

The condition that only one field can be enabled would only be in the
documentation instead of being enforced.

Instead, consider a response like this:

    { 'available': [ 'kvm', 'tcg', 'xen' ],
      'active': 'kvm' }

This is not only shorter, but also makes sure that only one accelerator
can be reported as active.

Kevin


