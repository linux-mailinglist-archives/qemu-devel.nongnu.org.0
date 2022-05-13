Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970F525FE5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:39:34 +0200 (CEST)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npShp-0004Hh-7P
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npSdr-0008P8-Uu
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npSdo-0004Qx-9Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652438122;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiscHCJHMgi1oHGKt46oSAX7BJQ7MgtDGJai8XhZKQM=;
 b=Igyw7RsNgrkpVhMCxEC7G8FsRttoJ8prG97RJpo8UQABRq2uuP4cU9aIzYD56kQhvnSLeL
 znprV8uEDY/mVFQkL2r0VnC2DpNf9/Z081SU7EkuOrWKbTt+nFyhW/AjUAhv+JtQ7QcNhJ
 L/Pr2SYuQqSS8/xgKReobSubjl1IXhk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-_1tPb89cP_ucF1NJo3oLuQ-1; Fri, 13 May 2022 06:35:19 -0400
X-MC-Unique: _1tPb89cP_ucF1NJo3oLuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93EB0294EDE5;
 Fri, 13 May 2022 10:35:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74DAA40D2820;
 Fri, 13 May 2022 10:35:16 +0000 (UTC)
Date: Fri, 13 May 2022 11:35:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v5 8/9] tests/crypto: Add test suite for RSA keys
Message-ID: <Yn40YuXEpJZ2lfCt@redhat.com>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
 <20220428135943.178254-9-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428135943.178254-9-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, Apr 28, 2022 at 09:59:42PM +0800, zhenwei pi wrote:
> From: Lei He <helei.sig11@bytedance.com>
> 
> As Daniel suggested, Add tests suite for rsakey, as a way to prove
> that we can handle DER errors correctly.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  tests/unit/test-crypto-akcipher.c | 285 +++++++++++++++++++++++++++++-
>  1 file changed, 282 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


