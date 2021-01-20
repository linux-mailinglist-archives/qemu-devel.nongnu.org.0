Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79502FD233
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:16:30 +0100 (CET)
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EHe-0004s7-1W
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2EG9-0004Bs-EB
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2EG6-0002Fw-Ii
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611152093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MT5S1VdEX3MsOdqgWDoub95AnQjbrDQ4naGuJEVE1DI=;
 b=C+QpKWC2darOmOvscYs6mhKPrJs8460nEhPvrK8HvdDasnxZoNSM3PuxjzE6Jmlhw0AFjf
 AomEZqP8s5oRaKWCMReKVyPbTOcTuIp/rqwh59fF9Q352dIBre7+IRsrruoNZghRGoMoii
 GiVyf/E62hr1mHwvlP0JlyaUpp5NTlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-5f5qrFzZO2OnUet8dFgIog-1; Wed, 20 Jan 2021 09:14:50 -0500
X-MC-Unique: 5f5qrFzZO2OnUet8dFgIog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F394A1015EC7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 14:14:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A1960C7C;
 Wed, 20 Jan 2021 14:14:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C7A4113865F; Wed, 20 Jan 2021 15:14:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/17] qapi: use './builtin' as the built-in module name
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-10-jsnow@redhat.com>
Date: Wed, 20 Jan 2021 15:14:43 +0100
In-Reply-To: <20210119180242.1570753-10-jsnow@redhat.com> (John Snow's message
 of "Tue, 19 Jan 2021 13:02:34 -0500")
Message-ID: <877do7r8z0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Use './builtin' as the built-in module name instead of
> None. Clarify the typing that this is now always a string.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/gen.py                      | 18 +++++++++---------
>  scripts/qapi/schema.py                   | 14 +++++++-------
>  tests/qapi-schema/comments.out           |  2 +-
>  tests/qapi-schema/doc-good.out           |  2 +-
>  tests/qapi-schema/empty.out              |  2 +-
>  tests/qapi-schema/event-case.out         |  2 +-
>  tests/qapi-schema/include-repetition.out |  2 +-
>  tests/qapi-schema/include-simple.out     |  2 +-
>  tests/qapi-schema/indented-expr.out      |  2 +-
>  tests/qapi-schema/qapi-schema-test.out   |  2 +-
>  10 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 18b72dd06c8..55acd7e080d 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -246,16 +246,16 @@ def __init__(self,
>          self._pydoc = pydoc
>          self._genc: Optional[QAPIGenC] = None
>          self._genh: Optional[QAPIGenH] = None
> -        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
>          self._main_module: Optional[str] = None
>  
>      @staticmethod
> -    def _module_dirname(name: Optional[str]) -> str:
> +    def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
>              return os.path.dirname(name)
>          return ''
>  
> -    def _module_basename(self, what: str, name: Optional[str]) -> str:
> +    def _module_basename(self, what: str, name: str) -> str:
>          ret = '' if QAPISchemaModule.is_builtin_module(name) else self._prefix
>          if QAPISchemaModule.is_user_module(name):
>              basename = os.path.basename(name)
> @@ -263,15 +263,15 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
>              if name != self._main_module:
>                  ret += '-' + os.path.splitext(basename)[0]
>          else:
> -            name = name[2:] if name else 'builtin'
> -            ret += re.sub(r'-', '-' + name + '-', what)
> +            assert QAPISchemaModule.is_system_module(name)
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
> @@ -284,7 +284,7 @@ def _add_user_module(self, name: str, blurb: str) -> None:
>              self._main_module = name
>          self._add_module(name, blurb)
>  
> -    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
> +    def _add_system_module(self, name: str, blurb: str) -> None:
>          assert QAPISchemaModule.is_system_module(name)
>          self._add_module(name, blurb)
>  
> @@ -305,7 +305,7 @@ def _begin_user_module(self, name: str) -> None:
>      def visit_module(self, module: QAPISchemaModule) -> None:
>          if module.system_module:
>              if self._builtin_blurb:
> -                self._add_system_module(None, self._builtin_blurb)
> +                self._add_system_module(module.name, self._builtin_blurb)
>                  self._begin_builtin_module()
>              else:
>                  # The built-in module has not been created.  No code may
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 44a9232c881..c519c18a5ec 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -68,7 +68,8 @@ def check_doc(self):
>  
>      def _set_module(self, schema, info):
>          assert self._checked
> -        self._module = schema.module_by_fname(info and info.fname)
> +        fname = info.fname if info else './builtin'
> +        self._module = schema.module_by_fname(fname)
>          self._module.add_entity(self)
>  
>      def set_module(self, schema):
> @@ -142,11 +143,11 @@ def __init__(self, name):
>          self._entity_list = []
>  
>      @classmethod
> -    def is_system_module(cls, name: Optional[str]) -> bool:
> -        return name is None or name.startswith('./')
> +    def is_system_module(cls, name: str) -> bool:
> +        return name.startswith('./')
>  
>      @classmethod
> -    def is_user_module(cls, name: Optional[str]) -> bool:
> +    def is_user_module(cls, name: str) -> bool:
>          return not cls.is_system_module(name)
>  
>      @classmethod
> @@ -849,7 +850,7 @@ def __init__(self, fname):
>          self._entity_dict = {}
>          self._module_dict = OrderedDict()
>          self._schema_dir = os.path.dirname(fname)
> -        self._make_module(None)  # built-ins
> +        self._make_module('./builtin')  # built-ins

The comment it now redundant.

>          self._make_module(fname)
>          self._predefining = True
>          self._def_predefineds()
> @@ -894,7 +895,7 @@ def resolve_type(self, name, info, what):
>                  info, "%s uses unknown type '%s'" % (what, name))
>          return typ
>  
> -    def _module_name(self, fname):
> +    def _module_name(self, fname: str) -> str:
>          if QAPISchemaModule.is_system_module(fname):
>              return fname
>          return os.path.relpath(fname, self._schema_dir)
> @@ -907,7 +908,6 @@ def _make_module(self, fname):
>  
>      def module_by_fname(self, fname):
>          name = self._module_name(fname)
> -        assert name in self._module_dict
>          return self._module_dict[name]
>  
>      def _def_include(self, expr, info, doc):
[...]


