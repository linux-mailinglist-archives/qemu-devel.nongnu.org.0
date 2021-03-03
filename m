Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73732B7E2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:48:07 +0100 (CET)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQv7-0002nZ-F3
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHQto-0001FT-EC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHQtm-0006bs-KN
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614775601;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFlV+YRMurVq2IKZafK1r9tViZyfav1b8S1xW+2+kZY=;
 b=KI/efkfikRdJNrlygUn4m8nBfJ9knVgWbY5LP9fg/S9ooTAT3zWOHqtwqdB1kH5/exqSCb
 4u2CL9fE+l2qWaB5Up0oNfEUP2diNlTjBEs0DDbKpnTM1WjxShuQFliUb5hLFzxfjbRO8p
 N0qIaRWXSlCJGywep9LSMoCCNwmCXhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-mUA9lYJtNFeZv_mGIKrWxg-1; Wed, 03 Mar 2021 07:46:36 -0500
X-MC-Unique: mUA9lYJtNFeZv_mGIKrWxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 215C5800D53;
 Wed,  3 Mar 2021 12:46:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B91AF19725;
 Wed,  3 Mar 2021 12:46:32 +0000 (UTC)
Date: Wed, 3 Mar 2021 12:46:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docker: Base Fedora MinGW cross containers on the base
 Fedora image
Message-ID: <YD+FJarhR1yTWI0G@redhat.com>
References: <20210303124222.1485332-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303124222.1485332-1-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 01:42:22PM +0100, Philippe Mathieu-Daudé wrote:
> The only difference between fedora-winXX-cross.docker and
> fedora.docker is the specific QEMU_CONFIGURE_OPTS environment
> variable. All the rest can be inherited from the generic Fedora
> image.

This is relying on the base Fedora image already having the
mingw packages installed. My series to automate creation of
the container dockerfiles removes those entirely, so we have
strictly separate native and mingw images for Fedora:

  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03123.html

> Basing the cross containers on the generic Fedora allows us to
> - save registry/local storage
> - use more tools in the cross container (ccache for example).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml                   |  4 ++
>  tests/docker/Makefile.include                 |  2 +
>  .../dockerfiles/fedora-win32-cross.docker     | 41 +------------------
>  .../dockerfiles/fedora-win64-cross.docker     | 37 +----------------
>  4 files changed, 10 insertions(+), 74 deletions(-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


