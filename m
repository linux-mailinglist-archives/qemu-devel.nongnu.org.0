Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91A628EE5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:06:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouirD-0004Wd-7R; Mon, 14 Nov 2022 18:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ouih5-00073t-Ls
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ouU72-0007Vj-DE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 02:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668411753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FhqynJVBrmZL+Rez8gTq/bSdvjFw3OOuVTJVpbq0oB0=;
 b=VEXmC0pIYM+eE/cofF2EKtukr/rEZqHA7KmGSHrZLM/OqjbBlBbsrRuHDW9h6UIj8r3IT5
 Nemb8RjkpGL2D8NBauly02j0hJWIqwp7iDEgkKRwCBIwvLPUiRi/KDSWiZ39p+M/cPIp2s
 u+yE3Qh+ymox4Xia14+iWpzLgzMKU+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-1hHk5E01MoO-So8UL3NkQQ-1; Mon, 14 Nov 2022 02:42:24 -0500
X-MC-Unique: 1hHk5E01MoO-So8UL3NkQQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE77385A5A6
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:42:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38EC492B12;
 Mon, 14 Nov 2022 07:42:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 935AA21E6921; Mon, 14 Nov 2022 08:42:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhenyu Zhang <zhenyzha@redhat.com>
Cc: qemu-devel@nongnu.org,  gshan@redhat.com,  imammedo@redhat.com
Subject: Re: [PATCH v4] qapi/qom: Memory backend property prealloc-threads
 doc fix
References: <20221114032431.195098-1-zhenyzha@redhat.com>
Date: Mon, 14 Nov 2022 08:42:20 +0100
In-Reply-To: <20221114032431.195098-1-zhenyzha@redhat.com> (Zhenyu Zhang's
 message of "Sun, 13 Nov 2022 22:24:31 -0500")
Message-ID: <87o7ta3rtv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Zhenyu Zhang <zhenyzha@redhat.com> writes:

> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> (v5.0.0) changed the default number of threads from number of CPUs
> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> "hostmem: default the amount of prealloc-threads to smp-cpus".
> Except the documentation remained unchanged.
>
> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
>
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>
> v4: Fix the line exceeding 80 characters limitation issue  (Gavin)
> v3: Covers historical descriptions                         (Markus)
> v2: The property is changed to smp-cpus since 5.0          (Phild)
>
> ---
>  qapi/qom.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 30e76653ad..f4a7917f3d 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -576,7 +576,8 @@
>  #
>  # @prealloc: if true, preallocate memory (default: false)
>  #
> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> +# @prealloc-threads: number of CPU threads to use for prealloc 

Could drop "CPU" while there.  Not worth a respin by itself, but perhaps
the maintainer can drop it for you.

> +#                    (default: number of CPUs) (since 5.0)
>  #
>  # @prealloc-context: thread context to use for creation of preallocation threads
>  #                    (default: none) (since 7.2)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


