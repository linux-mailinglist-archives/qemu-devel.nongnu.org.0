Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65336A77E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 15:29:03 +0200 (CEST)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laeoo-0001YF-AO
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 09:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laenv-00018E-Ih
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 09:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laenr-0005n1-Pt
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 09:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619357282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RhXsUmOaCKUfUDuXxytZCN6vxAg9JWa6Bi/B3KGbyZM=;
 b=XWV3JLfWDZdPhSpJ8hzeflc0PjHDOFbccy92Ef5l4Ww4nqfOO8xXGQRmaGtBtHTIsKczxv
 CFBtD+5aQxqdJmmik7xsmn+6NhmVOusENX+FxSCrjsmi2G6ES4wP7AoibFbyHqeVm9Wpf6
 WgO4X7emflUkdP5jGPWpR5MWyp8CH1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-AeVeWnw5NN-BpbKXt9OTdA-1; Sun, 25 Apr 2021 09:27:57 -0400
X-MC-Unique: AeVeWnw5NN-BpbKXt9OTdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9420587A826;
 Sun, 25 Apr 2021 13:27:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0916062F;
 Sun, 25 Apr 2021 13:27:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80BB3113525D; Sun, 25 Apr 2021 15:27:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 16/22] qapi/parser: add docstrings
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-17-jsnow@redhat.com>
Date: Sun, 25 Apr 2021 15:27:54 +0200
In-Reply-To: <20210422030720.3685766-17-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:14 -0400")
Message-ID: <877dkq5w9x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> My hubris is infinite.

Score one of the three principal virtues of a programmer ;)

> OK, I only added a few -- to help me remember how the parser works at a glance.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 66 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index dbbd0fcbc2f..8fc77808ace 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -51,7 +51,24 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
>  
>  
>  class QAPISchemaParser:
> +    """
> +    Performs parsing of a QAPI schema source file.

Actually, this parses one of two layers, see qapi-code-gen.txt section
"Schema syntax".  Pointing there might help.

>  
> +    :param fname: Path to the source file

Either "Source file name" or "Source pathname", please.  I prefer "file
name" for additional distance to "path" in the sense of a search path,
i.e. a list of directory names.

> +    :param previously_included:
> +        The absolute paths of previously included source files.

Either "absolute file name" or "absulute pathname".

> +        Only used by recursive calls to avoid re-parsing files.

Feels like detail, not sure it's needed here.

> +    :param incl_info:
> +       `QAPISourceInfo` for the parent document.
> +       This may be None if this is the root schema document.

Recommend s/This maybe //.

qapi-code-gen.txt calls a QAPI schema that uses include directives
"modular", and the included files "sub-modules".  s/root schema
document/root module/?

> +
> +    :ivar exprs: Resulting parsed expressions.
> +    :ivar docs: Resulting parsed documentation blocks.

Uh, why are these here?  A doc string is interface documentation...

> +
> +    :raise OSError: For problems opening the root schema document.
> +    :raise QAPIParseError: For JSON or QAPIDoc syntax problems.
> +    :raise QAPISemError: For various semantic issues with the schema.

Should callers care for the difference between QAPIParseError and
QAPISemError?

> +    """
>      def __init__(self,
>                   fname: str,
>                   previously_included: Optional[Set[str]] = None,
> @@ -77,6 +94,11 @@ def __init__(self,
>          self._parse()
>  
>      def _parse(self) -> None:
> +        """
> +        Parse the QAPI schema document.
> +
> +        :return: None; results are stored in ``exprs`` and ``docs``.

Another ignorant doc string markup question...  how am I supposed to see
that exprs and docs are attributes, and not global variables?

> +        """
>          cur_doc = None
>  
>          with open(self._fname, 'r', encoding='utf-8') as fp:
> @@ -197,6 +219,50 @@ def _check(name: str, value: object) -> List[str]:
>              raise QAPISemError(info, "unknown pragma '%s'" % name)
>  
>      def accept(self, skip_comment: bool = True) -> None:
> +        """
> +        Read the next lexeme and process it into a token.
> +
> +        :Object state:
> +          :tok: represents the token type. See below for values.
> +          :pos: is the position of the first character in the lexeme.
> +          :cursor: is the position of the next character.

Define "position" :)  It's an index in self.src.

self.cursor and self.pos are not used outside accept().  Not sure thet
belong into interface documentation.

> +          :val: is the variable value of the token, if any.

Missing: self.info, which *is* used outside accept().

> +
> +        Single-character tokens:
> +
> +        These include ``LBRACE``, ``RBRACE``, ``COLON``, ``COMMA``,
> +        ``LSQB``, and ``RSQB``.

"These include ..." is misleading.  This is the complete list of
single-character tokens.

> +        ``LSQB``, and ``RSQB``.  ``tok`` holds the single character
> +        lexeme.  ``val`` is ``None``.
> +
> +        Multi-character tokens:
> +
> +        - ``COMMENT``:
> +
> +          - This token is not normally yielded by the lexer, but it
> +            can be when ``skip_comment`` is False.
> +          - ``tok`` is the value ``"#"``.
> +          - ``val`` is a string including all chars until end-of-line.
> +
> +        - ``STRING``:
> +
> +          - ``tok`` is the ``"'"``, the single quote.
> +          - ``value`` is the string, *excluding* the quotes.
> +
> +        - ``TRUE`` and ``FALSE``:
> +
> +          - ``tok`` is either ``"t"`` or ``"f"`` accordingly.
> +          - ``val`` is either ``True`` or ``False`` accordingly.
> +
> +        - ``NEWLINE`` and ``SPACE``:
> +
> +          - These are consumed by the lexer directly. ``line_pos`` and
> +            ``info`` are advanced when ``NEWLINE`` is encountered.
> +            ``tok`` is set to ``None`` upon reaching EOF.
> +
> +        :param skip_comment:
> +            When false, return ``COMMENT`` tokens.
> +            This is used when reading documentation blocks.

The doc string mostly describes possible state on return of accept().
*Within* accept(), self.tok may be any character.

"Mostly" because item ``NEWLINE`` and ``SPACE`` is about something that
happens within accept().

Perhaps phrasing it as a postcondition would be clearer:

    Read and store the next token.

    On return, self.tok is the token type, self.info is describes its
    source location, and self.value is the token's value.

    The possible token types and their values are

    ...

> +        """
>          while True:
>              self.tok = self.src[self.cursor]
>              self.pos = self.cursor


