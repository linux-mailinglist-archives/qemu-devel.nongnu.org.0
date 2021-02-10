Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DB316A7F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:51:47 +0100 (CET)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rmK-0000gu-Lc
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9rkS-0008Py-Jo
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9rkL-0008Rv-3T
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612972178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ4g6XaESOvBCfoce+E4ZKJEN7zSL0oc4paO9bTwTlk=;
 b=RMbH2/ng8Jwsupv6PyFed5/jdyQK1SiYGe7JuUGyabn9tlMMWFxAQeJqyZMnG2XjLKiZQA
 41wMewiAy8ZI7zGxFPhJbTG0n1fjyaaTxbNmi8g0yQEkWaJJbWhUpzhMGshIX27q+ecYaa
 t3xwYpcMGNrBP3aVxU3ysujEbbXP5zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-3upxvZSkOsm9eyhYGcGdPg-1; Wed, 10 Feb 2021 10:49:18 -0500
X-MC-Unique: 3upxvZSkOsm9eyhYGcGdPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71132801980;
 Wed, 10 Feb 2021 15:49:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A48435C1BD;
 Wed, 10 Feb 2021 15:49:15 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:49:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] .shippable: remove the last bits
Message-ID: <20210210154912.GK1240644@redhat.com>
References: <20210210154106.20825-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210210154106.20825-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 03:41:06PM +0000, Alex Bennée wrote:
> Shippable is about to sunset in May 2021 [1] and we had already moved
> a chunk of the crossbuilds to GitLab. We already cross build
> mips-softmmu targets since:
> 
>   6bcb5fc0f7 ("gitlab-ci: Add cross-compiling build tests")
> 
> and x86 is very well covered.
> 
> [1]: https://blog.shippable.com/the-next-step-in-the-evolution-of-shippable-jfrog-pipelines
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .shippable.yml | 23 -----------------------
>  1 file changed, 23 deletions(-)
>  delete mode 100644 .shippable.yml

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


