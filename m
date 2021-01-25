Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E548302EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:06:55 +0100 (CET)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4A0b-00076d-R4
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l49zV-0006Lf-E4
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l49zT-0007Px-0l
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611612341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzHTpc79R9gxQmlS7+BBXdc9efdL5+74fMd2A0LysOw=;
 b=S2igcvYXEsYL7N6UT4LPJPfN/9EYx0ynTz2GUwNiZzl4lTcClOVfaDoLiPoe90w1yzKJ1U
 /PAlb0U00BDu2T9XqoCF55CgNZi3ZnByItZmxuhSbh90LA01+ptLy6bFc7cDZjE3PJ0K7h
 Ii6LrQsMBHTe9bjfq2kOXTvyfZWlsJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-OrmgyxZ2PEGB6_pDuQtQZg-1; Mon, 25 Jan 2021 17:05:33 -0500
X-MC-Unique: OrmgyxZ2PEGB6_pDuQtQZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10085107ACE3;
 Mon, 25 Jan 2021 22:05:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-150.ams2.redhat.com [10.36.115.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 514BF60C47;
 Mon, 25 Jan 2021 22:05:29 +0000 (UTC)
Date: Mon, 25 Jan 2021 23:05:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 2/5] iotests: add testenv.py
Message-ID: <20210125220528.GA170615@merkur.fritz.box>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210123210428.27220-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210123210428.27220-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.01.2021 um 22:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testenv.py | 278 ++++++++++++++++++++++++++++++++++
>  1 file changed, 278 insertions(+)
>  create mode 100644 tests/qemu-iotests/testenv.py
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> new file mode 100644
> index 0000000000..348af593e9
> --- /dev/null
> +++ b/tests/qemu-iotests/testenv.py
> @@ -0,0 +1,278 @@
> +# TestEnv class to manage test environment variables.
> +#
> +# Copyright (c) 2020-2021 Virtuozzo International GmbH
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import os
> +import sys
> +import tempfile
> +from pathlib import Path
> +import shutil
> +import collections
> +import random
> +import subprocess
> +import glob
> +from contextlib import AbstractContextManager
> +from typing import Dict, Any, Optional
> +
> +
> +def get_default_machine(qemu_prog: str) -> str:
> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
> +                          universal_newlines=True,
> +                          stdout=subprocess.PIPE).stdout
> +
> +    machines = outp.split('\n')
> +    default_machine = next(m for m in machines if m.endswith(' (default)'))
> +    default_machine = default_machine.split(' ', 1)[0]
> +
> +    alias_suf = ' (alias of {})'.format(default_machine)
> +    alias = next((m for m in machines if m.endswith(alias_suf)), None)
> +    if alias is not None:
> +        default_machine = alias.split(' ', 1)[0]
> +
> +    return default_machine
> +
> +
> +class TestEnv(AbstractContextManager['TestEnv']):

I'm getting CI failures here:

Traceback (most recent call last):
  File "./check", line 23, in <module>
    from testenv import TestEnv
  File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 49, in <module>
    class TestEnv(AbstractContextManager['TestEnv']):
TypeError: 'ABCMeta' object is not subscriptable

On the other hand, if I make it just AbstractContextManager without
giving the type parameter, mypy complains:

testenv.py:49: error: Missing type parameters for generic type "ContextManager"

I guess I need to have another look into this tomorrow.

By the way, mypy --strict still finds a few errors. I think we want to
address at least the warnings about missing type annotatings and calling
untyped functions.

Kevin


