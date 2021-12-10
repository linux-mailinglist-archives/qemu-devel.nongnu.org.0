Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E04707E9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:56:10 +0100 (CET)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvk7t-0003mo-1X
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvk5v-000313-Mn
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvk5h-0001Oy-TR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639158833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYjsASqWzoUljhGTalYhxvGVPsuG4LpeHMEFNn0TObU=;
 b=eTvW0cr6Wc3TWmoX9VufQdMyBAhJ1KqTMAcvuB84LcwDHTjFy1b5X0s93jy7sojJOn8NNH
 E4VipCV/u6n4iKLlVdtku9fhvz9OWuCOr/gVWKz5X5phxIqXX20vDgcditkPkC/CcWrqEY
 iF6FdizER1KHi/T5OHYYTDslf4JYpVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-PTOCQUcNNg2-pe9acK5S1Q-1; Fri, 10 Dec 2021 12:53:51 -0500
X-MC-Unique: PTOCQUcNNg2-pe9acK5S1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03BA18C8C02
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 17:53:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A19022DFE;
 Fri, 10 Dec 2021 17:53:49 +0000 (UTC)
Date: Fri, 10 Dec 2021 18:53:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 07/12] qapi: Allow defining QOM classes
Message-ID: <YbOUKw1GhRn5mVuT@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-8-kwolf@redhat.com>
 <871r379oku.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871r379oku.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.2021 um 11:02 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  scripts/qapi/expr.py   | 28 +++++++++++++++++-
