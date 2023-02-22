Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C569F772
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqmg-0002nB-1I; Wed, 22 Feb 2023 10:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqme-0002ml-Gz
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqmc-0007pp-Kd
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677078708;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baU5T800ngffYSm7+2Y1n3fFPCc2fT33H1mumiiDzkk=;
 b=Wxi3xWqY34vUSP0bTO1p+FRR1OuwIlmVv3V+rHxKhfryiC+hJlFARoG7pUxS3J9hJVUOMw
 YM93NCiHJBjh8MvYqN+LCUW0+HYzHJj5laAwTEoFrqPbSNbAz3tWKHS0POdldfQ6lhROKc
 q/mj22wVtOYquID7mVlXNzSAd+SaWD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-Vc5Ma4oyPg2h2BfbQJxUwg-1; Wed, 22 Feb 2023 10:11:47 -0500
X-MC-Unique: Vc5Ma4oyPg2h2BfbQJxUwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10369104D9AA;
 Wed, 22 Feb 2023 15:11:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8A7440DD;
 Wed, 22 Feb 2023 15:11:43 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:11:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 07/10] docs/devel: update and clarify lcitool instructions
Message-ID: <Y/YwrcEsOyfVpbpS@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222143752.466090-8-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 22, 2023 at 03:37:49PM +0100, Paolo Bonzini wrote:
> Shorten a bit the description of what libvirt-ci does, the name of the
> data files is not relevant at that point.  However, the procedures to add
> new build prerequisites are lacking some information, particularly with
> respect to regenerating the output test files for lcitool's unit tests.
> While at it, also update the paths in the libvirt-ci repository.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/testing.rst | 72 ++++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index e10c47b5a7ca..648b7aa09137 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst

>  
> -In some cases ``libvirt-ci`` will not know about the build pre-requisite and
> -thus some extra preparation steps will be required first
> +In some cases ``libvirt-ci`` will not know about the build
> +pre-requisite and thus some extra preparation steps will be required
> +first.  Even though you can add the mappings for testing purposes to
> +``tests/lcitool/mappings.yml`` in the QEMU repository, please contribute
> +the mapping to the ``libvirt-ci`` project as well:

I'd have a mild preference for not mentioning the qemu local
tests/lcitool/mappings.yml here, as that's for special purpose
use and thus not relevant the majority if the time. I worry
this might mislead people into including changes in the
local tests/lcitool/mappings.yml file, instead of, or in
addition to the libvirt-ci.git submodule.

None the less, its a minor concern so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


>  
>   * Fork the ``libvirt-ci`` project on gitlab
>  
> - * Edit the ``mappings.yml`` change to add an entry for the new build
> -   prerequisite, listing its native package name on as many OS distros
> -   as practical.
> + * Add an entry for the new build prerequisite to
> +   ``lcitool/facts/mappings.yml``, listing its native package name on as
> +   many OS distros as practical.  Run ``python -m pytest --regenerate-output``


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


