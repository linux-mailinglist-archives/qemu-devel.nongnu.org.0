Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B734DAFF9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:43:25 +0100 (CET)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSzr-0003XI-2F
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:43:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSdM-0005bP-9g
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSdK-00007p-1Q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYNJ6lc2dxqaJ3JE+Qlbb/oAp7y8fgHC0e1y5V03kW8=;
 b=Ysnez7/limvK/J0P8EuoSYpqndPiU7MnVa1ZijbZL2xpn23dUwMPEJVmt5y7f1H+grV8xH
 LFANBwuKTpMDBVuIX1BWA47QT3UziJB6L65hD/WgwlIuOwM7FFDga/4RXo29EE1N1mfNnZ
 YNce809+NmC9tF3d14BbsH+MmpEaO2U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-atg0REJ4POaZunCgh6HvIQ-1; Wed, 16 Mar 2022 08:20:02 -0400
X-MC-Unique: atg0REJ4POaZunCgh6HvIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6136802A6A;
 Wed, 16 Mar 2022 12:20:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B6121400AFC;
 Wed, 16 Mar 2022 12:20:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 424EE21E66CE; Wed, 16 Mar 2022 13:20:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 27/27] qapi: remove needless include
References: <20220316095523.2613907-1-marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 13:20:00 +0100
In-Reply-To: <20220316095523.2613907-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 16 Mar 2022 13:55:23 +0400")
Message-ID: <87ilse5btb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/qapi-forward-visitor.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
> index 4ea7e0bec3f5..e36d9bc9ba7e 100644
> --- a/qapi/qapi-forward-visitor.c
> +++ b/qapi/qapi-forward-visitor.c
> @@ -23,7 +23,6 @@
>  #include "qapi/qmp/qnum.h"
>  #include "qapi/qmp/qstring.h"
>  #include "qemu/cutils.h"
> -#include "qemu/option.h"
> =20
>  struct ForwardFieldVisitor {
>      Visitor visitor;

Reviewed-by: Markus Armbruster <armbru@redhat.com>


