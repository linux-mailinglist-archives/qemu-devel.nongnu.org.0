Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF2252963
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 10:41:43 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAr03-0004FW-3N
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 04:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAqzN-0003pz-1O
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:41:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27151
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAqzL-0000s0-8L
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598431258;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EChZqYvt84M6anPPVoSlnG/rc3IeolDKRfAP8tZk3IQ=;
 b=DbKa3Yb/ujDp7G3RcNnFUbJk0HtdAWEQ67IkuDV5aUgAH8mcMkevssB7T/J/xwTQwdetWe
 6+a7hd7H5wcrg+YA3GCBBwZbVcvEgWdI5koToqHHducTJaWxeYQIvO1yKiPBZ5iuuXCc1K
 wEXwUxU42bgwVhVNYKzKiOzBbMgD3ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560--gOksbavPJuXquV5srZWrw-1; Wed, 26 Aug 2020 04:40:55 -0400
X-MC-Unique: -gOksbavPJuXquV5srZWrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47F4107467E;
 Wed, 26 Aug 2020 08:40:53 +0000 (UTC)
Received: from redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B434760C0F;
 Wed, 26 Aug 2020 08:40:49 +0000 (UTC)
Date: Wed, 26 Aug 2020 09:40:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 5/5] meson: add NSIS building
Message-ID: <20200826084047.GG168515@redhat.com>
References: <20200825175827.355940-1-marcandre.lureau@redhat.com>
 <20200825175827.355940-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200825175827.355940-6-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 02:47:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 25, 2020 at 09:58:27PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  Makefile        | 56 -----------------------------------
>  meson.build     | 25 ++++++++++++++++
>  scripts/nsis.py | 78 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 103 insertions(+), 56 deletions(-)
>  create mode 100644 scripts/nsis.py

> diff --git a/scripts/nsis.py b/scripts/nsis.py
> new file mode 100644
> index 0000000000..e1c409344e
> --- /dev/null
> +++ b/scripts/nsis.py
> @@ -0,0 +1,78 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (C) 2020 Red Hat, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import argparse
> +import glob
> +import os
> +import shutil
> +import subprocess
> +import tempfile
> +
> +
> +def signcode(path):
> +    cmd = os.environ.get("SIGNCODE")
> +    if not cmd:
> +        return
> +    subprocess.run([cmd, path])

I know the existing makefile used  $SIGNCODE env variable, but I can't
help thinking it would be better to have it as a configure arg, and
in turn a meson arg.

None the less, it isn't worse than what already exists so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


