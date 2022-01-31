Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A24A4DAF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 19:02:25 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEb0S-00033q-AT
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 13:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEasH-0003rR-V6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEasC-0006oL-Tn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643651631;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kzugKcBW0AQq6uCREdyTSwixfHbE2wVNP4GEt8B7FLU=;
 b=I8sEa5L3FtMHDZJj3gCLT1MRwKFyZE2kyp5C29IS1QLCuTjjrUbaUpbylbKNsNI+Ri6Oe6
 Gz8x+myA0qRxtoEPgyCTYK3Z5bn3GnBJI2thEwBauYE+vd79yU9BJQs7Cu0RBaCgLUeBEs
 fBw+w1XSv/0DMmzhyRPFnji+gLR4Y8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-j3JtrWckPAu7nEMKS4IX9Q-1; Mon, 31 Jan 2022 12:53:44 -0500
X-MC-Unique: j3JtrWckPAu7nEMKS4IX9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A7041091DA2;
 Mon, 31 Jan 2022 17:53:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 390077744F;
 Mon, 31 Jan 2022 17:53:42 +0000 (UTC)
Date: Mon, 31 Jan 2022 17:53:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/5] docs: Pass disabled configure options to sphinx
Message-ID: <YfgiIwTMISic8tEk@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
 <20220131170411.125198-2-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131170411.125198-2-kwolf@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 06:04:07PM +0100, Kevin Wolf wrote:
> Man pages and other documentation should only contain things that are
> actually available in this build. In order to conditionally build
> documentation depending on the build configuration, pass the
> configuration to sphinx as tags.
> 
> The tags are negative so that building documentation from outside of
> meson (in particular for things like readthedocs) without any tags set
> results in the full documentation rather than disabling everything that
> is optional.

IMHO if we're building in upstream CI we should have a way to
explicitly force inclusion of /all/ docs, because we don't
want docs published from CI to be missing features just because
we happen to not have the deps enabled.

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/meson.build | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 57b28a3146..3220da4c15 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -37,6 +37,16 @@ endif
>  if build_docs
>    SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
>  
> +  foreach key: config_host_data.keys()
> +    if not key.startswith('CONFIG_')
> +      continue
> +    endif
> +    if '@0@'.format(config_host_data.get(key)) in ['0', 'false']
> +      tag = 'DISABLE_' + key.substring(7)
> +      SPHINX_ARGS += ['-t', tag]
> +    endif
> +  endforeach
> +
>    have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
>  
>    man_pages = {
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


