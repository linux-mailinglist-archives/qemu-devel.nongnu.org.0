Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6854F6B1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:28:55 +0200 (CEST)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2A9m-0003ne-5N
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2A24-0006l2-Ox
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2A22-0005EG-1w
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655464853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9cEjKNFmmhrrKMK/XT/uk+2p8zGufIkYXfUebMfJgA=;
 b=NHSiV8uAzpmEgiIJDt30bMThlT7N1nP6Bo+drLeZvCXsHAiWONkd/aLhIMeg0GaGLXLF1C
 81i+Cm4eHwhLHiaT8L1+2AU3oyQLV6NJWSxiww5Q8gb4Za66t0Mw8kfYCjzSO/362cdgVu
 FWyaCOAPU6KakTmfwHzvrtpwhuXd9V0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-YVdWchayM-Sz1mrpJAlf5Q-1; Fri, 17 Jun 2022 07:20:51 -0400
X-MC-Unique: YVdWchayM-Sz1mrpJAlf5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5344E80A0AD;
 Fri, 17 Jun 2022 11:20:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEE01121314;
 Fri, 17 Jun 2022 11:20:50 +0000 (UTC)
Date: Fri, 17 Jun 2022 12:20:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [PATCH 3/7] crypto: remove "qemu/osdep.h" in rsakey.h
Message-ID: <YqxjkEXYgdAoFFcI@redhat.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-4-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613084531.8086-4-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Mon, Jun 13, 2022 at 04:45:27PM +0800, Lei He wrote:
> Move 'include "qemu/osdep.h"' from rsakey.h to rsakey.c.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/rsakey.c | 1 +
>  crypto/rsakey.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


