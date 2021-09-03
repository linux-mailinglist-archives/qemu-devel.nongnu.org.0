Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9B3FFF88
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:05:16 +0200 (CEST)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7wZ-0005ev-IY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mM7ol-0000dt-3Y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mM7oi-0001yK-Hv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630670227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qx7q+ynwNlUdf5xhudsXgJ7h+396EMUM6+GIc2Uds/E=;
 b=YLbScsZLrxTimrXI5lPerLyOLWAbNRw7/E5366+T4qxp0fKETpreuJDL7iGRuCn81W6c5K
 yniRQ40h31fuTERYOLL//oMaBFFAxCbOxHWXv6JbUe/xTdmlNF/D2HntN8bOlyROBAm9ez
 6NLOpfSkXTaqf1oqmirEb8R7Ri1TH50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-FBl6eYJ5Nui1zOv_iC-6fw-1; Fri, 03 Sep 2021 07:56:54 -0400
X-MC-Unique: FBl6eYJ5Nui1zOv_iC-6fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6370684A5E0;
 Fri,  3 Sep 2021 11:56:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F080E5D9F0;
 Fri,  3 Sep 2021 11:56:24 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:56:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YTINZmrWJLOnp193@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com>
 <YTIEDKAgWGRt/I6y@redhat.com>
 <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Zhang Chen <chen.zhang@intel.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 02:51:21PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> That was most probably already discussed, so sorry my question:
> 
> Why we can't just do
> 
> #if ! GLIB_CHECK_VERSION(2, 68, 0)
> static inline gpointer g_memdup2(gconstpointer mem, gsize byte_size)
> {
>     gpointer new_mem;
> 
>     if (mem && byte_size != 0) {
>         new_mem = g_malloc(byte_size);
>         memcpy(new_mem, mem, byte_size);
>     } else {
>         new_mem = NULL;
>     }
> 
>     return new_mem;
> }
> #endif
> 
> ?

This doesn't play with GLIB_VERSION_MAX_ALLOWED - any use of
g_memdup2 will trigger compile warnings since we're using an
API that only exists in a glib version newer than our declared
baseline.

The inline wrapper  + macro is a trick that lets us backport
new features, while avoiding the compile warnings.

This is documented in the include/glib-compat.h file that Philippe
is modifying.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


