Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D4409C78
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:44:45 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPqwe-0007gL-SW
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPqrA-0002Jw-It
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPqr7-00021W-72
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631558339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QfkwP/ehtJMZxpIu0k74y7/IQAqo3eEoEpKU/g+9Chc=;
 b=E7yHHg8i1dPj2qsoBQSkn8unRClv5PfKqzF2/tdZJ0kLdIjBh3FeXovq/hJCCNGESWiCXf
 JzAV/4CIeszEPVqS0GhTpkaD1Ck1LOBNeK3oxfK+SIhMSwy+JYiJ6QikojXlKYVkzb1SR4
 EHUmFwOso5TsLZRy8zmHoyiFiwatBEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-qVN0jeQTNOqjbH4r9xl6bQ-1; Mon, 13 Sep 2021 14:38:57 -0400
X-MC-Unique: qVN0jeQTNOqjbH4r9xl6bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE3D362FB
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 18:38:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC35C5D9D3;
 Mon, 13 Sep 2021 18:38:51 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:38:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 21/22] qapi: Drop simple unions
Message-ID: <20210913183850.6sfxrf7cvqrgvqm5@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-22-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-22-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:31PM +0200, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
> 
> The previous commits eliminated simple union from the tree.  Now drop
> them from the QAPI schema language entirely, and update mentions of
> "flat union" to just "union".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst                  | 125 ++++--------------
>  scripts/qapi/expr.py                          |  21 +--
>  scripts/qapi/schema.py                        | 101 +++-----------
>  .../qapi-schema/flat-union-array-branch.json  |   2 +-
>  tests/qapi-schema/flat-union-empty.json       |   2 +-
>  tests/qapi-schema/flat-union-int-branch.json  |   2 +-
>  tests/qapi-schema/flat-union-no-base.err      |   2 +-
>  tests/qapi-schema/flat-union-no-base.json     |   2 +-
>  tests/qapi-schema/qapi-schema-test.json       |   2 +-
>  tests/qapi-schema/reserved-member-u.json      |   2 +-
>  tests/qapi-schema/union-base-empty.json       |   2 +-
>  .../union-base-no-discriminator.err           |   2 +-
>  .../union-base-no-discriminator.json          |   2 +-
>  13 files changed, 62 insertions(+), 205 deletions(-)

Whee!  What a fun ride!

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


