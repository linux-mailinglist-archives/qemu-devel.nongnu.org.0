Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17834F7586
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 07:55:15 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncL6w-0006OD-Hs
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 01:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL1I-0004pY-6e
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL1G-0008At-0E
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649310560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5JC083tSJB59fD3/6nT5ZoHeS5t16u7hhWsXytmeO0=;
 b=SOyXsJ0McpbrMTxO67QsrNFvwhFMMJVeU+ZQIEh5Lv1gkeYH4jXMyoJFjSOrBoZFbIu94m
 W3pUZw5tPysWJTYfpxFtTWM5wKP+I4CN4r2PhS5de5MA/uDwXvxJ0HlC3AB+z4FbWxa58J
 one4eri0SURbf8UzqVhThz0yvE+nuWI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-QDVv1M0yM1STSpG8oIDjPw-1; Thu, 07 Apr 2022 01:49:19 -0400
X-MC-Unique: QDVv1M0yM1STSpG8oIDjPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90BB21C0172B
 for <qemu-devel@nongnu.org>; Thu,  7 Apr 2022 05:49:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7B9416364;
 Thu,  7 Apr 2022 05:49:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 464EE21E6A21; Thu,  7 Apr 2022 07:49:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 14/32] util: rename qemu-error.c to match its header name
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-15-marcandre.lureau@redhat.com>
Date: Thu, 07 Apr 2022 07:49:16 +0200
In-Reply-To: <20220323155743.1585078-15-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:25 +0400")
Message-ID: <874k35l9yb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> The header name is more appropriate.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/{qemu-error.c =3D> error-report.c} | 0
>  util/meson.build                      | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename util/{qemu-error.c =3D> error-report.c} (100%)
>
> diff --git a/util/qemu-error.c b/util/error-report.c
> similarity index 100%
> rename from util/qemu-error.c
> rename to util/error-report.c
> diff --git a/util/meson.build b/util/meson.build
> index 2d71ab57a42e..82eec004e223 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -28,7 +28,7 @@ util_ss.add(files('host-utils.c'))
>  util_ss.add(files('bitmap.c', 'bitops.c'))
>  util_ss.add(files('fifo8.c'))
>  util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
> -util_ss.add(files('error.c', 'qemu-error.c'))
> +util_ss.add(files('error.c', 'error-report.c'))
>  util_ss.add(files('qemu-print.c'))
>  util_ss.add(files('id.c'))
>  util_ss.add(files('qemu-config.c', 'notify.c'))

Unfortunate file names can be annoying.  Dealing with renames in git
history is also annoying.  Which one's the lesser annoyance?


