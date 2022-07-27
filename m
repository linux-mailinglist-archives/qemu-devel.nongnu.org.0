Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B1582E90
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:15:12 +0200 (CEST)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkcp-0003gG-An
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGkXU-00005Z-N6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGkXD-0004Ju-Lg
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658941759;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w1MWXVgJnmVEOJCJ2G7vyE09BI21yNN45Ej/OXIfsKI=;
 b=VLOyTq1QF4cUhieWmhoU3A3KZM59Rq8mG79ZWmJj41LWH65LKQuc+JTp9f/M15UXmHgGxi
 GMUww6p5lRe/Skw6Lo83e+AMbktZOSFqzP0t9Yt5n0LOKk6jUB/R9Rap/GZwkekMcTdS2T
 PqdNaM4kiiGBehZfr4At/gTn0mb7qHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-YkME-6p5PLCw4dbAyWiAvw-1; Wed, 27 Jul 2022 13:09:12 -0400
X-MC-Unique: YkME-6p5PLCw4dbAyWiAvw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DBAD805F37;
 Wed, 27 Jul 2022 17:09:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A603492CA2;
 Wed, 27 Jul 2022 17:09:04 +0000 (UTC)
Date: Wed, 27 Jul 2022 18:09:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/8] tests/docker: Fix alpine dockerfile
Message-ID: <YuFw35zxNXM0iGuk@redhat.com>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 27, 2022 at 01:36:25PM -0300, Lucas Mateus Castro(alqotel) wrote:
> Currently the run script uses 'readlink -e' but the image only has the
> busybox readlink, this commit add the coreutils package which
> contains the readlink with the '-e' option.

Use of 'readlink' is discouraged in favour of 'realpath'. AFAICT, we
can just do that change and not need the '-e' flag anyway.

> 
> Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
> ---
>  tests/docker/dockerfiles/alpine.docker | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 3f4c0f95cb..2943a99730 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -21,6 +21,7 @@ RUN apk update && \
>          cdrkit \
>          ceph-dev \
>          clang \
> +        coreutils \
>          ctags \
>          curl-dev \
>          cyrus-sasl-dev \

This file contents is autogenerated, so editting it manually is
wrong and changes will be lost.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


