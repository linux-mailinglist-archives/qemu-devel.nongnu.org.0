Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCDF2FB805
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:29:00 +0100 (CET)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s0B-0007IU-6c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rwV-0004Ab-Fl
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rwS-0002Ly-16
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611066306;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8NO8SkZU1jIixaJt3FjJ1KWC3dj35iNoWinqWBoy/NQ=;
 b=aNWlpX0Ibi71Yb6olEQ9wTTEdh6ViFoE/X47DrvZunigBGUff80DQ065VDP3Xdwg47faWD
 vY2rgX0muLGnl/xAI7DVrhEfTw9MfXdQibUjVFshKOjWmMXDN+nJlScvMexOYpbr1lW3oB
 UtatGFF2HyYnCEVx9saf9HJKoYQk4M8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-6c-E25zvP6W3kC6aQUs8Aw-1; Tue, 19 Jan 2021 09:25:04 -0500
X-MC-Unique: 6c-E25zvP6W3kC6aQUs8Aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0786C8015C3;
 Tue, 19 Jan 2021 14:25:03 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008B5100239A;
 Tue, 19 Jan 2021 14:24:58 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:24:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] deploy docs to qemu-project.org from GitLab CI
Message-ID: <20210119142455.GF2335568@redhat.com>
References: <20210119132619.302207-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119132619.302207-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:26:19PM +0100, Paolo Bonzini wrote:
> Currently, the website is rebuilt on qemu-project.org using
> a separate container (https://github.com/stefanha/qemu-docs/)
> cron job hook.  We can instead reuse the GitLab's CI artifacts.
> 
> To do so, we use the same mechanism that is already in place for
> qemu-web.git.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml                             | 23 ++++++++++++++++++++++
>  tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
>  2 files changed, 25 insertions(+)


> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index ae889d8482..2bb826c376 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -50,6 +50,7 @@ ENV PACKAGES flex bison \
>      make \
>      netcat-openbsd \
>      ninja-build \
> +    openssh-client \
>      python3-numpy \
>      python3-opencv \
>      python3-pil \
> @@ -58,6 +59,7 @@ ENV PACKAGES flex bison \
>      python3-venv \
>      python3-yaml \
>      rpm2cpio \
> +    rsync \

Can we just stick to installing them in the deploy pre-script as for
the other job, as this dockerfile is going to be auto-generated with
just the real world QEMU dependancies present soon.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


