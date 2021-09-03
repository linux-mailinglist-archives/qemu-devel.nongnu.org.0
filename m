Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5A3FFF75
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:53:07 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7ko-0006RU-8J
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mM7CF-0007fq-HB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mM7CC-0006Km-MT
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fH4orEAi1LMmKIlXzvrN15sR0XgUwy7e9wcO4+jWOtI=;
 b=i3eXXfjKagDWLCjqd1cSM2+qH79XmmbBZILe9oXLcmMTiMP87YJ1bvcJsklU2flNjXcxcQ
 BXJ/hfZyI2adgnNt1nhOpybaeKlC0Si0kkbD8w9qGjNM+ujtb9E2l7AmOuVXqB9JTEKHkZ
 Q841YMzHJD6oexCpS7xK9qIEGE1TktQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-HsxRonmDMQOsc8su8Mn70A-1; Fri, 03 Sep 2021 07:17:06 -0400
X-MC-Unique: HsxRonmDMQOsc8su8Mn70A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D9C84A5E0;
 Fri,  3 Sep 2021 11:17:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F2960BF1;
 Fri,  3 Sep 2021 11:16:31 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:16:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YTIEDKAgWGRt/I6y@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903110702.588291-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 John Snow <jsnow@redhat.com>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Zhang Chen <chen.zhang@intel.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:06:36PM +0200, Philippe Mathieu-Daudé wrote:
> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
> 
>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>   ...
> 
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
> 
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f54..6577d9ab393 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -68,6 +68,42 @@
>   * without generating warnings.
>   */
>  
> +/*
> + * g_memdup2_qemu:
> + * @mem: (nullable): the memory to copy.
> + * @byte_size: the number of bytes to copy.
> + *
> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> + * from @mem. If @mem is %NULL it returns %NULL.
> + *
> + * This replaces g_memdup(), which was prone to integer overflows when
> + * converting the argument from a #gsize to a #guint.
> + *
> + * This static inline version is a backport of the new public API from
> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> + *
> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> + *          or %NULL if @mem is %NULL.
> + */
> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> +{
> +#if GLIB_CHECK_VERSION(2, 68, 0)
> +    return g_memdup2(mem, byte_size);
> +#else
> +    gpointer new_mem;
> +
> +    if (mem && byte_size != 0) {
> +        new_mem = g_malloc(byte_size);
> +        memcpy(new_mem, mem, byte_size);
> +    } else {
> +        new_mem = NULL;
> +    }
> +
> +    return new_mem;
> +#endif
> +}

Close, but you missed the final piece of the puzzle

   #define g_memdup2(a) g_memdup2_qemu(a)


Such that in all following patches you can use the normal "g_memdup2"
API. This means when we later update min glib, we just delete the
compat code here, and the callers don't need updates.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


