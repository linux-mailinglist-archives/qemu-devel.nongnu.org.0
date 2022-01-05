Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A08484FC9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:08:43 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Hi-0007gg-Kk
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n52Aq-0002Yn-KP
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:01:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n52Ao-0005kc-LA
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373290;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBWRm/zkUGL6rVdZWSTqKU6Me151HLPp74hurqvdR8M=;
 b=dQw4KgAVhLq2BD2q/Hx5iUlVrKrOob18RsD8s+O5MV+xQ+Y37PqKQschx/u6rGmg+zMo9+
 sMh1r6C5fI6XArjBgmAasA9cxn/Kq2qbIJXgzWYJU8Vzbn8GZK9wZRrxd9QdJikuQ/st+L
 FP7Vl7KK6w436W8A4VlgDGewVUzSlNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-vsGyHySzOduT35QLQfQmog-1; Wed, 05 Jan 2022 04:01:21 -0500
X-MC-Unique: vsGyHySzOduT35QLQfQmog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 183D3190A7A2;
 Wed,  5 Jan 2022 09:01:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA29B70D47;
 Wed,  5 Jan 2022 09:00:34 +0000 (UTC)
Date: Wed, 5 Jan 2022 09:00:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.3 release
Message-ID: <YdVeLlXQlp5IoZuo@redhat.com>
References: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
MIME-Version: 1.0
In-Reply-To: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Alex Benn_e <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 09:28:16PM -0500, Brad Smith wrote:
> FreeBSD: Upgrade to 12.3 release
> 
> Note, since libtasn1 was fixed in 12.3 [*], this commit re-enables GnuTLS.
> 
> [*] https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> 
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 5 +----
>  tests/vm/freebsd        | 8 +++-----
>  2 files changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


