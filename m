Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CB4E73BD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:49:53 +0100 (CET)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjO4-0007Ri-5O
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:49:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjN2-0006di-7z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjMy-0003rx-V4
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648212523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SWBRHeo1yIczrFIakNYrDwnsn0Aq9VloHGpk2OXThrE=;
 b=TmurBI2SjnN6aaFaQ9mYpYwT+IPKEi6hP6V2TAKBeiQ5SOMp8r2g9pFOuxPFNN3NPHieFv
 Z1bNmElbpyAyB9rBS7Gjabdj0mTvVN4XjzfwdXVm5RUr0kcrjxg4r+jJekT3L5IfRF+Q2+
 KlS6xmG+URK2EYsYdNjz4H6K5+e/V5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-soFJRTSyPNu7FYFriuXl9g-1; Fri, 25 Mar 2022 08:48:42 -0400
X-MC-Unique: soFJRTSyPNu7FYFriuXl9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F099185A79C
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2886C1400C2B;
 Fri, 25 Mar 2022 12:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 078CD21E6821; Fri, 25 Mar 2022 13:48:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH 04/14] qapi: fix example of BLOCK_JOB_PENDING event
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-5-victortoso@redhat.com>
Date: Fri, 25 Mar 2022 13:48:40 +0100
In-Reply-To: <20220324175015.232794-5-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 24 Mar 2022 18:50:05 +0100")
Message-ID: <87k0cinqon.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> * Event's name: BLOCK_JOB_WAITING -> BLOCK_JOB_PENDING
> * Argument device -> id
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 5b6c069dd9..ea96e1b009 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5226,8 +5226,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "BLOCK_JOB_WAITING",
> -#      "data": { "device": "drive0", "type": "mirror" },
> +# <- { "event": "BLOCK_JOB_PENDING",
> +#      "data": { "type": "mirror", "id": "backup_1" },
>  #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##

Reviewed-by: Markus Armbruster <armbru@redhat.com>


