Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60BF46CFDD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 10:14:31 +0100 (CET)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mut1y-00064k-Th
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 04:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mut0G-0004Ss-Ct
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mut0B-0000XN-ME
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638954758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vrm33grMNqLXoUWk9rmxr0Z2ga9I7GJe28baoY8Ow/E=;
 b=P8B6dv4EJJvkEL+yZaAzs0WjoHz2sHZD6WJpzmBCe3rosRzHEYulamBMA/sbwHv8/bU/Ne
 3PIf4ih133UyI7Mcbn2FmQL2YGBmEggT0eR4zjeCM409dcFaw+OyBecbYr36YOnMPtdQu6
 s/VWmeevE/8VspK2wVqHlHkx+tCL02o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-nlv7-0HbPsOC3J9H5QGysA-1; Wed, 08 Dec 2021 04:12:34 -0500
X-MC-Unique: nlv7-0HbPsOC3J9H5QGysA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E302F1006AA1;
 Wed,  8 Dec 2021 09:12:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663C060CC4;
 Wed,  8 Dec 2021 09:11:56 +0000 (UTC)
Date: Wed, 8 Dec 2021 09:11:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/2] spice: Update QXLInterface for spice >= 0.15.0
Message-ID: <YbB22r+hu3qSUQ4z@redhat.com>
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207204038.664133-2-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 03:40:37PM -0500, John Snow wrote:
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/qemu-spice.h |  6 ++++++
>  hw/display/qxl.c        | 14 +++++++++++++-
>  ui/spice-display.c      | 11 +++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


