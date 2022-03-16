Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B399D4DB202
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:58:47 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUAo-0002Q1-OG
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:58:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUTjX-00081a-7n
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUTjV-0005GF-5p
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TVu/CeOwg7TjRwgWWJUd3qigmb0rClTETSGukZB9kvE=;
 b=SK+tnTEVNdIH3t9FKX+6pnWe05Mh3rsDRDvAMxl4BpSmr+cVgO5k7S4LapmM430Pl3xiIl
 6ibAXuPP+E1fMPyYi//fcDsfP6aF7xDwBXWxWidorpG3eN9fLJcHerdTRl5MjyD71MNbV0
 mV8G+C5cEkAleZ+aLQy3XbMc7Vk7+TI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-UC8-YLvZOc2NKSj3QhDYXg-1; Wed, 16 Mar 2022 09:30:11 -0400
X-MC-Unique: UC8-YLvZOc2NKSj3QhDYXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 447933802ACE;
 Wed, 16 Mar 2022 13:30:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51AA830B9D;
 Wed, 16 Mar 2022 13:29:23 +0000 (UTC)
Date: Wed, 16 Mar 2022 13:29:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Message-ID: <YjHmLTI+geU4S9Wq@redhat.com>
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:blkverify" <qemu-block@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiri Pirko <jiri@resnulli.us>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <huth@tuxfamily.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 01:52:48PM +0400, marcandre.lureau@redhat.com wrote:
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 3baa5e3790f7..f2bd050e3b9a 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -79,19 +79,12 @@
>  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>  
> -#if defined(__clang__)
> -/* clang doesn't support gnu_printf, so use printf. */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#else
> -/* Use gnu_printf (qemu uses standard format strings). */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> -# if defined(_WIN32)
> +#if !defined(__clang__) && defined(_WIN32)
>  /*
>   * Map __printf__ to __gnu_printf__ because we want standard format strings even
>   * when MinGW or GLib include files use __printf__.
>   */
> -#  define __printf__ __gnu_printf__
> -# endif
> +# define __printf__ __gnu_printf__
>  #endif

I'm not convinced we shold have this remaining define, even
before your patch.

For code we've implemented, we should have used __gnu_printf__
already if we know it uses GNU format on Windows.

For code in GLib, its header file uses __gnu_printf__ for anything
that relies on its portable printf replacement, which is basically
everything in GLib.

For anything else we should honour whatever they declare, and not
assume their impl is the GNU one.


I guess it is easy enough to validate by deleting this and seeing
if we get any warnings from the mingw CI jobs about printf/gnu_printf
mismatch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


