Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE14DAF74
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:14:50 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSYC-0007JQ-Pp
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:14:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSUm-0005kr-N1
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSUl-0006p6-5x
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647432674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ib4O5r52L7naCS2jzko7yLp7xvShBCbPDwb7v32GP0=;
 b=CsDcvVsJj7aFjbuokQjO7xUb0Pm/DVescrqsMqjlYOLjOt9TwcPYbflF2MlPZ2BfPJVCS3
 CikEsU5ZNdOownSpteavvnYPQw9K1ygN4LUzP+Io1x7de8lO5Fy49xAg/c1ZS2P26y83fb
 2EpCYVAXBInwH5+aM8CjcseQgGFQruA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-w-6y6rdzMaqznbPr2PqzoA-1; Wed, 16 Mar 2022 08:11:11 -0400
X-MC-Unique: w-6y6rdzMaqznbPr2PqzoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE3F0811E7A;
 Wed, 16 Mar 2022 12:11:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA8BD404D8F4;
 Wed, 16 Mar 2022 12:11:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BAFF221E66C8; Wed, 16 Mar 2022 13:11:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 17/27] qapi: remove needless include
References: <20220316095413.2613764-1-marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 13:11:09 +0100
In-Reply-To: <20220316095413.2613764-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 16 Mar 2022 13:54:13 +0400")
Message-ID: <87y21a5c82.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  qapi/qmp-dispatch.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index d378bccac73b..0990873ec8ec 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -21,7 +21,6 @@
>  #include "qapi/qmp/qjson.h"
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qobject-output-visitor.h"
> -#include "sysemu/runstate.h"
>  #include "qapi/qmp/qbool.h"
>  #include "qemu/coroutine.h"
>  #include "qemu/main-loop.h"

I guess this was missed in commit 164dafd174 "remove preconfig state".

Reviewed-by: Markus Armbruster <armbru@redhat.com>


