Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D32765E8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 03:35:28 +0200 (CEST)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLGAR-00006P-6I
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 21:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLG5F-0003ih-Bn
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 21:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLG5D-0006Ir-7L
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 21:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600911002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhWQdA/ZbTFCtsXqBs29ojJlArijq3k6oxbZkb6V4E0=;
 b=eC/pm4BtltF4E79n8tTASJawfn5CcSzWDCsAAEkxpY+VtD5z3a0990+na1FBNbgyWfCmJk
 /ms6PEB2PKs2lyOARhbywUkcom+r6QdRE5ryI9AZ2NYTVtg+QzZBDbTPi00zBd3S3HxvOG
 g5TuSTb3hjARLFuDym8Jq7G4HZlHGPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-YzAjVUiRM2avk8mJiZSbNw-1; Wed, 23 Sep 2020 21:29:58 -0400
X-MC-Unique: YzAjVUiRM2avk8mJiZSbNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B586186DD32;
 Thu, 24 Sep 2020 01:29:57 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11DC75D990;
 Thu, 24 Sep 2020 01:29:56 +0000 (UTC)
Date: Wed, 23 Sep 2020 21:29:56 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 25/38] qapi/gen.py: add type hint annotations
Message-ID: <20200924012956.GA3717385@habkost.net>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-26-jsnow@redhat.com>
 <20200923235122.GZ191229@localhost.localdomain>
 <1fabb4f5-ba1f-ee43-956f-aeb1225144ad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1fabb4f5-ba1f-ee43-956f-aeb1225144ad@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 23, 2020 at 08:29:17PM -0400, John Snow wrote:
> On 9/23/20 7:51 PM, Cleber Rosa wrote:
> > On Tue, Sep 22, 2020 at 05:00:48PM -0400, John Snow wrote:
> > > Annotations do not change runtime behavior.
> > > This commit *only* adds annotations.
> > > 
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   scripts/qapi/gen.py | 102 +++++++++++++++++++++++---------------------
> > >   1 file changed, 53 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > > index cb2b2655c3..df8cf8271c 100644
> > > --- a/scripts/qapi/gen.py
> > > +++ b/scripts/qapi/gen.py
> > > @@ -17,7 +17,7 @@
> > >   import errno
> > >   import os
> > >   import re
> > > -from typing import Optional
> > > +from typing import Dict, Generator, List, Optional, Tuple
> > >   from .common import (
> > >       c_fname,
> > > @@ -32,31 +32,31 @@
> > >       QAPISchemaObjectType,
> > >       QAPISchemaVisitor,
> > >   )
> > > +from .source import QAPISourceInfo
> > >   class QAPIGen:
> > > -
> > > -    def __init__(self, fname):
> > > +    def __init__(self, fname: Optional[str]):
> > >           self.fname = fname
> > >           self._preamble = ''
> > >           self._body = ''
> > > -    def preamble_add(self, text):
> > > +    def preamble_add(self, text: str) -> None:
> > >           self._preamble += text
> > > -    def add(self, text):
> > > +    def add(self, text: str) -> None:
> > >           self._body += text
> > > -    def get_content(self):
> > > +    def get_content(self) -> str:
> > >           return self._top() + self._preamble + self._body + self._bottom()
> > > -    def _top(self):
> > > +    def _top(self) -> str:
> > >           return ''
> > > -    def _bottom(self):
> > > +    def _bottom(self) -> str:
> > >           return ''
> > > -    def write(self, output_dir):
> > > +    def write(self, output_dir: str) -> None:
> > >           # Include paths starting with ../ are used to reuse modules of the main
> > >           # schema in specialised schemas. Don't overwrite the files that are
> > >           # already generated for the main schema.
> > > @@ -81,7 +81,7 @@ def write(self, output_dir):
> > >           f.close()
> > > -def _wrap_ifcond(ifcond, before, after):
> > > +def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
> > >       if before == after:
> > >           return after   # suppress empty #if ... #endif
> > > @@ -121,40 +121,38 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
> > >   class QAPIGenCCode(QAPIGen):
> > > -
> > > -    def __init__(self, fname):
> > > +    def __init__(self, fname: Optional[str]):
> > >           super().__init__(fname)
> > > -        self._start_if = None
> > > +        self._start_if: Optional[Tuple[List[str], str, str]] = None
> > > -    def start_if(self, ifcond):
> > > +    def start_if(self, ifcond: List[str]) -> None:
> > >           assert self._start_if is None
> > >           self._start_if = (ifcond, self._body, self._preamble)
> > > -    def end_if(self):
> > > +    def end_if(self) -> None:
> > >           assert self._start_if
> > >           self._wrap_ifcond()
> > >           self._start_if = None
> > > -    def _wrap_ifcond(self):
> > > +    def _wrap_ifcond(self) -> None:
> > >           self._body = _wrap_ifcond(self._start_if[0],
> > >                                     self._start_if[1], self._body)
> > >           self._preamble = _wrap_ifcond(self._start_if[0],
> > >                                         self._start_if[2], self._preamble)
> > > -    def get_content(self):
> > > +    def get_content(self) -> str:
> > >           assert self._start_if is None
> > >           return super().get_content()
> > >   class QAPIGenC(QAPIGenCCode):
> > > -
> > > -    def __init__(self, fname, blurb, pydoc):
> > > +    def __init__(self, fname: str, blurb: str, pydoc: str):
> > >           super().__init__(fname)
> > >           self._blurb = blurb
> > >           self._copyright = '\n * '.join(re.findall(r'^Copyright .*', pydoc,
> > >                                                     re.MULTILINE))
> > > -    def _top(self):
> > > +    def _top(self) -> str:
> > >           return mcgen('''
> > >   /* AUTOMATICALLY GENERATED, DO NOT MODIFY */
> > > @@ -170,7 +168,7 @@ def _top(self):
> > >   ''',
> > >                        blurb=self._blurb, copyright=self._copyright)
> > > -    def _bottom(self):
> > > +    def _bottom(self) -> str:
> > >           return mcgen('''
> > >   /* Dummy declaration to prevent empty .o file */
> > > @@ -180,16 +178,16 @@ def _bottom(self):
> > >   class QAPIGenH(QAPIGenC):
> > > -
> > > -    def _top(self):
> > > +    def _top(self) -> str:
> > >           return super()._top() + guardstart(self.fname)
> > > -    def _bottom(self):
> > > +    def _bottom(self) -> str:
> > >           return guardend(self.fname)
> > >   @contextmanager
> > > -def ifcontext(ifcond, *args):
> > > +def ifcontext(ifcond: List[str],
> > > +              *args: QAPIGenCCode) -> Generator[None, None, None]:
> > 
> > IIUC, this could simply be "Iterator[None]" instead of
> > "Generator[None, None, None]".
> > 
> > Anyway,
> > 
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> > 
> 
> Oh, you're right! Let's do that instead.
> 
> Reference:
> https://mypy.readthedocs.io/en/stable/kinds_of_types.html#generators
> 
> Eduardo, I am making this change and keeping your R-B.

Agreed.

-- 
Eduardo


