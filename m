Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC3416545
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:36:43 +0200 (CEST)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTaN-0008QE-2R
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTTXY-0006CD-IB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTTXV-0000zn-TI
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632422023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fAlMgdL0Vw9nInX5uCMlq/RBcOQVLep+BVDfrSZZx/E=;
 b=TeeUmwNIPqqvUOK3GaF/Kxz9YgZOIwtTeS6aPyygcSr86p//2NZNW3H7NxseLxmuQDAurW
 bL8BfySjZNBsWDCzEROj/rSHaX0Ae+JMKVUALPQ6ppZbZp0Fai6vV/d2SAbZr+W5Xctn9u
 nMhQ/GEqVvHYTxGFnNrzYTNicHWOnss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-JQqOOqkIOi2pd7-sPvySNA-1; Thu, 23 Sep 2021 14:33:42 -0400
X-MC-Unique: JQqOOqkIOi2pd7-sPvySNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E075074C;
 Thu, 23 Sep 2021 18:33:40 +0000 (UTC)
Received: from localhost (unknown [10.22.8.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9229153E08;
 Thu, 23 Sep 2021 18:33:00 +0000 (UTC)
Date: Thu, 23 Sep 2021 14:32:59 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/2] docs: remove non-reference uses of single backticks
Message-ID: <20210923183259.pbfbmrq3fnlxukr4@habkost.net>
References: <20210923182204.4187601-1-jsnow@redhat.com>
 <20210923182204.4187601-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923182204.4187601-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Juan Quintela <quintela@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 02:22:03PM -0400, John Snow wrote:
> The single backtick markup in ReST is the "default role". Currently,
> Sphinx's default role is called "content". Sphinx suggests you can use
> the "Any" role instead to turn any single-backtick enclosed item into a
> cross-reference.
> 
> This is useful for things like autodoc for Python docstrings, where it's
> often nicer to reference other types with `foo` instead of the more
> laborious :py:meth:`foo`. It's also useful in multi-domain cases to
> easily reference definitions from other Sphinx domains, such as
> referencing C code definitions from outside of kerneldoc comments.
> 
> Before we do that, though, we'll need to turn all existing usages of the
> "content" role to inline verbatim markup wherever it does not correctly
> resolve into a cross-refernece by using double backticks instead.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Clear demonstration of the usefulness of patch 2/2 (these
occurrences of `foo` wouldn't have been added if the default role
was "any" because "any" errors out on invalid references).

However, it looks like there are unrelated changes:

[...]
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 24012534827..6b1230f2d7f 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -403,8 +403,8 @@ version_id.  And the function ``load_state_old()`` (if present) is able to
>  load state from minimum_version_id_old to minimum_version_id.  This
>  function is deprecated and will be removed when no more users are left.
>  
> -There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
> -e.g.
> +There are *_V* forms of many ``VMSTATE_`` macros to load fields for
> +version dependent fields, e.g.

Unrelated?  Line wrapping change only.

>  
>  .. code:: c
>  
> @@ -819,9 +819,9 @@ Postcopy now works with hugetlbfs backed memory:
>  Postcopy with shared memory
>  ---------------------------
>  
> -Postcopy migration with shared memory needs explicit support from the other
> -processes that share memory and from QEMU. There are restrictions on the type of
> -memory that userfault can support shared.
> +Postcopy migration with shared memory needs explicit support from the
> +other processes that share memory and from QEMU. There are restrictions
> +on the type of memory that userfault can support shared.

Unrelated?  Line wrapping change only.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>  # if unrelated line wrapping changes are dropped

-- 
Eduardo


