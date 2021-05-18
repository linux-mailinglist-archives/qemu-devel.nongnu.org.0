Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CCB38786B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:04:50 +0200 (CEST)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liySv-0002xz-OS
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liyPx-00007r-7X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liyPq-0007S4-Eb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621339293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdwATh2arMslXz8SuQFC7AOW6en+MDqMFTUs183wd04=;
 b=H7pAH541pgTZk98+QyPX5kiVIUbn3QMAqiQKhKTnLrp5TaK5qYnMzScSHBUgtkLqOigBFM
 vJsxOGUquXHHFqRQ6hc8k0fkDQiQrFELOCl82M8eKYL3homCm8Kkk1NqswbQxPO5XgMEaf
 w2M2ujyqHsNP2wQrVWym9AuzqDum+Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-2RCivpRBMu6feqUoSucELA-1; Tue, 18 May 2021 08:01:27 -0400
X-MC-Unique: 2RCivpRBMu6feqUoSucELA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC668042C8;
 Tue, 18 May 2021 12:01:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 929D960CCB;
 Tue, 18 May 2021 12:01:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13009113861E; Tue, 18 May 2021 14:01:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 12/21] qapi/parser: add type hint annotations
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-13-jsnow@redhat.com>
Date: Tue, 18 May 2021 14:01:24 +0200
In-Reply-To: <20210511220601.2110055-13-jsnow@redhat.com> (John Snow's message
 of "Tue, 11 May 2021 18:05:52 -0400")
Message-ID: <87r1i445ez.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
>
> (Annotations for QAPIDoc are in a forthcoming commit.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 58 +++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 336959cbbb1..631863bac14 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -17,16 +17,26 @@
>  from collections import OrderedDict
>  import os
>  import re
> -from typing import List
> +from typing import (
> +    Dict,
> +    List,
> +    Optional,
> +    Set,
> +    Union,
> +)
>  
>  from .common import must_match
>  from .error import QAPISemError, QAPISourceError
>  from .source import QAPISourceInfo
>  
>  
> +# Return value alias for get_expr().
> +_ExprValue = Union[List[object], Dict[str, object], str, bool]
> +
> +
>  class QAPIParseError(QAPISourceError):
>      """Error class for all QAPI schema parsing errors."""
> -    def __init__(self, parser, msg):
> +    def __init__(self, parser: 'QAPISchemaParser', msg: str):
>          col = 1
>          for ch in parser.src[parser.line_pos:parser.pos]:
>              if ch == '\t':
> @@ -38,7 +48,10 @@ def __init__(self, parser, msg):
>  
>  class QAPISchemaParser:
>  
> -    def __init__(self, fname, previously_included=None, incl_info=None):
> +    def __init__(self,
> +                 fname: str,
> +                 previously_included: Optional[Set[str]] = None,

We talked about the somewhat unnatural use of None for the empty set,
and ways to avoid it.  I agree with simply typing what we have.

> +                 incl_info: Optional[QAPISourceInfo] = None):
>          self._fname = fname
>          self._included = previously_included or set()
>          self._included.add(os.path.abspath(self._fname))
> @@ -46,20 +59,20 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>  
>          # Lexer state (see `accept` for details):
>          self.info = QAPISourceInfo(self._fname, incl_info)
> -        self.tok = None
> +        self.tok: Union[None, str] = None
>          self.pos = 0
>          self.cursor = 0
> -        self.val = None
> +        self.val: Optional[Union[bool, str]] = None
>          self.line_pos = 0
>  
>          # Parser output:
> -        self.exprs = []
> -        self.docs = []
> +        self.exprs: List[Dict[str, object]] = []
> +        self.docs: List[QAPIDoc] = []
>  
>          # Showtime!
>          self._parse()
>  
> -    def _parse(self):
> +    def _parse(self) -> None:
>          cur_doc = None
>  
>          # May raise OSError; allow the caller to handle it.
> @@ -125,7 +138,7 @@ def _parse(self):
>          self.reject_expr_doc(cur_doc)
>  
>      @staticmethod
> -    def reject_expr_doc(doc):
> +    def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
>          if doc and doc.symbol:
>              raise QAPISemError(
>                  doc.info,
> @@ -133,10 +146,14 @@ def reject_expr_doc(doc):
>                  % doc.symbol)
>  
>      @staticmethod
> -    def _include(include, info, incl_fname, previously_included):
> +    def _include(include: str,
> +                 info: QAPISourceInfo,
> +                 incl_fname: str,
> +                 previously_included: Set[str]
> +                 ) -> Optional['QAPISchemaParser']:
>          incl_abs_fname = os.path.abspath(incl_fname)
>          # catch inclusion cycle
> -        inf = info
> +        inf: Optional[QAPISourceInfo] = info
>          while inf:
>              if incl_abs_fname == os.path.abspath(inf.fname):
>                  raise QAPISemError(info, "inclusion loop for %s" % include)
> @@ -155,9 +172,9 @@ def _include(include, info, incl_fname, previously_included):
>              ) from err
>  
>      @staticmethod
> -    def _pragma(name, value, info):
> +    def _pragma(name: str, value: object, info: QAPISourceInfo) -> None:
>  
> -        def check_list_str(name, value) -> List[str]:
> +        def check_list_str(name: str, value: object) -> List[str]:
>              if (not isinstance(value, list) or
>                      any([not isinstance(elt, str) for elt in value])):
>                  raise QAPISemError(
> @@ -181,7 +198,7 @@ def check_list_str(name, value) -> List[str]:
>          else:
>              raise QAPISemError(info, "unknown pragma '%s'" % name)
>  
> -    def accept(self, skip_comment=True):
> +    def accept(self, skip_comment: bool = True) -> None:
>          while True:
>              self.tok = self.src[self.cursor]
>              self.pos = self.cursor
> @@ -245,8 +262,8 @@ def accept(self, skip_comment=True):
>                                     self.src[self.cursor-1:])
>                  raise QAPIParseError(self, "stray '%s'" % match.group(0))
>  
> -    def get_members(self):
> -        expr = OrderedDict()
> +    def get_members(self) -> Dict[str, object]:
> +        expr: Dict[str, object] = OrderedDict()

I wish we didn't have to repeat the type in

    variable: type_of_thing = constructor_of_thing

So clumsy.  Using the constructor of a subtype doesn't exactly help.  Oh
well, that part should go away when we drop OrderedDict.

>          if self.tok == '}':
>              self.accept()
>              return expr
> @@ -272,8 +289,8 @@ def get_members(self):
>              if self.tok != "'":
>                  raise QAPIParseError(self, "expected string")
>  
> -    def get_values(self):
> -        expr = []
> +    def get_values(self) -> List[object]:
> +        expr: List[object] = []
>          if self.tok == ']':
>              self.accept()
>              return expr
> @@ -289,7 +306,8 @@ def get_values(self):
>                  raise QAPIParseError(self, "expected ',' or ']'")
>              self.accept()
>  
> -    def get_expr(self):
> +    def get_expr(self) -> _ExprValue:
> +        expr: _ExprValue
>          if self.tok == '{':
>              self.accept()
>              expr = self.get_members()
> @@ -305,7 +323,7 @@ def get_expr(self):
>                  self, "expected '{', '[', string, or boolean")
>          return expr
>  
> -    def get_doc(self, info):
> +    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
>          if self.val != '##':
>              raise QAPIParseError(
>                  self, "junk after '##' at start of documentation comment")


