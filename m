Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4E5BDFA6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:17:23 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYRW-0005VK-Ha
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYHa-0008Vt-4l
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYHV-00057p-O6
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663661214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oOCnfoyc7tReDGQtUscQvT9mHr8nI/a+GuP3ByoQiYk=;
 b=ac+FSOxgB0t06NGKiY/jeozze/fclX/jyasjvnCo2Z9uPLvZWlyPoogSQUHVUEQp+jXYbf
 0uPADzTtibfKuzmxRv2kbPMTSJ+u3/37U0C4D0wKunBeNUwilb4vxUEujpTM9yblkTSrfE
 u/6I/RzQ6Cg3unpYiQ/SczO82sdXcmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-7G8Mvm8ON3C7pORZebx5LQ-1; Tue, 20 Sep 2022 04:06:52 -0400
X-MC-Unique: 7G8Mvm8ON3C7pORZebx5LQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5EF780206D;
 Tue, 20 Sep 2022 08:06:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E265740C2064;
 Tue, 20 Sep 2022 08:06:48 +0000 (UTC)
Date: Tue, 20 Sep 2022 09:06:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 8/8] meson-build: test-crypto-secret depends on
 CONFIG_SECRET_KEYRING
Message-ID: <Yyl0lqMVkdRhvkPw@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902165126.1482-9-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902165126.1482-9-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 06:51:26PM +0200, Juan Quintela wrote:
> With this change "make check" works when configured with --disable-keyring.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  tests/unit/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index b497a41378..988aed27cb 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -78,7 +78,6 @@ if have_block
>      'test-crypto-hmac': [crypto],
>      'test-crypto-cipher': [crypto],
>      'test-crypto-akcipher': [crypto],
> -    'test-crypto-secret': [crypto, keyutils],
>      'test-crypto-der': [crypto],
>      'test-authz-simple': [authz],
>      'test-authz-list': [authz],
> @@ -122,6 +121,9 @@ if have_block
>    if config_host_data.get('CONFIG_EPOLL_CREATE1')
>      tests += {'test-fdmon-epoll': [testblock]}
>    endif
> +  if config_host_data.get('CONFIG_SECRET_KEYRING')
> +    tests += {'test-crypto-secret': [crypto, keyutils]}
> +  endif
>  endif

This is not right, as it disables testing on all non-Linux platforms.
The code in test-crypto-secret is already conditional on CONFIG_KEYUTILS
so it can run on all platforms. The code just needs changing to be using
CONFIG_SECRET_KEYRING instead of CONFIG_KEYUTILS as the former is more
general. Don't touch the meson rules at all.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


