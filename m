Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B537F58C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:23:37 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8VE-0006i7-8W
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh8EC-0006P3-Fl
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh8E8-0003d4-Lk
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620900354;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaMHmAlcAIVv9JPAL/pv0OawLetKSX/81m9PnoMkMt0=;
 b=gHlhYsVbYs/krdOiQ81ys0Cw5X8sIJwgH5rWW2WgfMzAgNV5pwW3jpA9AHhl1o+RIeMXtb
 5ATx2tcfEFHQZKJu0bYCWQ3pIGPfdqlRgADkuaGHIH5Ly2ClSKSKSxQUD26nMETKkjyNEG
 VVBbkUhxK8iV7vDBnkFKGqOtqS6VHLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-SwJZEeIAPJidyUVrXYhphA-1; Thu, 13 May 2021 06:05:48 -0400
X-MC-Unique: SwJZEeIAPJidyUVrXYhphA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B68512D0;
 Thu, 13 May 2021 10:05:47 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C706A60CC6;
 Thu, 13 May 2021 10:05:38 +0000 (UTC)
Date: Thu, 13 May 2021 11:05:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/12] Wave goodbye to RHEL 7 vintage distros
Message-ID: <YJz57852xCy8/3Nh@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since posting I realized I made a mistake in considering Debian Stretch
versions, as we've already dropped Stretch from supported platforms.

I also made a mistake in analysing Clang versions in Ubuntu/Debian
as I didn't realize they ship many versions in parallel. I should
have been looking at the primary/default version as that's the one
which has full coverage across all host architectures.

IOW all of the min versions in this series are wrong. Most can
actually be bumped even higher than I put here, while Clang was
too high.

On Tue, May 11, 2021 at 02:26:29PM +0100, Daniel P. Berrangé wrote:
> The main motivation for this series is to eliminate some backcompat
> logic in the crypto code only needed for RHEL-7. I take the opportunity
> to also bump the min required versions of glib, gcc and clang since we
> have dropped many distros since they were last bumped.
> 
> There are possibly some more cleanups that can be done as a side effect
> of these new min versions, but I leave that for other interested people
> to look at.
> 
> One that might be intesting is switching from std=gnu99 to gnu11 since
> we're no longer constrainted by the 4.8.x vintage GCC which marked gnu11
> as experimental (see 7be41675f7cb16be7c8d2554add7a63fa43781a8)
> 
> Daniel P. Berrangé (12):
>   gitlab: move linux user build job from CentOS 7 to CentOS 8
>   patchew: move quick build job from CentOS 7 to CentOS 8 container
>   crypto: bump min nettle to 3.3, dropping RHEL-7 support
>   crypto: drop back compatibility typedefs for nettle
>   crypto: bump min gcrypt to 1.7.6, dropping RHEL-7 support
>   crypto: bump min gnutls to 3.5.8, dropping RHEL-7 support
>   crypto: drop used conditional check
>   tests/vm: convert centos VM recipe to CentOS 8
>   tests/docker: drop CentOS 7 container
>   bump min required glib version to 2.50
>   configure: bump min required GCC to 6.3.0
>   configure: bump min required CLang to 7.0.0 / XCode 10.2
> 
>  .gitlab-ci.d/containers.yml             |   5 -
>  .gitlab-ci.yml                          |  41 +----
>  .patchew.yml                            |   6 +-
>  configure                               |  40 ++---
>  crypto/cipher-nettle.c.inc              |  91 +++--------
>  crypto/hash-nettle.c                    |  10 +-
>  crypto/hmac-nettle.c                    |  12 +-
>  crypto/meson.build                      |   6 +-
>  crypto/tlscredsx509.c                   |   2 -
>  include/glib-compat.h                   |   9 --
>  tests/docker/dockerfiles/centos7.docker |  43 -----
>  tests/docker/dockerfiles/centos8.docker |   1 +
>  tests/vm/centos                         |   6 +-
>  util/oslib-win32.c                      | 204 ------------------------
>  14 files changed, 52 insertions(+), 424 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/centos7.docker
> 
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


