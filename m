Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BB3887BB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:43:47 +0200 (CEST)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFvm-0008MC-ST
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljFti-00075L-Bs
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljFte-0007GM-QY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621406488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzbVRdWVautZ+7DDsRU1whaGsM2BfPYkh0EzndyRr7w=;
 b=NdqBUTIr06IM51m0wjvLLwvrEzMaWxn9vGqPRLd/mHfR3MPxZmcf7G5AQ24y8ROgRO6VvJ
 1nCVtFIM+zjG8DBsjbjMkM7+JHlFqOJ6ab4L5rHCQBOqVpNSVeemh7307KmTz6PCVsdqtW
 BQLnfLP4gd+lhpeXpxhHv2iNm2Ylal0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-bUls9iB-OFmIP7_cY85_tQ-1; Wed, 19 May 2021 02:41:26 -0400
X-MC-Unique: bUls9iB-OFmIP7_cY85_tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87CB564160;
 Wed, 19 May 2021 06:41:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7419610023AB;
 Wed, 19 May 2021 06:41:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F41AC113861E; Wed, 19 May 2021 08:41:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 15/21] qapi/parser: add docstrings
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-16-jsnow@redhat.com>
Date: Wed, 19 May 2021 08:41:22 +0200
In-Reply-To: <20210511220601.2110055-16-jsnow@redhat.com> (John Snow's message
 of "Tue, 11 May 2021 18:05:55 -0400")
Message-ID: <87h7iz1azx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 68 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index e80e0a7d965..ed543a2b7a4 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -47,7 +47,27 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
>  
>  
>  class QAPISchemaParser:
> +    """
> +    Performs syntactic parsing of a QAPI schema source file.

"Syntactic parsing" makes me wonder what non-syntactic parsing could be.

Also, PEP 257 wants imperative mood: "Perform X", not "Performs X".

What about a laconic "Parse QAPI schema source"?

>  
> +    Parses a JSON-esque schema file, See qapi-code-gen.txt section

Imperative mood, please.  Period, not comma.

> +    "Schema Syntax" for more information. Grammatical validation
> +    is handled later by `expr.check_exprs()`.

We could mention the processing of directives.  Perhaps:

       Parse a JSON-esque schema file.  See qapi-code-gen.txt section
       "Schema Syntax" for the exact syntax.  Also process directives.
       Grammatical validation is handled later by `expr.check_exprs()`.

What do you think?

> +
> +    :param fname: Source filename.
> +    :param previously_included:
> +        The absolute pathnames of previously included source files,

Either file name / filename (either spelling, but let's pick one), or
pathname, but not both, please.

Possible resolution:

       :param fname: Source file name.
       :param previously_included:
           The absolute names of previously included source files,

> +        if being invoked from another parser.
> +    :param incl_info:
> +       `QAPISourceInfo` belonging to the parent module.
> +       ``None`` implies this is the root module.
> +
> +    :ivar exprs: Resulting parsed expressions.
> +    :ivar docs: Resulting parsed documentation blocks.
> +
> +    :raise OSError: For problems opening the root schema document.

Hardly matters, but here we go: its both for open() and .read().  We
could say "reading" instead of "opening".

> +    :raise QAPIError: For syntactic or semantic parsing errors.

"Semantic parsing errors" sounds like "triangular squares" :)

I figure you wrote this because we're using both QAPIParseError and
QAPISemError.  The latter gets raised where we do more than just parse,
e.g. in directive processing.  It hardly matters, as we don't really
care for the difference between these error classes anywhere, and
pragmatically use whatever class is convenient.

Perhaps we should have a single class with multiple constructors
instead.  Even if yes, not now.

I recommend to gloss over (irrelevant) details and say "For parse
errors".  Yes, some of the errors aren't parse errors in the theory of
parsing sense, but I doubt readers care.  If *you* care, then maybe "For
errors in the schema source".  And then you might want to tweak the
OSError explanation to "For problems reading the root schema source
file".

> +    """
>      def __init__(self,
>                   fname: str,
>                   previously_included: Optional[Set[str]] = None,
> @@ -73,6 +93,11 @@ def __init__(self,
>          self._parse()
>  
>      def _parse(self) -> None:
> +        """
> +        Parse the QAPI schema document.
> +
> +        :return: None. Results are stored in ``.exprs`` and ``.docs``.
> +        """
>          cur_doc = None
>  
>          # May raise OSError; allow the caller to handle it.
> @@ -199,6 +224,49 @@ def check_list_str(name: str, value: object) -> List[str]:
>              raise QAPISemError(info, "unknown pragma '%s'" % name)
>  
>      def accept(self, skip_comment: bool = True) -> None:
> +        """Read and store the next token.
> +
> +        :param skip_comment:
> +            When false, return COMMENT tokens ("#").
> +            This is used when reading documentation blocks.
> +
> +        :return:
> +            None. Several instance attributes are updated instead:
> +
> +            - ``.tok`` represents the token type. See below for values.
> +            - ``.info`` describes the token's source location.
> +            - ``.val`` is the token's value, if any. See below.
> +            - ``.pos`` is the buffer index of the first character of
> +              the token.
> +
> +        * Single-character tokens:
> +
> +            These are "{", "}", ":", ",", "[", and "]". ``.tok`` holds
> +            the single character and ``.val`` is None.
> +
> +        * Multi-character tokens:
> +
> +          * COMMENT:
> +
> +            This token is not normally returned by the lexer, but it can
> +            be when ``skip_comment`` is False. ``.tok`` is "#", and
> +            ``.val`` is a string including all chars until end-of-line,
> +            including the "#" itself.
> +
> +          * STRING:
> +
> +            ``.tok`` is "'", the single quote. ``.val`` contains the
> +            string, excluding the surrounding quotes.
> +
> +          * TRUE and FALSE:
> +
> +            ``.tok`` is either "t" or "f", ``.val`` will be the
> +            corresponding bool value.
> +
> +          * EOF:
> +
> +            ``.tok`` and ``.val`` will both be None at EOF.
> +        """
>          while True:
>              self.tok = self.src[self.cursor]
>              self.pos = self.cursor

This doc string is much better now, thanks!


