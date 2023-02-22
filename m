Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD669F781
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqpb-00055c-3T; Wed, 22 Feb 2023 10:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqpY-00055R-Sa
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqpX-0008Oa-7I
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677078890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWlwnzlxl2JQeoBY+EpMd9rmg+rJKRmnlqYzrOJGF50=;
 b=UHx/HhjP6/W2vbMvcaOY5GvJuP+ZF7CI/0E7s7D+ToaQ/x/anjo6ZDqN6pJk2kLbYyZJT6
 0msE/F5WA7150XaLvK3JJ7sVjhK5KJmY5+Lt9GMHhLC6qpFGZeTVj9nQ0kXc1bifQtZN7K
 mbkt+DB3vfJ0B1rMjV4arIcT9m/LIVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-3D_H4wdZNc2bzWaNPSUtVQ-1; Wed, 22 Feb 2023 10:14:45 -0500
X-MC-Unique: 3D_H4wdZNc2bzWaNPSUtVQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851CE802D2E;
 Wed, 22 Feb 2023 15:14:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB70492B00;
 Wed, 22 Feb 2023 15:14:44 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:14:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 08/10] ci, docker: update CentOS and OpenSUSE Python to
 non-EOL versions
Message-ID: <Y/YxYlXQT6zxLHaU@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222143752.466090-9-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 03:37:50PM +0100, Paolo Bonzini wrote:
> Python 3.6 is at end-of-life.  libvirt-ci now supports overrides for
> targets and package mappings, therefore QEMU can use newer versions
> provided by CentOS 8 (Python 3.8) and OpenSUSE 15.3 (Python 3.9).
> 
> Packages that the distro does not provide are included in the image
> via PyPI; lcitool knows how to do that whenever the rpm mapping
> is empty.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/testing.rst                        |  6 ++
>  tests/docker/dockerfiles/centos8.docker       | 22 +++---
>  tests/docker/dockerfiles/opensuse-leap.docker | 22 +++---
>  tests/docker/dockerfiles/ubuntu2004.docker    |  2 +-
>  tests/lcitool/mappings.yml                    | 77 +++++++++++++++++++
>  tests/lcitool/targets/centos-stream-8.yml     |  3 +
>  tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
>  7 files changed, 113 insertions(+), 22 deletions(-)
>  create mode 100644 tests/lcitool/mappings.yml
>  create mode 100644 tests/lcitool/targets/centos-stream-8.yml
>  create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 648b7aa09137..67798dc63def 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -481,6 +481,12 @@ the mapping to the ``libvirt-ci`` project as well:
>     contains the ``mappings.yml`` update.  Then add the prerequisite and
>     run ``make lcitool-refresh``.
>  
> +For enterprise distros that default to old, end-of-life versions of the
> +Python runtime, QEMU uses a separate set of mappings that work with more
> +recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
> +These should not be a problem unless the dependencies you are adding
> +is a Python library.

I'd suggest changing this last sentence to

 It should not be required to modify this file unless the new
 dependency being added is a Python library.


Either way,

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


