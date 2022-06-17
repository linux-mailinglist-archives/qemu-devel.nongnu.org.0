Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539154F871
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 15:45:55 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2CIL-0007ip-JB
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 09:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2CFL-0006FN-Vv
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2CFK-0002gt-Ei
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655473365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vH1+de5Xb8jvL8RBqQfGXQMu9ZqrSYK0wSWgf5SMfw=;
 b=QXTwPQq6m/1+myEQaRVWm9kvJ/Pin4K5ht4N4bswIVKetlAT5AFr9sfVidAjdeGNT//eVw
 /+8mblh/QuugTq/olR37qQDR50OflINVwT/YeaTyfvEkjFlsuGOwpm2q2b5ntXDezxc3yV
 /iX7YTwrxGEl/GacjHCYDUvouJ3XkCE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-pQy4XmSDPPanebIvd1JdSA-1; Fri, 17 Jun 2022 09:42:44 -0400
X-MC-Unique: pQy4XmSDPPanebIvd1JdSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CE6F1C13945;
 Fri, 17 Jun 2022 13:42:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EAF9D7F;
 Fri, 17 Jun 2022 13:42:42 +0000 (UTC)
Date: Fri, 17 Jun 2022 14:42:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [PATCH 7/7] crypto: Add test suite for ECDSA algorithm
Message-ID: <YqyE0Fkgs4wlWu5q@redhat.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-8-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613084531.8086-8-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 04:45:31PM +0800, Lei He wrote:
> 1. add test suite for ecdsa algorithm.
> 2. use qcrypto_akcihper_max_xxx_len to help create buffers in
> test code.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  tests/unit/test-crypto-akcipher.c | 227 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 212 insertions(+), 15 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


