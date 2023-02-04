Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46B68A9A5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 12:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOGfW-0000Ft-Tm; Sat, 04 Feb 2023 06:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOGfM-0000FG-Ky
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOGfG-0002Pa-Lz
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675509899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aRo9BUpn/FY0kMDKLkYY0GJxOYUzK1Zk/4Xk/QN6flY=;
 b=NflXqzdYLU3LXLvHzPOufFTiJwYvFkyMYaaKhmtIAOwgpbMu+i1sWSUFwhuDgvuHPZt0j0
 m0FmZ2hg5U5FseDYXiDJ8fOyVHCFLmMr9ecGN9SFN5+6RhaUU0jYq3JAoxgZYFCRtmtcqF
 Bn0gG2bFmvMxRryvnXVitz0FkNk5a1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-NjCNOeONOlybIEM_n4yGHA-1; Sat, 04 Feb 2023 06:24:55 -0500
X-MC-Unique: NjCNOeONOlybIEM_n4yGHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68FEB101A521;
 Sat,  4 Feb 2023 11:24:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E25B2026D37;
 Sat,  4 Feb 2023 11:24:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 150AE21E6A1F; Sat,  4 Feb 2023 12:24:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,  Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 3/4] qapi: Update flake8 config
References: <20230203184733.523522-1-jsnow@redhat.com>
 <20230203184733.523522-4-jsnow@redhat.com>
Date: Sat, 04 Feb 2023 12:24:54 +0100
In-Reply-To: <20230203184733.523522-4-jsnow@redhat.com> (John Snow's message
 of "Fri, 3 Feb 2023 13:47:32 -0500")
Message-ID: <87sffl7jw9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=armbru@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 TO_EQ_FM_DOM_SPF_FAIL=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> New versions of flake8 don't like same-line comments. (It's a version
> newer than what fc37 ships, but it still makes my life easier to fix it
> now.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/.flake8 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/.flake8 b/scripts/qapi/.flake8
> index 6b158c68b84..a873ff67309 100644
> --- a/scripts/qapi/.flake8
> +++ b/scripts/qapi/.flake8
> @@ -1,2 +1,3 @@
>  [flake8]
> -extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
> +# Prefer pylint's bare-except checks to flake8's
> +extend-ignore = E722

Reviewed-by: Markus Armbruster <armbru@redhat.com>


