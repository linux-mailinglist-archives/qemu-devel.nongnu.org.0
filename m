Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD0285E2D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 13:33:39 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ7hS-0003Ti-BB
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 07:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQ7gZ-0002hD-4h
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQ7gW-0006zw-23
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602070358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0sn2SaJok58nsFSPBpnK6pYygl6mc/ZIc9wphyNXB0=;
 b=iQxexhzKkkODW1p1sZ5b2wptTPLD1S8HS6CQPBkcR5VSzAvM/GFrmBTyj0vcD+VxODeK2d
 Xqnvozwl7BrwHUh5hFSDZjVSA4E0KBKM40nev4qZSVS8v2yQxjy1UASgQxh/c8lycjXSAD
 9mETMVqPKwomw0qjIHyxpLUjgQqprPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-mwui8Xx-MDib_YSiHficLA-1; Wed, 07 Oct 2020 07:32:36 -0400
X-MC-Unique: mwui8Xx-MDib_YSiHficLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE89018A822F
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 11:32:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A97866EF5B;
 Wed,  7 Oct 2020 11:32:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3170711329C1; Wed,  7 Oct 2020 13:32:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 19/36] qapi/events.py: add type hint annotations
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-20-jsnow@redhat.com>
Date: Wed, 07 Oct 2020 13:32:34 +0200
In-Reply-To: <20201005195158.2348217-20-jsnow@redhat.com> (John Snow's message
 of "Mon, 5 Oct 2020 15:51:41 -0400")
Message-ID: <87zh4ye0fh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/events.py | 46 ++++++++++++++++++++++++++++++++----------
>  scripts/qapi/mypy.ini  |  5 -----
>  2 files changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index f840a62ed92..57e0939e963 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -12,19 +12,31 @@
>  See the COPYING file in the top-level directory.
>  """
>  
> +from typing import List
> +
>  from .common import c_enum_const, c_name, mcgen
>  from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> -from .schema import QAPISchemaEnumMember
> +from .schema import (
> +    QAPISchema,
> +    QAPISchemaEnumMember,
> +    QAPISchemaFeature,
> +    QAPISchemaObjectType,
> +)
> +from .source import QAPISourceInfo
>  from .types import gen_enum, gen_enum_lookup
>  
>  
> -def build_event_send_proto(name, arg_type, boxed):
> +def build_event_send_proto(name: str,
> +                           arg_type: QAPISchemaObjectType,
> +                           boxed: bool) -> str:
>      return 'void qapi_event_send_%(c_name)s(%(param)s)' % {
>          'c_name': c_name(name.lower()),
>          'param': build_params(arg_type, boxed)}
>  
>  
> -def gen_event_send_decl(name, arg_type, boxed):
> +def gen_event_send_decl(name: str,
> +                        arg_type: QAPISchemaObjectType,
> +                        boxed: bool) -> str:
>      return mcgen('''
>  
>  %(proto)s;
> @@ -33,7 +45,7 @@ def gen_event_send_decl(name, arg_type, boxed):
>  
>  
>  # Declare and initialize an object 'qapi' using parameters from build_params()
> -def gen_param_var(typ):
> +def gen_param_var(typ: QAPISchemaObjectType) -> str:
>      assert not typ.variants
>      ret = mcgen('''
>      %(c_name)s param = {
> @@ -61,7 +73,11 @@ def gen_param_var(typ):
>      return ret
>  
>  
> -def gen_event_send(name, arg_type, boxed, event_enum_name, event_emit):
> +def gen_event_send(name: str,
> +                   arg_type: QAPISchemaObjectType,
> +                   boxed: bool,
> +                   event_enum_name: str,
> +                   event_emit: str) -> str:
>      # FIXME: Our declaration of local variables (and of 'errp' in the
>      # parameter list) can collide with exploded members of the event's
>      # data type passed in as parameters.  If this collision ever hits in
> @@ -137,15 +153,15 @@ def gen_event_send(name, arg_type, boxed, event_enum_name, event_emit):
>  
>  class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
>  
> -    def __init__(self, prefix):
> +    def __init__(self, prefix: str):
>          super().__init__(
>              prefix, 'qapi-events',
>              ' * Schema-defined QAPI/QMP events', None, __doc__)
>          self._event_enum_name = c_name(prefix + 'QAPIEvent', protect=False)
> -        self._event_enum_members = []
> +        self._event_enum_members: List[QAPISchemaEnumMember] = []
>          self._event_emit_name = c_name(prefix + 'qapi_event_emit')
>  
> -    def _begin_user_module(self, name):
> +    def _begin_user_module(self, name: str) -> None:
>          events = self._module_basename('qapi-events', name)
>          types = self._module_basename('qapi-types', name)
>          visit = self._module_basename('qapi-visit', name)
> @@ -168,7 +184,7 @@ def _begin_user_module(self, name):
>  ''',
>                               types=types))
>  
> -    def visit_end(self):
> +    def visit_end(self) -> None:

Ignorant question: what's the difference between -> None (like here) and
nothing (like __init__() above?

>          self._add_system_module('emit', ' * QAPI Events emission')
>          self._genc.preamble_add(mcgen('''
>  #include "qemu/osdep.h"
[...]


