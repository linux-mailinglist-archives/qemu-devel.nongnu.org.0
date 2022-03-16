Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD74DAFC5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:29:27 +0100 (CET)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSmM-0004O0-Hc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:29:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSb8-0002dW-JI
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSb7-00082c-49
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofwRyCFrWbt4IOv8wfJKNEnrEFQfkgsPCijTdfk5rwo=;
 b=diTz7UYV2pvKlI0DnZRBP1ArPJpaJVS0Ba7M5mUwMlnakxTvaS2H5bCdOUMOmLACX9lBHh
 Nzje90jEkV0Q7OZsVtU6KrZUPcy+cxhWrr7N6XRLfIUOC9sEDzw0vBKiEzHpjQrexG9dGw
 TJQjTm0go0T8U45aTW93zKBlNl1styU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-smcWOiVfPpWV8urRcU8p1Q-1; Wed, 16 Mar 2022 08:17:46 -0400
X-MC-Unique: smcWOiVfPpWV8urRcU8p1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F61800960
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:17:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C60C33260;
 Wed, 16 Mar 2022 12:17:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D02ED21E6821; Wed, 16 Mar 2022 13:17:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 23/27] tests: remove needless include
References: <20220316095443.2613845-1-marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 13:17:44 +0100
In-Reply-To: <20220316095443.2613845-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 16 Mar 2022 13:54:43 +0400")
Message-ID: <87mthq5bx3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/check-qobject.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
> index c1713d15af4e..c3d50e99949a 100644
> --- a/tests/unit/check-qobject.c
> +++ b/tests/unit/check-qobject.c
> @@ -8,7 +8,6 @@
>   */
> =20
>  #include "qemu/osdep.h"
> -#include "block/qdict.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qbool.h"
>  #include "qapi/qmp/qdict.h"

Missed in commit da668aa15b "tests: Move unit tests into a separate
directory".

Reviewed-by: Markus Armbruster <armbru@redhat.com>


