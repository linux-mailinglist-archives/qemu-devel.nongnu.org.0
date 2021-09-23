Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85B415C91
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:12:11 +0200 (CEST)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMeA-000051-RS
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTMbZ-0006xs-TO
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTMbU-0004UF-Iw
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632395361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/nYKkCTeX3HzUlO9SJXPmEHMBYDM1EF3oCMm7+xzCRI=;
 b=YCJio7BJLRCI2XSIiV4BqHX/e3fQywtzRkgE1eQ5qh9TnMt1P+SGxusav+YiJfCAlclC5v
 CZdWZ+vdNOiVfx41Q/EzSn2t6vxp0RUXp0gAlI0clbKP3i0OIwAFKRC60SW1OBYomgpcY2
 Sr3RnIOW41cbj0YKNIUUvwEqPhmqS7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-2aE5YdANN-mZaD8A24JbFA-1; Thu, 23 Sep 2021 07:09:15 -0400
X-MC-Unique: 2aE5YdANN-mZaD8A24JbFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B3AEA40C0;
 Thu, 23 Sep 2021 11:09:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 135A1970E7;
 Thu, 23 Sep 2021 11:09:09 +0000 (UTC)
Date: Thu, 23 Sep 2021 12:09:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] iotests: add warning for rogue 'qemu' packages
Message-ID: <YUxgU6DrbcspzDtr@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923001625.3996451-3-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 08:16:21PM -0400, John Snow wrote:
> Add a warning for when 'iotests' runs against a qemu namespace that
> isn't the one in the source tree. This might occur if you have
> (accidentally) installed the Python namespace package to your local
> packages.

IIUC, it is/was a valid use case to run the iotests on arbitrary
QEMU outside the source tree ie a distro packaged binary set.

Are we not allowing the tests/qemu-iotests/* content to be
run outside the context of the main source tree for this
purpose ?

eg  consider if Fedora/RHEL builds put tests/qemu-iotests/* into
a 'qemu-iotests' RPM, which was installed and used with a distro
package python-qemu ?

> (I'm not going to say that this is because I bit myself with this,
> but. You can fill in the blanks.)
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 88104dace90..8a43b193af5 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -16,6 +16,8 @@
>  # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>  #
>  
> +import importlib.util
> +import logging
>  import os
>  import sys
>  import tempfile
> @@ -25,7 +27,7 @@
>  import random
>  import subprocess
>  import glob
> -from typing import List, Dict, Any, Optional, ContextManager
> +from typing import List, Dict, Any, Optional, ContextManager, cast
>  
>  DEF_GDB_OPTIONS = 'localhost:12345'
>  
> @@ -112,6 +114,22 @@ def init_directories(self) -> None:
>          # Path where qemu goodies live in this source tree.
>          qemu_srctree_path = Path(__file__, '../../../python').resolve()
>  
> +        # warn if we happen to be able to find 'qemu' packages from an
> +        # unexpected location (i.e. the package is already installed in
> +        # the user's environment)
> +        qemu_spec = importlib.util.find_spec('qemu.qmp')
> +        if qemu_spec:
> +            spec_path = Path(cast(str, qemu_spec.origin))
> +            try:
> +                _ = spec_path.relative_to(qemu_srctree_path)
> +            except ValueError:
> +                self._logger.warning(
> +                    "WARNING: 'qemu' package will be imported from outside "
> +                    "the source tree!")
> +                self._logger.warning(
> +                    "Importing from: '%s'",
> +                    spec_path.parents[1])

It feels to me like the scenario  we're blocking here is actally
the scenario we want to aim for.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


