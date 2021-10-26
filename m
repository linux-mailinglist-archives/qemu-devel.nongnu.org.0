Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7743AE27
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:34:23 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHuY-0006Bk-DO
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mfHcx-0007td-TE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mfHcq-0008CQ-8U
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635236161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipWBiYX9W2Ot0/e2U3D5ZkNHW+DIa/0njtmkSp4/1sc=;
 b=hISQcI6pIRqTfnrugfpf8UvbzfTWL4dIWMaiEbBxV3UAo8mrA2iGPeMaUUPzjcSg4hZ3Cp
 JG4XSJzaTvC0hUnwawvVwOTvTdLEzc7kxPFZIfEOVLPGdkJpK4wnfvHhU4ctN4IZ75TtTp
 6gA224ArcqGDFFMMSv/bbAxjEUWYooI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-sByJhKTuNp-FSf3jMcK1OA-1; Tue, 26 Oct 2021 04:15:56 -0400
X-MC-Unique: sByJhKTuNp-FSf3jMcK1OA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87BB78018AC;
 Tue, 26 Oct 2021 08:15:55 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1126100751A;
 Tue, 26 Oct 2021 08:15:00 +0000 (UTC)
Date: Tue, 26 Oct 2021 10:14:58 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXe5Ap8tcBcqXvzR@paraplu>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXadbMF3lj5I4+Cd@paraplu> <87v91k6yul.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v91k6yul.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 libguestfs@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 09:15:30AM +0200, Markus Armbruster wrote:
> Kashyap Chamarthy <kchamart@redhat.com> writes:
> 
> > On Mon, Oct 25, 2021 at 07:25:24AM +0200, Markus Armbruster wrote:

[...]

> > Looks like there's another stable property with an "x-" prefix:
> > "x-remote-object", part of QOM type @RemoteObjectProperties.
> 
> The union branch 'x-remote-object' isn't flagged 'unstable' (because
> union branches can't have feature flags), but the enumeration value
> 'x-remote-object' is.  Sufficient, because you can't use the branch
> without using the enumeration value.  Admittedly subtle.

Ah, thanks for the explanation.  I missed the union branch part, which
I now notice in your "[PATCH 2/9] qapi: Mark unstable QMP parts
with feature 'unstable'".

> I wrote a bit of code (appended) to make sure I don't miss names.

Thanks; looks good to me.

> > Given the above "x-" properties are now stable, I take it that they
> > cannot be renamed now, as they might break any tools using them?  My
> > guess is the tedious way is not worth it: deprecate them, and add the
> > non-x variants as "synonyms".  
> 
> "x-use-canonical-path-for-ramblock-id" goes back to commit fa0cb34d22
> "hostmem: use object id for memory region name with >= 4.0" (v4.0).  It
> may have been intended to be internal back then.  It wasn't anymore when
> commit 8db0b20415 "machine: add missing doc for memory-backend option"
> (v6.0) documented it:
> 
>     And document that x-use-canonical-path-for-ramblock-id,
>     is considered to be stable to make sure it won't go away by accident.
>     
>     x- was intended for unstable/iternal properties, and not supposed to
>     be stable option. However it's too late to rename (drop x-)
>     it as it would mean that users will have to mantain both
>     x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
>     and prefix-less for later versions.
> 
> Igor's reasoning still applies.
> 
> "x-origin" has always been stable.  Same argument.

Yep, fair enough.

[...]
 
> commit 415b71a9f6e5bc37e84895d2e767cf4cfacd279b (HEAD)
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Sat Oct 9 09:01:21 2021 +0200
> 
>     qapi: Find x- without feature unstable DBG
> 
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index b7b3fc0ce4..f2af1d7eea 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -14,6 +14,8 @@
>  
>  # TODO catching name collisions in generated code would be nice
>  
> +import sys
> +
>  from collections import OrderedDict
>  import os
>  import re
> @@ -118,6 +120,11 @@ def describe(self):
>          return "%s '%s'" % (self.meta, self.name)
>  
>  
> +def check_have_feature_unstable(name, info, features):
> +    if name.startswith('x-') and 'unstable' not in (f.name for f in features):
> +        print(QAPISemError(info, f"XXX %{name} %{features}"), file=sys.stderr)
> +
> +
>  class QAPISchemaVisitor:
>      def visit_begin(self, schema):
>          pass
> @@ -718,6 +725,7 @@ def __init__(self, name, info, ifcond=None, features=None):
>          self.features = features or []
>  
>      def connect_doc(self, doc):
> +        check_have_feature_unstable(self.name, self.info, self.features)
>          super().connect_doc(doc)
>          if doc:
>              for f in self.features:
> @@ -745,6 +753,7 @@ def __init__(self, name, info, typ, optional, ifcond=None, features=None):
>          self.features = features or []
>  
>      def check(self, schema):
> +        check_have_feature_unstable(self.name, self.info, self.features)
>          assert self.defined_in
>          self.type = schema.resolve_type(self._type_name, self.info,
>                                          self.describe)
> @@ -789,6 +798,7 @@ def __init__(self, name, info, doc, ifcond, features,
>  
>      def check(self, schema):
>          super().check(schema)
> +        check_have_feature_unstable(self.name, self.info, self.features)
>          if self._arg_type_name:
>              self.arg_type = schema.resolve_type(
>                  self._arg_type_name, self.info, "command's 'data'")
> @@ -844,6 +854,7 @@ def __init__(self, name, info, doc, ifcond, features, arg_type, boxed):
>  
>      def check(self, schema):
>          super().check(schema)
> +        check_have_feature_unstable(self.name, self.info, self.features)
>          if self._arg_type_name:
>              self.arg_type = schema.resolve_type(
>                  self._arg_type_name, self.info, "event's 'data'")

TIL: the error class QAPISemError() 

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

-- 
/kashyap


