Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A9476F1A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:47:32 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoIN-0000Ap-Dr
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoEQ-0005Tw-FI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoEO-0002mP-V1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mRd5iQ9pSmxFGy7ngI7n4OrqfynVEZMVLscmxIfQs0c=;
 b=fxksWuh7CV7hvNAEj2P+He+3B7KS/sbz3OrWZn1X/3Ig/5sDJ51U7NPqsY6ELKM71NW9pM
 Jn5q7GJfvE04hcsKlvlB1duf6Uzzyvtzxv8TXwuxCr/NL510vGF4V2g8RvTvb2byR3OLHE
 ZYUUHPmQHYEbSY5p90vVXVw5ybcv+Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-KYk0uO0VPjuw0RjfheD-Fg-1; Thu, 16 Dec 2021 05:43:21 -0500
X-MC-Unique: KYk0uO0VPjuw0RjfheD-Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F4F8015CD;
 Thu, 16 Dec 2021 10:43:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C1F348F2;
 Thu, 16 Dec 2021 10:43:09 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:43:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC qemu.qmp PATCH 03/24] Update maintainer metadata
Message-ID: <YbsYO514CsqjYn5t@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215210634.3779791-4-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 04:06:13PM -0500, John Snow wrote:
> I'm the primary author of this particular component; update the metadata
> accordingly.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/setup.cfg b/setup.cfg
> index 9999bca..7cd8470 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -1,7 +1,9 @@
>  [metadata]
>  name = qemu.qmp
>  version = file:VERSION
> -maintainer = QEMU Developer Team
> +author = John Snow
> +author_email = jsnow@redhat.com

Isn't the authorship of this more of a collaborative effort ?
IOW, shouldn't it just be "The QEMU Project" as for the
maintainer.

> +maintainer = QEMU Project
>  maintainer_email = qemu-devel@nongnu.org
>  url = https://www.qemu.org/
>  download_url = https://www.qemu.org/download/

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


