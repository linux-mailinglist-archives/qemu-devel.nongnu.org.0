Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77163FD9F6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:08:58 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPz7-0001zy-U7
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPrJ-0007L0-Ai
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLPrD-0001L0-7C
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630501246;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcHBLKZpc5vTYnfGeJzodGQ2YViAUOT+N0cEjW2Ndgs=;
 b=KdhCqcIQpa5N0/XesX7ST5NGxSfnNtwUp+aXXLcpQnYkdmpKisAzFjteUggMcwsAJdopxa
 z1IXMzxRGoorI89Ynzzgn919Cf6Lu7lG5osD8KfmHtw0C52vuX5PoKpV5BfkgVISRakggg
 O+r+mU9BrJkrBe4DiGK68oyJwdZBum4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Fc-QCpu7NUarHbs6wpv6ww-1; Wed, 01 Sep 2021 09:00:42 -0400
X-MC-Unique: Fc-QCpu7NUarHbs6wpv6ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8D2A593D7;
 Wed,  1 Sep 2021 13:00:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4E029405;
 Wed,  1 Sep 2021 13:00:28 +0000 (UTC)
Date: Wed, 1 Sep 2021 14:00:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v8 28/34] iotests: move 222 to tests/image-fleecing
Message-ID: <YS95aT/KO2kIz7Ng@redhat.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-29-vsementsov@virtuozzo.com>
 <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 02:37:52PM +0200, Hanna Reitz wrote:
> On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> > Give a good name to test file.
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > Reviewed-by: Max Reitz <mreitz@redhat.com>
> > ---
> >   tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
> >   tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
> >   2 files changed, 0 insertions(+), 0 deletions(-)
> >   rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
> >   rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)
> > 
> > diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
> > similarity index 100%
> > rename from tests/qemu-iotests/222
> > rename to tests/qemu-iotests/tests/image-fleecing
> > diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
> > similarity index 100%
> > rename from tests/qemu-iotests/222.out
> > rename to tests/qemu-iotests/tests/image-fleecing.out
> 
> Good news: Including error-report.h helped with most of the CI errors.
> 
> “Bad” news: .gitlab-ci.d/buildtest.yml has a complete ./check command line
> including test numbers...  Not sure if that’s a great idea, but in any case,
> this means that build-tcg-disabled fails because that command line includes
> 222.  I think the fix should be simply to replace 222 by image-fleecing.  I
> hope that’s alright for you?

Yeah, I don't really like that we have a set of test numbers in the
gitlab CI config file.

We have a 'group' concept for IO tests that works perfectly well.

If one of the existing groups doesn't work, then we should create
a new "ci" group, so users running 'check' directly can accurately
replicate the CI env without typiing out a set of test numbers.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


