Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244666435B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEob-0005Cl-Vs; Tue, 10 Jan 2023 08:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFEoT-0005Ag-LJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:37:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFEoR-0005c3-VT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673357831;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNfl8UA66hC/F172YiT1851Mv6QI6+4VqQaMo4McX5I=;
 b=ioVkIZIh8v4bEsVIuL98PqsE81XWwCUIHUTsFSQO/9Ed6Cj6aoS+E5PlbSS6EZhrLJxpu8
 INwtiYlqrzNzNeLypKrRBGsCdvueo+rRH6DoEjXc4SqNOI1I/QGOuBBcwjeeFyCW4UH3zw
 ST/gywmkoUCNhfduqDaUe9hf5ppFLPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-leICeZfeP_-gUA4FygvcWQ-1; Tue, 10 Jan 2023 08:37:08 -0500
X-MC-Unique: leICeZfeP_-gUA4FygvcWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AD65101B429;
 Tue, 10 Jan 2023 13:37:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C9451E5;
 Tue, 10 Jan 2023 13:37:04 +0000 (UTC)
Date: Tue, 10 Jan 2023 13:37:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 8/8] lcitool: drop texinfo from QEMU
 project/dependencies
Message-ID: <Y71p/mYPljKXcXJa@redhat.com>
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110132700.833690-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 05:27:00PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>  .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>  tests/docker/dockerfiles/alpine.docker                | 1 -
>  tests/docker/dockerfiles/centos8.docker               | 1 -
>  tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-amd64.docker          | 1 -
>  tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-armel-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +--
>  tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 +--
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 +--
>  tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-toolchain.docker      | 1 -
>  tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
>  tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
>  tests/docker/dockerfiles/fedora.docker                | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
>  tests/lcitool/projects/qemu.yml                       | 1 -
>  21 files changed, 11 insertions(+), 29 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


