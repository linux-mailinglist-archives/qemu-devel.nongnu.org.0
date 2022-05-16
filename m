Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CAA5286A8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:13:23 +0200 (CEST)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbTN-0000yk-Kf
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqbRQ-00085W-HN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqbRM-0002JC-TP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652710275;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQITtdr4+TT4jxBl3r7Oy4wvX1g1+yMdwiiza13qe5g=;
 b=C2xdAaFdbZwGZ6rTe6VdGBrJGHbXTy0qyO7WRRoCHZO2LmeXIOCRhs2W1xXPyzIyZc/y3k
 KuitUK5U714lZ4l7Bba99XMwx2guPfLgO7q2ArUuEmwpE+Vs2SHbE0FVHI9KuRsj9mReNF
 kElmlR1JvvUmnzDei5dxW6slochG2Go=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-GRmv3EfxP-imRfMoo2X_IA-1; Mon, 16 May 2022 10:11:12 -0400
X-MC-Unique: GRmv3EfxP-imRfMoo2X_IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFEC529ABA1C;
 Mon, 16 May 2022 14:11:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE0240CF8E2;
 Mon, 16 May 2022 14:11:10 +0000 (UTC)
Date: Mon, 16 May 2022 15:11:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Fam Zheng <fam@euphon.net>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Subject: Re: [PATCH v2] Remove Ubuntu 18.04 conatiner support from the
 repository
Message-ID: <YoJbezGc0eVlh94d@redhat.com>
References: <20220516115912.120951-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516115912.120951-1-thuth@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 01:59:12PM +0200, Thomas Huth wrote:
> According to our "Supported build platforms" policy, we now do not support
> Ubuntu 18.04 anymore. Remove the related container files and entries from
> our CI.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Omit the VM images from tests/vm/ for now, Philippe wants to rework them
> 
>  .gitlab-ci.d/containers.yml                   |   5 -
>  .../custom-runners/ubuntu-20.04-aarch32.yml   |   2 +-
>  .../custom-runners/ubuntu-20.04-aarch64.yml   |   2 +-
>  scripts/ci/setup/build-environment.yml        |  14 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    | 144 ------------------
>  tests/lcitool/refresh                         |   7 -
>  6 files changed, 4 insertions(+), 170 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


