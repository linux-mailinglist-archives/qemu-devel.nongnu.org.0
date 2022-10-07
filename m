Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A25F752C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:19:23 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogiZl-0004dd-1L
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiQp-0008Ae-IF
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiQk-0005sy-8s
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665130201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vijrIAZtSk6K5UlumhvZ+2AewrOYE7JIbffPUNXhoJI=;
 b=dwXsatSf7N05KtpRouzHOpAzrxUMkVP+RJwuBK/pdZcrAOfA+zURceQhjeRAB2ddWER/v4
 fZ8LjVFDBYywG2B6tGgqtTvicg29Z6vM2JQ8DhzwbDIEFXXK9C7qJ2/dUCpGyo5Pb+GNKX
 fqIKyzHpcUTiuDLssthh7VYxT55LDAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-pdIswsPlPZeWTse7XJAlMg-1; Fri, 07 Oct 2022 04:09:58 -0400
X-MC-Unique: pdIswsPlPZeWTse7XJAlMg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87DED862FDF;
 Fri,  7 Oct 2022 08:09:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C93B4B3FDF;
 Fri,  7 Oct 2022 08:09:54 +0000 (UTC)
Date: Fri, 7 Oct 2022 09:09:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
Message-ID: <Yz/ez3oxSI0R3fVt@redhat.com>
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 07, 2022 at 03:21:29AM -0400, Brad Smith wrote:
> tests: Add sndio to the FreeBSD CI containers / VM
> 
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
>  tests/docker/dockerfiles/alpine.docker        |   3 +-
>  tests/docker/dockerfiles/centos8.docker       |   2 +-
>  .../dockerfiles/debian-amd64-cross.docker     | 235 ++++++++---------
>  tests/docker/dockerfiles/debian-amd64.docker  | 237 +++++++++---------
>  .../dockerfiles/debian-arm64-cross.docker     | 233 ++++++++---------
>  .../dockerfiles/debian-armel-cross.docker     | 231 ++++++++---------
>  .../dockerfiles/debian-armhf-cross.docker     | 233 ++++++++---------
>  .../dockerfiles/debian-mips64el-cross.docker  | 227 ++++++++---------
>  .../dockerfiles/debian-mipsel-cross.docker    | 227 ++++++++---------
>  .../dockerfiles/debian-ppc64el-cross.docker   | 231 ++++++++---------
>  .../dockerfiles/debian-s390x-cross.docker     | 229 ++++++++---------
>  tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
>  tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
>  tests/docker/dockerfiles/ubuntu2004.docker    | 235 ++++++++---------
>  tests/lcitool/libvirt-ci                      |   2 +-
>  tests/lcitool/projects/qemu.yml               |   1 +
>  tests/vm/freebsd                              |   3 +
>  19 files changed, 1291 insertions(+), 1275 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Note to other reviewers, the changed whitespace in all the files
is expected. A bug was fixed in lcitool to make it correctly do
vertical alignment of the package lists.

Likewise the re-ordering of env vars is expected, as they are
now emitted in alphabetical order for stability.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


