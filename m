Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACB36A737
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 14:36:14 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ladzh-0003K8-AZ
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 08:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ladxn-0002Tn-Vp
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 08:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ladxl-0007Re-VY
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 08:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619354053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xv/T87vWOilMrqIgbGUca+1JagYpXY6K1C/T7Zgl6OQ=;
 b=Gau24cTzRF8v7haAhh9ZSKyc2Pmc2ZFrXrLrT0/eXOw0vyvjXNxxpIK57tYN06PtP6Femo
 DJolJu03SFmxFVgRO1F9DDugD/Xkl+i/01ut9Vr3ifBL2DOGcynQuU/6GCcFUXugsYT6uB
 Ngx3UdlfTQFWoU7QBJ/K7x8zrxUhE1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-xTZi8munPSSELtGwwJ_kWQ-1; Sun, 25 Apr 2021 08:34:07 -0400
X-MC-Unique: xTZi8munPSSELtGwwJ_kWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E266310053F3;
 Sun, 25 Apr 2021 12:34:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592B619C78;
 Sun, 25 Apr 2021 12:34:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 070FC113525D; Sun, 25 Apr 2021 14:34:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
Date: Sun, 25 Apr 2021 14:34:02 +0200
In-Reply-To: <20210422030720.3685766-13-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:10 -0400")
Message-ID: <87zgxm5yrp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
>
> (Annotations for QAPIDoc are in a later commit.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 61 ++++++++++++++++++++++++++++--------------
>  1 file changed, 41 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index d02a134aae9..f2b57d5642a 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -17,16 +17,29 @@
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
>  from .common import match_nofail
>  from .error import QAPISemError, QAPISourceError
>  from .source import QAPISourceInfo
>  
>  
> +#: Represents a parsed JSON object; semantically: one QAPI schema expression.
> +Expression = Dict[str, object]

I believe you use this for what qapi-code-gen.txt calls a top-level
expression.  TopLevelExpression is rather long, but it's used just once,
and once more in RFC PATCH 13.  What do you think?

> +
> +# Return value alias for get_expr().
> +_ExprValue = Union[List[object], Dict[str, object], str, bool]

This is essentially a node in our pidgin-JSON parser's abstract syntax
tree.  Tree roots use the Dict branch of this Union.

See also my review of PATCH 06.

> +
> +
>  class QAPIParseError(QAPISourceError):
>      """Error class for all QAPI schema parsing errors."""
> -    def __init__(self, parser, msg):
> +    def __init__(self, parser: 'QAPISchemaParser', msg: str):

Forward reference needs quotes.  Can't be helped.

>          col = 1
>          for ch in parser.src[parser.line_pos:parser.pos]:
>              if ch == '\t':
> @@ -38,7 +51,10 @@ def __init__(self, parser, msg):
>  
>  class QAPISchemaParser:
>  
> -    def __init__(self, fname, previously_included=None, incl_info=None):
> +    def __init__(self,
> +                 fname: str,
> +                 previously_included: Optional[Set[str]] = None,

This needs to be Optional[] because using the empty set as default
parameter value would be a dangerous trap.  Python's choice to evaluate
the default parameter value just once has always been iffy.  Stirring
static typing into the language makes it iffier.  Can't be helped.

> +                 incl_info: Optional[QAPISourceInfo] = None):
>          self._fname = fname
>          self._included = previously_included or set()
>          self._included.add(os.path.abspath(self._fname))
> @@ -46,20 +62,20 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>  
>          # Lexer state (see `accept` for details):
>          self.info = QAPISourceInfo(self._fname, incl_info)
> -        self.tok = None
> +        self.tok: Optional[str] = None

Would

           self.tok: str

work?

>          self.pos = 0
>          self.cursor = 0
> -        self.val = None
> +        self.val: Optional[Union[bool, str]] = None
>          self.line_pos = 0
>  
>          # Parser output:
> -        self.exprs = []
> -        self.docs = []
> +        self.exprs: List[Expression] = []
> +        self.docs: List[QAPIDoc] = []
>  
>          # Showtime!
>          self._parse()
>  
> -    def _parse(self):
> +    def _parse(self) -> None:
>          cur_doc = None
>  
>          with open(self._fname, 'r', encoding='utf-8') as fp:
> @@ -122,7 +138,7 @@ def _parse(self):
>          self.reject_expr_doc(cur_doc)
>  
>      @staticmethod
> -    def reject_expr_doc(doc):
> +    def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
>          if doc and doc.symbol:
>              raise QAPISemError(
>                  doc.info,
> @@ -130,10 +146,14 @@ def reject_expr_doc(doc):
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
> @@ -152,9 +172,9 @@ def _include(include, info, incl_fname, previously_included):
>              ) from err
>  
>      @staticmethod
> -    def _pragma(name, value, info):
> +    def _pragma(name: str, value: object, info: QAPISourceInfo) -> None:

value: object isn't wrong, but why not _ExprValue?

>  
> -        def _check(name, value) -> List[str]:
> +        def _check(name: str, value: object) -> List[str]:
>              if (not isinstance(value, list) or
>                      any([not isinstance(elt, str) for elt in value])):
>                  raise QAPISemError(
> @@ -176,7 +196,7 @@ def _check(name, value) -> List[str]:
>          else:
>              raise QAPISemError(info, "unknown pragma '%s'" % name)
>  
> -    def accept(self, skip_comment=True):
> +    def accept(self, skip_comment: bool = True) -> None:
>          while True:
>              self.tok = self.src[self.cursor]
>              self.pos = self.cursor
> @@ -240,8 +260,8 @@ def accept(self, skip_comment=True):
>                                       self.src[self.cursor-1:])
>                  raise QAPIParseError(self, "stray '%s'" % match.group(0))
>  
> -    def get_members(self):
> -        expr = OrderedDict()
> +    def get_members(self) -> 'OrderedDict[str, object]':
> +        expr: 'OrderedDict[str, object]' = OrderedDict()
>          if self.tok == '}':
>              self.accept()
>              return expr
> @@ -267,8 +287,8 @@ def get_members(self):
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
> @@ -284,8 +304,9 @@ def get_values(self):
>                  raise QAPIParseError(self, "expected ',' or ']'")
>              self.accept()
>  
> -    def get_expr(self, nested):
> +    def get_expr(self, nested: bool = False) -> _ExprValue:
>          # TODO: Teach mypy that nested=False means the retval is a Dict.
> +        expr: _ExprValue
>          if self.tok != '{' and not nested:
>              raise QAPIParseError(self, "expected '{'")
>          if self.tok == '{':
> @@ -303,7 +324,7 @@ def get_expr(self, nested):
>                  self, "expected '{', '[', string, or boolean")
>          return expr
>  
> -    def get_doc(self, info):
> +    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
>          if self.val != '##':
>              raise QAPIParseError(
>                  self, "junk after '##' at start of documentation comment")


