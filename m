Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA995A7C66
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 13:47:08 +0200 (CEST)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTMBW-0005mg-4H
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 07:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTM5b-0001GZ-K8
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTM5Z-0004Ii-Jg
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661946055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFJ0mI8oI8vi/19kcAGdws9rJuIa5l9g3JAJ9cyf2dg=;
 b=Qy3VJXEYK3bTqo6UGarvZ6XtFRVsish9jcyVbtaZwu+EjaUqwppuO1vegKNFW+M6zR6Bzs
 Mx5PF3bLlSmlxIW3weuAmMqRnJnrD7q0ui2VFQw2Hpl99ccX467LOqNuTvaqq5wkS6njIa
 JDtVP5+d5tXY4e2EvsAhtjOgKRrjETs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-6ErxAoTuPfyAb_BkjU5-zw-1; Wed, 31 Aug 2022 07:40:52 -0400
X-MC-Unique: 6ErxAoTuPfyAb_BkjU5-zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA2A85A589;
 Wed, 31 Aug 2022 11:40:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D49432026D4C;
 Wed, 31 Aug 2022 11:40:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCBB921E6900; Wed, 31 Aug 2022 13:40:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
Date: Wed, 31 Aug 2022 13:40:50 +0200
In-Reply-To: <20220830161545.84198-13-victortoso@redhat.com> (Victor Toso's
 message of "Tue, 30 Aug 2022 18:15:41 +0200")
Message-ID: <87zgfkabel.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> The example output is setting optional member "backing" with null.
> This has no runtime impact. Remove it.
>
> Problem was noticed when using the example as a test case for Go
> bindings.

"Fix example" and "problem" implies there's something wrong.  "No
runtime impact" sounds like it's redundant, but not wrong.  Wrong or not
wrong?

> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index dcc6d41494..302164d575 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1542,9 +1542,7 @@
>  #      "arguments": { "driver": "qcow2",
>  #                     "node-name": "node1534",
>  #                     "data-file": { "driver": "file",
> -#                                    "filename": "hd1.qcow2" },
> -#                     "backing": null } }
> -#
> +#                                    "filename": "hd1.qcow2" } } }
>  # <- { "return": {} }
>  #
>  # -> { "execute": "blockdev-snapshot",


