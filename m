Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915F50DE58
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:59:52 +0200 (CEST)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwRb-0008OX-C9
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwOV-0006s6-Ge
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwOT-0001Ok-U0
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650884197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/ixO+tVsoWAnMb8h2Hi+RWBq4n2+cOrFN9eRLtXVju0=;
 b=F5+5AnMcSbos6hUNCbm3YU3t7BniMYqAT9flgG38BiH4jBrF1WaxbY05iOi55rK1MlUMCL
 U8XTqpEOShm+b4tFKRfa1ZucQD8kydoPpRGjg0iMaUSs9PjbiLC8gd+DoznRnR9MLMYOyb
 10n71pB/JBvAx5lx01wZnEouY54RvKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-wInWFaniMTq52JU-eZ1KXg-1; Mon, 25 Apr 2022 06:56:36 -0400
X-MC-Unique: wInWFaniMTq52JU-eZ1KXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B86CA3C16192
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 10:56:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D48BF463DF5;
 Mon, 25 Apr 2022 10:56:33 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:56:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
Message-ID: <YmZ+X0XK3kcCHtMm@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-5-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> Point to this library's URLs instead of the entire project's.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/setup.cfg b/setup.cfg
> index c21f2ce..0a1c215 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -5,8 +5,8 @@ author = QEMU Project
>  author_email = qemu-devel@nongnu.org
>  maintainer = John Snow
>  maintainer_email = jsnow@redhat.com
> -url = https://www.qemu.org/
> -download_url = https://www.qemu.org/download/
> +url = https://gitlab.com/qemu-project/python-qemu-qmp
> +download_url = https://gitlab.com/qemu-project/python-qemu-qmp/-/packages

Auto-generated tarballs are not guaranteed to have fixed content forever
so I tend to avoid pointing to those. Assuming you're intending to upload
to pypi, I'd link to that instead as the "official" tarball source.

>  description = QEMU Monitor Protocol library
>  long_description = file:PACKAGE.rst
>  long_description_content_type = text/x-rst


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


