Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D904E5255
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:39:50 +0100 (CET)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0HE-0002ob-S7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:39:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzpM-0003tL-9e
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzpJ-00009C-5w
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648037455;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acH6F/uqHGGjxtGiFWHixStrK2T9Va+5Jm4MGhw13fM=;
 b=inIjMm69NEQgwqgINxhNSiQaPD8FrYuvBShNYpv+82xskYNhCEgBm9aIxNH/XbrLYrTNZk
 EXaq5CnvvI58YkUDGhIjWYmeRUwddXpKQo0loVDcseaYeOFnNvu9SgCW4B9Jc4M/aLQGSA
 jN/3+P/pMUsUkSATuVNPSSxWXrbrmUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-h0mc0L2ON6Wm68C2xRfW2g-1; Wed, 23 Mar 2022 08:10:54 -0400
X-MC-Unique: h0mc0L2ON6Wm68C2xRfW2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C40B11006849;
 Wed, 23 Mar 2022 12:10:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6049A403D1C6;
 Wed, 23 Mar 2022 12:10:51 +0000 (UTC)
Date: Wed, 23 Mar 2022 12:10:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH-for-7.0 2/2] hw: Fix misleading hexadecimal format
Message-ID: <YjsOSdJGjmEuKQzP@redhat.com>
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
 <20220323114718.58714-3-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220323114718.58714-3-philippe.mathieu.daude@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 12:47:18PM +0100, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> "0x%u" format is very misleading, replace by "0x%x".
> 
> Found running:
> 
>   $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' hw/
> 
> Inspired-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/sgx.c        | 2 +-
>  hw/i386/trace-events | 6 +++---
>  hw/misc/trace-events | 4 ++--
>  hw/scsi/trace-events | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


