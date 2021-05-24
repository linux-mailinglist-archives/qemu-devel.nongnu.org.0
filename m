Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352D38EA10
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:51:11 +0200 (CEST)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBvC-0003de-H6
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llBtk-0002FK-DW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llBtg-00081R-Kh
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621867774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uge+S4VxvmMWKF4sPxuMBtdOVx3LgrvHwhCvxQIY2Tw=;
 b=cfjVHhQ57fCK94eS+kVBrBTh8LkzHtrNPbvB/fkKNyQLRZcEiKajcg9VGIdxTTvDBEijWc
 9FIY2DlJIleU8/3Nqbg8uv4uyJSVnShb+YGPdiC8ALFGn+yzlbhRWwg61ZjTyt1dckPwqD
 bVYpmGhOIr29Uw+yTDrRDwoGrdNhhq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-uj5KG-RnPfSVKOTimGzG9A-1; Mon, 24 May 2021 10:49:27 -0400
X-MC-Unique: uj5KG-RnPfSVKOTimGzG9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CCEE107ACE8;
 Mon, 24 May 2021 14:49:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-248.ams2.redhat.com [10.36.113.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6848EE14D;
 Mon, 24 May 2021 14:49:17 +0000 (UTC)
Date: Mon, 24 May 2021 15:49:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] gitlab: add special rule for the hexagon container
Message-ID: <YKu86ptxc4FomsuI@redhat.com>
References: <20210520151924.5063-1-alex.bennee@linaro.org>
 <eb50c468-83d2-516f-adaa-ec7941ab0f8a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <eb50c468-83d2-516f-adaa-ec7941ab0f8a@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 07:35:59AM -0700, Richard Henderson wrote:
> On 5/20/21 8:19 AM, Alex Bennée wrote:
> > The hexagon container is always manually built but of course not
> > everyone will be building it themselves and pushing to their
> > registries. We still need to create a "local" registry copy for the
> > actual gitlab tests to run. We don't build it in this case, just pull
> > it across from the upstream registry. We disable this rule from
> > running on the qemu-project itself so it doesn't accidentally wipe out
> > our master copy.
> > 
> > Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > ---
> 
> I get
> 
> Found errors in your .gitlab-ci.yml:
> jobs:build-user-hexagon:needs config uses invalid types: bridge

Bizarre message, but the problem looks like this:


> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index f718b61fa7..a04cca9db0 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -421,6 +421,8 @@ build-user-static:
> >   # declared. The image is manually uploaded.
> >   build-user-hexagon:
> >     extends: .native_build_job_template
> > +  needs:
> > +    hob: hexagon-cross-container

Indent and syntax is wrong - should be

   needs:
     - job: hexagon-cross-container

with indent at same level as 'extends'

> >     variables:
> >       IMAGE: debian-hexagon-cross
> >       TARGETS: hexagon-linux-user
> > 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


