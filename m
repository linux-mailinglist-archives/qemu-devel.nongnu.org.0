Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B8415CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:19:24 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMl9-0003eg-Kb
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTMjB-0002wt-EO
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTMj9-00033t-OG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632395838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nFLUBPLR/5htiRHFu2oLx0OhiNysRJN9MQ5XjABwLtI=;
 b=FCSSKkveMgEFCr3QS5ccrCQtZscGAOfUk4nMSVsr/VpEhB6KHOpTUSs+k+OkIIjc8lOmiQ
 RFS07VHoUj3a9qBGXP3FyubnJznRPM3qT0k/y+V5XJXdEM5GAa9rb14RQAG9g7LWAJ7ILj
 qDs5G2DcIdTzx5lfyCG+TSvbJ/u3uhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-C4xZaJiMNBaVeAjjua0BJg-1; Thu, 23 Sep 2021 07:17:17 -0400
X-MC-Unique: C4xZaJiMNBaVeAjjua0BJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FDE41018720;
 Thu, 23 Sep 2021 11:17:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 311CE5FC13;
 Thu, 23 Sep 2021 11:17:15 +0000 (UTC)
Date: Thu, 23 Sep 2021 13:17:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] iotests: add warning for rogue 'qemu' packages
Message-ID: <YUxiOUTzEtNsiAI7@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-3-jsnow@redhat.com>
 <YUxdjJnwhABAvfbR@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YUxdjJnwhABAvfbR@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2021 um 12:57 hat Kevin Wolf geschrieben:
> Am 23.09.2021 um 02:16 hat John Snow geschrieben:
> > Add a warning for when 'iotests' runs against a qemu namespace that
> > isn't the one in the source tree. This might occur if you have
> > (accidentally) installed the Python namespace package to your local
> > packages.
> > 
> > (I'm not going to say that this is because I bit myself with this,
> > but. You can fill in the blanks.)
> > 
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> > index 88104dace90..8a43b193af5 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -16,6 +16,8 @@
> >  # along with this program.  If not, see <http://www.gnu.org/licenses/>.
> >  #
> >  
> > +import importlib.util
> > +import logging
> >  import os
> >  import sys
> >  import tempfile
> > @@ -25,7 +27,7 @@
> >  import random
> >  import subprocess
> >  import glob
> > -from typing import List, Dict, Any, Optional, ContextManager
> > +from typing import List, Dict, Any, Optional, ContextManager, cast
> >  
> >  DEF_GDB_OPTIONS = 'localhost:12345'
> >  
> > @@ -112,6 +114,22 @@ def init_directories(self) -> None:
> >          # Path where qemu goodies live in this source tree.
> >          qemu_srctree_path = Path(__file__, '../../../python').resolve()
> >  
> > +        # warn if we happen to be able to find 'qemu' packages from an
> > +        # unexpected location (i.e. the package is already installed in
> > +        # the user's environment)
> > +        qemu_spec = importlib.util.find_spec('qemu.qmp')
> > +        if qemu_spec:
> > +            spec_path = Path(cast(str, qemu_spec.origin))
> 
> You're casting Optional[str] to str here. The source type is not obvious
> from the local code, so unless you spend some time actively figuring it
> out, this could be casting anything to str. But even knowing this, just
> casting Optional away looks fishy anyway.
> 
> Looking up the ModuleSpec docs, it seems okay to assume that it's never
> None in our case, but wouldn't it be much cleaner to just 'assert
> qemu_spec.origin' first and then use it without the cast?
> 
> > +            try:
> > +                _ = spec_path.relative_to(qemu_srctree_path)
> > +            except ValueError:
> > +                self._logger.warning(
> > +                    "WARNING: 'qemu' package will be imported from outside "
> > +                    "the source tree!")
> > +                self._logger.warning(
> > +                    "Importing from: '%s'",
> > +                    spec_path.parents[1])
> > +
> >          self.pythonpath = os.getenv('PYTHONPATH')
> >          self.pythonpath = os.pathsep.join(filter(None, (
> >              self.source_iotests,
> > @@ -231,6 +249,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
> >  
> >          self.build_root = os.path.join(self.build_iotests, '..', '..')
> >  
> > +        self._logger = logging.getLogger('qemu.iotests')
> >          self.init_directories()
> >          self.init_binaries()
> 
> Looks good otherwise.

Well, actually there is a major problem: We'll pass the right PYTHONPATH
for the test scripts that we're calling, but this script itself doesn't
use it yet. So what I get is:

Traceback (most recent call last):
  File "/home/kwolf/source/qemu/tests/qemu-iotests/build/check", line 120, in <module>
    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
  File "/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py", line 253, in __init__
    self.init_directories()
  File "/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py", line 120, in init_directories
    qemu_spec = importlib.util.find_spec('qemu.qmp')
  File "/usr/lib64/python3.9/importlib/util.py", line 94, in find_spec
    parent = __import__(parent_name, fromlist=['__path__'])
ModuleNotFoundError: No module named 'qemu'

Kevin


