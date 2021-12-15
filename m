Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94E475851
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:01:40 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSyZ-0003Xq-8b
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxShi-000059-Kg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxShe-0003VV-Lk
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639568648;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/p3gstzxqVvl5ZI5MwzFzJvQUpfLwXOU2yrIzJijwY=;
 b=YuZYMVY73qBO02D1QUIdTb9mmra6BtWKvp793mrhi661GAK0Txocln1UhZD3KoHYBPWEAP
 RV1SDJgBlbay88SE0iulLFOO8KL4DgHLHhhUkVLQjnbrSq8ZrZBNFaA2/+M7dr2vXSr4nl
 YMKQ5tN4PQkKE0WDaJBVIrjuAn47MhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-XtIMJupKPXiWp_hIlHQ1gg-1; Wed, 15 Dec 2021 06:44:00 -0500
X-MC-Unique: XtIMJupKPXiWp_hIlHQ1gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D5F1006AA1;
 Wed, 15 Dec 2021 11:43:57 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F377E66C;
 Wed, 15 Dec 2021 11:43:25 +0000 (UTC)
Date: Wed, 15 Dec 2021 11:43:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 15/18] tests/docker: updates to alpine package list
Message-ID: <YbnU27X8w9MACkxe@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-16-berrange@redhat.com>
 <a18b26b9-f0a0-5bbc-0ecf-d97480f72030@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a18b26b9-f0a0-5bbc-0ecf-d97480f72030@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 12:31:33PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/24/21 14:01, Daniel P. Berrangé wrote:
> > Cleanup the package lists by removing some entries that we don't need to
> > directly reference
> > 
> >   binutils: implied by the compiler toolchain
> >   coreutils: not required by QEMU build
> >   mesa-egl mesa-gbm: implied by mesa-dev
> >   ninja: alias for samurai package
> 
> I'd rather keep the alias to avoid looking for ninja or
> for what samurai is. Anyhow,

This change was done to align with the package lists that
lcitool will generate. In lcitool we always aim to use the
canonical package name, rather than any alias, so it is
explicit what impl we're using for something.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> >   shadow: not required by QEMU build
> >   util-linux-dev: not directly required by QEMU build
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/docker/dockerfiles/alpine.docker | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