> >  scripts/qapi/schema.py | 66 ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 93 insertions(+), 1 deletion(-)
> 
> Missing: docs/devel/qapi-code-gen.rst update.  I understand why, but it
> does make review harder.
> 
> >
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 3cb389e875..77550629f3 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -181,6 +181,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
> >      """
> >      if meta == 'event':
> >          check_name_upper(name, info, meta)
> > +    elif meta == 'class':
> > +        check_name_str(name, info, meta)
> 
> This permits arbitrary QAPI names.  I figure we'll want to define and
> enforce a suitable naming convention.

It's the QOM type name. So if you want to enforce something stricter, it
needs to be defined for QOM first. I seem to remember that arbitrary
QAPI names is already stricter than arbitrary QOM names, but I was
hoping that it is close enough to what QOM classes actually use in
practice. I fully expect to have a list of exceptions at some point when
converting devices.

> >      elif meta == 'command':
> >          check_name_lower(
> >              name, info, meta,
> > @@ -557,6 +559,24 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
> >          check_type(value['type'], info, source)
> >  
> >  
> > +def check_class(expr: _JSONObject, info: QAPISourceInfo) -> None:
> > +    """
> > +    Normalize and validate this expression as a ``class`` definition.
> > +
> > +    :param expr: The expression to validate.
> > +    :param info: QAPI schema source file information.
> > +
> > +    :raise QAPISemError: When ``expr`` is not a valid ``class``.
> > +    :return: None, ``expr`` is normalized in-place as needed.
> > +    """
> > +    config = expr.get('config')
> > +    config_boxed = expr.get('config-boxed', False)
> > +
> > +    if config_boxed and config is None:
> > +        raise QAPISemError(info, "'boxed': true requires 'config'")
> 
> You check 'config-boxed', but the error message talks about 'boxed'.
> 
> > +    check_type(config, info, "'config'", allow_dict=not config_boxed)
> > +
> > +
> >  def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
> >      """
> >      Normalize and validate this expression as a ``command`` definition.
> > @@ -627,7 +647,7 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> >              continue
> >  
> >          metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
> > -                               'command', 'event'}
> > +                               'class', 'command', 'event'}
> >          if len(metas) != 1:
> >              raise QAPISemError(
> >                  info,
> > @@ -671,6 +691,12 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> >                         ['struct', 'data'], ['base', 'if', 'features'])
> >              normalize_members(expr['data'])
> >              check_struct(expr, info)
> > +        elif meta == 'class':
> > +            check_keys(expr, info, meta,
> > +                       ['class'], ['if', 'features', 'parent', 'config',
> > +                        'config-boxed'])
> > +            normalize_members(expr.get('config'))
> > +            check_class(expr, info)
> >          elif meta == 'command':
> >              check_keys(expr, info, meta,
> >                         ['command'],
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index b7b3fc0ce4..ebf69341d7 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -155,6 +155,9 @@ def visit_object_type_flat(self, name, info, ifcond, features,
> >      def visit_alternate_type(self, name, info, ifcond, features, variants):
> >          pass
> >  
> > +    def visit_class(self, entity):
> > +        pass
> > +
> >      def visit_command(self, name, info, ifcond, features,
> >                        arg_type, ret_type, gen, success_response, boxed,
> >                        allow_oob, allow_preconfig, coroutine):
> > @@ -766,6 +769,50 @@ def __init__(self, name, info, typ, ifcond=None):
> >          super().__init__(name, info, typ, False, ifcond)
> >  
> >  
> > +class QAPISchemaClass(QAPISchemaEntity):
> > +    meta = 'class'
> > +
> > +    def __init__(self, name, info, doc, ifcond, features, parent,
> > +                 config_type, config_boxed):
> > +        super().__init__(name, info, doc, ifcond, features)
> > +
> > +        assert not parent or isinstance(parent, str)
> 
> I can't see what ensures this.

Indeed, check_class() fails to check this. You agree that it is the
place where it should be checked?

> > +        assert not config_type or isinstance(config_type, str)
> > +        self._parent_name = parent
> > +        self.parent = None
> > +        self._config_type_name = config_type
> > +        self.config_type = None
> > +        self.config_boxed = config_boxed
> > +
> > +    def check(self, schema):
> > +        super().check(schema)
> > +
> > +        if self._parent_name:
> > +            self.parent = schema.lookup_entity(self._parent_name,
> > +                                               QAPISchemaClass)
> > +            if not self.parent:
> > +                raise QAPISemError(
> > +                    self.info,
> > +                    "Unknown parent class '%s'" % self._parent_name)
> > +
> > +        if self._config_type_name:
> > +            self.config_type = schema.resolve_type(
> > +                self._config_type_name, self.info, "class 'config'")
> 
> "class's 'config'" for consistency with other uses of .resolve_type().
> 
> > +            if not isinstance(self.config_type, QAPISchemaObjectType):
> > +                raise QAPISemError(
> > +                    self.info,
> > +                    "class 'config' cannot take %s"
> > +                    % self.config_type.describe())
> > +            if self.config_type.variants and not self.boxed:
> 
> self.config_boxed?
> 
> > +                raise QAPISemError(
> > +                    self.info,
> > +                    "class 'config' can take %s only with 'boxed': true"
> 
> 'config-boxed'?

Yes, I renamed it and of course forgot some instances. Can't wait for
the patches that would make mypy catch at least 'self.boxed'.

> > +                    % self.config_type.describe())
> > +
> > +    def visit(self, visitor):
> > +        super().visit(visitor)
> > +        visitor.visit_class(self)
> > +
> >  class QAPISchemaCommand(QAPISchemaEntity):
> >      meta = 'command'
> >  
> > @@ -1110,6 +1157,23 @@ def _def_alternate_type(self, expr, info, doc):
> >                                      QAPISchemaVariants(
> >                                          None, info, tag_member, variants)))
> >  
> > +    def _def_class(self, expr, info, doc):
> > +        name = expr['class']
> > +        ifcond = QAPISchemaIfCond(expr.get('if'))
> > +        features = self._make_features(expr.get('features'), info)
> > +        parent = expr.get('parent')
> > +        config_type = expr.get('config')
> > +        config_boxed = expr.get('config-boxed')
> > +
> > +        if isinstance(config_type, OrderedDict):
> > +            config_type = self._make_implicit_object_type(
> > +                name, info, ifcond,
> > +                'config', self._make_members(config_type, info))
> 
> Does QAPISchemaMember.describe() need an update for this?

Looks like it.

Kevin


