Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E012CBC61
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:06:02 +0100 (CET)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQtW-00039W-0d
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkQqw-00023G-4v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkQqt-0007JT-JK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606910598;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6EZc0djMGgfL5xQnieZxBclw3C0SEGuDGBRz7Q8PJp8=;
 b=J68zPFKBT17aGO/XGZECv5kvZyWYuGvwI6Ij3P4kwn0RJxQMbA6ifK5Lia4jMbAPrdGVYt
 wSCnqLPKkXew5zneIDds6tY/Mh0r07W0rlEAMytSpM2/OkkpW52dZlUOSitL2E6xY96IIb
 2ZVqgsUamQet7KUFzhGNuxgZob2I35o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-WD-ddeVBOyitB0pIoDEaPA-1; Wed, 02 Dec 2020 07:03:16 -0500
X-MC-Unique: WD-ddeVBOyitB0pIoDEaPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5BC64158;
 Wed,  2 Dec 2020 12:03:14 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC41960C0F;
 Wed,  2 Dec 2020 12:03:09 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:03:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 03/23] tests/docker: use project specific container
 registries
Message-ID: <20201202120306.GG2360260@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-4-berrange@redhat.com>
 <20201202115414.uqergukvhsftofwc@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201202115414.uqergukvhsftofwc@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 12:54:14PM +0100, Gerd Hoffmann wrote:
> > --- a/tests/docker/dockerfiles/centos8.docker
> > +++ b/tests/docker/dockerfiles/centos8.docker
> > @@ -1,4 +1,4 @@
> > -FROM centos:8.1.1911
> > +FROM registry.centos.org/centos:8
> 
> At least for centos-8 I've noticed the docker.io containters are
> multiarch whereas registry.centos.org has x86_64 only.
> 
> I think right now we don't use any !x86_64 containers due to gitlab
> having only x86_64 shared runners.  So this isn't a blocker.  Wanted
> to note that nevertheless ;)

Interesting, I wonder if that's a mistake or not, because the Fedora
/ CentOS specific registries are supposed to be preferred, so I would
have expected better content.

In any case, for non-x86_64 stuff we currently do have all the Debian
cross-compiler containers available.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


