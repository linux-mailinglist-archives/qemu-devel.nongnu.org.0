Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26A51BDBB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:08:42 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZLd-0006RS-6P
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZC4-00088z-Gi
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:58:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmZC2-0005pa-L7
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651748325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3YfclXsSkrb0R/snIlF2eBOjvXjqObbYX3KXk+bXOo=;
 b=JRyRkIbaeyhEkcR8E61HL8zEiZTByGmVerrpShU7pGXF5s6tvUxzoWMLwoYdBNltuT9rHa
 fXOp072xykRMWanxWQOK7RS0t0k5cAN2fHj4WE4itog4c+5IYO4njJ9E1eXQBjVXCb8PGg
 GPhbcBeYVjvkTPELRuk35kscUNIO3cA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-8EN94CAANrClvy1IxuzwZw-1; Thu, 05 May 2022 06:58:41 -0400
X-MC-Unique: 8EN94CAANrClvy1IxuzwZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13EB885A5BC;
 Thu,  5 May 2022 10:58:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C291240CF8E7;
 Thu,  5 May 2022 10:58:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3C8621E6880; Thu,  5 May 2022 12:58:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Alexander Bulekov <alxndr@bu.edu>,  Bandan Das
 <bsd@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Kevin Wolf <kwolf@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  Laurent Vivier <lvivier@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Qiuhao
 Li <Qiuhao.Li@outlook.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 04/15] include: adjust header guards after renaming
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-5-marcandre.lureau@redhat.com>
Date: Thu, 05 May 2022 12:58:39 +0200
In-Reply-To: <20220505081431.934739-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 5 May 2022 12:14:20 +0400")
Message-ID: <871qx8xn34.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Pointing to commit 49f9522193 "include: rename qemu-common.h
qemu/help-texts.h" wouldn't hurt.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/qemu/help-texts.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
> index ba32cc8b1f39..4f265fed8df1 100644
> --- a/include/qemu/help-texts.h
> +++ b/include/qemu/help-texts.h
> @@ -1,5 +1,5 @@
> -#ifndef QEMU_COMMON_H
> -#define QEMU_COMMON_H
> +#ifndef QEMU_HELP_TEXTS_H
> +#define QEMU_HELP_TEXTS_H
>=20=20
>  /* Copyright string for -version arguments, About dialogs, etc */
>  #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Time for a re-run of scripts/clean-header-guards.pl.


