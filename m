Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456C2DBCC2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:36:44 +0100 (CET)
Received: from localhost ([::1]:33988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSId-0004LX-50
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpSHB-0003pN-Bz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpSH9-0003oY-0y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608107709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8kPtu2hayAVC9sRzQdJq0ur2W3fCJHms7Fqf9AihJQ=;
 b=D6P/18nbh7z3U+SCGZUVW6A0HLGpkBd06wtHC8Cq3S8tX0LAoGGAvc2vV4QO1w0QNcpvs4
 Qfvbm0mfdAEdOfVOHdz2zvXVpX8tBXTZe3UmDMk2Mb7teAOrDVYWFqJTsiRjJ3IYqLFCjB
 SyBdQAaySbWFOjJyUYneY86w9ladvrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-_fsu0eovPcivu38vmuQsvA-1; Wed, 16 Dec 2020 03:35:07 -0500
X-MC-Unique: _fsu0eovPcivu38vmuQsvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8AF107ACE6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:35:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0175C67A;
 Wed, 16 Dec 2020 08:35:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 371A111329A5; Wed, 16 Dec 2020 09:35:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/12] qapi/gen: use './builtin' for the built-in module
 name
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-6-jsnow@redhat.com>
Date: Wed, 16 Dec 2020 09:35:01 +0100
In-Reply-To: <20201214235327.1007124-6-jsnow@redhat.com> (John Snow's message
 of "Mon, 14 Dec 2020 18:53:20 -0500")
Message-ID: <873606tah6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Use this in preference to 'None', which helps remove some edge cases in
> the typing.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Clearly better.  Should've done it this way in commit c2e196a9b4 "qapi:
Prepare for system modules other than 'builtin'".

> ---
>  scripts/qapi/gen.py | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index a6dc991b1d03..0c5d1fee6088 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -245,23 +245,23 @@ def __init__(self,
>          self._pydoc = pydoc
>          self._genc: Optional[QAPIGenC] = None
>          self._genh: Optional[QAPIGenH] = None
> -        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
>          self._main_module: Optional[str] = None
>  
>      @staticmethod
> -    def _is_user_module(name: Optional[str]) -> bool:
> -        return bool(name and not name.startswith('./'))
> +    def _is_user_module(name: str) -> bool:
> +        return not name.startswith('./')
>  
>      @staticmethod
> -    def _is_builtin_module(name: Optional[str]) -> bool:
> -        return not name
> +    def _is_builtin_module(name: str) -> bool:
> +        return name == './builtin'
>  
> -    def _module_dirname(self, name: Optional[str]) -> str:
> +    def _module_dirname(self, name: str) -> str:
>          if self._is_user_module(name):
>              return os.path.dirname(name)
>          return ''
>  
> -    def _module_basename(self, what: str, name: Optional[str]) -> str:
> +    def _module_basename(self, what: str, name: str) -> str:
>          ret = '' if self._is_builtin_module(name) else self._prefix
>          if self._is_user_module(name):
>              basename = os.path.basename(name)
> @@ -269,15 +269,14 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
>              if name != self._main_module:
>                  ret += '-' + os.path.splitext(basename)[0]
>          else:

Possible drive-by improvement:

               assert name.startswith('./')

> -            name = name[2:] if name else 'builtin'
> -            ret += re.sub(r'-', '-' + name + '-', what)
> +            ret += re.sub(r'-', '-' + name[2:] + '-', what)
>          return ret
>  
> -    def _module_filename(self, what: str, name: Optional[str]) -> str:
> +    def _module_filename(self, what: str, name: str) -> str:
>          return os.path.join(self._module_dirname(name),
>                              self._module_basename(what, name))
>  
> -    def _add_module(self, name: Optional[str], blurb: str) -> None:
> +    def _add_module(self, name: str, blurb: str) -> None:
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
> @@ -290,8 +289,8 @@ def _add_user_module(self, name: str, blurb: str) -> None:
>              self._main_module = name
>          self._add_module(name, blurb)
>  
> -    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
> -        self._add_module(name and './' + name, blurb)
> +    def _add_system_module(self, name: str, blurb: str) -> None:
> +        self._add_module(f"./{name}", blurb)

I like f-strings, I really do, but is

    f"./{name}"

really clearer than

    './' + name

?

>  
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>          for name in self._module:
> @@ -310,7 +309,7 @@ def _begin_user_module(self, name: str) -> None:
>      def visit_module(self, name: Optional[str]) -> None:
>          if name is None:
>              if self._builtin_blurb:
> -                self._add_system_module(None, self._builtin_blurb)
> +                self._add_system_module('builtin', self._builtin_blurb)
>                  self._begin_system_module(name)
>              else:
>                  # The built-in module has not been created.  No code may


