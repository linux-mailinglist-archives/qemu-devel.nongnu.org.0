Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03026DE51
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:34:19 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIuzK-0004Eh-Gj
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIuxJ-0002Ur-9W
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:32:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIuxF-0005A2-Lf
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600353127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JByCGZrAVSc/1XZwqtkN/v0E1HhuCLk0NQxf4AOXc9c=;
 b=IotHSEPhDdobRW1NEb7YPv6JOKB9gcm5oUCjQ3dN4huFkKdHd5F6eOGlLiH4nZkUKuJKAD
 P66PcIj3Wz17FgXloHzBEPEUGnEn++NJlyrmNk2czKXF9UMkU06w763PWopZMdh2LgmUG6
 Yef6cWmTytE52GsLaiprUT0pZXJjA24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-pLwLhjGeMoygx0Zo4c1GhA-1; Thu, 17 Sep 2020 10:32:05 -0400
X-MC-Unique: pLwLhjGeMoygx0Zo4c1GhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3A62802B75;
 Thu, 17 Sep 2020 14:32:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6317473668;
 Thu, 17 Sep 2020 14:32:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8393113864A; Thu, 17 Sep 2020 16:32:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 13/37] qapi/common.py: add notational type hints
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-14-jsnow@redhat.com>
Date: Thu, 17 Sep 2020 16:32:02 +0200
In-Reply-To: <20200915224027.2529813-14-jsnow@redhat.com> (John Snow's message
 of "Tue, 15 Sep 2020 18:40:03 -0400")
Message-ID: <87h7rwpj8d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:47:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Question on the subject line: what makes a type hint notational?

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/common.py | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 4c079755d3..af01348b35 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,6 +12,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> +from typing import Optional, Union, Sequence
>  
>  
>  EATSPACE = '\033EATSPACE.'
> @@ -22,7 +23,7 @@
>  # ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
>  # ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
>  # ENUM24_Name -> ENUM24_NAME
> -def camel_to_upper(value):
> +def camel_to_upper(value: str) -> str:
>      c_fun_str = c_name(value, False)
>      if value.isupper():
>          return c_fun_str
> @@ -41,7 +42,9 @@ def camel_to_upper(value):
>      return new_name.lstrip('_').upper()
>  
>  
> -def c_enum_const(type_name, const_name, prefix=None):
> +def c_enum_const(type_name: str,
> +                 const_name: str,
> +                 prefix: Optional[str] = None) -> str:
>      if prefix is not None:
>          type_name = prefix
>      return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
> @@ -56,7 +59,7 @@ def c_enum_const(type_name, const_name, prefix=None):
>  # into substrings of a generated C function name.
>  # '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
>  # protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
> -def c_name(name, protect=True):
> +def c_name(name: str, protect: bool = True) -> str:
>      # ANSI X3J11/88-090, 3.1.1
>      c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
>                       'default', 'do', 'double', 'else', 'enum', 'extern',
> @@ -134,24 +137,24 @@ def pop(self, amount: int = 4) -> int:
>  
>  # Generate @code with @kwds interpolated.
>  # Obey INDENT level, and strip EATSPACE.
> -def cgen(code, **kwds):
> +def cgen(code: str, **kwds: Union[str, int]) -> str:

Hmm.

The @kwds values can be anything, provided they match the conversion
specifiers in @code:

>      raw = code % kwds

Your type hint adds a restriction that wasn't there before.

Is there a better way?

>      if INDENT:
>          raw, _ = re.subn(r'^(?!(#|$))', str(INDENT), raw, flags=re.MULTILINE)
>      return re.sub(re.escape(EATSPACE) + r' *', '', raw)
>  
>  
> -def mcgen(code, **kwds):
> +def mcgen(code: str, **kwds: Union[str, int]) -> str:

Likewise.

>      if code[0] == '\n':
>          code = code[1:]
>      return cgen(code, **kwds)
>  
>  
> -def c_fname(filename):
> +def c_fname(filename: str) -> str:
>      return re.sub(r'[^A-Za-z0-9_]', '_', filename)
>  
>  
> -def guardstart(name):
> +def guardstart(name: str) -> str:
>      return mcgen('''
>  #ifndef %(name)s
>  #define %(name)s
> @@ -160,7 +163,7 @@ def guardstart(name):
>                   name=c_fname(name).upper())
>  
>  
> -def guardend(name):
> +def guardend(name: str) -> str:
>      return mcgen('''
>  
>  #endif /* %(name)s */
> @@ -168,7 +171,7 @@ def guardend(name):
>                   name=c_fname(name).upper())
>  
>  
> -def gen_if(ifcond):
> +def gen_if(ifcond: Sequence[str]) -> str:
>      ret = ''
>      for ifc in ifcond:
>          ret += mcgen('''
> @@ -177,7 +180,7 @@ def gen_if(ifcond):
>      return ret
>  
>  
> -def gen_endif(ifcond):
> +def gen_endif(ifcond: Sequence[str]) -> str:
>      ret = ''
>      for ifc in reversed(ifcond):
>          ret += mcgen('''
> @@ -186,7 +189,9 @@ def gen_endif(ifcond):
>      return ret
>  
>  
> -def build_params(arg_type, boxed, extra=None):
> +def build_params(arg_type,
> +                 boxed: bool,
> +                 extra: Optional[str] = None) -> str:
>      ret = ''
>      sep = ''
>      if boxed:


