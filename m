Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359222FCDBB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:10:13 +0100 (CET)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ARI-00036o-9c
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2APR-0001bL-Kd
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2APP-0002AR-MG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611137294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UUklRXlh57QloI5mWJYqZISyyMEve4tOEc850zyqDH8=;
 b=hKWkvKZnzMOB1WU6jrx76MRTxOl35VqXNUT0VDNQ+n2VXq5xNvqsa7UIp3TsbFSLMV+UjL
 Wj2fGM3+O8xFFjq9go4ymSMuWWNjEq8B6pl4j5jUriXF5oTUfdG8WyN4L1b+m1Nghm1O+g
 5jQnWCxpmqhoQpmyfegCBXt6qHDEozE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-uhoiOW3sPdKUh_qQIqVrxw-1; Wed, 20 Jan 2021 05:08:12 -0500
X-MC-Unique: uhoiOW3sPdKUh_qQIqVrxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6404F1005504;
 Wed, 20 Jan 2021 10:08:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6903719CA8;
 Wed, 20 Jan 2021 10:08:06 +0000 (UTC)
Date: Wed, 20 Jan 2021 10:08:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [External] : Re: [RFC PATCH 1/2] hw/i386: -cpu
 model,-feature,+feature should enable feature
Message-ID: <20210120100803.GF3015589@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210119163052.GG1227584@habkost.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 11:30:52AM -0500, Eduardo Habkost wrote:
> On Tue, Jan 19, 2021 at 04:27:56PM +0000, David Edmondson wrote:
> > On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:
> > 
> > > Hi,
> > >
> > > Thanks for the patch.  Getting rid of special -feature/+feature
> > > behavior was in our TODO list for a long time.
> > >
> > > On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:
> > >> "Minus" features are applied after "plus" features, so ensure that a
> > >> later "plus" feature causes an earlier "minus" feature to be removed.
> > >> 
> > >> This has no effect on the existing "-feature,feature=on" backward
> > >> compatibility code (which warns and turns the feature off).
> > >
> > > If we are changing behavior, why not change behavior of
> > > "-feature,feature=on" at the same time?  This would allow us to
> > > get rid of plus_features/minus_features completely and just make
> > > +feature/-feature synonyms to feature=on/feature=off.
> > 
> > Okay, I'll do that.
> > 
> > Given that there have been warnings associated with
> > "-feature,feature=on" for a while, changing that behaviour seems
> > acceptable.
> > 
> > Would the same be true for changing "-feature,+feature"? (i.e. what this
> > patch does) Really: can this just be changed, or does there have to be
> > some period where the behaviour stays the same with a warning?
> 
> I actually expected warnings to be triggered when using
> "-feature,+feature" as well.  If we were not generating warnings
> for that case, it will need more careful evaluation, just to be
> sure it's safe.  Igor, do you remember the details here?

Where are you expecting warnings ? I don't see any when launching QEMU

$ qemu-system-x86_64 -display none  -cpu Westmere,-vmx 

$ qemu-system-x86_64 -display none  -cpu Westmere,-vmx,sse=on

neither produces warnings, even with current git master.

I don't think we can change the parsing behaviour here without impacting
guest ABI, and that feels dangerous given that we've not been warning
people the syntax is undesirable.

IMHO just leave the parsing unchanged, deprecate it, and then delete
the code.  We don't need to "improve" usability semantics of something
that we want to delete anyway.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


