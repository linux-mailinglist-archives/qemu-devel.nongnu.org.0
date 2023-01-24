Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA776796A3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:30:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHVG-0006nA-BS; Tue, 24 Jan 2023 06:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKHVD-0006mw-Kl
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:30:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKHVB-0005St-Uo
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674559809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FqP5ffDHDS6FjsYM6Lsm3BIz8AZYubYcrmIrKF0qxVY=;
 b=TIMyDH0g8C0cqVV/10pASrquOdYzWhe5TLARXUHKgx+Df3Bnnst/UTC27KFK6t+Iifi2ue
 VIM0OQwJxqu7xIku7LrLqgEQXbXYS1bIMdxKdXzK4TFTN2mkp38KeuqYsipyVwW7XpmvAK
 LGaTSf9elOL+WSRBJKFZS1tv4F7v13k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-cIIaPxeCMeuHNFf6A4ZVLQ-1; Tue, 24 Jan 2023 06:30:07 -0500
X-MC-Unique: cIIaPxeCMeuHNFf6A4ZVLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6011A8030A4;
 Tue, 24 Jan 2023 11:30:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D1C1121330;
 Tue, 24 Jan 2023 11:30:06 +0000 (UTC)
Date: Tue, 24 Jan 2023 11:30:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] po/meson: make i18n module optional
Message-ID: <Y8/BPOx5Y+5/TKVd@redhat.com>
References: <20230124034632.1268545-1-anton.kochkov@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230124034632.1268545-1-anton.kochkov@proton.me>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Tue, Jan 24, 2023 at 03:47:24AM +0000, Anton Kochkov wrote:
> This is necessary for Muon build system compatibility and
> prevents the following error:

This raises the question of whether we actually want Muon compatibility
in the first place though. IMHO one of the good benefits of Meson (and
all other modern build systems), is that application maintainers no
longer need to worry about portability between the many OS specific
re-implementations of 'make'. Personally I feel pretty unethusiastic
at the prospect of going back to that world by adding workarounds for
incomplete re-implementations of meson.

What is the compelling reason that users of QEMU need to use the
imcomplete Muon re-implementation, instead of sticking with official
Meson releases that QEMU maintainers actually test against on all
our targetted OS platforms ?

> meson.build:4:8: error module 'i18n' is unimplemented,
>   If you would like to make your build files portable to muon,
>   use `import('i18n', required: false)`,
>   and then check the .found() method before use.
>   4 |   i18n.gettext(meson.project_name(),
>              ^
> qemu/meson.build:3640:3: error in function subdir()
> 3640 |   subdir('po')
>          ^
> 
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> ---
>  po/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/po/meson.build b/po/meson.build
> index a863f0575f..f7be95cf5f 100644
> --- a/po/meson.build
> +++ b/po/meson.build
> @@ -1,4 +1,4 @@
> -i18n = import('i18n')
> +i18n = import('i18n', required: false)
> 
>  if find_program('xgettext', required: get_option('gettext')).found()
>    i18n.gettext(meson.project_name(),
> --
> 2.39.1
> 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


