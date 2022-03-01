Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F64C895A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:33:45 +0100 (CET)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzpA-0007IL-3U
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOzOE-0003au-5q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOzOA-0003uQ-PL
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646129150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up+PjZdkxU3TAAZHOOnEpizRqrEqSyoQ5fEdAFgzruI=;
 b=dQwK8lCRisWB5RIQI+7IiMxVUuCroy0kvh8Az9lC2pdMdcc3ORfjGiNsgVdKX+KF7afmS1
 ZLdh1HDi2FLm4judT1HDPUTxHK2VrzSi/l9h9OzEoSpry2ehh48iAfmovrW6L9E7Hm0kga
 jSQe3VayEBQ3ky45a1YwWt69NXXvEjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-2O_8UufiNmaAgvsxyQbt-Q-1; Tue, 01 Mar 2022 05:05:33 -0500
X-MC-Unique: 2O_8UufiNmaAgvsxyQbt-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1A2425CF;
 Tue,  1 Mar 2022 10:05:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAE9573DA5;
 Tue,  1 Mar 2022 10:04:02 +0000 (UTC)
Date: Tue, 1 Mar 2022 10:03:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Message-ID: <Yh3vj/otYYIuLUIz@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <YhyVvAv0M8WwiK2A@redhat.com> <87r17nm2au.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87r17nm2au.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 02:39:17PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > $SUBJECT  =~ s/lci-tool/lcitool/
> >
> > On Fri, Feb 25, 2022 at 05:20:07PM +0000, Alex Bennée wrote:
> >> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> >
> > Likewise
> >
> >> As a result we can drop debian-arm64-test-cross just for building
> >> tests.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
> >> ---
> >>  .gitlab-ci.d/container-cross.yml              |  10 +-
> >>  tests/docker/Makefile.include                 |   3 -
> >>  .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
> >>  .../debian-arm64-test-cross.docker            |  13 --
> >>  tests/lcitool/refresh                         |  11 ++
> >>  tests/tcg/configure.sh                        |   2 +-
> >>  6 files changed, 173 insertions(+), 52 deletions(-)
> >>  delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
> >> 


> > This cross dockerfile is a fully self-contained image.
> >
> > Traditionally QEMU has had a split image for Debian cross targets,
> > where there is a base with common native packages, and then a
> > layer for the cross packages.
> >
> > lcitool is capable of generating the image in this split format
> > using the arg
> >
> >    --layers {all,native,foreign}
> >
> > Personally I think it is simpler to just use the fully self
> > contained image, as it would simplify our gitlab pipeline
> > to only need 1 build stage for containers.  The cost is that
> > we'll not be sharing layers for native packages and more wall
> > clock time building since we're installing the same native
> > packages over & over.
> >
> > I'm not saying to change your patch, I just wanted to point
> > out the possibility in case someone cares strongly about
> > keeping a split layer model for cross containers.
> 
> My thinking on our layered approach has evolved over the years. One of
> the problems is when the two layers get out of sync and you run into
> build issues due to different states of cached layers.

Oh, I'd not even thought about that possibility but yes, it makes
sense. We could have cached the base layer and when we do an
'apt-get update' in the cross layer we'll end up pulling in new
copies of packages otherwise present in the base layer, partly
defeating the point of having two layers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


