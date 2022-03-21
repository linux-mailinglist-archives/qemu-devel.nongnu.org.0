Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D44E2DDC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:26:56 +0100 (CET)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKru-000782-V3
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:26:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWKna-0000Pq-EC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWKnY-0004bU-GQ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwcszGPg0TmiTauuuc+cr9HYML0Z06pGik9WUnY5DwM=;
 b=HjP8sxK4yKm9R0RrkRy+8PPPo9UKhF51UvCb9fHyO4kD1lxFO3JzdbmAKAYFj2md4Pji+I
 t+fPfUUCcwjrsPvIiAob/3EPUgOX/3K3+VTrvTTYPyWI1jDRhUUVWHZrAX7eivKEdoVhqg
 G0A0ysVxjLvwZ2EKUr7aSd3mFfZi374=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-wYihiByaNx-vepbftht9CQ-1; Mon, 21 Mar 2022 12:22:16 -0400
X-MC-Unique: wYihiByaNx-vepbftht9CQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B40D8117B0;
 Mon, 21 Mar 2022 16:22:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C754B40C1241;
 Mon, 21 Mar 2022 16:22:14 +0000 (UTC)
Date: Mon, 21 Mar 2022 16:22:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] gitlab: disable accelerated zlib for s390x
Message-ID: <YjimNLjIJZocY4a8@redhat.com>
References: <20220321161151.3654386-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220321161151.3654386-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 04:11:51PM +0000, Alex Bennée wrote:
> There appears to be a bug in the s390 hardware-accelerated version of
> zlib distributed with Ubuntu 20.04, which makes our test
> /i386/migration/multifd/tcp/zlib hit an assertion perhaps one time in
> 10. Fortunately zlib provides an escape hatch where we can disable the
> hardware-acceleration entirely by setting the environment variable
> DFLTCC to 0. Do this on all our CI which runs on s390 hosts, both our
> custom gitlab runner and also the Travis hosts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>   - more complete commit wording from Peter
>   - also tweak travis rules
> ---
>  .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ++++++++++++
>  .travis.yml                                        |  6 ++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


