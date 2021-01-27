Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B923060F7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:27:06 +0100 (CET)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4neq-0001vk-Nj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4ncA-0000ps-3j
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:24:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4nc7-0007hy-42
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611764652;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOQ1AZwTx/UAli9fGKrvc1i7ySRavHKJqWuDco1G5F8=;
 b=IIn/dpob2axei5htYjhOkidKV+sV+YXdWu8OSKAyPeYxTBOYh1pcuYyqxB3nt0c1yCfVwE
 MLuMgFEHMFLSWFXsoGfmA+8Gpbof68LZbQpPNjzdtQP2zv/x3WhkFk4o/LjxIu6KuFMFgj
 8LGxSSVJM8okjY1Qnbw+XfqFskUKwQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-5uEC-uGHPQircKLp-TVW_g-1; Wed, 27 Jan 2021 11:23:57 -0500
X-MC-Unique: 5uEC-uGHPQircKLp-TVW_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5857F1800D42;
 Wed, 27 Jan 2021 16:23:56 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E61BB19715;
 Wed, 27 Jan 2021 16:23:54 +0000 (UTC)
Date: Wed, 27 Jan 2021 16:23:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dan Streetman <ddstreet@canonical.com>
Subject: Re: [PATCHv2] configure: replace --enable/disable-git-update with
 --with-git-submodules
Message-ID: <20210127162352.GQ3653144@redhat.com>
References: <20210119172046.43869-1-ddstreet@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20210119172046.43869-1-ddstreet@canonical.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 12:20:46PM -0500, Dan Streetman wrote:
> Replace the --enable-git-update and --disable-git-update configure params
> with the param --with-git-submodules=(update|validate|ignore) to
> allow 3 options for building from a git repo.
> 
> This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
> also keep the source code in git, but do not want to enable the
> 'git_update' mode; with the current code, that's not possible even
> if the downstream package specifies --disable-git-update.
> 
> The previous parameters are deprecated but still available; the
> --enable-git-update parameter maps to --with-git-submodules=update and
> --disable-git-update parameter maps to --with-git-submodules=validate.
> 
> The configure script behavior is slightly modified, where previously
> the dtc, capstone, and slirp submodules were not validated when
> --disable-git-update was specified (but were updated with git-update
> enabled), now they are validated when using --with-git-submodules=validate
> and are only ignored when using --with-git-submodules=ignore.
> 
> Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> ---
> v1: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04799.html
> changes since v1:
>  - add --help output explaining --with-git-submodules valid values
>  - validate dtc, capstone, slirp submodules also
>  - update commit description text
> 
>  Makefile                 | 24 ++-----------------
>  configure                | 51 ++++++++++++++++++++++++++++++----------
>  scripts/git-submodule.sh | 34 ++++++++++++++++++++-------
>  3 files changed, 66 insertions(+), 43 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

I'll queue this with a batch of misc changes i have pending.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


