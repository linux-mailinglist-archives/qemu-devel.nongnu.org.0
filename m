Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23720447AB6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:09:32 +0100 (CET)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjymY-0001On-Pu
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjykS-0008JG-HF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjykD-0002Aq-0a
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636355223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkP3IcVtugb3p8fda3LjhupBehOJeJQmbG/C7MOHA3g=;
 b=excyDDkCwX9pOWR2oj5SDgbn5rSWFSHyWjQ7Qs9bzFOTEdwqt8RaZz+tppgmACEohQHlQp
 9rOTk7yXhoB5yfdSry622PVOTOZhy88BleD/DEGQqAqOTK902/rRWGxeNuM1WCsx6B+Zi9
 InrldBniQASTtHj7PH1lpqshR+eZLTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-4ObUptunMOqzqkVOVxgP7g-1; Mon, 08 Nov 2021 02:07:01 -0500
X-MC-Unique: 4ObUptunMOqzqkVOVxgP7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9105887D541;
 Mon,  8 Nov 2021 07:07:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E4F67846;
 Mon,  8 Nov 2021 07:07:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E067911380A7; Mon,  8 Nov 2021 08:06:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH] docs: fix 'sample-pages' option tag
References: <d212ac87ad45dcdd5d3ed85c61fc1fab765aed7e.1636353909.git.huangy81@chinatelecom.cn>
Date: Mon, 08 Nov 2021 08:06:58 +0100
In-Reply-To: <d212ac87ad45dcdd5d3ed85c61fc1fab765aed7e.1636353909.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 8 Nov 2021 14:51:00 +0800")
Message-ID: <87r1brnn1p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> commit f78d4ed701 has fixed qemu tag, making 'sample-pages' option tag
> involved by accident, which introduced since 6.1 in commit 7afa08cd8fd.
> revert this line.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  qapi/migration.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index f0aefda..bbfd48c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1796,7 +1796,7 @@
>  # @calc-time: time in units of second for sample dirty pages
>  #
>  # @sample-pages: page count per GB for sample dirty pages
> -#                the default value is 512 (since 6.2)
> +#                the default value is 512 (since 6.1)
>  #
>  # @mode: mode containing method of calculate dirtyrate includes
>  #        'page-sampling' and 'dirty-ring' (Since 6.2)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


