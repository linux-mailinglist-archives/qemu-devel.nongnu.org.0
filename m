Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1434E7399
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:36:43 +0100 (CET)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjBJ-0000kv-Rc
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:36:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXj8i-0007GR-GV
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:34:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXj8e-0001fG-7M
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648211634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MLsXEGXToUU5yAA1XvjLf1hsVODqJ8rgc5NVb1vwHgg=;
 b=hO9U77MQN8+7peAgcJcF6kq2ylN1E7ItPKh9Phyb1PSyJVOAa8YsUXjamWRhpFvJIdvhAr
 Of9HR0JcAkMPBqcvxB0cXF742vyDTHoVFdBLAOCrSJvmnwlk3R3OVjco0Ffa+OUCJRpkA7
 BwOxXTCu7+JVuQ64g8qtJKByiipqLnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-VYKIUlq7Nk6o2x2SRxqsHQ-1; Fri, 25 Mar 2022 08:33:51 -0400
X-MC-Unique: VYKIUlq7Nk6o2x2SRxqsHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 182BB85A5A8
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:33:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82094010E5D;
 Fri, 25 Mar 2022 12:33:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A129D21E6742; Fri, 25 Mar 2022 13:33:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com>
Date: Fri, 25 Mar 2022 13:33:49 +0100
In-Reply-To: <20220324175015.232794-2-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 24 Mar 2022 18:50:02 +0100")
Message-ID: <87tubmnrde.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> @hide and @soft are potential additions which fits the TODO section
> perfectly.
>
> The main motivation is to avoid this whole block of comment entering
> the wrong section in the python parser.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-export.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f183522d0d..1e34927f85 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -219,13 +219,13 @@
>  #
>  # @hard: Drop all connections immediately and remove export.
>  #
> -# Potential additional modes to be added in the future:
> +# TODO: Potential additional modes to be added in the future:
>  #
> -# hide: Just hide export from new clients, leave existing connections as is.
> -# Remove export after all clients are disconnected.
> +#       hide: Just hide export from new clients, leave existing connections as is.
> +#       Remove export after all clients are disconnected.
>  #
> -# soft: Hide export from new clients, answer with ESHUTDOWN for all further
> -# requests from existing clients.
> +#       soft: Hide export from new clients, answer with ESHUTDOWN for all further
> +#       requests from existing clients.
>  #
>  # Since: 2.12
>  ##

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Doc comments embed user documentation in the source code.  The doc
generator extracts it.

TODOs are generally for developers.  Should the doc generator suppress
TODO sections?


