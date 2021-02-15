Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54C31B6E6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:12:50 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBas5-0004Zm-0t
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBar2-00042A-54
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBaqx-0000Gn-Sz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613383898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZRkaxXstAaIsSO23GL5FyI9JG6iwwJdKCNufeHBueQ=;
 b=fYUT7hqHVoKTbbhJZu/0Xn1Yoz0YCFo/LdwJUroOkqbRyEixrW5xKFF46D5a3DoNaAsD5L
 J0nqMfzbOnXSFhWWNoxX01g5rIm22AOKRsPbmBJoG4YDsxfP5VR5Snk5AolVrxNoRd5il4
 Z4W33kQVZt6YKUHJnr75yeEo4AWmeGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-TI7bEIu4OUyfTS9xW4-Hfg-1; Mon, 15 Feb 2021 05:11:31 -0500
X-MC-Unique: TI7bEIu4OUyfTS9xW4-Hfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB4E801975;
 Mon, 15 Feb 2021 10:11:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209815C3F8;
 Mon, 15 Feb 2021 10:11:24 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:11:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
Message-ID: <20210215101123.GC7226@merkur.fritz.box>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20210126112540.11880-2-pl@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 pbonzini@redhat.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
> even luminous (version 12.2) is unmaintained for over 3 years now.
> Bump the requirement to get rid of the ifdef'ry in the code.
> 
> Signed-off-by: Peter Lieven <pl@kamp.de>

> diff --git a/meson.build b/meson.build
> index 5943aa8a51..02d263ad33 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -691,19 +691,24 @@ if not get_option('rbd').auto() or have_block
>                             required: get_option('rbd'),
>                             kwargs: static_kwargs)
>    if librados.found() and librbd.found()
> -    if cc.links('''
> +    result = cc.run('''

Doesn't running compiled binaries break cross compilation?

>        #include <stdio.h>
>        #include <rbd/librbd.h>
>        int main(void) {
>          rados_t cluster;
>          rados_create(&cluster, NULL);
> +        rados_shutdown(cluster);
> +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
> +        return 1;
> +        #endif
>          return 0;

Would #error achieve what you want without running the binary?

But most, if not all, other version checks use pkg-config instead of
trying to compile code, so that's probably what we should be doing here,
too.

> -      }''', dependencies: [librbd, librados])
> +    }''', dependencies: [librbd, librados], name: 'librbd version check')
> +    if result.compiled() and result.returncode() == 0
>        rbd = declare_dependency(dependencies: [librbd, librados])
>      elif get_option('rbd').enabled()
> -      error('could not link librados')
> +      error('librados/librbd >= 12.0.0 required')
>      else
> -      warning('could not link librados, disabling')
> +      warning('librados/librbd >= 12.0.0 not found, disabling rbd support')
>      endif
>    endif
>  endif

Kevin


